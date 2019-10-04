package com.theindianappguy.tinderloginsignupui;

import androidx.appcompat.app.AppCompatActivity;

import android.content.Intent;
import android.os.Bundle;
import android.view.View;
import android.widget.TextView;

public class LoginActivty extends AppCompatActivity {

    TextView log_in_withphone;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_login_activty);

        log_in_withphone = findViewById(R.id.log_in_withphone);
        log_in_withphone.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                Intent intent = new Intent(LoginActivty.this,AddNumber.class);
                startActivity(intent);
            }
        });
    }
}
