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
		SharedPreferences prefs = PreferenceManager
				.getDefaultSharedPreferences(context);
		long period = Long.parseLong(prefs.getString(
				PreferencesActivity.PREFERENCE_UPDATE_TIME, "0"));
		/*
		 * The alarm will launch even if the phone is blocked (set by the
		 * RTC_WAKEUP flag) to hit the server consistently. Considered but
		 * dismissed the option of not waking up the phone. It's transparent for
		 * the user. If not set to wake up, the service would not start until
		 * the user manually wakes the phone. Aside, by default it only checks
		 * once a day, so a single wake up should not consume too much battery.
		 */
		if (period != 0) {
			AlarmManager alarm = (AlarmManager) context
					.getSystemService(Context.ALARM_SERVICE);
			Intent newIntent = new Intent(context, GradesUpdater.class);
			PendingIntent operation = PendingIntent.getService(context, GradesUpdater.SERVICE_ID,
					newIntent, PendingIntent.FLAG_CANCEL_CURRENT);

			alarm.set(AlarmManager.RTC_WAKEUP, 0, operation);
		}
	}
}
