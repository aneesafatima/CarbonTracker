package org.aossie.carbontracker

import android.app.Activity
import android.os.Bundle
import android.widget.TextView


// This file will be modified once the app is completed and a proper privacy policy is written. For now, it just displays a placeholder message.
class PermissionsRationaleActivity : Activity() {
    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        val textView = TextView(this).apply {
            text = "Carbon Tracker uses your step data to estimate your carbon footprint reduction from walking and cycling instead of driving. This data stays on your device and is never shared."
            setPadding(48, 48, 48, 48)
            textSize = 16f
        }
        setContentView(textView)
    }
}
