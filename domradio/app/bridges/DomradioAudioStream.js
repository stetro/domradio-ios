var React = require('react-native');
var {
  NetInfo, AlertIOS
} = React;
var AudioBridge = require('NativeModules').AudioBridge;

var start = function() {
  console.log('starting audio ...');
  AudioBridge.play();
};

var stop = function() {
  console.log('stopping audio ...');
  AudioBridge.stop();
};

exports.play = function() {
  NetInfo.reachabilityIOS.fetch().done(function(reach) {
    if (reach == 'cell') {
      AlertIOS.alert('Mobiles Internet', 'Sie sind nicht mit einem WLAN verbunden. Wollen Sie über Ihr Mobilfunknetz fortfahren?', [{
        text: 'Radio starten',
        onPress: function() {
          start();
        }
      }, {
        text: 'Abbreachen',
        onPress: function() {
          stop();
        }
      }]);
    } else {
      start();
    }
  });
};

exports.stop = stop;

exports.getStatus = function(callback) {
  console.log('getting status');
  return AudioBridge.getStatus(callback);
};
