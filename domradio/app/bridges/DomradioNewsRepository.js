'use strict';

var RSSBridge = require('NativeModules').RSSBridge;

exports.triggerNewsRefresh = function() {
  console.log('loading feed ...');
  RSSBridge.triggerRefresh();
};
