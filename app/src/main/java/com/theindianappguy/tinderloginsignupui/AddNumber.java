package com.theindianappguy.tinderloginsignupui;

import androidx.appcompat.app.AppCompatActivity;

import android.os.Bundle;
import android.text.Html;
import android.view.View;
import android.widget.AdapterView;
import android.widget.ArrayAdapter;
import android.widget.Spinner;
import android.widget.TextView;
import android.widget.Toast;

import java.util.ArrayList;

public class AddNumber extends AppCompatActivity implements  AdapterView.OnItemSelectedListener{

    /*subjects*/
    String[] subjets = {"IN +91","US +1","and more"};
    TextView mConditionTextView,loginbymail;


    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_add_number);

        mConditionTextView = findViewById(R.id.mConditionTextView);
        loginbymail = findViewById(R.id.loginbymail);

        //Getting the instance of Spinner and applying OnItemSelectedListener on it
        final Spinner spin = (Spinner) findViewById(R.id.countrycode_spinner);
        spin.setOnItemSelectedListener(this);

        //Creating the ArrayAdapter instance having the country list
        ArrayAdapter aa = new ArrayAdapter(this, android.R.layout.simple_spinner_item, subjets);
        aa.setDropDownViewResource(android.R.layout.simple_spinner_dropdown_item);
        //Setting the ArrayAdapter data on the Spinner
        spin.setAdapter(aa);

        String htmlString=getString(R.string.condition_desc)+""+"<u>This text will be underlined</u>";
        mConditionTextView.setText(htmlString);
        String libymailHtmlString = "<u>LOG IN BY EMAIL</u>";
        loginbymail.setText(libymailHtmlString);
    }

    @Override
    public void onItemSelected(AdapterView<?> parent, View view, int position, long id) {

        Toast.makeText(getApplicationContext(), subjets[position] + " is selected", Toast.LENGTH_LONG).show();
    }

    @Override
    public void onNothingSelected(AdapterView<?> parent) {

    }
}
