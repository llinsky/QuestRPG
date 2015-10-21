//
//  SceneManager.m
//  Quest
//
//  Created by Leo Linsky on 3/17/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "SceneManager.h"
#import "MenuLayer.h"
#import "OptionsLayer.h"
#import "TutorialLayer.h"
#import "InGameMenu.h"
#import "GameSceneManager.h"
#import "RealInGameMenu.h"
#import "BattleEngineLayer.h"
#import "ItemShopMenu.h"
#import "BattleLayer.h"

#import "PlayLayer.h"
#import "PlayLayerOne.h"
#import "PlayLayerTwo.h"
#import "PlayLayerThree.h"
#import "PlayLayerFour.h"
#import "PlayLayerFive.h"
#import "PlayLayerSix.h"
#import "PlayLayerSeven.h"
#import "PlayLayerEight.h"
#import "PlayLayerNine.h"
#import "PlayLayerTen.h"
#import "PlayLayerEleven.h"
#import "PlayLayerTwenty.h"
#import "PlayLayerTwentyOne.h"
#import "PlayLayerTwentyTwo.h"
#import "PL30.h"
#import "PL31.h"
#import "PL32.h"
#import "PL33.h"
#import "PL34.h"

USING_NS_CC;


@implementation SceneManager



+(void) goPlay 
{
    //EDIT: This is for new game. Another method will be made for continue game.
    
    //Prepare cutscene; present cutscene for ktime. 
    
    //Playlayer will be the home island layer -- name future layers more appropriately
    
    
    PlayLayer *layer = [PlayLayer node];
    InGameMenu *menuLayer = [InGameMenu node];
    menuLayer.layer = layer;
    layer.myHUD = menuLayer;
        
    
    CCDirector *director = [CCDirector sharedDirector];
    CCScene *newScene = [CCScene node];
	[newScene addChild: layer z:-1];
    [newScene addChild: menuLayer z:1];
    
    [GameSceneManager sharedGameSceneManager].hero.mapInitMode = 5; // just to initialize singleton object for now

	if ([director runningScene]) {
        
        [director replaceScene: [CCTransitionFade transitionWithDuration:0.5f scene:newScene]];
        
	}
	else {
		[director runWithScene:newScene];		
	}

    
}

