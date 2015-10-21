//
//  DisplayMap.m
//  Quest
//
//  Created by Leo Linsky on 6/13/12.
//  Copyright 2012 __MyCompanyName__. All rights reserved.
//

#import "DisplayMap.h"
#import "GameSceneManager.h"


@implementation DisplayMap



-(id) init
{
    
    
    if ((self = [super init])) {
		CGSize winSize = [[CCDirector sharedDirector] winSize];
		
		CCSprite *background = [CCSprite spriteWithFile: @"lowrestempmap1.jpeg"];
		background.position = ccp(winSize.width/2 - 80, winSize.height/2 + 60);
		[self addChild:background];
        
        //MyHero *hero1 = [GameSceneManager sharedGameSceneManager].hero;
    }
    return self;
}






@end
