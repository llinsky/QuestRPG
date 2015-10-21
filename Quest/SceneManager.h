//
//  SceneManager.h
//  Quest
//
//  Created by Leo Linsky on 3/17/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "cocos2d.h"

@interface SceneManager : NSObject {

}

 +(void) goLoad;
 +(void) goMenu;
 +(void) goPlay;
+(void) goPlay:(int)playLayer;


 +(void) goOptions;
+(void) goShop:(int)code;
+(void) goTutorial;
+(void) goRealInGameMenu;
+(void) goBattle: (int)battleSceneID;






+(void) go: (CCLayer *) layer;
+(CCScene *) wrap: (CCLayer *) layer;


@end