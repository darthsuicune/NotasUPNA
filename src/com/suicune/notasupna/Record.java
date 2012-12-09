package com.suicune.notasupna;

import java.util.List;

import android.database.Cursor;

import com.suicune.notasupna.database.GradesContract;

public class Record {
	public Cursor mRecord;
	public String mCourseName;
	public List<Subject> mSubjectsList;
	
	public Record(Cursor cursor){
		mRecord = cursor;
		if(cursor.moveToFirst()){
			mCourseName = cursor.getString(cursor.getColumnIndex(GradesContract.CoursesTable.COL_CO_NAME));
		}
	}
	
	public void swapCursor(Cursor newCursor){
		mRecord = newCursor;
	}
}
