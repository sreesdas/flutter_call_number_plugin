#import "CallNumberPlugin.h"

@implementation CallNumberPlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  FlutterMethodChannel* channel = [FlutterMethodChannel
      methodChannelWithName:@"sreenathsdas/call_number"
            binaryMessenger:[registrar messenger]];
  CallNumberPlugin* instance = [[CallNumberPlugin alloc] init];
  [registrar addMethodCallDelegate:instance channel:channel];
}

- (void)handleMethodCall:(FlutterMethodCall*)call result:(FlutterResult)result {
  if ([@"callNumber" isEqualToString:call.method]) {
    result([@"Not yet Implemented in iOS"]);
  } else {
    result(FlutterMethodNotImplemented);
  }
}

@end
