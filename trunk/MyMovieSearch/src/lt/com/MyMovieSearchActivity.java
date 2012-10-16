package lt.com;

import android.app.Activity;
import android.os.Bundle;
import android.view.View;
import android.view.View.OnClickListener;
import android.view.View.OnFocusChangeListener;
import android.widget.Button;
import android.widget.EditText;
import android.widget.RadioButton;
import android.widget.RadioGroup;
import android.widget.TextView;
import android.widget.Toast;

public class MyMovieSearchActivity extends Activity {
    private static final String EMPTY_STRING = "";
    
    private EditText txtSearch;
    private RadioButton rbtnMovie;
    private RadioButton rbtnPeople;
    private RadioGroup rbtnGroup;
    private TextView lblSearchType;
    private Button btnSearch;

    @Override
    public void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.main);
        
        this.findAllViewsById();
        
        rbtnMovie.setOnClickListener(rbtnListener);
        rbtnPeople.setOnClickListener(rbtnListener);
        
        btnSearch.setOnClickListener(new OnClickListener(){
			public void onClick(View v) {
				String sSearch = txtSearch.getText().toString();
				if (rbtnMovie.isChecked()){
					longToast(rbtnMovie.getText() + " " + sSearch);
				}
				else if (rbtnPeople.isChecked()){
					longToast(rbtnPeople.getText() + " " + sSearch);
				}
			}        	
        });
        txtSearch.setOnFocusChangeListener(new DftTextOnFocusListener(this.getString(R.string.search)));
        int iID = rbtnGroup.getCheckedRadioButtonId();
        RadioButton rbtn = (RadioButton)findViewById(iID);
        lblSearchType.setText(rbtn.getText().toString());
   }
    
    private void findAllViewsById(){
        txtSearch = (EditText)findViewById(R.id.txtSearch);
        rbtnMovie = (RadioButton)findViewById(R.id.rbtnMovie);
        rbtnPeople = (RadioButton)findViewById(R.id.rbtnPeople);
        rbtnGroup = (RadioGroup)findViewById(R.id.search_radio_group);
        lblSearchType = (TextView)findViewById(R.id.lblSearchType);
        btnSearch = (Button)findViewById(R.id.btnSearch);    	
    }
    
    private void longToast(CharSequence sMsg){
    	Toast.makeText(this, sMsg, Toast.LENGTH_LONG).show();
    }
    
    private OnClickListener rbtnListener = new OnClickListener(){
    	public void onClick(View v){
    		RadioButton rbtn = (RadioButton)v;
    		lblSearchType.setText(rbtn.getText());
    	}
    };
    
    private class DftTextOnFocusListener implements OnFocusChangeListener{
    	private String defaultText = "";
    	public DftTextOnFocusListener(String defaultText){
    		this.defaultText = defaultText;
    	}

		public void onFocusChange(View v, boolean bFocus) {
			if (v instanceof EditText){
				EditText txt = (EditText)v;
				if (bFocus){
					if (txt.getText().toString().equals(defaultText)){
						txt.setText(EMPTY_STRING);
					}
				}
				else{
					if (txt.getText().toString().equals(EMPTY_STRING)){
						txt.setText(defaultText);
					}
				}
			}
		}
    	
    }
}