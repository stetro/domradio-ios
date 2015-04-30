'use strict';

var React = require('react-native');
var Router = require('react-native-router');

var DomradioPlayer = require('./app/components/DomradioPlayer');
var DomradioNews = require('./app/components/DomradioNews');
var RefreshButton = require('./app/components/RefreshButton');
var BackButton = require('./app/components/BackButton');

var DomradioNewsRepository = require('./app/bridge/DomradioNewsRepository');

var {
  AppRegistry,
  StyleSheet,
  View
} = React;

var newsListRoute = {
  name: 'domradio.de',
  component: DomradioNews,
  rightCorner: RefreshButton
};

var domradio = React.createClass({
  render: function() {
    return (<View style = { styles.container }>
              <Router 
                firstRoute={newsListRoute} 
                headerStyle={styles.header}
                backButtonComponent={BackButton}
                customAction={DomradioNewsRepository.triggerNewsRefresh} />
              <DomradioPlayer style={styles.player}/>
            </View>);
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
  },
  header:{
    backgroundColor:'#ab3c2d'
  }
});

AppRegistry.registerComponent('domradio', () => domradio);
