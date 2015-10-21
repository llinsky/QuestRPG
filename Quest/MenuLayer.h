//
//  MenuLayer.h
//  Quest
//
//  Created by Leo Linsky on 3/17/12.
//  Copyright 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "cocos2d.h"

#import "SceneManager.h"
#import "MusicHandler.h"

@interface MenuLayer : CCLayer {
}

- (id)init;
- (void)onNewGame:(id)sender;
- (void)onOptions:(id)sender;
- (void)onCredits:(id)sender;
- (void)onContinueGame:(id)sender;

@end