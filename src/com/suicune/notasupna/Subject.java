package com.suicune.notasupna;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;

import android.database.Cursor;

import com.suicune.notasupna.database.GradesContract;

public class Subject implements Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	public List<Grade> mGradesList;
	
	public int mGradesCount;
	public int mCallsTakenCount;
	
	public String mSubjectName;
	public String mSubjectType;
	public String mSubjectLanguage;
	public int mSubjectCourseCode;
	public String mSubjectCredits;
	
	public Subject(Cursor c){
		mGradesList = new ArrayList<Grade>();
		if(c != null && c.moveToFirst()){
			mSubjectName = c.getString(c.getColumnIndex(GradesContract.SubjectsTable.COL_SU_NAME));
			mSubjectType = c.getString(c.getColumnIndex(GradesContract.SubjectsTable.COL_SU_TYPE));
			mSubjectLanguage = c.getString(c.getColumnIndex(GradesContract.SubjectsTable.COL_SU_LANGUAGE));
			mSubjectCourseCode = c.getInt(c.getColumnIndex(GradesContract.SubjectsTable.COL_SU_CO_CODE));
			mSubjectCredits = c.getString(c.getColumnIndex(GradesContract.SubjectsTable.COL_SU_CREDITS));
		}
	}
	
	public Subject(String subjectName, String subjectType, String subjectLanguage, int subjectCourseCode, String subjectCredits){
		mGradesList = new ArrayList<Grade>();
		mSubjectName = subjectName;
		mSubjectType = subjectType;
		mSubjectLanguage = subjectLanguage;
		mSubjectCourseCode = subjectCourseCode;
		mSubjectCredits = subjectCredits;
	}
	
	public void addGrade(Grade g){
		mGradesList.add(g);
		mGradesCount++;
		if(!g.mGradeName.contains("resentado")){
			mCallsTakenCount++;
		}
	}
	
	public Grade getLastGrade(){
		return mGradesList.get(0);
	}
}
