'use strict';

var React = require('react-native');

var {
  StyleSheet,
  Text,
  TouchableHighlight
} = React;

var BackButton = React.createClass({
  render: function() {
    return (<Text style={styles.navbarText}>Zurück</Text>);
  }
});

var styles = StyleSheet.create({
  navbarText: {
    color: 'white',
    fontSize: 16,
    marginTop: 5,
    marginLeft: 10,
    fontWeight: '600',
    textAlign: 'center',
    alignItems: 'center'
  }
});

module.exports = BackButton;
