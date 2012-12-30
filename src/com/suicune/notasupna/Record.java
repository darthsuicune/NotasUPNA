package com.suicune.notasupna;

import java.util.ArrayList;
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
	public String mCourseLanguage;
	
	public int mSubjectsCount = 0;
	
	public List<Subject> mSubjectsList;
	
	public Record(Cursor c){
		mSubjectsList = new ArrayList<Subject>();
		
		
		if(c != null && c.getCount() != 0){
			if(c.isAfterLast()){
				c.moveToFirst();
				c.moveToPrevious();
			}
			int currentCourseId = -1;
			String currentSubjectName = "";
			long currentGradeTime = -1;
			int currentGradeSubject = -1;
			Subject currentSubject = null;
			Grade currentGrade = null;
			while(c.moveToNext()){
				int courseId = c.getInt(c.getColumnIndex(GradesContract.CoursesTable._ID));
				if(currentCourseId != courseId){
					currentCourseId = c.getInt(c.getColumnIndex(GradesContract.CoursesTable._ID));
					mCourseId = currentCourseId;
					mCourseName = c.getString(c.getColumnIndex(GradesContract.CoursesTable.COL_CO_NAME));
					mCourseCenter = c.getString(c.getColumnIndex(GradesContract.CoursesTable.COL_CO_CENTER));
					mCourseStudies = c.getString(c.getColumnIndex(GradesContract.CoursesTable.COL_CO_STUDIES));
					mCourseTotalCredits = Integer.valueOf(c.getString(c.getColumnIndex(GradesContract.CoursesTable.COL_CO_TOTAL_CREDITS)));
					mCoursePassedCredits = Integer.valueOf(c.getString(c.getColumnIndex(GradesContract.CoursesTable.COL_CO_PASSED_CREDITS)));
					mCourseLanguage = c.getString(c.getColumnIndex(GradesContract.CoursesTable.COL_CO_LANGUAGE));
				}
				String subjectName = c.getString(c.getColumnIndex(GradesContract.SubjectsTable.COL_SU_NAME));
				if(!currentSubjectName.equalsIgnoreCase(subjectName)){
					if(currentSubject != null){
						mSubjectsList.add(currentSubject);
						mSubjectsCount++;
					}
					currentSubjectName = subjectName;
					currentSubject = new Subject(
							c.getString(c.getColumnIndex(GradesContract.SubjectsTable.COL_SU_NAME)),
							c.getString(c.getColumnIndex(GradesContract.SubjectsTable.COL_SU_TYPE)),
							c.getString(c.getColumnIndex(GradesContract.SubjectsTable.COL_SU_LANGUAGE)),
							Integer.valueOf(c.getString(c.getColumnIndex(GradesContract.SubjectsTable.COL_SU_CO_CODE))).intValue(),
							Integer.valueOf(c.getString(c.getColumnIndex(GradesContract.SubjectsTable.COL_SU_CREDITS))).intValue());
				}
				long gradeTime = c.getLong(c.getColumnIndex(GradesContract.GradesTable._ID));
				int gradeSubject = c.getInt(c.getColumnIndex(GradesContract.GradesTable.COL_GR_SU_CODE));
				if(currentGradeTime != gradeTime || currentGradeSubject != gradeSubject){
					currentGradeSubject = gradeSubject;
					currentGradeTime = gradeTime;
					currentGrade = new Grade(currentSubject, 
							c.getString(c.getColumnIndex(GradesContract.GradesTable.COL_GR_GRADE_NAME)),
							c.getString(c.getColumnIndex(GradesContract.GradesTable.COL_GR_GRADE)),
							c.getString(c.getColumnIndex(GradesContract.GradesTable.COL_GR_CALL)),
							Integer.valueOf(c.getString(c.getColumnIndex(GradesContract.GradesTable.COL_GR_CALL_NUMBER))).intValue(),
							c.getString(c.getColumnIndex(GradesContract.GradesTable.COL_GR_CODE)),
							c.getString(c.getColumnIndex(GradesContract.GradesTable.COL_GR_PASSED)),
							c.getString(c.getColumnIndex(GradesContract.GradesTable.COL_GR_PROVISIONAL)),
							Long.valueOf(c.getString(c.getColumnIndex(GradesContract.GradesTable.COL_GR_REVISION_TIME))).longValue(),
							c.getString(c.getColumnIndex(GradesContract.GradesTable.COL_GR_ASSISTED)),
							Long.valueOf(c.getString(c.getColumnIndex(GradesContract.GradesTable.COL_GR_TIME))).longValue(),
							c.getString(c.getColumnIndex(GradesContract.GradesTable.COL_GR_YEAR)),
							c.getString(c.getColumnIndex(GradesContract.GradesTable.COL_GR_LANGUAGE))
							);
					currentSubject.addGrade(currentGrade);
				}
			}
			if(currentSubject != null){
				mSubjectsList.add(currentSubject);
			}
		}
	}
}
