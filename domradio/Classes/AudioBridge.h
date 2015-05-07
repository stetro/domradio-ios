//
//  AudioBridge.h
//  domradio
//
//  Created by Steffen Tröster on 29/04/2015.
//

#ifndef domradio_AudioBridge_h
#define domradio_AudioBridge_h

static NSString *const domradioStream = @"http://domradio-mp3-l.akacast.akamaistream.net/7/809/237368/v1/gnl.akacast.akamaistream.net/domradio-mp3-l";

#import "RCTBridgeModule.h"
#import "STKAudioPlayer.h"
#import <AVFoundation/AVFoundation.h>

@interface AudioBridge : NSObject <RCTBridgeModule, STKAudioPlayerDelegate>
@end

#endif
