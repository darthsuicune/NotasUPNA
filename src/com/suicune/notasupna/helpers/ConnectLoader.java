package com.suicune.notasupna.helpers;

import java.net.MalformedURLException;
import java.net.URL;
import java.util.Date;

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

	private Context mContext;
	private GradesClient mClient;

	private String mUserName;
	private String mPassWord;

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
				.getActiveNetworkInfo().isConnectedOrConnecting());
	}

	@Override
	protected void onStartLoading() {
		if (mClient == null) {
			forceLoad();
		}
	}

	@Override
	public String loadInBackground() {
		URL url;
		String language = PreferencesActivity.getRecordLanguage(mContext);
		try {
			if (language.equals(mContext
					.getString(R.string.language_code_basque))) {
				url = new URL("https", GradesClient.server, GradesClient.port,
						GradesClient.resource_eu);
			} else {
				url = new URL("https", GradesClient.server, GradesClient.port,
						GradesClient.resource_es);
			}
			mClient = new GradesClient(url, mUserName, mPassWord);
		} catch (MalformedURLException e) {
			e.printStackTrace();
			return null;
		}
		// String response = mClient.connectToServer();
		String response;
		if (language.equalsIgnoreCase(mContext
				.getString(R.string.language_code_basque))) {
			response = mContext.getString(R.string.demodata_eu);
		} else {
			response =  mContext.getString(R.string.demodata);
		}

		SharedPreferences.Editor editor = PreferenceManager
				.getDefaultSharedPreferences(mContext).edit();
		editor.putLong(PreferencesActivity.LAST_UPDATE, new Date().getTime());
		editor.commit();
		return response;
	}
}