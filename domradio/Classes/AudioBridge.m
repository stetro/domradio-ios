//
//  AppBridge.m
//  domradio
//
//  Created by Steffen Tröster on 29/04/2015.
//

#import <Foundation/Foundation.h>

#import "RCTBridge.h"
#import "RCTEventDispatcher.h"
#import "AudioBridge.h"
#import "RCTConvert.h"
#import "RCTLog.h"

@implementation AudioBridge

@synthesize bridge = _bridge;

RCT_EXPORT_MODULE();

RCT_EXPORT_METHOD(play){
  if(audioPlayer != nil){
    [audioPlayer stop];
  }
  audioPlayer = [[STKAudioPlayer alloc] init];
  //[audioPlayer setDelegate:self];
  [audioPlayer play:@"http://domradio-mp3-l.akacast.akamaistream.net/7/809/237368/v1/gnl.akacast.akamaistream.net/domradio-mp3-l"];
}

RCT_EXPORT_METHOD(stop){
  if(audioPlayer != nil){
    [audioPlayer stop];
  }
}
/*
-(void) audioPlayer:(STKAudioPlayer*)audioPlayer stateChanged:(STKAudioPlayerState)state previousState:(STKAudioPlayerState)previousState{
  NSLog(@"foo");
  switch (state) {
    case STKAudioPlayerStatePlaying:
      [self.bridge.eventDispatcher sendDeviceEventWithName:@"AudioBridgeEvent" body:@{@"status":@"PLAYING"}];
      break;
    case STKAudioPlayerStateStopped:
      [self.bridge.eventDispatcher sendDeviceEventWithName:@"AudioBridgeEvent" body:@{@"status":@"STOPPED"}];
      break;
    case STKAudioPlayerStateBuffering:
      [self.bridge.eventDispatcher sendDeviceEventWithName:@"AudioBridgeEvent" body:@{@"status":@"LOADING"}];
      break;
  }
}

*/
@end