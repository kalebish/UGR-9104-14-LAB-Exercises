package com.example.imperative_counter_app

import android.os.Bundle
import android.widget.Button
import android.widget.TextView
import androidx.appcompat.app.AppCompatActivity

class MainActivity : AppCompatActivity() {

    private lateinit var countTextView: TextView
    private lateinit var incrementButton: Button
    private lateinit var decrementButton: Button
    private lateinit var resetButton: Button

    private var count = 0

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_main)

        countTextView = findViewById(R.id.countTextView)
        incrementButton = findViewById(R.id.incrementButton)
        decrementButton = findViewById(R.id.decrementButton)
        resetButton = findViewById(R.id.resetButton)

        // Set initial count value
        countTextView.text = count.toString()

        // Increment button click listener
        incrementButton.setOnClickListener {
            count++
            countTextView.text = count.toString()
        }

        // Decrement button click listener
        decrementButton.setOnClickListener {
            if (count > 0) {
                count--
                countTextView.text = count.toString()
            }
        }

        // Reset button click listener
        resetButton.setOnClickListener {
            count = 0
            countTextView.text = count.toString()
        }
    }
}