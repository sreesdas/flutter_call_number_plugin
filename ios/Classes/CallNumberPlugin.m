#import "CallNumberPlugin.h"

@implementation CallNumberPlugin

+ (BOOL)available {
    return [[UIApplication sharedApplication] canOpenURL:[NSURL URLWithString:@"tel://"]];
}

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
      
      if(![CallNumberPlugin available]) {
          result([FlutterError errorWithCode:@"NoFeatureCallSupported"
                              message:nil
                                     details:nil]);
      }
      else if(![[UIApplication sharedApplication] openURL:[NSURL URLWithString:number]]) {
          // missing phone number
          result([FlutterError errorWithCode:@"CouldNotCallPhoneNumber"
                                     message:nil
                                     details:nil]);
      }
      
    result(@YES);
  } else {
    result(FlutterMethodNotImplemented);
  }
}

@end
