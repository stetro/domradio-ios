//
//  RSSBridge.h
//  domradio
//
//  Created by Steffen Tröster on 26/04/2015.
//  Copyright (c) 2015 Facebook. All rights reserved.
//

#ifndef domradio_RSSBridge_h
#define domradio_RSSBridge_h

#import "RCTBridgeModule.h"
#import "MWFeedParser.h"

@interface RSSBridge : NSObject <RCTBridgeModule, MWFeedParserDelegate>{
  MWFeedParser *feedParser;
  NSMutableArray *parsedItems;
  RCTResponseSenderBlock responseCallback;
}
  -(NSDictionary*) convertToDictionary: (MWFeedItem*)item;
@end

#endif
