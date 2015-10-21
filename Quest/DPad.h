//
//  DPad.h
//  Quest
//
//  Created by Leo Linsky on 10/16/12.
//  Copyright 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "cocos2d.h"

@interface DPad : CCLayer {

	CCMenuItemImage *up;
	CCMenuItemImage *down;
	CCMenuItemImage *right;
	CCMenuItemImage *left;
	CCSprite *bg;
}
-(id)initWithBase:(NSString*)base buttonImage:(NSString*)v1 pressedButtonImage:(NSString*)v2 position:(CGPoint)v3;

-(id)getButton:(int)button;

-(void)setCorner:(int)corner;


-(void)doNothing;





@end









