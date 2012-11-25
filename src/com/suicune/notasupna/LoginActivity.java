package com.suicune.notasupna;

import org.json.JSONException;
import org.json.JSONObject;

import android.animation.Animator;
import android.animation.AnimatorListenerAdapter;
import android.annotation.TargetApi;
import android.content.Intent;
import android.os.Build;
import android.os.Bundle;
import android.support.v4.app.LoaderManager.LoaderCallbacks;
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

import com.suicune.notasupna.helpers.ConnectLoader;
import com.suicune.notasupna.helpers.GradesParser;

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
	
	private static final int ACTIVITY_RECORD = 1;
	
	private static final int ERROR_OBJECT = 1;
	private static final int ERROR_NO_JSON = 2;

	@Override
	protected void onCreate(Bundle savedInstanceState) {
		super.onCreate(savedInstanceState);

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

	@Override
	public boolean onCreateOptionsMenu(Menu menu) {
		super.onCreateOptionsMenu(menu);
		getMenuInflater().inflate(R.menu.activity_login, menu);
		return true;
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
			PreferencesActivity.saveLoginData(getApplicationContext(), mUserName, mPassWord);
			getSupportLoaderManager().initLoader(LOADER_CONNECTION, null, new ConnectionHelper());
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
		Intent intent = new Intent();
		intent.setAction(RecordActivity.class.getName());
		intent.putExtra(RecordActivity.EXTRA_DOWNLOADED_DATA, response);
		startActivityForResult(intent, ACTIVITY_RECORD);
		this.finish();
	}
	
	public void failedLogin(String response, int errorCode){
		showProgress(false);
		switch(errorCode){
		case ERROR_OBJECT:
			Toast.makeText(getApplicationContext(), R.string.error_grades, Toast.LENGTH_LONG).show();
			break;
		case ERROR_NO_JSON:
			if(response.contains("403")){
				
			}else if(response.contains("404")){
				
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
			try{
				JSONObject object = new JSONObject(response);
				int error = object.getInt(GradesParser.nError);
				if(error == 0){
					doLogin(response);
				}else{
					failedLogin(response, ERROR_OBJECT);
				}
			}catch(JSONException e){
				Log.d(ConnectLoader.logging, "Error in response from server: " + response);
				failedLogin(response, ERROR_NO_JSON);
			}catch(Exception e){
				e.printStackTrace();
			}
		}

		@Override
		public void onLoaderReset(Loader<String> loader) {
			// TODO Auto-generated method stub
			
		}
	}
}
