'use strict';

var React = require('react-native');

var {
  StyleSheet,
  Text,
  View,
  LinkingIOS,
  TouchableHighlight
} = React;

var DomradioNewsItem = React.createClass({
  render: function() {
    return (<View>
              <TouchableHighlight activeOpacity={0.6}
                  underlayColor={'white'}
                  onPress={this.props.openNewsDetails}>
                <View style={styles.newsItem}>
                  <Text style={styles.title}>{this.props.title}</Text>
                  <Text style={styles.pubDate}>{this.props.pubDate}</Text>
                  <Text style={styles.description}>{this.props.description}</Text>
                  <Text style={styles.more}>Artikel lesen</Text>
                </View>
              </TouchableHighlight>
              <View style={styles.seperator}/>
            </View>);
  }
});

var styles = StyleSheet.create({
  newsItem: {
    backgroundColor: '#FFFFFF',
    margin: 15,
    padding: 15,
    borderWidth: 0.5,
    borderColor: '#CCCCCC'
  },
  title: {
    color: '#C63826',
    fontSize: 18,
    fontWeight: 'bold',
    paddingBottom: 5
  },
  pubDate: {
    color: '#777777',
    fontSize: 14,
    paddingBottom: 5
  },
  description: {},
  more: {
    color: '#777777',
    alignSelf: 'flex-end',
    marginTop: 5,
    marginBottom: 5
  },
  seperator: {
    backgroundColor: '#CCCCCC',
    height: 0.5
  }
});

module.exports = DomradioNewsItem;
