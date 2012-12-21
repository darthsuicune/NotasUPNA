package com.suicune.notasupna;

import org.json.JSONException;
import org.json.JSONObject;

import android.annotation.TargetApi;
import android.app.ActionBar;
import android.app.ActionBar.OnNavigationListener;
import android.app.Activity;
import android.content.Context;
import android.content.Intent;
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
import android.view.MenuItem;
import android.view.View;
import android.view.ViewGroup;
import android.widget.ListView;
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
 * -Called
 * -With/without extras
 * 	-if extras then we have to parse the information before doing anything else.
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
	
	private static final String COURSE_ID = "course_id";
	
	private Record mRecord = null;
	private Student mStudent = null;
	private long mCourseId = 0;

	LoaderManager manager = null;

	@Override
	public void onCreate(Bundle savedInstanceState) {
		super.onCreate(savedInstanceState);
		
		manager = getActivity().getSupportLoaderManager();
		CursorLoaderHelper clh = new CursorLoaderHelper();
		
		Bundle extras = getActivity().getIntent().getExtras();
		if(extras != null){
			Bundle args = new Bundle();
			args.putString(RecordActivity.EXTRA_DOWNLOADED_DATA, extras.getString(RecordActivity.EXTRA_DOWNLOADED_DATA));
			manager.initLoader(LOADER_PARSER, args, new AsyncHelper());
		}
		if(Build.VERSION.SDK_INT >= Build.VERSION_CODES.HONEYCOMB){
			manager.initLoader(LOADER_COURSE, null, clh);
		}else{
			manageOldVersion();
		}
		manager.initLoader(LOADER_STUDENT, null, clh);
		manager.initLoader(LOADER_RECORD, null, clh);
	}
	
	/**
	 * This method should allow for changing the degree when needed on older versions.
	 * Basically, activate a visual element to allow for changing degrees
	 * TODO
	 */
	private void manageOldVersion(){
		
	}
	
	@Override
	public View onCreateView(LayoutInflater inflater, ViewGroup container, Bundle savedInstanceState) {
		return inflater.inflate(R.layout.record_fragment, container);
	}

	@Override
	public void onActivityCreated(Bundle savedInstanceState) {
		super.onActivityCreated(savedInstanceState);
		
		View detailsView = getActivity().findViewById(R.id.record_details);

		if((detailsView != null) && (detailsView.getVisibility() == View.VISIBLE)){
			landscape = true;
		}else{
			landscape = false;
		}

		if(landscape){
			getListView().setChoiceMode(ListView.CHOICE_MODE_SINGLE);
			showDetails(cursorPosition, mRecord.mSubjectsList.get(cursorPosition));
		}
	}

	@Override
	public void onSaveInstanceState(Bundle outState) {
		outState.putInt("cursorPosition", cursorPosition);
		super.onSaveInstanceState(outState);
	}

	@Override
	public void onListItemClick(ListView l, View v, int position, long id) {
		Subject subject = mRecord.mSubjectsList.get(position);
		showDetails(position, subject);
		super.onListItemClick(l, v, position, id);
	}

	@TargetApi(Build.VERSION_CODES.HONEYCOMB)
	@Override
	public void onAttach(Activity activity) {
		super.onAttach(activity);
		if(Build.VERSION.SDK_INT >= Build.VERSION_CODES.HONEYCOMB){
			ActionBar actionBar = activity.getActionBar();
			actionBar.setDisplayShowTitleEnabled(false);
			actionBar.setNavigationMode(ActionBar.NAVIGATION_MODE_LIST);
			getActivity().getSupportLoaderManager().initLoader(LOADER_COURSE, null, new CursorLoaderHelper());
		}
	}
	
	@TargetApi(Build.VERSION_CODES.HONEYCOMB)
	private OnNavigationListener getOnNavigationListenerCallback() {
		if(Build.VERSION.SDK_INT >= Build.VERSION_CODES.HONEYCOMB){
			return new OnNavigationListener() {
				
				@Override
				public boolean onNavigationItemSelected(int itemPosition, long itemId) {
					Bundle args = new Bundle();
					args.putLong(COURSE_ID, itemId);
					getActivity().getSupportLoaderManager().initLoader(LOADER_RECORD, args, new CursorLoaderHelper());
					return false;
				}
			};
		}else{
			return null;
		}
	}

	@Override
	public boolean onOptionsItemSelected(MenuItem item) {
		switch(item.getItemId()){
		case R.id.action_record_refresh:
			getActivity().getSupportLoaderManager().initLoader(LOADER_CONNECTION, null, new AsyncHelper());
			break;
		case R.id.action_record_preferences:
			Intent intent = new Intent();
			intent.setAction(PreferencesActivity.class.getName());
			startActivityForResult(intent, ACTIVITY_PREFERENCES);
			break;
		case R.id.action_record_close_session:
			//Should show a Dialog to warn about the user about closing session and then close everything
			//TODO
			break;
		default:
			break;
		}
		return super.onOptionsItemSelected(item);
	}
	
	//TODO
	private void showDetails(int position, Subject subject){
		cursorPosition = position;
	
		getListView().setItemChecked(position, true);
		
		if(landscape){
			DetailsFragment details = (DetailsFragment) getActivity().getSupportFragmentManager().findFragmentById(R.id.record_details);
			if(details == null || details.getShownIndex() != position){
				details = DetailsFragment.newInstance(cursorPosition);
				details.setSubject(subject);
				
				FragmentTransaction ft = getFragmentManager().beginTransaction();
				ft.replace(R.id.record_details, details);
				ft.setTransition(FragmentTransaction.TRANSIT_FRAGMENT_FADE);
				ft.commit();
			}			
		}else{
			Intent intent = new Intent();
			intent.setClass(getActivity(), DetailsActivity.class);
			intent.putExtra("index", position);
			startActivity(intent);
		}
	}
	
	public void failedDownload(){
		Toast.makeText(getActivity(), R.string.error_downloading, Toast.LENGTH_LONG).show();
	}
	
	@TargetApi(Build.VERSION_CODES.HONEYCOMB)
	public void setSpinnerAdapter(SpinnerAdapter mSpinnerAdapter){
		if(Build.VERSION.SDK_INT >= Build.VERSION_CODES.HONEYCOMB){
			getActivity().getActionBar().setListNavigationCallbacks(mSpinnerAdapter, new OnNavigationListener() {
				@Override
				public boolean onNavigationItemSelected(int itemPosition, long itemId) {
					Bundle args = new Bundle();
					args.putLong(COURSE_ID, itemId);
					getActivity().getSupportLoaderManager().initLoader(LOADER_RECORD, null, new CursorLoaderHelper());
					return false;
				}
			});
		}
	}

	
	public class CursorLoaderHelper implements LoaderCallbacks<Cursor>{

		@Override
		public Loader<Cursor> onCreateLoader(int id, Bundle args) {
			CursorLoader mLoader = null;
			Uri mUri;
			String language = PreferencesActivity.getRecordLanguage(getActivity());
			switch(id){
			case LOADER_COURSE:
				mUri = GradesContract.CONTENT_NAME_COURSES;
				String[] spinnerProjection = {
						GradesContract.CoursesTable._ID,
						GradesContract.CoursesTable.COL_CO_NAME
				};
				String spinnerSelection = GradesContract.CoursesTable.COL_CO_LANGUAGE + "=?";
				String[] spinnerSelectionArgs = {
						language
				};
				mLoader = new CursorLoader(getActivity(), mUri, spinnerProjection, spinnerSelection, spinnerSelectionArgs, null);
				break;
			case LOADER_RECORD:
				mUri = GradesContract.CONTENT_NAME_ALL;
				String[] subjectsProjection = {
						"*"
				};
				String subjectsSelection = 
						GradesContract.SubjectsTable.COL_SU_LANGUAGE + "=? AND " + 
						GradesContract.SubjectsTable.COL_SU_CO_CODE + " =?";
				String[] subjectsSelectionArgs = {
						language,
						Long.toString(mCourseId)
				};
				mLoader = new CursorLoader(getActivity(), mUri, subjectsProjection, subjectsSelection, subjectsSelectionArgs, null);

				break;
			case LOADER_STUDENT:
				mUri = GradesContract.CONTENT_NAME_STUDENTS;
				String[] studentProjection = {
					GradesContract.StudentsTable._ID,
					GradesContract.StudentsTable.COL_ST_NAME,
					GradesContract.StudentsTable.COL_ST_SURNAME_1,
					GradesContract.StudentsTable.COL_ST_SURNAME_2,
					GradesContract.StudentsTable.COL_ST_NIA,
					GradesContract.StudentsTable.COL_ST_NIF,
				};
				mLoader = new CursorLoader(getActivity(), mUri, studentProjection, null, null, null);
				break;
			default:
				break;
			}
			return mLoader;
		}

		@Override
		public void onLoadFinished(Loader<Cursor> loader, Cursor cursor) {
			switch (loader.getId()){
			case LOADER_COURSE:
				if(Build.VERSION.SDK_INT >= Build.VERSION_CODES.HONEYCOMB){
					fillSpinner(cursor);
				}
				if(cursor.moveToFirst()){
					mCourseId = cursor.getLong(cursor.getColumnIndex(GradesContract.CoursesTable._ID));
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
			// TODO Auto-generated method stub
			
		}
	}
	
	public class AsyncHelper implements LoaderCallbacks<String>{

		@Override
		public Loader<String> onCreateLoader(int id, Bundle args) {
			Loader<String> loader = null;
			switch (id){
			case LOADER_CONNECTION:
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
			switch(loader.getId()){
			case LOADER_CONNECTION:
				try{
					JSONObject object = new JSONObject(response);
					int error = object.getInt(GradesParserLoader.nError);
					if(error == 0){
						Bundle args = new Bundle();
						args.putString(RecordActivity.EXTRA_DOWNLOADED_DATA, response);
						getActivity().getSupportLoaderManager().initLoader(LOADER_PARSER, args, new AsyncHelper());
					}else{
						failedDownload();
					}
				}catch(JSONException e){
					Log.d(ConnectLoader.logging, "Error in response from server: " + response);
					failedDownload();
				}catch(Exception e){
					e.printStackTrace();
				}
				break;
			case LOADER_PARSER:
				if(response.equalsIgnoreCase(GradesParserLoader.PARSE_FAILED)){
					Toast.makeText(getActivity(), R.string.error_parsing, Toast.LENGTH_LONG).show();
				}
				break;
			default:
				break;
			}
		}

		@Override
		public void onLoaderReset(Loader<String> loader) {
			// TODO Auto-generated method stub
		}
	}

	/**
	 * Just to fill in the student information. Also sets the Student of the class.
	 * @param c Cursor with the details from the database
	 */
	public void fillStudent(Cursor c){
		if(c.moveToFirst()){
			mStudent = new Student(c);
			 
			TextView mStudentNameView = (TextView) getActivity().findViewById(R.id.student_name);
			TextView mStudentNiaView = (TextView) getActivity().findViewById(R.id.student_nia);
			TextView mStudentNifView = (TextView) getActivity().findViewById(R.id.student_nif);
			mStudentNameView.setText(mStudent.mStudentFullName);
			mStudentNiaView.setText(mStudent.mStudentNia);
			mStudentNifView.setText(mStudent.mStudentNif);
		}
	}
	/**
	 * This should fill the list and set the Record of the class. 
	 * @param c Cursor with the details from the database
	 */
	public void fillRecord(Cursor c){
		mRecord = new Record(c);
		String[] subjectsFrom = {
				GradesContract.SubjectsTable.COL_SU_NAME,
				GradesContract.SubjectsTable.COL_SU_CREDITS,
				GradesContract.GradesTable.COL_GR_CODE
		};
		int[] subjectsTo = {
				R.id.record_item_name,
				R.id.record_item_credits,
				R.id.record_item_grade
		};
		RecordAdapter simpleCursorAdapter = new RecordAdapter(getActivity(), android.R.layout.simple_list_item_1, c, subjectsFrom, subjectsTo, SimpleCursorAdapter.FLAG_REGISTER_CONTENT_OBSERVER);
		setListAdapter(simpleCursorAdapter);
	}
	
	/**
	 * 
	 * @param c Cursor with the details from the database
	 */
	public void fillSpinner(Cursor c){
		String[] spinnerFrom = {
				GradesContract.CoursesTable.COL_CO_NAME
		};
		int[] spinnerTo = {
			android.R.id.text1	
		};
		SpinnerAdapter spinnerAdapter = new SimpleCursorAdapter(getActivity(), android.R.layout.simple_dropdown_item_1line, c, spinnerFrom, spinnerTo, SimpleCursorAdapter.FLAG_REGISTER_CONTENT_OBSERVER);
		setSpinnerAdapter(spinnerAdapter);
	}
	
	public class RecordAdapter extends SimpleCursorAdapter{

		public RecordAdapter(Context context, int layout, Cursor c, String[] from, int[] to, int flags) {
			super(context, layout, c, from, to, flags);
			// TODO Auto-generated constructor stub
			
		}
	}
}
