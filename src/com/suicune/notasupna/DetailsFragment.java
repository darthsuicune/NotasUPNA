package com.suicune.notasupna;

import android.app.Activity;
import android.os.Bundle;
import android.support.v4.app.Fragment;
import android.view.Menu;
import android.view.MenuInflater;
import android.view.MenuItem;
import android.widget.TextView;

public class DetailsFragment extends Fragment {
	private final static String ARGUMENT_SHOWN_INDEX = "shown index"; 
	
	private Subject mSubject = null;
	private Grade mGrade = null;
	
	public static DetailsFragment newInstance(long subjectId){
		DetailsFragment fragment = new DetailsFragment();
		Bundle args = new Bundle();
		args.putLong(ARGUMENT_SHOWN_INDEX, 0);
		fragment.setArguments(args);
		return fragment;
	}

	public void setSubject(Subject subject){
		mSubject = subject;
		mGrade = mSubject.getLastGrade();
	}
	
	@Override
	public void onAttach(Activity activity) {
		super.onAttach(activity);
		
		setHasOptionsMenu(true);
		
		TextView mSubjectNameView = (TextView) activity.findViewById(R.id.details_subject_name);
		TextView mSubjectTypeView = (TextView) activity.findViewById(R.id.details_subject_type);
		TextView mSubjectCreditsView = (TextView) activity.findViewById(R.id.details_subject_credits);
		mSubjectNameView.setText(mGrade.mSubject.mSubjectName + " " + mGrade.mGradeNumber);
		mSubjectTypeView.setText(mGrade.mSubject.mSubjectType);
		mSubjectCreditsView.setText(mGrade.mSubject.mSubjectCredits);
		
	}
	
	@Override
	public void onCreateOptionsMenu(Menu menu, MenuInflater inflater) {
		inflater.inflate(R.menu.action_bar_details, menu);
		super.onCreateOptionsMenu(menu, inflater);
	}

	@Override
	public boolean onOptionsItemSelected(MenuItem item) {
		switch (item.getItemId()){
		case R.id.action_details_calls:
			break;
		case R.id.action_details_share:
			break;
		default:
			return false;
		}
		return true;
	}

	public long getShownIndex(){
		return getArguments().getLong(ARGUMENT_SHOWN_INDEX);
	}
}
