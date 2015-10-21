//
//  DisplayInventory.m
//  Quest
//
//  Created by Leo Linsky on 5/19/12.
//  Copyright 2012 __MyCompanyName__. All rights reserved.
//

#import "DisplayInventory.h"
#import "GameSceneManager.h"
#import "MyHero.h"
#import "CCScrollLayer.h"
#import "CCMenuAdvanced.h"
#import "Item.h"
#import "RealInGameMenu.h"



@implementation DisplayInventory

-(void)touchedBack
{
    if (isShowingItemLayer)
    {
        [self removeChild:detailLayer cleanup:YES];
        isShowingItemLayer = NO;
    }
}

-(id) init
{
    if (self = [super init])
    {
        hero = [GameSceneManager sharedGameSceneManager].hero;
        isShowingItemLayer = NO;
        
        //
        
        NSMutableArray *array = [hero.heroInventory mutableCopy];
        BOOL shouldAddItem = YES;
        
        Item *item1 = [[Item alloc] initWithItemCode:73];
        Item *item2 = [[Item alloc] initWithItemCode:101];
        Item *item3 = [[Item alloc] initWithItemCode:142];
        Item *item4 = [[Item alloc] initWithItemCode:127];
        Item *item5 = [[Item alloc] initWithItemCode:74];
        Item *item6 = [[Item alloc] initWithItemCode:24];
        Item *item7 = [[Item alloc] initWithItemCode:93];
        Item *item8 = [[Item alloc] initWithItemCode:33];
        Item *item9 = [[Item alloc] initWithItemCode:98];
        Item *item10 = [[Item alloc] initWithItemCode:100];
        Item *item11 = [[Item alloc] initWithItemCode:31];
        Item *item12 = [[Item alloc] initWithItemCode:32];
        
        for (int i = 0; i < array.count; i++)
        {
            if (((Item*)[array objectAtIndex:i]).itemCode == item1.itemCode)
            {
                ((Item*)[array objectAtIndex:i]).itemCount++;
                shouldAddItem = NO;
                break;
            }
        }
        if (shouldAddItem)
        {
            [array addObject:(item1)];
        }
        shouldAddItem = YES;
        for (int i = 0; i < array.count; i++)
        {
            if (((Item*)[array objectAtIndex:i]).itemCode == item2.itemCode)
            {
                ((Item*)[array objectAtIndex:i]).itemCount++;
                shouldAddItem = NO;
                break;
            }
        }
        if (shouldAddItem)
        {
            [array addObject:(item2)];
        }
        shouldAddItem = YES;
        for (int i = 0; i < array.count; i++)
        {
            if (((Item*)[array objectAtIndex:i]).itemCode == item3.itemCode)
            {
                ((Item*)[array objectAtIndex:i]).itemCount++;
                shouldAddItem = NO;
                break;
            }
        }
        if (shouldAddItem)
        {
            [array addObject:(item3)];
        }
        shouldAddItem = YES;
        for (int i = 0; i < array.count; i++)
        {
            if (((Item*)[array objectAtIndex:i]).itemCode == item4.itemCode)
            {
                ((Item*)[array objectAtIndex:i]).itemCount++;
                shouldAddItem = NO;
                break;
            }
        }
        if (shouldAddItem)
        {
            [array addObject:(item4)];
        }
        shouldAddItem = YES;
        for (int i = 0; i < array.count; i++)
        {
            if (((Item*)[array objectAtIndex:i]).itemCode == item5.itemCode)
            {
                ((Item*)[array objectAtIndex:i]).itemCount++;
                shouldAddItem = NO;
                break;
            }
        }
        if (shouldAddItem)
        {
            [array addObject:(item5)];
        }
        shouldAddItem = YES;
        for (int i = 0; i < array.count; i++)
        {
            if (((Item*)[array objectAtIndex:i]).itemCode == item6.itemCode)
            {
                ((Item*)[array objectAtIndex:i]).itemCount++;
                shouldAddItem = NO;
                break;
            }
        }
        if (shouldAddItem)
        {
            [array addObject:(item6)];
        }
        shouldAddItem = YES;
        for (int i = 0; i < array.count; i++)
        {
            if (((Item*)[array objectAtIndex:i]).itemCode == item7.itemCode)
            {
                ((Item*)[array objectAtIndex:i]).itemCount++;
                shouldAddItem = NO;
                break;
            }
        }
        if (shouldAddItem)
        {
            [array addObject:(item7)];
        }
        shouldAddItem = YES;
        for (int i = 0; i < array.count; i++)
        {
            if (((Item*)[array objectAtIndex:i]).itemCode == item8.itemCode)
            {
                ((Item*)[array objectAtIndex:i]).itemCount++;
                shouldAddItem = NO;
                break;
            }
        }
        if (shouldAddItem)
        {
            [array addObject:(item8)];
        }
        
        shouldAddItem = YES;
        for (int i = 0; i < array.count; i++)
        {
            if (((Item*)[array objectAtIndex:i]).itemCode == item9.itemCode)
            {
                ((Item*)[array objectAtIndex:i]).itemCount++;
                shouldAddItem = NO;
                break;
            }
        }
        if (shouldAddItem)
        {
            [array addObject:(item9)];
        }
        
        shouldAddItem = YES;
        for (int i = 0; i < array.count; i++)
        {
            if (((Item*)[array objectAtIndex:i]).itemCode == item10.itemCode)
            {
                ((Item*)[array objectAtIndex:i]).itemCount++;
                shouldAddItem = NO;
                break;
            }
        }
        if (shouldAddItem)
        {
            [array addObject:(item10)];
        }
        
        shouldAddItem = YES;
        for (int i = 0; i < array.count; i++)
        {
            if (((Item*)[array objectAtIndex:i]).itemCode == item11.itemCode)
            {
                ((Item*)[array objectAtIndex:i]).itemCount++;
                shouldAddItem = NO;
                break;
            }
        }
        if (shouldAddItem)
        {
            [array addObject:(item11)];
        }
        
        shouldAddItem = YES;
        for (int i = 0; i < array.count; i++)
        {
            if (((Item*)[array objectAtIndex:i]).itemCode == item12.itemCode)
            {
                ((Item*)[array objectAtIndex:i]).itemCount++;
                shouldAddItem = NO;
                break;
            }
        }
        if (shouldAddItem)
        {
            [array addObject:(item12)];
        }
        
        hero.heroInventory = array;
        
        
        //
        
        
        
        
        
        
        CGSize winSize = [[CCDirector sharedDirector] winSize];
        
        /*
        CCSprite *background = [CCSprite spriteWithFile: @"inventoryback1.png"];
		background.position = ccp(winSize.width/2 - 102, winSize.height/2);
		[self addChild:background z:4];
        */
        
        /*
        CCLabelTTF *label02 = [CCLabelTTF labelWithString:[NSString stringWithFormat:@"Inventory"] dimensions: CGSizeMake(140, 30) alignment:UITextAlignmentLeft fontName:@"Optima-Bold" fontSize:20.0];
        label02.color = ccc3(0, 0, 0);
        label02.position = ccp(winSize.width/2, winSize.height/2 + 150);
        [self addChild: label02 z:15];
        */
        
        
        NSArray *menuItems = [self labelsFromInventory];
        
        CCMenuAdvanced *menu = [CCMenuAdvanced menuWithItems: nil];	
        for (CCMenuItem *item in menuItems)
            [menu addChild: item];	
        
        [menu alignItemsVerticallyWithPadding: 10 bottomToTop: NO]; //< also sets contentSize and keyBindings on Mac
        //menu.isRelativeAnchorPoint = YES;	
        menu.position = ccp(0, 160);
        [self addChild:menu z:3 tag:101];
        
        //menu.scale = MIN ((winSize.width / 2.0f) / menu.contentSize.width, 0.75f );
        menu.boundaryRect = CGRectMake(menu.position.x, menu.position.y, 190.0, 20.0);
        [menu fixPosition];
        
        
        
        
        
        
        int b = 0;
        if (hero.gold > 5000)
        {
            b = 4;
        }
        
        CCSprite *goldback = [CCSprite spriteWithFile: @"goldback2.png"];
		goldback.position = ccp(50, winSize.height - 12);
		[self addChild:goldback z:10];
        
        CCSprite *gold = [CCSprite spriteWithFile: @"igmenugold3.png"];
		gold.position = ccp(13, winSize.height - 15);
		[self addChild:gold z:15];
        
        
        if (hero.gold < 20000)
        {
            CCLabelTTF *label02 = [CCLabelTTF labelWithString:[NSString stringWithFormat:@"%dG", hero.gold] dimensions: CGSizeMake(140, 30) alignment:UITextAlignmentLeft fontName:@"Optima-Bold" fontSize:18.0];
            label02.position = ccp(97 - b, winSize.height - 20);
            label02.color = ccc3(255, 255, 255);
            [self addChild: label02 z:15 tag:60];
        }
        else
        {
            CCLabelTTF *label02 = [CCLabelTTF labelWithString:[NSString stringWithFormat:@"%d", hero.gold] dimensions: CGSizeMake(140, 30) alignment:UITextAlignmentLeft fontName:@"Optima-Bold" fontSize:18.0];
            label02.position = ccp(97 - b, winSize.height - 20);
            label02.color = ccc3(255, 255, 255);
            [self addChild: label02 z:15 tag:60];
        }
        
    }
    
    
    
    
    return self;
}



