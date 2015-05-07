'use strict';

var React = require('react-native');
var DomradioNewsRepository = require('../bridges/DomradioNewsRepository');
var DomradioNewsItem = require('../components/DomradioNewsItem');
var DomradioNewsDetail = require('../components/DomradioNewsDetail');
var RefreshableListView = require('react-native-refreshable-listview')

var {
  StyleSheet,
  ScrollView,
  ListView,
  AlertIOS,
  DeviceEventEmitter
} = React;

var dataSource = new ListView.DataSource({
  rowHasChanged: (r1, r2) => r1.id !== r2.id
});

var DomradioNews = React.createClass({
  componentWillMount:function() {
    this.subscription = DeviceEventEmitter.addListener(
      'RSSBridgeEvent', (event) => {
        if (event.news != null) {
          this.setState({
            dataSource: this.state.dataSource.cloneWithRows(event.news)
          });
        } else {
          AlertIOS.alert('Fehler', 'Das Laden der Nachrichten ist fehlgeschlagen.');
        }
      }
    );
    this.loadNewsFeed();
  },
  componentWillUnmount:function() {
    this.subscription.remove();
  },
  getInitialState: function() {
    return {
      dataSource: dataSource.cloneWithRows([])
    }
  },
  render: function() {
    return (
      <RefreshableListView
        style={styles.list}
        pageSize='4'
        minPulldownDistance='40'
        stylesheet={pullDownStyle}
        dataSource={this.state.dataSource}
        renderRow={this.renderNewsItem}
        loadData={this.loadNewsFeed}
        refreshDescription="Aktualisieren"/>);
  },
  renderNewsItem: function(item) {
    return <DomradioNewsItem 
        title={item.title} 
        pubDate={item.pubDate} 
        description={item.description} 
        openNewsDetails={() => this.openNewsDetails(item.link, item.title)}/>
  },
  loadNewsFeed: function() {
    DomradioNewsRepository.triggerNewsRefresh();
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

var pullDownStyle = StyleSheet.create({
  wrapper: {
    height: 60,
    marginTop: 10,
  },
  container: {
    flex: 1,
    justifyContent: 'space-around',
    alignItems: 'center',
    backgroundColor: '#EEEEEE',
  },
  loading: {
    height: 60,
  },
})

module.exports = DomradioNews;
