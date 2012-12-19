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

import com.suicune.notasupna.database.GradesContract;
import com.suicune.notasupna.helpers.GradesParser;

public class DetailsFragment extends Fragment {
	public static final String EXTRA_SUBJECT = "subject";
	private static final int LOADER_DETAILS = 1;
	
	private Grade mGrade = null;
	
	public static DetailsFragment newInstance(long subjectId){
		DetailsFragment fragment = new DetailsFragment();
		
		Bundle args = new Bundle();
		args.putLong(EXTRA_SUBJECT, subjectId);
		fragment.setArguments(args);
		return fragment;
	}

	@Override
	public void onCreate(Bundle savedInstanceState) {
		Bundle args = new Bundle();
		args.putLong(GradesParser.nSubjectName, this.getArguments().getLong(EXTRA_SUBJECT));
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
				Long subjectId = args.getLong(GradesParser.nSubjectName);
				Uri uri = GradesContract.CONTENT_NAME_ALL;
				String[] projection = {
						GradesContract.SubjectsTable.TABLE_NAME + "." + GradesContract.SubjectsTable._ID,
						GradesContract.SubjectsTable.COL_SU_NAME,
						GradesContract.SubjectsTable.COL_SU_LANGUAGE,
						GradesContract.GradesTable.COL_GR_SU_CODE,
						GradesContract.GradesTable.COL_GR_GRADE_NAME
				};
				String selection = GradesContract.SubjectsTable._ID + "=?";
				String[] selectionArgs = {
						Long.toString(subjectId)
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
