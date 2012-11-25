package com.suicune.notasupna.helpers;

import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

import android.content.ContentResolver;
import android.content.ContentValues;
import android.content.Context;
import android.database.Cursor;
import android.net.Uri;
import android.widget.Toast;

import com.suicune.notasupna.R;
import com.suicune.notasupna.database.GradesContract;

public class GradesParser{
	//Constants defined for the results list
	public static final String nArrayPlanList = "listaResultados";
	public static final String nObjectStudentInformation = "alumno";
	public static final String nError = "error";
	public static final String nErrorMsg = "msgError";
	//Constants defined for each different grade the student is taking, usually only one
	public static final String nPlanName = "planDescripcion";
	public static final String nPlanCenter = "centroDescripcion";
	public static final String nPlanStudies = "estudioDescripcion";
	public static final String nPlanPassedCredits = "creditosSuperados";
	public static final String nPlanTotalCredits = "creditosTotalesPlan";
	public static final String nArrayResultList = "calificaciones";
	//Constants defined for each grade JSON Object
	public static final String nSubjectType = "tipoAsignatura";
	public static final String nSubjectCredits = "creditos";
	public static final String nSubjectName = "asignatura";
	public static final String nGradePassed = "superada";
	public static final String nGradeNumber = "nota";
	public static final String nGradeName = "calificacion";
	public static final String nGradeLetter = "codCalificacion";
	public static final String nGradeTaken = "presentaExamen";
	public static final String nGradeTime = "time";
	public static final String nGradeRevisionTime = "timeRevision";
	public static final String nGradeCall = "convocatoria";
	public static final String nGradeCallNumber = "numConvocatoria";
	public static final String nGradeProvisional = "provisional";
	public static final String nGradeYear = "anoAcademico";
	//Constants for the student data
	public static final String nStudentNia = "nia";
	public static final String nStudentNif = "documento";
	public static final String nStudentName = "nombre";
	public static final String nStudentSurname1 = "apellido1";
	public static final String nStudentSurname2 = "apellido2";
	
	//Constants for the "exists" method
	private static final int SUBJECT = 1;
	private static final int STUDENT = 2;
	private static final int GRADE = 3;
	private static final int PLAN = 4;

