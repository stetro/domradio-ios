'use strict';

var React = require('react-native');

var { StyleSheet, Text, View, Image } = React;

var styles = StyleSheet.create({
  navigation:{
    backgroundColor: '#333333',
    flexDirection:'row'
  },
  text:{
    color: '#FFFFFF',
    fontSize: 16,
    padding: 20,
    flex: 1
  },
  playButton:{
    width: 40,
    height: 40,
    margin: 9,
    backgroundColor: 'transparent'
  }
});

var DomradioPlayer = React.createClass({
  render: function() {
    return (<View style={styles.navigation}>
              <Image style={ styles.playButton } source={{uri:'play', isStatic:true}}/>
              <Text style={ styles.text }>domradio.de Livestream</Text>
            </View>)
  }
});

module.exports = DomradioPlayer;
