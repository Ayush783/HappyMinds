package com.example.happyminds

import android.content.BroadcastReceiver
import android.content.Context
import android.content.Intent
import android.content.Context.POWER_SERVICE
import android.content.SharedPreferences
import android.os.PowerManager
import android.hardware.display.DisplayManager
import android.os.Build
import android.view.Display
import androidx.annotation.RequiresApi
import android.content.Context.MODE_PRIVATE
import android.util.Log
import android.widget.Toast
import org.json.JSONObject
import java.util.*
import kotlin.collections.HashMap

class MyReceiver : BroadcastReceiver() {
    @RequiresApi(Build.VERSION_CODES.KITKAT_WATCH)
    override fun onReceive(context: Context, intent: Intent) {
        //know if phone is being used every 10 minutes
        //save data using shared preferences
        val prefs: SharedPreferences = context.getSharedPreferences("FlutterSharedPreferences", MODE_PRIVATE)
        val storedHashMapString: String? = prefs.getString("flutter.hashString", JSONObject().toString())
        val jsonObject = JSONObject(storedHashMapString!!)
        val outputMap: Map<String, Any> = HashMap()
        val keysItr = jsonObject.keys()
        while (keysItr.hasNext()) {
            val key = keysItr.next()
            outputMap[key]
        }
        if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.JELLY_BEAN_MR1) {
            val dm = context.getSystemService(Context.DISPLAY_SERVICE) as DisplayManager
            for (display in dm.displays) {
                if (display.state != Display.STATE_OFF) {
                    //screen is on
                    jsonObject.put(getCurrentDateTime().toString(),true)
                    Log.d("date",getCurrentDateTime().toString())
                    Log.d("json",jsonObject.toString())
                    prefs.edit().putString("flutter.hashString", jsonObject.toString()).apply()
                }else{
                    jsonObject.put(getCurrentDateTime().toString(),false)
                prefs.edit().putString("flutter.hashString", jsonObject.toString()).apply()
                }
            }
        } else {
            val powerManager = context.getSystemService(POWER_SERVICE) as PowerManager?
            if (powerManager!!.isInteractive) {
                //screen is on
                jsonObject.put(getCurrentDateTime().toString(),true)
                prefs.edit().putString("flutter.hashString", jsonObject.toString()).apply()
            }else{
                jsonObject.put(getCurrentDateTime().toString(),false)
                prefs.edit().putString("flutter.hashString", jsonObject.toString()).apply()
            }
        }

    }

    private fun getCurrentDateTime(): Date {
        return Calendar.getInstance().time
    }
}