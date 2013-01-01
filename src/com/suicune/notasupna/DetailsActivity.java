package com.suicune.notasupna;

import android.annotation.TargetApi;
import android.app.ActionBar;
import android.content.Intent;
import android.content.res.Configuration;
import android.os.Build;
import android.os.Bundle;

public class DetailsActivity extends ActionBarActivity {
	public static final String EXTRA_SUBJECT = "subject";
	private Subject mSubject;

	@TargetApi(Build.VERSION_CODES.HONEYCOMB)
	@Override
	protected void onCreate(Bundle savedInstanceState) {
		Bundle extras = getIntent().getExtras();
		if(savedInstanceState != null) {
			mSubject = (Subject) savedInstanceState.getSerializable(EXTRA_SUBJECT);
		}
		if (extras != null) {
			mSubject = (Subject) extras.getSerializable(EXTRA_SUBJECT);
		}
		
		if (getResources().getConfiguration().orientation == Configuration.ORIENTATION_LANDSCAPE) {
			// If the screen is now in landscape mode, we can show the
			// dialog in-line with the list so we don't need this activity.
			Intent intent = new Intent();
			intent.putExtra(EXTRA_SUBJECT, mSubject);
			setResult(RESULT_OK, intent);
			finish();
		}

		super.onCreate(savedInstanceState);
		
		setContentView(R.layout.activity_details);

		if (savedInstanceState == null && Build.VERSION.SDK_INT >= 11) {
			// During initial setup, plug in the details fragment.
			getActionBar().setDisplayHomeAsUpEnabled(true);
			getActionBar().setDisplayOptions(
					ActionBar.DISPLAY_HOME_AS_UP | ActionBar.DISPLAY_SHOW_HOME
							| ActionBar.DISPLAY_SHOW_TITLE);
			getActionBar()
					.setNavigationMode(ActionBar.NAVIGATION_MODE_STANDARD);
		}
		
		
		DetailsFragment details = (DetailsFragment) getSupportFragmentManager().findFragmentById(R.id.details_fragment);
		details.setSubject(mSubject);
	}

	@Override
	protected void onSaveInstanceState(Bundle outState) {
		if(mSubject != null){
			outState.putSerializable(EXTRA_SUBJECT, mSubject);
		}
		super.onSaveInstanceState(outState);
	}
}
