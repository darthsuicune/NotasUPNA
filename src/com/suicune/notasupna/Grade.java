package com.suicune.notasupna;

import android.database.Cursor;

import com.suicune.notasupna.database.GradesContract;

public class Grade {
	public Subject mSubject;
	public int mGradeId;
	public String mGradeName;
	public String mGradeNumber;
	public String mGradeCall;
	public int mGradeCallNumber;
	public String mGradeLetter;
	public String mGradePassed;
	public String mGradeProvisional;
	public long mGradeRevisionTime;
	public String mGradeTaken;
	public long mGradeTime;
	public String mGradeYear;
	public String mGradeLanguage;
	
	public Grade(Cursor c){
		if(c != null && c.moveToFirst()){
			mGradeId = c.getInt(c.getColumnIndex(GradesContract.GradesTable._ID));
		}
	}
	
	public Grade(Subject subject, int gradeId, String gradeName, String gradeNumber, String gradeCall, int gradeCallNumber,
			String gradeLetter, String gradePassed, String gradeProvisional, long gradeRevisionTime, String gradeTaken, long gradeTime, 
			String gradeYear, String gradeLanguage){
		mSubject = subject;
		mGradeId = gradeId;
		mGradeName = gradeName;
		mGradeNumber = gradeNumber;
		mGradeCall = gradeCall;
		mGradeCallNumber = gradeCallNumber;
		mGradeLetter = gradeLetter;
		mGradePassed = gradePassed;
		mGradeProvisional = gradeProvisional;
		mGradeRevisionTime = gradeRevisionTime;
		mGradeTaken = gradeTaken;
		mGradeTime= gradeTime;
		mGradeYear = gradeYear;
		mGradeLanguage = gradeLanguage;
	}
}
