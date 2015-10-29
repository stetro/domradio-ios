//
//  CategoryViewController.swift
//  domradio-ios
//
//  Created by Steffen Tröster on 25/06/15.
//  Copyright (c) 2015 Steffen Tröster. All rights reserved.
//

import UIKit

class CategoryViewController: UITableViewController {
    
    var topics = ["Alle Nachrichten", "Adveniat", "Benedikt XVI.", "Bibel", "Bischofskonferenz", "Bischofssynode", "Bistümer", "Bonifatiuswerk", "Caritas", "Christenverfolgung", "Ehe und Familie", "Erzbistum Köln", "Ethik und Moral", "Eucharistischer Kongress", "Evangelii gaudium", "Fastenzeit", "Flüchtlingshilfe", "Heilige Teresa von Ávila", "Heiliges Jahr", "Hildegard von Bingen", "Hochfeste", "Interreligiöser Dialog", "Islam und Kirche", "Joachim Kardinal Meisner", "Judentum", "Jugend und Spiritualität", "Karneval", "Karwoche", "Katholikentag", "Kirche und Politik", "Kirchenjahr", "Kirchentag", "Kölner Dom", "Kolping International", "Konklave", "Kultur", "Laien", "Menschenrechte", "Ministrantenwallfahrt 2013", "Ökumene", "Ökumenischer Kirchentag", "Ostern", "Papst Franziskus", "Papst Franziskus in Straßburg", "Rainer Maria Kardinal Woelki", "Reformen", "Renovabis", "Schöpfung", "Seelsorge", "Soldaten und Kirche", "Soziales", "Sport und Kirche", "Taizé", "Vatikan", "Weihbischof Ansgar Puff", "Weihbischof Dominikus Schwaderlapp", "Weihbischof em. Manfred Melzer", "Weihnachten", "Weltjugendtage", "Weltkirche", "Zweites Vatikanisches Konzil"]
    
