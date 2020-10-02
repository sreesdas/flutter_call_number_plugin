import 'dart:async';
import 'package:flutter/services.dart';

class CallNumber {
  static const MethodChannel _channel =
      const MethodChannel('sreenathsdas/call_number');

  //static Future<String> get callNumber =>
    //  _channel.invokeMethod('callNumber');

  Future<String> callNumber(String number) async {
    if (number == null) {
        return "NULL";
    }
    if(! number.startsWith(new RegExp(r'\+\d+'))) {
        return "INVALID NUMBER FORMAT"
    }
    return await _channel.invokeMethod(
        'callNumber',
        <String, Object>{'number': number},
    );
  }
}
