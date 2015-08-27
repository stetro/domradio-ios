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
    
    var title = "domradio.de"
    var link = "http://www.domradio.de/rss-feeds/domradio-rss.xml"
    
    init(target:DomradioFeedParserDelegate){
        self.target = target
    }
    
    func parseNews(){
        let url = NSURL(string: link)
        let feedParser = MWFeedParser(feedURL: url)
        feedParser.delegate = self
        feedParser.connectionType = ConnectionTypeAsynchronously
        feedParser.parse()
        self.items = [MWFeedItem]()
    }
    
    func feedParser(parser: MWFeedParser!, didParseFeedItem item: MWFeedItem!) {
        self.items.append(item)
    }

    func feedParser(parser: MWFeedParser!, didFailWithError error: NSError!) {
        self.target.failedNewsParsing(error)
    }
    
    func feedParserDidFinish(parser: MWFeedParser!) {
        self.target.succeedNewsParsing(self.items)
    }
    
    func getItems() -> [MWFeedItem]{
        return self.items
    }
    
    func update(title:String, link:String){
        self.title = title
        self.link = link
        self.parseNews()
    }
    
}
