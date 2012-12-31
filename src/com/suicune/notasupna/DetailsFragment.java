package com.suicune.notasupna;

import java.sql.Date;

import android.app.Activity;
import android.os.Bundle;
import android.support.v4.app.Fragment;
import android.text.format.DateFormat;
import android.view.LayoutInflater;
import android.view.Menu;
import android.view.MenuInflater;
import android.view.MenuItem;
import android.view.View;
import android.view.View.OnClickListener;
import android.view.ViewGroup;
import android.widget.LinearLayout;
import android.widget.TextView;
import android.widget.Toast;

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
		mGrade = mSubject.mGradesList.get(1);
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
		TextView subjectNameView = (TextView) getActivity().findViewById(R.id.details_subject_name);
		TextView subjectTypeView = (TextView) getActivity().findViewById(R.id.details_subject_type);
		TextView subjectCreditsView = (TextView) getActivity().findViewById(R.id.details_subject_credits);
		LinearLayout ll = (LinearLayout) getActivity().findViewById(R.id.details_subject_block);
		
		subjectNameView.setText(mSubject.mSubjectName);
		subjectTypeView.setText(mSubject.mSubjectType);
		subjectCreditsView.setText("" + mSubject.mSubjectCredits);

		ll.setOnClickListener(new OnClickListener() {
			@Override
			public void onClick(View v) {
				showCallsList();
			}
		});
	}
	
	private void showGradeInformation(){
		TextView gradeView = (TextView) getActivity().findViewById(R.id.details_grade_number);
		TextView gradeNameView = (TextView) getActivity().findViewById(R.id.details_grade_name);
		TextView gradeTimeView = (TextView) getActivity().findViewById(R.id.details_grade_time);
		TextView gradeRevisionTimeView = (TextView) getActivity().findViewById(R.id.details_grade_revision_time);
		TextView gradeYearView = (TextView) getActivity().findViewById(R.id.details_grade_year);
		TextView gradeProvisionalView = (TextView) getActivity().findViewById(R.id.details_grade_provisional);
		TextView gradeCallView = (TextView) getActivity().findViewById(R.id.details_grade_call);
		TextView gradeCallNumberView = (TextView) getActivity().findViewById(R.id.details_grade_call_number);
		TextView gradePassedView = (TextView) getActivity().findViewById(R.id.details_grade_passed);
		TextView gradeTakenView = (TextView) getActivity().findViewById(R.id.details_grade_taken);
		
		String gradeTime = DateFormat.getDateFormat(getActivity()).format(new Date(mGrade.mGradeTime));
		String gradeRevisionTime = DateFormat.getDateFormat(getActivity()).format(new Date(mGrade.mGradeRevisionTime));
		
		gradeView.setText("" + mGrade.mGradeNumber);
		gradeNameView.setText("" + mGrade.mGradeName);
		gradeTimeView.setText("" + gradeTime);
		gradeRevisionTimeView.setText("" + gradeRevisionTime);
		gradeYearView.setText("" + mGrade.mGradeYear);
		gradeProvisionalView.setText("" + mGrade.mGradeProvisional);
		gradeCallView.setText("" + mGrade.mGradeCall);
		gradeCallNumberView.setText("" + mGrade.mGradeCallNumber);
		gradePassedView.setText("" + mGrade.mGradePassed);
		gradeTakenView.setText("" + mGrade.mGradeTaken);
	}
	
	private void showCallsList(){
		Toast.makeText(getActivity(), R.string.about, Toast.LENGTH_LONG).show();
	}
}
