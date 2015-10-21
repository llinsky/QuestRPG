//
//  DisplayBattleItems.m
//  Quest
//
//  Created by Leo Linsky on 9/29/12.
//  Copyright 2012 __MyCompanyName__. All rights reserved.
//

#import "DisplayBattleItems.h"
#import "BattleEngineLayer.h"
#import "CCMenuAdvanced.h"
#import "BattleLayer.h"


@implementation DisplayBattleItems


@synthesize hero;

-(id)init
{
    if (self = [super init])
    {
        self.hero = [GameSceneManager sharedGameSceneManager].hero;
        
        
        //EDIT UI
        
        CGSize winSize = [[CCDirector sharedDirector] winSize];
        CCSprite *background = [CCSprite spriteWithFile: @"pinktemp3.png"];
		background.position = ccp(120, winSize.height/2 + 20);
		[self addChild:background z:1];
        
        CCMenuItemImage *backToGame = [CCMenuItemImage itemFromNormalImage:@"back_button.png" selectedImage:@"back_button_down.png" target:self selector:@selector(touchedBack)];
		CCMenu *menu24 = [CCMenu menuWithItems:backToGame, nil];
		menu24.position = ccp(80, winSize.height - 35);
		[self addChild:menu24 z:2];
        
        isShowingItemLayer = NO;
        
        
        usableInventory = [self usableItemsFromInventory];
        [usableInventory retain];
        
        NSArray *menuItems = [self labelsFromInventory];
        
        CCMenuAdvanced *menu1 = [CCMenuAdvanced menuWithItems: nil];	
        for (CCMenuItem *item in menuItems)
            [menu1 addChild: item];	
        
        [menu1 alignItemsVerticallyWithPadding: 10 bottomToTop: NO]; //< also sets contentSize and keyBindings on Mac
        //menu.isRelativeAnchorPoint = YES;	
        menu1.position = ccp(40, 80);
        [self addChild:menu1 z:3 tag:101];
        
        //menu.scale = MIN ((winSize.width / 2.0f) / menu.contentSize.width, 0.75f );
        menu1.boundaryRect = CGRectMake(menu1.position.x, menu1.position.y, 140.0, 150.0);
        [menu1 fixPosition];
        
        
    }
    return self;
}





-(void)labelPressed:(id)sender
{
    int tempInt = ((CCMenuItemLabel*)sender).tag;
    
    Item *tempItem;
    tempItem = [usableInventory objectAtIndex:tempInt];
    
    if (isShowingItemLayer)
    {
        [self removeChild:detailLayer cleanup:YES];
        isShowingItemLayer = NO;
    }
    else
    {
        detailLayer = [[DisplayEquipItemLayer alloc] init];
        detailLayer.tag = 9999;
    }
    
    
    if (detailLayer.tag != tempInt)
    {
        detailLayer = [[DisplayEquipItemLayer alloc] initWithItem:tempItem source:3];
        currentItemIndex = tempItem.itemCode;
        [self addChild:detailLayer z:34000];
        isShowingItemLayer = YES;
        detailLayer.tag = tempInt;
    }
    
    
}



-(NSArray*)labelsFromInventory
{
    NSMutableArray* array2 = [NSMutableArray array];
    
    
    for(int i = 0; i< usableInventory.count;i++)
    {
        CCMenuItemLabel *label = [CCMenuItemLabel itemWithLabel:[CCLabelTTF labelWithString:[NSString stringWithFormat:@"%@ - %d", ((Item*)[usableInventory objectAtIndex:i]).name, ((Item*)[usableInventory objectAtIndex:i]).itemCount] fontName:@"Optima-Bold" fontSize:18.0]
                                                         target: self 
                                                       selector: @selector(labelPressed:)];
        label.tag = i;
        [array2 addObject:label];
    }
    if (array2.count == 0)
    {
        CCMenuItemLabel *label = [CCMenuItemLabel itemWithLabel:[CCLabelTTF labelWithString:[NSString stringWithFormat:@"No usable items"] fontName:@"Optima-Bold" fontSize:18.0]
                                                         target: self 
                                                       selector: @selector(touchedBack)];
        label.tag = 0;
        [array2 addObject:label];
    }
    return array2;
}


-(NSArray*)usableItemsFromInventory
{
    NSArray* array1 = hero.heroInventory;
    NSMutableArray* array3 = [NSMutableArray array];
    
    for(int i = 0; i < array1.count; i++)
    {
        if (((Item*)([array1 objectAtIndex:i])).canUseInBattle)
        {
            [array3 addObject:([array1 objectAtIndex:i])];
        }
    }
    return array3;
}


-(void)useItem
{
    if (currentItemIndex < 5)
    {
        if (((BattleLayer*)(self.parent)).hero.heroCurrentHP == ((BattleLayer*)(self.parent)).hero.heroHP) //can't heal if you are
        {
            [MusicHandler playButtonClick];
            [self touchedBack];
            return;
        }
    }
    else if ((currentItemIndex >= 11) && (currentItemIndex <= 18)) //can't use staff against bosses
    {
        if (((BattleLayer*)(self.parent)).isBoss)
        {
            [MusicHandler playButtonClick];
            [self touchedBack];
            return;
        }
    }
    
    [((BattleLayer*)(self.parent)) setCurrentItemCode:currentItemIndex];
    
    NSMutableArray *array = [hero.heroInventory mutableCopy];
    BOOL shouldDeleteItem = NO;
    int tempIndex;
    for (int i = 0; i < array.count; i++)
    {
        if (((Item*)[array objectAtIndex:i]).itemCode == currentItemIndex)
        {
            ((Item*)[array objectAtIndex:i]).itemCount--;
            tempIndex = i;
            if (((Item*)[array objectAtIndex:i]).itemCount <= 0)
            {
                shouldDeleteItem = YES;
            }
            break;
        }
    }
    if (shouldDeleteItem)
    {
        [array removeObject:[array objectAtIndex:tempIndex]];
    }
    hero.heroInventory = array;
    [GameSceneManager sharedGameSceneManager].hero = hero;

    
    [((BattleLayer*)(self.parent)) doBattleCycle:3];
    [self touchedBack];
    
    /*
    [((BattleEngineLayer*)(self.parent)) itemCycle:currentItemIndex];
    [self touchedBack];
     */
}


-(void)touchedBack
{
    if (isShowingItemLayer)
    {
        [self removeChild:detailLayer cleanup:YES];
        isShowingItemLayer = NO;
    }
    
    [MusicHandler playButtonClick];
    [((BattleLayer*)(self.parent)) touchedBack];
    
    /*
    [MusicHandler playButtonClick];
    [((BattleEngineLayer*)(self.parent)) touchedBack];
     */
}






@end
