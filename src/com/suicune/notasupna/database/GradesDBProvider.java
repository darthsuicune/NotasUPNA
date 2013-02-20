package com.suicune.notasupna.database;

import android.content.ContentProvider;
import android.content.ContentResolver;
import android.content.ContentUris;
import android.content.ContentValues;
import android.content.UriMatcher;
import android.database.Cursor;
import android.database.SQLException;
import android.database.sqlite.SQLiteQueryBuilder;
import android.net.Uri;

/*
 * A content provider is an easy way of managing data in Android. Allows full abstraction of database implementations.
 * We could use here any internal method for storing the data in any way (files, databases, options, external storage) and it will be transparent for the rest of the app.
 * Provides insert, query, delete and update methods for the abstraction.
 * 
 * It also allows use of the database from outside apps when using the right permissions
 * At this moment, this app doesn't have that permissions defined so no app should be able of checking the database.
 * 
 * We are using a SQLite Database so we will need to convert the content provider querys to database querys.
 */
public class GradesDBProvider extends ContentProvider {
	/*
	 * Constant definitions for access to the database
	 */
	private static final String CONTENT_NAME = "com.suicune.notasupna.GradesDBProvider";

	// Constant definitions for the different accesses to the database.
	private static final int ALL = 1;
	private static final int GRADE = 2;
	private static final int GRADE_ID = 3;
	private static final int SUBJECT = 4;
	private static final int SUBJECT_ID = 5;
	private static final int COURSE = 6;
	private static final int COURSE_ID = 7;
	private static final int STUDENT = 8;
	private static final int STUDENT_ID = 9;

	// An UriMatcher will allow the content provider to know what is the
	// application asking for.
	private static final UriMatcher uriMatcher;
	static {
		uriMatcher = new UriMatcher(UriMatcher.NO_MATCH);
		uriMatcher.addURI(CONTENT_NAME, "all", ALL);
		uriMatcher.addURI(CONTENT_NAME, GradesContract.GradesTable.TABLE_NAME,
				GRADE);
		uriMatcher.addURI(CONTENT_NAME, GradesContract.GradesTable.TABLE_NAME
				+ "/#", GRADE_ID);
		uriMatcher.addURI(CONTENT_NAME,
				GradesContract.SubjectsTable.TABLE_NAME, SUBJECT);
		uriMatcher.addURI(CONTENT_NAME, GradesContract.SubjectsTable.TABLE_NAME
				+ "/#", SUBJECT_ID);
		uriMatcher.addURI(CONTENT_NAME, GradesContract.CoursesTable.TABLE_NAME,
				COURSE);
		uriMatcher.addURI(CONTENT_NAME, GradesContract.CoursesTable.TABLE_NAME
				+ "/#", COURSE_ID);
		uriMatcher.addURI(CONTENT_NAME,
				GradesContract.StudentsTable.TABLE_NAME, STUDENT);
		uriMatcher.addURI(CONTENT_NAME, GradesContract.StudentsTable.TABLE_NAME
				+ "/#", STUDENT_ID);
	}

	GradesDBHelper dbHelper;

	// Upon creation we just set the provider database to use.
	@Override
	public boolean onCreate() {
		dbHelper = new GradesDBHelper(getContext());
		return dbHelper != null;
	}

	/*
	 * Mandatory method for returning what type of resource we are returning.
	 * 
	 * @params
	 * 
	 * @param uri - The uri to retrieve the type
	 * 
	 * @returns String - Matching type for the uri string.
	 */
	@Override
	public String getType(Uri uri) {
		switch (uriMatcher.match(uri)) {
		case ALL:
			return ContentResolver.CURSOR_DIR_BASE_TYPE + CONTENT_NAME + ".all";
		case GRADE:
			return ContentResolver.CURSOR_DIR_BASE_TYPE + CONTENT_NAME + "."
					+ GradesContract.GradesTable.TABLE_NAME;
		case GRADE_ID:
			return ContentResolver.CURSOR_ITEM_BASE_TYPE + CONTENT_NAME + "."
					+ GradesContract.GradesTable.TABLE_NAME;
		case SUBJECT:
			return ContentResolver.CURSOR_DIR_BASE_TYPE + CONTENT_NAME + "."
					+ GradesContract.SubjectsTable.TABLE_NAME;
		case SUBJECT_ID:
			return ContentResolver.CURSOR_ITEM_BASE_TYPE + CONTENT_NAME + "."
					+ GradesContract.SubjectsTable.TABLE_NAME;
		case COURSE:
			return ContentResolver.CURSOR_DIR_BASE_TYPE + CONTENT_NAME + "."
					+ GradesContract.CoursesTable.TABLE_NAME;
		case COURSE_ID:
			return ContentResolver.CURSOR_ITEM_BASE_TYPE + CONTENT_NAME + "."
					+ GradesContract.CoursesTable.TABLE_NAME;
		case STUDENT:
			return ContentResolver.CURSOR_DIR_BASE_TYPE + CONTENT_NAME + "."
					+ GradesContract.StudentsTable.TABLE_NAME;
		case STUDENT_ID:
			return ContentResolver.CURSOR_ITEM_BASE_TYPE + CONTENT_NAME + "."
					+ GradesContract.StudentsTable.TABLE_NAME;
		default:
			throw new IllegalArgumentException("Unsupported URI: " + uri);
		}
	}

