package com.suicune.notasupna;

import java.util.List;

import android.database.Cursor;

import com.suicune.notasupna.database.GradesContract;

public class Record {
	public int mCourseId;
	public String mCourseName;
	public String mCourseCenter;
	public String mCourseStudies;
	public int mCourseTotalCredits;
	public int mCoursePassedCredits;
	
	public List<Subject> mSubjectsList;
	
	public Record(Cursor c){
		if(c != null && c.getCount() != 0){
			c.moveToFirst();
			mCourseId = c.getInt(c.getColumnIndex(GradesContract.CoursesTable._ID));
			mCourseName = c.getString(c.getColumnIndex(GradesContract.CoursesTable.COL_CO_NAME));
			mCourseCenter = c.getString(c.getColumnIndex(GradesContract.CoursesTable.COL_CO_CENTER));
			mCourseStudies = c.getString(c.getColumnIndex(GradesContract.CoursesTable.COL_CO_STUDIES));
			mCourseTotalCredits = Integer.valueOf(c.getString(c.getColumnIndex(GradesContract.CoursesTable.COL_CO_TOTAL_CREDITS)));
			mCoursePassedCredits = Integer.valueOf(c.getString(c.getColumnIndex(GradesContract.CoursesTable.COL_CO_PASSED_CREDITS)));
			for(int i = 0; i < c.getCount(); i++){
				Subject subject = new Subject(c);
				
			}
		}
	}
}
