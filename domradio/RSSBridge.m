//
//  RSSBridge.m
//  domradio
//
//  Created by Steffen Tröster on 26/04/2015.
//  Copyright (c) 2015 Facebook. All rights reserved.
//

#import "RSSBridge.h"

@implementation RSSBridge

RCT_EXPORT_MODULE();

RCT_EXPORT_METHOD(getNews: (RCTResponseSenderBlock) callback){
  NSArray *news = @[
                    @"Your Move",
                    @"Their Move",
                    @"Won Games",
                    @"Lost Games",
                    @"Options"
                    ];
  callback(@[[NSNull null], news]);
}

@end