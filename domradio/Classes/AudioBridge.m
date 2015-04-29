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

static STKAudioPlayer* audioPlayer;

RCT_EXPORT_MODULE();

RCT_EXPORT_METHOD(play){
  if(audioPlayer != nil){
    [audioPlayer stop];
  }
  audioPlayer = [[STKAudioPlayer alloc] init];
  [audioPlayer setDelegate:self];
  [audioPlayer play:@"http://domradio-mp3-l.akacast.akamaistream.net/7/809/237368/v1/gnl.akacast.akamaistream.net/domradio-mp3-l"];
}

RCT_EXPORT_METHOD(stop){
  if(audioPlayer != nil){
    [audioPlayer stop];
    [audioPlayer setDelegate:nil];
  }
}

RCT_EXPORT_METHOD(getStatus:(RCTResponseSenderBlock) callback){
  if(audioPlayer==nil){
    callback(@[[NSNull null], @{@"status": @"STOPPED"}]);
  }else if([audioPlayer state] == STKAudioPlayerStatePlaying){
    callback(@[[NSNull null], @{@"status": @"PLAYING"}]);
  }else{
    callback(@[[NSNull null], @{@"status": @"STOPPED"}]);
  }
}

-(void)audioPlayer:(STKAudioPlayer *)audioPlayer didStartPlayingQueueItemId:(NSObject *)queueItemId{
  NSLog(@"AudioPlayer is playing");
}
-(void) audioPlayer:(STKAudioPlayer *)audioPlayer didFinishPlayingQueueItemId:(NSObject *)queueItemId withReason:(STKAudioPlayerStopReason)stopReason andProgress:(double)progress andDuration:(double)duration{
  NSLog(@"AudioPlayer has stopped");
}
-(void)audioPlayer:(STKAudioPlayer *)audioPlayer didFinishBufferingSourceWithQueueItemId:(NSObject *)queueItemId{
  NSLog(@"AudioPlayer finished buffering");
}
-(void)audioPlayer:(STKAudioPlayer *)audioPlayer unexpectedError:(STKAudioPlayerErrorCode)errorCode{
  NSLog(@"AudioPlayer unecpected Error with code %d", errorCode);
  [self.bridge.eventDispatcher sendDeviceEventWithName:@"AudioBridgeEvent" body:@{@"status":@"STOPPED"}];
}
-(void) audioPlayer:(STKAudioPlayer*)audioPlayer stateChanged:(STKAudioPlayerState)state previousState:(STKAudioPlayerState)previousState{
  NSLog(@"AudioPlayer state has changed");
  if(state ==STKAudioPlayerStatePlaying){
    [self.bridge.eventDispatcher sendDeviceEventWithName:@"AudioBridgeEvent" body:@{@"status":@"PLAYING"}];
  }else if(state ==STKAudioPlayerStateStopped ){
    [self.bridge.eventDispatcher sendDeviceEventWithName:@"AudioBridgeEvent" body:@{@"status":@"STOPPED"}];
  }else if(state == STKAudioPlayerStateBuffering){
    [self.bridge.eventDispatcher sendDeviceEventWithName:@"AudioBridgeEvent" body:@{@"status":@"LOADING"}];
  }
}

@end