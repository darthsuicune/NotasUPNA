package com.suicune.notasupna;

import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;

import android.app.Dialog;
import android.os.Bundle;
import android.support.v4.app.DialogFragment;
import android.text.format.DateFormat;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.ListAdapter;
import android.widget.ListView;
import android.widget.SimpleAdapter;

import com.suicune.notasupna.database.GradesContract;

public class CallsDialogFragment extends DialogFragment {
	private Subject mSubject;

	@Override
	public View onCreateView(LayoutInflater inflater, ViewGroup container,
			Bundle savedInstanceState) {
		View view = inflater.inflate(R.layout.dialog_calls, container, false);
		ListView listView = (ListView) view.findViewById(android.R.id.list);
		listView.setAdapter(getAdapter());
		return view;
	}

	@Override
	public Dialog onCreateDialog(Bundle savedInstanceState) {
		Dialog dialog = super.onCreateDialog(savedInstanceState);
		dialog.setTitle(mSubject.mSubjectName);
		return dialog;
		
	}
	
	public void setSubject(Subject subject){
		mSubject = subject;
	}
	
	public ListAdapter getAdapter(){
		ArrayList<HashMap<String, String>> data = getData();
		String[] from = {
				GradesContract.GradesTable.COL_GR_TIME,
				GradesContract.GradesTable.COL_GR_GRADE,
				GradesContract.GradesTable.COL_GR_GRADE_NAME
		};
		int[] to = {
				R.id.calls_time,
				R.id.calls_grade_number,
				R.id.calls_grade_name
		};
		
		SimpleAdapter adapter = new SimpleAdapter(getActivity(), data, R.layout.calls_item, from, to);
		return adapter;
	}
	
	public ArrayList<HashMap<String, String>> getData(){
		ArrayList<HashMap<String, String>> result = new ArrayList<HashMap<String, String>>();
		for(int i = 0; i < mSubject.mGradesCount; i++){
			HashMap<String, String> item = new HashMap<String, String>();
			Grade grade = mSubject.mGradesList.get(i);
			String gradeTime = DateFormat.getDateFormat(getActivity()).format(new Date(grade.mGradeTime));
			item.put(GradesContract.GradesTable.COL_GR_TIME, gradeTime);
			item.put(GradesContract.GradesTable.COL_GR_GRADE, "" + grade.mGradeNumber);
			item.put(GradesContract.GradesTable.COL_GR_GRADE_NAME, grade.mGradeName);
			result.add(item);
		}
		return result;
	}
}
