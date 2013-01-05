package com.suicune.notasupna;

import org.json.JSONException;
import org.json.JSONObject;

import android.animation.Animator;
import android.animation.AnimatorListenerAdapter;
import android.annotation.TargetApi;
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

	@Override
	protected void onCreate(Bundle savedInstanceState) {
		super.onCreate(savedInstanceState);
		getSupportLoaderManager().initLoader(LOADER_CHECK_DATA, null,
				new CursorLoaderHelper());
	}

	@Override
	public boolean onCreateOptionsMenu(Menu menu) {
		super.onCreateOptionsMenu(menu);
		getMenuInflater().inflate(R.menu.action_bar_login, menu);
		return true;
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
		if (TextUtils.isEmpty(mUserName)) {
			mUserNameView.setError(getString(R.string.error_field_required));
			focusView = mUserNameView;
			cancel = true;
		} else if (!isId()) {
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

	private boolean isId() {
		boolean result = false;

		// Foreigners
		if (mUserName.startsWith("X")
				&& TextUtils.isDigitsOnly(mUserName.substring(1, 8))) {
			if (checkLetter()) {
				result = true;
			}
		} else if (mUserName.startsWith("Y")
				&& TextUtils.isDigitsOnly(mUserName.substring(1, 8))) {
			if (checkLetter()) {
				result = true;
			}
		} else if (mUserName.startsWith("Z")
				&& TextUtils.isDigitsOnly(mUserName.substring(1, 8))) {
			if (checkLetter()) {
				result = true;
			}
		}
		// Check spanish DNI
		if (mUserName.length() == 9) {
			if (TextUtils.isDigitsOnly(mUserName.substring(0, 8))
					&& checkLetter()) {
				result = true;
			}
		} else if (mUserName.length() == 8 && TextUtils.isDigitsOnly(mUserName)) {
			mUserName = mUserName + getLetter(mUserName);
		}

		return result;
	}

	private char getLetter(String dni) {
		char letter = 0;
		int id = Integer.parseInt(dni);
		switch (id % 23) {
		case 0:
			letter = 'T';
			break;
		case 1:
			letter = 'R';
			break;
		case 2:
			letter = 'W';
			break;
		case 3:
			letter = 'A';
			break;
		case 4:
			letter = 'G';
			break;
		case 5:
			letter = 'M';
			break;
		case 6:
			letter = 'Y';
			break;
		case 7:
			letter = 'F';
			break;
		case 8:
			letter = 'P';
			break;
		case 9:
			letter = 'D';
			break;
		case 10:
			letter = 'X';
			break;
		case 11:
			letter = 'B';
			break;
		case 12:
			letter = 'N';
			break;
		case 13:
			letter = 'J';
			break;
		case 14:
			letter = 'Z';
			break;
		case 15:
			letter = 'S';
			break;
		case 16:
			letter = 'Q';
			break;
		case 17:
			letter = 'V';
			break;
		case 18:
			letter = 'H';
			break;
		case 19:
			letter = 'L';
			break;
		case 20:
			letter = 'C';
			break;
		case 21:
			letter = 'K';
			break;
		case 22:
			letter = 'E';
			break;
		default:
			break;
		}
		return letter;
	}

	private boolean checkLetter() {
		return mUserName.charAt(mUserName.length() - 1) == getLetter(mUserName);
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
			PreferencesActivity.saveLoginData(getApplicationContext(),
					mUserName, mPassWord);
			intent.putExtra(RecordActivity.EXTRA_DOWNLOADED_DATA, response);
		}
		startActivityForResult(intent, ACTIVITY_RECORD);
		this.finish();
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
			showProgress(false);
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
		}

		@Override
		public void onLoaderReset(Loader<String> loader) {
			loader.reset();
		}
	}

	public class CursorLoaderHelper implements LoaderCallbacks<Cursor> {

		@Override
		public Loader<Cursor> onCreateLoader(int id, Bundle args) {
			CursorLoader loader = null;
			switch (id) {
			case LOADER_CHECK_DATA:
				Uri uri = GradesContract.CONTENT_NAME_STUDENTS;
				String[] projection = { GradesContract.StudentsTable._ID };
				loader = new CursorLoader(getApplicationContext(), uri,
						projection, null, null, null);
				break;
			default:
				break;
			}
			return loader;
		}

		@Override
		public void onLoadFinished(Loader<Cursor> loader, Cursor cursor) {
			switch (loader.getId()) {
			case LOADER_CHECK_DATA:
				if (cursor.getCount() == 0) {
					showLoginScreen();
				} else {
					doLogin(null);
				}
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
}
