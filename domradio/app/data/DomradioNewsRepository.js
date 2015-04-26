'use strict';

var RSSBridge = require('NativeModules').RSSBridge;

exports.getNews = function() {
  console.log('loading feed ...');
  return new Promise(function(fulfill, reject) {
    RSSBridge.getNews((error, news) => {
      if (error) {
        reject(error);
      } else {
        fulfill(news);
      }
    });
  });
};