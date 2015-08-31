//
//  NewsViewController.swift
//  domradio-ios
//
//  Created by Steffen Tröster on 23/06/15.
//  Copyright (c) 2015 Steffen Tröster. All rights reserved.
//


import UIKit
import QuartzCore

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

    func startParsinggNews() {
        self.refreshControl?.beginRefreshing()
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
        self.refreshControl?.endRefreshing()
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
                self.tableView.deselectRowAtIndexPath(self.tableView.indexPathForSelectedRow!, animated: true)
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
    
    override func tableView(tableView: UITableView, willDisplayCell cell: UITableViewCell, forRowAtIndexPath indexPath: NSIndexPath) {
        cell.layoutMargins = UIEdgeInsetsZero
    }
    
    func openDomradioDe(){
        let url = NSURL(string:"http://domradio.de")!
        UIApplication.sharedApplication().openURL(url)
    }
    
    @IBAction func showInfo(){
        let cv = UIViewController(nibName: "InfoView", bundle: nil)
        let view = cv.view
        let popup = KLCPopup(contentView: view, showType: KLCPopupShowType.BounceIn, dismissType: KLCPopupDismissType.BounceOutToBottom, maskType: KLCPopupMaskType.Dimmed, dismissOnBackgroundTouch: true, dismissOnContentTouch: false)
        let domradio = view.viewWithTag(3) as! UIButton // domradio.de Button
        let close = view.viewWithTag(4) as! UIButton// Close Button
        close.addTarget(popup, action: "dismiss", forControlEvents: UIControlEvents.TouchUpInside)
        domradio.addTarget(self, action: "openDomradioDe", forControlEvents: UIControlEvents.TouchUpInside)
        popup.show()
    }
}
