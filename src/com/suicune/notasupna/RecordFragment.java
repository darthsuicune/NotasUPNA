package com.suicune.notasupna;

import java.util.ArrayList;
import java.util.HashMap;

import org.json.JSONException;
import org.json.JSONObject;

import android.animation.Animator;
import android.animation.AnimatorListenerAdapter;
import android.annotation.SuppressLint;
import android.annotation.TargetApi;
import android.app.ActionBar.OnNavigationListener;
import android.app.Activity;
import android.content.Intent;
import android.content.SharedPreferences;
import android.content.res.Configuration;
import android.database.Cursor;
import android.net.Uri;
import android.os.Build;
import android.os.Bundle;
import android.preference.PreferenceManager;
import android.support.v4.app.FragmentTransaction;
import android.support.v4.app.ListFragment;
import android.support.v4.app.LoaderManager;
import android.support.v4.app.LoaderManager.LoaderCallbacks;
import android.support.v4.content.CursorLoader;
import android.support.v4.content.Loader;
import android.util.Log;
import android.view.LayoutInflater;
import android.view.Menu;
import android.view.MenuInflater;
import android.view.MenuItem;
import android.view.View;
import android.view.ViewGroup;
import android.widget.ListView;
import android.widget.SimpleAdapter;
import android.widget.SpinnerAdapter;
import android.widget.TextView;
import android.widget.Toast;

import com.suicune.notasupna.database.GradesContract;
import com.suicune.notasupna.helpers.ConnectLoader;
import com.suicune.notasupna.helpers.GradesParserLoader;

/**
 * 
 * @author Denis Lapuente
 * 
 */
public class RecordFragment extends ListFragment {

	private static final int LOADER_STUDENT = 1;
	private static final int LOADER_CONNECTION = 2;
	private static final int LOADER_PARSER = 3;

	private static final int PROGRESS_SIGN_IN = 1;
	private static final int PROGRESS_PARSE = 2;

	private static final int ACTIVITY_PREFERENCES = 1;
	private static final int ACTIVITY_DETAILS = 2;

	private static final String STATE_POSITION = "cursor position";
	private static final String STATE_SUBJECT = "current subject";

	public static final String COURSE_ID = "course_id";

	private boolean landscape;
	private int cursorPosition = 0;
	private int mCurrentRecordId = 0;

	private Record mCurrentRecord = null;
	private Student mStudent = null;
	private Subject mCurrentSubject = null;

	private View mCurrentRecordView;
	private View mCurrentRecordStatusView;
	private View mDetailsHintView;
	private View mDetailsView;
	private View mCurrentRecordHeaderView;
	private View mOtherCallsView;
	private TextView mCurrentRecordStatusMessageView;

	private CursorLoaderHelper clh;
	private DetailsFragment details;

	LoaderManager manager = null;

	@Override
	public View onCreateView(LayoutInflater inflater, ViewGroup container,
			Bundle savedInstanceState) {

		return inflater.inflate(R.layout.record_fragment, container);
	}