    var links = [
        "Alle Nachrichten": "https://www.domradio.de/rss-feeds/domradio-rss.xml",
        "Adveniat": "https://www.domradio.de/rss-feeds/themen/157957/domradio-rss.xml",
        "Benedikt XVI.": "https://www.domradio.de/rss-feeds/themen/49/domradio-rss.xml",
        "Bibel": "https://www.domradio.de/rss-feeds/themen/28/domradio-rss.xml",
        "Bischofskonferenz": "https://www.domradio.de/rss-feeds/themen/27/domradio-rss.xml",
        "Bischofssynode": "https://www.domradio.de/rss-feeds/themen/486/domradio-rss.xml",
        "Bistümer": "https://www.domradio.de/rss-feeds/themen/29/domradio-rss.xml",
        "Bonifatiuswerk": "https://www.domradio.de/rss-feeds/themen/160509/domradio-rss.xml",
        "Caritas": "https://www.domradio.de/rss-feeds/themen/30/domradio-rss.xml",
        "Christenverfolgung": "https://www.domradio.de/rss-feeds/themen/31/domradio-rss.xml",
        "Ehe und Familie": "https://www.domradio.de/rss-feeds/themen/20/domradio-rss.xml",
        "Erzbistum Köln": "https://www.domradio.de/rss-feeds/themen/165314/domradio-rss.xml",
        "Ethik und Moral": "https://www.domradio.de/rss-feeds/themen/607/domradio-rss.xml",
        "Eucharistischer Kongress": "https://www.domradio.de/rss-feeds/themen/33/domradio-rss.xml",
        "Evangelii gaudium": "https://www.domradio.de/rss-feeds/themen/168419/domradio-rss.xml",
        "Fastenzeit": "https://www.domradio.de/rss-feeds/themen/34/domradio-rss.xml",
        "Flüchtlingshilfe": "https://www.domradio.de/rss-feeds/themen/182985/domradio-rss.xml",
        "Heilige Teresa von Ávila": "https://www.domradio.de/rss-feeds/themen/189057/domradio-rss.xml",
        "Heiliges Jahr": "https://www.domradio.de/rss-feeds/themen/189711/domradio-rss.xml",
        "Hildegard von Bingen": "https://www.domradio.de/rss-feeds/themen/489/domradio-rss.xml",
        "Hochfeste": "https://www.domradio.de/rss-feeds/themen/36/domradio-rss.xml",
        "Interreligiöser Dialog": "https://www.domradio.de/rss-feeds/themen/37/domradio-rss.xml",
        "Islam und Kirche": "https://www.domradio.de/rss-feeds/themen/38/domradio-rss.xml",
        "Joachim Kardinal Meisner": "https://www.domradio.de/rss-feeds/themen/39/domradio-rss.xml",
        "Judentum": "https://www.domradio.de/rss-feeds/themen/168443/domradio-rss.xml",
        "Jugend und Spiritualität": "https://www.domradio.de/rss-feeds/themen/171083/domradio-rss.xml",
        "Karneval": "https://www.domradio.de/rss-feeds/themen/40/domradio-rss.xml",
        "Karwoche": "https://www.domradio.de/rss-feeds/themen/41/domradio-rss.xml",
        "Katholikentag": "https://www.domradio.de/rss-feeds/themen/42/domradio-rss.xml",
        "Kirche und Politik": "https://www.domradio.de/rss-feeds/themen/168418/domradio-rss.xml",
        "Kirchenjahr": "https://www.domradio.de/rss-feeds/themen/477/domradio-rss.xml",
        "Kirchentag": "https://www.domradio.de/rss-feeds/themen/43/domradio-rss.xml",
        "Kölner Dom": "https://www.domradio.de/rss-feeds/themen/32/domradio-rss.xml",
        "Kolping International": "https://www.domradio.de/rss-feeds/themen/159180/domradio-rss.xml",
        "Konklave": "https://www.domradio.de/rss-feeds/themen/155604/domradio-rss.xml",
        "Kultur": "https://www.domradio.de/rss-feeds/themen/45/domradio-rss.xml",
        "Laien": "https://www.domradio.de/rss-feeds/themen/46/domradio-rss.xml",
        "Menschenrechte": "https://www.domradio.de/rss-feeds/themen/168448/domradio-rss.xml",
        "Ministrantenwallfahrt 2013": "https://www.domradio.de/rss-feeds/themen/166700/domradio-rss.xml",
        "Ökumene": "https://www.domradio.de/rss-feeds/themen/47/domradio-rss.xml",
        "Ökumenischer Kirchentag": "https://www.domradio.de/rss-feeds/themen/480/domradio-rss.xml",
        "Ostern": "https://www.domradio.de/rss-feeds/themen/48/domradio-rss.xml",
        "Papst Franziskus": "https://www.domradio.de/rss-feeds/themen/156334/domradio-rss.xml",
        "Papst Franziskus in Straßburg": "https://www.domradio.de/rss-feeds/themen/183514/domradio-rss.xml",
        "Rainer Maria Kardinal Woelki": "https://www.domradio.de/rss-feeds/themen/177841/domradio-rss.xml",
        "Reformen": "https://www.domradio.de/rss-feeds/themen/51/domradio-rss.xml",
        "Renovabis": "https://www.domradio.de/rss-feeds/themen/159672/domradio-rss.xml",
        "Schöpfung": "https://www.domradio.de/rss-feeds/themen/52/domradio-rss.xml",
        "Seelsorge": "https://www.domradio.de/rss-feeds/themen/53/domradio-rss.xml",
        "Soldaten und Kirche": "https://www.domradio.de/rss-feeds/themen/54/domradio-rss.xml",
        "Soziales": "https://www.domradio.de/rss-feeds/themen/155951/domradio-rss.xml",
        "Sport und Kirche": "https://www.domradio.de/rss-feeds/themen/474/domradio-rss.xml",
        "Taizé": "https://www.domradio.de/rss-feeds/themen/55/domradio-rss.xml",
        "Vatikan": "https://www.domradio.de/rss-feeds/themen/128235/domradio-rss.xml",
        "Weihbischof Ansgar Puff": "https://www.domradio.de/rss-feeds/themen/161071/domradio-rss.xml",
        "Weihbischof Dominikus Schwaderlapp": "https://www.domradio.de/rss-feeds/themen/62/domradio-rss.xml",
        "Weihbischof em. Manfred Melzer": "https://www.domradio.de/rss-feeds/themen/57/domradio-rss.xml",
        "Weihnachten": "https://www.domradio.de/rss-feeds/themen/63/domradio-rss.xml",
        "Weltjugendtage": "https://www.domradio.de/rss-feeds/themen/64/domradio-rss.xml",
        "Weltkirche": "https://www.domradio.de/rss-feeds/themen/65/domradio-rss.xml",
        "Zweites Vatikanisches Konzil": "https://www.domradio.de/rss-feeds/themen/483/domradio-rss.xml"]
    
    var updatingCategoryCallback: ((String , String) -> ())?
    
    var selectedTopic:String?
    var selectedLink:String?
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell:UITableViewCell = tableView.dequeueReusableCellWithIdentifier("categoryCell", forIndexPath: indexPath)
        cell.textLabel!.text = topics[indexPath.item]
        return cell
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return topics.count
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        self.tableView!.cellForRowAtIndexPath(indexPath)
        self.tableView!.deselectRowAtIndexPath(indexPath, animated: true)
        self.selectedTopic = topics[indexPath.item]
        self.selectedLink = links[topics[indexPath.item]]
        navigationController?.dismissViewControllerAnimated(true, completion: updateSelectedData)
    }
    
    override func tableView(tableView: UITableView, willDisplayCell cell: UITableViewCell, forRowAtIndexPath indexPath: NSIndexPath) {
        cell.layoutMargins = UIEdgeInsetsZero
    }
    
    @IBAction func exitModal(){
        let navigationController = self.parentViewController as! UINavigationController;
        navigationController.dismissViewControllerAnimated(true, completion: nil)
    }
    
    func updateSelectedData(){
        if  let topic = self.selectedTopic,
            let link = self.selectedLink,
            let callback = self.updatingCategoryCallback{
            callback(topic, link)
        }
    }
    
}
