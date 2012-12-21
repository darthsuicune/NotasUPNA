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
	public String mCourseLanguage;
	
	public List<Subject> mSubjectsList;
	
	public Record(Cursor c){
		if(c != null && c.getCount() != 0){
			int currentCourseId = -1;
			int currentSubjectId = -1;
			int currentGradeId = -1;
			Subject currentSubject = null;
			Grade currentGrade = null;
			while(c.moveToNext()){
				int courseId = c.getInt(c.getColumnIndex(GradesContract.CoursesTable.TABLE_NAME + "." + GradesContract.CoursesTable._ID));
				if(currentCourseId != courseId){
					currentCourseId = c.getInt(c.getColumnIndex(GradesContract.CoursesTable.TABLE_NAME + "." + GradesContract.CoursesTable._ID));
					mCourseId = c.getInt(c.getColumnIndex(GradesContract.CoursesTable.TABLE_NAME + "." + GradesContract.CoursesTable._ID));
					mCourseName = c.getString(c.getColumnIndex(GradesContract.CoursesTable.COL_CO_NAME));
					mCourseCenter = c.getString(c.getColumnIndex(GradesContract.CoursesTable.COL_CO_CENTER));
					mCourseStudies = c.getString(c.getColumnIndex(GradesContract.CoursesTable.COL_CO_STUDIES));
					mCourseTotalCredits = Integer.valueOf(c.getString(c.getColumnIndex(GradesContract.CoursesTable.COL_CO_TOTAL_CREDITS)));
					mCoursePassedCredits = Integer.valueOf(c.getString(c.getColumnIndex(GradesContract.CoursesTable.COL_CO_PASSED_CREDITS)));
					mCourseLanguage = c.getString(c.getColumnIndex(GradesContract.CoursesTable.COL_CO_LANGUAGE));
				}
				int subjectId = c.getInt(c.getColumnIndex(GradesContract.SubjectsTable.TABLE_NAME + "." + GradesContract.SubjectsTable._ID));
				if(currentSubjectId != subjectId){
					if(currentSubject != null){
						mSubjectsList.add(currentSubject);
					}
					currentSubjectId = subjectId;
					currentSubject = new Subject(subjectId,
							c.getString(c.getColumnIndex(GradesContract.SubjectsTable.COL_SU_NAME)),
							c.getString(c.getColumnIndex(GradesContract.SubjectsTable.COL_SU_TYPE)),
							c.getString(c.getColumnIndex(GradesContract.SubjectsTable.COL_SU_LANGUAGE)),
							Integer.valueOf(c.getString(c.getColumnIndex(GradesContract.SubjectsTable.COL_SU_CO_CODE))).intValue(),
							Integer.valueOf(c.getString(c.getColumnIndex(GradesContract.SubjectsTable.COL_SU_CREDITS))).intValue());
				}
				int gradeId = c.getInt(c.getColumnIndex(GradesContract.GradesTable.TABLE_NAME + "." + GradesContract.GradesTable._ID)); 
				if(currentGradeId != gradeId){
					currentGradeId = gradeId;
					currentGrade = new Grade(currentSubject, gradeId,
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
