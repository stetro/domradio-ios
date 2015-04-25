'use strict';

var React = require('react-native');

var {
  AppRegistry,
  StyleSheet,
  Text,
  View,
  ScrollView
} = React;

var styles = StyleSheet.create({
  news: {
    backgroundColor: '#EEEEEE',
  },
  newsItem: {
    backgroundColor: '#FFFFFF',
    margin: 15,
    padding: 15,
    borderWidth: 0.5,
    borderColor: '#CCCCCC'
  },
  title: {
    color: '#C63826',
    fontSize: 21,
    fontWeight: 'bold',
    paddingBottom: 5
  },
  date: {
    color: '#777777',
    fontSize: 14,
    paddingBottom: 5
  },
  text: {},
  more: {
    color: '#777777',
    alignSelf: 'flex-end',
    marginTop: 10,
    marginBottom: 5
  },
  seperator: {
    backgroundColor: '#CCCCCC',
    height: 0.5
  }
});

exports.DomradioNews = React.createClass({
  render: function() {
    return (<ScrollView style={ styles.news } >
              <View style={styles.newsItem}>
                <Text style={styles.title}>Nachrichten Titel</Text>
                <Text style={styles.date}>21.05.2015 14:30</Text>
                <Text style={styles.text}>lorem aösdkjf aksdj föaskdf öaksjdf öasjdf ökashdf öas dö fasd lorem aösdkjf aksdj lorem aösdkjf aksdj föaskdf öaksjdf öasjdf ökashdf öas dö fasd lorem aösdkjf aksdj föaskdf öaksjdf öasjdf ökashdf öas dö fasd lorem aösdkjf aksdj föaskdf öaksjdf öasjdf ökashdf öas dö fasd lorem aösdkjf aksdj föaskdf öaksjdf öasjdf ökashdf öas dö fasd lorem aösdkjf aksdj föaskdf öaksjdf öasjdf ökashdf öas dö fasd</Text>
                <Text style={styles.more}>Artikel lesen</Text>
              </View>
              <View style={styles.seperator}/>
              <View style={styles.newsItem}>
                <Text style={styles.title}>Nachrichten Titel</Text>
                <Text style={styles.date}>21.05.2015 14:30</Text>
                <Text style={styles.text}>lorem aösdkjf aksdj föaskdf öaksjdf öasjdf ökashdf öas dö fasd lorem aösdkjf aksdj lorem aösdkjf aksdj föaskdf öaksjdf öasjdf ökashdf öas dö fasd lorem aösdkjf aksdj föaskdf öaksjdf öasjdf ökashdf öas dö fasd lorem aösdkjf aksdj föaskdf öaksjdf öasjdf ökashdf öas dö fasd lorem aösdkjf aksdj föaskdf öaksjdf öasjdf ökashdf öas dö fasd lorem aösdkjf aksdj föaskdf öaksjdf öasjdf ökashdf öas dö fasd</Text>
                <Text style={styles.more}>Artikel lesen</Text>
              </View>
              <View style={styles.seperator}/>
              <View style={styles.newsItem}>
                <Text style={styles.title}>Nachrichten Titel</Text>
                <Text style={styles.date}>21.05.2015 14:30</Text>
                <Text style={styles.text}>lorem aösdkjf aksdj föaskdf öaksjdf öasjdf ökashdf öas dö fasd lorem aösdkjf aksdj lorem aösdkjf aksdj föaskdf öaksjdf öasjdf ökashdf öas dö fasd lorem aösdkjf aksdj föaskdf öaksjdf öasjdf ökashdf öas dö fasd lorem aösdkjf aksdj föaskdf öaksjdf öasjdf ökashdf öas dö fasd lorem aösdkjf aksdj föaskdf öaksjdf öasjdf ökashdf öas dö fasd lorem aösdkjf aksdj föaskdf öaksjdf öasjdf ökashdf öas dö fasd</Text>
                <Text style={styles.more}>Artikel lesen</Text>
              </View>
    				</ScrollView>);
  }
});
