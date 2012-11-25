package com.suicune.notasupna.database;

import android.content.ContentProvider;
import android.content.ContentUris;
import android.content.ContentValues;
import android.content.UriMatcher;
import android.database.Cursor;
import android.database.SQLException;
import android.database.sqlite.SQLiteDatabase;
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
	private static final String CONTENT_NAME = "com.suicune.upnagrades.Database.GradesDBProvider";
	
	
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
	
	//An UriMatcher will allow the content provider to know what is the application asking for.
	private static final UriMatcher uriMatcher;
	static {
		uriMatcher = new UriMatcher(UriMatcher.NO_MATCH);
		uriMatcher.addURI(CONTENT_NAME, "all", ALL);
		uriMatcher.addURI(CONTENT_NAME, "grades", GRADE);
		uriMatcher.addURI(CONTENT_NAME, "grades/#", GRADE_ID);
		uriMatcher.addURI(CONTENT_NAME, "subjects", SUBJECT);
		uriMatcher.addURI(CONTENT_NAME, "subjects/#", SUBJECT_ID);
		uriMatcher.addURI(CONTENT_NAME, "courses", COURSE);
		uriMatcher.addURI(CONTENT_NAME, "courses/#", COURSE_ID);
		uriMatcher.addURI(CONTENT_NAME, "students", STUDENT);
		uriMatcher.addURI(CONTENT_NAME, "students/#", STUDENT_ID);
	}
	
	SQLiteDatabase db;

	//Upon creation we just set the provider database to use.
	@Override
	public boolean onCreate() {
		db = new GradesDBHelper(getContext()).getWritableDatabase();
		return (!(db == null));
	}

	/*
	 * Mandatory method for returning what type of resource we are returning.
	 * 
	 * @params
	 * @param uri - The uri to retrieve the type
	 * 
	 * @returns String - Matching type for the uri string.
	 * 
	 */
	@Override
	public String getType(Uri uri) {
		switch (uriMatcher.match(uri)){
		case ALL:
			return "vnd.android.cursor.dir/vnd." + CONTENT_NAME + "." + GradesContract.DB_NAME + ".all";
		case GRADE:
			return "vnd.android.cursor.dir/vnd." + CONTENT_NAME + "." + GradesContract.DB_NAME + ".grades";
		case GRADE_ID:
			return "vnd.android.cursor.item/vnd." + CONTENT_NAME + "." + GradesContract.DB_NAME + ".grades";
		case SUBJECT:
			return "vnd.android.cursor.dir/vnd." + CONTENT_NAME + "." + GradesContract.DB_NAME + ".subjects";
		case SUBJECT_ID:
			return "vnd.android.cursor.item/vnd." + CONTENT_NAME + "." + GradesContract.DB_NAME + ".subjects";
		case COURSE:
			return "vnd.android.cursor.dir/vnd." + CONTENT_NAME + "." + GradesContract.DB_NAME + ".courses";
		case COURSE_ID:
			return "vnd.android.cursor.item/vnd." + CONTENT_NAME + "." + GradesContract.DB_NAME + ".courses";
		case STUDENT:
			return "vnd.android.cursor.dir/vnd." + CONTENT_NAME + "." + GradesContract.DB_NAME + ".students";
		case STUDENT_ID:
			return "vnd.android.cursor.item/vnd." + CONTENT_NAME + "." + GradesContract.DB_NAME + ".students";
		default:
			throw new IllegalArgumentException("Unsupported URI: " + uri);
		}
	}

	/*
	 * The insert method receives the public Uri where the app wants to insert the values passed.
	 * We will check the Uri with the uri matcher and act in consequence
	 * 
	 * After that, we will notify changes to any possible item that is awaiting to changes in the database (as for example a UI list)
	 * 
	 * @params
	 * @param uri - Uri to insert the data in
	 * @param values - Values to be inserted
	 * 
	 * @return Uri - Returns the uri of the inserted value.
	 */
	@Override
	public Uri insert(Uri uri, ContentValues values) {
		Uri _uri = null;
		long rowID;
		switch(uriMatcher.match(uri)){
		case GRADE:
		case GRADE_ID:
			rowID = db.replace(GradesContract.GradesTable.TABLE_NAME, null, values);
			if(rowID > 0){
				_uri = ContentUris.withAppendedId(GradesContract.CONTENT_NAME_GRADES, rowID);
				getContext().getContentResolver().notifyChange(GradesContract.CONTENT_NAME_GRADES, null);
				getContext().getContentResolver().notifyChange(_uri, null);
			}
			break;
		case SUBJECT:
		case SUBJECT_ID:
			rowID = db.replace(GradesContract.SubjectsTable.TABLE_NAME, null, values);
			if(rowID > 0){
				_uri = ContentUris.withAppendedId(GradesContract.CONTENT_NAME_SUBJECTS, rowID);
				getContext().getContentResolver().notifyChange(GradesContract.CONTENT_NAME_SUBJECTS, null);
				getContext().getContentResolver().notifyChange(_uri, null);
			}
			break;
		case COURSE:
		case COURSE_ID:
			rowID = db.replace(GradesContract.CoursesTable.TABLE_NAME, null, values);
			if(rowID > 0){
				_uri = ContentUris.withAppendedId(GradesContract.CONTENT_NAME_COURSES, rowID);
				getContext().getContentResolver().notifyChange(GradesContract.CONTENT_NAME_COURSES, null);
				getContext().getContentResolver().notifyChange(_uri, null);
			}
			break;
		case STUDENT:
		case STUDENT_ID:
			rowID = db.replace(GradesContract.StudentsTable.TABLE_NAME, null, values);
			if(rowID > 0){
				_uri = ContentUris.withAppendedId(GradesContract.CONTENT_NAME_STUDENTS, rowID);
				getContext().getContentResolver().notifyChange(GradesContract.CONTENT_NAME_STUDENTS, null);
				getContext().getContentResolver().notifyChange(_uri, null);
			}
			break;
		default:
			throw new SQLException ("Failed to insert row into " + uri);
		}
		return _uri;
	}

	/*
	 * The query of the content provider allows for returning the information the app has asked for.
	 * This part is a bit more complex. We need to create and return a cursor with the information we're gathering from our source.
	 * 
	 * As we are working with a SQLite database, we will be querying the database with a SQLite Query Builder for this matter.
	 * 
	 * @params
	 * @param uri - the uri to process the query.
	 * @param projection - The fields we are retrieving.
	 * @param selection - where clause for the query. Any ? will be matched with the matching selectionArgs argument
	 * @param selectionArgs - arguments to match the ? inserted in selection
	 * @param sortOrder - The sort order in which to retrieve the data
	 * 
	 * @return Cursor - Cursor with the information for the application
	 */
	@Override
	public Cursor query(Uri uri, String[] projection, String selection,	String[] selectionArgs, String sortOrder) {
		SQLiteQueryBuilder builder = new SQLiteQueryBuilder();
		switch(uriMatcher.match(uri)){
		/*
		 * If we are trying to fetch information from all tables at once, we need to link them with the JOIN sentence.
		 * For that we're passing to the inTables option of the builder the JOIN and the table names of the joining variables
		 */
		case ALL:
			String inTables = GradesContract.StudentsTable.TABLE_NAME + " JOIN " +
							GradesContract.CoursesTable.TABLE_NAME + " JOIN " +
							GradesContract.SubjectsTable.TABLE_NAME + " JOIN " +
							GradesContract.GradesTable.TABLE_NAME + " ON (" +
							GradesContract.CoursesTable.TABLE_NAME + "." + GradesContract.CoursesTable._ID + " = " +
							GradesContract.SubjectsTable.TABLE_NAME + "." + GradesContract.SubjectsTable.COL_SU_CO_CODE + " AND " +
							GradesContract.SubjectsTable.TABLE_NAME + "." + GradesContract.SubjectsTable._ID + " = " +
							GradesContract.GradesTable.TABLE_NAME + "." + GradesContract.GradesTable.COL_GR_SU_CODE + ")";
			builder.setTables(inTables);
			break;
		/*
		 * If we are trying to fetch information for a single table we will use this options
		 * If we are using only a row we will append the Where clause.
		 * After that, applied or not, we will set the proper table and defualt order if not provided with one.
		 */
		case GRADE_ID:
			builder.appendWhere(GradesContract.GradesTable._ID + " = " + uri.getPathSegments().get(1));
		case GRADE:
			builder.setTables(GradesContract.GradesTable.TABLE_NAME);
			if (sortOrder == null || sortOrder == ""){
				sortOrder = GradesContract.GradesTable.DEFAULT_ORDER;
			}
			break;
		case SUBJECT_ID:
			builder.appendWhere(GradesContract.SubjectsTable._ID + " = " + uri.getPathSegments().get(1));
		case SUBJECT:
			builder.setTables(GradesContract.SubjectsTable.TABLE_NAME);
			if (sortOrder == null || sortOrder == ""){
				sortOrder = GradesContract.SubjectsTable.DEFAULT_ORDER;
			}
			break;
		case COURSE_ID:
			builder.appendWhere(GradesContract.CoursesTable._ID + " = " + uri.getPathSegments().get(1));
		case COURSE:
			builder.setTables(GradesContract.CoursesTable.TABLE_NAME);
			if (sortOrder == null || sortOrder == ""){
				sortOrder = GradesContract.CoursesTable.DEFAULT_ORDER;
			}
			break;
		case STUDENT_ID:
			builder.appendWhere(GradesContract.StudentsTable._ID + " = " + uri.getPathSegments().get(1));
		case STUDENT:
			builder.setTables(GradesContract.StudentsTable.TABLE_NAME);
			if (sortOrder == null || sortOrder == ""){
				sortOrder = GradesContract.StudentsTable.DEFAULT_ORDER;
			}
			break;
		//If everything fails to match, we have failed to query so we throw an exception.
		default:
			throw new SQLException ("Failed to query " + uri);
		}
		/*
		 * If everything worked properly, we set a new cursor querying what we have set in the builder.
		 * After getting the result we set a notification Uri for changes on this cursor and return it.
		 */
		Cursor cursor = builder.query(db, projection, selection, selectionArgs, null, null, sortOrder);
		cursor.setNotificationUri(getContext().getContentResolver(), uri);
		return cursor;
	}

	/*
	 * If we are trying to update the information in the database it should be as easy as calling an update with each parameter.
	 * 
	 * @params
	 * @param uri - the uri to process the query.
	 * @param values - Values to update.
	 * @param selection - where clause for the query. Any ? will be matched with the matching selectionArgs argument
	 * @param selectionArgs - arguments to match the ? inserted in selection
	 * 
	 * @return count - Number of updated rows.
	 */
	@Override
	public int update(Uri uri, ContentValues values, String selection, String[] selectionArgs) {
		int count = 0;
		String id;
		switch (uriMatcher.match(uri)){
		case GRADE:
			count = db.update(GradesContract.GradesTable.TABLE_NAME, values, selection, selectionArgs);
			break;
		case GRADE_ID:
			id = uri.getPathSegments().get(1);
			count = db.update(GradesContract.GradesTable.TABLE_NAME, values, GradesContract.GradesTable._ID + " = " + id, selectionArgs);
			break;
		case COURSE:
			count = db.update(GradesContract.CoursesTable.TABLE_NAME, values, selection, selectionArgs);
			break;
		case COURSE_ID:
			id = uri.getPathSegments().get(1);
			count = db.update(GradesContract.CoursesTable.TABLE_NAME, values, GradesContract.CoursesTable._ID + " = " + id, selectionArgs);
			break;
		case SUBJECT:
			count = db.update(GradesContract.SubjectsTable.TABLE_NAME, values, selection, selectionArgs);
			break;
		case SUBJECT_ID:
			id = uri.getPathSegments().get(1);
			count = db.update(GradesContract.SubjectsTable.TABLE_NAME, values, GradesContract.SubjectsTable._ID + " = " + id, selectionArgs);
			break;
		case STUDENT:
			count = db.update(GradesContract.StudentsTable.TABLE_NAME, values, selection, selectionArgs);
			break;
		case STUDENT_ID:
			id = uri.getPathSegments().get(1);
			count = db.update(GradesContract.StudentsTable.TABLE_NAME, values, GradesContract.StudentsTable._ID + " = " + id, selectionArgs);
			break;
		default:
			throw new IllegalArgumentException("Unknown Uri: " + uri.toString());
		}
		getContext().getContentResolver().notifyChange(uri, null);
		return count;
	}

	/*
	 * For deletion we are considering the option of deleting the whole database if the ALL uri is passed.
	 * Any way, the only thing to do is to send the delete option to the database.
	 * 
	 * Actually we only use the delete all option, but the rest have been implemented just in case.
	 * 
	 * @params
	 * @param uri - the uri to process the query.
	 * @param selection - where clause for the query. Any ? will be matched with the matching selectionArgs argument
	 * @param selectionArgs - arguments to match the ? inserted in selection
	 * 
	 * @return count - Number of deleted rows. 
	 */
	@Override
	public int delete(Uri uri, String selection, String[] selectionArgs) {
		String id;
		int count = 0;
		switch (uriMatcher.match(uri)){
		case ALL:
			int aux;
			count = db.delete(GradesContract.GradesTable.TABLE_NAME, null, null);
			aux = db.delete(GradesContract.SubjectsTable.TABLE_NAME, null, null);
			count = count + aux;
			aux = db.delete(GradesContract.CoursesTable.TABLE_NAME, null, null);
			count = count + aux;
			aux = db.delete(GradesContract.StudentsTable.TABLE_NAME, null, null);
			count = count + aux;
		case GRADE:
			count = db.delete(GradesContract.GradesTable.TABLE_NAME, selection, selectionArgs);
			break;
		case GRADE_ID:
			id = uri.getPathSegments().get(1);
			count = db.delete(GradesContract.GradesTable.TABLE_NAME, GradesContract.GradesTable._ID + " = " + id, null);
			break;
		case SUBJECT:
			count = db.delete(GradesContract.SubjectsTable.TABLE_NAME, selection, selectionArgs);
			break;
		case SUBJECT_ID:
			id = uri.getPathSegments().get(1);
			count = db.delete(GradesContract.SubjectsTable.TABLE_NAME, GradesContract.SubjectsTable._ID + " = " + id, null);
			break;
		case COURSE:
			count = db.delete(GradesContract.CoursesTable.TABLE_NAME, selection, selectionArgs);
			break;
		case COURSE_ID:
			id = uri.getPathSegments().get(1);
			count = db.delete(GradesContract.CoursesTable.TABLE_NAME, GradesContract.CoursesTable._ID + " = " + id, null);
			break;
		case STUDENT:
			count = db.delete(GradesContract.StudentsTable.TABLE_NAME, selection, selectionArgs);
			break;
		case STUDENT_ID:
			id = uri.getPathSegments().get(1);
			count = db.delete(GradesContract.StudentsTable.TABLE_NAME, GradesContract.StudentsTable._ID + " = " + id, null);
			break;
		default:
			throw new IllegalArgumentException("Unknown Uri: " + uri.toString());
		}
		getContext().getContentResolver().notifyChange(uri, null);
		return count;
	}
}