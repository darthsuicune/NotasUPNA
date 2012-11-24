package com.suicune.notasupna;

import android.database.Cursor;
import android.net.Uri;
import android.os.Bundle;
import android.support.v4.app.Fragment;
import android.support.v4.app.LoaderManager.LoaderCallbacks;
import android.support.v4.content.CursorLoader;
import android.support.v4.content.Loader;
import android.view.Menu;
import android.view.MenuInflater;
import android.view.MenuItem;

import com.suicune.notasupna.Database.GradesContract;
import com.suicune.notasupna.Helpers.GradesParser;

public class DetailsFragment extends Fragment {
	public static final String EXTRA_SUBJECT = "subject";
	private static final int LOADER_DETAILS = 1;
	
	public static DetailsFragment newInstance(int index){
		DetailsFragment fragment = new DetailsFragment();
		
		Bundle args = new Bundle();
		args.putInt("index", index);
		fragment.setArguments(args);
		return fragment;
	}

	@Override
	public void onCreate(Bundle savedInstanceState) {
		Bundle extras = getActivity().getIntent().getExtras();
		Bundle args = new Bundle();
		args.putString(GradesParser.nSubjectName, extras.getString(EXTRA_SUBJECT));
		getActivity().getSupportLoaderManager().initLoader(LOADER_DETAILS, args, new CursorLoaderHelper());
		super.onCreate(savedInstanceState);
	}

	@Override
	public void onCreateOptionsMenu(Menu menu, MenuInflater inflater) {
		inflater.inflate(R.menu.action_bar_details, menu);
		super.onCreateOptionsMenu(menu, inflater);
	}

	@Override
	public boolean onOptionsItemSelected(MenuItem item) {
		switch (item.getItemId()){
		case R.id.action_details_calls:
			break;
		case R.id.action_details_share:
			break;
		default:
			return false;
		}
		return true;
	}

	public int getShownIndex(){
		return getArguments().getInt("index", 0);
	}
	
	public class CursorLoaderHelper implements LoaderCallbacks<Cursor>{

		@Override
		public Loader<Cursor> onCreateLoader(int id, Bundle args) {
			CursorLoader loader = null;
			switch(id){
			case LOADER_DETAILS:
				String name = args.getString(GradesParser.nSubjectName);
				Uri uri = GradesContract.CONTENT_NAME_ALL;
				String[] projection = {
						GradesContract.SubjectsTable.TABLE_NAME + "." + GradesContract.SubjectsTable._ID,
						GradesContract.SubjectsTable.COL_SU_NAME,
						GradesContract.SubjectsTable.COL_SU_LANGUAGE,
						GradesContract.GradesTable.COL_GR_SU_CODE,
						GradesContract.GradesTable.COL_GR_GRADE_NAME
				};
				String selection = GradesContract.SubjectsTable.COL_SU_LANGUAGE + "=? AND " + GradesContract.SubjectsTable.COL_SU_NAME + "=?";
				String[] selectionArgs = {
						PreferencesActivity.getRecordLanguage(getActivity()),
						name
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
			switch(loader.getId()){
			case LOADER_DETAILS:
				break;
			default:
				break;
			}
		}
		@Override
		public void onLoaderReset(Loader<Cursor> loader) {
			switch(loader.getId()){
			case LOADER_DETAILS:
				break;
			default:
				break;
			}
		}
	}
}
