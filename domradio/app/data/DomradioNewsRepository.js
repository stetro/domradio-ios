'use strict';

var RSSBridge = require('NativeModules').RSSBridge;

function strip(string) {
  string = string.replace(/<br>/gi, '');
  string = string.replace(/<p>/gi, '');
  string = string.replace(/<\/p>/gi, '');
  return string;
}

function mapItems(itemXml) {
  return {
    title: itemXml.getElementsByTagName('title')[0].textContent,
    description: strip(itemXml.getElementsByTagName('description')[0].textContent),
    link: itemXml.getElementsByTagName('link')[0].textContent,
    pubDate: itemXml.getElementsByTagName('pubDate')[0].textContent
  };
};

exports.getNews = function() {
  console.log('loading feed ...');
  return new Promise(function(fulfill, reject) {
    fetch('http://domradio.de/rss-feeds/domradio-rss.xml')
      .then(function(feed) {
        feed.text().then(function(text) {
          RSSBridge.getNews((error, news) => {
            if (error) {
              console.error(error);
            } else {
              console.log("Loaded news"+news);
            }
          });
          console.log('parsing xml ...');
          try {
            var parser = new DOMParser();
            var xmlObject = parser.parseFromString(text, 'text/xml')
            var items = xmlObject.getElementsByTagName('item');
            var news = [];
            for (var i = 0; i < items.length; i++) {
              news.push(mapItems(items[i]));
            };
          } catch (error) {
            reject(error);
          }
          fulfill(news);
        });
      })
      .catch(function(error) {
        reject(error);
      });
  });
};