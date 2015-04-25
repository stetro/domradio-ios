'use strict';

var React = require('react-native');
var { DomradioPlayer } = require('./app/components/DomradioPlayer');
var { DomradioNews } = require('./app/components/DomradioNews');

var {
  AppRegistry,
  StyleSheet,
  Text,
  View,
  NavigatorIOS
} = React;

var domradio = React.createClass({
  render: function() {
    return ( <View style = { styles.container }>
              <NavigatorIOS style={styles.navigation} initialRoute={{title: 'domradio.de',component: DomradioNews}}/>
              <DomradioPlayer style={styles.player}/>
            </View> );
  }
});

var styles = StyleSheet.create({
  container: {
    flex: 1
  },
  navigation:{
    flex: 1
  },
  player:{
    flex: 1
  }
});

AppRegistry.registerComponent('domradio', () => domradio);

