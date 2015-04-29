'use strict';

var React = require('react-native');
var DomradioNewsRepository = require('../bridge/DomradioNewsRepository');
var DomradioNewsItem = require('../components/DomradioNewsItem');
var DomradioNewsDetail = require('../components/DomradioNewsDetail');

var {
  StyleSheet,
  ScrollView,
  ListView,
  AlertIOS
} = React;

var dataSource = new ListView.DataSource({
  rowHasChanged: (r1, r2) => r1.id !== r2.id
});

var DomradioNews = React.createClass({
  getInitialState: function() {
    this.loadNewsFeed();
    return {
      dataSource: dataSource.cloneWithRows([])
    }
  },
  render: function() {
    return (<ListView
      style={styles.list}
      pageSize='4'
      dataSource={this.state.dataSource}
      renderRow={this.renderNewsItem}/>);
  },
  renderNewsItem: function(item) {
    return <DomradioNewsItem 
        title={item.title} 
        pubDate={item.pubDate} 
        description={item.description} 
        openNewsDetails={() => this.openNewsDetails(item.link, item.title)}/>
  },
  loadNewsFeed: function() {
    var that = this;
    DomradioNewsRepository.getNews()
      .then(function(news) {
        that.setState({
          dataSource: that.state.dataSource.cloneWithRows(news)
        });
      })
      .catch(function(error) {
        AlertIOS.alert('Fehler', 'Das Laden der Nachrichten ist fehlgeschlagen.');
      });
  },
  openNewsDetails: function(link, title) {
    this.props.toRoute({
      name: 'Artikel lesen',
      component: DomradioNewsDetail,
      data: {
        link: link
      }
    });
  }
});

var styles = StyleSheet.create({
  list: {
    backgroundColor:'#EEEEEE'
  }
});

module.exports = DomradioNews;
