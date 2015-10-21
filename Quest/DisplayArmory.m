//
//  DisplayObjectivesHints.m
//  Quest
//
//  Created by Leo Linsky on 5/19/12.
//  Copyright 2012 __MyCompanyName__. All rights reserved.
//

#import "DisplayArmory.h"
#import "GameSceneManager.h"
#import "MyHero.h"
#import "MusicHandler.h"


@implementation DisplayArmory

@synthesize hero;

-(void)touchedBack
{
    if (showingItemLayer)
    {
        [self removeChild:showItemLayer cleanup:YES];
        [GameSceneManager sharedGameSceneManager].hero = self.hero;
        showingItemLayer = NO;
    }
}

-(id) init
{
    if (self = [super init])
    {
        self.hero = [GameSceneManager sharedGameSceneManager].hero;
        
        showingItemLayer = NO;
        
        CGSize winSize = [[CCDirector sharedDirector] winSize];
        
        
        CCMenuItemImage *background = [CCMenuItemImage itemFromNormalImage:@"pinktemp3.png" selectedImage:@"pinktemp3.png" target:self selector:@selector(touchedBack)];
        background.opacity = 1;
        CCMenu *menu = [CCMenu menuWithItems:background, nil];
        menu.position = ccp(winSize.width/2 - 80, winSize.height/2 + 60);
		[self addChild:menu z:0];
        
        
    
        
        CCLabelTTF *label00 = [CCLabelTTF labelWithString:[NSString stringWithFormat:@"Strength"] dimensions: CGSizeMake(140, 30) alignment:UITextAlignmentLeft fontName:@"Optima-Bold" fontSize:21.0];
        label00.color = ccc3(0, 0, 0);
        label00.position = ccp(winSize.width/2 - 155, winSize.height/2 + 130);
        [self addChild: label00 z:15 tag:101];
        
        CCLabelTTF *label0 = [CCLabelTTF labelWithString:[NSString stringWithFormat:@"Bonus: %d", hero.strBonus] dimensions: CGSizeMake(140, 30) alignment:UITextAlignmentLeft fontName:@"Optima-Bold" fontSize:17.0];
        label0.position = ccp(winSize.width/2 - 155, winSize.height/2 + 100);
        [self addChild: label0 z:15 tag:21];
        
        
        CCLabelTTF *label1 = [CCLabelTTF labelWithString:[NSString stringWithFormat:@"Multiplier: %.1f", hero.strMult] dimensions: CGSizeMake(140, 30) alignment:UITextAlignmentLeft fontName:@"Optima-Bold" fontSize:17.0];
        label1.position = ccp(winSize.width/2 - 155, winSize.height/2 + 80);
        [self addChild: label1 z:15 tag:22];
        
        CCLabelTTF *label01 = [CCLabelTTF labelWithString:[NSString stringWithFormat:@"Defense"] dimensions: CGSizeMake(140, 30) alignment:UITextAlignmentLeft fontName:@"Optima-Bold" fontSize:21.0];
        label01.color = ccc3(0, 0, 0);
        label01.position = ccp(winSize.width/2 - 155, winSize.height/2 + 55);
        [self addChild: label01 z:15 tag:102];
        
        CCLabelTTF *label2 = [CCLabelTTF labelWithString:[NSString stringWithFormat:@"Bonus: %d", hero.defBonus] dimensions: CGSizeMake(140, 30) alignment:UITextAlignmentLeft fontName:@"Optima-Bold" fontSize:17.0];
        label2.position = ccp(winSize.width/2 - 155, winSize.height/2 + 25);
        [self addChild: label2 z:15 tag:23];
        
        
        CCLabelTTF *label3 = [CCLabelTTF labelWithString:[NSString stringWithFormat:@"Multiplier: %.1f", hero.defMult] dimensions: CGSizeMake(140, 30) alignment:UITextAlignmentLeft fontName:@"Optima-Bold" fontSize:17.0];
        label3.position = ccp(winSize.width/2 - 155, winSize.height/2 + 5);
        [self addChild: label3 z:15 tag:24];
        
        CCLabelTTF *label02 = [CCLabelTTF labelWithString:[NSString stringWithFormat:@"Agility"] dimensions: CGSizeMake(140, 30) alignment:UITextAlignmentLeft fontName:@"Optima-Bold" fontSize:21.0];
        label02.color = ccc3(0, 0, 0);
        label02.position = ccp(winSize.width/2 - 155, winSize.height/2 - 20);
        [self addChild: label02 z:15 tag:103];
        
        CCLabelTTF *label4 = [CCLabelTTF labelWithString:[NSString stringWithFormat:@"Bonus: %d", hero.aglBonus] dimensions: CGSizeMake(140, 30) alignment:UITextAlignmentLeft fontName:@"Optima-Bold" fontSize:17.0];
        label4.position = ccp(winSize.width/2 - 155, winSize.height/2 - 50);
        [self addChild: label4 z:15 tag:25];
        
        CCLabelTTF *label5 = [CCLabelTTF labelWithString:[NSString stringWithFormat:@"Multiplier: %.1f", hero.aglMult] dimensions: CGSizeMake(140, 30) alignment:UITextAlignmentLeft fontName:@"Optima-Bold" fontSize:17.0];
        label5.position = ccp(winSize.width/2 - 155, winSize.height/2 - 70);
        [self addChild: label5 z:15 tag:26];
        
        

        
        
        
        
        
        
        
        
        
        
        
        
        
        
        if (hero.itemInPos1)
        {
            equip1 = [CCMenuItemImage itemFromNormalImage:@"armorybackplain1.png" selectedImage:@"armorybackplain1.png" target:self selector:@selector(onEquip1)];
            CCMenu *menu = [CCMenu menuWithItems:equip1,nil];
            menu.position = ccp(winSize.width/2 - 10, winSize.height/2 + 15);
            [self addChild:menu z:20 tag:101];
            
            spriteEquip1 = [CCSprite spriteWithFile:(self.hero.equipPos1.image)];
            spriteEquip1.position = menu.position;
            [[CCTouchDispatcher sharedDispatcher] removeDelegate:spriteEquip1];
            [self addChild:spriteEquip1 z:21];
            
        }
        else
        {
            if (spriteEquip1)
            {
                [self removeChild:spriteEquip1 cleanup:YES];;
            }
            
            equip1 = [CCMenuItemImage itemFromNormalImage:@"armorybacksword1.png" selectedImage:@"armorybacksword1.png" target:self selector:@selector(onEquip1)];
            CCMenu *menu = [CCMenu menuWithItems:equip1,nil];
            menu.position = ccp(winSize.width/2 - 10, winSize.height/2 + 15);
            [self addChild:menu z:20 tag:101];
        }
        
        if (hero.itemInPos2)
        {
            equip2 = [CCMenuItemImage itemFromNormalImage:@"armorybackplain1.png" selectedImage:@"armorybackplain1.png" target:self selector:@selector(onEquip2)];
            CCMenu *menu = [CCMenu menuWithItems:equip2,nil];
            menu.position = ccp(winSize.width/2 + 160, winSize.height/2 + 15);
            [self addChild:menu z:20 tag:102];
            
            spriteEquip2 = [CCSprite spriteWithFile:(self.hero.equipPos2.image)];
            spriteEquip2.position = menu.position;
            [[CCTouchDispatcher sharedDispatcher] removeDelegate:spriteEquip2];
            [self addChild:spriteEquip2 z:21];
        }
        else
        {
            if (spriteEquip2)
            {
                [self removeChild:spriteEquip2 cleanup:YES];
            }
            
            equip2 = [CCMenuItemImage itemFromNormalImage:@"armorybackshield1.png" selectedImage:@"armorybackshield1.png" target:self selector:@selector(onEquip2)];
            CCMenu *menu = [CCMenu menuWithItems:equip2,nil];
            menu.position = ccp(winSize.width/2 + 160, winSize.height/2 + 15);
            [self addChild:menu z:20 tag:102];
        }
        if (hero.itemInPos3)
        {
            equip3 = [CCMenuItemImage itemFromNormalImage:@"armorybackplain1.png" selectedImage:@"armorybackplain1.png" target:self selector:@selector(onEquip3)];
            CCMenu *menu = [CCMenu menuWithItems:equip3,nil];
            menu.position = ccp(winSize.width/2 + 75, winSize.height/2 + 100);
            [self addChild:menu z:20 tag:103];
            
            spriteEquip3 = [CCSprite spriteWithFile:(self.hero.equipPos3.image)];
            spriteEquip3.position = menu.position;
            [[CCTouchDispatcher sharedDispatcher] removeDelegate:spriteEquip3];
            [self addChild:spriteEquip3 z:21];
        }
        else
        {
            if (spriteEquip3)
            {
                [self removeChild:spriteEquip3 cleanup:YES];
            }
            equip3 = [CCMenuItemImage itemFromNormalImage:@"armorybackhelmet1.png" selectedImage:@"armorybackhelmet1.png" target:self selector:@selector(onEquip3)];
            CCMenu *menu = [CCMenu menuWithItems:equip3,nil];
            menu.position = ccp(winSize.width/2 + 75, winSize.height/2 + 100);
            [self addChild:menu z:20 tag:103];
        }
        if (hero.itemInPos4)
        {
            equip4 = [CCMenuItemImage itemFromNormalImage:@"armorybackplain1.png" selectedImage:@"armorybackplain1.png" target:self selector:@selector(onEquip4)];
            CCMenu *menu = [CCMenu menuWithItems:equip4,nil];
            menu.position = ccp(winSize.width/2 + 75, winSize.height/2 + 15);
            [self addChild:menu z:20 tag:104];
            
            spriteEquip4 = [CCSprite spriteWithFile:(self.hero.equipPos4.image)];
            spriteEquip4.position = menu.position;
            [[CCTouchDispatcher sharedDispatcher] removeDelegate:spriteEquip4];
            [self addChild:spriteEquip4 z:21];
        }
        else
        {
            if (spriteEquip4)
            {
                [self removeChild:spriteEquip4 cleanup:YES];
            }
            equip4 = [CCMenuItemImage itemFromNormalImage:@"armorybackchest1.png" selectedImage:@"armorybackchest1.png" target:self selector:@selector(onEquip4)];
            CCMenu *menu = [CCMenu menuWithItems:equip4,nil];
            menu.position = ccp(winSize.width/2 + 75, winSize.height/2 + 15);
            [self addChild:menu z:20 tag:104];
        }
        if (hero.itemInPos5)
        {
            equip5 = [CCMenuItemImage itemFromNormalImage:@"armorybackplain1.png" selectedImage:@"armorybackplain1.png" target:self selector:@selector(onEquip5)];
            CCMenu *menu = [CCMenu menuWithItems:equip5,nil];
            menu.position = ccp(winSize.width/2 - 10, winSize.height/2 + 100);
            [self addChild:menu z:20 tag:105];
            
            spriteEquip5 = [CCSprite spriteWithFile:(self.hero.equipPos5.image)];
            spriteEquip5.position = menu.position;
            [[CCTouchDispatcher sharedDispatcher] removeDelegate:spriteEquip5];
            [self addChild:spriteEquip5 z:21];
        }
        else
        {
            if (spriteEquip5)
            {
                [self removeChild:spriteEquip5 cleanup:YES];
            }
            equip5 = [CCMenuItemImage itemFromNormalImage:@"armorybackamulet1.png" selectedImage:@"armorybackamulet1.png" target:self selector:@selector(onEquip5)];
            CCMenu *menu = [CCMenu menuWithItems:equip5,nil];
            menu.position = ccp(winSize.width/2 - 10, winSize.height/2 + 100);
            [self addChild:menu z:20 tag:105];
        }
        if (hero.itemInPos6)
        {
            equip6 = [CCMenuItemImage itemFromNormalImage:@"armorybackplain1.png" selectedImage:@"armorybackplain1.png" target:self selector:@selector(onEquip6)];
            CCMenu *menu = [CCMenu menuWithItems:equip6,nil];
            menu.position = ccp(winSize.width/2 + 75, winSize.height/2 - 70);
            [self addChild:menu z:20 tag:106];
            
            spriteEquip6 = [CCSprite spriteWithFile:(self.hero.equipPos6.image)];
            spriteEquip6.position = menu.position;
            [[CCTouchDispatcher sharedDispatcher] removeDelegate:spriteEquip6];
            [self addChild:spriteEquip6 z:21];
        }
        else
        {
            if (spriteEquip6)
            {
                [self removeChild:spriteEquip6 cleanup:YES];
            }
            equip6 = [CCMenuItemImage itemFromNormalImage:@"armorybacklegs1.png" selectedImage:@"armorybacklegs1.png" target:self selector:@selector(onEquip6)];
            CCMenu *menu = [CCMenu menuWithItems:equip6,nil];
            menu.position = ccp(winSize.width/2 + 75, winSize.height/2 - 70);
            [self addChild:menu z:20 tag:106];
        }
        
        
        
        
    }
    return self;
}




