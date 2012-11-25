package com.suicune.notasupna;

import android.annotation.TargetApi;
import android.app.ActionBar;
import android.content.res.Configuration;
import android.os.Build;
import android.os.Bundle;

public class DetailsActivity extends ActionBarActivity {
	@TargetApi(Build.VERSION_CODES.HONEYCOMB)
	@Override
	protected void onCreate(Bundle savedInstanceState) {
		if (getResources().getConfiguration().orientation
	            == Configuration.ORIENTATION_LANDSCAPE) {
	        // If the screen is now in landscape mode, we can show the
	        // dialog in-line with the list so we don't need this activity.
	        finish();
	        return;
	    }

	    if (savedInstanceState == null && Build.VERSION.SDK_INT >= 11) {
	        // During initial setup, plug in the details fragment.
	    	getActionBar().setDisplayHomeAsUpEnabled(true);
	    	getActionBar().setDisplayOptions(ActionBar.DISPLAY_HOME_AS_UP|ActionBar.DISPLAY_SHOW_HOME|ActionBar.DISPLAY_SHOW_TITLE);
	    	getActionBar().setNavigationMode(ActionBar.NAVIGATION_MODE_STANDARD);
	        DetailsFragment details = new DetailsFragment();
	        details.setArguments(getIntent().getExtras());
	        getSupportFragmentManager().beginTransaction().add(android.R.id.content, details).commit();
	    }
		super.onCreate(savedInstanceState);
	}
}
