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

