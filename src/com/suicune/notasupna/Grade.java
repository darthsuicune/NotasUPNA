package com.suicune.notasupna;

import java.io.Serializable;

public class Grade implements Serializable{
	/**
	 * 
	 */
	private static final long serialVersionUID = -6790368977196726232L;
	
	public Subject mSubject;
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
	
	public Grade(Subject subject, String gradeName, String gradeNumber, String gradeCall, int gradeCallNumber,
			String gradeLetter, String gradePassed, String gradeProvisional, long gradeRevisionTime, String gradeTaken, long gradeTime, 
			String gradeYear, String gradeLanguage){
		mSubject = subject;
		mGradeName = gradeName;
		mGradeNumber = gradeNumber;
		mGradeCall = gradeCall;
		mGradeCallNumber = gradeCallNumber;
		mGradeLetter = gradeLetter;
		mGradePassed = gradePassed;
		mGradeRevisionTime = gradeRevisionTime;
		mGradeTaken = gradeTaken;
		mGradeTime= gradeTime;
		mGradeYear = gradeYear;
		mGradeLanguage = gradeLanguage;
	}
}
