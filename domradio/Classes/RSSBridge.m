//
//  RSSBridge.m
//  domradio
//
//  Created by Steffen Tröster on 26/04/2015.
//

#import "RCTUtils.h"
#import "RCTBridge.h"
#import "RCTEventDispatcher.h"
#import "RSSBridge.h"
#import "MWFeedParser.h"

@implementation RSSBridge

@synthesize bridge = _bridge;

RCT_EXPORT_MODULE();

RCT_EXPORT_METHOD(triggerRefresh){
  parsedItems = [[NSMutableArray alloc] init];
  
  NSURL *feedURL = [NSURL URLWithString:@"http://www.domradio.de/rss-feeds/domradio-rss.xml"];
  feedParser = [[MWFeedParser alloc] initWithFeedURL:feedURL];
  feedParser.delegate = self;
  feedParser.feedParseType = ParseTypeItemsOnly;
  feedParser.connectionType = ConnectionTypeSynchronously;
  [feedParser parse];
}

- (void) feedParser:(MWFeedParser *)parser didParseFeedItem:(MWFeedItem *)item{
  NSLog(@"Parsed Feed Item: “%@”", item.title);
  if (item) [parsedItems addObject:item];
}

- (void)feedParserDidFinish:(MWFeedParser *)parser{
  NSMutableArray * news = [[NSMutableArray alloc] init];
  for (MWFeedItem *item in parsedItems) {
    [news addObject:[self convertToDictionary:item]];
  }
  [self.bridge.eventDispatcher sendDeviceEventWithName:@"RSSBridgeEvent" body:@{@"news":news}];
}

- (void) feedParser:(MWFeedParser *)parser didFailWithError:(NSError *)error{
  [self.bridge.eventDispatcher sendDeviceEventWithName:@"RSSBridgeEvent" body:@{@"news":[NSNull null]}];
}

-(NSDictionary*) convertToDictionary: (MWFeedItem*)item{
  
  NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
  [formatter setDateFormat:@"dd.MM.yyyy"];
  
  NSString *pubDate = [formatter stringFromDate:item.date];
  NSString *summary = item.summary;
  summary = [summary stringByReplacingOccurrencesOfString:@"<p>" withString:@""];
  summary = [summary stringByReplacingOccurrencesOfString:@"</p>" withString:@""];
  
  return [NSDictionary dictionaryWithObjectsAndKeys:
                      item.title, @"title",
                      summary, @"description",
                      pubDate, @"pubDate",
                      item.link, @"link", nil];
}
@end

