package com.suicune.notasupna;

import java.util.ArrayList;
import java.util.HashMap;

import org.json.JSONException;
import org.json.JSONObject;

import android.animation.Animator;
import android.animation.AnimatorListenerAdapter;
import android.annotation.SuppressLint;
import android.annotation.TargetApi;
import android.app.ActionBar;
import android.app.ActionBar.OnNavigationListener;
import android.app.Activity;
import android.content.Intent;
import android.content.res.Configuration;
import android.database.Cursor;
import android.net.Uri;
import android.os.Build;
import android.os.Bundle;
import android.support.v4.app.FragmentTransaction;
import android.support.v4.app.ListFragment;
import android.support.v4.app.LoaderManager;
import android.support.v4.app.LoaderManager.LoaderCallbacks;
import android.support.v4.content.CursorLoader;
import android.support.v4.content.Loader;
import android.support.v4.widget.SimpleCursorAdapter;
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
	private boolean landscape;
	private int cursorPosition = 0;

	private static final int LOADER_COURSE = 1;
	private static final int LOADER_RECORD = 2;
	private static final int LOADER_STUDENT = 3;
	private static final int LOADER_CONNECTION = 4;
	private static final int LOADER_PARSER = 5;

	private static final int ACTIVITY_PREFERENCES = 1;
	private static final int ACTIVITY_DETAILS = 2;
	
	private static final String STATE_POSITION = "cursor position";

	public static final String COURSE_ID = "course_id";

	private Record mRecord = null;
	private Student mStudent = null;

	private View mRecordView;
	private View mRecordStatusView;
	private TextView mRecordStatusMessageView;

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

		if(savedInstanceState != null){
			cursorPosition = savedInstanceState.getInt(STATE_POSITION);
		}
		this.setHasOptionsMenu(true);

		manager = getActivity().getSupportLoaderManager();
		clh = new CursorLoaderHelper();

		if(mRecord == null){
			Bundle extras = getActivity().getIntent().getExtras();
			if (extras != null) {
				manager.initLoader(LOADER_PARSER, extras, new AsyncHelper());
			}
			manager.initLoader(LOADER_STUDENT, null, clh);
			manager.initLoader(LOADER_RECORD, null, clh);
		}
		if (Build.VERSION.SDK_INT < Build.VERSION_CODES.HONEYCOMB) {
			manageOldVersion();
		}
		mRecordView = getActivity().findViewById(R.id.record_view);
		mRecordStatusView = getActivity().findViewById(R.id.record_status);
		mRecordStatusMessageView = (TextView) getActivity().findViewById(
				R.id.record_status_message);

		View detailsView = getActivity().findViewById(R.id.record_details);
		View otherCallsView = getActivity().findViewById(R.id.record_calls);
		View recordHeaderView = getActivity().findViewById(
				R.id.record_header_block);

		if ((detailsView != null)
				&& (detailsView.getVisibility() == View.VISIBLE)) {
			landscape = true;
		} else {
			landscape = false;
		}

		if (landscape) {
			if (isSmallScreen() && otherCallsView != null) {
				otherCallsView.setVisibility(View.GONE);
				recordHeaderView.setVisibility(View.GONE);
			} else {
				otherCallsView.setVisibility(View.VISIBLE);
				recordHeaderView.setVisibility(View.VISIBLE);
			}
			getListView().setChoiceMode(ListView.CHOICE_MODE_SINGLE);
			details = (DetailsFragment) getActivity()
					.getSupportFragmentManager().findFragmentById(
							R.id.record_details);
			if (mRecord != null) {
				showDetails(cursorPosition,
						mRecord.mSubjectsList.get(cursorPosition));
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
		super.onSaveInstanceState(outState);
	}

	@Override
	public void onListItemClick(ListView l, View v, int position, long id) {
		cursorPosition = position;
		showDetails(position, mRecord.mSubjectsList.get(position));
		super.onListItemClick(l, v, position, id);
	}

	@TargetApi(Build.VERSION_CODES.HONEYCOMB)
	@Override
	public void onAttach(Activity activity) {
		super.onAttach(activity);
		if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.HONEYCOMB) {
			ActionBar actionBar = activity.getActionBar();
			actionBar.setDisplayShowTitleEnabled(false);
			actionBar.setNavigationMode(ActionBar.NAVIGATION_MODE_LIST);
			getActivity().getSupportLoaderManager().initLoader(LOADER_COURSE,
					null, new CursorLoaderHelper());
		}
	}

	@Override
	public void onCreateOptionsMenu(Menu menu, MenuInflater inflater) {
		inflater.inflate(R.menu.action_bar_record, menu);
		super.onCreateOptionsMenu(menu, inflater);
	}

	@Override
	public void onActivityResult(int requestCode, int resultCode, Intent data) {
		switch (requestCode) {
		case ACTIVITY_DETAILS:
			if (resultCode == Activity.RESULT_OK) {
				if (landscape) {
					if(mRecord != null){
						fillRecord();
						showDetails(cursorPosition, (Subject) data.getExtras().getSerializable(DetailsActivity.EXTRA_SUBJECT));
					}
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

	// TODO
	private void showDetails(int position, Subject subject) {
		getListView().setItemChecked(position, true);

		if (landscape) {
			if (details == null || details.getShownIndex() != position) {
				details = DetailsFragment.newInstance(position);
				details.setSubject(subject);

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

	@TargetApi(Build.VERSION_CODES.HONEYCOMB)
	public void setSpinnerAdapter(SpinnerAdapter spinnerAdapter) {
		if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.HONEYCOMB) {
			getActivity().getActionBar().setListNavigationCallbacks(
					spinnerAdapter, new OnNavigationListener() {
						@Override
						public boolean onNavigationItemSelected(
								int itemPosition, long itemId) {
							Bundle args = new Bundle();
							args.putLong(COURSE_ID, itemId);
							getActivity().getSupportLoaderManager().initLoader(
									LOADER_RECORD, args, clh);
							return false;
						}
					});
		}
	}

	public class CursorLoaderHelper implements LoaderCallbacks<Cursor> {

		@Override
		public Loader<Cursor> onCreateLoader(int id, Bundle args) {
			CursorLoader mLoader = null;
			Uri mUri;
			String language = PreferencesActivity
					.getRecordLanguage(getActivity());
			switch (id) {
			case LOADER_COURSE:
				mUri = GradesContract.CONTENT_NAME_COURSES;
				String[] spinnerProjection = { GradesContract.CoursesTable._ID,
						GradesContract.CoursesTable.COL_CO_NAME };
				String spinnerSelection = GradesContract.CoursesTable.COL_CO_LANGUAGE
						+ "=?";
				String[] spinnerSelectionArgs = { language };
				mLoader = new CursorLoader(getActivity(), mUri,
						spinnerProjection, spinnerSelection,
						spinnerSelectionArgs, null);
				break;
			case LOADER_RECORD:
				mUri = GradesContract.CONTENT_NAME_ALL;
				String[] subjectsProjection = {
						GradesContract.CoursesTable.TABLE_NAME + "."
								+ GradesContract.CoursesTable._ID,
						GradesContract.CoursesTable.COL_CO_CENTER,
						GradesContract.CoursesTable.COL_CO_LANGUAGE,
						GradesContract.CoursesTable.COL_CO_NAME,
						GradesContract.CoursesTable.COL_CO_PASSED_CREDITS,
						GradesContract.CoursesTable.COL_CO_STUDIES,
						GradesContract.CoursesTable.COL_CO_TOTAL_CREDITS,
						GradesContract.SubjectsTable.COL_SU_CO_CODE,
						GradesContract.SubjectsTable.COL_SU_CREDITS,
						GradesContract.SubjectsTable.COL_SU_LANGUAGE,
						GradesContract.SubjectsTable.COL_SU_NAME,
						GradesContract.SubjectsTable.COL_SU_TYPE,
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
				String subjectsSelection = GradesContract.CoursesTable.COL_CO_LANGUAGE
						+ "=?";
				String[] subjectsSelectionArgs = { language };
				mLoader = new CursorLoader(getActivity(), mUri,
						subjectsProjection, subjectsSelection,
						subjectsSelectionArgs, null);

				break;
			case LOADER_STUDENT:
				mUri = GradesContract.CONTENT_NAME_STUDENTS;
				String[] studentProjection = {
						GradesContract.StudentsTable._ID,
						GradesContract.StudentsTable.COL_ST_NAME,
						GradesContract.StudentsTable.COL_ST_SURNAME_1,
						GradesContract.StudentsTable.COL_ST_SURNAME_2,
						GradesContract.StudentsTable.COL_ST_NIA,
						GradesContract.StudentsTable.COL_ST_NIF, };
				mLoader = new CursorLoader(getActivity(), mUri,
						studentProjection, null, null, null);
				break;
			default:
				break;
			}
			return mLoader;
		}

		@Override
		public void onLoadFinished(Loader<Cursor> loader, Cursor cursor) {
			switch (loader.getId()) {
			case LOADER_COURSE:
				if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.HONEYCOMB) {
					fillSpinner(cursor);
				}
				break;
			case LOADER_RECORD:
				fillRecord(cursor);
				break;
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

	/**
	 * Shows the progress UI and hides the record
	 */
	@TargetApi(Build.VERSION_CODES.HONEYCOMB_MR2)
	private void showProgress(final boolean show) {
		// On Honeycomb MR2 we have the ViewPropertyAnimator APIs, which allow
		// for very easy animations. If available, use these APIs to fade-in
		// the progress spinner.
		if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.HONEYCOMB_MR2) {
			int shortAnimTime = getResources().getInteger(
					android.R.integer.config_shortAnimTime);

			mRecordStatusView.setVisibility(View.VISIBLE);
			mRecordStatusView.animate().setDuration(shortAnimTime)
					.alpha(show ? 1 : 0)
					.setListener(new AnimatorListenerAdapter() {
						@Override
						public void onAnimationEnd(Animator animation) {
							mRecordStatusView.setVisibility(show ? View.VISIBLE
									: View.GONE);
						}
					});

			mRecordView.setVisibility(View.VISIBLE);
			mRecordView.animate().setDuration(shortAnimTime)
					.alpha(show ? 0 : 1)
					.setListener(new AnimatorListenerAdapter() {
						@Override
						public void onAnimationEnd(Animator animation) {
							mRecordView.setVisibility(show ? View.GONE
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
			mRecordView.setVisibility(show ? View.GONE : View.VISIBLE);
			mRecordStatusView.setVisibility(show ? View.VISIBLE : View.GONE);

		}
	}

	public class AsyncHelper implements LoaderCallbacks<String> {

		@Override
		public Loader<String> onCreateLoader(int id, Bundle args) {
			Loader<String> loader = null;
			switch (id) {
			case LOADER_CONNECTION:
				mRecordStatusMessageView
						.setText(R.string.login_progress_signing_in);
				showProgress(true);
				loader = new ConnectLoader(getActivity(), args);
				break;
			case LOADER_PARSER:
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
				showProgress(false);
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
				if (response.equalsIgnoreCase(GradesParserLoader.PARSE_FAILED)) {
					Toast.makeText(getActivity(), R.string.error_parsing,
							Toast.LENGTH_LONG).show();
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
	 * class.
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
		}
	}

	/**
	 * This should fill the list and set the Record of the class.
	 * 
	 * @param c
	 *            Cursor with the details from the database
	 */
	public void fillRecord(Cursor c) {
		mRecord = new Record(c);
		fillRecord();
	}

	public void fillRecord() {
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
		courseNameView.setText(mRecord.mCourseName);
		courseCenterView.setText(mRecord.mCourseCenter);
		courseStudiesView.setText(mRecord.mCourseStudies);
		SimpleAdapter adapter = new SimpleAdapter(getActivity(), prepareList(),
				R.layout.record_list_item, subjectsFrom, subjectsTo);
		setListAdapter(adapter);
		if (details != null) {
			details.setSubject(mRecord.mSubjectsList.get(0));
		}
	}

	/**
	 * 
	 * @param c
	 *            Cursor with the details from the database
	 */
	public void fillSpinner(Cursor c) {
		String[] spinnerFrom = { GradesContract.CoursesTable.COL_CO_NAME };
		int[] spinnerTo = { android.R.id.text1 };
		SpinnerAdapter spinnerAdapter = new SimpleCursorAdapter(getActivity(),
				android.R.layout.simple_spinner_dropdown_item, c, spinnerFrom,
				spinnerTo, SimpleCursorAdapter.FLAG_REGISTER_CONTENT_OBSERVER);
		setSpinnerAdapter(spinnerAdapter);
	}

	public ArrayList<HashMap<String, String>> prepareList() {
		ArrayList<HashMap<String, String>> result = new ArrayList<HashMap<String, String>>();
		ArrayList<String> subjectsList = new ArrayList<String>();
		for (int i = 0; i < mRecord.mSubjectsList.size(); i++) {
			Subject subject = mRecord.mSubjectsList.get(i);
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
}
