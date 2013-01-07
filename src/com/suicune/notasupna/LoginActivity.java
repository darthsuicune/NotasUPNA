package com.suicune.notasupna;

import org.json.JSONException;
import org.json.JSONObject;

import android.animation.Animator;
import android.animation.AnimatorListenerAdapter;
import android.annotation.TargetApi;
import android.content.Intent;
import android.content.SharedPreferences;
import android.os.Build;
import android.os.Bundle;
import android.preference.PreferenceManager;
import android.support.v4.app.LoaderManager.LoaderCallbacks;
import android.support.v4.content.Loader;
import android.text.TextUtils;
import android.util.Log;
import android.view.KeyEvent;
import android.view.Menu;
import android.view.MenuItem;
import android.view.View;
import android.view.inputmethod.EditorInfo;
import android.widget.EditText;
import android.widget.TextView;
import android.widget.Toast;

import com.suicune.notasupna.helpers.ConnectLoader;
import com.suicune.notasupna.helpers.CryptoBlock;
import com.suicune.notasupna.helpers.DNIUtils;
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

	private static final int ACTIVITY_RECORD = 1;
	private static final int ACTIVITY_PREFERENCES = 2;

	@Override
	protected void onCreate(Bundle savedInstanceState) {
		super.onCreate(savedInstanceState);

		int data = PreferenceManager.getDefaultSharedPreferences(this).getInt(PreferencesActivity.DATA_ES, 0);
		data += PreferenceManager.getDefaultSharedPreferences(this).getInt(PreferencesActivity.DATA_EU, 0);
		if (data > 0) {
			doLogin(null);
		} else { 
			showLoginScreen();
		}
	}

	@Override
	public boolean onCreateOptionsMenu(Menu menu) {
		super.onCreateOptionsMenu(menu);
		getMenuInflater().inflate(R.menu.action_bar_login, menu);
		return true;
	}

	@Override
	public boolean onOptionsItemSelected(MenuItem item) {
		switch (item.getItemId()) {
		case R.id.action_login_confirm:
			attemptLogin();
			break;
		case R.id.action_settings:
			Intent intent = new Intent(getApplicationContext(), PreferencesActivity.class);
			startActivityForResult(intent, ACTIVITY_PREFERENCES);
			break;
		case R.id.action_help:
			new AboutFragment().show(getSupportFragmentManager(), AboutFragment.DIALOG_ABOUT);
			break;
		}
		return true;
	}

	@Override
	protected void onActivityResult(int requestCode, int resultCode, Intent data) {
		super.onActivityResult(requestCode, resultCode, data);
		switch(requestCode){
		case ACTIVITY_PREFERENCES:
			if(resultCode == PreferencesActivity.RESULT_LANGUAGE_CHANGED){
				
			}
			break;
		}
	}

	public void showLoginScreen() {
		setContentView(R.layout.activity_login);

		// Set up the login form.
		mUserName = PreferencesActivity.getUserName(this);
		mUserNameView = (EditText) findViewById(R.id.user_name);

		mPassWordView = (EditText) findViewById(R.id.password);
		mPassWordView
				.setOnEditorActionListener(new TextView.OnEditorActionListener() {
					@Override
					public boolean onEditorAction(TextView textView, int id,
							KeyEvent keyEvent) {
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

		findViewById(R.id.log_in_button).setOnClickListener(
				new View.OnClickListener() {
					@Override
					public void onClick(View view) {
						attemptLogin();
					}
				});
	}

	/**
	 * Attempts to sign in the account specified by the login form. If there are
	 * form errors (invalid id, missing fields, etc.), the errors are presented
	 * and no actual login attempt is made.
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
		try{
			if (TextUtils.isEmpty(mUserName)) {
				mUserNameView.setError(getString(R.string.error_field_required));
				focusView = mUserNameView;
				cancel = true;
			} else if (!DNIUtils.isValid(mUserName)) {
				cancel = true;
				mUserNameView.setError(getString(R.string.error_invalid_id));
				focusView = mUserNameView;
			} else if (mUserName.length() == 8){
				mUserName = DNIUtils.addLetter(mUserName);
			}
		}catch(Exception e){
			cancel = true;
			mUserNameView.setError(getString(R.string.error_invalid_id));
			focusView = mUserNameView;
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

			getSupportLoaderManager().restartLoader(LOADER_CONNECTION, args,
					new ConnectionHelper());
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

	public void doLogin(String response) {
		Intent intent = new Intent(this, RecordActivity.class);
		if (response != null) {
			saveLoginData(response.length());
			intent.putExtra(RecordActivity.EXTRA_DOWNLOADED_DATA, response);
		}
		startActivityForResult(intent, ACTIVITY_RECORD);
		this.finish();
	}
	
	public void saveLoginData(int dataLength){
		SharedPreferences.Editor editor = PreferenceManager.getDefaultSharedPreferences(this).edit();
		editor.putString(PreferencesActivity.PREFERENCE_USER_NAME, mUserName.toUpperCase());
		try {
			editor.putString(PreferencesActivity.PREFERENCE_PASS_WORD,
					CryptoBlock.encrypt(mPassWord));
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		if(PreferencesActivity.getRecordLanguage(this).equalsIgnoreCase(getString(R.string.language_code_basque))){
			editor.putInt(PreferencesActivity.DATA_EU, dataLength);
		} else {
			editor.putInt(PreferencesActivity.DATA_ES, dataLength);
		}
		editor.commit();
	}

	public void failedLogin(String response, int errorCode) {
		switch (errorCode) {
		case ConnectLoader.ERROR_JSON:
			Toast.makeText(getApplicationContext(), response, Toast.LENGTH_LONG)
					.show();
			break;
		case ConnectLoader.ERROR_NO_JSON:
			if (response.contains("HTTP Status 403")
					|| response.contains("HTTP Status 401")) {
				Toast.makeText(getApplicationContext(), R.string.error_login,
						Toast.LENGTH_LONG).show();
			} else {
				Toast.makeText(getApplicationContext(),
						R.string.error_connecting, Toast.LENGTH_LONG).show();
			}
			break;
		default:
			break;
		}
	}

	public class ConnectionHelper implements LoaderCallbacks<String> {

		@Override
		public Loader<String> onCreateLoader(int id, Bundle args) {
			return new ConnectLoader(LoginActivity.this, args);
		}

		@Override
		public void onLoadFinished(Loader<String> loader, String response) {
			if (response == null) {
				Toast.makeText(getApplicationContext(),
						R.string.error_connection, Toast.LENGTH_LONG).show();
			} else {
				try {
					JSONObject object = new JSONObject(response);
					int error = object.getInt(GradesParserLoader.nError);
					switch (error) {
					case 0:
						doLogin(response);
						break;
					default:
						String errorMsg = object
								.getString(GradesParserLoader.nErrorMsg);
						failedLogin(errorMsg, ConnectLoader.ERROR_JSON);
						break;
					}
				} catch (JSONException e) {
					Log.d(ConnectLoader.logging,
							"Error in response from server: " + response);
					failedLogin(response, ConnectLoader.ERROR_NO_JSON);
				} catch (Exception e) {
					e.printStackTrace();
				}
			}
			showProgress(false);
		}

		@Override
		public void onLoaderReset(Loader<String> loader) {
			loader.reset();
		}
	}
}
