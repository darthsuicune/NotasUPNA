package com.suicune.notasupna;

import android.app.Fragment;
import android.os.Bundle;
import android.util.TypedValue;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.LinearLayout;
import android.widget.TextView;
import android.widget.Toast;

public class DetailsFragment extends Fragment {
	
	@Override
	public View onCreateView(LayoutInflater inflater, ViewGroup container, Bundle savedInstanceState) {
		if (container == null){
			return null;
		}
		LinearLayout frame = new LinearLayout(getActivity());
		frame.setOrientation(LinearLayout.VERTICAL);
		
	
//		FrameLayout frame = (FrameLayout) getActivity().findViewById(R.id.record_details);
//		inflater.inflate(R.layout.details_fragment, frame);
//		TextView text = (TextView) getActivity().findViewById(R.id.details_text);
		TextView text = new TextView(getActivity());
		int padding = (int) TypedValue.applyDimension(TypedValue.COMPLEX_UNIT_DIP, 4, getActivity().getResources().getDisplayMetrics());
		text.setPadding(padding, padding, padding, padding);
		text.setText("probando " + getShownIndex());
		frame.addView(text);
		return frame;
	}

	public static DetailsFragment newInstance(int index){
		DetailsFragment fragment = new DetailsFragment();
		
		Bundle args = new Bundle();
		args.putInt("index", index);
		fragment.setArguments(args);
		return fragment;
	}
	
	public int getShownIndex(){
		return getArguments().getInt("index", 0);
	}
}
