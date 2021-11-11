# Cordova WeFitterHealthKit Plugin

Cordova plugin for connecting with the WeFitter ios HealthKit SDK.


## Using

Install the plugin

    $ cordova plugin add https://github.com/gjwdijk/cordova-plugin-wefitter.git
    

Edit `www/js/index.js` and add the following code inside `onDeviceReady`

```js
    var success = function(message) {
        alert(message);
    }

    var failure = function(message) {
        msg = "Error calling WeFitter Plugin: " + message
        alert(msg);
    }

    // Test Plugin using ping message
    wefitterhealthkit.ping("WeFitter PING", success, failure);

    // Connect profile
    var bearertoken = "<YOUR BEARER TOKEN FROM THE WEFITTER API>"
    wefitterhealthkit.connect(bearertoken, success, failure);

```

Install iOS platform

    cordova platform add ios
    
Run the code

    cordova run ios

##IOS
### Info.plist (Añadir en la aplicación que importa el plugin).

| Parent                              | String                                                                         | Description                                                                                                     |
| ----------------------------------- | ------------------------------------------------------------------------------ | --------------------------------------------------------------------------------------------------------------- |
| `NSHealthShareUsageDescription`     | `Esto permite poder recoger tus datos biométricos de la aplicación de salud.`  | A message to the user that explains why the app requested permission to read samples from the HealthKit store.  |
| `NSHealthUpdateUsageDescription`    | `Esto permite poder recoger tus datos biométricos de la aplicación de salud.`  | A message to the user that explains why the app requested permission to save samples to the HealthKit store.    |

# Changelog

## [0.0.2] - 11-11-2021

### Changed

- Deleted Info.plist texts conflict other plugins (must be added by the application importing the plugin).
- Updated README.md with the necessary texts to import.

