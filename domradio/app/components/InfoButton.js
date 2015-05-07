'use strict';

var React = require('react-native');

var {
  StyleSheet,
  Image,
  TouchableHighlight
} = React;

var InfoButton = React.createClass({
  onPress: function() {
    this.props.customAction("refreshDomradioNews");
  },
  render: function() {
    return (<TouchableHighlight underlayColor="transparent" onPress={this.onPress}>
              <Image style={ styles.backButton } source={ require('image!InfoButton') }/>
            </TouchableHighlight>);
  }
});

var styles = StyleSheet.create({
  backButton: {
    width: 22,
    height: 22,
    marginLeft: 10,
    marginTop: 3,
    marginRight: 10
  }
});

module.exports = InfoButton;
