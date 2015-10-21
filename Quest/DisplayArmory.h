//
//  DisplayObjectivesHints.h
//  Quest
//
//  Created by Leo Linsky on 5/19/12.
//  Copyright 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "cocos2d.h"
#import "GameSceneManager.h"
#import "MyHero.h"
#import "Item.h"
#import "DisplayEquipItemLayer.h"



@interface DisplayArmory : CCLayer {
    CCMenuItemImage *equip1;
    CCMenuItemImage *equip2;
    CCMenuItemImage *equip3;
    CCMenuItemImage *equip4;
    CCMenuItemImage *equip5;
    CCMenuItemImage *equip6;
    
    CCSprite *spriteEquip1;
    CCSprite *spriteEquip2;
    CCSprite *spriteEquip3;
    CCSprite *spriteEquip4;
    CCSprite *spriteEquip5;
    CCSprite *spriteEquip6;
    
    DisplayEquipItemLayer *showItemLayer;
    
    BOOL showingItemLayer;
}

@property (nonatomic, retain) MyHero *hero;

-(void) updateTaggedStuff;





-(void) onEquip1;
-(void) onEquip2;
-(void) onEquip3;
-(void) onEquip4;
-(void) onEquip5;
-(void) onEquip6;


-(void)touchedBack;


-(void)unequip;







@end
