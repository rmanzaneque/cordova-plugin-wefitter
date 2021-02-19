/********* Echo.m Cordova Plugin Implementation *******/

#import "Echo.h"
#import <Cordova/CDVPlugin.h>

@implementation Echo

- (void)wefitter:(CDVInvokedUrlCommand*)command
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


- (void)getStatus:(CDVInvokedUrlCommand*)command
{
    CDVPluginResult* pluginResult = nil;

    // Begin setup WeFitter
    WeFitterConfig *config = [[WeFitterConfig alloc] initWithUrl:@"https://api.wefitter.com/api/" clientId:@"" clientSecret:@"" startDate:nil];
    NSError *error;
    BOOL success = [WeFitter setupWithConfig:config error:&error];
    if (!success) {
        NSLog(@"Error setting up WeFitter: %@", error.localizedDescription);
    }
    // End setup WeFitter

    [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];

}


- (void)connect:(CDVInvokedUrlCommand*)command
{
    CDVPluginResult* pluginResult = nil;

    NSString *bearerToken = @"eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJHSi1URVNUIiwiYXBwIjoiYTI3NTlkMzktYTM4Ni00NWQ3LThkYTItNWQzOTExMjdhMDNjIiwiaWF0IjoxNjEzNzU4MDE0LCJpZCI6IjViZDg4NjU3LTk2ZGUtNDUxYi04ZmZkLTUwYTQyMmQ0YWJkMiJ9.ExC79TFCv9KVDozI-dXEn1jJ8N-NYHixTBBAXq2tXK4";
    NSString* bearerToken = [command.arguments objectAtIndex:0];
    NSLog(@"%@", bearerToken);

    // Begin setup WeFitter
    WeFitterConfig *config = [[WeFitterConfig alloc] initWithUrl:@"https://api.wefitter.com/api/v1.2/" clientId:@"" clientSecret:@"" startDate:nil];
    NSError *error;
    BOOL success = [WeFitter setupWithConfig:config error:&error];
    if (!success) {
        NSLog(@"Error setting up WeFitter: %@", error.localizedDescription);
    }
    // End setup WeFitter

    if (WeFitter.canConnectToHealthData) {
        [WeFitter connectBearerToken:bearerToken completion:^(BOOL success, NSError *error) {
            if (success) {
                NSLog(@"HealthKit is successfully connected to WeFitter. Data will be synced automatically");
            } else {
                NSLog(@"Error connecting profile: %@", error.localizedDescription);
            }
            if ([WeFitter currentStatus] == StatusConnected) {
                NSLog(@"Connected profile: %@", [WeFitter currentlyConnectedProfile]);
            }
        }];
    } else {
        NSLog(@"Cannot connect to HealthKit data");
    }

    [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];

}

- (void)disconnect:(CDVInvokedUrlCommand*)command
{
    CDVPluginResult* pluginResult = nil;

    NSString *bearerToken = @"eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJHSi1URVNUIiwiYXBwIjoiYTI3NTlkMzktYTM4Ni00NWQ3LThkYTItNWQzOTExMjdhMDNjIiwiaWF0IjoxNjEzNzU4MDE0LCJpZCI6IjViZDg4NjU3LTk2ZGUtNDUxYi04ZmZkLTUwYTQyMmQ0YWJkMiJ9.ExC79TFCv9KVDozI-dXEn1jJ8N-NYHixTBBAXq2tXK4";

    // Begin setup WeFitter
    WeFitterConfig *config = [[WeFitterConfig alloc] initWithUrl:@"https://api.wefitter.com/api/v1.2/" clientId:@"" clientSecret:@"" startDate:nil];
    NSError *error;
    BOOL success = [WeFitter setupWithConfig:config error:&error];
    if (!success) {
        NSLog(@"Error setting up WeFitter: %@", error.localizedDescription);
    }
    // End setup WeFitter

    [WeFitter disconnect];

    NSLog(@"Disconnected from to HealthKit data");

    [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];

}

@end
