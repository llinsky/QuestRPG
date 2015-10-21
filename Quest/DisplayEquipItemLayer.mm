//
//  DisplayEquipItemLayer.m
//  Quest
//
//  Created by Leo Linsky on 7/28/12.
//  Copyright 2012 __MyCompanyName__. All rights reserved.
//

#import "DisplayEquipItemLayer.h"
#import "GameSceneManager.h"
#import "DisplayArmory.h"
#import "DisplayInventory.h"
#import "ItemShopMenu.h"
#import "DisplayBattleItems.h"



@implementation DisplayEquipItemLayer

@synthesize position;
@synthesize interface;

@synthesize isInShop,isInArmory,isInBattle,isInInventory,isInShopForSale;


-(void)exit
{
    if (isInArmory)
    {
        [((DisplayArmory*)self.parent) touchedBack];
    }
    else if (isInInventory)
    {
        [((DisplayInventory*)self.parent) touchedBack];
    }
    else if (isInShop)
    {
        [((DisplayInventory*)self.parent) touchedBack];
    }
    else if (isInShopForSale)
    {
        [((DisplayInventory*)self.parent) touchedBack];
    }
    else if (isInBattle)
    {
        [((DisplayInventory*)self.parent) touchedBack];
    }
}



-(id)initWithItem:(Item *)equippable source:(int)sourceLayer
{
    if (self = [super init])
    {
        equippableItem = equippable;
        hero = [GameSceneManager sharedGameSceneManager].hero;
        
        self.interface = sourceLayer;
        if (sourceLayer == 1)
        {
            self.isInArmory = YES;
            self.isInShop = NO;
            self.isInBattle = NO;
            self.isInInventory = NO;
            self.isInShopForSale = NO;
        }
        else if (sourceLayer == 2)
        {
            self.isInArmory = NO;
            self.isInShop = NO;
            self.isInBattle = NO;
            self.isInInventory = YES;
            self.isInShopForSale = NO;
        }
        else if (sourceLayer == 3)
        {
            self.isInArmory = NO;
            self.isInShop = NO;
            self.isInBattle = YES;
            self.isInInventory = NO;
            self.isInShopForSale = NO;
        }
        else if (sourceLayer == 4)
        {
            self.isInArmory = NO;
            self.isInShop = YES;
            self.isInBattle = NO;
            self.isInInventory = NO;
            self.isInShopForSale = NO;
        }
        else if (sourceLayer == 5)
        {
            self.isInArmory = NO;
            self.isInShop = NO;
            self.isInBattle = NO;
            self.isInInventory = NO;
            self.isInShopForSale = YES;
        }
        
        
        CCSprite *background = [CCSprite spriteWithFile: @"itemmodal3.png"];
		background.position = ccp(240, 160);
		[self addChild:background z:34000];
        
        
        CCSprite *itemBackground = [CCSprite spriteWithFile:@"armorybackplain1.png"];
        itemBackground.position = ccp(225, 151);
        [self addChild:itemBackground z:34002 tag:1];
        
        
        CCSprite *itemImage = [CCSprite spriteWithFile:equippableItem.bigImage];
        itemImage.position = ccp(225, 151);
        [self addChild:itemImage z:34002 tag:2];
        
        
        
        CCLabelTTF *title = [CCLabelTTF labelWithString:equippableItem.name dimensions:CGSizeMake(240, 80) alignment:UITextAlignmentCenter fontName:@"Optima-Bold" fontSize:23.0];
        title.position = ccp(328,32);
        if (equippableItem.itemTextColor == 0)
        {
            title.color = ccc3(0,0,0);
        }
        else if (equippableItem.itemTextColor == 1)
        {
            title.color = ccc3(255, 0, 0);
        }
        else if (equippableItem.itemTextColor == 2)
        {
            title.color = ccc3(0,205,0);
        }
        else if (equippableItem.itemTextColor == 3)
        {
            title.color = ccc3(0,0,255);
        }
        [self addChild: title z:34002];
        
        
        
        CGSize size;
        size.width = 190;
        size.height = 120;
        CCLabelTTF* description = [CCLabelTTF labelWithString:equippableItem.description dimensions:size alignment:UITextAlignmentLeft lineBreakMode:UILineBreakModeWordWrap fontName:@"Optima" fontSize:18.0];
        description.position = ccp(370, 130);
        description.color = ccc3(0, 0, 0);
        [self addChild:description z:34002 tag:3];
        
        
        if (equippableItem.canEquip)
        {
        
        CCLabelTTF *label1 = [CCLabelTTF labelWithString:[NSString stringWithFormat:@"STR: + %d", equippableItem.strBonus] dimensions: CGSizeMake(90, 40) alignment:UITextAlignmentLeft fontName:@"Optima-Bold" fontSize:18.0];
            label1.position = ccp(235, 231);
            label1.color = title.color;
            [self addChild: label1 z:34002];
        
        CCLabelTTF *label2 = [CCLabelTTF labelWithString:[NSString stringWithFormat:@"STR: x %.1f", equippableItem.strMult] dimensions: CGSizeMake(90, 40) alignment:UITextAlignmentLeft fontName:@"Optima-Bold" fontSize:18.0];
            label2.position = ccp(235, 207);
            label2.color = title.color;
        [self addChild: label2 z:34002];
        
        CCLabelTTF *label3 = [CCLabelTTF labelWithString:[NSString stringWithFormat:@"DEF: + %d", equippableItem.defBonus] dimensions: CGSizeMake(90, 40) alignment:UITextAlignmentLeft fontName:@"Optima-Bold" fontSize:18.0];
        label3.position = ccp(330, 231);
            label3.color = title.color;
        [self addChild: label3 z:34002];
        
        CCLabelTTF *label4 = [CCLabelTTF labelWithString:[NSString stringWithFormat:@"DEF: x %.1f", equippableItem.defMult] dimensions: CGSizeMake(90, 40) alignment:UITextAlignmentLeft fontName:@"Optima-Bold" fontSize:18.0];
        label4.position = ccp(330, 207);
            label4.color = title.color;
        [self addChild: label4 z:34002];
        
        CCLabelTTF *label5 = [CCLabelTTF labelWithString:[NSString stringWithFormat:@"AGI: + %d", equippableItem.aglBonus] dimensions: CGSizeMake(90, 40) alignment:UITextAlignmentLeft fontName:@"Optima-Bold" fontSize:18.0];
        label5.position = ccp(425, 231);
            label5.color = title.color;
        [self addChild: label5 z:34002];
        
        CCLabelTTF *label6 = [CCLabelTTF labelWithString:[NSString stringWithFormat:@"AGI: x %.1f", equippableItem.aglMult] dimensions: CGSizeMake(90, 40) alignment:UITextAlignmentLeft fontName:@"Optima-Bold" fontSize:18.0];
        label6.position = ccp(425, 207);
            label6.color = title.color;
        [self addChild: label6 z:34002];
        }
        
        
        if (isInArmory)
        {
            
            CCMenuItemImage *unequip = [CCMenuItemImage itemFromNormalImage:@"modalunequip2.png" selectedImage:@"modalunequip2_pressed.png" target:self selector:@selector(unequip)];
            CCMenu *menu = [CCMenu menuWithItems:unequip, nil];
            menu.position = ccp(236, 282);
            [self addChild:menu z:34003];
        }
        else if (isInInventory)
        {
            if (equippableItem.canEquip)
            {
                CCMenuItemImage *equip = [CCMenuItemImage itemFromNormalImage:@"modalequip2.png" selectedImage:@"modalequip2_pressed.png" target:self selector:@selector(equip)];
                CCMenu *menu = [CCMenu menuWithItems:equip, nil];
                menu.position = ccp(236, 282);
                [self addChild:menu z:34003];
            }
            else if (equippableItem.canUse)
            {
                CCMenuItemImage *use = [CCMenuItemImage itemFromNormalImage:@"modaluse1.png" selectedImage:@"modaluse1_pressed.png" target:self selector:@selector(use)];
                CCMenu *menu = [CCMenu menuWithItems:use, nil];
                menu.position = ccp(222, 287);
                [self addChild:menu z:34003];
            }
            /*
            if (equippableItem.canThrowAway)
            {
                CCMenuItemImage *discard = [CCMenuItemImage itemFromNormalImage:@"modaltossbutton1.png" selectedImage:@"modaltossbutton1_pressed.png" target:self selector:@selector(discard)];
                CCMenu *menu = [CCMenu menuWithItems:discard, nil];
                menu.position = ccp(390, 90);
                [self addChild:menu z:34003];
            }
             */
            
        }
        else if (isInBattle)
        {
            CCMenuItemImage *use = [CCMenuItemImage itemFromNormalImage:@"modaluse1.png" selectedImage:@"modaluse1.png" target:self selector:@selector(useBattle)];
            CCMenu *menu = [CCMenu menuWithItems:use, nil];
            menu.position = ccp(222, 287);
            [self addChild:menu z:34003];
            
        }
        else if (isInShop)
        {
            CCMenuItemImage *buy = [CCMenuItemImage itemFromNormalImage:@"modalbuy1.png" selectedImage:@"modalbuy1.png" target:self selector:@selector(buy)];
            CCMenu *menu = [CCMenu menuWithItems:buy, nil];
            menu.position = ccp(225, 285);
            [self addChild:menu z:34003];
            
            
            CCLabelTTF *label01 = [CCLabelTTF labelWithString:[NSString stringWithFormat:@"Cost: %d G", equippableItem.goldValue] dimensions: CGSizeMake(120, 30) alignment:UITextAlignmentLeft fontName:@"Optima-Bold" fontSize:20.0];
            label01.position = ccp(320, 20);
            [self addChild: label01 z:34002];
            
        }
        else if (isInShopForSale)
        {
            
            if (equippableItem.canThrowAway)
            {
            CCMenuItemImage *sell = [CCMenuItemImage itemFromNormalImage:@"modalsell1.png" selectedImage:@"modalsell1.png" target:self selector:@selector(sell)];
            CCMenu *menu = [CCMenu menuWithItems:sell, nil];
            menu.position = ccp(225, 285);
            [self addChild:menu z:34003];
            
            
            CCLabelTTF *label01 = [CCLabelTTF labelWithString:[NSString stringWithFormat:@"Sell: %d G", equippableItem.sellGoldValue] dimensions: CGSizeMake(120, 30) alignment:UITextAlignmentLeft fontName:@"Optima-Bold" fontSize:20.0];
            label01.position = ccp(320, 20);
            [self addChild: label01 z:34002];
            }
            else
            {
                CCLabelTTF *label01 = [CCLabelTTF labelWithString:[NSString stringWithFormat:@"Cannot Sell."] dimensions: CGSizeMake(120, 30) alignment:UITextAlignmentLeft fontName:@"Optima-Bold" fontSize:20.0];
                label01.position = ccp(320, 20);
                [self addChild: label01 z:34002];
            }
        }
        
        CCMenuItemImage *goback = [CCMenuItemImage itemFromNormalImage:@"modalexitbutton2.png" selectedImage:@"modalexitbutton2_pressed.png" target:self selector:@selector(exit)];
        CCMenu *menu12 = [CCMenu menuWithItems:goback, nil];
        menu12.position = ccp(197, 54);
        [self addChild:menu12 z:34003];
        
        
    }
    return self;
}


-(void) unequip
{
    [(DisplayArmory*)self.parent unequip];
}

-(void)equip
{
    [(DisplayInventory*)self.parent equip];
}
-(void)discard
{
    [MusicHandler playButtonClick];
    [(DisplayInventory*)self.parent discard];
}
-(void)use
{
    [(DisplayInventory*)self.parent use];
}
-(void)useBattle
{
    [(DisplayBattleItems*)self.parent useItem];
}

-(void)buy
{
    [(ItemShopMenu*)self.parent buy];
}

-(void)sell
{
    [(ItemShopMenu*)self.parent sell];
}


@end
