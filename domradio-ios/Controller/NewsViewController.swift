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
        self.parser = DomradioFeedParser(target:self)
        self.title = parser?.title
        
        let refreshControl = UIRefreshControl()
        refreshControl.addTarget(self, action: "loadNews:", forControlEvents: UIControlEvents.ValueChanged)
        refreshControl.attributedTitle = NSAttributedString(string: "Zum Aktualisieren herunterziehen ...")
        self.refreshControl = refreshControl;
        self.tableView.addSubview(refreshControl)
        self.tableView.rowHeight = UITableViewAutomaticDimension
        self.tableView.estimatedRowHeight = 200.0
        self.parser!.parseNews()
    }

    func loadNews(sender:UIRefreshControl){
        self.parser!.parseNews()
    }
    
    func succeedNewsParsing(items: [MWFeedItem]) {
        self.refreshControl!.endRefreshing()
        self.title = parser?.title
        self.items = items
        self.tableView.reloadSections(
            NSIndexSet(indexesInRange: NSMakeRange(0, self.tableView.numberOfSections)),
            withRowAnimation: .None)
        self.tableView.setContentOffset(CGPointZero, animated: true)
    }
    
    func failedNewsParsing(error:NSError) {
        RKDropdownAlert.title("Fehler", message: "Nachrichten konnten nicht geladen werden!" );
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if let _ = segue.identifier{
            if(segue.identifier! == "showNews"){
                let detailController = segue.destinationViewController as! NewsDetailViewController
                detailController.item = items[self.tableView.indexPathForSelectedRow!.item]
            }
            if(segue.identifier! == "selectCategory"){
                let detailController = segue.destinationViewController as! NavigationController
                let categoryViewController = detailController.viewControllers.first as! CategoryViewController
                categoryViewController.updatingCategoryCallback = self.parser!.update
            }
        }
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("newsCell", forIndexPath: indexPath) as! NewsTableViewCell
        cell.fillNews(items[indexPath.item])
        return cell
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    @IBAction func showInfo(){
        let cv = UIViewController(nibName: "InfoView", bundle: nil)
        let popup = KLCPopup(contentView: cv.view, showType: KLCPopupShowType.BounceIn, dismissType: KLCPopupDismissType.BounceOutToBottom, maskType: KLCPopupMaskType.Dimmed, dismissOnBackgroundTouch: true, dismissOnContentTouch: true)
        popup.show()
    }
}
