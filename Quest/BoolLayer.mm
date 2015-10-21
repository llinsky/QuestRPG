//
//  BoolLayer.m
//  Quest
//
//  Created by Leo Linsky on 10/13/12.
//  Copyright 2012 __MyCompanyName__. All rights reserved.
//

#import "BoolLayer.h"
#import "InGameMenu.h"
#import "MusicHandler.h"

@implementation BoolLayer

-(id)init
{
    if (self = [super init])
    {
        CGSize winSize = [[CCDirector sharedDirector] winSize];
        CCSprite *background = [CCSprite spriteWithFile: @"booleanmodalback2.png"];
		background.position = ccp(winSize.width - 62, winSize.height/2 - 10);
		[self addChild:background z:1];
        
        CCMenuItemLabel *yesBtn = [CCMenuItemLabel itemWithLabel:[CCLabelBMFont labelWithString:@"Yes" fntFile:@"testFont5.fnt"] target:self selector:@selector(pressedYes)];
        CCMenuItemLabel *noBtn = [CCMenuItemLabel itemWithLabel:[CCLabelBMFont labelWithString:@"No" fntFile:@"testFont5.fnt"] target:self selector:@selector(pressedNo)];
        
        
        //yesButton = [CCMenuItemImage itemFromNormalImage:@"credits_button.png" selectedImage:@"credits_button_down.png" target:self selector:@selector(pressedYes)];
		//noButton = [CCMenuItemImage itemFromNormalImage:@"credits_button.png" selectedImage:@"credits_button_down.png" target:self selector:@selector(pressedNo)];
        
        
        CCMenu *menu2 = [CCMenu menuWithItems:yesBtn, noBtn, nil];
		menu2.position = ccp(winSize.width - 65, winSize.height/2 - 10);
		[menu2 alignItemsVerticallyWithPadding: 12.0f];
		[self addChild:menu2 z:400];
        
    }
    return self;
}








-(void)pressedNo
{
    [MusicHandler playButtonClick];
    [((InGameMenu*)self.parent) pressedNo];
}
-(void)pressedYes
{
    [MusicHandler playButtonClick];
    [((InGameMenu*)self.parent) pressedYes];
}


@end
