//
//  ItemShopMenu.h
//  Quest
//
//  Created by Leo Linsky on 9/15/12.
//  Copyright 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "cocos2d.h"
#import "SceneManager.h"
#import "MusicHandler.h"
#import "InGameMenu.h"
#import "PlayLayer.h"
#import "Monster.h"
#import "GameSceneManager.h"
#import "TextBox.h"
#import "TextBoxLayer.h"
#import "MyHero.h"
#import "Item.h"
#import "DisplayEquipItemLayer.h"





@interface ItemShopMenu : CCLayer {
    
    CCMenuItemImage *shopButton;        //initially activated
    CCMenuItemImage *sellButton;
    
    DisplayEquipItemLayer *detailLayer;
    
    NSArray *shopInventory;
    
    int currentItemIndex;
    
    BOOL isShowingItemLayer;
}

@property BOOL shopMode;


@property int shopCode;

@property (nonatomic, retain) MyHero *hero;

-(id)initWithShopCode:(int)code;



-(void)buy;
-(void)sell;

-(void) updateTaggedStuff;



-(void) onShop;
-(void) onSell;

-(void)goBackGame:(id)sender;


-(void)touchedBack;

-(void)labelPressed:(id)sender;

-(NSArray*)labelsFromInventory;
-(NSArray*)labelsFromShopStock;


@end

















