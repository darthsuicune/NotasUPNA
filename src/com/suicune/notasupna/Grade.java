package com.suicune.notasupna;

import android.database.Cursor;

public class Grade {
	public Cursor mGrade;
	public Subject mSubject;
	
	public Grade(Cursor c){
		if(c != null && c.moveToFirst()){
			
		}
	}
}