	/*
	 * We are using just one method to parse everything and insert it into the database.
	 * For this method we need to know the exact structure of the object to parse. This structure is defined on the project documentation.
	 */
	public static boolean parseData(Context context, String data, String language){
		String nia, coCode, planName, subjectName;
		
		try{
			JSONObject full = new JSONObject(data);

			ContentResolver cr = context.getContentResolver();
			//Parse the student info, as it's just one item with multiple subitems
			JSONObject student = full.getJSONObject(nObjectStudentInformation);
			//We need the nia for other insertions ahead
			nia = student.getString(nStudentNia);
			
			int studentId = exists(STUDENT, nia, null, cr, language);
			if (studentId == -1){
				ContentValues studentValues = new ContentValues();
				studentValues.put(GradesContract.StudentsTable.COL_ST_NIA, nia);
				studentValues.put(GradesContract.StudentsTable.COL_ST_NIF, student.getString(nStudentNif));
				studentValues.put(GradesContract.StudentsTable.COL_ST_NAME, student.getString(nStudentName));
				studentValues.put(GradesContract.StudentsTable.COL_ST_SURNAME_1, student.getString(nStudentSurname1));
				studentValues.put(GradesContract.StudentsTable.COL_ST_SURNAME_2, student.getString(nStudentSurname2));
				cr.insert(GradesContract.CONTENT_NAME_STUDENTS, studentValues);
			}
			
			//Parse the plan part of the grades array
			JSONArray planList = full.getJSONArray(nArrayPlanList);
			for (int resultsCounter = 0; resultsCounter < planList.length(); resultsCounter++){
				JSONObject plan = planList.getJSONObject(resultsCounter);
				
				planName = plan.getString(nPlanName);
				int planId = exists(PLAN, planName, null, cr, language);
				if (planId == -1){
					ContentValues courseValues = new ContentValues();
					courseValues.put(GradesContract.CoursesTable.COL_CO_NAME, planName);
					courseValues.put(GradesContract.CoursesTable.COL_CO_CENTER, plan.getString(nPlanCenter));
					courseValues.put(GradesContract.CoursesTable.COL_CO_STUDIES, plan.getString(nPlanStudies));
					courseValues.put(GradesContract.CoursesTable.COL_CO_TOTAL_CREDITS, plan.getString(nPlanTotalCredits));
					courseValues.put(GradesContract.CoursesTable.COL_CO_PASSED_CREDITS, plan.getString(nPlanPassedCredits));
					courseValues.put(GradesContract.CoursesTable.COL_CO_LANGUAGE, language);
					
				//We will use a Uri to recover the row we have inserted the info in and use this for the next insert
					Uri courseRow = cr.insert(GradesContract.CONTENT_NAME_COURSES, courseValues);
					Cursor cursor = cr.query(courseRow, new String[] { GradesContract.CoursesTable._ID }, null, null, null);
					cursor.moveToFirst();
					coCode = Integer.toString(cursor.getInt(cursor.getColumnIndex(GradesContract.CoursesTable._ID)));
					cursor.close();
				}else{
					coCode = Integer.toString(planId);
					ContentValues courseValues = new ContentValues();
					courseValues.put(GradesContract.CoursesTable.COL_CO_PASSED_CREDITS, plan.getString(nPlanPassedCredits));
					cr.update(GradesContract.CONTENT_NAME_COURSES, courseValues, GradesContract.CoursesTable._ID + "=?", new String[] { coCode });
				}
				
				//Parse the grades array
				JSONArray grades = plan.getJSONArray(nArrayResultList);
				int length = grades.length();
				for(int gradesCounter = 0; gradesCounter < length; gradesCounter++){
					JSONObject grade = grades.getJSONObject(gradesCounter);
					subjectName = grade.getString(nSubjectName);
					int subjectId = exists(SUBJECT, subjectName, null, cr, language);
					String suCode = null;
					if (subjectId == -1){
						ContentValues subjectValues = new ContentValues();
						subjectValues.put(GradesContract.SubjectsTable.COL_SU_CO_CODE, coCode);
						subjectValues.put(GradesContract.SubjectsTable.COL_SU_NAME, subjectName);
						subjectValues.put(GradesContract.SubjectsTable.COL_SU_TYPE, grade.getString(nSubjectType));
						subjectValues.put(GradesContract.SubjectsTable.COL_SU_CREDITS, grade.getString(nSubjectCredits));
						subjectValues.put(GradesContract.SubjectsTable.COL_SU_LANGUAGE, language);
						//In the same fashion we've done with courses, we need to get the new subject ID
						Uri subjectRow = cr.insert(GradesContract.CONTENT_NAME_SUBJECTS, subjectValues);
						Cursor cursor = cr.query(subjectRow, new String[] { GradesContract.SubjectsTable._ID }, null, null, null);
						cursor.moveToFirst();
						suCode = Integer.toString(cursor.getInt(cursor.getColumnIndex(GradesContract.SubjectsTable._ID)));
						cursor.close();
					}else{
						suCode = Integer.toString(subjectId);
					}
					String time = grade.getString(nGradeTime);
					int gradeId = exists(GRADE, time, suCode, cr, language);
					if (gradeId == -1){
						ContentValues gradeValues = new ContentValues();
						gradeValues.put(GradesContract.GradesTable.COL_GR_SU_CODE, suCode);
						gradeValues.put(GradesContract.GradesTable.COL_GR_GRADE_NAME, grade.getString(nGradeName));
						gradeValues.put(GradesContract.GradesTable.COL_GR_GRADE, grade.getString(nGradeNumber));
						gradeValues.put(GradesContract.GradesTable.COL_GR_PASSED, grade.getString(nGradePassed));
						gradeValues.put(GradesContract.GradesTable.COL_GR_CODE, grade.getString(nGradeLetter));
						gradeValues.put(GradesContract.GradesTable.COL_GR_ASSISTED, grade.getString(nGradeTaken));
						gradeValues.put(GradesContract.GradesTable.COL_GR_TIME, time);
						gradeValues.put(GradesContract.GradesTable.COL_GR_REVISION_TIME, grade.getString(nGradeRevisionTime));
						String call = grade.getString(nGradeCall);
						if(call.length() > 2){
							gradeValues.put(GradesContract.GradesTable.COL_GR_CALL, call);
						}else{
							gradeValues.put(GradesContract.GradesTable.COL_GR_CALL, context.getString(R.string.call_unknown));
						}
						gradeValues.put(GradesContract.GradesTable.COL_GR_CALL_NUMBER, grade.getString(nGradeCallNumber));
						gradeValues.put(GradesContract.GradesTable.COL_GR_PROVISIONAL, grade.getString(nGradeProvisional));
						gradeValues.put(GradesContract.GradesTable.COL_GR_YEAR, grade.getString(nGradeYear));
						gradeValues.put(GradesContract.GradesTable.COL_GR_LANGUAGE, language);
						cr.insert(GradesContract.CONTENT_NAME_GRADES, gradeValues);
					}
				}
			}
			return true;
		}catch (JSONException e){
			e.printStackTrace();
			Toast.makeText(context, R.string.error_parsing, Toast.LENGTH_LONG).show();
			return false;
		}
	}
	
