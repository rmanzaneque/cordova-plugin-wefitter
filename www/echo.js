module.exports = {
    echo: function (name, successCallback, errorCallback) {
        cordova.exec(successCallback, errorCallback, "Echo", "wefitter", [name]);
    },
    getStatus: function (name, successCallback, errorCallback) {
        cordova.exec(successCallback, errorCallback, "Echo", "getStatus", [name]);
    },
    connect: function (name, successCallback, errorCallback) {
        cordova.exec(successCallback, errorCallback, "Echo", "connect", [name]);
    }

};
