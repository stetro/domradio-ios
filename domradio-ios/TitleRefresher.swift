//
//  TitleRefresher.swift
//  domradio-ios
//
//  Created by Steffen Tröster on 02/09/15.
//  Copyright © 2015 Steffen Tröster. All rights reserved.
//

import Foundation
import Alamofire

class TitleRefresher {
    
    var timer:NSTimer?
    
    init(){
        self.timer = NSTimer.scheduledTimerWithTimeInterval(30.0, target: self, selector: "loadTitle", userInfo: nil, repeats: true)
    }
    
    func loadTitle(){
        Alamofire.request(.GET, "http://httpbin.org/get")
    }
    
    func stop(){
        if let timer = timer{
            timer.invalidate()
        }
    }
}