'use strict';

var AudioBridge = require('NativeModules').AudioBridge;

exports.play = function() {
  console.log('starting audio ...');
  AudioBridge.play();
};

exports.stop = function() {
  console.log('stopping audio ...');
  AudioBridge.stop();
};

exports.getStatus = function(callback) {
  console.log('getting status');
  return AudioBridge.getStatus(callback);
};