package com.suicune.notasupna;

import android.app.Activity;
import android.os.Bundle;
import android.support.v4.app.Fragment;
import android.view.LayoutInflater;
import android.view.Menu;
import android.view.MenuInflater;
import android.view.MenuItem;
import android.view.View;
import android.view.ViewGroup;
import android.widget.TextView;

public class DetailsFragment extends Fragment {
	private final static String ARGUMENT_SHOWN_INDEX = "shown index"; 
	
	private Subject mSubject = null;
	private Grade mGrade = null;
	
	public static DetailsFragment newInstance(){
		DetailsFragment fragment = new DetailsFragment();
		Bundle args = new Bundle();
		args.putLong(ARGUMENT_SHOWN_INDEX, 0);
		fragment.setArguments(args);
		return fragment;
	}

	public void setSubject(Subject subject){
		mSubject = subject;
		mGrade = mSubject.getLastGrade();
		showSubjectInformation();
		showGradeInformation();
	}
	
	@Override
	public void onAttach(Activity activity) {
		super.onAttach(activity);
		
		setHasOptionsMenu(true);
	}
	
	@Override
	public View onCreateView(LayoutInflater inflater, ViewGroup container,
			Bundle savedInstanceState) {
		return inflater.inflate(R.layout.details_fragment, container);
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
	
	private void showSubjectInformation(){
		TextView mSubjectNameView = (TextView) getActivity().findViewById(R.id.details_subject_name);
		TextView mSubjectTypeView = (TextView) getActivity().findViewById(R.id.details_subject_type);
		TextView mSubjectCreditsView = (TextView) getActivity().findViewById(R.id.details_subject_credits);
		
		mSubjectNameView.setText(mSubject.mSubjectName);
		mSubjectTypeView.setText(mSubject.mSubjectType);
		mSubjectCreditsView.setText("" + mSubject.mSubjectCredits);
	}
	
	private void showGradeInformation(){
		mGrade.toString();
	}
}
