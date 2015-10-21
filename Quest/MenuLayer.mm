//
//  MenuLayer.m
//  Quest
//
//  Created by Leo Linsky on 3/17/12.
//  Copyright 2012 __MyCompanyName__. All rights reserved.
//

#import "MenuLayer.h"
#import "GameSceneManager.h"
#import "MyHero.h"


@implementation MenuLayer

-(id) init
{
	
	if ((self = [super init])) {
		CGSize winSize = [[CCDirector sharedDirector] winSize];
        
        //open playlayer that corresponds to saved game, or PL1
        
        //put a white partially translucent image above it, and maybe add some smokey or foggy effects
        
        //add the usual buttons with the usual functions
        
		CCSprite *background = [CCSprite spriteWithFile:@"menu_back_semi_trans.png"];
		background.position = ccp(winSize.width/2, winSize.height/2);
		[self addChild:background];
        
        
        
		
		CCMenuItemImage *startNew = [CCMenuItemImage itemFromNormalImage:@"new_game_button.png" selectedImage:@"new_game_button_down.png" target:self selector:@selector(onNewGame:)];
		CCMenuItemImage *options = [CCMenuItemImage itemFromNormalImage:@"options_button.png" selectedImage:@"options_button_down.png" target:self selector:@selector(onOptions:)];
		CCMenuItemImage *credits = [CCMenuItemImage itemFromNormalImage:@"credits_button.png" selectedImage:@"credits_button_down.png" target:self selector: @selector(onCredits:)];
		
		CCMenu *menu = [CCMenu menuWithItems:startNew, options, credits, nil];
		menu.position = ccp(winSize.width - 100, winSize.height/2 - 50);
		[menu alignItemsVerticallyWithPadding: 25.0f];
		[self addChild:menu];
	}
	
	return self;
}

- (void)onNewGame:(id)sender
{
	[MusicHandler playButtonClick];
    
    //Later: Look up file from memory (for load game) and determine which scene to go to
    
    if ([GameSceneManager sharedGameSceneManager].hero.mapInitMode != 5)
    {
        [self onContinueGame:self];
        return;
    }
    
	[SceneManager goPlay:1];
}

- (void)onContinueGame:(id)sender
{
    [MusicHandler playButtonClick];
    
    //Later: Look up file from memory (for load game) and determine which scene to go to
    
    MyHero *hero = [GameSceneManager sharedGameSceneManager].hero;
    hero.mapInitMode = 1;
    int a = hero.currentMap;
    [GameSceneManager sharedGameSceneManager].hero = hero;
	[SceneManager goPlay:a];
}

- (void)onOptions:(id)sender
{
	[MusicHandler playButtonClick];
	[SceneManager goOptions];
}

- (void)onCredits:(id)sender
{
	[MusicHandler playButtonClick];
	[SceneManager goTutorial];
}


@end