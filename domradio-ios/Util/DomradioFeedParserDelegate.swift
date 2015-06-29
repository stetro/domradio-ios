//
//  DomradioFeedParserDelegate.swift
//  domradio-ios
//
//  Created by Steffen Tröster on 23/06/15.
//  Copyright (c) 2015 Steffen Tröster. All rights reserved.
//

protocol DomradioFeedParserDelegate {
    func succeedNewsParsing(items:[MWFeedItem])
    func failedNewsParsing(error:NSError)
}
