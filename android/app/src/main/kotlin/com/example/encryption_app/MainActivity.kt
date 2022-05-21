package malazhariy.encryptIt

import com.example.encryption_app.ListTileNativeAdFactory
import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.android.FlutterFragmentActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugins.googlemobileads.GoogleMobileAdsPlugin
import androidx.annotation.NonNull
import io.flutter.plugins.GeneratedPluginRegistrant


class MainActivity: FlutterFragmentActivity() {

    override fun configureFlutterEngine(flutterEngine: FlutterEngine) {
        super.configureFlutterEngine(flutterEngine)
        GeneratedPluginRegistrant.registerWith(flutterEngine)

//        GoogleMobileAdsPlugin.registerNativeAdFactory(
//                flutterEngine, "listTile", ListTileNativeAdFactory(context))
    }

//    override fun cleanUpFlutterEngine(flutterEngine: FlutterEngine) {
//        super.cleanUpFlutterEngine(flutterEngine)
//
//        GoogleMobileAdsPlugin.unregisterNativeAdFactory(flutterEngine, "listTile")
//    }

}