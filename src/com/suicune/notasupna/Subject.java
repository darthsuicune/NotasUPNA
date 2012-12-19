package com.suicune.notasupna;

import java.util.List;

import com.suicune.notasupna.database.GradesContract;

import android.database.Cursor;

public class Subject {
	public List<Grade> mGradesList;
	
	public int mSubjectId;
	public String mSubjectName;
	public String mSubjectType;
	public String mSubjectLanguage;
	public int mSubjectCourseCode;
	public int mSubjectCredits;
	
	public Subject(Cursor c){
		if(c != null && c.moveToFirst()){
			mSubjectId = c.getInt(c.getColumnIndex(GradesContract.SubjectsTable._ID));
			mSubjectName = c.getString(c.getColumnIndex(GradesContract.SubjectsTable.COL_SU_NAME));
			mSubjectType = c.getString(c.getColumnIndex(GradesContract.SubjectsTable.COL_SU_TYPE));
			mSubjectLanguage = c.getString(c.getColumnIndex(GradesContract.SubjectsTable.COL_SU_LANGUAGE));
			mSubjectCourseCode = c.getInt(c.getColumnIndex(GradesContract.SubjectsTable.COL_SU_CO_CODE));
			mSubjectCredits = c.getInt(c.getColumnIndex(GradesContract.SubjectsTable.COL_SU_CREDITS));
		}
	}
	
	public void addGrade(Grade g){
		mGradesList.add(g);
	}
}
