//
//  DomradioNavigationController.swift
//  domradio-ios
//
//  Created by Steffen Tröster on 22/06/15.
//  Copyright (c) 2015 Steffen Tröster. All rights reserved.
//

import UIKit

class NavigationController: UINavigationController {
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let domradioRed = UIColor(
            red: (CGFloat(197) / 255.0),
            green: (CGFloat(14) / 255.0),
            blue: (CGFloat(31) / 255.0),
            alpha: CGFloat(1.0))
        
        UINavigationBar.appearance().barTintColor = domradioRed
        UINavigationBar.appearance().translucent = false
        self.navigationBar.barStyle = UIBarStyle.Black
        self.navigationBar.tintColor = UIColor.whiteColor()

    }
    
    override func preferredStatusBarStyle() -> UIStatusBarStyle {
        return UIStatusBarStyle.LightContent
    }
}
