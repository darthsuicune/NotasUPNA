package com.suicune.notasupna;

import java.util.ArrayList;
import java.util.List;

public class Record {
	public int mCourseId;
	public String mCourseName;
	public String mCourseCenter;
	public String mCourseStudies;
	public String mCourseTotalCredits;
	public String mCoursePassedCredits;
	public String mCourseLanguage;

	public int mSubjectsCount = 0;

	public List<Subject> mSubjectsList;

	Record(int courseId, String courseName, String courseCenter,
			String courseStudies, String courseTotalCredits,
			String coursePassedCredits, String courseLanguage) {
		mSubjectsList = new ArrayList<Subject>();
		
		mCourseId = courseId;
		mCourseName = courseName;
		mCourseCenter = courseCenter;
		mCourseStudies = courseStudies;
		mCourseTotalCredits = courseTotalCredits;
		mCoursePassedCredits = coursePassedCredits;
		mCourseLanguage = courseLanguage;
	}

	public void addSubject(Subject subject) {
		mSubjectsList.add(subject);
		mSubjectsCount++;
	}
}