-(void) updateTaggedStuff
{
    
    [self removeChildByTag:21 cleanup:YES];
    [self removeChildByTag:22 cleanup:YES];
    [self removeChildByTag:23 cleanup:YES];
    [self removeChildByTag:24 cleanup:YES];
    [self removeChildByTag:25 cleanup:YES];
    [self removeChildByTag:26 cleanup:YES];
    [self removeChildByTag:27 cleanup:YES];
    [self removeChildByTag:28 cleanup:YES];
    
    [self removeChildByTag:101 cleanup:YES];
    [self removeChildByTag:102 cleanup:YES];
    [self removeChildByTag:103 cleanup:YES];
    [self removeChildByTag:104 cleanup:YES];
    [self removeChildByTag:105 cleanup:YES];
    [self removeChildByTag:106 cleanup:YES];
    
    
    
    
    
    
    
    CGSize winSize = [[CCDirector sharedDirector] winSize];
    
    CCLabelTTF *label00 = [CCLabelTTF labelWithString:[NSString stringWithFormat:@"Strength"] dimensions: CGSizeMake(140, 30) alignment:UITextAlignmentLeft fontName:@"Optima-Bold" fontSize:21.0];
    label00.color = ccc3(0, 0, 0);
    label00.position = ccp(winSize.width/2 - 155, winSize.height/2 + 130);
    [self addChild: label00 z:15 tag:101];
    
    CCLabelTTF *label0 = [CCLabelTTF labelWithString:[NSString stringWithFormat:@"Bonus: %d", hero.strBonus] dimensions: CGSizeMake(140, 30) alignment:UITextAlignmentLeft fontName:@"Optima-Bold" fontSize:17.0];
    label0.position = ccp(winSize.width/2 - 155, winSize.height/2 + 100);
    [self addChild: label0 z:15 tag:21];
    
    
    CCLabelTTF *label1 = [CCLabelTTF labelWithString:[NSString stringWithFormat:@"Multiplier: %.1f", hero.strMult] dimensions: CGSizeMake(140, 30) alignment:UITextAlignmentLeft fontName:@"Optima-Bold" fontSize:17.0];
    label1.position = ccp(winSize.width/2 - 155, winSize.height/2 + 80);
    [self addChild: label1 z:15 tag:22];
    
    CCLabelTTF *label01 = [CCLabelTTF labelWithString:[NSString stringWithFormat:@"Defense"] dimensions: CGSizeMake(140, 30) alignment:UITextAlignmentLeft fontName:@"Optima-Bold" fontSize:21.0];
    label01.color = ccc3(0, 0, 0);
    label01.position = ccp(winSize.width/2 - 155, winSize.height/2 + 55);
    [self addChild: label01 z:15 tag:102];
    
    CCLabelTTF *label2 = [CCLabelTTF labelWithString:[NSString stringWithFormat:@"Bonus: %d", hero.defBonus] dimensions: CGSizeMake(140, 30) alignment:UITextAlignmentLeft fontName:@"Optima-Bold" fontSize:17.0];
    label2.position = ccp(winSize.width/2 - 155, winSize.height/2 + 25);
    [self addChild: label2 z:15 tag:23];
    
    
    CCLabelTTF *label3 = [CCLabelTTF labelWithString:[NSString stringWithFormat:@"Multiplier: %.1f", hero.defMult] dimensions: CGSizeMake(140, 30) alignment:UITextAlignmentLeft fontName:@"Optima-Bold" fontSize:17.0];
    label3.position = ccp(winSize.width/2 - 155, winSize.height/2 + 5);
    [self addChild: label3 z:15 tag:24];
    
    CCLabelTTF *label02 = [CCLabelTTF labelWithString:[NSString stringWithFormat:@"Agility"] dimensions: CGSizeMake(140, 30) alignment:UITextAlignmentLeft fontName:@"Optima-Bold" fontSize:21.0];
    label02.color = ccc3(0, 0, 0);
    label02.position = ccp(winSize.width/2 - 155, winSize.height/2 - 20);
    [self addChild: label02 z:15 tag:103];
    
    CCLabelTTF *label4 = [CCLabelTTF labelWithString:[NSString stringWithFormat:@"Bonus: %d", hero.aglBonus] dimensions: CGSizeMake(140, 30) alignment:UITextAlignmentLeft fontName:@"Optima-Bold" fontSize:17.0];
    label4.position = ccp(winSize.width/2 - 155, winSize.height/2 - 50);
    [self addChild: label4 z:15 tag:25];
    
    CCLabelTTF *label5 = [CCLabelTTF labelWithString:[NSString stringWithFormat:@"Multiplier: %.1f", hero.aglMult] dimensions: CGSizeMake(140, 30) alignment:UITextAlignmentLeft fontName:@"Optima-Bold" fontSize:17.0];
    label5.position = ccp(winSize.width/2 - 155, winSize.height/2 - 70);
    [self addChild: label5 z:15 tag:26];
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    if (hero.itemInPos1)
    {
        equip1 = [CCMenuItemImage itemFromNormalImage:@"armorybackplain1.png" selectedImage:@"armorybackplain1.png" target:self selector:@selector(onEquip1)];
        CCMenu *menu = [CCMenu menuWithItems:equip1,nil];
        menu.position = ccp(winSize.width/2 - 10, winSize.height/2 + 15);
        [self addChild:menu z:20 tag:101];
        
        if (spriteEquip1)
        {
            [self removeChild:spriteEquip1 cleanup:YES];
        }
        spriteEquip1 = [CCSprite spriteWithFile:(self.hero.equipPos1.image)];
        spriteEquip1.position = menu.position;
        [[CCTouchDispatcher sharedDispatcher] removeDelegate:spriteEquip1];
        [self addChild:spriteEquip1 z:21];
        
    }
    else
    {
        if (spriteEquip1)
        {
            [self removeChild:spriteEquip1 cleanup:YES];
        }
        
        equip1 = [CCMenuItemImage itemFromNormalImage:@"armorybacksword1.png" selectedImage:@"armorybacksword1.png" target:self selector:@selector(onEquip1)];
        CCMenu *menu = [CCMenu menuWithItems:equip1,nil];
        menu.position = ccp(winSize.width/2 - 10, winSize.height/2 + 15);
        [self addChild:menu z:20 tag:101];
    }
    
    if (hero.itemInPos2)
    {
        equip2 = [CCMenuItemImage itemFromNormalImage:@"armorybackplain1.png" selectedImage:@"armorybackplain1.png" target:self selector:@selector(onEquip2)];
        CCMenu *menu = [CCMenu menuWithItems:equip2,nil];
        menu.position = ccp(winSize.width/2 + 160, winSize.height/2 + 15);
        [self addChild:menu z:20 tag:102];
        
        if (spriteEquip2)
        {
            [self removeChild:spriteEquip2 cleanup:YES];
        }
        spriteEquip2 = [CCSprite spriteWithFile:(self.hero.equipPos2.image)];
        spriteEquip2.position = menu.position;
        [[CCTouchDispatcher sharedDispatcher] removeDelegate:spriteEquip2];
        [self addChild:spriteEquip2 z:21];
    }
    else
    {
        if (spriteEquip2)
        {
            [self removeChild:spriteEquip2 cleanup:YES];
        }
        
        equip2 = [CCMenuItemImage itemFromNormalImage:@"armorybackshield1.png" selectedImage:@"armorybackshield1.png" target:self selector:@selector(onEquip2)];
        CCMenu *menu = [CCMenu menuWithItems:equip2,nil];
        menu.position = ccp(winSize.width/2 + 160, winSize.height/2 + 15);
        [self addChild:menu z:20 tag:102];
    }
    if (hero.itemInPos3)
    {
        equip3 = [CCMenuItemImage itemFromNormalImage:@"armorybackplain1.png" selectedImage:@"armorybackplain1.png" target:self selector:@selector(onEquip3)];
        CCMenu *menu = [CCMenu menuWithItems:equip3,nil];
        menu.position = ccp(winSize.width/2 + 75, winSize.height/2 + 100);
        [self addChild:menu z:20 tag:103];
        
        if (spriteEquip3)
        {
            [self removeChild:spriteEquip3 cleanup:YES];
        }
        spriteEquip3 = [CCSprite spriteWithFile:(self.hero.equipPos3.image)];
        spriteEquip3.position = menu.position;
        [[CCTouchDispatcher sharedDispatcher] removeDelegate:spriteEquip3];
        [self addChild:spriteEquip3 z:21];
    }
    else
    {
        if (spriteEquip3)
        {
            [self removeChild:spriteEquip3 cleanup:YES];
        }
        equip3 = [CCMenuItemImage itemFromNormalImage:@"armorybackhelmet1.png" selectedImage:@"armorybackhelmet1.png" target:self selector:@selector(onEquip3)];
        CCMenu *menu = [CCMenu menuWithItems:equip3,nil];
        menu.position = ccp(winSize.width/2 + 75, winSize.height/2 + 100);
        [self addChild:menu z:20 tag:103];
    }
    if (hero.itemInPos4)
    {
        equip4 = [CCMenuItemImage itemFromNormalImage:@"armorybackplain1.png" selectedImage:@"armorybackplain1.png" target:self selector:@selector(onEquip4)];
        CCMenu *menu = [CCMenu menuWithItems:equip4,nil];
        menu.position = ccp(winSize.width/2 + 75, winSize.height/2 + 15);
        [self addChild:menu z:20 tag:104];
        
        if (spriteEquip4)
        {
            [self removeChild:spriteEquip4 cleanup:YES];
        }
        spriteEquip4 = [CCSprite spriteWithFile:(self.hero.equipPos4.image)];
        spriteEquip4.position = menu.position;
        [[CCTouchDispatcher sharedDispatcher] removeDelegate:spriteEquip4];
        [self addChild:spriteEquip4 z:21];
    }
    else
    {
        if (spriteEquip4)
        {
            [self removeChild:spriteEquip4 cleanup:YES];
        }
        equip4 = [CCMenuItemImage itemFromNormalImage:@"armorybackchest1.png" selectedImage:@"armorybackchest1.png" target:self selector:@selector(onEquip4)];
        CCMenu *menu = [CCMenu menuWithItems:equip4,nil];
        menu.position = ccp(winSize.width/2 + 75, winSize.height/2 + 15);
        [self addChild:menu z:20 tag:104];
    }
    if (hero.itemInPos5)
    {
        equip5 = [CCMenuItemImage itemFromNormalImage:@"armorybackplain1.png" selectedImage:@"armorybackplain1.png" target:self selector:@selector(onEquip5)];
        CCMenu *menu = [CCMenu menuWithItems:equip5,nil];
        menu.position = ccp(winSize.width/2 - 10, winSize.height/2 + 100);
        [self addChild:menu z:20 tag:105];
        
        if (spriteEquip5)
        {
            [self removeChild:spriteEquip5 cleanup:YES];
        }
        spriteEquip5 = [CCSprite spriteWithFile:(self.hero.equipPos5.image)];
        spriteEquip5.position = menu.position;
        [[CCTouchDispatcher sharedDispatcher] removeDelegate:spriteEquip5];
        [self addChild:spriteEquip5 z:21];
    }
    else
    {
        if (spriteEquip5)
        {
            [self removeChild:spriteEquip5 cleanup:YES];
        }
        equip5 = [CCMenuItemImage itemFromNormalImage:@"armorybackamulet1.png" selectedImage:@"armorybackamulet1.png" target:self selector:@selector(onEquip5)];
        CCMenu *menu = [CCMenu menuWithItems:equip5,nil];
        menu.position = ccp(winSize.width/2 - 10, winSize.height/2 + 100);
        [self addChild:menu z:20 tag:105];
    }
    if (hero.itemInPos6)
    {
        equip6 = [CCMenuItemImage itemFromNormalImage:@"armorybackplain1.png" selectedImage:@"armorybackplain1.png" target:self selector:@selector(onEquip6)];
        CCMenu *menu = [CCMenu menuWithItems:equip6,nil];
        menu.position = ccp(winSize.width/2 + 75, winSize.height/2 - 70);
        [self addChild:menu z:20 tag:106];
        
        if (spriteEquip6)
        {
            [self removeChild:spriteEquip6 cleanup:YES];
        }
        spriteEquip6 = [CCSprite spriteWithFile:(self.hero.equipPos6.image)];
        spriteEquip6.position = menu.position;
        [[CCTouchDispatcher sharedDispatcher] removeDelegate:spriteEquip6];
        [self addChild:spriteEquip6 z:21];
    }
    else
    {
        if (spriteEquip6)
        {
            [self removeChild:spriteEquip6 cleanup:YES];
        }
        equip6 = [CCMenuItemImage itemFromNormalImage:@"armorybacklegs1.png" selectedImage:@"armorybacklegs1.png" target:self selector:@selector(onEquip6)];
        CCMenu *menu = [CCMenu menuWithItems:equip6,nil];
        menu.position = ccp(winSize.width/2 + 75, winSize.height/2 - 70);
        [self addChild:menu z:20 tag:106];
    }
    
    
    
    
    
    
    
    
}





