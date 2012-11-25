package com.suicune.notasupna.helpers;

import java.io.BufferedReader;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.net.MalformedURLException;
import java.net.URL;

import org.apache.http.HttpResponse;
import org.apache.http.auth.AuthScope;
import org.apache.http.auth.UsernamePasswordCredentials;
import org.apache.http.client.methods.HttpGet;
import org.apache.http.impl.client.DefaultHttpClient;

import android.app.IntentService;
import android.app.Notification;
import android.app.NotificationManager;
import android.app.PendingIntent;
import android.content.Context;
import android.content.Intent;
import android.content.SharedPreferences;
import android.preference.PreferenceManager;
import android.util.Log;

import com.suicune.notasupna.PreferencesActivity;
import com.suicune.notasupna.R;
import com.suicune.notasupna.RecordActivity;

public class GradesUpdater extends IntentService{
	/*
	 * Constant definitions
	 */
	//Used for logging
	private static final String SERVICE_NAME = "NotasUPNA_service";
	
	/*
	 * Constant for the notification we're launching
	 */
	public static final int NOTIFICATION_NEW_GRADES = 1;
	
	private SharedPreferences prefs;

	/*
	 * Public constructor. Mandatory to pass a String with the name in the super() on classes that extend IntentService
	 */
	public GradesUpdater() {
		super(SERVICE_NAME);
	}

	/*
	 * Mandatory override for IntentService. It allows us to tell the service what to do when a new Intent is received. 
	 * The IntentService is handled by the system with a single thread and work queue.
	 * We will chech if connected and launch the service if we are.
	 */
	@Override
	protected void onHandleIntent(Intent intent){
		if(ConnectLoader.isConnected(this)){
			downloadGrades();
		}
	}
	
	/*
	 * Convenience method for cleaner lecture of the code.
	 * We will retrieve the login information from the preferences, connect to the server and download the data
	 */
	private void downloadGrades(){
		prefs = PreferenceManager.getDefaultSharedPreferences(this);
		/*
		 * Retrieve login information and language
		 */
		String userName = prefs.getString(PreferencesActivity.PREFERENCE_USER_NAME, "");
		if(!userName.equalsIgnoreCase("")){
			String password = null;
			String language = PreferencesActivity.getRecordLanguage(this);
			
			try{
				password = CryptoBlock.decrypt(prefs.getString(PreferencesActivity.PREFERENCE_PASS_WORD, ""));
			}catch(Exception e){
				e.printStackTrace();
			}
			
			URL url = getServerURL(language);
			String response = connectToServer(url, userName, password);
			parseResponse(response, language);
			

		}
	}
	
	private URL getServerURL(String language){
		URL url = null;
		try{
			if(language.equalsIgnoreCase(PreferencesActivity.LANGUAGE_BASQUE)){
				url = new URL("https", ConnectLoader.server, ConnectLoader.port, ConnectLoader.resource_eu);
			}else{
				url = new URL("https", ConnectLoader.server, ConnectLoader.port, ConnectLoader.resource_eu);
			}
		}catch(MalformedURLException e){
			e.printStackTrace();
		}
		
		return url;
	}
	
	private String connectToServer(URL url, String userName, String password){
		String response = null;
		/*
		 * Using the Apache libraries for connections allows easy handling of HTTP requests as this one.
		 * UsernamePasswordCredentials allows use of username and password for HTTP authentication both in HTTP and HTTPS.
		 * HttpGet allows us to make a Http GET petition to the server to retrieve the data using just the url we set on the PreExecute stage of the task.
		 */
		DefaultHttpClient httpClient = new DefaultHttpClient();
		httpClient.getCredentialsProvider().setCredentials(AuthScope.ANY, new UsernamePasswordCredentials(userName, password));
		HttpGet request = new HttpGet(url.toExternalForm());
		
		/*
		 * To parse the response we need to look for general Exceptions, because we get a lot of different ones, all meaning the same: The connection didn't went right.
		 * Providing we've already checked connection and tunnel, it must be a filtering proxy or a server error, so we will just cancel the task and exit with a message.
		 * The HttpResponse class allows us to get a full response for any well-formed request.
		 */
		try{
			HttpResponse httpResponse = httpClient.execute(request);
			InputStream input = httpResponse.getEntity().getContent();
			BufferedReader reader = new BufferedReader(new InputStreamReader(input));
			response = reader.readLine();
		}catch(Exception e){
			e.printStackTrace();
		}
		return response;
	}
	
	private void parseResponse(String response, String language){
		if(response.contains("HTTP")){
			Log.d(SERVICE_NAME, "Download error. Respones from server: " + response);
		}else{
			int length;
			if(PreferencesActivity.getRecordLanguage(this).equalsIgnoreCase(PreferencesActivity.LANGUAGE_BASQUE)){
				length = prefs.getInt(PreferencesActivity.DATA_EU, 0);
			}else{
				length = prefs.getInt(PreferencesActivity.DATA_ES, 0);
			}
			if(length != response.length()){
				GradesParser.parseData(this, response, language);
				sendNotification();
			}else{
				//Show a info message in the logcat to say that no new data has been downloading.
				Log.i(SERVICE_NAME, "Download success, no new data");
			}
		}
	}
	
	/*
	 * In case we get new grades we will show a notification in the system tray. 
	 * This notification will use the default system configuration for notifications.
	 * 
	 * TODO add configuration for the notifications.
	 */
	private void sendNotification(){
		//Get the notification manager service from the system
		NotificationManager mNotificationManager = (NotificationManager) getSystemService(Context.NOTIFICATION_SERVICE);
		
		//Set the configuration
		int icon = R.drawable.upna_logo;
		String tickerText = getString(R.string.notification_ticker);
		long when = System.currentTimeMillis();
		
		//Set Title and Message
		String notificationTitle = getString(R.string.notification_title);
		String notificationMessage = getString(R.string.notification_ticker);
		
		//Prepare the intent to call when the notification is clicked
		Intent notificationIntent = new Intent(this, RecordActivity.class);
		PendingIntent pendingIntent = PendingIntent.getActivity(this, 0, notificationIntent, 0);
		
		//Set the notification values
		Notification notification = new Notification(icon, tickerText, when);
		notification.defaults = Notification.DEFAULT_ALL;
		notification.setLatestEventInfo(this, notificationTitle, notificationMessage, pendingIntent);
		
		//Launch the notification
		mNotificationManager.notify(NOTIFICATION_NEW_GRADES, notification);
	}
}
