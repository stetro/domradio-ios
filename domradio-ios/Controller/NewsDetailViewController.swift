//
//  NewsDetailViewController.swift
//  domradio-ios
//
//  Created by Steffen Tröster on 24/06/15.
//  Copyright (c) 2015 Steffen Tröster. All rights reserved.
//

import UIKit

class NewsDetailViewController: UIViewController {
    
    @IBOutlet var webview:UIWebView?
    
    var item:MWFeedItem?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let item = self.item{
            self.title = item.title
            let url = NSURL (string: item.link!);
            let requestObj = NSURLRequest(URL: url!);
            webview!.loadRequest(requestObj);
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}
