//
//  RSSBridge.m
//  domradio
//
//  Created by Steffen Tröster on 26/04/2015.
//  Copyright (c) 2015 Facebook. All rights reserved.
//

#import "RSSBridge.h"
#import "RCTUtils.h"
#import "MWFeedParser.h"

@implementation RSSBridge

RCT_EXPORT_MODULE();

RCT_EXPORT_METHOD(getNews: (RCTResponseSenderBlock) callback){
  responseCallback = callback;
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
  responseCallback(@[[NSNull null], news]);
}

- (void) feedParser:(MWFeedParser *)parser didFailWithError:(NSError *)error{
  responseCallback(@[@"Error",[NSNull null]]);
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

