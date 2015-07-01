//
//  NewsDetailViewController.swift
//  domradio-ios
//
//  Created by Steffen Tröster on 24/06/15.
//  Copyright (c) 2015 Steffen Tröster. All rights reserved.
//

import UIKit

class NewsDetailViewController: UIViewController, UIWebViewDelegate, NJKWebViewProgressDelegate {
    
    @IBOutlet var webview:UIWebView?
    @IBOutlet var progressView:UIProgressView?
    
    var item:MWFeedItem?
    var progressProxy:NJKWebViewProgress?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let item = self.item{
            self.title = item.title
            let url = NSURL (string: item.link!)
            let requestObj = NSURLRequest(URL: url!)
            
            self.progressProxy = NJKWebViewProgress()
            self.webview!.loadRequest(requestObj)
            self.webview!.delegate = progressProxy
            
            self.progressProxy?.webViewProxyDelegate = self
            self.progressProxy?.progressDelegate = self
        }else{
            RKDropdownAlert.title("Netzwerkfehler", message: "Artikel konnte nicht geladen werden!" );
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func webView(webView: UIWebView, didFailLoadWithError error: NSError) {
        RKDropdownAlert.title("Netzwerkfehler", message: "Artikel konnte nicht geladen werden!" );
    }
    
    func webViewProgress(webViewProgress: NJKWebViewProgress!, updateProgress progress: Float) {
        progressView!.setProgress(progress, animated: true)
    }
}
