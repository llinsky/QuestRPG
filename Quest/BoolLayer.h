//
//  BoolLayer.h
//  Quest
//
//  Created by Leo Linsky on 10/13/12.
//  Copyright 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "cocos2d.h"

@interface BoolLayer : CCLayer {
    CCMenuItemImage *yesButton;
    CCMenuItemImage *noButton;
}


-(void)pressedYes;
-(void)pressedNo;

@end
