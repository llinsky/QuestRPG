//
//  RealInGameMenu.m
//  Quest
//
//  Created by Leo Linsky on 5/17/12.
//  Copyright 2012 __MyCompanyName__. All rights reserved.
//


#import "RealInGameMenu.h"


@implementation RealInGameMenu

@synthesize hero;
@synthesize statMenuOn, armoryOn, mapOn, invMenuOn, attribMenuOn;



-(id) init
{
	
	if ((self = [super init])) {
		CGSize winSize = [[CCDirector sharedDirector] winSize];
		
		CCSprite *background = [CCSprite spriteWithFile: @"IGmenuback5.png"];
		background.position = ccp(winSize.width/2, winSize.height/2 + 20);
		[self addChild:background z:-1];
        
		
        
		CCMenuItemImage *backToGame = [CCMenuItemImage itemFromNormalImage:@"igmenugame4.png" selectedImage:@"igmenugame4_pressed.png" target:self selector:@selector(goBackGame:)];
        
        
		CCMenuItemImage *heroStats = [CCMenuItemImage itemFromNormalImage:@"igmenutabstats3.png" selectedImage:@"igmenutabstats2_pressed.png" target:self selector:@selector(seeHeroStats:)];
        CCMenuItemImage *inventory = [CCMenuItemImage itemFromNormalImage:@"igmenutabitems3.png" selectedImage:@"igmenutabitems2_pressed.png" target:self selector:@selector(seeInventory:)];
        CCMenuItemImage *seeAttrib = [CCMenuItemImage itemFromNormalImage:@"igmenutabattrib3.png" selectedImage:@"igmenutabattrib2_pressed.png" target:self selector:@selector(seeAttributes:)];
        CCMenuItemImage *armory = [CCMenuItemImage itemFromNormalImage:@"igmenutabequip3.png" selectedImage:@"igmenutabequip2_pressed.png" target:self selector:@selector(seeArmory:)];
        CCMenuItemImage *map = [CCMenuItemImage itemFromNormalImage:@"igmenutabmap3.png" selectedImage:@"igmenutabmap2_pressed.png" target:self selector:@selector(seeMap:)];

        
        //CCMenuItemImage *backToMenu = [CCMenuItemImage itemFromNormalImage:@"igmenuquit1.png" selectedImage:@"igmenuquit1_pressed.png" target:self selector:@selector(goBackMenu:)];
        
        
    
		CCMenu *menu = [CCMenu menuWithItems:heroStats, seeAttrib, armory, inventory, map, nil];
		menu.position = ccp(winSize.width/2, 18);
		[menu alignItemsHorizontallyWithPadding:2.0f];
		[self addChild:menu z:2];
        
        CCMenu *menu2 = [CCMenu menuWithItems:backToGame, nil];
		menu2.position = ccp(winSize.width - 46, winSize.height - 20);
		[menu2 alignItemsVerticallyWithPadding: 6.0f];
		[self addChild:menu2 z:2];
        
        
        
        
        
        
        self.hero = [GameSceneManager sharedGameSceneManager].hero;
        [self.hero release];
        
        firstLoadDone = NO;
        
        self.statMenuOn = NO;
        self.invMenuOn = NO;
        self.armoryOn = NO;
        self.mapOn = NO;
        self.attribMenuOn = NO;
        
        self.isTouchEnabled = YES;
        
        id touch;
        [self seeHeroStats:touch];
         
	}
	
	return self;
}


-(void) goBackGame: (id)sender
{
    [MusicHandler playButtonClick];
    self.hero.mapInitMode = 7;
    [self goSave];
    int temp = self.hero.currentMap;
    [SceneManager goPlay:temp];
    return;
}

-(void) goBackMenu
{
    [MusicHandler playButtonClick];
    [self goSave];
    [SceneManager goMenu];
    return;
}

-(void) goSave
{
    [GameSceneManager sharedGameSceneManager].hero = self.hero;
}




-(void)fadeStatMenu
{
    [self removeChild:statsModule cleanup:YES];
    [statsModule release];
    self.isTouchEnabled = YES;
}
-(void)fadeInvMenu
{
    [self removeChild:inventoryModule cleanup:YES];
    [inventoryModule release];
    self.isTouchEnabled = YES;
}
-(void)fadeArmMenu
{
    [self removeChild:armoryModule cleanup:YES];
    [armoryModule release];
    self.isTouchEnabled = YES;
}
-(void)fadeAttribMenu
{
    [self removeChild:attribModule cleanup:YES];
    [attribModule release];
    self.isTouchEnabled = YES;
}
-(void)fadeMapMenu
{
    [self removeChild:mapModule cleanup:YES];
    [mapModule release];
    self.isTouchEnabled = YES;
}