	@Override
	public void onActivityCreated(Bundle savedInstanceState) {
		super.onActivityCreated(savedInstanceState);

		mCurrentRecordId = PreferenceManager.getDefaultSharedPreferences(getActivity()).getInt(PreferencesActivity.CURRENT_RECORD, 0);
		
		// Restore important information in case the activity was previously
		// active.
		if (savedInstanceState != null) {
			cursorPosition = savedInstanceState.getInt(STATE_POSITION);
			mCurrentSubject = (Subject) savedInstanceState
					.getSerializable(STATE_SUBJECT);
		}
		this.setHasOptionsMenu(true);

		// Set the views we are using across the fragment
		mCurrentRecordView = getActivity().findViewById(R.id.record_view);
		mCurrentRecordStatusView = getActivity().findViewById(
				R.id.record_status);
		mCurrentRecordStatusMessageView = (TextView) getActivity()
				.findViewById(R.id.record_status_message);

		mDetailsView = getActivity().findViewById(R.id.record_details);
		mDetailsHintView = getActivity().findViewById(R.id.record_details_hint);
		mOtherCallsView = getActivity().findViewById(R.id.record_calls);
		mCurrentRecordHeaderView = getActivity().findViewById(
				R.id.record_header_block);

		// Set the parameters
		manager = getActivity().getSupportLoaderManager();
		clh = new CursorLoaderHelper();

		// If there is no current information attached to the fragment, load the
		// information from the DB
		if (mCurrentRecord == null) {
			Bundle extras = getActivity().getIntent().getExtras();
			if (extras != null) {
				manager.initLoader(LOADER_PARSER, extras, new AsyncHelper());
			} else {
				manager.initLoader(LOADER_STUDENT, null, clh);
			}
		}

		// If we are on GB or below, make sure all the options are available
		if (Build.VERSION.SDK_INT < Build.VERSION_CODES.HONEYCOMB) {
			manageOldVersion();
		}

		// Check if we are on Landscape mode or not
		if ((mDetailsView != null)
				&& (mDetailsView.getVisibility() == View.VISIBLE)) {
			landscape = true;
		} else {
			landscape = false;
		}

		// Manage the second (and third) fragments if we are on landscape
		if (landscape) {
			// In a small screen we make the details fragment act as in portrait
			// mode
			if (isSmallScreen() && mOtherCallsView != null) {
				mOtherCallsView.setVisibility(View.GONE);
				mCurrentRecordHeaderView.setVisibility(View.GONE);
			} else {
				mOtherCallsView.setVisibility(View.VISIBLE);
				mCurrentRecordHeaderView.setVisibility(View.VISIBLE);
			}
			getListView().setChoiceMode(ListView.CHOICE_MODE_SINGLE);

			// Create the details fragment and show it in its place
			details = (DetailsFragment) getActivity()
					.getSupportFragmentManager().findFragmentById(
							R.id.record_details);
			if (mCurrentSubject == null) {
				mDetailsHintView.setVisibility(View.VISIBLE);
				mDetailsView.setVisibility(View.GONE);
			} else {
				showDetails(cursorPosition, mCurrentSubject);
			}
		}
	}

	/**
	 * This method should allow for changing the degree when needed on older
	 * versions. Basically, activate a visual element to allow for changing
	 * degrees TODO
	 */
	private void manageOldVersion() {

	}
	

	@Override
	public void onSaveInstanceState(Bundle outState) {
		outState.putInt(STATE_POSITION, cursorPosition);
		outState.putSerializable(STATE_SUBJECT, mCurrentSubject);
		super.onSaveInstanceState(outState);
	}

	@Override
	public void onListItemClick(ListView l, View v, int position, long id) {
		cursorPosition = position;
		showDetails(position, mCurrentRecord.mSubjectsList.get(position));
		super.onListItemClick(l, v, position, id);
	}

	@Override
	public void onCreateOptionsMenu(Menu menu, MenuInflater inflater) {
		inflater.inflate(R.menu.action_bar_record, menu);
		super.onCreateOptionsMenu(menu, inflater);
	}

	@Override
	public boolean onOptionsItemSelected(MenuItem item) {
		switch (item.getItemId()) {
		case R.id.action_record_refresh:
			getActivity().getSupportLoaderManager().initLoader(
					LOADER_CONNECTION, null, new AsyncHelper());
			break;
		case R.id.action_record_preferences:
			Intent intent = new Intent(getActivity(), PreferencesActivity.class);
			startActivityForResult(intent, ACTIVITY_PREFERENCES);
			break;
		case R.id.action_record_close_session:
			// Should show a Dialog to warn about the user about closing session
			// and then close everything
			// TODO
			break;
		default:
			break;
		}
		return super.onOptionsItemSelected(item);
	}

