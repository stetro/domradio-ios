'use strict';

var React = require('react-native');
var Router = require('react-native-router');

var DomradioPlayer = require('./app/components/DomradioPlayer');
var DomradioNews = require('./app/components/DomradioNews');
var InfoButton = require('./app/components/InfoButton');
var BackButton = require('./app/components/BackButton');
var DomradioInfo = require('./app/utils/DomradioInfo');
var DomradioNewsRepository = require('./app/bridges/DomradioNewsRepository');

var {
  AppRegistry,
  StyleSheet,
  View
} = React;

var newsListRoute = {
  name: 'domradio.de',
  component: DomradioNews,
  rightCorner: InfoButton
};

var domradio = React.createClass({
  render: function() {
    return (<View style = { styles.container }>
              <Router 
                firstRoute={newsListRoute} 
                headerStyle={styles.header}
                backButtonComponent={BackButton}
                customAction={DomradioInfo.show} />
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