	/*
	 * This method will avoid duplicate insertions. Slows down the process but avoids leaking of storage data.
	 * 
	 * @params
	 * @param what - type of row to check
	 * @param name - name of the row to check. As the identifier on the database is an Autoincrement value, it's useless to check on it. 
	 * @param code - Used when checking grades. we check if the time and subject to get a unique pair.
	 * @param cr - The content resolver to check if the data exists
	 * @param language - language of the record
	 * 
	 * @returns int - the number of rows that match the given parameters. 0 if no row matches. -1 if any error passes by
	 */
	private static int exists(int what, String name, String code, ContentResolver cr, String language){
		int mRowId = -1;
		Cursor cursor = null;
		String selection = null;
		switch (what){
		case SUBJECT:
			selection = GradesContract.SubjectsTable.COL_SU_NAME + "=? AND " + GradesContract.SubjectsTable.COL_SU_LANGUAGE + "=?";
			String[] subjectSelectionArgs = {
					name,
					language
			};
			cursor = cr.query(GradesContract.CONTENT_NAME_SUBJECTS, new String[] { GradesContract.SubjectsTable._ID }, selection, subjectSelectionArgs, null);
			if (cursor.moveToFirst()){
				mRowId = cursor.getInt(cursor.getColumnIndex(GradesContract.SubjectsTable._ID));
			}
			break;
		case PLAN:
			selection = GradesContract.CoursesTable.COL_CO_NAME + "=? AND " + GradesContract.CoursesTable.COL_CO_LANGUAGE + "=?";
			String[] planSelectionArgs = {
					name,
					language
			};
			cursor = cr.query(GradesContract.CONTENT_NAME_COURSES, new String[] { GradesContract.CoursesTable._ID }, selection, planSelectionArgs, null);
			if (cursor.moveToFirst()){
				mRowId = cursor.getInt(cursor.getColumnIndex(GradesContract.CoursesTable._ID));
			}
			break;
		case STUDENT:
			cursor = cr.query(GradesContract.CONTENT_NAME_STUDENTS, new String[] { GradesContract.StudentsTable._ID }, GradesContract.StudentsTable.COL_ST_NIA + "=\"" + name + "\"", null, null);
			if (cursor.moveToFirst()){
				mRowId = cursor.getInt(cursor.getColumnIndex(GradesContract.StudentsTable._ID));
			}
			break;
		case GRADE:
			selection = GradesContract.GradesTable.COL_GR_TIME + "=? AND " + GradesContract.GradesTable.COL_GR_SU_CODE + "=? AND " + GradesContract.GradesTable.COL_GR_LANGUAGE + "=?";
			String[] gradeSelectionArgs = {
					name,
					code,
					language
			};
			cursor = cr.query(GradesContract.CONTENT_NAME_GRADES, new String[] { GradesContract.GradesTable._ID }, selection, gradeSelectionArgs, null);
			if (cursor.moveToFirst()){
				mRowId = cursor.getInt(cursor.getColumnIndex(GradesContract.GradesTable._ID));
			}
			break;
		default:
			return mRowId;
		}
		if(cursor != null){
			cursor.close();
		}
		return mRowId;
	}
}