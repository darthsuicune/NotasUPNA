package com.suicune.notasupna;

import com.suicune.notasupna.database.GradesContract;

import android.database.Cursor;

public class Grade {
	public Cursor mGrade;
	public Subject mSubject;
	public int mGradeId;
	public String mGradeText;
	public int mGradeNumber;
	public int mGradeCall;
	public int mGradeCallNumber;
	
	public Grade(Cursor c){
		if(c != null && c.moveToFirst()){
			mGradeId = c.getInt(c.getColumnIndex(GradesContract.GradesTable._ID));
		}
	}
}