	/*
	 * The insert method receives the public Uri where the app wants to insert
	 * the values passed. We will check the Uri with the uri matcher and act in
	 * consequence
	 * 
	 * After that, we will notify changes to any possible item that is awaiting
	 * to changes in the database (as for example a UI list)
	 * 
	 * @params
	 * 
	 * @param uri - Uri to insert the data in
	 * 
	 * @param values - Values to be inserted
	 * 
	 * @return Uri - Returns the uri of the inserted value.
	 */
	@Override
	public Uri insert(Uri uri, ContentValues values) {
		String table = "";
		switch (uriMatcher.match(uri)) {
		case GRADE:
		case GRADE_ID:
			table = GradesContract.GradesTable.TABLE_NAME;
			break;
		case SUBJECT:
		case SUBJECT_ID:
			table = GradesContract.SubjectsTable.TABLE_NAME;
			break;
		case COURSE:
		case COURSE_ID:
			table = GradesContract.CoursesTable.TABLE_NAME;
			break;
		case STUDENT:
		case STUDENT_ID:
			table = GradesContract.StudentsTable.TABLE_NAME;
			break;
		default:
			throw new SQLException("Failed to insert row into " + uri);
		}
		long rowID = dbHelper.getWritableDatabase().insert(table, null, values);
		if (rowID > 0) {
			Uri _uri = ContentUris.withAppendedId(uri, rowID);
			getContext().getContentResolver().notifyChange(uri, null);
			getContext().getContentResolver().notifyChange(_uri, null);
			return _uri;
		}

		return null;
	}

	/*
	 * The query of the content provider allows for returning the information
	 * the app has asked for. This part is a bit more complex. We need to create
	 * and return a cursor with the information we're gathering from our source.
	 * 
	 * As we are working with a SQLite database, we will be querying the
	 * database with a SQLite Query Builder for this matter.
	 * 
	 * @params
	 * 
	 * @param uri - the uri to process the query.
	 * 
	 * @param projection - The fields we are retrieving.
	 * 
	 * @param selection - where clause for the query. Any ? will be matched with
	 * the matching selectionArgs argument
	 * 
	 * @param selectionArgs - arguments to match the ? inserted in selection
	 * 
	 * @param sortOrder - The sort order in which to retrieve the data
	 * 
	 * @return Cursor - Cursor with the information for the application
	 */
	@Override
	public Cursor query(Uri uri, String[] projection, String selection,
			String[] selectionArgs, String sortOrder) {
		SQLiteQueryBuilder builder = new SQLiteQueryBuilder();
		String inTables = null;
		String where = null;
		switch (uriMatcher.match(uri)) {
		/*
		 * If we are trying to fetch information from all tables at once, we
		 * need to link them with the JOIN sentence. For that we're passing to
		 * the inTables option of the builder the JOIN and the table names of
		 * the joining variables
		 */
		case ALL:
			inTables = GradesContract.StudentsTable.TABLE_NAME + " JOIN "
					+ GradesContract.CoursesTable.TABLE_NAME + " JOIN "
					+ GradesContract.SubjectsTable.TABLE_NAME + " JOIN "
					+ GradesContract.GradesTable.TABLE_NAME + " ON ("
					+ GradesContract.CoursesTable.TABLE_NAME + "."
					+ GradesContract.CoursesTable._ID + " = "
					+ GradesContract.SubjectsTable.TABLE_NAME + "."
					+ GradesContract.SubjectsTable.COL_SU_CO_CODE + " AND "
					+ GradesContract.SubjectsTable.TABLE_NAME + "."
					+ GradesContract.SubjectsTable._ID + " = "
					+ GradesContract.GradesTable.TABLE_NAME + "."
					+ GradesContract.GradesTable.COL_GR_SU_CODE + ")";
			break;
		/*
		 * If we are trying to fetch information for a single table we will use
		 * this options If we are using only a row we will append the Where
		 * clause. After that, applied or not, we will set the proper table and
		 * defualt order if not provided with one.
		 */
		case GRADE_ID:
			where = GradesContract.GradesTable._ID + " = "
					+ uri.getPathSegments().get(1);
		case GRADE:
			inTables = GradesContract.GradesTable.TABLE_NAME;
			if (sortOrder == null || sortOrder == "") {
				sortOrder = GradesContract.GradesTable.DEFAULT_ORDER;
			}
			break;
		case SUBJECT_ID:
			where = GradesContract.SubjectsTable._ID + " = "
					+ uri.getPathSegments().get(1);
		case SUBJECT:
			inTables = GradesContract.SubjectsTable.TABLE_NAME;
			if (sortOrder == null || sortOrder == "") {
				sortOrder = GradesContract.SubjectsTable.DEFAULT_ORDER;
			}
			break;
		case COURSE_ID:
			where = GradesContract.CoursesTable._ID + " = "
					+ uri.getPathSegments().get(1);
		case COURSE:
			inTables = GradesContract.CoursesTable.TABLE_NAME;
			if (sortOrder == null || sortOrder == "") {
				sortOrder = GradesContract.CoursesTable.DEFAULT_ORDER;
			}
			break;
		case STUDENT_ID:
			where = GradesContract.StudentsTable._ID + " = "
					+ uri.getPathSegments().get(1);
		case STUDENT:
			inTables = GradesContract.StudentsTable.TABLE_NAME;
			if (sortOrder == null || sortOrder == "") {
				sortOrder = GradesContract.StudentsTable.DEFAULT_ORDER;
			}
			break;
		// If everything fails to match, we have failed to query so we throw an
		// exception.
		default:
			throw new SQLException("Failed to query " + uri);
		}
		builder.setTables(inTables);
		if (where != null) {
			builder.appendWhere(where);
		}
		/*
		 * If everything worked properly, we set a new cursor querying what we
		 * have set in the builder. After getting the result we set a
		 * notification Uri for changes on this cursor and return it.
		 */
		Cursor cursor = builder.query(dbHelper.getReadableDatabase(),
				projection, selection, selectionArgs, null, null, sortOrder);
		cursor.setNotificationUri(getContext().getContentResolver(), uri);
		return cursor;
	}

