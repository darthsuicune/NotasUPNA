package com.suicune.notasupna;

import java.util.ArrayList;

import android.database.Cursor;

import com.suicune.notasupna.database.GradesContract;

public class Student {
	public int mStudentId;
	public String mStudentName;
	public String mStudentSurname1;
	public String mStudentSurname2;
	public String mStudentFullName;
	public String mStudentNia;
	public String mStudentNif;
	public String mStudentNip;
	
	public int mRecordCount;
	public ArrayList<Record> mRecordList;
	
	
	public Student(Cursor c){
		if(c.moveToFirst()){
			mStudentId = c.getInt(c.getColumnIndex(GradesContract.StudentsTable._ID));
			mStudentName = c.getString(c.getColumnIndex(GradesContract.StudentsTable.COL_ST_NAME));
			mStudentSurname1 = c.getString(c.getColumnIndex(GradesContract.StudentsTable.COL_ST_SURNAME_1));
			mStudentSurname2 = c.getString(c.getColumnIndex(GradesContract.StudentsTable.COL_ST_SURNAME_2));
			mStudentNia = c.getString(c.getColumnIndex(GradesContract.StudentsTable.COL_ST_NIA));
			mStudentNif = c.getString(c.getColumnIndex(GradesContract.StudentsTable.COL_ST_NIF));
//			mStudentNip = c.getString(c.getColumnIndex(GradesContract.StudentsTable.COL_ST_NIP));
			mStudentFullName = mStudentSurname1 + " " + mStudentSurname2 + ", " + mStudentName;
		}
	}
}
