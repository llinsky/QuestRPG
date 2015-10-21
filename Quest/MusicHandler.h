//
//  MusicHandler.h
//  Quest
//
//  Created by Leo Linsky on 3/17/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SimpleAudioEngine.h"
#import "cocos2d.h"

@interface MusicHandler : NSObject {
   
}

+(void) preload;
+(void) playBackgroundMusic:(int)musicCode;
+(void) resetBackgroundMusic:(int)musicCode; // immediately stop music and start playing next one (battle). This should be done on entering battle/ winning battle (but still in battle layer)
+(void) playButtonClick;
+(void) fadeBackgroundMusic:(double)fadeTime music:(int)musicCode;

@end