-(void) seeHeroStats: (id)sender
{
    if (!self.isTouchEnabled)
    {
        return;
    }
    if (invMenuOn)
    {
        id actionMove = [CCMoveTo actionWithDuration:0.3 position:ccp(inventoryModule.position.x + 540, inventoryModule.position.y)];
        [inventoryModule runAction:[CCSequence actions:actionMove, nil]];
        self.isTouchEnabled = NO;
        [self performSelector:@selector(fadeInvMenu) withObject:nil afterDelay:0.3];
        self.invMenuOn = NO;
    }
    if (armoryOn)
    {
        id actionMove = [CCMoveTo actionWithDuration:0.3 position:ccp(armoryModule.position.x + 540, armoryModule.position.y)];
        [armoryModule runAction:[CCSequence actions:actionMove, nil]];
        self.isTouchEnabled = NO;
        [self performSelector:@selector(fadeArmMenu) withObject:nil afterDelay:0.3];
        self.armoryOn = NO;
    }
    if (attribMenuOn)
    {
        id actionMove = [CCMoveTo actionWithDuration:0.3 position:ccp(attribModule.position.x + 540, attribModule.position.y)];
        [attribModule runAction:[CCSequence actions:actionMove, nil]];
        self.isTouchEnabled = NO;
        [self performSelector:@selector(fadeAttribMenu) withObject:nil afterDelay:0.3];
        self.attribMenuOn = NO;
    }
    if (mapOn)
    {
        id actionMove = [CCMoveTo actionWithDuration:0.3 position:ccp(mapModule.position.x + 540, mapModule.position.y)];
        [mapModule runAction:[CCSequence actions:actionMove, nil]];
        self.isTouchEnabled = NO;
        [self performSelector:@selector(fadeMapMenu) withObject:nil afterDelay:0.3];
        self.mapOn = NO;
    }
    if (!self.statMenuOn)
    {
        statsModule = [[DisplayStats alloc] init];
        if (firstLoadDone)
        {
            [statsModule setPosition: ccp(statsModule.position.x - 540, statsModule.position.y)];
            [self addChild:statsModule z:1];
            id actionMove = [CCMoveTo actionWithDuration:0.3 position:ccp(statsModule.position.x + 540, statsModule.position.y)];
            [statsModule runAction:[CCSequence actions:actionMove, nil]];
        }
        else
        {
            [self addChild:statsModule z:1];
            firstLoadDone = YES;        }
        self.statMenuOn = YES;
    }

}

-(void) seeInventory: (id)sender
{
    if (!self.isTouchEnabled)
    {
        return;
    }
    BOOL comeFromLeft = NO;
    if (statMenuOn)
    {
        self.hero = statsModule.hero;
        id actionMove = [CCMoveTo actionWithDuration:0.3 position:ccp(statsModule.position.x - 540, statsModule.position.y)];
        [statsModule runAction:[CCSequence actions:actionMove, nil]];
        self.isTouchEnabled = NO;
        [self performSelector:@selector(fadeStatMenu) withObject:nil afterDelay:0.3];
        self.statMenuOn = NO;
    }
    if (armoryOn)
    {
        id actionMove = [CCMoveTo actionWithDuration:0.3 position:ccp(armoryModule.position.x - 540, armoryModule.position.y)];
        [armoryModule runAction:[CCSequence actions:actionMove, nil]];
        self.isTouchEnabled = NO;
        [self performSelector:@selector(fadeArmMenu) withObject:nil afterDelay:0.3];
        self.armoryOn = NO;
    }
    if (attribMenuOn)
    {
        id actionMove = [CCMoveTo actionWithDuration:0.3 position:ccp(attribModule.position.x - 540, attribModule.position.y)];
        [attribModule runAction:[CCSequence actions:actionMove, nil]];
        self.isTouchEnabled = NO;
        [self performSelector:@selector(fadeAttribMenu) withObject:nil afterDelay:0.3];
        self.attribMenuOn = NO;
    }
    if (mapOn)
    {
        id actionMove = [CCMoveTo actionWithDuration:0.3 position:ccp(mapModule.position.x + 540, mapModule.position.y)];
        [mapModule runAction:[CCSequence actions:actionMove, nil]];
        self.isTouchEnabled = NO;
        [self performSelector:@selector(fadeMapMenu) withObject:nil afterDelay:0.3];
        self.mapOn = NO;
        comeFromLeft = YES;
    }
    
    if (!self.invMenuOn)
    {
        inventoryModule = [[DisplayInventory alloc] init];
        [self addChild:inventoryModule z:1];
        int a;
        if (comeFromLeft)
            a = -540;
        else
            a = 540;
        [inventoryModule setPosition: ccp(inventoryModule.position.x + a, inventoryModule.position.y)];
        id actionMove = [CCMoveTo actionWithDuration:0.3 position:ccp(inventoryModule.position.x - a, inventoryModule.position.y)];
        [inventoryModule runAction:[CCSequence actions:actionMove, nil]];
        self.invMenuOn = YES;
    }
}

