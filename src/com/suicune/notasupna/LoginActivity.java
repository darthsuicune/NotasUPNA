package com.suicune.notasupna;

import org.json.JSONException;
import org.json.JSONObject;

import android.animation.Animator;
import android.animation.AnimatorListenerAdapter;
import android.annotation.TargetApi;
import android.content.ContentValues;
import android.content.Intent;
import android.database.Cursor;
import android.net.Uri;
import android.os.Build;
import android.os.Bundle;
import android.support.v4.app.LoaderManager.LoaderCallbacks;
import android.support.v4.content.CursorLoader;
import android.support.v4.content.Loader;
import android.text.TextUtils;
import android.util.Log;
import android.view.KeyEvent;
import android.view.Menu;
import android.view.View;
import android.view.inputmethod.EditorInfo;
import android.widget.EditText;
import android.widget.TextView;
import android.widget.Toast;

import com.suicune.notasupna.database.GradesContract;
import com.suicune.notasupna.helpers.ConnectLoader;
import com.suicune.notasupna.helpers.GradesParserLoader;

/**
 * Activity which displays a login screen to the user, offering registration as
 * well.
 */
public class LoginActivity extends ActionBarActivity {

	// Values for username and password at the time of the login attempt.
	private String mUserName;
	private String mPassWord;

	// UI references.
	private EditText mUserNameView;
	private EditText mPassWordView;
	private View mLoginFormView;
	private View mLoginStatusView;
	private TextView mLoginStatusMessageView;
	
	private static final int LOADER_CONNECTION = 1;
	private static final int LOADER_CHECK_DATA = 2;
	
	private static final int ACTIVITY_RECORD = 1;
	
	private static final int ERROR_JSON = 1;
	private static final int ERROR_NO_JSON = 2;

	@Override
	protected void onCreate(Bundle savedInstanceState) {
		super.onCreate(savedInstanceState);
//		fillDB();
		getSupportLoaderManager().initLoader(LOADER_CHECK_DATA, null, new CursorLoaderHelper());
	}
	
	private void fillDB(){
		Uri uri = GradesContract.CONTENT_NAME_STUDENTS;
		ContentValues cv = new ContentValues();
		cv.put(GradesContract.StudentsTable.COL_ST_NAME, "Denis");
		cv.put(GradesContract.StudentsTable.COL_ST_SURNAME_1, "Lapuente");
		cv.put(GradesContract.StudentsTable.COL_ST_SURNAME_2, "Goicoechea");
		cv.put(GradesContract.StudentsTable.COL_ST_NIA, "48139");
		cv.put(GradesContract.StudentsTable.COL_ST_NIF, "72811172A");
		getContentResolver().insert(uri, cv);

		uri = GradesContract.CONTENT_NAME_COURSES;
		ContentValues cvcourse = new ContentValues();
		cvcourse.put(GradesContract.CoursesTable.COL_CO_CENTER, "ETSIIT");
		cvcourse.put(GradesContract.CoursesTable.COL_CO_LANGUAGE, "es");
		cvcourse.put(GradesContract.CoursesTable.COL_CO_NAME, "ITIG");
		cvcourse.put(GradesContract.CoursesTable.COL_CO_PASSED_CREDITS, "225");
		cvcourse.put(GradesContract.CoursesTable.COL_CO_STUDIES, "ITI");
		cvcourse.put(GradesContract.CoursesTable.COL_CO_TOTAL_CREDITS, "225");
		getContentResolver().insert(uri, cvcourse);
		
		ContentValues cvcourseeu = new ContentValues();
		cvcourseeu.put(GradesContract.CoursesTable.COL_CO_CENTER, "ETSIITak");
		cvcourseeu.put(GradesContract.CoursesTable.COL_CO_LANGUAGE, "eu");
		cvcourseeu.put(GradesContract.CoursesTable.COL_CO_NAME, "ITIGak");
		cvcourseeu.put(GradesContract.CoursesTable.COL_CO_PASSED_CREDITS, "225");
		cvcourseeu.put(GradesContract.CoursesTable.COL_CO_STUDIES, "ITIak");
		cvcourseeu.put(GradesContract.CoursesTable.COL_CO_TOTAL_CREDITS, "225");
		getContentResolver().insert(uri, cvcourseeu);
		
		uri = GradesContract.CONTENT_NAME_SUBJECTS;
		Uri uri1 = GradesContract.CONTENT_NAME_GRADES;
		for(int i = 0; i < 5; i++){
			ContentValues subject = new ContentValues();
			subject.put(GradesContract.SubjectsTable.COL_SU_CREDITS, "6");
			subject.put(GradesContract.SubjectsTable.COL_SU_LANGUAGE, "es");
			subject.put(GradesContract.SubjectsTable.COL_SU_NAME, "Subject " + i);
			subject.put(GradesContract.SubjectsTable.COL_SU_TYPE, "Troncal");
			subject.put(GradesContract.SubjectsTable.COL_SU_CO_CODE, "1");
			getContentResolver().insert(uri, subject);
			for(int j = 0; j < 2; j++){
				ContentValues grade = new ContentValues();
				grade.put(GradesContract.GradesTable.COL_GR_ASSISTED, "Si");
				grade.put(GradesContract.GradesTable.COL_GR_CALL, "Septiembre" );
				grade.put(GradesContract.GradesTable.COL_GR_CALL_NUMBER, "1");
				grade.put(GradesContract.GradesTable.COL_GR_CODE, "A");
				grade.put(GradesContract.GradesTable.COL_GR_GRADE, "5" + j);
				grade.put(GradesContract.GradesTable.COL_GR_GRADE_NAME, "Aprobado");
				grade.put(GradesContract.GradesTable.COL_GR_LANGUAGE, "es");
				grade.put(GradesContract.GradesTable.COL_GR_PASSED, "Si");
				grade.put(GradesContract.GradesTable.COL_GR_PROVISIONAL, "No");
				grade.put(GradesContract.GradesTable.COL_GR_REVISION_TIME, "0");
				grade.put(GradesContract.GradesTable.COL_GR_SU_CODE, 1 + i);
				grade.put(GradesContract.GradesTable.COL_GR_TIME, "0" + j);
				grade.put(GradesContract.GradesTable.COL_GR_YEAR, "2012");
				getContentResolver().insert(uri1, grade);
			}
		}
		
		
		
	}

