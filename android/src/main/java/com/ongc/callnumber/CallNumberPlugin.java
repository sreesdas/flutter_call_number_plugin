package com.ongc.callnumber;

import io.flutter.plugin.common.MethodChannel;
import io.flutter.plugin.common.MethodChannel.MethodCallHandler;
import io.flutter.plugin.common.MethodChannel.Result;
import io.flutter.plugin.common.MethodCall;
import io.flutter.plugin.common.PluginRegistry.Registrar;

import android.app.Activity;
import android.content.Context;
import android.content.pm.PackageManager;
import android.content.Intent;
import android.net.Uri;
import android.Manifest;

/**
 * CallNumberPlugin
 */
public class CallNumberPlugin implements MethodCallHandler {
  
  private final Registrar mRegistrar;
  private static final int REQUEST_CALL_PHONE_PERMISSION = 123456;

  public static void registerWith(Registrar registrar) {
    final MethodChannel channel = new MethodChannel(registrar.messenger(), "sreenathsdas/call_number");
    CallNumberPlugin instance = new CallNumberPlugin(registrar);
    channel.setMethodCallHandler(instance);
  }

  private CallNumberPlugin(Registrar registrar) {
    this.mRegistrar = registrar;
  }

  @Override
  public void onMethodCall(MethodCall call, Result result) {
    String num = call.argument("number");

    Context context;
    if (mRegistrar.activity() != null) {
      context = (Context) mRegistrar.activity();
    } else {
      context = mRegistrar.context();
    }

    if (call.method.equals("callNumber")) {
     
      boolean hasPermission = context.checkSelfPermission(Manifest.permission.CALL_PHONE) == PackageManager.PERMISSION_GRANTED;
      
      if(!hasPermission){
        requestCallPermission();
        return;
      }

      String number = "tel:" + num.trim();
      Intent callIntent = new Intent(Intent.ACTION_CALL, Uri.parse(number)); 
      context.startActivity(callIntent);
      result.success(num);

    } else {
      result.notImplemented();
    }
  }

  private void requestCallPermission() {
    mRegistrar.activity().requestPermissions(new String[] {Manifest.permission.CALL_PHONE}, REQUEST_CALL_PHONE_PERMISSION);
  }

 
}