-(void) seeAttributes:(id)sender
{
    if (!self.isTouchEnabled)
    {
        return;
    }
    BOOL comeFromLeft = YES;
    if (invMenuOn)
    {
        id actionMove = [CCMoveTo actionWithDuration:0.3 position:ccp(inventoryModule.position.x + 540, inventoryModule.position.y)];
        [inventoryModule runAction:[CCSequence actions:actionMove, nil]];
        self.isTouchEnabled = NO;
        [self performSelector:@selector(fadeInvMenu) withObject:nil afterDelay:0.3];
        self.invMenuOn = NO;
    }
    if (armoryOn)
    {
        id actionMove = [CCMoveTo actionWithDuration:0.3 position:ccp(armoryModule.position.x + 540, armoryModule.position.y)];
        [armoryModule runAction:[CCSequence actions:actionMove, nil]];
        self.isTouchEnabled = NO;
        [self performSelector:@selector(fadeArmMenu) withObject:nil afterDelay:0.3];
        self.armoryOn = NO;
    }
    if (statMenuOn)
    {
        comeFromLeft = NO;
        self.hero = statsModule.hero;
        id actionMove = [CCMoveTo actionWithDuration:0.3 position:ccp(statsModule.position.x - 540, statsModule.position.y)];
        [statsModule runAction:[CCSequence actions:actionMove, nil]];
        self.isTouchEnabled = NO;
        [self performSelector:@selector(fadeStatMenu) withObject:nil afterDelay:0.3];
        self.statMenuOn = NO;
    }
    if (mapOn)
    {
        id actionMove = [CCMoveTo actionWithDuration:0.3 position:ccp(mapModule.position.x + 540, mapModule.position.y)];
        [mapModule runAction:[CCSequence actions:actionMove, nil]];
        self.isTouchEnabled = NO;
        [self performSelector:@selector(fadeMapMenu) withObject:nil afterDelay:0.3];
        self.mapOn = NO;
    }
    
    if (!self.attribMenuOn)
    {
        attribModule = [[DisplayAttributes alloc] init];
        [self addChild:attribModule z:1];
        int a;
        if (comeFromLeft)
            a = -540;
        else
            a = 540;
        [attribModule setPosition: ccp(attribModule.position.x + a, attribModule.position.y)];
        id actionMove = [CCMoveTo actionWithDuration:0.3 position:ccp(attribModule.position.x - a, attribModule.position.y)];
        [attribModule runAction:[CCSequence actions:actionMove, nil]];
        self.attribMenuOn = YES;
    }
}











