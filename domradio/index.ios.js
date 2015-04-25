'use strict';

var React = require('react-native');
var { DomradioPlayer } = require('./app/components/DomradioPlayer');
var { DomradioNavigation } = require('./app/components/DomradioNavigation');
var { DomradioNews } = require('./app/components/DomradioNews');

var {
  AppRegistry,
  StyleSheet,
  Text,
  View
} = React;

var domradio = React.createClass({
  render: function() {
    return ( <View style = {
        styles.container
     }>
      <DomradioNavigation/>
      <DomradioNews/>
      <DomradioPlayer/>
      </View>
    );
  }
});

var styles = StyleSheet.create({
  container: {
    flex: 1,
    backgroundColor: '#EEEEEE',
  }
});

AppRegistry.registerComponent('domradio', () => domradio);

