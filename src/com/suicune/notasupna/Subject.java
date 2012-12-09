package com.suicune.notasupna;

import java.util.List;

import com.suicune.notasupna.database.GradesContract;

import android.database.Cursor;

public class Subject {
	public List<Grade> mGradesList;
	
	public int mSubjectCode;
	public String mSubjectName;
	public String mSubjectType;
	public String mSubjectLanguage;
	public int mSubjectCourseCode;
	public int mSubjectCredits;
	
	
	public Subject(Cursor cursor){
		loadData(cursor);
	}
	
	public void swapCursor(Cursor newCursor){
		loadData(newCursor);
	}
	
	private void loadData(Cursor cursor){
		if(cursor.moveToFirst()){
			mSubjectCode = cursor.getInt(cursor.getColumnIndex(GradesContract.SubjectsTable._ID));
			mSubjectName = cursor.getString(cursor.getColumnIndex(GradesContract.SubjectsTable.COL_SU_NAME));
			mSubjectType = cursor.getString(cursor.getColumnIndex(GradesContract.SubjectsTable.COL_SU_TYPE));
			mSubjectLanguage = cursor.getString(cursor.getColumnIndex(GradesContract.SubjectsTable.COL_SU_LANGUAGE));
			mSubjectCourseCode = cursor.getInt(cursor.getColumnIndex(GradesContract.SubjectsTable.COL_SU_CO_CODE));
			mSubjectCredits = cursor.getInt(cursor.getColumnIndex(GradesContract.SubjectsTable.COL_SU_CREDITS));
		}
	}
}
