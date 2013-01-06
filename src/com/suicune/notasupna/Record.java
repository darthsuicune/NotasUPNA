package com.suicune.notasupna;

import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;

public class Record {
	public int mCourseId;
	public String mCourseName;
	public String mCourseCenter;
	public String mCourseStudies;
	public String mCourseTotalCredits;
	public String mCoursePassedCredits;
	public String mCourseLanguage;

	public int mSubjectsCount = 0;

	public ArrayList<Subject> mSubjectsList;

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

	public void addGrade(String subjectName, Grade g) {
		int i;
		for (i = 0; i < mSubjectsCount; i++) {
			if (mSubjectsList.get(i).mSubjectName.equalsIgnoreCase(subjectName)) {
				break;
			}
		}
		mSubjectsList.get(i).addGrade(g);
	}

	public void sortByTime(boolean asc) {
		Collections.sort(mSubjectsList, new ByTime(asc));
	}

	public void sortByName(boolean asc) {
		Collections.sort(mSubjectsList, new ByName(asc));
	}

	private class ByTime implements Comparator<Subject> {
		private boolean asc;

		public ByTime(boolean asc) {
			super();
			this.asc = asc;
		}

		@Override
		public int compare(Subject lhs, Subject rhs) {
			if (lhs.mLastGradeTime > rhs.mLastGradeTime) {
				if (asc) {
					return 1;
				} else {
					return -1;
				}
			} else if (lhs.mLastGradeTime == rhs.mLastGradeTime) {
				return 0;
			} else {
				if (asc) {
					return -1;
				} else {
					return 1;
				}
			}
		}
	}

	private class ByName implements Comparator<Subject> {
		private boolean asc;

		public ByName(boolean asc) {
			super();
			this.asc = asc;
		}

		@Override
		public int compare(Subject lhs, Subject rhs) {
			String lName = dehyphenize(lhs.mSubjectName);
			String rName = dehyphenize(rhs.mSubjectName);;
			if (asc) {
				return lName.compareTo(rName);
			} else {
				return -(lName.compareTo(rName));
			}
		}

		private String dehyphenize(String string) {
			return string.replace('Á', 'A').replace('á', 'a').replace('É', 'E')
					.replace('é', 'e').replace('Í', 'I').replace('í', 'i')
					.replace('Ó', 'O').replace('ó', 'o').replace('Ú', 'U')
					.replace('ú', 'u');
		}
	}
}