-(void) seeArmory: (id)sender
{
    if (!self.isTouchEnabled)
    {
        return;
    }
    BOOL comeFromLeft = NO;
    if (invMenuOn)
    {
        id actionMove = [CCMoveTo actionWithDuration:0.3 position:ccp(inventoryModule.position.x + 540, inventoryModule.position.y)];
        [inventoryModule runAction:[CCSequence actions:actionMove, nil]];
        self.isTouchEnabled = NO;
        [self performSelector:@selector(fadeInvMenu) withObject:nil afterDelay:0.3];
        self.invMenuOn = NO;
        comeFromLeft = YES;
    }
    if (statMenuOn)
    {
        self.hero = statsModule.hero;
        id actionMove = [CCMoveTo actionWithDuration:0.3 position:ccp(statsModule.position.x - 540, statsModule.position.y)];
        [statsModule runAction:[CCSequence actions:actionMove, nil]];
        self.isTouchEnabled = NO;
        [self performSelector:@selector(fadeStatMenu) withObject:nil afterDelay:0.3];;
        self.statMenuOn = NO;
    }
    if (attribMenuOn)
    {
        id actionMove = [CCMoveTo actionWithDuration:0.3 position:ccp(attribModule.position.x - 540, attribModule.position.y)];
        [attribModule runAction:[CCSequence actions:actionMove, nil]];
        self.isTouchEnabled = NO;
        [self performSelector:@selector(fadeAttribMenu) withObject:nil afterDelay:0.3];
        self.attribMenuOn = NO;
    }
    if (mapOn)
    {
        id actionMove = [CCMoveTo actionWithDuration:0.3 position:ccp(mapModule.position.x + 540, mapModule.position.y)];
        [mapModule runAction:[CCSequence actions:actionMove, nil]];
        self.isTouchEnabled = NO;
        [self performSelector:@selector(fadeMapMenu) withObject:nil afterDelay:0.3];
        self.mapOn = NO;
        comeFromLeft = YES;
    }
    
    if (!self.armoryOn)
    {
        armoryModule = [[DisplayArmory alloc] init];
        [self addChild:armoryModule z:1];
        int a;
        if (comeFromLeft)
            a = -540;
        else
            a = 540;
        [armoryModule setPosition: ccp(armoryModule.position.x + a, armoryModule.position.y)];
        id actionMove = [CCMoveTo actionWithDuration:0.3 position:ccp(armoryModule.position.x - a, armoryModule.position.y)];
        [armoryModule runAction:[CCSequence actions:actionMove, nil]];
        self.armoryOn = YES;
    }
}

- (void) seeMap:(id)sender
{
    if (!self.isTouchEnabled)
    {
        return;
    }
    if (invMenuOn)
    {
        id actionMove = [CCMoveTo actionWithDuration:0.3 position:ccp(inventoryModule.position.x - 540, inventoryModule.position.y)];
        [inventoryModule runAction:[CCSequence actions:actionMove, nil]];
        self.isTouchEnabled = NO;
        [self performSelector:@selector(fadeInvMenu) withObject:nil afterDelay:0.3];
        self.invMenuOn = NO;
    }
    if (armoryOn)
    {
        id actionMove = [CCMoveTo actionWithDuration:0.3 position:ccp(armoryModule.position.x - 540, armoryModule.position.y)];
        [armoryModule runAction:[CCSequence actions:actionMove, nil]];
        self.isTouchEnabled = NO;
        [self performSelector:@selector(fadeArmMenu) withObject:nil afterDelay:0.3];
        self.armoryOn = NO;
    }
    if (attribMenuOn)
    {
        id actionMove = [CCMoveTo actionWithDuration:0.3 position:ccp(attribModule.position.x - 540, attribModule.position.y)];
        [attribModule runAction:[CCSequence actions:actionMove, nil]];
        self.isTouchEnabled = NO;
        [self performSelector:@selector(fadeAttribMenu) withObject:nil afterDelay:0.3];
        self.attribMenuOn = NO;
    }
    if (statMenuOn)
    {
        self.hero = statsModule.hero;
        id actionMove = [CCMoveTo actionWithDuration:0.3 position:ccp(statsModule.position.x - 540, statsModule.position.y)];
        [statsModule runAction:[CCSequence actions:actionMove, nil]];
        self.isTouchEnabled = NO;
        [self performSelector:@selector(fadeStatMenu) withObject:nil afterDelay:0.3];
        self.statMenuOn = NO;
    }
    
    if (!self.mapOn)
    {
        mapModule = [[DisplayMap alloc] init];
        [self addChild:mapModule z:1];
        [mapModule setPosition: ccp(mapModule.position.x + 540, mapModule.position.y)];
        id actionMove = [CCMoveTo actionWithDuration:0.3 position:ccp(mapModule.position.x - 540, mapModule.position.y)];
        [mapModule runAction:[CCSequence actions:actionMove, nil]];
        self.mapOn = YES;
    }
}


-(void)goTele:(int)layer
{
    self.hero.mapInitMode = 3;
    [GameSceneManager sharedGameSceneManager].hero = self.hero;
    [SceneManager goPlay:layer];
}








@end
