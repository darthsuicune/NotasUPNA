package com.suicune.notasupna;

import org.json.JSONException;
import org.json.JSONObject;

import android.annotation.TargetApi;
import android.app.ActionBar;
import android.app.ActionBar.OnNavigationListener;
import android.app.Activity;
import android.content.Intent;
import android.database.Cursor;
import android.net.Uri;
import android.os.Build;
import android.os.Bundle;
import android.support.v4.app.FragmentTransaction;
import android.support.v4.app.ListFragment;
import android.support.v4.app.LoaderManager.LoaderCallbacks;
import android.support.v4.content.CursorLoader;
import android.support.v4.content.Loader;
import android.support.v4.widget.SimpleCursorAdapter;
import android.util.Log;
import android.view.MenuItem;
import android.view.View;
import android.widget.ListAdapter;
import android.widget.ListView;
import android.widget.SpinnerAdapter;
import android.widget.Toast;

import com.suicune.notasupna.Database.GradesContract;
import com.suicune.notasupna.Helpers.ConnectLoader;
import com.suicune.notasupna.Helpers.GradesParser;

public class RecordFragment extends ListFragment {
	private boolean landscape;
	private int cursorPosition = 0;
	
	private static final int LOADER_SPINNER = 1;
	private static final int LOADER_SUBJECTS = 2;
	private static final int LOADER_CONNECTION = 3;
	
	private static final int ACTIVITY_PREFERENCES = 1;

	@Override
	public void onActivityCreated(Bundle savedInstanceState) {
		super.onActivityCreated(savedInstanceState);
		
		getActivity().getSupportLoaderManager().initLoader(LOADER_SUBJECTS, null, new CursorLoaderHelper());
		
		View detailsView = getActivity().findViewById(R.id.record_details);
		
		if((detailsView != null) && (detailsView.getVisibility() == View.VISIBLE)){
			landscape = true;
		}else{
			landscape = false;
		}
		
		if(landscape){
			getListView().setChoiceMode(ListView.CHOICE_MODE_SINGLE);
			showDetails(cursorPosition);
		}
	}

	@Override
	public void onSaveInstanceState(Bundle outState) {
		outState.putInt("cursorPosition", cursorPosition);
		super.onSaveInstanceState(outState);
	}

	@Override
	public void onListItemClick(ListView l, View v, int position, long id) {
		showDetails(position);
		super.onListItemClick(l, v, position, id);
	}
	
	@TargetApi(Build.VERSION_CODES.HONEYCOMB)
	@Override
	public void onAttach(Activity activity) {
		ActionBar actionBar = activity.getActionBar();
		actionBar.setDisplayShowTitleEnabled(false);
		actionBar.setNavigationMode(ActionBar.NAVIGATION_MODE_LIST);
		actionBar.setListNavigationCallbacks(getSpinnerAdapter(), getOnNavigationListenerCallback());

		super.onAttach(activity);
	}
	
	@TargetApi(Build.VERSION_CODES.HONEYCOMB)
	private OnNavigationListener getOnNavigationListenerCallback() {
		return new OnNavigationListener() {
			
			@Override
			public boolean onNavigationItemSelected(int itemPosition, long itemId) {
				// TODO Auto-generated method stub
				return false;
			}
		};
	}

	@Override
	public boolean onOptionsItemSelected(MenuItem item) {
		switch(item.getItemId()){
		case R.id.action_record_refresh:
			getActivity().getSupportLoaderManager().initLoader(LOADER_CONNECTION, null, new ConnectionLoaderHelper());
			break;
		case R.id.action_record_preferences:
			Intent intent = new Intent();
			intent.setAction(PreferencesActivity.class.getName());
			startActivityForResult(intent, ACTIVITY_PREFERENCES);
			break;
		case R.id.action_record_close_session:
			break;
		default:
			break;
		}
		return super.onOptionsItemSelected(item);
	}

