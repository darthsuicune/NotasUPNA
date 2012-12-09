package com.suicune.notasupna;

import android.database.Cursor;

public class Grade {
	public Cursor mGrade;
	
	public Grade(Cursor cursor){
		mGrade = cursor;
	}
	
	public void swapCursor(Cursor newCursor){
		mGrade = newCursor;
	}
}
