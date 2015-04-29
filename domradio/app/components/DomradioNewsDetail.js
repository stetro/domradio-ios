'use strict';

var React = require('react-native');
var ProgressBar = require('react-native-progress-bar');

var { WebView, View, StyleSheet } = React;

var DomradioNewsDetail = React.createClass({
  render: function() {
    return (
      <View style={styles.container}>
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
  }
});

module.exports = DomradioNewsDetail;
