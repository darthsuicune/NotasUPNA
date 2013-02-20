package com.suicune.notasupna.helpers;

import java.io.BufferedReader;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.net.MalformedURLException;
import java.net.URL;
import java.util.Date;

import org.apache.http.HttpResponse;
import org.apache.http.auth.AuthScope;
import org.apache.http.auth.UsernamePasswordCredentials;
import org.apache.http.client.CredentialsProvider;
import org.apache.http.client.methods.HttpGet;
import org.apache.http.impl.client.DefaultHttpClient;
import org.apache.http.params.BasicHttpParams;
import org.apache.http.params.HttpConnectionParams;
import org.apache.http.params.HttpParams;

import android.content.Context;
import android.content.SharedPreferences;
import android.net.ConnectivityManager;
import android.os.Bundle;
import android.preference.PreferenceManager;
import android.support.v4.content.AsyncTaskLoader;

import com.suicune.notasupna.PreferencesActivity;
import com.suicune.notasupna.R;

public class ConnectLoader extends AsyncTaskLoader<String> {
	public static final String logging = "UpnaGrades_connect";
	public static final String server = "upnaexp.unavarra.es";
	public static final int port = 19090;
	public static final String resource_es = "/sigdroid-rest/resources/obtenerCalificaciones?idioma=es&pais=ES&av="
			+ android.os.Build.VERSION.RELEASE + "&sv=1.7&os=ANDROID";
	public static final String resource_eu = "/sigdroid-rest/resources/obtenerCalificaciones?idioma=eu&pais=ES&av="
			+ android.os.Build.VERSION.RELEASE + "&sv=1.7&os=ANDROID";
	private Context mContext;
	private String mUserName, mPassWord;

	public static final int ERROR_JSON = 1;
	public static final int ERROR_NO_JSON = 2;

	public ConnectLoader(Context context, Bundle args) {
		super(context);
		mContext = context;
		if (args == null || args.isEmpty()) {
			this.mUserName = PreferencesActivity.getUserName(context);
			this.mPassWord = PreferencesActivity.getPassWord(context);
		} else {
			this.mUserName = args
					.getString(PreferencesActivity.PREFERENCE_USER_NAME);
			this.mPassWord = args
					.getString(PreferencesActivity.PREFERENCE_PASS_WORD);
		}
	}

	public static boolean isConnected(Context context) {
		ConnectivityManager connection = (ConnectivityManager) context
				.getSystemService(Context.CONNECTIVITY_SERVICE);
		return (connection.getActiveNetworkInfo().isAvailable() && connection
				.getActiveNetworkInfo().isConnected());
	}

	@Override
	protected void onStartLoading() {
		forceLoad();
		super.onStartLoading();
	}

	@Override
	public String loadInBackground() {
		String language = PreferencesActivity.getRecordLanguage(mContext);
		String response = null;
		URL url = null;

		try {
			if (language
					.equalsIgnoreCase(mContext.getString(R.string.language_code_basque))) {
				url = new URL("https", server, port, resource_eu);
			} else {
				url = new URL("https", server, port, resource_es);
			}
		} catch (MalformedURLException e) {
			e.printStackTrace();
		}

		/*
		 * Using the Apache libraries for connections allows easy handling of
		 * HTTP requests as this one. UsernamePasswordCredentials allows use of
		 * username and password for HTTP authentication both in HTTP and HTTPS.
		 * HttpGet allows us to make a Http GET petition to the server to
		 * retrieve the data using just the url we set on the PreExecute stage
		 * of the task.
		 */
		HttpParams httpParams = new BasicHttpParams();
		HttpConnectionParams.setConnectionTimeout(httpParams, 10000);
		HttpConnectionParams.setSoTimeout(httpParams, 15000);

		DefaultHttpClient httpClient = new DefaultHttpClient(httpParams);
		CredentialsProvider credentials = httpClient.getCredentialsProvider();
		credentials.setCredentials(AuthScope.ANY,
				new UsernamePasswordCredentials(mUserName, mPassWord));
		httpClient.setCredentialsProvider(credentials);
		HttpGet request = new HttpGet(url.toExternalForm());

		/*
		 * To parse the response we need to look for general Exceptions, because
		 * we get a lot of different ones, all meaning the same: The connection
		 * didn't went right. Providing we've already checked connection and
		 * tunnel, it must be a filtering proxy or a server error, so we will
		 * just cancel the task and exit with a message. The HttpResponse class
		 * allows us to get a full response for any well-formed request.
		 */
		try {
			HttpResponse httpResponse = httpClient.execute(request);
			InputStream input = httpResponse.getEntity().getContent();
			BufferedReader reader = new BufferedReader(new InputStreamReader(
					input));
			response = reader.readLine();
		} catch (Exception e) {
			response = null;
			e.printStackTrace();
		}
		SharedPreferences.Editor editor = PreferenceManager.getDefaultSharedPreferences(mContext).edit();
		editor.putLong(PreferencesActivity.LAST_UPDATE, new Date().getTime());
		editor.commit();

		return response;
	}
}