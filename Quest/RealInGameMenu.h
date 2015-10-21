//
//  RealInGameMenu.h
//  Quest
//
//  Created by Leo Linsky on 5/17/12.
//  Copyright 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "cocos2d.h"
#import "SceneManager.h"
#import "MusicHandler.h"
#import "InGameMenu.h"
#import "PlayLayer.h"
#import "MenuLayer.h"
#import "GameSceneManager.h"
#import "DisplayStats.h"
#import "DisplayInventory.h"
#import "DisplayArmory.h"
#import "DisplayMap.h"
#import "DisplayAttributes.h"
#import "MyHero.h"



@interface RealInGameMenu : CCLayer {
    
    DisplayStats *statsModule;
    DisplayInventory *inventoryModule;
    DisplayAttributes *attribModule;

    DisplayArmory *armoryModule;
    DisplayMap *mapModule;
    
    BOOL firstLoadDone;
}

@property (nonatomic, retain) MyHero *hero;


@property BOOL statMenuOn;
@property BOOL invMenuOn;
@property BOOL attribMenuOn;


@property BOOL mapOn;
@property BOOL armoryOn;



- (id)init;


-(void) goBackGame: (id) sender;
-(void) goBackMenu;



-(void) goSave;


-(void)fadeStatMenu;
-(void)fadeInvMenu;
-(void)fadeArmMenu;
-(void)fadeAttribMenu;
-(void)fadeMapMenu;


-(void) seeHeroStats: (id) sender;
-(void) seeInventory: (id) sender;
-(void) seeAttributes: (id) sender;
-(void) seeArmory: (id) sender;
-(void) seeMap: (id) sender;

-(void)goTele:(int)layer;



@end
