//
//  SimpleAudioExtension.h
//  Quest
//
//  Created by Leo Linsky on 10/19/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

/*This class should generally only be used by the MusicHandler class */

#import <Foundation/Foundation.h>
#import "SimpleAudioEngine.h"
#import "cocos2d.h"

@interface SimpleAudioExtension : SimpleAudioEngine {
    double fadeTimeTaken;
	double fadeDuration;
	double fadeStartVolume;
	double fadeEndVolume;
    

    bool _isUpdating;
    
    int _nextMusicCode;
}


/*This is the only method the outside world should USUALLY care about */
- (void)fadeBackgroundMusicFrom:(Float32)startVolume to:(Float32)endVolume duration:(double)duration nextCode:(int)musicCode;



- (void)update:(ccTime)delta;


- (void) playTrack:(int)musicCode;
//Outside methods will sometimes use forceReset, then playTrack. For example, when you enter a battle
- (void) forceReset:(int)musicCode;

@end
