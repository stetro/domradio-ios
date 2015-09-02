//
//  TitleRefresher.swift
//  domradio-ios
//
//  Created by Steffen Tröster on 02/09/15.
//  Copyright © 2015 Steffen Tröster. All rights reserved.
//

import Foundation
import SWXMLHash
import SwiftHTTP


class TitleRefresher {
    
    let url = "http://www.domradio.de/sites/all/themes/domradio/playlist/Export.xml"

    var timer:NSTimer?
    var target:TitleRefresherDelegate?
    
    init(target:TitleRefresherDelegate){
        self.target = target
        self.timer = NSTimer.scheduledTimerWithTimeInterval(10.0,
            target: self,
            selector: "loadTitle",
            userInfo: nil,
            repeats: true)

        self.loadTitle()
    }
    
    @objc func loadTitle(){
        do {
            let opt = try HTTP.GET(self.url, parameters: nil)
            opt.start { response in
                if let _ = response.error {
                    return
                }
                if let text = response.text{
                    self.parseXML(text)
                }
            }
        } catch let error {
            print("got an error creating the request: \(error)")
        }
        
    }
    
    func parseXML(text:String){
        let xml = SWXMLHash.parse(text)
        let title = xml["station"]["onair"]["title"].element?.text
        let artist = xml["station"]["onair"]["artist"].element?.text
        let type = xml["station"]["onair"]["type"].element?.text
        if let title = title, let artist = artist, let type = type{
            if(type == "I") {
                return
            }
            if let target = self.target{
                target.updateTitle("\(artist) - \(title)")
            }
        }
    }
    
    func stop(){
        if let timer = timer{
            timer.invalidate()
        }
    }
}
