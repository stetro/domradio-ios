//
//  NewsTableViewCell.swift
//  domradio-ios
//
//  Created by Steffen Tröster on 23/06/15.
//  Copyright (c) 2015 Steffen Tröster. All rights reserved.
//

import UIKit

class NewsTableViewCell: UITableViewCell {
    
    @IBOutlet var title:UILabel?
    @IBOutlet var date:UILabel?
    @IBOutlet var news:UILabel?
    
    let dateFormatter = NSDateFormatter()

    override func awakeFromNib() {
        super.awakeFromNib()
        self.accessoryType = UITableViewCellAccessoryType.None
        self.dateFormatter.dateFormat = "dd.MM.yyyy"
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func fillNews(item:MWFeedItem){
        self.title!.text = item.title
        self.date!.text = "vom \(dateFormatter.stringFromDate(item.date))"
        var summary = item.summary
        self.news!.text = summary.stringByReplacingOccurrencesOfString("<[^>]+>", withString :"",  options: .RegularExpressionSearch, range: nil)
    }

}
