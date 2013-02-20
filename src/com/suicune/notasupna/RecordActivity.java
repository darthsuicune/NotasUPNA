package com.suicune.notasupna;

import android.annotation.SuppressLint;
import android.app.ActionBar;
import android.app.AlarmManager;
import android.app.PendingIntent;
import android.content.Context;
import android.content.Intent;
import android.content.SharedPreferences;
import android.os.Build;
import android.os.Bundle;
import android.preference.PreferenceManager;
import android.support.v4.app.FragmentTransaction;
import android.view.Menu;
import android.view.MenuInflater;

import com.suicune.notasupna.compat.ActionBarActivity;
import com.suicune.notasupna.fragments.RecordFragment;
import com.suicune.notasupna.helpers.GradesUpdater;

@SuppressLint("NewApi")
public class RecordActivity extends ActionBarActivity {
	public static final String EXTRA_DOWNLOADED_DATA = "downloaded data";

	private RecordFragment mRecordFragment;
	private SharedPreferences prefs;

	@Override
	protected void onCreate(Bundle savedInstanceState) {
		super.onCreate(savedInstanceState);

		prefs = PreferenceManager.getDefaultSharedPreferences(this);

		if (isFirstRun()) {
			prefs.edit().putBoolean(getString(R.string.first_run), false)
					.commit();
			setAlarm();
		}

		setContentView(R.layout.record);

		if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.HONEYCOMB) {
			ActionBar actionBar = getActionBar();
			actionBar.setDisplayShowTitleEnabled(false);
			actionBar.setNavigationMode(ActionBar.NAVIGATION_MODE_LIST);
		}
	}

	@Override
	protected void onResume() {
		mRecordFragment = RecordFragment.getInstance();
		FragmentTransaction transaction = getSupportFragmentManager()
				.beginTransaction();
		transaction.replace(R.id.record_record_fragment, mRecordFragment);
		transaction.commit();
		super.onResume();
	}

	@Override
	public boolean onCreateOptionsMenu(Menu menu) {
		MenuInflater inflater = getMenuInflater();
		inflater.inflate(R.menu.action_bar_record, menu);
		return true;
	}

	private boolean isFirstRun() {
		return PreferenceManager.getDefaultSharedPreferences(this).getBoolean(
				getString(R.string.first_run), true);
	}
	
	public void setAlarm(){
		long period = Long.parseLong(prefs.getString(
				PreferencesActivity.PREFERENCE_UPDATE_TIME, "0"));
	
		AlarmManager alarm = (AlarmManager) this
				.getSystemService(Context.ALARM_SERVICE);
		Intent newIntent = new Intent(this, GradesUpdater.class);
		PendingIntent operation = PendingIntent.getService(this, GradesUpdater.SERVICE_ID,
				newIntent, PendingIntent.FLAG_CANCEL_CURRENT);
		alarm.setRepeating(AlarmManager.RTC_WAKEUP, System.currentTimeMillis() + period, period, operation);

	}
}