	@Override
	public boolean onCreateOptionsMenu(Menu menu) {
		super.onCreateOptionsMenu(menu);
		getMenuInflater().inflate(R.menu.activity_login, menu);
		return true;
	}
	
	public void showLoginScreen(){
		setContentView(R.layout.activity_login);

		// Set up the login form.
		mUserName = PreferencesActivity.getUserName(this);
		mUserNameView = (EditText) findViewById(R.id.user_name);
		mUserNameView.setText(mUserName);

		mPassWordView = (EditText) findViewById(R.id.password);
		mPassWordView.setOnEditorActionListener(new TextView.OnEditorActionListener() {
					@Override
					public boolean onEditorAction(TextView textView, int id, KeyEvent keyEvent) {
						if (id == R.id.login || id == EditorInfo.IME_NULL) {
							attemptLogin();
							return true;
						}
						return false;
					}
				});

		mLoginFormView = findViewById(R.id.login_form);
		mLoginStatusView = findViewById(R.id.login_status);
		mLoginStatusMessageView = (TextView) findViewById(R.id.login_status_message);

		findViewById(R.id.sign_in_button).setOnClickListener(
				new View.OnClickListener() {
					@Override
					public void onClick(View view) {
						attemptLogin();
					}
				});
	}

	/**
	 * Attempts to sign in the account specified by the login form.
	 * If there are form errors (invalid id, missing fields, etc.), the
	 * errors are presented and no actual login attempt is made.
	 */
	public void attemptLogin() {

		// Reset errors.
		mUserNameView.setError(null);
		mPassWordView.setError(null);

		// Store values at the time of the login attempt.
		mUserName = mUserNameView.getText().toString();
		mPassWord = mPassWordView.getText().toString();

		boolean cancel = false;
		View focusView = null;

		// Check for a valid password.
		if (TextUtils.isEmpty(mPassWord)) {
			mPassWordView.setError(getString(R.string.error_field_required));
			focusView = mPassWordView;
			cancel = true;
		} else if (mPassWord.length() < 1) {
			mPassWordView.setError(getString(R.string.error_invalid_password));
			focusView = mPassWordView;
			cancel = true;
		}

		// Check for a valid ID
		if (TextUtils.isEmpty(mUserName)) {
			mUserNameView.setError(getString(R.string.error_field_required));
			focusView = mUserNameView;
			cancel = true;
		}

		if (cancel) {
			// There was an error; don't attempt login and focus the first
			// form field with an error.
			focusView.requestFocus();
		} else {
			// Show a progress spinner, and kick off a background task to
			// perform the user login attempt.
			mLoginStatusMessageView.setText(R.string.login_progress_signing_in);
			showProgress(true);
			
			Bundle args = new Bundle();
			args.putString(PreferencesActivity.PREFERENCE_USER_NAME, mUserName);
			args.putString(PreferencesActivity.PREFERENCE_PASS_WORD, mPassWord);
			
			
			getSupportLoaderManager().restartLoader(LOADER_CONNECTION, args, new ConnectionHelper());
		}
	}

