//
//  DisplayAttribDetails.h
//  Quest
//
//  Created by Leo Linsky on 8/11/12.
//  Copyright 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "cocos2d.h"
#import "GameSceneManager.h"
#import "MyHero.h"

@interface DisplayAttribDetails : CCLayer {
    MyHero *hero;
}

@property int attribCode;

-(id)initWithAttributeCode:(int)attributeCode;

-(void)use;
-(void)exit;







@end