+(void) goPlay:(int)playLayer
{
    //EDIT: This is for new game. Another method will be made for continue game.
    
    //Prepare cutscene; present cutscene for ktime. 
    
    //Playlayer will be the home island layer -- name future layers more appropriately
    CCDirector *director = [CCDirector sharedDirector];
    CCScene *newScene = [CCScene node];
    if (playLayer == 1)
    {
        PlayLayerOne *layer = [PlayLayerOne node];
        InGameMenu *menuLayer = [InGameMenu node];
        menuLayer.layer = layer;
        layer.myHUD = menuLayer;
        [newScene addChild: layer z:-1];
        [newScene addChild: menuLayer z:1];
    }
    else if (playLayer == 2)
    {
        PlayLayerTwo *layer = [PlayLayerTwo node];
        InGameMenu *menuLayer = [InGameMenu node];
        menuLayer.layer = layer;
        layer.myHUD = menuLayer;
        [newScene addChild: layer z:-1];
        [newScene addChild: menuLayer z:1];
    }
    else if (playLayer == 3)
    {
        PlayLayerThree *layer = [PlayLayerThree node];
        InGameMenu *menuLayer = [InGameMenu node];
        menuLayer.layer = layer;
        layer.myHUD = menuLayer;
        [newScene addChild: layer z:-1];
        [newScene addChild: menuLayer z:1];
    }
    else if (playLayer == 4)
    {
        PlayLayerFour *layer = [PlayLayerFour node];
        InGameMenu *menuLayer = [InGameMenu node];
        menuLayer.layer = layer;
        layer.myHUD = menuLayer;
        [newScene addChild: layer z:-1];
        [newScene addChild: menuLayer z:1];
    }
    else if (playLayer == 5)
    {
        PlayLayerFive *layer = [PlayLayerFive node];
        InGameMenu *menuLayer = [InGameMenu node];
        menuLayer.layer = layer;
        layer.myHUD = menuLayer;
        [newScene addChild: layer z:-1];
        [newScene addChild: menuLayer z:1];
    }
    else if (playLayer == 6)
    {
        PlayLayerSix *layer = [PlayLayerSix node];
        InGameMenu *menuLayer = [InGameMenu node];
        menuLayer.layer = layer;
        layer.myHUD = menuLayer;
        [newScene addChild: layer z:-1];
        [newScene addChild: menuLayer z:1];
    }
    else if (playLayer == 7)
    {
        PlayLayerSeven *layer = [PlayLayerSeven node];
        InGameMenu *menuLayer = [InGameMenu node];
        menuLayer.layer = layer;
        layer.myHUD = menuLayer;
        [newScene addChild: layer z:-1];
        [newScene addChild: menuLayer z:1];
    }
    else if (playLayer == 8)
    {
        PlayLayerEight *layer = [PlayLayerEight node];
        InGameMenu *menuLayer = [InGameMenu node];
        menuLayer.layer = layer;
        layer.myHUD = menuLayer;
        [newScene addChild: layer z:-1];
        [newScene addChild: menuLayer z:1];
    }
    else if (playLayer == 9)
    {
        PlayLayerNine *layer = [PlayLayerNine node];
        InGameMenu *menuLayer = [InGameMenu node];
        menuLayer.layer = layer;
        layer.myHUD = menuLayer;
        [newScene addChild: layer z:-1];
        [newScene addChild: menuLayer z:1];
    }
    else if (playLayer == 10)
    {
        PlayLayerTen *layer = [PlayLayerTen node];
        InGameMenu *menuLayer = [InGameMenu node];
        menuLayer.layer = layer;
        layer.myHUD = menuLayer;
        [newScene addChild: layer z:-1];
        [newScene addChild: menuLayer z:1];
    }
    else if (playLayer == 11)
    {
        PlayLayerEleven *layer = [PlayLayerEleven node];
        InGameMenu *menuLayer = [InGameMenu node];
        menuLayer.layer = layer;
        layer.myHUD = menuLayer;
        [newScene addChild: layer z:-1];
        [newScene addChild: menuLayer z:1];
    }
    else if (playLayer == 20)
    {
        PlayLayerTwenty *layer = [PlayLayerTwenty node];
        InGameMenu *menuLayer = [InGameMenu node];
        menuLayer.layer = layer;
        layer.myHUD = menuLayer;
        [newScene addChild: layer z:-1];
        [newScene addChild: menuLayer z:1];
    }
    else if (playLayer == 21)
    {
        PlayLayerTwentyOne *layer = [PlayLayerTwentyOne node];
        InGameMenu *menuLayer = [InGameMenu node];
        menuLayer.layer = layer;
        layer.myHUD = menuLayer;
        [newScene addChild: layer z:-1];
        [newScene addChild: menuLayer z:1];
    }
    else if (playLayer == 22)
    {
        PlayLayerTwentyTwo *layer = [PlayLayerTwentyTwo node];
        InGameMenu *menuLayer = [InGameMenu node];
        menuLayer.layer = layer;
        layer.myHUD = menuLayer;
        [newScene addChild: layer z:-1];
        [newScene addChild: menuLayer z:1];
    }
    else if (playLayer == 30)
    {
        PL30 *layer = [PL30 node];
        InGameMenu *menuLayer = [InGameMenu node];
        menuLayer.layer = layer;
        layer.myHUD = menuLayer;
        [newScene addChild: layer z:-1];
        [newScene addChild: menuLayer z:1];
    }
    else if (playLayer == 31)
    {
        PL31 *layer = [PL31 node];
        InGameMenu *menuLayer = [InGameMenu node];
        menuLayer.layer = layer;
        layer.myHUD = menuLayer;
        [newScene addChild: layer z:-1];
        [newScene addChild: menuLayer z:1];
    }
    else if (playLayer == 32)
    {
        PL32 *layer = [PL32 node];
        InGameMenu *menuLayer = [InGameMenu node];
        menuLayer.layer = layer;
        layer.myHUD = menuLayer;
        [newScene addChild: layer z:-1];
        [newScene addChild: menuLayer z:1];
    }
    else if (playLayer == 33)
    {
        PL33 *layer = [PL33 node];
        InGameMenu *menuLayer = [InGameMenu node];
        menuLayer.layer = layer;
        layer.myHUD = menuLayer;
        [newScene addChild: layer z:-1];
        [newScene addChild: menuLayer z:1];
    }
    else if (playLayer == 34)
    {
        PL34 *layer = [PL34 node];
        InGameMenu *menuLayer = [InGameMenu node];
        menuLayer.layer = layer;
        layer.myHUD = menuLayer;
        [newScene addChild: layer z:-1];
        [newScene addChild: menuLayer z:1];
    }
    else{
        NSLog(@"\n________\n________\nSCENE ERROR\n________\n________\n");
        PlayLayerOne *layer = [PlayLayerOne node];
        InGameMenu *menuLayer = [InGameMenu node];
        menuLayer.layer = layer;
        layer.myHUD = menuLayer;
        [newScene addChild: layer z:-1];
        [newScene addChild: menuLayer z:1];
    }
    
    
    
    if ([GameSceneManager sharedGameSceneManager].justDied)
    {
        [GameSceneManager sharedGameSceneManager].justDied = NO;
        if ([director runningScene]) {
            
            [director replaceScene: [CCTransitionFade transitionWithDuration:1.2f scene:newScene]];
        }
        else {
            [director runWithScene:newScene];		
        }
        return;
    }
	
	if ([director runningScene]) {
        
        [director replaceScene: [CCTransitionFade transitionWithDuration:0.5f scene:newScene]];
        
	}
	else {
		[director runWithScene:newScene];		
	}
    
    
}
 





