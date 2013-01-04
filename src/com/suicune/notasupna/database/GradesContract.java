package com.suicune.notasupna.database;

import android.net.Uri;
import android.provider.BaseColumns;

/*
 * This class, like the R class is filled with constants used in the application. Allows for quick referring to names or table orders
 * Nothing is going to be instantiated, so constructors arae kept private.
 */
public class GradesContract{
	public static final String DB_NAME = "grades";
	public static final int DB_VERSION = 1;

	private static final String CONTENT_NAME = "com.suicune.notasupna.GradesDBProvider";
	public static final Uri CONTENT_NAME_ALL = Uri.parse("content://" + CONTENT_NAME + "/all");
	public static final Uri CONTENT_NAME_GRADES = Uri.parse("content://" + CONTENT_NAME + "/grades");
	public static final Uri CONTENT_NAME_SUBJECTS = Uri.parse("content://" + CONTENT_NAME + "/subjects");
	public static final Uri CONTENT_NAME_COURSES = Uri.parse("content://" + CONTENT_NAME + "/courses");
	public static final Uri CONTENT_NAME_STUDENTS = Uri.parse("content://" + CONTENT_NAME + "/students");
	
	private GradesContract(){
	}
	
	public class StudentsTable implements BaseColumns{
		public static final String TABLE_NAME = "students";
		public static final int _COUNT = 6;
		public static final String DEFAULT_ORDER = "_ID DESC";
		
		public static final String _ID = "_id";
		public static final String COL_ST_NIA = "st_nia";
		public static final String COL_ST_NIF = "st_nif";
		public static final String COL_ST_NIP = "st_nip";
		public static final String COL_ST_NAME = "st_name";
		public static final String COL_ST_SURNAME_1 = "st_surname_1";
		public static final String COL_ST_SURNAME_2 = "st_surname_2";
		
		private StudentsTable(){
		}
	}

	public class CoursesTable implements BaseColumns{
		public static final String TABLE_NAME = "courses";
		public static final int _COUNT = 6;
		public static final String DEFAULT_ORDER = "_ID DESC";
		
		public static final String _ID = "_id";
		public static final String COL_CO_NAME = "co_name";
		public static final String COL_CO_CENTER = "co_center";
		public static final String COL_CO_STUDIES = "co_studies";
		public static final String COL_CO_TOTAL_CREDITS = "co_total_credits";
		public static final String COL_CO_PASSED_CREDITS = "co_passed_credits";
		public static final String COL_CO_LANGUAGE = "co_language";
		
		private CoursesTable(){
		}
	}

	public class SubjectsTable implements BaseColumns{
		public static final String TABLE_NAME = "subjects";
		public static final int _COUNT = 5;
		public static final String DEFAULT_ORDER = "_ID DESC";
		
		public static final String _ID = "_id";
		public static final String COL_SU_CO_CODE = "su_co_code";
		public static final String COL_SU_NAME = "su_name";
		public static final String COL_SU_CREDITS = "su_credits";
		public static final String COL_SU_TYPE = "su_type";
		public static final String COL_SU_LANGUAGE = "su_language";

		private SubjectsTable(){
		}
	}

	public class GradesTable implements BaseColumns{
		public static final String TABLE_NAME = "grades";
		public static final int _COUNT = 13;

		public static final String _ID = "_id";
		public static final String COL_GR_SU_CODE = "gr_su_code";
		public static final String COL_GR_GRADE_NAME = "gr_grade_name";
		public static final String COL_GR_GRADE = "gr_grade";
		public static final String COL_GR_PASSED = "gr_passed";
		public static final String COL_GR_CODE = "gr_code";
		public static final String COL_GR_ASSISTED = "gr_assisted";
		public static final String COL_GR_TIME = "gr_time";
		public static final String COL_GR_REVISION_TIME = "gr_revision_time";
		public static final String COL_GR_CALL = "gr_call";
		public static final String COL_GR_CALL_NUMBER = "gr_call_number";
		public static final String COL_GR_PROVISIONAL = "gr_provisional";
		public static final String COL_GR_YEAR = "gr_year";
		public static final String COL_GR_LANGUAGE = "gr_language";

		public static final String DEFAULT_ORDER = COL_GR_TIME + " DESC";
		
		private GradesTable(){
		}
	}
}
