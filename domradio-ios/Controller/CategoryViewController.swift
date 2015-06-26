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
        "Alle Nachrichten": "http://www.domradio.de/rss-feeds/domradio-rss.xml",
        "Adveniat": "http://www.domradio.de/rss-feeds/themen/157957/domradio-rss.xml",
        "Benedikt XVI.": "http://www.domradio.de/rss-feeds/themen/49/domradio-rss.xml",
        "Bibel": "http://www.domradio.de/rss-feeds/themen/28/domradio-rss.xml",
        "Bischofskonferenz": "http://www.domradio.de/rss-feeds/themen/27/domradio-rss.xml",
        "Bischofssynode": "http://www.domradio.de/rss-feeds/themen/486/domradio-rss.xml",
        "Bistümer": "http://www.domradio.de/rss-feeds/themen/29/domradio-rss.xml",
        "Bonifatiuswerk": "http://www.domradio.de/rss-feeds/themen/160509/domradio-rss.xml",
        "Caritas": "http://www.domradio.de/rss-feeds/themen/30/domradio-rss.xml",
        "Christenverfolgung": "http://www.domradio.de/rss-feeds/themen/31/domradio-rss.xml",
        "Ehe und Familie": "http://www.domradio.de/rss-feeds/themen/20/domradio-rss.xml",
        "Erzbistum Köln": "http://www.domradio.de/rss-feeds/themen/165314/domradio-rss.xml",
        "Ethik und Moral": "http://www.domradio.de/rss-feeds/themen/607/domradio-rss.xml",
        "Eucharistischer Kongress": "http://www.domradio.de/rss-feeds/themen/33/domradio-rss.xml",
        "Evangelii gaudium": "http://www.domradio.de/rss-feeds/themen/168419/domradio-rss.xml",
        "Fastenzeit": "http://www.domradio.de/rss-feeds/themen/34/domradio-rss.xml",
        "Flüchtlingshilfe": "http://www.domradio.de/rss-feeds/themen/182985/domradio-rss.xml",
        "Heilige Teresa von Ávila": "http://www.domradio.de/rss-feeds/themen/189057/domradio-rss.xml",
        "Heiliges Jahr": "http://www.domradio.de/rss-feeds/themen/189711/domradio-rss.xml",
        "Hildegard von Bingen": "http://www.domradio.de/rss-feeds/themen/489/domradio-rss.xml",
        "Hochfeste": "http://www.domradio.de/rss-feeds/themen/36/domradio-rss.xml",
        "Interreligiöser Dialog": "http://www.domradio.de/rss-feeds/themen/37/domradio-rss.xml",
        "Islam und Kirche": "http://www.domradio.de/rss-feeds/themen/38/domradio-rss.xml",
        "Joachim Kardinal Meisner": "http://www.domradio.de/rss-feeds/themen/39/domradio-rss.xml",
        "Judentum": "http://www.domradio.de/rss-feeds/themen/168443/domradio-rss.xml",
        "Jugend und Spiritualität": "http://www.domradio.de/rss-feeds/themen/171083/domradio-rss.xml",
        "Karneval": "http://www.domradio.de/rss-feeds/themen/40/domradio-rss.xml",
        "Karwoche": "http://www.domradio.de/rss-feeds/themen/41/domradio-rss.xml",
        "Katholikentag": "http://www.domradio.de/rss-feeds/themen/42/domradio-rss.xml",
        "Kirche und Politik": "http://www.domradio.de/rss-feeds/themen/168418/domradio-rss.xml",
        "Kirchenjahr": "http://www.domradio.de/rss-feeds/themen/477/domradio-rss.xml",
        "Kirchentag": "http://www.domradio.de/rss-feeds/themen/43/domradio-rss.xml",
        "Kölner Dom": "http://www.domradio.de/rss-feeds/themen/32/domradio-rss.xml",
        "Kolping International": "http://www.domradio.de/rss-feeds/themen/159180/domradio-rss.xml",
        "Konklave": "http://www.domradio.de/rss-feeds/themen/155604/domradio-rss.xml",
        "Kultur": "http://www.domradio.de/rss-feeds/themen/45/domradio-rss.xml",
        "Laien": "http://www.domradio.de/rss-feeds/themen/46/domradio-rss.xml",
        "Menschenrechte": "http://www.domradio.de/rss-feeds/themen/168448/domradio-rss.xml",
        "Ministrantenwallfahrt 2013": "http://www.domradio.de/rss-feeds/themen/166700/domradio-rss.xml",
        "Ökumene": "http://www.domradio.de/rss-feeds/themen/47/domradio-rss.xml",
        "Ökumenischer Kirchentag": "http://www.domradio.de/rss-feeds/themen/480/domradio-rss.xml",
        "Ostern": "http://www.domradio.de/rss-feeds/themen/48/domradio-rss.xml",
        "Papst Franziskus": "http://www.domradio.de/rss-feeds/themen/156334/domradio-rss.xml",
        "Papst Franziskus in Straßburg": "http://www.domradio.de/rss-feeds/themen/183514/domradio-rss.xml",
        "Rainer Maria Kardinal Woelki": "http://www.domradio.de/rss-feeds/themen/177841/domradio-rss.xml",
        "Reformen": "http://www.domradio.de/rss-feeds/themen/51/domradio-rss.xml",
        "Renovabis": "http://www.domradio.de/rss-feeds/themen/159672/domradio-rss.xml",
        "Schöpfung": "http://www.domradio.de/rss-feeds/themen/52/domradio-rss.xml",
        "Seelsorge": "http://www.domradio.de/rss-feeds/themen/53/domradio-rss.xml",
        "Soldaten und Kirche": "http://www.domradio.de/rss-feeds/themen/54/domradio-rss.xml",
        "Soziales": "http://www.domradio.de/rss-feeds/themen/155951/domradio-rss.xml",
        "Sport und Kirche": "http://www.domradio.de/rss-feeds/themen/474/domradio-rss.xml",
        "Taizé": "http://www.domradio.de/rss-feeds/themen/55/domradio-rss.xml",
        "Vatikan": "http://www.domradio.de/rss-feeds/themen/128235/domradio-rss.xml",
        "Weihbischof Ansgar Puff": "http://www.domradio.de/rss-feeds/themen/161071/domradio-rss.xml",
        "Weihbischof Dominikus Schwaderlapp": "http://www.domradio.de/rss-feeds/themen/62/domradio-rss.xml",
        "Weihbischof em. Manfred Melzer": "http://www.domradio.de/rss-feeds/themen/57/domradio-rss.xml",
        "Weihnachten": "http://www.domradio.de/rss-feeds/themen/63/domradio-rss.xml",
        "Weltjugendtage": "http://www.domradio.de/rss-feeds/themen/64/domradio-rss.xml",
        "Weltkirche": "http://www.domradio.de/rss-feeds/themen/65/domradio-rss.xml",
        "Zweites Vatikanisches Konzil": "http://www.domradio.de/rss-feeds/themen/483/domradio-rss.xml"]
    
    var selectedIndexPath:NSIndexPath?
    
    var updatingCategoryCallback: ((String , String) -> ())?
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var cell:UITableViewCell = tableView.dequeueReusableCellWithIdentifier("categoryCell", forIndexPath: indexPath) as! UITableViewCell
        cell.textLabel!.text = topics[indexPath.item]
        if let selectedIndexPath = self.selectedIndexPath{
            if(indexPath.isEqual(selectedIndexPath)){
                cell.accessoryType = UITableViewCellAccessoryType.Checkmark
            }else{
                cell.accessoryType = UITableViewCellAccessoryType.None
            }
        }else{
            if(indexPath.item == 0){
                cell.accessoryType = UITableViewCellAccessoryType.Checkmark
                self.selectedIndexPath = indexPath
            }
        }
        
        return cell
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return topics.count
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        if let selectedIndexPath = self.selectedIndexPath{
            var uncheckCell = self.tableView!.cellForRowAtIndexPath(selectedIndexPath)
            if let resolvedUncheckCell = uncheckCell{
                resolvedUncheckCell.accessoryType = UITableViewCellAccessoryType.None;
            }
        }
        var checkCell = self.tableView!.cellForRowAtIndexPath(indexPath)
        checkCell?.accessoryType = UITableViewCellAccessoryType.Checkmark
        self.selectedIndexPath = indexPath
        self.tableView!.deselectRowAtIndexPath(indexPath, animated: true)
    }
    
    @IBAction func closeModal(){
        var navigationController = self.parentViewController as! UINavigationController;
        if let updatingCallback = self.updatingCategoryCallback{
            var topic = topics[selectedIndexPath!.item]
            var link = links[topics[selectedIndexPath!.item]]
            updatingCallback(topic, link!);
        }
        navigationController.dismissViewControllerAnimated(true, completion: updateSelectedData)
    }
    
    func updateSelectedData(){
        if let updatingCallback = self.updatingCategoryCallback{
            var topic = topics[selectedIndexPath!.item]
            var link = links[topics[selectedIndexPath!.item]]
            updatingCallback(topic, link!);
        }
    }
}
