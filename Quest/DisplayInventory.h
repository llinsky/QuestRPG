//
//  DisplayInventory.h
//  Quest
//
//  Created by Leo Linsky on 5/19/12.
//  Copyright 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "cocos2d.h"
#import "MyHero.h"
#import "MusicHandler.h"
#import "GameSceneManager.h"
#import "DisplayEquipItemLayer.h"

@interface DisplayInventory : CCLayer {
    MyHero *hero;
    DisplayEquipItemLayer *detailLayer;
    BOOL isShowingItemLayer;
    
    int currentItemIndex;
}

-(void)labelPressed:(id)sender;

-(NSArray*)labelsFromInventory;

-(void)update;

-(void)touchedBack;

-(void)equip;
-(void)discard;
-(void)use;

@end