	@Override
	public void onActivityResult(int requestCode, int resultCode, Intent data) {
		switch (requestCode) {
		case ACTIVITY_DETAILS:
			if (resultCode == Activity.RESULT_OK) {
				if (landscape) {
					showDetails(cursorPosition, (Subject) data.getExtras()
							.getSerializable(DetailsActivity.EXTRA_SUBJECT));
				}
			}
			break;
		case ACTIVITY_PREFERENCES:
			break;
		default:
			break;
		}
		super.onActivityResult(requestCode, resultCode, data);
	}

	/**
	 * @param position
	 *            The position of the item clicked in the list
	 * @param subject
	 */
	private void showDetails(int position, Subject subject) {
		getListView().setItemChecked(position, true);

		if (landscape) {
			if (details == null || details.getShownIndex() != position) {
				details = DetailsFragment.newInstance(position);
				details.setSubject(subject);

				if (mDetailsHintView.getVisibility() == View.VISIBLE) {
					mDetailsHintView.setVisibility(View.GONE);
					mDetailsView.setVisibility(View.VISIBLE);
				}

				FragmentTransaction ft = getActivity()
						.getSupportFragmentManager().beginTransaction();
				ft.replace(R.id.record_details, details);
				ft.setTransition(FragmentTransaction.TRANSIT_FRAGMENT_FADE);
				ft.commit();
			}
		} else {
			Intent intent = new Intent(getActivity(), DetailsActivity.class);
			intent.putExtra(DetailsActivity.EXTRA_SUBJECT, subject);
			startActivityForResult(intent, ACTIVITY_DETAILS);
		}
	}

