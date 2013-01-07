package com.suicune.notasupna;

import java.util.Date;

import android.annotation.SuppressLint;
import android.app.FragmentTransaction;
import android.content.Context;
import android.content.SharedPreferences;
import android.os.Build;
import android.os.Bundle;
import android.preference.Preference;
import android.preference.Preference.OnPreferenceChangeListener;
import android.preference.PreferenceActivity;
import android.preference.PreferenceManager;
import android.text.format.DateFormat;

import com.suicune.notasupna.helpers.CryptoBlock;

@SuppressLint("NewApi")
@SuppressWarnings("deprecation")
public class PreferencesActivity extends PreferenceActivity implements
		OnPreferenceChangeListener {
	public static final int RESULT_LANGUAGE_CHANGED = 123;

	public static final String LAST_UPDATE = "last update";
	public static final String DATA_EU = "data euskara";
	public static final String DATA_ES = "data spanish";

	public static final String CURRENT_RECORD = "current record";

	public static final String LAST_COURSE_VIEWED = "last course viewed";
	public static final String LAST_SUBJECT_VIEWED = "last subject viewed";

	public static final String PREFERENCE_UPDATE_TIME = "update_time";

	public static final String PREFERENCE_USER_NAME = "userName";
	public static final String PREFERENCE_PASS_WORD = "login token";

	private SharedPreferences prefs;
	
	Preference languagePreference;
	Preference sortOrderPreference;

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
		GeneralPreferencesFragment generalPreferences = new GeneralPreferencesFragment();

		FragmentTransaction transaction = getFragmentManager()
				.beginTransaction();
		transaction.add(android.R.id.content, generalPreferences);
		transaction.commit();
	}

	private void loadPreferences() {
		this.addPreferencesFromResource(R.xml.preferences_activity);
		
		prepareLanguagePreference();
		prepareSortOrderPreference();
		showLastUpdate();
	} 
	
	private void prepareLanguagePreference(){
		languagePreference = findPreference(getString(R.string.preference_record_language));
		languagePreference.setOnPreferenceChangeListener(this);
		changeSummary(languagePreference, prefs.getString(
				getString(R.string.preference_record_language),
				getString(R.string.default_language)));
	}
	
	private void prepareSortOrderPreference(){
		sortOrderPreference = findPreference(getString(R.string.preference_sort_order));
		sortOrderPreference.setOnPreferenceChangeListener(this);
		changeSummary(sortOrderPreference, prefs.getString(
				getString(R.string.preference_sort_order),
				getString(R.string.sort_order_time_desc)));
	}

	@Override
	public boolean onPreferenceChange(Preference preference, Object newValue) {
		// Language changed
		if (preference.getKey().equals(
				getString(R.string.preference_record_language))) {
//			String newLanguage = (String) newValue;
			setResult(RESULT_LANGUAGE_CHANGED);
		}
		changeSummary(preference, newValue);
		return true;
	}

	private void changeSummary(Preference preference, Object newValue) {
		// Language changed
		if (preference.getKey().equals(
				getString(R.string.preference_record_language))) {
			String newLanguage = (String) newValue;
			if (newLanguage.equals(getString(R.string.language_code_basque))) {
				preference.setSummary(R.string.basque);
			} else if (newLanguage
					.equals(getString(R.string.language_code_spanish))) {
				preference.setSummary(R.string.spanish);
			}

			// Sort order changed
		} else if (preference.getKey().equals(
				getString(R.string.preference_sort_order))) {
			String newOrder = (String) newValue;
			if (newOrder.equals(getString(R.string.sort_order_alpha_asc_value))) {
				preference.setSummary(R.string.sort_order_alpha_asc);
			} else if (newOrder
					.equals(getString(R.string.sort_order_alpha_desc_value))) {
				preference.setSummary(R.string.sort_order_alpha_desc);
			} else if (newOrder
					.equals(getString(R.string.sort_order_time_asc_value))) {
				preference.setSummary(R.string.sort_order_time_asc);
			} else if (newOrder
					.equals(getString(R.string.sort_order_time_desc_value))) {
				preference.setSummary(R.string.sort_order_time_desc);
			}
		}
	}
	
	private void showLastUpdate() {
		Preference lastUpdatePreference = findPreference(getString(R.string.last_update));
		long longLastUpdate = prefs.getLong(PreferencesActivity.LAST_UPDATE, 0);
		if(longLastUpdate == 0){
			lastUpdatePreference.setSummary(R.string.no_data_yet);
		} else {
			Date lastUpdate = new Date(longLastUpdate);
			String time = DateFormat.getTimeFormat(this).format(lastUpdate);
			String date = DateFormat.getDateFormat(this)
					.format(lastUpdate);
			lastUpdatePreference.setSummary(date + " - " + time);
		}
	}

	public static String getRecordLanguage(Context context) {
		return PreferenceManager.getDefaultSharedPreferences(context)
				.getString(
						context.getString(R.string.preference_record_language),
						context.getString(R.string.language_code_spanish));
	}

	public static String getSortOrder(Context context) {
		return PreferenceManager.getDefaultSharedPreferences(context)
				.getString(context.getString(R.string.preference_sort_order),
						context.getString(R.string.sort_order_time_desc_value));
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