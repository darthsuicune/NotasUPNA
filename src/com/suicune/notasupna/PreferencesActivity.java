package com.suicune.notasupna;

import com.suicune.notasupna.Helpers.CryptoBlock;

import android.app.Activity;
import android.content.Context;
import android.content.SharedPreferences;
import android.os.Bundle;
import android.preference.PreferenceManager;

public class PreferencesActivity extends Activity {
	public static final String LANGUAGE_SPANISH = "es";
	public static final String LANGUAGE_BASQUE = "eu";
	public static final String LANGUAGE_ENGLISH = "en";
	
	public static final int RESULT_LANGUAGE_CHANGED = 1;
	
	public static final String LAST_UPDATE = "last update";
	public static final String DATA_EU = "data euskara";
	public static final String DATA_ES = "data spanish";
	
	public static final String PREFERENCE_UPDATE_TIME = "update time";

	public static final String PREFERENCE_RECORD_LANGUAGE = "record language";
	public static final String PREFERENCE_USER_NAME = "userName";
	public static final String PREFERENCE_PASS_WORD = "passWord";
	
	@Override
	protected void onCreate(Bundle savedInstanceState) {
		// TODO Auto-generated method stub
		super.onCreate(savedInstanceState);
	}

	public static String getRecordLanguage(Context context){
		return PreferenceManager.getDefaultSharedPreferences(context).getString(PREFERENCE_RECORD_LANGUAGE, LANGUAGE_SPANISH);
	}
	
	public static void saveLoginData(Context context, String userName, String passWord){
		SharedPreferences.Editor editor = PreferenceManager.getDefaultSharedPreferences(context).edit();
		editor.putString(PREFERENCE_USER_NAME, userName);
		try{
			editor.putString(PREFERENCE_PASS_WORD, CryptoBlock.encrypt(passWord));
		}catch(Exception e){
			e.printStackTrace();
		}
		editor.commit();
	}
	
	public static String getUserName(Context context){
		return PreferenceManager.getDefaultSharedPreferences(context).getString(PREFERENCE_USER_NAME, "");
	}
	
	public static String getPassWord(Context context){
		String result = "";
		try{
			result = CryptoBlock.decrypt(PreferenceManager.getDefaultSharedPreferences(context).getString(PREFERENCE_PASS_WORD, ""));
		}catch(Exception e){
			e.printStackTrace();
		}
		return result;
	}
}
