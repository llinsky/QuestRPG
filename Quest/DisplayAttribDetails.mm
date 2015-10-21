//
//  DisplayAttribDetails.m
//  Quest
//
//  Created by Leo Linsky on 8/11/12.
//  Copyright 2012 __MyCompanyName__. All rights reserved.
//

#import "DisplayAttribDetails.h"
#import "RealInGameMenu.h"


@implementation DisplayAttribDetails

@synthesize attribCode;

-(void)exit
{
    [((DisplayAttributes*)self.parent) exitModal];
}

-(id)initWithAttributeCode:(int)attributeCode
{
    if (self = [super init])
    {
        attribCode = attributeCode;
        CGSize winSize = [[CCDirector sharedDirector] winSize];
        CCSprite *background = [CCSprite spriteWithFile: @"modalback8.png"];
        
        background.position = ccp(145, 180);
        [self addChild:background z:34000];
        
        CCSprite *back1 = [CCSprite spriteWithFile:@"attrib_background.png"];
        back1.position = ccp(42, winSize.height - 40);
        [self addChild:back1 z:34002 tag:2];
        
        hero = [GameSceneManager sharedGameSceneManager].hero;
        
        CCMenuItemImage *goback = [CCMenuItemImage itemFromNormalImage:@"modalexitbutton3.png" selectedImage:@"modalexitbutton3_pressed.png" target:self selector:@selector(exit)];
        CCMenu *menu12 = [CCMenu menuWithItems:goback, nil];
        menu12.position = ccp(262, 296);
        [self addChild:menu12 z:34003];
        
        //CCSprite *itemBackground = [CCSprite spriteWithFile:@"pinktemp4big.png"];
        //itemBackground.position = ccp(winSize.width/4 - 85, winSize.height/4 - 15);
        //[self addChild:itemBackground z:34002 tag:1];
        
        if (attribCode == 1)
        {
            CCSprite *itemImage = [CCSprite spriteWithFile:@"attrib1tile.png"];
            itemImage.position = ccp(42, winSize.height - 40);
            [self addChild:itemImage z:34002 tag:2];
            
            CCLabelTTF *title = [CCLabelTTF labelWithString:@"Hercules' Gift" dimensions:CGSizeMake(160, 90) alignment:UITextAlignmentLeft fontName:@"Optima-Bold" fontSize:21.0];
            title.position = ccp(162, winSize.height - 58);
            title.color = ccc3(0, 0, 0);
            [self addChild: title z:34002];
            
            CGSize size;
            size.width = 180;
            size.height = 200;
            CCLabelTTF* description = [CCLabelTTF labelWithString:@"Improves your physical strength in battle."  dimensions:size alignment:UITextAlignmentLeft lineBreakMode:UILineBreakModeWordWrap fontName:@"Optima" fontSize:19.0];
            description.color = ccc3(0, 0, 0);
            description.position = ccp(120, 140);
            [self addChild:description z:34002 tag:3];
            
            if (!hero.attrib1)
            {
                CCMenuItemImage *use = [CCMenuItemImage itemFromNormalImage:@"modalunlock4.png" selectedImage:@"modalunlock4_pressed.png" target:self selector:@selector(use)];
            description.color = ccc3(0, 0, 0);
            description.color = ccc3(0, 0, 0);
                CCMenu *menu = [CCMenu menuWithItems:use, nil];
                menu.position = ccp(224, 82);
                [self addChild:menu z:34003];
                
                CCLabelTTF *label1 = [CCLabelTTF labelWithString:@"Cost: 1" dimensions:CGSizeMake(115, 45) alignment:UITextAlignmentLeft fontName:@"Optima-Bold" fontSize:21.0];
                label1.position = ccp(84,70);
                label1.color = ccc3(255,0,0);
                [self addChild: label1 z:34002];
            }
            else
            {
                CCLabelTTF *label2 = [CCLabelTTF labelWithString:@"UNLOCKED" dimensions:CGSizeMake(195, 38) alignment:UITextAlignmentLeft fontName:@"Optima-Bold" fontSize:21.0];
                label2.position = ccp(120,70);
                label2.color = ccc3(0, 55, 255);
                [self addChild: label2 z:34002];
            }
            
            
        }
        if (attribCode == 2)
        {
            CCSprite *itemImage = [CCSprite spriteWithFile:@"attrib2tile.png"];
            itemImage.position = ccp(42, winSize.height - 40);
            [self addChild:itemImage z:34002 tag:2];
            
            CCLabelTTF *title = [CCLabelTTF labelWithString:@"Hero's Might" dimensions:CGSizeMake(160, 90) alignment:UITextAlignmentLeft fontName:@"Optima-Bold" fontSize:21.0];
            title.position = ccp(162, winSize.height - 58);
            title.color = ccc3(0, 0, 0);
            [self addChild: title z:34002];
            
            CGSize size;
            size.width = 180;
            size.height = 200;
            CCLabelTTF* description = [CCLabelTTF labelWithString:@"Significantly enhances your physical ability in combat."  dimensions:size alignment:UITextAlignmentLeft lineBreakMode:UILineBreakModeWordWrap fontName:@"Optima" fontSize:19.0];
            description.color = ccc3(0, 0, 0);
            description.position = ccp(120, 140);
            [self addChild:description z:34002 tag:3];
            
            if (!hero.attrib2)
            {
                CCMenuItemImage *use = [CCMenuItemImage itemFromNormalImage:@"modalunlock4.png" selectedImage:@"modalunlock4_pressed.png" target:self selector:@selector(use)];
            description.color = ccc3(0, 0, 0);
            description.color = ccc3(0, 0, 0);
                CCMenu *menu = [CCMenu menuWithItems:use, nil];
                menu.position = ccp(224, 82);
                [self addChild:menu z:34003];
            description.color = ccc3(0, 0, 0);
            description.position = ccp(120, 140);
                CCLabelTTF *label1 = [CCLabelTTF labelWithString:@"Cost: 3" dimensions:CGSizeMake(115, 45) alignment:UITextAlignmentLeft fontName:@"Optima-Bold" fontSize:21.0];
                label1.position = ccp(84,70);
                label1.color = ccc3(255,0,0);
                [self addChild: label1 z:34002];
            }
            else
            {
                CCLabelTTF *label2 = [CCLabelTTF labelWithString:@"UNLOCKED" dimensions:CGSizeMake(195, 38) alignment:UITextAlignmentLeft fontName:@"Optima-Bold" fontSize:21.0];
                label2.position = ccp(120,70);
                label2.color = ccc3(0, 55, 255);
                [self addChild: label2 z:34002];
            }
        }
        if (attribCode == 3)
        {
            CCSprite *itemImage = [CCSprite spriteWithFile:@"attrib3tile.png"];
            itemImage.position = ccp(42, winSize.height - 40);
            [self addChild:itemImage z:34002 tag:2];
            
            CCLabelTTF *title = [CCLabelTTF labelWithString:@"Immortal Blade" dimensions:CGSizeMake(160, 90) alignment:UITextAlignmentLeft fontName:@"Optima-Bold" fontSize:21.0];
            title.position = ccp(162, winSize.height - 58);
            title.color = ccc3(0, 0, 0);
            [self addChild: title z:34002];
            
            CGSize size;
            size.width = 180;
            size.height = 200;
            CCLabelTTF* description = [CCLabelTTF labelWithString:@"Your power will become legendary."  dimensions:size alignment:UITextAlignmentLeft lineBreakMode:UILineBreakModeWordWrap fontName:@"Optima" fontSize:19.0];
            description.color = ccc3(0, 0, 0);
            description.position = ccp(120, 140);
            [self addChild:description z:34002 tag:3];
            
            if (!hero.attrib3)
            {
                CCMenuItemImage *use = [CCMenuItemImage itemFromNormalImage:@"modalunlock4.png" selectedImage:@"modalunlock4_pressed.png" target:self selector:@selector(use)];
            description.color = ccc3(0, 0, 0);
            description.color = ccc3(0, 0, 0);
                CCMenu *menu = [CCMenu menuWithItems:use, nil];
                menu.position = ccp(224, 82);
                [self addChild:menu z:34003];
            description.color = ccc3(0, 0, 0);
            description.position = ccp(120, 140);
                CCLabelTTF *label1 = [CCLabelTTF labelWithString:@"Cost: 6" dimensions:CGSizeMake(115, 45) alignment:UITextAlignmentLeft fontName:@"Optima-Bold" fontSize:21.0];
                label1.position = ccp(84,70);
                label1.color = ccc3(255,0,0);
                [self addChild: label1 z:34002];
            }
            else
            {
                CCLabelTTF *label2 = [CCLabelTTF labelWithString:@"UNLOCKED" dimensions:CGSizeMake(195, 38) alignment:UITextAlignmentLeft fontName:@"Optima-Bold" fontSize:21.0];
                label2.position = ccp(120,70);
                label2.color = ccc3(0, 55, 255);
                [self addChild: label2 z:34002];
            }
        }
        if (attribCode == 4)
        {
            CCSprite *itemImage = [CCSprite spriteWithFile:@"attrib4tile.png"];
            itemImage.position = ccp(42, winSize.height - 40);
            [self addChild:itemImage z:34002 tag:2];
            
            CCLabelTTF *title = [CCLabelTTF labelWithString:@"Ungar's Rage" dimensions:CGSizeMake(160, 90) alignment:UITextAlignmentLeft fontName:@"Optima-Bold" fontSize:21.0];
            title.position = ccp(162, winSize.height - 58);
            title.color = ccc3(0, 0, 0);
            [self addChild: title z:34002];
            
            CGSize size;
            size.width = 180;
            size.height = 200;
            CCLabelTTF* description = [CCLabelTTF labelWithString:@"Devastate opponents with a chance of dealing a critical blow."  dimensions:size alignment:UITextAlignmentLeft lineBreakMode:UILineBreakModeWordWrap fontName:@"Optima" fontSize:19.0];
            description.color = ccc3(0, 0, 0);
            description.position = ccp(120, 140);
            [self addChild:description z:34002 tag:3];
            
            if (!hero.attrib4)
            {
                CCMenuItemImage *use = [CCMenuItemImage itemFromNormalImage:@"modalunlock4.png" selectedImage:@"modalunlock4_pressed.png" target:self selector:@selector(use)];
            description.color = ccc3(0, 0, 0);
            description.color = ccc3(0, 0, 0);
                CCMenu *menu = [CCMenu menuWithItems:use, nil];
                menu.position = ccp(224, 82);
                [self addChild:menu z:34003];
            description.color = ccc3(0, 0, 0);
            description.position = ccp(120, 140);
                CCLabelTTF *label1 = [CCLabelTTF labelWithString:@"Cost: 12" dimensions:CGSizeMake(115, 45) alignment:UITextAlignmentLeft fontName:@"Optima-Bold" fontSize:21.0];
                label1.position = ccp(84,70);
                label1.color = ccc3(255,0,0);
                [self addChild: label1 z:34002];
            }
            else
            {
                CCLabelTTF *label2 = [CCLabelTTF labelWithString:@"UNLOCKED" dimensions:CGSizeMake(195, 38) alignment:UITextAlignmentLeft fontName:@"Optima-Bold" fontSize:21.0];
                label2.position = ccp(120,70);
                label2.color = ccc3(0, 55, 255);
                [self addChild: label2 z:34002];
            }
        }
        
        
        
        //#####################
        
        
        
        if (attribCode == 5)
        {
            CCSprite *itemImage = [CCSprite spriteWithFile:@"attrib5tile.png"];
            itemImage.position = ccp(42, winSize.height - 40);
            [self addChild:itemImage z:34002 tag:2];
            
            CCLabelTTF *title = [CCLabelTTF labelWithString:@"Fortitude" dimensions:CGSizeMake(160, 90) alignment:UITextAlignmentLeft fontName:@"Optima-Bold" fontSize:21.0];
            title.position = ccp(162, winSize.height - 58);
            title.color = ccc3(0, 0, 0);
            [self addChild: title z:34002];
            
            CGSize size;
            size.width = 180;
            size.height = 200;
            CCLabelTTF* description = [CCLabelTTF labelWithString:@"Be resilient in the wake of your enemy's attacks."  dimensions:size alignment:UITextAlignmentLeft lineBreakMode:UILineBreakModeWordWrap fontName:@"Optima" fontSize:19.0];
            description.color = ccc3(0, 0, 0);
            description.position = ccp(120, 140);
            [self addChild:description z:34002 tag:3];
            
            if (!hero.attrib5)
            {
                CCMenuItemImage *use = [CCMenuItemImage itemFromNormalImage:@"modalunlock4.png" selectedImage:@"modalunlock4_pressed.png" target:self selector:@selector(use)];
            description.color = ccc3(0, 0, 0);
            description.color = ccc3(0, 0, 0);
                CCMenu *menu = [CCMenu menuWithItems:use, nil];
                menu.position = ccp(224, 82);
                [self addChild:menu z:34003];
            description.color = ccc3(0, 0, 0);
            description.position = ccp(120, 140);
                CCLabelTTF *label1 = [CCLabelTTF labelWithString:@"Cost: 1" dimensions:CGSizeMake(115, 45) alignment:UITextAlignmentLeft fontName:@"Optima-Bold" fontSize:21.0];
                label1.position = ccp(84,70);
                label1.color = ccc3(255,0,0);
                [self addChild: label1 z:34002];
            }
            else
            {
                CCLabelTTF *label2 = [CCLabelTTF labelWithString:@"UNLOCKED" dimensions:CGSizeMake(195, 38) alignment:UITextAlignmentLeft fontName:@"Optima-Bold" fontSize:21.0];
                label2.position = ccp(120,70);
                label2.color = ccc3(0, 55, 255);
                [self addChild: label2 z:34002];
            }
        }
        if (attribCode == 6)
        {
            CCSprite *itemImage = [CCSprite spriteWithFile:@"attrib6tile.png"];
            itemImage.position = ccp(42, winSize.height - 40);
            [self addChild:itemImage z:34002 tag:2];
            
            CCLabelTTF *title = [CCLabelTTF labelWithString:@"Thick Skin" dimensions:CGSizeMake(160, 90) alignment:UITextAlignmentLeft fontName:@"Optima-Bold" fontSize:21.0];
            title.position = ccp(162, winSize.height - 58);
            title.color = ccc3(0, 0, 0);
            [self addChild: title z:34002];
            
            CGSize size;
            size.width = 180;
            size.height = 200;
            CCLabelTTF* description = [CCLabelTTF labelWithString:@"Easily fend off powerful assaults."  dimensions:size alignment:UITextAlignmentLeft lineBreakMode:UILineBreakModeWordWrap fontName:@"Optima" fontSize:19.0];
            description.color = ccc3(0, 0, 0);
            description.position = ccp(120, 140);
            [self addChild:description z:34002 tag:3];
            
            if (!hero.attrib6)
            {
                CCMenuItemImage *use = [CCMenuItemImage itemFromNormalImage:@"modalunlock4.png" selectedImage:@"modalunlock4_pressed.png" target:self selector:@selector(use)];
            description.color = ccc3(0, 0, 0);
            description.color = ccc3(0, 0, 0);
                CCMenu *menu = [CCMenu menuWithItems:use, nil];
                menu.position = ccp(224, 82);
                [self addChild:menu z:34003];
            description.color = ccc3(0, 0, 0);
            description.position = ccp(120, 140);
                CCLabelTTF *label1 = [CCLabelTTF labelWithString:@"Cost: 3" dimensions:CGSizeMake(115, 45) alignment:UITextAlignmentLeft fontName:@"Optima-Bold" fontSize:21.0];
                label1.position = ccp(84,70);
                label1.color = ccc3(255,0,0);
                [self addChild: label1 z:34002];
            }
            else
            {
                CCLabelTTF *label2 = [CCLabelTTF labelWithString:@"UNLOCKED" dimensions:CGSizeMake(195, 38) alignment:UITextAlignmentLeft fontName:@"Optima-Bold" fontSize:21.0];
                label2.position = ccp(120,70);
                label2.color = ccc3(0, 55, 255);
                [self addChild: label2 z:34002];
            }
        }
        if (attribCode == 7)
        {
            CCSprite *itemImage = [CCSprite spriteWithFile:@"attrib7tile.png"];
            itemImage.position = ccp(42, winSize.height - 40);
            [self addChild:itemImage z:34002 tag:2];
            
            CCLabelTTF *title = [CCLabelTTF labelWithString:@"Enchantment" dimensions:CGSizeMake(160, 90) alignment:UITextAlignmentLeft fontName:@"Optima-Bold" fontSize:21.0];
            title.position = ccp(162, winSize.height - 58);
            title.color = ccc3(0, 0, 0);
            [self addChild: title z:34002];
            
            CGSize size;
            size.width = 180;
            size.height = 200;
            CCLabelTTF* description = [CCLabelTTF labelWithString:@"Increases your resistance to magic."  dimensions:size alignment:UITextAlignmentLeft lineBreakMode:UILineBreakModeWordWrap fontName:@"Optima" fontSize:19.0];
            description.color = ccc3(0, 0, 0);
            description.position = ccp(120, 140);
            [self addChild:description z:34002 tag:3];
            
            if (!hero.attrib7)
            {
                CCMenuItemImage *use = [CCMenuItemImage itemFromNormalImage:@"modalunlock4.png" selectedImage:@"modalunlock4_pressed.png" target:self selector:@selector(use)];
            description.color = ccc3(0, 0, 0);
            description.color = ccc3(0, 0, 0);
                CCMenu *menu = [CCMenu menuWithItems:use, nil];
                menu.position = ccp(224, 82);
                [self addChild:menu z:34003];
            description.color = ccc3(0, 0, 0);
            description.position = ccp(120, 140);
                CCLabelTTF *label1 = [CCLabelTTF labelWithString:@"Cost: 3" dimensions:CGSizeMake(115, 45) alignment:UITextAlignmentLeft fontName:@"Optima-Bold" fontSize:21.0];
                label1.position = ccp(84,70);
                label1.color = ccc3(255,0,0);
                [self addChild: label1 z:34002];
            }
            else
            {
                CCLabelTTF *label2 = [CCLabelTTF labelWithString:@"UNLOCKED" dimensions:CGSizeMake(195, 38) alignment:UITextAlignmentLeft fontName:@"Optima-Bold" fontSize:21.0];
                label2.position = ccp(120,70);
                label2.color = ccc3(0, 55, 255);
                [self addChild: label2 z:34002];
            }
        }
        if (attribCode == 8)
        {
            CCSprite *itemImage = [CCSprite spriteWithFile:@"attrib8tile.png"];
            itemImage.position = ccp(42, winSize.height - 40);
            [self addChild:itemImage z:34002 tag:2];
            
            CCLabelTTF *title = [CCLabelTTF labelWithString:@"Ortheo's Blessing" dimensions:CGSizeMake(158, 90) alignment:UITextAlignmentLeft fontName:@"Optima-Bold" fontSize:21.0];
            title.position = ccp(162, winSize.height - 58);
            title.color = ccc3(0, 0, 0);
            [self addChild: title z:34002];
            
            CGSize size;
            size.width = 180;
            size.height = 200;
            CCLabelTTF* description = [CCLabelTTF labelWithString:@"Become nearly invulnerable against any attack."  dimensions:size alignment:UITextAlignmentLeft lineBreakMode:UILineBreakModeWordWrap fontName:@"Optima" fontSize:19.0];
            description.color = ccc3(0, 0, 0);
            description.position = ccp(120, 140);
            [self addChild:description z:34002 tag:3];
            
            if (!hero.attrib8)
            {
                CCMenuItemImage *use = [CCMenuItemImage itemFromNormalImage:@"modalunlock4.png" selectedImage:@"modalunlock4_pressed.png" target:self selector:@selector(use)];
            description.color = ccc3(0, 0, 0);
            description.color = ccc3(0, 0, 0);
                CCMenu *menu = [CCMenu menuWithItems:use, nil];
                menu.position = ccp(224, 82);
                [self addChild:menu z:34003];
            description.color = ccc3(0, 0, 0);
            description.position = ccp(120, 140);
                CCLabelTTF *label1 = [CCLabelTTF labelWithString:@"Cost: 8" dimensions:CGSizeMake(115, 45) alignment:UITextAlignmentLeft fontName:@"Optima-Bold" fontSize:21.0];
                label1.position = ccp(84,70);
                label1.color = ccc3(255,0,0);
                [self addChild: label1 z:34002];
            }
            else
            {
                CCLabelTTF *label2 = [CCLabelTTF labelWithString:@"UNLOCKED" dimensions:CGSizeMake(195, 38) alignment:UITextAlignmentLeft fontName:@"Optima-Bold" fontSize:21.0];
                label2.position = ccp(120,70);
                label2.color = ccc3(0, 55, 255);
                [self addChild: label2 z:34002];
            }
        }
        if (attribCode == 9)
        {
            CCSprite *itemImage = [CCSprite spriteWithFile:@"attrib9tile.png"];
            itemImage.position = ccp(42, winSize.height - 40);
            [self addChild:itemImage z:34002 tag:2];
            
            CCLabelTTF *title = [CCLabelTTF labelWithString:@"Fatigue" dimensions:CGSizeMake(160, 90) alignment:UITextAlignmentLeft fontName:@"Optima-Bold" fontSize:21.0];
            title.position = ccp(162, winSize.height - 58);
            title.color = ccc3(0, 0, 0);
            [self addChild: title z:34002];
            
            CGSize size;
            size.width = 180;
            size.height = 200;
            CCLabelTTF* description = [CCLabelTTF labelWithString:@"Your enemy's will tire and weaken against your defenses as the battle progresses."  dimensions:size alignment:UITextAlignmentLeft lineBreakMode:UILineBreakModeWordWrap fontName:@"Optima" fontSize:19.0];
            description.color = ccc3(0, 0, 0);
            description.position = ccp(120, 140);
            [self addChild:description z:34002 tag:3];
            
            
            if (!hero.attrib9)
            {
                CCMenuItemImage *use = [CCMenuItemImage itemFromNormalImage:@"modalunlock4.png" selectedImage:@"modalunlock4_pressed.png" target:self selector:@selector(use)];
            description.color = ccc3(0, 0, 0);
            description.color = ccc3(0, 0, 0);
                CCMenu *menu = [CCMenu menuWithItems:use, nil];
                menu.position = ccp(224, 82);
                [self addChild:menu z:34003];
            description.color = ccc3(0, 0, 0);
            description.position = ccp(120, 140);
                CCLabelTTF *label1 = [CCLabelTTF labelWithString:@"Cost: 10" dimensions:CGSizeMake(115, 45) alignment:UITextAlignmentLeft fontName:@"Optima-Bold" fontSize:21.0];
                label1.position = ccp(84,70);
                label1.color = ccc3(255,0,0);
                [self addChild: label1 z:34002];
            }
            else
            {
                CCLabelTTF *label2 = [CCLabelTTF labelWithString:@"UNLOCKED" dimensions:CGSizeMake(195, 38) alignment:UITextAlignmentLeft fontName:@"Optima-Bold" fontSize:21.0];
                label2.position = ccp(120,70);
                label2.color = ccc3(0, 55, 255);
                [self addChild: label2 z:34002];
            }
        }
        
        
        
        //########################
        
        
        
        if (attribCode == 10)
        {
            CCSprite *itemImage = [CCSprite spriteWithFile:@"attrib10tile.png"];
            itemImage.position = ccp(42, winSize.height - 40);
            [self addChild:itemImage z:34002 tag:2];
            
            CCLabelTTF *title = [CCLabelTTF labelWithString:@"Flexible Joints" dimensions:CGSizeMake(160, 90) alignment:UITextAlignmentLeft fontName:@"Optima-Bold" fontSize:21.0];
            title.position = ccp(162, winSize.height - 58);
            title.color = ccc3(0, 0, 0);
            [self addChild: title z:34002];
            
            CGSize size;
            size.width = 180;
            size.height = 200;
            CCLabelTTF* description = [CCLabelTTF labelWithString:@"Improves your agility in battle."  dimensions:size alignment:UITextAlignmentLeft lineBreakMode:UILineBreakModeWordWrap fontName:@"Optima" fontSize:19.0];
            description.color = ccc3(0, 0, 0);
            description.position = ccp(120, 140);
            [self addChild:description z:34002 tag:3];
            
            if (!hero.attrib10)
            {
                CCMenuItemImage *use = [CCMenuItemImage itemFromNormalImage:@"modalunlock4.png" selectedImage:@"modalunlock4_pressed.png" target:self selector:@selector(use)];
            description.color = ccc3(0, 0, 0);
            description.color = ccc3(0, 0, 0);
                CCMenu *menu = [CCMenu menuWithItems:use, nil];
                menu.position = ccp(224, 82);
                [self addChild:menu z:34003];
            description.color = ccc3(0, 0, 0);
            description.position = ccp(120, 140);
                CCLabelTTF *label1 = [CCLabelTTF labelWithString:@"Cost: 1" dimensions:CGSizeMake(115, 45) alignment:UITextAlignmentLeft fontName:@"Optima-Bold" fontSize:21.0];
                label1.position = ccp(84,70);
                label1.color = ccc3(255,0,0);
                [self addChild: label1 z:34002];
            }
            else
            {
                CCLabelTTF *label2 = [CCLabelTTF labelWithString:@"UNLOCKED" dimensions:CGSizeMake(195, 38) alignment:UITextAlignmentLeft fontName:@"Optima-Bold" fontSize:21.0];
                label2.position = ccp(120,70);
                label2.color = ccc3(0, 55, 255);
                [self addChild: label2 z:34002];
            }
        }
        if (attribCode == 11)
        {
            CCSprite *itemImage = [CCSprite spriteWithFile:@"attrib11tile.png"];
            itemImage.position = ccp(42, winSize.height - 40);
            [self addChild:itemImage z:34002 tag:2];
            
            CCLabelTTF *title = [CCLabelTTF labelWithString:@"Focus" dimensions:CGSizeMake(160, 90) alignment:UITextAlignmentLeft fontName:@"Optima-Bold" fontSize:21.0];
            title.position = ccp(162, winSize.height - 58);
            title.color = ccc3(0, 0, 0);
            [self addChild: title z:34002];
            
            CGSize size;
            size.width = 180;
            size.height = 200;
            CCLabelTTF* description = [CCLabelTTF labelWithString:@"Enhance your speed and skill with a blade."  dimensions:size alignment:UITextAlignmentLeft lineBreakMode:UILineBreakModeWordWrap fontName:@"Optima" fontSize:19.0];
            description.color = ccc3(0, 0, 0);
            description.position = ccp(120, 140);
            [self addChild:description z:34002 tag:3];
            
            if (!hero.attrib11)
            {
                CCMenuItemImage *use = [CCMenuItemImage itemFromNormalImage:@"modalunlock4.png" selectedImage:@"modalunlock4_pressed.png" target:self selector:@selector(use)];
            description.color = ccc3(0, 0, 0);
            description.color = ccc3(0, 0, 0);
                CCMenu *menu = [CCMenu menuWithItems:use, nil];
                menu.position = ccp(224, 82);
                [self addChild:menu z:34003];
            description.color = ccc3(0, 0, 0);
            description.position = ccp(120, 140);
                CCLabelTTF *label1 = [CCLabelTTF labelWithString:@"Cost: 3" dimensions:CGSizeMake(115, 45) alignment:UITextAlignmentLeft fontName:@"Optima-Bold" fontSize:21.0];
                label1.position = ccp(84,70);
                label1.color = ccc3(255,0,0);
                [self addChild: label1 z:34002];
            }
            else
            {
                CCLabelTTF *label2 = [CCLabelTTF labelWithString:@"UNLOCKED" dimensions:CGSizeMake(195, 38) alignment:UITextAlignmentLeft fontName:@"Optima-Bold" fontSize:21.0];
                label2.position = ccp(120,70);
                label2.color = ccc3(0, 55, 255);
                [self addChild: label2 z:34002];
            }
        }
        if (attribCode == 12)
        {
            CCSprite *itemImage = [CCSprite spriteWithFile:@"attrib12tile.png"];
            itemImage.position = ccp(42, winSize.height - 40);
            [self addChild:itemImage z:34002 tag:2];
            
            CCLabelTTF *title = [CCLabelTTF labelWithString:@"Leopard's Dexterity" dimensions:CGSizeMake(160, 90) alignment:UITextAlignmentLeft fontName:@"Optima-Bold" fontSize:21.0];
            title.position = ccp(162, winSize.height - 58);
            title.color = ccc3(0, 0, 0);
            [self addChild: title z:34002];
            
            CGSize size;
            size.width = 180;
            size.height = 200;
            CCLabelTTF* description = [CCLabelTTF labelWithString:@"Overwhelm your opponents with increased speed and accuracy."  dimensions:size alignment:UITextAlignmentLeft lineBreakMode:UILineBreakModeWordWrap fontName:@"Optima" fontSize:19.0];
            description.color = ccc3(0, 0, 0);
            description.position = ccp(120, 140);
            [self addChild:description z:34002 tag:3];
            
            if (!hero.attrib12)
            {
                CCMenuItemImage *use = [CCMenuItemImage itemFromNormalImage:@"modalunlock4.png" selectedImage:@"modalunlock4_pressed.png" target:self selector:@selector(use)];
            description.color = ccc3(0, 0, 0);
            description.color = ccc3(0, 0, 0);
                CCMenu *menu = [CCMenu menuWithItems:use, nil];
                menu.position = ccp(224, 82);
                [self addChild:menu z:34003];
            description.color = ccc3(0, 0, 0);
            description.position = ccp(120, 140);
                CCLabelTTF *label1 = [CCLabelTTF labelWithString:@"Cost: 5" dimensions:CGSizeMake(115, 45) alignment:UITextAlignmentLeft fontName:@"Optima-Bold" fontSize:21.0];
                label1.position = ccp(84,70);
                label1.color = ccc3(255,0,0);
                [self addChild: label1 z:34002];
            }
            else
            {
                CCLabelTTF *label2 = [CCLabelTTF labelWithString:@"UNLOCKED" dimensions:CGSizeMake(195, 38) alignment:UITextAlignmentLeft fontName:@"Optima-Bold" fontSize:21.0];
                label2.position = ccp(120,70);
                label2.color = ccc3(0, 55, 255);
                [self addChild: label2 z:34002];
            }
        }
        if (attribCode == 13)
        {
            CCSprite *itemImage = [CCSprite spriteWithFile:@"attrib13tile.png"];
            itemImage.position = ccp(42, winSize.height - 40);
            [self addChild:itemImage z:34002 tag:2];
            
            CCLabelTTF *title = [CCLabelTTF labelWithString:@"Master of Time" dimensions:CGSizeMake(160, 90) alignment:UITextAlignmentLeft fontName:@"Optima-Bold" fontSize:21.0];
            title.position = ccp(162, winSize.height - 58);
            title.color = ccc3(0, 0, 0);
            [self addChild: title z:34002];
            
            CGSize size;
            size.width = 180;
            size.height = 200;
            CCLabelTTF* description = [CCLabelTTF labelWithString:@"With unmatched agility, you will dominate any battle."  dimensions:size alignment:UITextAlignmentLeft lineBreakMode:UILineBreakModeWordWrap fontName:@"Optima" fontSize:19.0];
            description.color = ccc3(0, 0, 0);
            description.position = ccp(120, 140);
            [self addChild:description z:34002 tag:3];
            
            if (!hero.attrib13)
            {
                CCMenuItemImage *use = [CCMenuItemImage itemFromNormalImage:@"modalunlock4.png" selectedImage:@"modalunlock4_pressed.png" target:self selector:@selector(use)];
            description.color = ccc3(0, 0, 0);
            description.color = ccc3(0, 0, 0);
                CCMenu *menu = [CCMenu menuWithItems:use, nil];
                menu.position = ccp(224, 82);
                [self addChild:menu z:34003];
            description.color = ccc3(0, 0, 0);
            description.position = ccp(120, 140);
                CCLabelTTF *label1 = [CCLabelTTF labelWithString:@"Cost: 7" dimensions:CGSizeMake(115, 45) alignment:UITextAlignmentLeft fontName:@"Optima-Bold" fontSize:21.0];
                label1.position = ccp(84,70);
                label1.color = ccc3(255,0,0);
                [self addChild: label1 z:34002];
            }
            else
            {
                CCLabelTTF *label2 = [CCLabelTTF labelWithString:@"UNLOCKED" dimensions:CGSizeMake(195, 38) alignment:UITextAlignmentLeft fontName:@"Optima-Bold" fontSize:21.0];
                label2.position = ccp(120,70);
                label2.color = ccc3(0, 55, 255);
                [self addChild: label2 z:34002];
            }
        }
        if (attribCode == 14)
        {
            CCSprite *itemImage = [CCSprite spriteWithFile:@"attrib14tile.png"];
            itemImage.position = ccp(42, winSize.height - 40);
            [self addChild:itemImage z:34002 tag:2];
            
            CCLabelTTF *title = [CCLabelTTF labelWithString:@"Opportunistic Warrior" dimensions:CGSizeMake(160, 90) alignment:UITextAlignmentLeft fontName:@"Optima-Bold" fontSize:21.0];
            title.position = ccp(162, winSize.height - 58);
            title.color = ccc3(0, 0, 0);
            [self addChild: title z:34002];
            
            CGSize size;
            size.width = 180;
            size.height = 200;
            CCLabelTTF* description = [CCLabelTTF labelWithString:@"You will have a chance to deal a second deadly strike every time you attack."  dimensions:size alignment:UITextAlignmentLeft lineBreakMode:UILineBreakModeWordWrap fontName:@"Optima" fontSize:19.0];
            description.color = ccc3(0, 0, 0);
            description.position = ccp(120, 140);
            [self addChild:description z:34002 tag:3];
            
            if (!hero.attrib14)
            {
                CCMenuItemImage *use = [CCMenuItemImage itemFromNormalImage:@"modalunlock4.png" selectedImage:@"modalunlock4_pressed.png" target:self selector:@selector(use)];
            description.color = ccc3(0, 0, 0);
            description.color = ccc3(0, 0, 0);
                CCMenu *menu = [CCMenu menuWithItems:use, nil];
                menu.position = ccp(224, 82);
                [self addChild:menu z:34003];
            description.color = ccc3(0, 0, 0);
            description.position = ccp(120, 140);
                CCLabelTTF *label1 = [CCLabelTTF labelWithString:@"Cost: 14" dimensions:CGSizeMake(115, 45) alignment:UITextAlignmentLeft fontName:@"Optima-Bold" fontSize:21.0];
                label1.position = ccp(84,70);
                label1.color = ccc3(255,0,0);
                [self addChild: label1 z:34002];
            }
            else
            {
                CCLabelTTF *label2 = [CCLabelTTF labelWithString:@"UNLOCKED" dimensions:CGSizeMake(195, 38) alignment:UITextAlignmentLeft fontName:@"Optima-Bold" fontSize:21.0];
                label2.position = ccp(120,70);
                label2.color = ccc3(0, 55, 255);
                [self addChild: label2 z:34002];
            }
        }
        
        
        
        
        
        if (attribCode == 15)
        {
            CCSprite *itemImage = [CCSprite spriteWithFile:@"attrib15tile.png"];
            itemImage.position = ccp(42, winSize.height - 40);
            [self addChild:itemImage z:34002 tag:2];
            
            CCLabelTTF *title = [CCLabelTTF labelWithString:@"Quick Learner" dimensions:CGSizeMake(160, 90) alignment:UITextAlignmentLeft fontName:@"Optima-Bold" fontSize:21.0];
            title.position = ccp(162, winSize.height - 58);
            title.color = ccc3(0, 0, 0);
            [self addChild: title z:34002];
            
            CGSize size;
            size.width = 180;
            size.height = 200;
            CCLabelTTF* description = [CCLabelTTF labelWithString:@"Gain experience more quickly from your journeys and battles."  dimensions:size alignment:UITextAlignmentLeft lineBreakMode:UILineBreakModeWordWrap fontName:@"Optima" fontSize:19.0];
            description.color = ccc3(0, 0, 0);
            description.position = ccp(120, 140);
            [self addChild:description z:34002 tag:3];
            
            if (!hero.attrib15)
            {
                CCMenuItemImage *use = [CCMenuItemImage itemFromNormalImage:@"modalunlock4.png" selectedImage:@"modalunlock4_pressed.png" target:self selector:@selector(use)];
            description.color = ccc3(0, 0, 0);
            description.color = ccc3(0, 0, 0);
                CCMenu *menu = [CCMenu menuWithItems:use, nil];
                menu.position = ccp(224, 82);
                [self addChild:menu z:34003];
            description.color = ccc3(0, 0, 0);
            description.position = ccp(120, 140);
                CCLabelTTF *label1 = [CCLabelTTF labelWithString:@"Cost: 2" dimensions:CGSizeMake(115, 45) alignment:UITextAlignmentLeft fontName:@"Optima-Bold" fontSize:21.0];
                label1.position = ccp(84,70);
                label1.color = ccc3(255,0,0);
                [self addChild: label1 z:34002];
            }
            else
            {
                CCLabelTTF *label2 = [CCLabelTTF labelWithString:@"UNLOCKED" dimensions:CGSizeMake(195, 38) alignment:UITextAlignmentLeft fontName:@"Optima-Bold" fontSize:21.0];
                label2.position = ccp(120,70);
                label2.color = ccc3(0, 55, 255);
                [self addChild: label2 z:34002];
            }
        }
        if (attribCode == 16)
        {
            CCSprite *itemImage = [CCSprite spriteWithFile:@"attrib16tile.png"];
            itemImage.position = ccp(42, winSize.height - 40);
            [self addChild:itemImage z:34002 tag:2];
            
            CCLabelTTF *title = [CCLabelTTF labelWithString:@"Eagle Eye" dimensions:CGSizeMake(160, 90) alignment:UITextAlignmentLeft fontName:@"Optima-Bold" fontSize:21.0];
            title.position = ccp(162, winSize.height - 58);
            title.color = ccc3(0, 0, 0);
            [self addChild: title z:34002];
            
            CGSize size;
            size.width = 180;
            size.height = 200;
            CCLabelTTF* description = [CCLabelTTF labelWithString:@"Gather more money from looting and selling items."  dimensions:size alignment:UITextAlignmentLeft lineBreakMode:UILineBreakModeWordWrap fontName:@"Optima" fontSize:19.0];
            description.color = ccc3(0, 0, 0);
            description.position = ccp(120, 140);
            [self addChild:description z:34002 tag:3];
            
            if (!hero.attrib16)
            {
                CCMenuItemImage *use = [CCMenuItemImage itemFromNormalImage:@"modalunlock4.png" selectedImage:@"modalunlock4_pressed.png" target:self selector:@selector(use)];
            description.color = ccc3(0, 0, 0);
            description.color = ccc3(0, 0, 0);
                CCMenu *menu = [CCMenu menuWithItems:use, nil];
                menu.position = ccp(224, 82);
                [self addChild:menu z:34003];
            description.color = ccc3(0, 0, 0);
            description.position = ccp(120, 140);
                CCLabelTTF *label1 = [CCLabelTTF labelWithString:@"Cost: 3" dimensions:CGSizeMake(115, 45) alignment:UITextAlignmentLeft fontName:@"Optima-Bold" fontSize:21.0];
                label1.position = ccp(84,70);
                label1.color = ccc3(255,0,0);
                [self addChild: label1 z:34002];
            }
            else
            {
                CCLabelTTF *label2 = [CCLabelTTF labelWithString:@"UNLOCKED" dimensions:CGSizeMake(195, 38) alignment:UITextAlignmentLeft fontName:@"Optima-Bold" fontSize:21.0];
                label2.position = ccp(120,70);
                label2.color = ccc3(0, 55, 255);
                [self addChild: label2 z:34002];
            }
        }
        if (attribCode == 17)
        {
            CCSprite *itemImage = [CCSprite spriteWithFile:@"attrib17tile.png"];
            itemImage.position = ccp(42, winSize.height - 40);
            [self addChild:itemImage z:34002 tag:2];
            
            CCLabelTTF *title = [CCLabelTTF labelWithString:@"Wisdom" dimensions:CGSizeMake(160, 90) alignment:UITextAlignmentLeft fontName:@"Optima-Bold" fontSize:21.0];
            title.position = ccp(162, winSize.height - 58);
            title.color = ccc3(0, 0, 0);
            [self addChild: title z:34002];
            
            CGSize size;
            size.width = 180;
            size.height = 200;
            CCLabelTTF* description = [CCLabelTTF labelWithString:@"Greatly improves your experience growth rate."  dimensions:size alignment:UITextAlignmentLeft lineBreakMode:UILineBreakModeWordWrap fontName:@"Optima" fontSize:19.0];
            description.color = ccc3(0, 0, 0);
            description.position = ccp(120, 140);
            [self addChild:description z:34002 tag:3];
            
            if (!hero.attrib17)
            {
                CCMenuItemImage *use = [CCMenuItemImage itemFromNormalImage:@"modalunlock4.png" selectedImage:@"modalunlock4_pressed.png" target:self selector:@selector(use)];
            description.color = ccc3(0, 0, 0);
            description.color = ccc3(0, 0, 0);
                CCMenu *menu = [CCMenu menuWithItems:use, nil];
                menu.position = ccp(224, 82);
                [self addChild:menu z:34003];
            description.color = ccc3(0, 0, 0);
            description.position = ccp(120, 140);
                CCLabelTTF *label1 = [CCLabelTTF labelWithString:@"Cost: 5" dimensions:CGSizeMake(115, 45) alignment:UITextAlignmentLeft fontName:@"Optima-Bold" fontSize:21.0];
                label1.position = ccp(84,70);
                label1.color = ccc3(255,0,0);
                [self addChild: label1 z:34002];
            }
            else
            {
                CCLabelTTF *label2 = [CCLabelTTF labelWithString:@"UNLOCKED" dimensions:CGSizeMake(195, 38) alignment:UITextAlignmentLeft fontName:@"Optima-Bold" fontSize:21.0];
                label2.position = ccp(120,70);
                label2.color = ccc3(0, 55, 255);
                [self addChild: label2 z:34002];
            }
        }
        if (attribCode == 18)
        {
            CCSprite *itemImage = [CCSprite spriteWithFile:@"attrib18tile.png"];
            itemImage.position = ccp(42, winSize.height - 40);
            [self addChild:itemImage z:34002 tag:2];
            
            CCLabelTTF *title = [CCLabelTTF labelWithString:@"Merchant's Craft" dimensions:CGSizeMake(158, 90) alignment:UITextAlignmentLeft fontName:@"Optima-Bold" fontSize:21.0];
            title.position = ccp(162, winSize.height - 58);
            title.color = ccc3(0, 0, 0);
            [self addChild: title z:34002];
            
            CGSize size;
            size.width = 180;
            size.height = 200;
            CCLabelTTF* description = [CCLabelTTF labelWithString:@"Become skilled at collecting and maintaining wealth."  dimensions:size alignment:UITextAlignmentLeft lineBreakMode:UILineBreakModeWordWrap fontName:@"Optima" fontSize:19.0];
            description.color = ccc3(0, 0, 0);
            description.position = ccp(120, 140);
            [self addChild:description z:34002 tag:3];
            
            if (!hero.attrib18)
            {
                CCMenuItemImage *use = [CCMenuItemImage itemFromNormalImage:@"modalunlock4.png" selectedImage:@"modalunlock4_pressed.png" target:self selector:@selector(use)];
            description.color = ccc3(0, 0, 0);
            description.color = ccc3(0, 0, 0);
                CCMenu *menu = [CCMenu menuWithItems:use, nil];
                menu.position = ccp(224, 82);
                [self addChild:menu z:34003];
            description.color = ccc3(0, 0, 0);
            description.position = ccp(120, 140);
                CCLabelTTF *label1 = [CCLabelTTF labelWithString:@"Cost: 6" dimensions:CGSizeMake(115, 45) alignment:UITextAlignmentLeft fontName:@"Optima-Bold" fontSize:21.0];
                label1.position = ccp(84,70);
                label1.color = ccc3(255,0,0);
                [self addChild: label1 z:34002];
            }
            else
            {
                CCLabelTTF *label2 = [CCLabelTTF labelWithString:@"UNLOCKED" dimensions:CGSizeMake(195, 38) alignment:UITextAlignmentLeft fontName:@"Optima-Bold" fontSize:21.0];
                label2.position = ccp(120,70);
                label2.color = ccc3(0, 55, 255);
                [self addChild: label2 z:34002];
            }
        }
        if (attribCode == 19)
        {
            CCSprite *itemImage = [CCSprite spriteWithFile:@"attrib19tile.png"];
            itemImage.position = ccp(42, winSize.height - 40);
            [self addChild:itemImage z:34002 tag:2];
            
            CCLabelTTF *title = [CCLabelTTF labelWithString:@"Nature's Enchantment" dimensions:CGSizeMake(160, 90) alignment:UITextAlignmentLeft fontName:@"Optima-Bold" fontSize:21.0];
            title.position = ccp(162, winSize.height - 58);
            title.color = ccc3(0, 0, 0);
            [self addChild: title z:34002];
            
            CGSize size;
            size.width = 180;
            size.height = 200;
            CCLabelTTF* description = [CCLabelTTF labelWithString:@"Regenerate health as you explore the world."  dimensions:size alignment:UITextAlignmentLeft lineBreakMode:UILineBreakModeWordWrap fontName:@"Optima" fontSize:19.0];
            description.color = ccc3(0, 0, 0);
            description.position = ccp(120, 140);
            [self addChild:description z:34002 tag:3];
            
            if (!hero.attrib19)
            {
                CCMenuItemImage *use = [CCMenuItemImage itemFromNormalImage:@"modalunlock4.png" selectedImage:@"modalunlock4_pressed.png" target:self selector:@selector(use)];
            description.color = ccc3(0, 0, 0);
            description.color = ccc3(0, 0, 0);
                CCMenu *menu = [CCMenu menuWithItems:use, nil];
                menu.position = ccp(224, 82);
                [self addChild:menu z:34003];
            description.color = ccc3(0, 0, 0);
            description.position = ccp(120, 140);
                CCLabelTTF *label1 = [CCLabelTTF labelWithString:@"Cost: 12" dimensions:CGSizeMake(115, 45) alignment:UITextAlignmentLeft fontName:@"Optima-Bold" fontSize:21.0];
                label1.position = ccp(84,70);
                label1.color = ccc3(255,0,0);
                [self addChild: label1 z:34002];
            }
            else
            {
                CCLabelTTF *label2 = [CCLabelTTF labelWithString:@"UNLOCKED" dimensions:CGSizeMake(195, 38) alignment:UITextAlignmentLeft fontName:@"Optima-Bold" fontSize:21.0];
                label2.position = ccp(120,70);
                label2.color = ccc3(0, 55, 255);
                [self addChild: label2 z:34002];
            }
        }
        
        
        
    }
    return self;
}

-(void)use
{
    
    [(DisplayAttributes*)self.parent unlock:attribCode];
        
}








@end







