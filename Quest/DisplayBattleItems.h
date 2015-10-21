//
//  DisplayBattleItems.h
//  Quest
//
//  Created by Leo Linsky on 9/29/12.
//  Copyright 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "cocos2d.h"
#import "InGameMenu.h"
#import "ItemShopMenu.h"

@interface DisplayBattleItems : CCLayer {
    DisplayEquipItemLayer *detailLayer;
    int currentItemIndex;
    
    BOOL isShowingItemLayer;
    
    NSArray *usableInventory;
    
}


@property (nonatomic, retain) MyHero *hero;



-(NSArray*)usableItemsFromInventory;

-(NSArray*)labelsFromInventory;

-(void)labelPressed:(id)sender;

-(void)useItem;

-(void)touchedBack;


@end