-(void)labelPressed:(id)sender
{
    int tempInt = ((CCMenuItemLabel*)sender).tag;
    Item *tempItem = [hero.heroInventory objectAtIndex:tempInt];
    
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
        detailLayer = [[DisplayEquipItemLayer alloc] initWithItem:tempItem source:2];
        currentItemIndex = tempItem.itemCode;
        [self addChild:detailLayer z:34000];
        isShowingItemLayer = YES;
        detailLayer.tag = tempInt;
    }
    
    
}



-(NSArray*)labelsFromInventory
{
    NSArray* array1 = hero.heroInventory;
    NSMutableArray* array2 = [NSMutableArray array];
    
    
    for(int i = 0; i< array1.count;i++)
    {
        
        /*
        //removing empty items
        if (((int)((Item*)[array1 objectAtIndex:i]).itemCount) <= 0)
        {
            continue;
        }
        */
        
        CCMenuItemLabel *label = [CCMenuItemLabel itemWithLabel:[CCLabelTTF labelWithString:[NSString stringWithFormat:@"%@ - %d", ((Item*)[array1 objectAtIndex:i]).name, ((Item*)[array1 objectAtIndex:i]).itemCount] fontName:@"Optima-Bold" fontSize:18.0]
                                                         target: self 
                                                       selector: @selector(labelPressed:)];
        label.tag = i;
        label.color = ccc3(255, 255, 255);
        [array2 addObject:label];
    }
    return array2;
}

