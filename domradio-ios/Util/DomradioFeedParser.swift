//
//  FeedParser.swift
//  domradio-ios
//
//  Created by Steffen Tröster on 23/06/15.
//  Copyright (c) 2015 Steffen Tröster. All rights reserved.
//

class DomradioFeedParser : NSObject, MWFeedParserDelegate{
    
    var items = [MWFeedItem]()
    var target:DomradioFeedParserDelegate
    
    init(target:DomradioFeedParserDelegate){
        self.target = target
    }
    
    func parseNews(){
        var url = NSURL(string: "http://www.domradio.de/rss-feeds/domradio-rss.xml")
        var feedParser = MWFeedParser(feedURL: url)
        feedParser.delegate = self
        feedParser.parse()
        self.items = [MWFeedItem]()
    }
    
    func feedParser(parser: MWFeedParser!, didParseFeedItem item: MWFeedItem!) {
        self.items.append(item)
    }

    func feedParser(parser: MWFeedParser!, didFailWithError error: NSError!) {
        self.target.failedNewsParsing()
    }
    
    func feedParserDidFinish(parser: MWFeedParser!) {
        self.target.succeedNewsParsing(self.items)
    }
    
    func getItems() -> [MWFeedItem]{
        return self.items
    }
    
}
