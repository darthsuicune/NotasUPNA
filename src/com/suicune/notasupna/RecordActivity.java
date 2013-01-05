package com.suicune.notasupna;

import android.annotation.SuppressLint;
import android.app.ActionBar;
import android.os.Build;
import android.os.Bundle;
import android.support.v4.app.FragmentTransaction;

@SuppressLint("NewApi")
public class RecordActivity extends ActionBarActivity {
	public static final String EXTRA_DOWNLOADED_DATA = "downloaded data";
	
	@Override
	protected void onCreate(Bundle savedInstanceState) {
		super.onCreate(savedInstanceState);

		setContentView(R.layout.record);

		if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.HONEYCOMB) {
			ActionBar actionBar = getActionBar();
			actionBar.setDisplayShowTitleEnabled(false);
			actionBar.setNavigationMode(ActionBar.NAVIGATION_MODE_LIST);
		}
	}

	@Override
	protected void onResume() {
		RecordFragment recordFragment = RecordFragment.getInstance();
		FragmentTransaction transaction = getSupportFragmentManager().beginTransaction();
		transaction.replace(R.id.record_record_fragment, recordFragment);
		super.onResume();
	}
}