-(void)onEquip1
{
    if (showingItemLayer)
    {
        [self removeChild:showItemLayer cleanup:YES];
        showingItemLayer = NO;
    }
    else
    {
        showItemLayer.position = 0;
    }
    
    
    if (hero.itemInPos1 && (showItemLayer.position != 1))
    {
        DisplayEquipItemLayer *item = [[DisplayEquipItemLayer alloc] initWithItem:hero.equipPos1 source:1];
        showItemLayer = item;
        showItemLayer.position = 1;
        [self addChild:showItemLayer z:34000];
    
        showingItemLayer = YES;
        
    }
    else
    {
        //later: offer possible things to equip in that spot
    }
}
-(void)onEquip2
{
    if (showingItemLayer)
    {
        [self removeChild:showItemLayer cleanup:YES];
        
        showingItemLayer = NO;
    }
    else
    {
        showItemLayer.position = 0;
    }
    
    
    if (hero.itemInPos2 && (showItemLayer.position != 2))
    {
        DisplayEquipItemLayer *item = [[DisplayEquipItemLayer alloc] initWithItem:hero.equipPos2 source:1];
        showItemLayer = item;
        showItemLayer.position = 2;
        [self addChild:showItemLayer z:34000];
        
        showingItemLayer = YES;
        
    }
}
-(void)onEquip3
{
    if (showingItemLayer)
    {
        [self removeChild:showItemLayer cleanup:YES];
        showingItemLayer = NO;
    }
    else
    {
        showItemLayer.position = 0;
    }
    
    
    if (hero.itemInPos3 && (showItemLayer.position != 3))
    {
        DisplayEquipItemLayer *item = [[DisplayEquipItemLayer alloc] initWithItem:hero.equipPos3 source:1];
        showItemLayer = item;
        showItemLayer.position = 3;
        [self addChild:showItemLayer z:34000];
        
        showingItemLayer = YES;
        
    }
}
-(void)onEquip4
{
    if (showingItemLayer)
    {
        [self removeChild:showItemLayer cleanup:YES];
        showingItemLayer = NO;
    }
    else
    {
        showItemLayer.position = 0;
    }
    
    
    if (hero.itemInPos4 && (showItemLayer.position != 4))
    {
        DisplayEquipItemLayer *item = [[DisplayEquipItemLayer alloc] initWithItem:hero.equipPos4 source:1];
        showItemLayer = item;
        showItemLayer.position = 4;
        [self addChild:showItemLayer z:34000];
        
        showingItemLayer = YES;
        
    }
}
-(void)onEquip5
{
    if (showingItemLayer)
    {
        [self removeChild:showItemLayer cleanup:YES];
        showingItemLayer = NO;
    }
    else
    {
        showItemLayer.position = 0;
    }
    
    
    if (hero.itemInPos5 && (showItemLayer.position != 5))
    {
        DisplayEquipItemLayer *item = [[DisplayEquipItemLayer alloc] initWithItem:hero.equipPos5 source:1];
        showItemLayer = item;
        showItemLayer.position = 5;
        [self addChild:showItemLayer z:34000];
        
        showingItemLayer = YES;
        
    }
}
-(void)onEquip6
{
    if (showingItemLayer)
    {
        [self removeChild:showItemLayer cleanup:YES];
        showingItemLayer = NO;
    }
    else
    {
        showItemLayer.position = 0;
    }
    
    
    if (hero.itemInPos6 && (showItemLayer.position != 6))
    {
        DisplayEquipItemLayer *item = [[DisplayEquipItemLayer alloc] initWithItem:hero.equipPos6 source:1];
        showItemLayer = item;
        showItemLayer.position = 6;
        [self addChild:showItemLayer z:34000];
        
        showingItemLayer = YES;
        
    }
}


