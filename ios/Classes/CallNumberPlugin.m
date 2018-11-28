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
      
      NSString* number = call.arguments[@"number"];
      number = [number stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
      
      if( ! [number hasPrefix:@"tel:"]){
          number =  [NSString stringWithFormat:@"tel:%@", number];
      }
      
      [[UIApplication sharedApplication] openURL:[NSURL URLWithString:number]];
    result(@YES);
  } else {
    result(FlutterMethodNotImplemented);
  }
}

@end
