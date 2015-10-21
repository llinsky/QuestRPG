//
//  DisplayEquipItemLayer.h
//  Quest
//
//  Created by Leo Linsky on 7/28/12.
//  Copyright 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "cocos2d.h"
#import "Item.h"
#import "MyHero.h"


@interface DisplayEquipItemLayer : CCLayer {
    Item *equippableItem;
    MyHero *hero;
}

@property int position; //item position

@property int interface; //sets the bool based on where you are: 1:armory, 2:inventory, 3:battle, 4:shop

@property BOOL isInArmory;
@property BOOL isInInventory;
@property BOOL isInBattle;
@property BOOL isInShop;
@property BOOL isInShopForSale;

-(id)initWithItem:(Item*)equippable source:(int)sourceLayer;


-(void)unequip;
-(void)equip;
-(void)discard;
-(void)use;
-(void)buy;
-(void)sell;
-(void)useBattle;
-(void)exit;

@end