-(void) unequip
{
    if (showItemLayer.position == 1)
    {
        NSMutableArray *array = [hero.heroInventory mutableCopy];
        
        BOOL shouldAddItem = YES;
        for (int i = 0; i < array.count; i++)
        {
            if (((Item*)[array objectAtIndex:i]).itemCode == hero.equipPos1.itemCode)
            {
                ((Item*)[array objectAtIndex:i]).itemCount++;
                shouldAddItem = NO;
                break;
            }
        }
        if (shouldAddItem)
        {
            [array addObject:(hero.equipPos1)];
        }
        hero.itemInPos1 = NO;
        hero.heroInventory = array;
        
        self.hero.aglBonus -= hero.equipPos1.aglBonus;
        self.hero.strBonus -= hero.equipPos1.strBonus;
        self.hero.defBonus -= hero.equipPos1.defBonus;
        self.hero.aglMult /= hero.equipPos1.aglMult;
        self.hero.strMult /= hero.equipPos1.strMult;
        self.hero.defMult /= hero.equipPos1.defMult;
        hero.equipPos1 = nil;
        
        [self touchedBack];
        [self updateTaggedStuff];
    }
    if (showItemLayer.position == 2)
    {
        NSMutableArray *array = [hero.heroInventory mutableCopy];
        
        BOOL shouldAddItem = YES;
        for (int i = 0; i < array.count; i++)
        {
            if (((Item*)[array objectAtIndex:i]).itemCode == hero.equipPos2.itemCode)
            {
                ((Item*)[array objectAtIndex:i]).itemCount++;
                shouldAddItem = NO;
                break;
            }
        }
        if (shouldAddItem)
        {
            [array addObject:(hero.equipPos2)];
        }
        hero.itemInPos2 = NO;
        hero.heroInventory = array;
        
        self.hero.aglBonus -= hero.equipPos2.aglBonus;
        self.hero.strBonus -= hero.equipPos2.strBonus;
        self.hero.defBonus -= hero.equipPos2.defBonus;
        self.hero.aglMult /= hero.equipPos2.aglMult;
        self.hero.strMult /= hero.equipPos2.strMult;
        self.hero.defMult /= hero.equipPos2.defMult;
        hero.equipPos2 = nil;
        
        [self touchedBack];
        [self updateTaggedStuff];
    }
    if (showItemLayer.position == 3)
    {
        NSMutableArray *array = [hero.heroInventory mutableCopy];
        BOOL shouldAddItem = YES;
        for (int i = 0; i < array.count; i++)
        {
            if (((Item*)[array objectAtIndex:i]).itemCode == hero.equipPos3.itemCode)
            {
                ((Item*)[array objectAtIndex:i]).itemCount++;
                shouldAddItem = NO;
                break;
            }
        }
        if (shouldAddItem)
        {
            [array addObject:(hero.equipPos3)];
        }
        hero.itemInPos3 = NO;
        hero.heroInventory = array;
        
        self.hero.aglBonus -= hero.equipPos3.aglBonus;
        self.hero.strBonus -= hero.equipPos3.strBonus;
        self.hero.defBonus -= hero.equipPos3.defBonus;
        self.hero.aglMult /= hero.equipPos3.aglMult;
        self.hero.strMult /= hero.equipPos3.strMult;
        self.hero.defMult /= hero.equipPos3.defMult;
        hero.equipPos3 = nil;
        
        [self touchedBack];
        [self updateTaggedStuff];
    }
    if (showItemLayer.position == 4)
    {
        NSMutableArray *array = [hero.heroInventory mutableCopy];
        BOOL shouldAddItem = YES;
        for (int i = 0; i < array.count; i++)
        {
            if (((Item*)[array objectAtIndex:i]).itemCode == hero.equipPos4.itemCode)
            {
                ((Item*)[array objectAtIndex:i]).itemCount++;
                shouldAddItem = NO;
                break;
            }
        }
        if (shouldAddItem)
        {
            [array addObject:(hero.equipPos4)];
        }
        hero.itemInPos4 = NO;
        hero.heroInventory = array;
        
        self.hero.aglBonus -= hero.equipPos4.aglBonus;
        self.hero.strBonus -= hero.equipPos4.strBonus;
        self.hero.defBonus -= hero.equipPos4.defBonus;
        self.hero.aglMult /= hero.equipPos4.aglMult;
        self.hero.strMult /= hero.equipPos4.strMult;
        self.hero.defMult /= hero.equipPos4.defMult;
        hero.equipPos4 = nil;
        
        [self touchedBack];
        [self updateTaggedStuff];
    }
    if (showItemLayer.position == 5)
    {
        NSMutableArray *array = [hero.heroInventory mutableCopy];
        BOOL shouldAddItem = YES;
        for (int i = 0; i < array.count; i++)
        {
            if (((Item*)[array objectAtIndex:i]).itemCode == hero.equipPos5.itemCode)
            {
                ((Item*)[array objectAtIndex:i]).itemCount++;
                shouldAddItem = NO;
                break;
            }
        }
        if (shouldAddItem)
        {
            [array addObject:(hero.equipPos5)];
        }
        hero.itemInPos5 = NO;
        hero.heroInventory = array;
        
        self.hero.aglBonus -= hero.equipPos5.aglBonus;
        self.hero.strBonus -= hero.equipPos5.strBonus;
        self.hero.defBonus -= hero.equipPos5.defBonus;
        self.hero.aglMult /= hero.equipPos5.aglMult;
        self.hero.strMult /= hero.equipPos5.strMult;
        self.hero.defMult /= hero.equipPos5.defMult;
        hero.equipPos5 = nil;
        
        [self touchedBack];
        [self updateTaggedStuff];
    }
    if (showItemLayer.position == 6)
    {
        NSMutableArray *array = [hero.heroInventory mutableCopy];
        BOOL shouldAddItem = YES;
        for (int i = 0; i < array.count; i++)
        {
            if (((Item*)[array objectAtIndex:i]).itemCode == hero.equipPos6.itemCode)
            {
                ((Item*)[array objectAtIndex:i]).itemCount++;
                shouldAddItem = NO;
                break;
            }
        }
        if (shouldAddItem)
        {
            [array addObject:(hero.equipPos6)];
        }
        hero.itemInPos6 = NO;
        hero.heroInventory = array;
        
        self.hero.aglBonus -= hero.equipPos6.aglBonus;
        self.hero.strBonus -= hero.equipPos6.strBonus;
        self.hero.defBonus -= hero.equipPos6.defBonus;
        self.hero.aglMult /= hero.equipPos6.aglMult;
        self.hero.strMult /= hero.equipPos6.strMult;
        self.hero.defMult /= hero.equipPos6.defMult;
        hero.equipPos6 = nil;
        
        [self touchedBack];
        [self updateTaggedStuff];
    }
    [MusicHandler playButtonClick];
    
}






@end










