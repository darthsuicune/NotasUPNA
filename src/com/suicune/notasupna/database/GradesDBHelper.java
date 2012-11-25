package com.suicune.notasupna.database;

import android.content.Context;
import android.database.sqlite.SQLiteDatabase;
import android.database.sqlite.SQLiteOpenHelper;

/*
 * SQLite Helper.
 * We are using a SQLite database to store the information. The open helper allows us to create or update the database in a simple way.
 */
public class GradesDBHelper extends SQLiteOpenHelper {
	/*
	 * Convenience constants. Not like actually needed but save a lot of work.
	 */
	private final String textNotNull = " TEXT NOT NULL, ";
	private final String integerNotNull = " INTEGER NOT NULL, ";
	private final String textNotNullEnd = " TEXT NOT NULL";
	private final String key = " INTEGER PRIMARY KEY AUTOINCREMENT, ";
	
	//Simple constructor with the database name and version.
	public GradesDBHelper(Context context) {
		super(context, GradesContract.DB_NAME, null, GradesContract.DB_VERSION);
	}

	/*
	 * When creating this instance, try to get the database as writable and try to create the tables.
	 */
	@Override
	public void onCreate(SQLiteDatabase db) {
		if (db.isReadOnly()){
			db = getWritableDatabase();
		}
		db.execSQL("CREATE TABLE " + GradesContract.StudentsTable.TABLE_NAME + " (" +
				GradesContract.StudentsTable._ID + key +
				GradesContract.StudentsTable.COL_ST_NIA + textNotNull +
				GradesContract.StudentsTable.COL_ST_NIF + textNotNull +
				GradesContract.StudentsTable.COL_ST_NAME + textNotNull +
				GradesContract.StudentsTable.COL_ST_SURNAME_1 + textNotNull +
				GradesContract.StudentsTable.COL_ST_SURNAME_2 + textNotNullEnd +
				")"
		);
		
		db.execSQL("CREATE TABLE " + GradesContract.CoursesTable.TABLE_NAME + " (" +
				GradesContract.CoursesTable._ID + key +
				GradesContract.CoursesTable.COL_CO_NAME+ textNotNull +
				GradesContract.CoursesTable.COL_CO_CENTER + textNotNull +
				GradesContract.CoursesTable.COL_CO_STUDIES + textNotNull +
				GradesContract.CoursesTable.COL_CO_TOTAL_CREDITS + textNotNull +
				GradesContract.CoursesTable.COL_CO_PASSED_CREDITS + textNotNull +
				GradesContract.CoursesTable.COL_CO_LANGUAGE + textNotNullEnd +
				")"
		);

		db.execSQL("CREATE TABLE " + GradesContract.SubjectsTable.TABLE_NAME + " (" +
				GradesContract.SubjectsTable._ID + key +
				GradesContract.SubjectsTable.COL_SU_CO_CODE + integerNotNull +
				GradesContract.SubjectsTable.COL_SU_NAME + textNotNull +
				GradesContract.SubjectsTable.COL_SU_TYPE + textNotNull +
				GradesContract.SubjectsTable.COL_SU_CREDITS + textNotNull +
				GradesContract.SubjectsTable.COL_SU_LANGUAGE + textNotNullEnd +
				")"
		);

		db.execSQL("CREATE TABLE " + GradesContract.GradesTable.TABLE_NAME + " (" +
				GradesContract.GradesTable._ID + key +
				GradesContract.GradesTable.COL_GR_SU_CODE + integerNotNull +
				GradesContract.GradesTable.COL_GR_GRADE_NAME + textNotNull +
				GradesContract.GradesTable.COL_GR_GRADE + textNotNull +
				GradesContract.GradesTable.COL_GR_PASSED + textNotNull +
				GradesContract.GradesTable.COL_GR_CODE + textNotNull +
				GradesContract.GradesTable.COL_GR_ASSISTED + textNotNull +
				GradesContract.GradesTable.COL_GR_TIME + textNotNull +
				GradesContract.GradesTable.COL_GR_REVISION_TIME + textNotNull +
				GradesContract.GradesTable.COL_GR_CALL + textNotNull +
				GradesContract.GradesTable.COL_GR_CALL_NUMBER + textNotNull +
				GradesContract.GradesTable.COL_GR_PROVISIONAL + textNotNull +
				GradesContract.GradesTable.COL_GR_YEAR + textNotNull +
				GradesContract.GradesTable.COL_GR_LANGUAGE + textNotNullEnd +
				")"
		);
	}

	/*
	 * Mandatory override. Nothing to update... for now.
	 */
	@Override
	public void onUpgrade(SQLiteDatabase db, int oldVersion, int newVersion) {
		//Nothing to do here
	}
}