/********* WeFitterHealthKit.h Cordova Plugin Header *******/

#import <Cordova/CDVPlugin.h>
#import <WeFitterLib/WeFitterLib-Swift.h>


@interface WeFitterHealthKit : CDVPlugin

- (void)wefitter:(CDVInvokedUrlCommand*)command;
- (void)getStatus:(CDVInvokedUrlCommand*)command;
- (void)connect:(CDVInvokedUrlCommand*)command;
- (void)disconnect:(CDVInvokedUrlCommand*)command

@end

