package com.suicune.notasupna;

import java.sql.Date;

import android.annotation.SuppressLint;
import android.app.Activity;
import android.content.res.Configuration;
import android.os.Build;
import android.os.Bundle;
import android.support.v4.app.Fragment;
import android.support.v4.app.FragmentManager;
import android.support.v4.app.FragmentTransaction;
import android.text.format.DateFormat;
import android.view.LayoutInflater;
import android.view.Menu;
import android.view.MenuInflater;
import android.view.MenuItem;
import android.view.View;
import android.view.View.OnClickListener;
import android.view.ViewGroup;
import android.widget.Button;
import android.widget.TableRow;
import android.widget.TextView;

public class DetailsFragment extends Fragment {
	private final static String ARGUMENT_SHOWN_INDEX = "shown index";

	private final static String DIALOG_CALLS = "dialog calls";

	private CallsDialogFragment mCallsFragment;

	private Subject mSubject = null;
	private Grade mGrade = null;

	public static DetailsFragment newInstance(int position) {
		DetailsFragment fragment = new DetailsFragment();
		Bundle args = new Bundle();
		args.putLong(ARGUMENT_SHOWN_INDEX, position);
		fragment.setArguments(args);
		return fragment;
	}

	public void setSubject(Subject subject) {
		mSubject = subject;
		mGrade = mSubject.mGradesList.get(1);
		mCallsFragment = new CallsDialogFragment();
		mCallsFragment.setSubject(mSubject);
	}

	@Override
	public void onAttach(Activity activity) {
		super.onAttach(activity);
		setHasOptionsMenu(true);

	}

	@Override
	public View onCreateView(LayoutInflater inflater, ViewGroup container,
			Bundle savedInstanceState) {
		return inflater.inflate(R.layout.details_fragment, container, false);
	}

	@Override
	public void onResume() {
		super.onResume();
		showSubjectInformation();
		showGradeInformation();
		showCallsList();
	}

	@Override
	public void onCreateOptionsMenu(Menu menu, MenuInflater inflater) {
		inflater.inflate(R.menu.action_bar_details, menu);
		super.onCreateOptionsMenu(menu, inflater);
	}

	@Override
	public boolean onOptionsItemSelected(MenuItem item) {
		switch (item.getItemId()) {
		case R.id.action_details_calls:
			break;
		case R.id.action_details_share:
			break;
		default:
			return false;
		}
		return true;
	}

	public long getShownIndex() {
		return getArguments().getLong(ARGUMENT_SHOWN_INDEX);
	}

	private void showSubjectInformation() {
		TextView subjectNameView = (TextView) getActivity().findViewById(
				R.id.details_subject_name);
		TextView subjectTypeView = (TextView) getActivity().findViewById(
				R.id.details_subject_type);
		TextView subjectCreditsView = (TextView) getActivity().findViewById(
				R.id.details_subject_credits);
		TextView subjectCallsView = (TextView) getActivity().findViewById(
				R.id.details_subject_calls);

		subjectNameView.setText(mSubject.mSubjectName);
		subjectTypeView.setText(mSubject.mSubjectType);
		subjectCreditsView.setText(getString(R.string.subject_credits)
				+ mSubject.mSubjectCredits);
		subjectCallsView.setText(getString(R.string.subject_total_calls)
				+ mSubject.mGradesCount);
	}

	private void showGradeInformation() {
		TextView gradeView = (TextView) getActivity().findViewById(
				R.id.details_grade_number);
		TextView gradeNameView = (TextView) getActivity().findViewById(
				R.id.details_grade_name);
		TextView gradeTimeView = (TextView) getActivity().findViewById(
				R.id.details_grade_time);
		TextView gradeRevisionTimeView = (TextView) getActivity().findViewById(
				R.id.details_grade_revision_time);
		TextView gradeYearView = (TextView) getActivity().findViewById(
				R.id.details_grade_year);
		TextView gradeProvisionalView = (TextView) getActivity().findViewById(
				R.id.details_grade_provisional);
		TextView gradeCallView = (TextView) getActivity().findViewById(
				R.id.details_grade_call);
		TextView gradeCallNumberView = (TextView) getActivity().findViewById(
				R.id.details_grade_call_number);
		TextView gradePassedView = (TextView) getActivity().findViewById(
				R.id.details_grade_passed);
		TextView gradeTakenView = (TextView) getActivity().findViewById(
				R.id.details_grade_taken);

		String gradeTime = DateFormat.getDateFormat(getActivity()).format(
				new Date(mGrade.mGradeTime));
		String gradeRevisionTime = DateFormat.getDateFormat(getActivity())
				.format(new Date(mGrade.mGradeRevisionTime));

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

	private void showCallsList() {
		TableRow showOtherCallsRowView = (TableRow) getActivity().findViewById(
				R.id.details_row_show_calls);
		Button showOtherCallsButtonView = (Button) getActivity().findViewById(
				R.id.details_show_calls);

		if (shouldShowAsDialog()) {
			showOtherCallsRowView.setVisibility(View.VISIBLE);
			showOtherCallsButtonView.setOnClickListener(new OnClickListener() {

				@Override
				public void onClick(View v) {
					FragmentManager fragmentManager = getActivity()
							.getSupportFragmentManager();

					mCallsFragment.show(fragmentManager, DIALOG_CALLS);
				}
			});

		} else {
			FragmentManager fragmentManager = getActivity()
					.getSupportFragmentManager();

			showOtherCallsRowView.setVisibility(View.GONE);
			FragmentTransaction transaction = fragmentManager
					.beginTransaction();
			transaction
					.setTransition(FragmentTransaction.TRANSIT_FRAGMENT_OPEN);
			transaction.replace(R.id.record_calls, mCallsFragment)
					.addToBackStack(null).commit();
		}
	}

	@SuppressLint("NewApi")
	private boolean shouldShowAsDialog() {
		boolean result;

		if (getResources().getConfiguration().orientation == Configuration.ORIENTATION_LANDSCAPE) {
			if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.HONEYCOMB_MR2) {
				result = getResources().getConfiguration().isLayoutSizeAtLeast(
						Configuration.SCREENLAYOUT_SIZE_LARGE) ? false : true;
			} else {
				result = (getResources().getConfiguration().screenLayout & Configuration.SCREENLAYOUT_SIZE_MASK) < Configuration.SCREENLAYOUT_SIZE_LARGE;
			}
		} else {
			result = true;
		}
		return result;
	}
}