+(void) goRealInGameMenu 
{
    CCLayer *layer = [RealInGameMenu node];
    
    CCDirector *director = [CCDirector sharedDirector];
    CCScene *newScene = [CCScene node];
	[newScene addChild: layer z:1];
    
	
	if ([director runningScene]) {
        
        [director replaceScene: [CCTransitionFade transitionWithDuration:0.2f scene:newScene]];
        
	}
	else {
		[director runWithScene:newScene];		
	}
}

+(void) goBattle: (int) battleSceneID 
{
    /*
    BattleEngineLayer *layer = [BattleEngineLayer node];
    [layer startBattle:battleSceneID];
    CCDirector *director = [CCDirector sharedDirector];
    CCScene *newScene = [CCScene node];
	[newScene addChild: layer z:1];
     */
    
    BattleLayer *layer = [BattleLayer nodeWithBattleID:battleSceneID];
    [layer startBattle];
    CCDirector *director = [CCDirector sharedDirector];
    CCScene *newScene = [CCScene node];
	[newScene addChild: layer z:1];
	
	if ([director runningScene]) {
        
        [director replaceScene: [CCTransitionTurnOffTiles transitionWithDuration:0.3f scene:newScene]];
        
	}
	else {
		[director runWithScene:newScene];		
	}
}


+(void) goShop: (int) code
{
    ItemShopMenu *layer = [ItemShopMenu node];
    [layer initWithShopCode:code];
    
    CCDirector *director = [CCDirector sharedDirector];
    CCScene *newScene = [CCScene node];
	[newScene addChild: layer z:1];
    
	
	if ([director runningScene]) {
        
        [director replaceScene: [CCTransitionFade transitionWithDuration:0.2f scene:newScene]];
        
	}
	else {
		[director runWithScene:newScene];		
	}
}


