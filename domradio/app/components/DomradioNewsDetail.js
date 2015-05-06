'use strict';

var React = require('react-native');
var ProgressBar = require('react-native-progress-bar');

var { WebView, View, StyleSheet, AlertIOS, ActivityIndicatorIOS } = React;

var DomradioNewsDetail = React.createClass({
  render: function() {
    return (
      <View style={styles.container}>
        <WebView 
          startInLoadingState={true}
          onNavigationStateChange={this.onNavigationStateChange}
          renderError={this.renderError}
          url={this.props.data.link} 
          style={styles.webView}/>
      </View>
      );
  },
  onNavigationStateChange: function(navState) {
    console.log(navState);
    if(navState.title == ''){
      console.log('loading ...');
    }else{
      console.log(navState.title + " - loading: " + navState.loading);
    }
  },
  renderError:function(error) {
    AlertIOS.alert('Fehler', 'Das Laden des Artikels ist fehlgeschlagen.');
  }
});

var styles = StyleSheet.create({
  container: {
    flex: 1
  },
  webView: {
    flex: 1
  }
});

module.exports = DomradioNewsDetail;
