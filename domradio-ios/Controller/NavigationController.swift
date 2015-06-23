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
            red: (CGFloat(157) / 255.0),
            green: CGFloat(0.0),
            blue: (CGFloat(17) / 255.0),
            alpha: CGFloat(1.0))
        
        UINavigationBar.appearance().barTintColor = domradioRed
        self.navigationBar.barStyle = UIBarStyle.BlackTranslucent
        self.navigationBar.backgroundColor = domradioRed
        self.navigationBar.tintColor = UIColor.whiteColor()
    }
}