+(void) goMenu 
{
    
    CCDirector *director = [CCDirector sharedDirector];
    CCScene *newScene = [CCScene node];
    
    
    CCLayer *menuLayer = [MenuLayer node];
    [newScene addChild: menuLayer z:10];

    
    int playLayer = [GameSceneManager sharedGameSceneManager].hero.currentMap;
    
    PlayLayer *layer;
    
    if (!playLayer) {
        playLayer = 1;
    }
    
    if (playLayer == 1)
    {
        layer = [PlayLayerOne node];
    }
    else if (playLayer == 2)
    {
        layer = [PlayLayerTwo node];
    }
    else if (playLayer == 3)
    {
        layer = [PlayLayerThree node];
    }
    else if (playLayer == 4)
    {
        layer = [PlayLayerFour node];
    }
    else if (playLayer == 5)
    {
        layer = [PlayLayerFive node];
    }
    else if (playLayer == 6)
    {
        layer = [PlayLayerSix node];
    }
    else if (playLayer == 7)
    {
        layer = [PlayLayerSeven node];
    }
    else if (playLayer == 8)
    {
        layer = [PlayLayerEight node];
    }
    else if (playLayer == 9)
    {
        layer = [PlayLayerNine node];
    }
    else if (playLayer == 10)
    {
        layer = [PlayLayerTen node];
    }
    else if (playLayer == 11)
    {
        layer = [PlayLayerEleven node];
    }
    else if (playLayer == 20)
    {
        layer = [PlayLayerTwenty node];
    }
    else if (playLayer == 21)
    {
        layer = [PlayLayerTwentyOne node];
    }
    else if (playLayer == 22)
    {
        layer = [PlayLayerTwentyTwo node];
    }
    else if (playLayer == 30)
    {
        layer = [PL30 node];
    }
    else if (playLayer == 31)
    {
        layer = [PL31 node];
    }
    else if (playLayer == 32)
    {
        layer = [PL32 node];
    }
    else if (playLayer == 33)
    {
        layer = [PL33 node];
    }
    else if (playLayer == 34)
    {
        layer = [PL34 node];
    }
    else{
        layer = [PlayLayerOne node];
    }
    
    
    InGameMenu *fauxMenuLayer = [InGameMenu nodeAsBackground];
    fauxMenuLayer.layer = layer;
    layer.myHUD = fauxMenuLayer;
    [newScene addChild: layer z:-1];
    [newScene addChild: fauxMenuLayer z:1];
    
    
    
    NSLog(@"Scene position:  x: %f  y: %f",newScene.position.x,newScene.position.y);
    NSLog(@"Menu Layer position:  x: %f  y: %f",menuLayer.position.x,menuLayer.position.y);
    
    NSLog(@"Anchorpoint position:  x: %f  y: %f",newScene.anchorPoint.x,newScene.anchorPoint.y);
    

    if ([director runningScene]) {
        [director replaceScene: [CCTransitionFade transitionWithDuration:0.5f scene:newScene]];
    }
    else {
        [director runWithScene:newScene];
    }
    
}

+(void) goOptions 
{
    CCLayer *layer = [OptionsLayer node];
    [SceneManager go: layer];
}
 
+(void) goTutorial 
{
    CCLayer *layer = [TutorialLayer node];
    [SceneManager go: layer];
}





 

+(void) go: (CCLayer *) layer 
{
	CCDirector *director = [CCDirector sharedDirector];
	CCScene *newScene = [SceneManager wrap:layer];
	
	if ([director runningScene]) {
		[director replaceScene:newScene];
	}
	else {
		[director runWithScene:newScene];		
	}
}

+(CCScene *) wrap: (CCLayer *) layer 
{
	CCScene *newScene = [CCScene node];
	[newScene addChild: layer];
	return newScene;
}



@end





