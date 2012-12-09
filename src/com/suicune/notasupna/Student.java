package com.suicune.notasupna;

import java.util.List;

import com.suicune.notasupna.database.GradesContract;

import android.database.Cursor;

public class Student {
	public Cursor mStudent;
	public List<Record> mRecordsList;
	public String mStudentName;
	
	public Student(Cursor cursor){
		mStudent = cursor;
		if(cursor.moveToFirst()){
			mStudentName = cursor.getString(cursor.getColumnIndex(GradesContract.StudentsTable.COL_ST_NAME));
		}
	}
	
	public void swapCursor(Cursor newCursor){
		mStudent = newCursor;
	}
}
