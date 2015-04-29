'use strict';

var React = require('react-native');

var {
  StyleSheet,
  Text,
  TouchableHighlight
} = React;

var BackButton = React.createClass({
  onPress: function() {
    if (!this.props.willDisappear) {
      this.props.navigator.pop();
    }
  },
  render: function() {
    return (<TouchableHighlight underlayColor="transparent" onPress={this.onPress}>
              <Text style={styles.navbarText}>Zurück</Text>
            </TouchableHighlight>);
  }
});

var styles = StyleSheet.create({
  navbarText: {
    color: 'white',
    fontSize: 16,
    margin: 10,
    fontWeight: '600',
    textAlign: 'center',
    alignItems: 'center'
  }
});

module.exports = BackButton;
