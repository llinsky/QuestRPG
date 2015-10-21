//
//  SimpleAudioExtension.m
//  Quest
//
//  Created by Leo Linsky on 10/19/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "SimpleAudioExtension.h"

@implementation SimpleAudioExtension

static SimpleAudioExtension *sharedEngine = nil;

+ (SimpleAudioExtension *) sharedEngine
{
	@synchronized(self)     {
		if (!sharedEngine)
        {
			sharedEngine = [[SimpleAudioExtension alloc] init];
        }
	}
	return sharedEngine;
}

- (id) init
{
    if (self = [super init])
    {
        _isUpdating = false;
        _nextMusicCode = 0;
    }
    return self;
}

- (void)fadeBackgroundMusicFrom:(Float32)startVolume to:(Float32)endVolume duration:(double)duration nextCode:(int)musicCode{
	_nextMusicCode = musicCode;
    if (_isUpdating)
    {
        return;
    }
    fadeTimeTaken = 0;
	fadeDuration = duration;
	fadeStartVolume = startVolume;
	fadeEndVolume = 0.0;
    
    _isUpdating = true;
	[[CCScheduler sharedScheduler] scheduleUpdateForTarget:self priority:1 paused:NO];
}

- (void)update:(float)delta {
    if (!_isUpdating)
    {
        [[CCScheduler sharedScheduler] unscheduleUpdateForTarget:self];
        [self playTrack:_nextMusicCode];
        return;
    }
    
	fadeTimeTaken += delta;
    
	double timeProportion = fadeTimeTaken / fadeDuration;
    
	if (timeProportion < 1.0) {
		CGFloat newMusicVolume = fadeStartVolume + (timeProportion * (fadeEndVolume - fadeStartVolume));
		[self setBackgroundMusicVolume:newMusicVolume];
	} else {
        _isUpdating = false;
		[[CCScheduler sharedScheduler] unscheduleUpdateForTarget:self];
        [self playTrack:_nextMusicCode];
	}
}

-(void) playTrack:(int)musicCode
{
    [[SimpleAudioExtension sharedEngine] stopBackgroundMusic];
    
    _nextMusicCode = musicCode; //in the case of a forced reset
    
    if (musicCode == 1)
    {
        [[SimpleAudioExtension sharedEngine] playBackgroundMusic:@"DQicekey1.mp3" loop:YES];
    }
    else if (musicCode == 2)
    {
        [[SimpleAudioExtension sharedEngine] playBackgroundMusic:@"GameThemeLOOP.mp3" loop:YES];
    }
    else if (musicCode == 3)
    {
        [[SimpleAudioExtension sharedEngine] playBackgroundMusic:@"WelcomeTheme.mp3" loop:YES];
    }
    else
    {
        [[SimpleAudioExtension sharedEngine] playBackgroundMusic:@"WelcomeTheme.mp3" loop:YES];
    }
    [self setBackgroundMusicVolume:1.0];
}

-(void) forceReset:(int)musicCode
{
    _nextMusicCode = musicCode;
    if (_isUpdating)
    {
        _isUpdating = false;
    }
    else
    {
        [self playTrack:_nextMusicCode];
    }
    return;
}


@end


