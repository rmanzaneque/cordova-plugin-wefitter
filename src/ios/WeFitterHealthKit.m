/********* WeFitterHealthKit.m Cordova Plugin Implementation *******/

#import "WeFitterHealthKit.h"
#import <Cordova/CDVPlugin.h>

@implementation WeFitterHealthKit

NSString* API_URL=@"https://api.wefitter.com/api/";

- (void)ping:(CDVInvokedUrlCommand*)command
{
    CDVPluginResult* pluginResult = nil;
    NSString* echo = [command.arguments objectAtIndex:0];

    if (echo != nil && [echo length] > 0) {
        pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsString:echo];
    } else {
        pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR];
    }

    [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
}

- (void)connect:(CDVInvokedUrlCommand*)command
{
    CDVPluginResult* pluginResult = nil;
    NSString* msg;

    NSString* bearerToken = [command.arguments objectAtIndex:0];
    NSLog(@"%@", bearerToken);

    // Begin setup WeFitter
    WeFitterConfig *config = [[WeFitterConfig alloc] initWithUrl:API_URL clientId:@"" clientSecret:@"" startDate:nil];
    NSError *error;
    BOOL success = [WeFitter setupWithConfig:config error:&error];
    if (!success) {
        NSLog(@"Error setting up WeFitter: %@", error.localizedDescription);
    }
    // End setup WeFitter

    if (WeFitter.canConnectToHealthData) {
        [WeFitter connectBearerToken:bearerToken completion:^(BOOL success, NSError *error) {
            CDVPluginResult* pluginResult = nil;
            NSString* msg;
            if (success) {
                msg = @"HealthKit is successfully connected to WeFitter. Data will be synced automatically";
                NSLog(@"%@", msg);
                pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsString: msg];

            } else {
                msg = [NSString stringWithFormat:@"Error connecting profile: %@\" ",error.localizedDescription];
                NSLog(@"%@", msg);
                pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR messageAsString: msg];
            }
            if ([WeFitter currentStatus] == StatusConnected) {
                msg = [NSString stringWithFormat:@"Connected profile: %@\" ",[WeFitter currentlyConnectedProfile]];
                NSLog(@"%@", msg);
                pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsString: msg];
            }
            [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
        }];
    } else {
        msg = @"Cannot connect to HealthKit data";
        NSLog(@"%@", msg);
        pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR messageAsString: msg];
        [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
    }
}

- (void)disconnect:(CDVInvokedUrlCommand*)command
{
    CDVPluginResult* pluginResult = nil;
    NSString* msg;


    // Begin setup WeFitter
    WeFitterConfig *config = [[WeFitterConfig alloc] initWithUrl:API_URL clientId:@"" clientSecret:@"" startDate:nil];
    NSError *error;
    BOOL success = [WeFitter setupWithConfig:config error:&error];
    if (!success) {
        NSLog(@"Error setting up WeFitter: %@", error.localizedDescription);
    }
    // End setup WeFitter

    [WeFitter disconnect];

    msg = @"Disconnected from to HealthKit data";
    NSLog(@"%@", msg);
    pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsString: msg];

    [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];

}

- (void)getStatus:(CDVInvokedUrlCommand*)command
{
    CDVPluginResult* pluginResult = nil;

    // Begin setup WeFitter
    WeFitterConfig *config = [[WeFitterConfig alloc] initWithUrl:API_URL clientId:@"" clientSecret:@"" startDate:nil];
    NSError *error;
    BOOL success = [WeFitter setupWithConfig:config error:&error];
    if (!success) {
       NSLog(@"Error setting up WeFitter: %@", error.localizedDescription);
    }
    // End setup WeFitter

    pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsNSInteger:WeFitter.currentStatus];

    [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
}

@end


