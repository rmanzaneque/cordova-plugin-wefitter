module.exports = {
    echo: function (name, successCallback, errorCallback) {
        cordova.exec(successCallback, errorCallback, "WeFitterHealthKit", "wefitter", [name]);
    },
    getStatus: function (name, successCallback, errorCallback) {
        cordova.exec(successCallback, errorCallback, "WeFitterHealthKit", "getStatus", [name]);
    },
    connect: function (name, successCallback, errorCallback) {
        cordova.exec(successCallback, errorCallback, "WeFitterHealthKit", "connect", [name]);
    },
    disconnect: function (name, successCallback, errorCallback) {
        cordova.exec(successCallback, errorCallback, "WeFitterHealthKit", "disconnect", [name]);
    }

};
