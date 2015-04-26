'use strict';

var React = require('react-native');
var ProgressBar = require('react-native-progress-bar');

var { WebView, View, StyleSheet } = React;

var DomradioNewsDetail = React.createClass({
  getInitialState: function() {
    return { progress: 0.4 };
  },
  render: function() {
    return (
      <View style={styles.container}>
        <ProgressBar
          fillStyle={{backgroundColor:'#C63826'}}
          backgroundStyle={{borderRadius: 3}}
          style={styles.progressbar}
          progress={this.state.progress} />
        <WebView url={this.props.data.link} style={styles.webView}/>
      </View>
      );
  }
});

var styles = StyleSheet.create({
  container: {
    flex: 1
  },
  webView: {
    flex: 1
  },
  progressbar:{
    margin: 2,
    backgroundColor: '#444444'
  }
});

module.exports = DomradioNewsDetail;
