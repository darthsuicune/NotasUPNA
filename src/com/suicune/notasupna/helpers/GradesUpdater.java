package com.suicune.notasupna.helpers;

import java.net.MalformedURLException;
import java.net.URL;

import org.json.JSONException;
import org.json.JSONObject;

import android.app.IntentService;
import android.app.Notification;
import android.app.NotificationManager;
import android.app.PendingIntent;
import android.content.Context;
import android.content.Intent;
import android.content.SharedPreferences;
import android.support.v4.app.NotificationCompat;
import android.util.Log;

import com.suicune.notasupna.PreferencesActivity;
import com.suicune.notasupna.R;
import com.suicune.notasupna.RecordActivity;

public class GradesUpdater extends IntentService {
	/*
	 * Constant definitions
	 */
	// Used for logging
	public static final String SERVICE_NAME = "NotasUPNA_service";
	public static final int SERVICE_ID = 1;

	// Constant for the notification we're launching
	public static final int NOTIFICATION_NEW_GRADES = 1;

	private GradesClient mClient;
	private String mLanguage;
	private SharedPreferences prefs;

	private URL mUrl;

	/*
	 * Public constructor. Mandatory to pass a String with the name in the
	 * super() on classes that extend IntentService
	 */
	public GradesUpdater() {
		super(SERVICE_NAME);

	}

	/*
	 * Mandatory override for IntentService. It allows us to tell the service
	 * what to do when a new Intent is received. The IntentService is handled by
	 * the system with a single thread and work queue. We will chech if
	 * connected and launch the service if we are.
	 */
	@Override
	protected void onHandleIntent(Intent intent) {
		String passWord = PreferencesActivity.getPassWord(this);
		String userName = PreferencesActivity.getUserName(this);
		try {
			if (mLanguage.equals(getString(R.string.language_code_basque))) {
				mUrl = new URL("https", GradesClient.server, GradesClient.port,
						GradesClient.resource_eu);
			} else {
				mUrl = new URL("https", GradesClient.server, GradesClient.port,
						GradesClient.resource_es);
			}
		} catch (MalformedURLException e) {
			e.printStackTrace();
		}
		mClient = new GradesClient(mUrl, userName, passWord);

		if (ConnectLoader.isConnected(this)) {
			parseResponse(mClient.connectToServer());
			prefs.edit()
					.putLong(PreferencesActivity.LAST_UPDATE,
							System.currentTimeMillis()).commit();
		}
	}

	private void parseResponse(String response) {
		if (response == null) {
			Log.d(SERVICE_NAME, "Download error. No Response from server.");
		} else {
			try {
				int length;
				new JSONObject(response);

				if (mLanguage
						.equalsIgnoreCase(getString(R.string.language_code_basque))) {
					length = prefs.getInt(PreferencesActivity.DATA_EU, 0);
				} else {
					length = prefs.getInt(PreferencesActivity.DATA_ES, 0);
				}
				if (length != response.length()) {
					if (mLanguage
							.equalsIgnoreCase(getString(R.string.language_code_basque))) {
						prefs.edit()
								.putLong(PreferencesActivity.DATA_EU, length)
								.commit();
					} else {
						prefs.edit()
								.putLong(PreferencesActivity.DATA_ES, length)
								.commit();
					}
					sendNotification(response);
				} else {
					// Show a info message in the logcat to say that no new data
					// has
					// been downloading.
					Log.i(SERVICE_NAME, "Download success, no new data");
				}
			} catch (JSONException e) {
				Log.d(SERVICE_NAME, "Download error. Response from server: "
						+ response);
			}
		}
	}

	/*
	 * In case we get new grades we will show a notification in the system tray.
	 * This notification will use the default system configuration for
	 * notifications.
	 * 
	 * TODO add configuration for the notifications.
	 */
	private void sendNotification(String response) {
		// Get the notification manager service from the system
		NotificationManager mNotificationManager = (NotificationManager) getSystemService(Context.NOTIFICATION_SERVICE);

		// Prepare the intent to call when the notification is clicked
		Intent notificationIntent = new Intent(this, RecordActivity.class);
		notificationIntent.addFlags(Intent.FLAG_FROM_BACKGROUND);
		notificationIntent.addFlags(Intent.FLAG_ACTIVITY_CLEAR_TOP);
		if (response != null) {
			notificationIntent.putExtra(RecordActivity.EXTRA_DOWNLOADED_DATA,
					response);
		}
		PendingIntent pendingIntent = PendingIntent.getActivity(this, 0,
				notificationIntent, PendingIntent.FLAG_CANCEL_CURRENT);

		// Set the notification values
		NotificationCompat.Builder builder = new NotificationCompat.Builder(
				getApplicationContext());
		builder.setSmallIcon(R.drawable.upna_logo);
		builder.setTicker(getString(R.string.notification_ticker));
		builder.setWhen(System.currentTimeMillis());
		builder.setContentIntent(pendingIntent);
		builder.setContentTitle(getString(R.string.notification_title));
		builder.setContentText(getString(R.string.notification_ticker));
		builder.setAutoCancel(true);
		Notification notification = builder.build();
		notification.defaults = Notification.DEFAULT_ALL;

		// Launch the notification
		mNotificationManager.notify(NOTIFICATION_NEW_GRADES, notification);
	}
}
