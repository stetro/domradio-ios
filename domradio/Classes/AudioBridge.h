//
//  AudioBridge.h
//  domradio
//
//  Created by Steffen Tröster on 29/04/2015.
//

#ifndef domradio_AudioBridge_h
#define domradio_AudioBridge_h

#import "RCTBridgeModule.h"
#import "STKAudioPlayer.h"
#import <AVFoundation/AVFoundation.h>

@interface AudioBridge : NSObject <RCTBridgeModule, STKAudioPlayerDelegate> 
@end

#endif
