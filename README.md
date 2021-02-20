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

    var failure = function() {
        alert("Error calling WeFitter HealthKit Plugin");
    }

    bearerToken = "eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ8.eyJpc3MiOiJHSi1URVNUIiwiYXBwIjoiYTI3NTlkMzktYTM4Ni00NWQ3LThkYTItNWQzOTExMjdhMDNjIiwiaWF0IjoxNjEzNzU4MDE0LCJpZCI6IjViZDg4NjU3LTk2ZGUtNDUxYi04ZmZkLTUwYTQyMmQ0YWJkMiJ9.ExC79TFCv9KVDozI-dXEn1jJ8N-NYHixTBBAXq2tXK4"

    wefitterhealthkit.connect(bearerToken, success, failure);

```

Install iOS platform

    cordova platform add ios
    
Run the code

    cordova run ios