	/*
	 * If we are trying to update the information in the database it should be
	 * as easy as calling an update with each parameter.
	 * 
	 * @params
	 * 
	 * @param uri - the uri to process the query.
	 * 
	 * @param values - Values to update.
	 * 
	 * @param selection - where clause for the query. Any ? will be matched with
	 * the matching selectionArgs argument
	 * 
	 * @param selectionArgs - arguments to match the ? inserted in selection
	 * 
	 * @return count - Number of updated rows.
	 */
	@Override
	public int update(Uri uri, ContentValues values, String selection,
			String[] selectionArgs) {
		String table = null;
		switch (uriMatcher.match(uri)) {
		case GRADE_ID:
		case GRADE:
			table = GradesContract.GradesTable.TABLE_NAME;
			break;
		case COURSE_ID:
		case COURSE:
			table = GradesContract.GradesTable.TABLE_NAME;
			break;
		case SUBJECT_ID:
		case SUBJECT:
			table = GradesContract.GradesTable.TABLE_NAME;
			break;
		case STUDENT_ID:
		case STUDENT:
			table = GradesContract.GradesTable.TABLE_NAME;
			break;
		default:
			throw new IllegalArgumentException("Unknown Uri: " + uri.toString());
		}
		int count = dbHelper.getWritableDatabase().update(table, values,
				selection, selectionArgs);
		getContext().getContentResolver().notifyChange(uri, null);
		return count;
	}

	/*
	 * For deletion we are considering the option of deleting the whole database
	 * if the ALL uri is passed. Any way, the only thing to do is to send the
	 * delete option to the database.
	 * 
	 * Actually we only use the delete all option, but the rest have been
	 * implemented just in case.
	 * 
	 * @params
	 * 
	 * @param uri - the uri to process the query.
	 * 
	 * @param selection - where clause for the query. Any ? will be matched with
	 * the matching selectionArgs argument
	 * 
	 * @param selectionArgs - arguments to match the ? inserted in selection
	 * 
	 * @return count - Number of deleted rows.
	 */
	@Override
	public int delete(Uri uri, String selection, String[] selectionArgs) {
		String table = null;
		switch (uriMatcher.match(uri)) {
		case GRADE_ID:
		case GRADE:
			table = GradesContract.GradesTable.TABLE_NAME;
			break;
		case COURSE_ID:
		case COURSE:
			table = GradesContract.GradesTable.TABLE_NAME;
			break;
		case SUBJECT_ID:
		case SUBJECT:
			table = GradesContract.GradesTable.TABLE_NAME;
			break;
		case STUDENT_ID:
		case STUDENT:
			table = GradesContract.GradesTable.TABLE_NAME;
			break;
		default:
			throw new IllegalArgumentException("Unknown Uri: " + uri.toString());
		}
		int count = dbHelper.getWritableDatabase().delete(table, selection,
				selectionArgs);
		getContext().getContentResolver().notifyChange(uri, null);
		return count;
	}
}