'use strict';

var React = require('react-native');

var DomradioAudioStream = require('../bridge/DomradioAudioStream');

var { StyleSheet, Text, View, Image, TouchableHighlight, DeviceEventEmitter } = React;

var DomradioPlayer = React.createClass({
  getInitialState: function() {
    this.subscription = DeviceEventEmitter.addListener(
      'AudioBridgeEvent', (event) => this.setState(event)
    );
    DomradioAudioStream.getStatus((error, status)=>{
      this.setState(status);
    });
    return { status: 'STOPPED' };
  },
  render: function() {
    var playerIcon, playerText;
    if (this.state.status == 'STOPPED') {
      playerIcon = require('image!PlayButton');
    } else {
      playerIcon = require('image!PauseButton');
    }
    if (this.state.status == 'LOADING') {
      playerText = 'Lädt ...';
    } else {
      playerText = 'domradio.de Livestream';
    }

    return (<View style={styles.navigation}>
              <TouchableHighlight activeOpacity={0.3}
                  underlayColor={'#444444'}
                  onPress={this.onPlayerClick}>
                <Image style={ styles.playButton } 
                  source={ playerIcon }/>
              </TouchableHighlight>
              <Text style={ styles.text }>{ playerText }</Text>
            </View>);
  },
  onPlayerClick: function() {
    if (this.state.status == 'STOPPED') {
      this.setState({
        status: 'LOADING'
      });
      DomradioAudioStream.play();
    } else {
      this.setState({
        status: 'STOPPED'
      });
      DomradioAudioStream.stop();
    }
  },
  componentWillUnmount :function() {
    this.subscription.remove();
  }
});

var styles = StyleSheet.create({
  navigation:{
    backgroundColor: '#333333',
    flexDirection:'row'
  },
  text:{
    color: '#FFFFFF',
    fontSize: 16,
    padding: 20,
    paddingLeft: 10,
    flex: 1
  },
  playButton:{
    width: 40,
    height: 40,
    margin: 9,
    backgroundColor: 'transparent'
  }
});

module.exports = DomradioPlayer;
