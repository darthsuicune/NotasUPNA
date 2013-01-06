package com.suicune.notasupna;

import java.io.Serializable;
import java.util.ArrayList;

public class Subject implements Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	public ArrayList<Grade> mGradesList;
	
	public int mGradesCount;
	public int mCallsTakenCount;
	
	public String mSubjectName;
	public String mSubjectType;
	public String mSubjectLanguage;
	public int mSubjectCourseCode;
	public String mSubjectCredits;
	
	public long mLastGradeTime = 0;
	
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
		if(g.mGradeTime > mLastGradeTime){
			mLastGradeTime = g.mGradeTime;
		}
	}
	
	public Grade getLastGrade(){
		return mGradesList.get(0);
	}
}