	private SpinnerAdapter getSpinnerAdapter(){
		Uri uri = GradesContract.CONTENT_NAME_COURSES;
		String[] projection = {
				GradesContract.CoursesTable._ID,
				GradesContract.CoursesTable.COL_CO_NAME
		};
		String selection = GradesContract.CoursesTable.COL_CO_LANGUAGE + "=?";
		String[] selectionArgs = {
				"es"
		};
		CursorLoader courseLoader = new CursorLoader(getActivity(), uri, projection, selection, selectionArgs, null);
		String[] from = {
				GradesContract.CoursesTable.COL_CO_NAME
		};
		int[] to = {
				android.R.id.text1
		};
		
		SpinnerAdapter adapter = new SimpleCursorAdapter(getActivity(), android.R.layout.simple_spinner_dropdown_item, courseLoader.loadInBackground(), from, to, SimpleCursorAdapter.FLAG_REGISTER_CONTENT_OBSERVER);
		return adapter;
	}
	
	private void showDetails(int position){
		cursorPosition = position;
		
		getListView().setItemChecked(position, true);
		
		if(landscape){

			DetailsFragment details = (DetailsFragment) getActivity().getSupportFragmentManager().findFragmentById(R.id.record_details);
			if(details == null || details.getShownIndex() != position){
				details = DetailsFragment.newInstance(position);
				
				FragmentTransaction ft = getFragmentManager().beginTransaction();
				ft.replace(R.id.record_details, details);
				ft.setTransition(FragmentTransaction.TRANSIT_FRAGMENT_FADE);
				ft.commit();
			}			
		}else{
			Intent intent = new Intent();
			intent.setClass(getActivity(), DetailsActivity.class);
			intent.putExtra("index", position);
			startActivity(intent);
		}
	}
	
	public void failedDownload(){
		Toast.makeText(getActivity(), R.string.error_downloading, Toast.LENGTH_LONG).show();
	}
	public class CursorLoaderHelper implements LoaderCallbacks<Cursor>{

		@Override
		public Loader<Cursor> onCreateLoader(int id, Bundle args) {
			CursorLoader loader = null;
			switch(id){
			case LOADER_SPINNER:
				break;
			case LOADER_SUBJECTS:
				Uri uri = GradesContract.CONTENT_NAME_SUBJECTS;
				String[] projection = {
						GradesContract.SubjectsTable._ID,
						GradesContract.SubjectsTable.COL_SU_NAME
				};
				String selection = GradesContract.SubjectsTable.COL_SU_LANGUAGE + "=?";
				String[] selectionArgs = {
						"es"
				};
				loader = new CursorLoader(getActivity(), uri, projection, selection, selectionArgs, null);

				break;
			default:
				break;
			}
			return loader;
		}

		@Override
		public void onLoadFinished(Loader<Cursor> loader, Cursor cursor) {
			switch (loader.getId()){
			case LOADER_SPINNER:
				
				break;
			case LOADER_SUBJECTS:
				String[] from = {
						GradesContract.SubjectsTable.COL_SU_NAME
				};
				int[] to = {
						android.R.id.text1
				};
				ListAdapter adapter = new SimpleCursorAdapter(getActivity(), android.R.layout.simple_list_item_1, cursor, from, to, SimpleCursorAdapter.FLAG_REGISTER_CONTENT_OBSERVER);
				setListAdapter(adapter);
				break;
			default:
				break;
			}
		}

		@Override
		public void onLoaderReset(Loader<Cursor> loader) {
			// TODO Auto-generated method stub
			
		}
	}
	
	public class ConnectionLoaderHelper implements LoaderCallbacks<String>{

		@Override
		public Loader<String> onCreateLoader(int id, Bundle args) {
			return new ConnectLoader(getActivity(), args);
		}

		@Override
		public void onLoadFinished(Loader<String> loader, String response) {
			try{
				JSONObject object = new JSONObject(response);
				int error = object.getInt(GradesParser.nError);
				if(error == 0){
					getActivity().getSupportLoaderManager().initLoader(LOADER_SUBJECTS, null, new CursorLoaderHelper());
				}else{
					failedDownload();
				}
			}catch(JSONException e){
				Log.d(ConnectLoader.logging, "Error in response from server: " + response);
				failedDownload();
			}catch(Exception e){
				e.printStackTrace();
			}
		}

		@Override
		public void onLoaderReset(Loader<String> loader) {
			// TODO Auto-generated method stub
			
		}
		
	}
}
