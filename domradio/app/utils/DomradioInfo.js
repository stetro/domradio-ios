'use strict';

var React = require('react-native');

var {
	AlertIOS,
	LinkingIOS
} = React;

exports.show = function() {
	AlertIOS.alert(
		'Über domradio.de',
		'domradio.de\nDomkloster 3\n50667 Köln\ninfo@domradio.de\n\ndomradio.de ' +
		'ist das katholische Portal für aktuelle Nachrichten aus Kirche und Welt. ' +
		'Wir bringen christliche Stimmen und Positionen zu allen relevanten ' +
		'gesellschaftlichen Themen auf den Punkt.\n\nEntwickelt von Steffen Tröster.', [{
			text: 'domradio.de',
			onPress: function() {
				LinkingIOS.openURL('http://domradio.de');
			}
		}, {
			text: 'OK'
		}]);
};