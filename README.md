# Cordova Echo Plugin

Simple plugin that returns your string prefixed with ECHO.

Greeting a user with "ECHO, world" is something that could be done in JavaScript. 
This plugin provides a simple example demonstrating how Cordova plugins work.

## Using

Create a new Cordova Project

    $ cordova create hello com.example.helloapp Hello
    
Install the plugin

    $ cd hello
    $ cordova plugin add https://github.com/gjwdijk/echo.git
    

Edit `www/js/index.js` and add the following code inside `onDeviceReady`

```js
    var success = function(message) {
        alert(message);
    }

    var failure = function() {
        alert("Error calling Echo Plugin");
    }

    echo.echo("World", success, failure);
```

Install iOS or Android platform

    cordova platform add ios
    
Run the code

    cordova run 

