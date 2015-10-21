//
//  DPad.m
//  Quest
//
//  Created by Leo Linsky on 10/16/12.
//  Copyright 2012 __MyCompanyName__. All rights reserved.
//

#import "DPad.h"


@implementation DPad


-(id)initWithBase:(NSString*)base buttonImage:(NSString*)v1 pressedButtonImage:(NSString*)v2 position:(CGPoint)v3
{
	[super init];
	bg = [CCMenuItemImage itemFromNormalImage:base selectedImage:base target:self selector:@selector(doNothing)];
	bg.position = v3;
    bg.opacity = 1;
	[self addChild:bg z:100];
	up = [CCMenuItemImage itemFromNormalImage:v1 selectedImage:v2];
	down = [CCMenuItemImage itemFromNormalImage:v1 selectedImage:v2];
	right = [CCMenuItemImage itemFromNormalImage:v1 selectedImage:v2];
	left = [CCMenuItemImage itemFromNormalImage:v1 selectedImage:v2];
	up.position = ccp(bg.position.x,bg.position.y + bg.contentSize.height/2 - up.contentSize.height/2);
	down.position = ccp(bg.position.x,bg.position.y - bg.contentSize.height/2 + down.contentSize.height/2);
	right.position = ccp(bg.position.x + bg.contentSize.width/2 - right.contentSize.width/2,bg.position.y);
	left.position = ccp(bg.position.x - bg.contentSize.width/2 + left.contentSize.width/2,bg.position.y);
	right.rotation = 90;
	down.rotation = 180;
	left.rotation = -90;
    
    up.opacity = 200;
    down.opacity = 200;
    left.opacity = 200;
    right.opacity = 200;
    
	CCMenu *menu = [CCMenu menuWithItems:up,down,right,left,nil];
	menu.position = CGPointZero;
	[self addChild:menu z:120];
	return self;
}

-(id)getButton:(int)button
{
	id result;
	switch (button) {
		case 8:
			result = up;
			break;
		case 2:
			result = down;
			break;
		case 6:
			result = right;
			break;
		case 4:
			result = left;
			break;
		default:
			break;
	}
	return result;
}


-(void)setCorner:(int)corner
{
	CGPoint position;
	switch (corner) {
		case 1:
			position = ccp(bg.contentSize.width/2,320 - bg.contentSize.height/2);
			break;
		case 2:
			position = ccp(480 - bg.contentSize.width/2,320 - bg.contentSize.height/2);
			break;
		case 3:
			position = ccp(bg.contentSize.width/2,bg.contentSize.height/2);
			break;
		case 4:
			position = ccp(480 - bg.contentSize.width/2,bg.contentSize.height/2);
			break;
		default:
			break;
	}
	bg.position = position;
	up.position = ccp(bg.position.x,bg.position.y + bg.contentSize.height/2 - up.contentSize.height/2);
	down.position = ccp(bg.position.x,bg.position.y - bg.contentSize.height/2 + down.contentSize.height/2);
	right.position = ccp(bg.position.x + bg.contentSize.width/2 - right.contentSize.width/2,bg.position.y);
	left.position = ccp(bg.position.x - bg.contentSize.width/2 + left.contentSize.width/2,bg.position.y);
}




-(void)doNothing
{
    return;
}


- (void) registerWithTouchDispatcher{
    //[[CCTouchDispatcher sharedDispatcher]addTargetedDelegate:self priority:0 swallowsTouches:YES];
    [[CCTouchDispatcher sharedDispatcher] addTargetedDelegate:self priority:0 swallowsTouches:YES];
}




@end












