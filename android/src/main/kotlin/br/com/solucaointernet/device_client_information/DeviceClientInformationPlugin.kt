package br.com.solucaointernet.device_client_information

import android.content.Context
import android.content.pm.PackageInfo
import android.content.pm.PackageManager
import android.os.Build
import android.provider.Settings
import androidx.core.content.pm.PackageInfoCompat
import androidx.annotation.NonNull

import io.flutter.embedding.engine.plugins.FlutterPlugin
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel
import io.flutter.plugin.common.MethodChannel.MethodCallHandler
import io.flutter.plugin.common.MethodChannel.Result

/** DeviceClientInformationPlugin */
class DeviceClientInformationPlugin: FlutterPlugin, MethodCallHandler {
  /// The MethodChannel that will the communication between Flutter and native Android
  ///
  /// This local reference serves to register the plugin with the Flutter Engine and unregister it
  /// when the Flutter Engine is detached from the Activity
  private lateinit var channel : MethodChannel
  private lateinit var context : Context

  override fun onAttachedToEngine(flutterPluginBinding: FlutterPlugin.FlutterPluginBinding) {
    channel = MethodChannel(flutterPluginBinding.binaryMessenger, "device_client_information")
    channel.setMethodCallHandler(this)
    this.context = flutterPluginBinding.applicationContext
  }

  override fun onMethodCall(call: MethodCall, result: Result) {
    if (call.method == "getInformation") {
      var manager: PackageManager = context.packageManager;
      var info: PackageInfo?;

      var applicationId: String = "unknown_application_id";
      val applicationType: String = "app";
      var applicationVersion: String = "unknown_application_version";
      var applicationBuildCode: Long = 0;
      val applicationName: String = context.applicationInfo.loadLabel(manager).toString();

      val osName: String = "Android";
      val osVersion: String = Build.VERSION.RELEASE;
      val androidApiLevel: Int = Build.VERSION.SDK_INT;

      var deviceId: String = getDeviceId();
      var deviceName: String = Build.MODEL;

      try {
        info = manager.getPackageInfo(context.packageName, 0);
        applicationId = context.getPackageName() ?: "unknown_application_id";
        applicationVersion = info?.versionName ?: "unknwon_application_version";
        applicationBuildCode = if (info == null) {
          0;
        } else {
          PackageInfoCompat.getLongVersionCode(info);
        }
      } catch (e: PackageManager.NameNotFoundException) {
        e.printStackTrace();
      }

      val resultInfo = HashMap<String, String>();

      resultInfo["deviceId"] = deviceId;
      resultInfo["deviceName"] = deviceName;
      resultInfo["osName"] = osName;
      resultInfo["osVersion"] = osVersion;
      resultInfo["osVersionCode"] = androidApiLevel.toString();
      resultInfo["softwareName"] = applicationName;
      resultInfo["softwareVersion"] = applicationVersion;
      resultInfo["applicationId"] = applicationId;
      resultInfo["applicationType"] = applicationType;
      resultInfo["applicationName"] = applicationName;
      resultInfo["applicationVersion"] = applicationVersion;
      resultInfo["applicationBuildCode"] = applicationBuildCode.toString();

      result.success(resultInfo)
    } else {
      result.notImplemented()
    }
  }

  override fun onDetachedFromEngine(binding: FlutterPlugin.FlutterPluginBinding) {
    channel.setMethodCallHandler(null)
  }

  private fun getDeviceId() : String {
    return Settings.Secure.getString(context.contentResolver, Settings.Secure.ANDROID_ID)
  }
}
