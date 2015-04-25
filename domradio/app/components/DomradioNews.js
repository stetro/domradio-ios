'use strict';

var React = require('react-native');
var DomradioNewsRepository = require('../data/DomradioNewsRepository');

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
    marginTop: 10,
    marginBottom: 5
  },
  seperator: {
    backgroundColor: '#CCCCCC',
    height: 0.5
  }
});

var DomradioNewsItem = React.createClass({
  getDefaultProps:function() {
    return {
      title: 'Sample Title',
      pubDate: 'Sample Date',
      description: 'Sample Text',
      link: 'http://domradio.de'
    }
  },
  render: function() {
    return (<View>
              <View style={styles.newsItem}>
                <Text style={styles.title}>{this.props.title}</Text>
                <Text style={styles.pubDate}>{this.props.pubDate}</Text>
                <Text style={styles.description}>{this.props.description}</Text>
                <Text style={styles.more}>Artikel lesen</Text>
              </View>
              <View style={styles.seperator}/>
            </View>);
  }
});

exports.DomradioNews = React.createClass({
  getInitialState: function() {
    var that = this;
    DomradioNewsRepository.getNews(function(err, news) {
      if (err) {
        console.alert('News konnten nicht geladen werden!');
      } else {
        console.log('Updating news ...');
        that.setState({
          news: news
        });
      }
    });
    return {
      news: []
    }
  },
  render: function() {
    var newsItems = this.state.news.map(function(item) {
      console.log(item);
      return <DomradioNewsItem 
        title={item.title} 
        pubDate={item.pubDate} 
        description={item.description} 
        link={item.link}/>
    })
    return (<ScrollView style={ styles.news } >
              {newsItems}
    				</ScrollView>);
  }
});