	/**
	 * Shows the progress UI and hides the login form.
	 */
	@TargetApi(Build.VERSION_CODES.HONEYCOMB_MR2)
	private void showProgress(final boolean show) {
		// On Honeycomb MR2 we have the ViewPropertyAnimator APIs, which allow
		// for very easy animations. If available, use these APIs to fade-in
		// the progress spinner.
		if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.HONEYCOMB_MR2) {
			int shortAnimTime = getResources().getInteger(
					android.R.integer.config_shortAnimTime);

			mLoginStatusView.setVisibility(View.VISIBLE);
			mLoginStatusView.animate().setDuration(shortAnimTime)
					.alpha(show ? 1 : 0)
					.setListener(new AnimatorListenerAdapter() {
						@Override
						public void onAnimationEnd(Animator animation) {
							mLoginStatusView.setVisibility(show ? View.VISIBLE
									: View.GONE);
						}
					});

			mLoginFormView.setVisibility(View.VISIBLE);
			mLoginFormView.animate().setDuration(shortAnimTime)
					.alpha(show ? 0 : 1)
					.setListener(new AnimatorListenerAdapter() {
						@Override
						public void onAnimationEnd(Animator animation) {
							mLoginFormView.setVisibility(show ? View.GONE
									: View.VISIBLE);
						}
					});
		} else {
			// The ViewPropertyAnimator APIs are not available, so simply show
			// and hide the relevant UI components.
			mLoginStatusView.setVisibility(show ? View.VISIBLE : View.GONE);
			mLoginFormView.setVisibility(show ? View.GONE : View.VISIBLE);
		}
	}
	
	public void doLogin(String response){
		Intent intent = new Intent(this, RecordActivity.class);
		if(response != null){
			PreferencesActivity.saveLoginData(getApplicationContext(), mUserName, mPassWord);
			intent.putExtra(RecordActivity.EXTRA_DOWNLOADED_DATA, response);
		}
		startActivityForResult(intent, ACTIVITY_RECORD);
		this.finish();
	}
	
	public void failedLogin(String response, int errorCode){
		showProgress(false);
		switch(errorCode){
		case ERROR_JSON:
			Toast.makeText(getApplicationContext(), response, Toast.LENGTH_LONG).show();
			break;
		case ERROR_NO_JSON:
			if(response.contains("HTTP Status 403") || response.contains("HTTP Status 401")){
				Toast.makeText(getApplicationContext(), R.string.error_login, Toast.LENGTH_LONG).show();
			}else{
				Toast.makeText(getApplicationContext(), R.string.error_connecting, Toast.LENGTH_LONG).show();
			}
			break;
		default:
			break;
		}
	}
	
	public class ConnectionHelper implements LoaderCallbacks<String>{

		@Override
		public Loader<String> onCreateLoader(int id, Bundle args) {
			return new ConnectLoader(LoginActivity.this, args);
		}

		@Override
		public void onLoadFinished(Loader<String> loader, String response) {
			if(response == null){
				Toast.makeText(getApplicationContext(), R.string.error_connection, Toast.LENGTH_LONG).show();
			}else{
				try{
					JSONObject object = new JSONObject(response);
					int error = object.getInt(GradesParserLoader.nError);
					if(error == 0){
						doLogin(response);
					}else{
						String errorMsg = object.getString(GradesParserLoader.nErrorMsg);
						failedLogin(errorMsg, ERROR_JSON);
					}
				}catch(JSONException e){
					Log.d(ConnectLoader.logging, "Error in response from server: " + response);
					failedLogin(response, ERROR_NO_JSON);
				}catch(Exception e){
					e.printStackTrace();
				}
			}
		}

		@Override
		public void onLoaderReset(Loader<String> loader) {
			loader.reset();
		}
	}
	
	public class CursorLoaderHelper implements LoaderCallbacks<Cursor>{

		@Override
		public Loader<Cursor> onCreateLoader(int id, Bundle args) {
			CursorLoader loader = null;
			switch(id){
			case LOADER_CHECK_DATA:
				Uri uri = GradesContract.CONTENT_NAME_STUDENTS;
				String[] projection = {
						GradesContract.StudentsTable._ID
				};
				loader = new CursorLoader(getApplicationContext(), uri, projection, null, null, null);
				break;
			default:
				break;
			}
			return loader;
		}

		@Override
		public void onLoadFinished(Loader<Cursor> loader, Cursor cursor) {
			switch(loader.getId()){
			case LOADER_CHECK_DATA:
				if(cursor.getCount() == 0){
					showLoginScreen();
				}else{
					doLogin(null);
				}
				break;
			default:
				break;
			}
		}

		@Override
		public void onLoaderReset(Loader<Cursor> cursor) {
			// TODO Auto-generated method stub
			
		}
		
	}
}
