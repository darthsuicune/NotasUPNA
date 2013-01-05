package com.suicune.notasupna;

import android.os.Bundle;
import android.support.v4.app.FragmentTransaction;

public class RecordActivity extends ActionBarActivity {
	public static final String EXTRA_DOWNLOADED_DATA = "downloaded data";
	
	@Override
	protected void onCreate(Bundle savedInstanceState) {
		super.onCreate(savedInstanceState);

		setContentView(R.layout.record);
	}

	@Override
	protected void onResume() {
		RecordFragment recordFragment = RecordFragment.getInstance();
		FragmentTransaction transaction = getSupportFragmentManager().beginTransaction();
		transaction.replace(R.id.record_record_fragment, recordFragment);
		super.onResume();
	}
}