	/**
	 * Shows the progress UI and hides the record
	 */
	@TargetApi(Build.VERSION_CODES.HONEYCOMB_MR2)
	private void showProgress(final boolean show, int progressType) {
		switch (progressType) {
		case PROGRESS_SIGN_IN:
			mCurrentRecordStatusMessageView.setText(R.string.dialog_connect);
			break;
		case PROGRESS_PARSE:
			mCurrentRecordStatusMessageView.setText(R.string.dialog_parse);
			break;
		default:
			break;

		}
		// On Honeycomb MR2 we have the ViewPropertyAnimator APIs, which allow
		// for very easy animations. If available, use these APIs to fade-in
		// the progress spinner.
		if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.HONEYCOMB_MR2) {
			int shortAnimTime = getResources().getInteger(
					android.R.integer.config_shortAnimTime);

			mCurrentRecordStatusView.setVisibility(View.VISIBLE);
			mCurrentRecordStatusView.animate().setDuration(shortAnimTime)
					.alpha(show ? 1 : 0)
					.setListener(new AnimatorListenerAdapter() {
						@Override
						public void onAnimationEnd(Animator animation) {
							mCurrentRecordStatusView
									.setVisibility(show ? View.VISIBLE
											: View.GONE);
						}
					});

			mCurrentRecordView.setVisibility(View.VISIBLE);
			mCurrentRecordView.animate().setDuration(shortAnimTime)
					.alpha(show ? 0 : 1)
					.setListener(new AnimatorListenerAdapter() {
						@Override
						public void onAnimationEnd(Animator animation) {
							mCurrentRecordView.setVisibility(show ? View.GONE
									: View.VISIBLE);
							// if (mDetailsView != null) {
							// mDetailsView.setVisibility(show ? View.GONE
							// : View.VISIBLE);
							// }
						}
					});
		} else {
			// The ViewPropertyAnimator APIs are not available, so simply show
			// and hide the relevant UI components.
			// if (mDetailsView != null) {
			// mDetailsView.setVisibility(show ? View.GONE : View.VISIBLE);
			// }
			mCurrentRecordView.setVisibility(show ? View.GONE : View.VISIBLE);
			mCurrentRecordStatusView.setVisibility(show ? View.VISIBLE
					: View.GONE);

		}
	}

	@TargetApi(Build.VERSION_CODES.HONEYCOMB)
	public void setSpinnerAdapter(SpinnerAdapter spinnerAdapter) {
		getActivity().getActionBar().setListNavigationCallbacks(spinnerAdapter,
				new OnNavigationListener() {
					@Override
					public boolean onNavigationItemSelected(int itemPosition,
							long itemId) {
						SharedPreferences.Editor editor = PreferenceManager.getDefaultSharedPreferences(getActivity()).edit();
						editor.putInt(PreferencesActivity.CURRENT_RECORD, mCurrentRecordId);
						editor.commit();
						if(details != null){
							FragmentTransaction transaction = getActivity().getSupportFragmentManager().beginTransaction();
							transaction.remove(details);
							transaction.commit();
							details = null;
							mDetailsHintView.setVisibility(View.VISIBLE);
							mDetailsView.setVisibility(View.GONE);
						}
						mCurrentRecordId = itemPosition;
						fillRecord();
						return true;
					}
				});
	}

	public class CursorLoaderHelper implements LoaderCallbacks<Cursor> {

		@Override
		public Loader<Cursor> onCreateLoader(int id, Bundle args) {
			CursorLoader mLoader = null;
			Uri mUri;
			String language = PreferencesActivity
					.getRecordLanguage(getActivity());
			switch (id) {
			case LOADER_STUDENT:
				mUri = GradesContract.CONTENT_NAME_ALL;
				String[] subjectsProjection = {
						// Student information
						GradesContract.StudentsTable.COL_ST_NAME,
						GradesContract.StudentsTable.COL_ST_SURNAME_1,
						GradesContract.StudentsTable.COL_ST_SURNAME_2,
						GradesContract.StudentsTable.COL_ST_NIA,
						GradesContract.StudentsTable.COL_ST_NIF,
						GradesContract.StudentsTable.COL_ST_NIP,
						// Course information + id
						GradesContract.CoursesTable.TABLE_NAME + "."
								+ GradesContract.CoursesTable._ID,
						GradesContract.CoursesTable.COL_CO_CENTER,
						GradesContract.CoursesTable.COL_CO_LANGUAGE,
						GradesContract.CoursesTable.COL_CO_NAME,
						GradesContract.CoursesTable.COL_CO_PASSED_CREDITS,
						GradesContract.CoursesTable.COL_CO_STUDIES,
						GradesContract.CoursesTable.COL_CO_TOTAL_CREDITS,
						// Subject information
						GradesContract.SubjectsTable.COL_SU_CO_CODE,
						GradesContract.SubjectsTable.COL_SU_CREDITS,
						GradesContract.SubjectsTable.COL_SU_LANGUAGE,
						GradesContract.SubjectsTable.COL_SU_NAME,
						GradesContract.SubjectsTable.COL_SU_TYPE,
						// Grade information
						GradesContract.GradesTable.COL_GR_ASSISTED,
						GradesContract.GradesTable.COL_GR_CALL,
						GradesContract.GradesTable.COL_GR_CALL_NUMBER,
						GradesContract.GradesTable.COL_GR_CODE,
						GradesContract.GradesTable.COL_GR_GRADE,
						GradesContract.GradesTable.COL_GR_GRADE_NAME,
						GradesContract.GradesTable.COL_GR_LANGUAGE,
						GradesContract.GradesTable.COL_GR_PASSED,
						GradesContract.GradesTable.COL_GR_PROVISIONAL,
						GradesContract.GradesTable.COL_GR_REVISION_TIME,
						GradesContract.GradesTable.COL_GR_SU_CODE,
						GradesContract.GradesTable.COL_GR_TIME,
						GradesContract.GradesTable.COL_GR_YEAR

				};
				String studentSelection = GradesContract.CoursesTable.COL_CO_LANGUAGE
						+ "=?";
				String[] studentSelectionArgs = { language };
				mLoader = new CursorLoader(getActivity(), mUri,
						subjectsProjection, studentSelection,
						studentSelectionArgs, null);
				break;
			default:
				break;
			}
			return mLoader;
		}

		@Override
		public void onLoadFinished(Loader<Cursor> loader, Cursor cursor) {
			switch (loader.getId()) {
			case LOADER_STUDENT:
				fillStudent(cursor);
				break;
			default:
				break;
			}
		}

		@Override
		public void onLoaderReset(Loader<Cursor> loader) {
			loader.reset();
		}
	}

	public class AsyncHelper implements LoaderCallbacks<String> {

		@Override
		public Loader<String> onCreateLoader(int id, Bundle args) {
			Loader<String> loader = null;
			switch (id) {
			case LOADER_CONNECTION:
				ActionBarActivity activity = (ActionBarActivity) getActivity();
				activity.getActionBarHelper().setRefreshActionItemState(true);
				showProgress(true, PROGRESS_SIGN_IN);
				loader = new ConnectLoader(getActivity(), args);
				break;
			case LOADER_PARSER:
				showProgress(true, PROGRESS_PARSE);
				loader = new GradesParserLoader(getActivity(), args);
				break;
			default:
				break;
			}
			return loader;
		}

		@Override
		public void onLoadFinished(Loader<String> loader, String response) {
			switch (loader.getId()) {
			case LOADER_CONNECTION:
				showProgress(false, PROGRESS_SIGN_IN);
				ActionBarActivity activity = (ActionBarActivity) getActivity();
				activity.getActionBarHelper().setRefreshActionItemState(true);
				try {
					JSONObject object = new JSONObject(response);
					int error = object.getInt(GradesParserLoader.nError);
					if (error == 0) {
						Bundle args = new Bundle();
						args.putString(RecordActivity.EXTRA_DOWNLOADED_DATA,
								response);
						getActivity().getSupportLoaderManager().initLoader(
								LOADER_PARSER, args, new AsyncHelper());
					} else {
						failedDownload(response, ConnectLoader.ERROR_JSON);
					}
				} catch (JSONException e) {
					Log.d(ConnectLoader.logging,
							"Error in response from server: " + response);
					failedDownload(response, ConnectLoader.ERROR_NO_JSON);
				} catch (Exception e) {
					e.printStackTrace();
				}
				break;
			case LOADER_PARSER:
				showProgress(false, PROGRESS_PARSE);
				if (response.equalsIgnoreCase(GradesParserLoader.PARSE_FAILED)) {
					Toast.makeText(getActivity(), R.string.error_parsing,
							Toast.LENGTH_LONG).show();
				} else {
					getActivity().getSupportLoaderManager().initLoader(
							LOADER_STUDENT, null, new CursorLoaderHelper());
				}
				break;
			default:
				break;
			}
		}

		@Override
		public void onLoaderReset(Loader<String> loader) {
			loader.reset();
		}
	}

	/**
	 * Just to fill in the student information. Also sets the Student of the
	 * class. The student contains the information for all the records the
	 * student has available. This should make possible to do everything in a
	 * single blow.
	 * 
	 * @param c
	 *            Cursor with the details from the database
	 */
	public void fillStudent(Cursor c) {

		if (c.moveToFirst()) {
			mStudent = new Student(c);

			TextView mStudentNameView = (TextView) getActivity().findViewById(
					R.id.student_name);
			TextView mStudentNiaView = (TextView) getActivity().findViewById(
					R.id.student_nia);
			TextView mStudentNifView = (TextView) getActivity().findViewById(
					R.id.student_nif);
			mStudentNameView.setText(mStudent.mStudentFullName);
			mStudentNiaView.setText(getString(R.string.header_nia)
					+ mStudent.mStudentNia);
			mStudentNifView.setText(getString(R.string.header_nif)
					+ mStudent.mStudentNif);

			setCourse();
		}
	}

	private void setCourse() {
		if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.HONEYCOMB) {
			fillSpinner();
		} else {
			// TODO
		}
		fillRecord();

	}

	public void fillRecord() {
		mCurrentRecord = mStudent.mRecordList.get(mCurrentRecordId);
		String[] subjectsFrom = { GradesContract.SubjectsTable.COL_SU_NAME,
				GradesContract.SubjectsTable.COL_SU_CREDITS,
				GradesContract.GradesTable.COL_GR_CODE };
		int[] subjectsTo = { R.id.record_item_name, R.id.record_item_credits,
				R.id.record_item_grade };
		TextView courseNameView = (TextView) getActivity().findViewById(
				R.id.record_course);
		TextView courseCenterView = (TextView) getActivity().findViewById(
				R.id.record_center);
		TextView courseStudiesView = (TextView) getActivity().findViewById(
				R.id.record_studies);
		courseNameView.setText(mCurrentRecord.mCourseName);
		courseCenterView.setText(mCurrentRecord.mCourseCenter);
		courseStudiesView.setText(mCurrentRecord.mCourseStudies);
		SimpleAdapter adapter = new SimpleAdapter(getActivity(),
				prepareRecordList(), R.layout.record_list_item, subjectsFrom,
				subjectsTo);
		setListAdapter(adapter);
		if (details != null) {
			details.setSubject(mCurrentRecord.mSubjectsList.get(0));
		}
	}

	public ArrayList<HashMap<String, String>> prepareRecordList() {
		ArrayList<HashMap<String, String>> result = new ArrayList<HashMap<String, String>>();
		ArrayList<String> subjectsList = new ArrayList<String>();
		for (int i = 0; i < mCurrentRecord.mSubjectsList.size(); i++) {
			Subject subject = mCurrentRecord.mSubjectsList.get(i);
			HashMap<String, String> item = new HashMap<String, String>();
			item.put(GradesContract.SubjectsTable.COL_SU_NAME,
					subject.mSubjectName);
			item.put(GradesContract.SubjectsTable.COL_SU_CREDITS,
					getString(R.string.subject_credits)
							+ subject.mSubjectCredits);
			item.put(
					GradesContract.GradesTable.COL_GR_CODE,
					subject.mGradesList.get(subject.mGradesList.size() - 1).mGradeLetter);
			if (!subjectsList.contains(subject.mSubjectName)) {
				result.add(item);
				subjectsList.add(subject.mSubjectName);
			}
		}
		return result;
	}

	public void fillSpinner() {
		String[] from = { GradesContract.CoursesTable.COL_CO_NAME };
		int[] to = { android.R.id.text1 };
		SpinnerAdapter adapter = new SimpleAdapter(getActivity(),
				prepareSpinnerList(),
				android.R.layout.simple_spinner_dropdown_item, from, to);
		setSpinnerAdapter(adapter);
	}

	public ArrayList<HashMap<String, String>> prepareSpinnerList() {
		ArrayList<HashMap<String, String>> result = new ArrayList<HashMap<String, String>>();
		for (int i = 0; i < mStudent.mRecordCount; i++) {
			HashMap<String, String> item = new HashMap<String, String>();
			item.put(GradesContract.CoursesTable.COL_CO_NAME,
					mStudent.mRecordList.get(i).mCourseName);
			result.add(item);
		}
		return result;
	}

	@SuppressLint("NewApi")
	private boolean isSmallScreen() {
		boolean result;

		if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.HONEYCOMB_MR2) {
			result = getResources().getConfiguration().isLayoutSizeAtLeast(
					Configuration.SCREENLAYOUT_SIZE_LARGE) ? false : true;
		} else {
			// Configuration.SCREENLAYOUT_SIZE_XLARGE has a value of 4, but
			// was introduced in API 9, so we use its numeric value
			result = (getResources().getConfiguration().screenLayout & Configuration.SCREENLAYOUT_SIZE_MASK) < 3;
		}
		return result;
	}

	public void failedDownload(String response, int errorCode) {
		switch (errorCode) {
		case ConnectLoader.ERROR_JSON:
			Toast.makeText(getActivity(), response, Toast.LENGTH_LONG).show();
			break;
		case ConnectLoader.ERROR_NO_JSON:
			if (response.contains("HTTP Status 403")
					|| response.contains("HTTP Status 401")) {
				Toast.makeText(getActivity(), R.string.error_login,
						Toast.LENGTH_LONG).show();
			} else {
				Toast.makeText(getActivity(), R.string.error_connecting,
						Toast.LENGTH_LONG).show();
			}
			break;
		default:
			break;
		}
	}
}