-(void)update
{
    [self removeChildByTag:101 cleanup:YES];
    
    NSArray *menuItems = [self labelsFromInventory];
    
    CCMenuAdvanced *menu = [CCMenuAdvanced menuWithItems: nil];	
    for (CCMenuItem *item in menuItems)
        [menu addChild: item];	
    
    [menu alignItemsVerticallyWithPadding: 10 bottomToTop: NO]; //< also sets contentSize and keyBindings on Mac
    //menu.isRelativeAnchorPoint = YES;	
    menu.position = ccp(20, 110);
    [self addChild:menu z:3 tag:101];
    
    //menu.scale = MIN ((winSize.width / 2.0f) / menu.contentSize.width, 0.75f );
    menu.boundaryRect = CGRectMake(menu.position.x, menu.position.y, 190.0, 20.0);
    [menu fixPosition];
}







-(void) equip
{
    BOOL shouldRemoveItem = NO;
    NSMutableArray *array = [hero.heroInventory mutableCopy];
    int tempIndex;
    
    for (int i = 0; i < array.count; i++)
    {
        if (((Item*)[array objectAtIndex:i]).itemCode == currentItemIndex)
        {
            ((Item*)[array objectAtIndex:i]).itemCount--;
            tempIndex = i;
            if (((Item*)[array objectAtIndex:i]).itemCount <= 0)
            {
                shouldRemoveItem = YES;
            }
            break;
        }
    }
    if (shouldRemoveItem)
    {
        [array removeObject:[array objectAtIndex:tempIndex]];
    }
    
    Item* tempItem = [[Item alloc] initWithItemCode:currentItemIndex];
    Item* tempItem2;
    if (tempItem.equipCode == 1)
    {
        if (hero.itemInPos1)
        {
            tempItem2 = hero.equipPos1;
            hero.aglBonus -= tempItem2.aglBonus;
            hero.strBonus -= tempItem2.strBonus;
            hero.defBonus -= tempItem2.defBonus;
            hero.aglMult /= tempItem2.aglMult;
            hero.strMult /= tempItem2.strMult;
            hero.defMult /= tempItem2.defMult;
            hero.itemExpMult /= tempItem2.expMult;
            hero.itemGoldMult /= tempItem2.goldMult;
            BOOL shouldAddItem = YES;
            
            for (int i = 0; i < array.count; i++)
            {
                if (((Item*)[array objectAtIndex:i]).itemCode == tempItem2.itemCode)
                {
                    ((Item*)[array objectAtIndex:i]).itemCount++;
                    shouldAddItem = NO;
                    break;
                }
            }
            if (shouldAddItem)
            {
                [array addObject:tempItem2];
            }
        }
        hero.equipPos1 = tempItem;
        hero.itemInPos1 = YES;
        hero.aglBonus += hero.equipPos1.aglBonus;
        hero.strBonus += hero.equipPos1.strBonus;
        hero.defBonus += hero.equipPos1.defBonus;
        hero.aglMult *= hero.equipPos1.aglMult;
        hero.strMult *= hero.equipPos1.strMult;
        hero.defMult *= hero.equipPos1.defMult;
        hero.itemExpMult *= hero.equipPos1.expMult;
        hero.itemGoldMult *= hero.equipPos1.goldMult;
    }
    
    
    
    if (tempItem.equipCode == 2)
    {
        if (hero.itemInPos2)
        {
            tempItem2 = hero.equipPos2;
            hero.aglBonus -= tempItem2.aglBonus;
            hero.strBonus -= tempItem2.strBonus;
            hero.defBonus -= tempItem2.defBonus;
            hero.aglMult /= tempItem2.aglMult;
            hero.strMult /= tempItem2.strMult;
            hero.defMult /= tempItem2.defMult;
            hero.itemExpMult /= tempItem2.expMult;
            hero.itemGoldMult /= tempItem2.goldMult;
            BOOL shouldAddItem = YES;
            
            for (int i = 0; i < array.count; i++)
            {
                if (((Item*)[array objectAtIndex:i]).itemCode == tempItem2.itemCode)
                {
                    ((Item*)[array objectAtIndex:i]).itemCount++;
                    shouldAddItem = NO;
                    break;
                }
            }
            if (shouldAddItem)
            {
                [array addObject:tempItem2];
            }
        }
        hero.equipPos2 = tempItem;
        hero.itemInPos2 = YES;
        hero.aglBonus += hero.equipPos2.aglBonus;
        hero.strBonus += hero.equipPos2.strBonus;
        hero.defBonus += hero.equipPos2.defBonus;
        hero.aglMult *= hero.equipPos2.aglMult;
        hero.strMult *= hero.equipPos2.strMult;
        hero.defMult *= hero.equipPos2.defMult;
        hero.itemExpMult *= hero.equipPos2.expMult;
        hero.itemGoldMult *= hero.equipPos2.goldMult;
    }
    if (tempItem.equipCode == 3)
    {
        if (hero.itemInPos3)
        {
            tempItem2 = hero.equipPos3;
            hero.aglBonus -= tempItem2.aglBonus;
            hero.strBonus -= tempItem2.strBonus;
            hero.defBonus -= tempItem2.defBonus;
            hero.aglMult /= tempItem2.aglMult;
            hero.strMult /= tempItem2.strMult;
            hero.defMult /= tempItem2.defMult;
            hero.itemExpMult /= tempItem2.expMult;
            hero.itemGoldMult /= tempItem2.goldMult;
            BOOL shouldAddItem = YES;
            
            for (int i = 0; i < array.count; i++)
            {
                if (((Item*)[array objectAtIndex:i]).itemCode == tempItem2.itemCode)
                {
                    ((Item*)[array objectAtIndex:i]).itemCount++;
                    shouldAddItem = NO;
                    break;
                }
            }
            if (shouldAddItem)
            {
                [array addObject:tempItem2];
            }
        }
        hero.equipPos3 = tempItem;
        hero.itemInPos3 = YES;
        hero.aglBonus += hero.equipPos3.aglBonus;
        hero.strBonus += hero.equipPos3.strBonus;
        hero.defBonus += hero.equipPos3.defBonus;
        hero.aglMult *= hero.equipPos3.aglMult;
        hero.strMult *= hero.equipPos3.strMult;
        hero.defMult *= hero.equipPos3.defMult;
        hero.itemExpMult *= hero.equipPos3.expMult;
        hero.itemGoldMult *= hero.equipPos3.goldMult;
        
    }
    if (tempItem.equipCode == 4)
    {
        if (hero.itemInPos4)
        {
            tempItem2 = hero.equipPos4;
            hero.aglBonus -= tempItem2.aglBonus;
            hero.strBonus -= tempItem2.strBonus;
            hero.defBonus -= tempItem2.defBonus;
            hero.aglMult /= tempItem2.aglMult;
            hero.strMult /= tempItem2.strMult;
            hero.defMult /= tempItem2.defMult;
            hero.itemExpMult /= tempItem2.expMult;
            hero.itemGoldMult /= tempItem2.goldMult;
            BOOL shouldAddItem = YES;
            
            for (int i = 0; i < array.count; i++)
            {
                if (((Item*)[array objectAtIndex:i]).itemCode == tempItem2.itemCode)
                {
                    ((Item*)[array objectAtIndex:i]).itemCount++;
                    shouldAddItem = NO;
                    break;
                }
            }
            if (shouldAddItem)
            {
                [array addObject:tempItem2];
            }
        }
        hero.equipPos4 = tempItem;
        hero.itemInPos4 = YES;
        hero.aglBonus += hero.equipPos4.aglBonus;
        hero.strBonus += hero.equipPos4.strBonus;
        hero.defBonus += hero.equipPos4.defBonus;
        hero.aglMult *= hero.equipPos4.aglMult;
        hero.strMult *= hero.equipPos4.strMult;
        hero.defMult *= hero.equipPos4.defMult;
        hero.itemExpMult *= hero.equipPos4.expMult;
        hero.itemGoldMult *= hero.equipPos4.goldMult;
        
    }
    if (tempItem.equipCode == 5)
    {
        if (hero.itemInPos5)
        {
            tempItem2 = hero.equipPos5;
            hero.aglBonus -= tempItem2.aglBonus;
            hero.strBonus -= tempItem2.strBonus;
            hero.defBonus -= tempItem2.defBonus;
            hero.aglMult /= tempItem2.aglMult;
            hero.strMult /= tempItem2.strMult;
            hero.defMult /= tempItem2.defMult;
            hero.itemExpMult /= tempItem2.expMult;
            hero.itemGoldMult /= tempItem2.goldMult;
            BOOL shouldAddItem = YES;
            
            for (int i = 0; i < array.count; i++)
            {
                if (((Item*)[array objectAtIndex:i]).itemCode == tempItem2.itemCode)
                {
                    ((Item*)[array objectAtIndex:i]).itemCount++;
                    shouldAddItem = NO;
                    break;
                }
            }
            if (shouldAddItem)
            {
                [array addObject:tempItem2];
            }
        }
        hero.equipPos5 = tempItem;
        hero.itemInPos5 = YES;
        hero.aglBonus += hero.equipPos5.aglBonus;
        hero.strBonus += hero.equipPos5.strBonus;
        hero.defBonus += hero.equipPos5.defBonus;
        hero.aglMult *= hero.equipPos5.aglMult;
        hero.strMult *= hero.equipPos5.strMult;
        hero.defMult *= hero.equipPos5.defMult;
        hero.itemExpMult *= hero.equipPos5.expMult;
        hero.itemGoldMult *= hero.equipPos5.goldMult;
    }
    if (tempItem.equipCode == 6)
    {
        if (hero.itemInPos6)
        {
            tempItem2 = hero.equipPos6;
            hero.aglBonus -= tempItem2.aglBonus;
            hero.strBonus -= tempItem2.strBonus;
            hero.defBonus -= tempItem2.defBonus;
            hero.aglMult /= tempItem2.aglMult;
            hero.strMult /= tempItem2.strMult;
            hero.defMult /= tempItem2.defMult;
            hero.itemExpMult /= tempItem2.expMult;
            hero.itemGoldMult /= tempItem2.goldMult;
            BOOL shouldAddItem = YES;
            
            for (int i = 0; i < array.count; i++)
            {
                if (((Item*)[array objectAtIndex:i]).itemCode == tempItem2.itemCode)
                {
                    ((Item*)[array objectAtIndex:i]).itemCount++;
                    shouldAddItem = NO;
                    break;
                }
            }
            if (shouldAddItem)
            {
                [array addObject:tempItem2];
            }
        }
        hero.equipPos6 = tempItem;
        hero.itemInPos6 = YES;
        hero.aglBonus += hero.equipPos6.aglBonus;
        hero.strBonus += hero.equipPos6.strBonus;
        hero.defBonus += hero.equipPos6.defBonus;
        hero.aglMult *= hero.equipPos6.aglMult;
        hero.strMult *= hero.equipPos6.strMult;
        hero.defMult *= hero.equipPos6.defMult;
        hero.itemExpMult *= hero.equipPos6.expMult;
        hero.itemGoldMult *= hero.equipPos6.goldMult;
    }
    
    
    
    
    
    [MusicHandler playButtonClick];
    
    
    hero.heroInventory = array;
    [GameSceneManager sharedGameSceneManager].hero = hero;
    
    [self update];
    [self touchedBack];
}

