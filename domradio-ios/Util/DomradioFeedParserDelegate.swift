//
//  DomradioFeedParserDelegate.swift
//  domradio-ios
//
//  Created by Steffen Tröster on 23/06/15.
//  Copyright (c) 2015 Steffen Tröster. All rights reserved.
//
import MWFeedParser
protocol DomradioFeedParserDelegate {
    func succeedNewsParsing(items:[MWFeedItem])
    func failedNewsParsing(error:NSError)
    func startParsinggNews()
}
