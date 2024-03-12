package  com.waiver.driver
import android.app.AlertDialog
import android.content.DialogInterface
import android.os.Bundle
import io.flutter.embedding.android.FlutterActivity
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel
import io.flutter.embedding.engine.FlutterEngine
import androidx.annotation.NonNull
import android.app.*
import android.content.*
import android.graphics.*
import android.os.*
import android.view.*
import android.widget.*
import androidx.annotation.*
import io.flutter.embedding.android.*

class MainActivity: FlutterActivity() {
    
    private val overlayChannel = "com.example.app/overlay"

    private var overlayView: View? = null

    override fun configureFlutterEngine(@NonNull flutterEngine: FlutterEngine) {
        super.configureFlutterEngine(flutterEngine)
        MethodChannel(flutterEngine.dartExecutor.binaryMessenger, overlayChannel)
            .setMethodCallHandler { call: MethodCall?, result: MethodChannel.Result? ->
                if (call?.method == "showOverlay") {
                    val message = call?.argument<String>("message")
                    showSystemOverlay("message")
                    result?.success(null)
                } 
                else if(call?.method == "close")
                {
                    closeSystemOverlay()
                }
                else {
                    result?.notImplemented()
                }
            }
    }
    private fun showSystemOverlay(message: String) {
        val windowManager = getSystemService(Context.WINDOW_SERVICE) as WindowManager
        val params = WindowManager.LayoutParams(
            WindowManager.LayoutParams.MATCH_PARENT,
            WindowManager.LayoutParams.WRAP_CONTENT,
            WindowManager.LayoutParams.TYPE_APPLICATION_OVERLAY,
            WindowManager.LayoutParams.FLAG_NOT_FOCUSABLE or
                    WindowManager.LayoutParams.FLAG_LAYOUT_IN_SCREEN or
                    WindowManager.LayoutParams.FLAG_LAYOUT_NO_LIMITS,
            PixelFormat.TRANSLUCENT
        )
        params.gravity = Gravity.BOTTOM
        val inflater = getSystemService(Context.LAYOUT_INFLATER_SERVICE) as LayoutInflater
        overlayView = inflater.inflate(R.layout.overlay_layout, null)
        val textView = overlayView!!.findViewById<TextView>(R.id.overlay_text)
        textView.text = message

        // Find the button and set its click listener
        val button1 = overlayView!!.findViewById<Button>(R.id.overlay_button1)
        val button2 = overlayView!!.findViewById<Button>(R.id.overlay_button2)
        button1.setOnClickListener {
            // Handle button 1 click here
            // For example, send a message to Dart code indicating button 1 was clicked
            val channel = MethodChannel(flutterEngine!!.dartExecutor.binaryMessenger, overlayChannel)
            channel.invokeMethod("buttonClicked", mapOf("buttonId" to "button1"))
        }

        button2.setOnClickListener {
            // Handle button 2 click here
            // For example, send a message to Dart code indicating button 2 was clicked
            val channel = MethodChannel(flutterEngine!!.dartExecutor.binaryMessenger, overlayChannel)
            channel.invokeMethod("buttonClicked", mapOf("buttonId" to "button2"))
        }

        windowManager.addView(overlayView, params)
    }


    override fun onDestroy() {
        // Remove overlay when the activity is destroyed
        val windowManager = getSystemService(Context.WINDOW_SERVICE) as WindowManager
        if (overlayView != null) {
            windowManager.removeView(overlayView)
            overlayView = null
        }
        super.onDestroy()
    }

    private fun closeSystemOverlay() {
        val windowManager = getSystemService(Context.WINDOW_SERVICE) as WindowManager
        if (overlayView != null) {
            windowManager.removeView(overlayView)
            overlayView = null
        }
    }
   
}
