/********* WeFitterHealthKit.h Cordova Plugin Header *******/

#import <Cordova/CDVPlugin.h>
#import <WeFitterLib/WeFitterLib-Swift.h>


@interface WeFitterHealthKit : CDVPlugin

- (void)ping:(CDVInvokedUrlCommand*)command;
- (void)connect:(CDVInvokedUrlCommand*)command;
- (void)disconnect:(CDVInvokedUrlCommand*)command;

@end

