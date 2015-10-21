//
//  TutorialLayer.m
//  Quest
//
//  Created by Leo Linsky on 3/17/12.
//  Copyright 2012 __MyCompanyName__. All rights reserved.
//

#import "TutorialLayer.h"


@implementation TutorialLayer

- (id) init
{
	if ((self = [super init])) {
		CGSize winSize = [[CCDirector sharedDirector] winSize];
		
		CCSprite *background = [CCSprite spriteWithFile:@"menu_background.png"];
		background.position = ccp(winSize.width/2, winSize.height/2);
		[self addChild:background];
		
		CCLabelTTF *dir = [CCLabelTTF labelWithString:@"Director: Leo Linsky" fontName:@"CharlemagneStd-Bold.otf" fontSize:14];
		dir.position = ccp(winSize.width/2, winSize.height/2 + 20);
		dir.color = ccBLACK;
		[self addChild:dir];
		
		CCLabelTTF *prod = [CCLabelTTF labelWithString:@"Producer: Leo Linsky" fontName:@"CharlemagneStd-Bold.otf" fontSize:14];
		prod.position = ccp(winSize.width/2, winSize.height/2 - 20);
		prod.color = ccBLACK;
		[self addChild:prod];
		
		CCLabelTTF *art = [CCLabelTTF labelWithString:@"Art: Leo Linsky" fontName:@"CharlemagneStd-Bold.otf" fontSize:14];
		art.position = ccp(winSize.width/2, winSize.height/2 - 60);
		art.color = ccBLACK;
		[self addChild:art];
		
		CCMenuItemImage *back = [CCMenuItemImage itemFromNormalImage:@"back_button.png" selectedImage:@"back_button_down.png" target:self selector:@selector(onBackClick:)];
		back.position = ccp(winSize.width - 60, 25);
		
		CCMenu *menu = [CCMenu menuWithItems:back, nil];
		menu.position = ccp(0,0);
		
		
		[self addChild:menu];
	}
	
	return self;
}

- (void) onBackClick: (id) sender
{
	[MusicHandler playButtonClick];
	[SceneManager goMenu];
}

@end
