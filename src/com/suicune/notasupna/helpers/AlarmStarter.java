package com.suicune.notasupna.helpers;

import android.app.AlarmManager;
import android.app.PendingIntent;
import android.content.BroadcastReceiver;
import android.content.Context;
import android.content.Intent;
import android.content.SharedPreferences;
import android.preference.PreferenceManager;

import com.suicune.notasupna.PreferencesActivity;

/*
 * This class is in charge of launching the auto update service after the phone restarts itself.
 * Checks the automatic update time value and prepares an alarm to repeat itself and launch the app on the time needed.
 */
public class AlarmStarter extends BroadcastReceiver {

	@Override
	public void onReceive(Context context, Intent intent) {

		SharedPreferences prefs = PreferenceManager.getDefaultSharedPreferences(context);
		long period = Long.parseLong(prefs.getString(PreferencesActivity.PREFERENCE_UPDATE_TIME, "0"));
		long lastUpdate = prefs.getLong(PreferencesActivity.LAST_UPDATE, 0);
		AlarmManager alarm = (AlarmManager) context.getSystemService(Context.ALARM_SERVICE);
		Intent newIntent = new Intent(GradesUpdater.class.getName());
		PendingIntent operation = PendingIntent.getService(context, 0, newIntent, 0);
		
		/*
		 * The alarm will launch even if the phone is blocked (set by the RTC_WAKEUP flag) to hit the server consistently.
		 * Considered but dismissed the option of not waking up the phone. It's transparent for the user.
		 * If not set to wake up, the service would not start until the user manually wakes the phone
		 */
		if(period != 0){
			alarm.setRepeating(AlarmManager.RTC_WAKEUP, lastUpdate + period, period, operation);
		}
	}
}
