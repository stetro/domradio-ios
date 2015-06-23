//
//  NewsViewController.swift
//  domradio-ios
//
//  Created by Steffen Tröster on 23/06/15.
//  Copyright (c) 2015 Steffen Tröster. All rights reserved.
//


import UIKit

class NewsViewController: UITableViewController, DomradioFeedParserDelegate {
    
    var parser:DomradioFeedParser?
    var items:[MWFeedItem] = [MWFeedItem]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "domradio.de"
        
        var refreshControl = UIRefreshControl()
        refreshControl.addTarget(self, action: "loadNews:", forControlEvents: UIControlEvents.ValueChanged)
        refreshControl.attributedTitle = NSAttributedString(string: "Zum Aktualisieren herunterziehen ...")
        self.refreshControl = refreshControl;
        self.tableView.addSubview(refreshControl)
        
        self.tableView.rowHeight = UITableViewAutomaticDimension
        self.tableView.estimatedRowHeight = 200.0
        self.parser = DomradioFeedParser(target:self)
        self.parser!.parseNews()
    }

    func loadNews(sender:UIRefreshControl){
        self.parser!.parseNews()
    }
    
    func succeedNewsParsing(items: [MWFeedItem]) {
        self.refreshControl!.endRefreshing()
        self.items = items
        self.tableView.reloadSections(
            NSIndexSet(indexesInRange: NSMakeRange(0, self.tableView.numberOfSections())),
            withRowAnimation: .None)
    }
    
    func failedNewsParsing() {
        println("FAILED!!")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCellWithIdentifier("newsCell", forIndexPath: indexPath) as! NewsTableViewCell
        cell.fillNews(items[indexPath.item])
        return cell
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
}
