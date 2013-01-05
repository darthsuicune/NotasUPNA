package com.suicune.notasupna;

import android.annotation.SuppressLint;
import android.app.FragmentTransaction;
import android.content.Context;
import android.content.SharedPreferences;
import android.os.Build;
import android.os.Bundle;
import android.preference.PreferenceActivity;
import android.preference.PreferenceManager;

import com.suicune.notasupna.helpers.CryptoBlock;

@SuppressLint("NewApi")
public class PreferencesActivity extends PreferenceActivity {
	public static final String LANGUAGE_SPANISH = "es";
	public static final String LANGUAGE_BASQUE = "eu";
	public static final String LANGUAGE_ENGLISH = "en";

	public static final int RESULT_LANGUAGE_CHANGED = 123;

	public static final String LAST_UPDATE = "last update";
	public static final String DATA_EU = "data euskara";
	public static final String DATA_ES = "data spanish";
	public static final String LAST_COURSE_VIEWED = "last course viewed";
	public static final String LAST_SUBJECT_VIEWED = "last course viewed";

	public static final String PREFERENCE_UPDATE_TIME = "update time";

	public static final String PREFERENCE_RECORD_LANGUAGE = "record language";
	public static final String PREFERENCE_APP_LANGUAGE = "language";
	public static final String PREFERENCE_USER_NAME = "userName";
	public static final String PREFERENCE_PASS_WORD = "passWord";

	private SharedPreferences prefs;

	@Override
	protected void onCreate(Bundle savedInstanceState) {
		super.onCreate(savedInstanceState);

		prefs = PreferenceManager
				.getDefaultSharedPreferences(getApplicationContext());
		/**
		 * As the preferences for the new API are not in the support library, we
		 * need to act in different ways depending on the version of the device
		 */
		if (Build.VERSION.SDK_INT >= 11) {
			loadFragments();
		} else {
			loadPreferences();
		}
	}

	private void loadFragments() {
		FragmentTransaction transaction = getFragmentManager()
				.beginTransaction();
		transaction.add(android.R.id.content, new GeneralPreferencesFragment());
		transaction.commit();
	}

	@SuppressWarnings("deprecation")
	private void loadPreferences() {
		this.addPreferencesFromResource(R.xml.preferences_activity);
	}

	public static String getRecordLanguage(Context context) {
		return PreferenceManager.getDefaultSharedPreferences(context)
				.getString(PREFERENCE_RECORD_LANGUAGE, LANGUAGE_SPANISH);
	}

	public static void saveLoginData(Context context, String userName,
			String passWord) {
		SharedPreferences.Editor editor = PreferenceManager
				.getDefaultSharedPreferences(context).edit();
		editor.putString(PREFERENCE_USER_NAME, userName);
		try {
			editor.putString(PREFERENCE_PASS_WORD,
					CryptoBlock.encrypt(passWord));
		} catch (Exception e) {
			e.printStackTrace();
		}
		editor.commit();
	}

	public static String getUserName(Context context) {
		return PreferenceManager.getDefaultSharedPreferences(context)
				.getString(PREFERENCE_USER_NAME, "");
	}

	public static String getPassWord(Context context) {
		String result = "";
		try {
			result = CryptoBlock.decrypt(PreferenceManager
					.getDefaultSharedPreferences(context).getString(
							PREFERENCE_PASS_WORD, ""));
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}
}
