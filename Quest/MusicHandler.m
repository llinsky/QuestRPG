//
//  MusicHandler.m
//  Quest
//
//  Created by Leo Linsky on 3/17/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "MusicHandler.h"
#import "SimpleAudioExtension.h"
#import "CCSendMessages.h"
#import "GameSceneManager.h"



//from my playlayers or active menus or battle engine layers, I will call the following methods:
//
    

@implementation MusicHandler


static NSString *BUTTON_CLICK_EFFECT = @"Sword Strike And Clash.mp3";

+(void) preload
{
	[[SimpleAudioExtension sharedEngine] preloadBackgroundMusic:@"DQicekey1.mp3"];
    [[SimpleAudioExtension sharedEngine] preloadBackgroundMusic:@"WelcomeTheme.mp3"];
    [[SimpleAudioExtension sharedEngine] preloadBackgroundMusic:@"GameThemeLOOP.mp3"];
    
    
	[[SimpleAudioExtension sharedEngine] preloadEffect:BUTTON_CLICK_EFFECT];
}



/*When we go to battle, musicCode isn't changed for the hero, it is only changed in the SimpleAudioExtension class*/
+(void) fadeBackgroundMusic:(double)fadeTime music:(int)musicCode
{
    if ([[SimpleAudioExtension sharedEngine] isBackgroundMusicPlaying])
     {
         [[SimpleAudioExtension sharedEngine] fadeBackgroundMusicFrom:[GameSceneManager sharedGameSceneManager].musicVolume to:0.0 duration:fadeTime nextCode:musicCode];
     }
    else{
        [MusicHandler playBackgroundMusic:musicCode];
    }
}

+(void) resetBackgroundMusic:(int)musicCode
{
    if ([[SimpleAudioExtension sharedEngine] isBackgroundMusicPlaying])
    {
        [[SimpleAudioExtension sharedEngine] stopBackgroundMusic];
    }
    [[SimpleAudioExtension sharedEngine] forceReset:musicCode];
}



+(void) playBackgroundMusic:(int)musicCode
{
	[[SimpleAudioExtension sharedEngine] playTrack:musicCode];
}


+(void) playButtonClick
{
	[[SimpleAudioExtension sharedEngine] playEffect:BUTTON_CLICK_EFFECT];
}

@end