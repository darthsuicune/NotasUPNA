package com.suicune.notasupna;

import java.util.Date;

import android.annotation.TargetApi;
import android.app.AlarmManager;
import android.app.PendingIntent;
import android.content.Context;
import android.content.Intent;
import android.content.SharedPreferences;
import android.os.Build;
import android.os.Bundle;
import android.preference.Preference;
import android.preference.Preference.OnPreferenceChangeListener;
import android.preference.PreferenceFragment;
import android.preference.PreferenceManager;
import android.text.format.DateFormat;

import com.suicune.notasupna.helpers.GradesUpdater;

@TargetApi(Build.VERSION_CODES.HONEYCOMB)
public class GeneralPreferencesFragment extends PreferenceFragment implements
		OnPreferenceChangeListener {

	private SharedPreferences prefs;

	@Override
	public void onCreate(Bundle savedInstanceState) {
		super.onCreate(savedInstanceState);
		addPreferencesFromResource(R.xml.preferences_activity);
		prefs = PreferenceManager.getDefaultSharedPreferences(getActivity());
	}

	@Override
	public void onActivityCreated(Bundle savedInstanceState) {

		prepareLanguage();
		prepareSortOrder();
		prepareUpdateTime();
		showLastUpdate();

		super.onActivityCreated(savedInstanceState);
	}

	private void prepareLanguage() {
		Preference languagePreference = findPreference(getString(R.string.preference_record_language));
		languagePreference.setOnPreferenceChangeListener(this);
		changeSummary(languagePreference, prefs.getString(
				getString(R.string.preference_record_language),
				getString(R.string.language_code_spanish)));
	}

	private void prepareSortOrder() {
		Preference sortOrderPreference = findPreference(getString(R.string.preference_sort_order));
		sortOrderPreference.setOnPreferenceChangeListener(this);
		changeSummary(sortOrderPreference, prefs.getString(
				getString(R.string.preference_sort_order),
				getString(R.string.sort_order_time_desc_value)));
	}

	private void prepareUpdateTime() {
		Preference updateTimePreference = findPreference(getString(R.string.preference_update_time));
		updateTimePreference.setOnPreferenceChangeListener(this);
		changeSummary(updateTimePreference, prefs.getString(
				getString(R.string.preference_update_time),
				getString(R.string.update_24_hour_value)));
	}

	private void showLastUpdate() {
		Preference lastUpdatePreference = findPreference(getString(R.string.last_update));
		long longLastUpdate = prefs.getLong(PreferencesActivity.LAST_UPDATE, 0);
		if (longLastUpdate == 0) {
			lastUpdatePreference.setSummary(R.string.no_data_yet);
		} else {
			Date lastUpdate = new Date(longLastUpdate);
			String time = DateFormat.getTimeFormat(getActivity()).format(
					lastUpdate);
			String date = DateFormat.getDateFormat(getActivity()).format(
					lastUpdate);
			lastUpdatePreference.setSummary(date + " - " + time);
		}
	}

	@Override
	public boolean onPreferenceChange(Preference preference, Object newValue) {
		changeSummary(preference, newValue);
		// Language changed
		if (preference.getKey().equals(
				getString(R.string.preference_record_language))) {
			// String newLanguage = (String) newValue;
			getActivity()
					.setResult(PreferencesActivity.RESULT_LANGUAGE_CHANGED);

		} else if (preference.getKey().equals(
				getString(R.string.preference_update_time))) {

			setAlarm(Long.parseLong((String) newValue));

		}
		// Sort order changed
		// else if (preference.getKey().equals(
		// getString(R.string.preference_sort_order))) {
		//
		// }
		return true;
	}

	private void changeSummary(Preference preference, Object newValue) {
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
		} else if (preference.getKey().equals(
				getString(R.string.preference_update_time))) {
			String newUpdateTime = (String) newValue;
			if (newUpdateTime
					.equals(getString(R.string.update_15_minutes_value))) {
				preference.setSummary(R.string.update_15_minutes);
			} else if (newUpdateTime.equals(getString(R.string.update_1_hour))) {
				preference.setSummary(R.string.update_1_hour);
			} else if (newUpdateTime
					.equals(getString(R.string.update_24_hour_value))) {
				preference.setSummary(R.string.update_24_hour);
			} else if (newUpdateTime
					.equals(getString(R.string.update_2_hour_value))) {
				preference.setSummary(R.string.update_2_hour);
			} else if (newUpdateTime
					.equals(getString(R.string.update_5_minutes_value))) {
				preference.setSummary(R.string.update_5_minutes);
			} else if (newUpdateTime
					.equals(getString(R.string.update_half_hour_value))) {
				preference.setSummary(R.string.update_half_hour);
			} else if (newUpdateTime
					.equals(getString(R.string.update_no_value))) {
				preference.setSummary(R.string.update_no);
			}
		}
	}

	private void setAlarm(long interval) {
		AlarmManager alarmManager = (AlarmManager) getActivity().getSystemService(Context.ALARM_SERVICE);
		Intent alarm = new Intent(getActivity(), GradesUpdater.class);
		PendingIntent operation = PendingIntent.getService(getActivity(),
				GradesUpdater.SERVICE_ID, alarm,
				PendingIntent.FLAG_CANCEL_CURRENT);
		if (interval != 0) {
			alarmManager.setRepeating(AlarmManager.RTC_WAKEUP, 0, interval, operation);
		} else {
			alarmManager.cancel(operation);
		}
	}
}