-(void) discard
{
    NSMutableArray *array = [hero.heroInventory mutableCopy];
    int tempIndex;
    BOOL shouldDeleteItem = NO;
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
    
    [self update];
    [MusicHandler playButtonClick];
    [self touchedBack];
}

-(void)use
{
    Item *temp = [[Item alloc] initWithItemCode:currentItemIndex];
    
    if (currentItemIndex == 1)
    {
        [MusicHandler playButtonClick];
        hero.heroCurrentHP += 10;
        if (hero.heroCurrentHP > hero.heroHP)
        {
            hero.heroCurrentHP = hero.heroHP;
        }
    }
    else if (currentItemIndex == 2)
    {
        [MusicHandler playButtonClick];
        hero.heroCurrentHP += 30;
        if (hero.heroCurrentHP > hero.heroHP)
        {
            hero.heroCurrentHP = hero.heroHP;
        }
    }
    else if (currentItemIndex == 3)
    {
        [MusicHandler playButtonClick];
        hero.heroCurrentHP += 100;
        if (hero.heroCurrentHP > hero.heroHP)
        {
            hero.heroCurrentHP = hero.heroHP;
        }
    }
    else if (currentItemIndex == 4)
    {
        [MusicHandler playButtonClick];
        hero.heroCurrentHP += 500;
        if (hero.heroCurrentHP > hero.heroHP)
        {
            hero.heroCurrentHP = hero.heroHP;
        }
    }
    else if (currentItemIndex == 19)
    {
        if (hero.freeSteps >= 30)
        {
            [MusicHandler playButtonClick];
            return;
        }
        hero.freeSteps = 30;
        [MusicHandler playButtonClick];
        
    }
    else if (currentItemIndex == 20)
    {
        if (hero.freeSteps >= 150)
        {
            [MusicHandler playButtonClick];
            return;
        }
        hero.freeSteps = 150;
        [MusicHandler playButtonClick];
        
    }
    else if (currentItemIndex == 28)
    {
        hero.attributePoints += 3;
        [MusicHandler playButtonClick];
    }
    else if (currentItemIndex == 31)
    {
        if (![GameSceneManager sharedGameSceneManager].hero.beatBoss1)
        {
            [MusicHandler playButtonClick];
            return;
        }
        [MusicHandler playButtonClick];
        [(RealInGameMenu*)self.parent goTele:1];
    }
    else if (currentItemIndex == 32)
    {
        if (![GameSceneManager sharedGameSceneManager].hero.deliveredLetterToKingK)
        {
            [MusicHandler playButtonClick];
            return;
        }
        [MusicHandler playButtonClick];
        [(RealInGameMenu*)self.parent goTele:2];
    }
    else if (currentItemIndex == 33)
    {
        [MusicHandler playButtonClick];
        if (![GameSceneManager sharedGameSceneManager].hero.talkedToWatchmen)
        {
            [MusicHandler playButtonClick];
            return;
        }
        [MusicHandler playButtonClick];
        [(RealInGameMenu*)self.parent goTele:3];
        
    }
    else if (currentItemIndex == 34)
    {
        [MusicHandler playButtonClick];
        if (![GameSceneManager sharedGameSceneManager].hero.acceptedFindEilifKingV)
        {
            [MusicHandler playButtonClick];
            return;
        }
        [MusicHandler playButtonClick];
        [(RealInGameMenu*)self.parent goTele:4];
    }
    else if (currentItemIndex == 39)
    {
        [MusicHandler playButtonClick];
        if (![GameSceneManager sharedGameSceneManager].hero.talkedToArnuk)
        {
            [MusicHandler playButtonClick];
            return;
        }
        [MusicHandler playButtonClick];
        [(RealInGameMenu*)self.parent goTele:6];
    }
    else if (currentItemIndex == 39)
    {
        [MusicHandler playButtonClick];
        if (![GameSceneManager sharedGameSceneManager].hero.beatIonak)
        {
            [MusicHandler playButtonClick];
            return;
        }
        [MusicHandler playButtonClick];
        [(RealInGameMenu*)self.parent goTele:8];
    }
    
    else if (currentItemIndex == 35)
    {
        hero.heroStr += 15;
        [MusicHandler playButtonClick];
    }
    else if (currentItemIndex == 36)
    {
        hero.heroStrDef += 15;
        [MusicHandler playButtonClick];
    }
    else if (currentItemIndex == 37)
    {
        hero.heroSPD += 15;
        [MusicHandler playButtonClick];
    }
    else if (currentItemIndex == 38)
    {
        hero.heroHP += 20;
        [MusicHandler playButtonClick];
    }
    else
    {
        NSLog(@"Item Use Error");
        [MusicHandler playButtonClick];
        return;
    }
    
    
    
    if (temp.canThrowAway)
    {
        [self discard];
    }
}








@end







