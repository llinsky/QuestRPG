//
//  DisplayStats.m
//  Quest
//
//  Created by Leo Linsky on 5/19/12.
//  Copyright 2012 __MyCompanyName__. All rights reserved.
//

#import "DisplayStats.h"
#import "MyHero.h"
#import "GameSceneManager.h"
#import "MusicHandler.h"
@class RealInGameMenu;

@implementation DisplayStats

@synthesize hero;

-(id) init
{
	
	if ((self = [super init])) {
		CGSize winSize = [[CCDirector sharedDirector] winSize];
        
        self.hero = [GameSceneManager sharedGameSceneManager].hero;
        [hero release];
        
        CCSprite *statsback = [CCSprite spriteWithFile: @"statsback3.png"];
		statsback.position = ccp(winSize.width/2,winSize.height/2 + 20);
		[self addChild:statsback z:2];
        
        CCSprite *statswayback = [CCSprite spriteWithFile: @"statsback4.png"];
		statswayback.position = ccp(winSize.width/2,winSize.height/2);
		[self addChild:statswayback z:0];
        
        
        
        CCSprite *statsbar = [CCSprite spriteWithFile: @"statslevelbar2.png"];
        double min = winSize.width/2 + 70;
        double temp1 = [self maxExpTillNextLevel];
        double temp2 = [self expTillNextLevel];
        double temp3 = (temp1 - temp2)/temp1 * 97;
        min += temp3;
        int temp4 = (int)min;
        
		statsbar.position = ccp(temp4,winSize.height/2 + 11);
		[self addChild:statsbar z:1];
        
        
        
        CCMenuItemImage *buttonA = [CCMenuItemImage itemFromNormalImage:@"statsplussign1.png" selectedImage:@"statsplussign1_pressed.png" target:self selector:@selector(addStrength:)];
		//buttonA.position = ccp(winSize.width/2 - 160, winSize.height/2 + 120);
        CCMenuItemImage *buttonB = [CCMenuItemImage itemFromNormalImage:@"statsplussign1.png" selectedImage:@"statsplussign1_pressed.png" target:self selector:@selector(addDefense:)];
		//buttonB.position = ccp(winSize.width/2 - 160, winSize.height/2 + 90);
        CCMenuItemImage *buttonC = [CCMenuItemImage itemFromNormalImage:@"statsplussign1.png" selectedImage:@"statsplussign1_pressed.png" target:self selector:@selector(addAgility:)];
		//buttonC.position = ccp(winSize.width/2 - 160, winSize.height/2 + 60);
        CCMenuItemImage *buttonD = [CCMenuItemImage itemFromNormalImage:@"statsplussign1.png" selectedImage:@"statsplussign1_pressed.png" target:self selector:@selector(addHP:)];
		//buttonD.position = ccp(winSize.width/2 - 160, winSize.height/2 + 30);
		
        CCMenu *Amenu = [CCMenu menuWithItems:buttonA, buttonB, buttonC, buttonD, nil];
        
        [Amenu alignItemsVerticallyWithPadding:10.0];
        Amenu.position = ccp(winSize.width/2 - 210, winSize.height/2 + 26);
        [self addChild:Amenu z:90];
		
        /*
		CCSprite *background = [CCSprite spriteWithFile: @"pinktemp3.png"];
		background.position = ccp(winSize.width/2 - 80, winSize.height/2 + 60);
		[self addChild:background z:14];
        */
        
        //The tag will be for updating the labels when you use your free points
        
        CCLabelTTF *label0 = [CCLabelTTF labelWithString:[NSString stringWithFormat:@"Strength: %d", hero.heroStr] dimensions: CGSizeMake(140, 30) alignment:UITextAlignmentLeft fontName:@"Optima-Bold" fontSize:20.0];
        label0.position = ccp(winSize.width/2 - 110, winSize.height/2 + 87);
        label0.color = ccc3(160, 0, 0);
        [self addChild: label0 z:15 tag:21];
        
        
        CCLabelTTF *label1 = [CCLabelTTF labelWithString:[NSString stringWithFormat:@"Defense: %d", hero.heroStrDef] dimensions: CGSizeMake(140, 30) alignment:UITextAlignmentLeft fontName:@"Optima-Bold" fontSize:20.0];
        label1.position = ccp(winSize.width/2 - 110, winSize.height/2 + 45);
        label1.color = ccc3(160, 0, 0);
        [self addChild: label1 z:15 tag:22];
        
        CCLabelTTF *label2 = [CCLabelTTF labelWithString:[NSString stringWithFormat:@"Agility: %d", hero.heroSPD] dimensions: CGSizeMake(140, 30) alignment:UITextAlignmentLeft fontName:@"Optima-Bold" fontSize:20.0];
        label2.position = ccp(winSize.width/2 - 110, winSize.height/2 + 3);
        label2.color = ccc3(160, 0, 0);
        [self addChild: label2 z:15 tag:23];
        
        
        CCLabelTTF *label3 = [CCLabelTTF labelWithString:[NSString stringWithFormat:@"HP: %d/%d", hero.heroCurrentHP, hero.heroHP] dimensions: CGSizeMake(140, 30) alignment:UITextAlignmentLeft fontName:@"Optima-Bold" fontSize:20.0];
        label3.position = ccp(winSize.width/2 - 110, winSize.height/2 - 39);
        label3.color = ccc3(160, 0, 0);
        [self addChild: label3 z:15 tag:24];
        
        
        
        
        
        CCLabelTTF *label4 = [CCLabelTTF labelWithString:[NSString stringWithFormat:@"Skill Points: %d", hero.freePoints] dimensions: CGSizeMake(150, 34) alignment:UITextAlignmentLeft fontName:@"Optima-Bold" fontSize:20.0];
        label4.position = ccp(winSize.width/2 - 140 , winSize.height/2 - 83);
        label4.color = ccc3(160, 0, 0);
        [self addChild: label4 z:15 tag:25];
        
        
        
        
        
        CCLabelTTF *label9 = [CCLabelTTF labelWithString:[NSString stringWithFormat:@"Attribute Points: %d", hero.attributePoints] dimensions: CGSizeMake(180, 34) alignment:UITextAlignmentLeft fontName:@"Optima-Bold" fontSize:20.0];
        label9.position = ccp(winSize.width/2 + 150, winSize.height/2 - 90);
        label9.color = ccc3(0, 0, 255);
        [self addChild: label9 z:15];
        
        
        
        
        CCLabelTTF *label5 = [CCLabelTTF labelWithString:[NSString stringWithFormat:@"Total Exp: %d", hero.exp] dimensions: CGSizeMake(170, 30) alignment:UITextAlignmentLeft fontName:@"Optima-Bold" fontSize:18.0];
        label5.position = ccp(winSize.width/2 + 170, winSize.height/2 - 25);
        label5.color = ccc3(0, 0, 0);
        [self addChild: label5 z:15 tag:27];
        
        int nextExp = [self expTillNextLevel];
        CCLabelTTF *label6 = [CCLabelTTF labelWithString:[NSString stringWithFormat:@"Next Level: %d", nextExp] dimensions: CGSizeMake(170, 30) alignment:UITextAlignmentLeft fontName:@"Optima-Bold" fontSize:18.0];
        label6.position = ccp(winSize.width/2 + 170, winSize.height/2 - 49);
        label6.color = ccc3(0, 0, 0);
        [self addChild: label6 z:15 tag:26];
        
        
        
        CCLabelTTF *label010 = [CCLabelTTF labelWithString:[NSString stringWithFormat:@"%d/%d to Lvl %d", ((int)(temp1-temp2)),((int)(temp1)),(hero.heroLvl+1)] dimensions: CGSizeMake(170, 32) alignment:UITextAlignmentLeft fontName:@"Optima-Bold" fontSize:20.0];
        label010.position = ccp(winSize.width/2 + 170, winSize.height/2 + 25);
        label010.color = ccc3(0, 0, 0);
        [self addChild: label010 z:15];
        
        
        
        
        
        
        CCLabelTTF *label00 = [CCLabelTTF labelWithString:[NSString stringWithFormat:@"%@", hero.heroName] dimensions: CGSizeMake(180, 34) alignment:UITextAlignmentLeft fontName:@"Optima-Bold" fontSize:29.0];
        label00.position = ccp(winSize.width/2 + 59, winSize.height/2 + 142);
        label00.color = ccc3(0, 0, 0);
        [self addChild: label00 z:15];
        
        CCLabelTTF *label01 = [CCLabelTTF labelWithString:[NSString stringWithFormat:@"Level %d", hero.heroLvl] dimensions: CGSizeMake(140, 30) alignment:UITextAlignmentLeft fontName:@"Optima-Bold" fontSize:15.0];
        label01.position = ccp(winSize.width/2 + 39, winSize.height/2 + 108);
        label01.color = ccc3(0, 0, 0);
        [self addChild: label01 z:15];
        
        
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
        
        
        
        CCMenuItemImage *backToMenu = [CCMenuItemImage itemFromNormalImage:@"exitmenu2.png" selectedImage:@"exitmenu2_pressed.png" target:self selector:@selector(goMainMenu)];
        CCMenu *menu = [CCMenu menuWithItems:backToMenu, nil];
        
        menu.position = ccp(winSize.width/2,150);
        [self addChild:menu z:100];
        
	}
	
	return self;
}



-(void)addStrength:(id)sender
{
    if (hero.freePoints > 0)
    {
        hero.heroStr += 1;
        hero.freePoints -= 1;
        [MusicHandler playButtonClick];
        [self updateTaggedStuff];
    }
    else
    {
        [MusicHandler playButtonClick];
    }
}
-(void)addDefense:(id)sender
{
    if (hero.freePoints > 0)
    {
        hero.heroStrDef += 1;
        hero.freePoints -= 1;
        [MusicHandler playButtonClick];
        [self updateTaggedStuff];
    }
    else
    {
        [MusicHandler playButtonClick];
    }
}
-(void)addAgility:(id)sender
{
    if (hero.freePoints > 0)
    {
        hero.heroSPD += 1;
        hero.freePoints -= 1;
        [MusicHandler playButtonClick];
        [self updateTaggedStuff];
    }
    else
    {
        [MusicHandler playButtonClick];
    }
}
-(void)addHP:(id)sender
{
    if (hero.freePoints > 0)
    {
        hero.heroHP += 1;
        hero.heroCurrentHP += 1;
        hero.freePoints -= 1;
        [MusicHandler playButtonClick];
        [self updateTaggedStuff];
    }
    else
    {
        [MusicHandler playButtonClick];
    }
}



-(void)updateTaggedStuff
{
    [GameSceneManager sharedGameSceneManager].hero = hero;
    
    [self removeChildByTag:21 cleanup:YES];
    [self removeChildByTag:22 cleanup:YES];
    [self removeChildByTag:23 cleanup:YES];
    [self removeChildByTag:24 cleanup:YES];
    [self removeChildByTag:25 cleanup:YES];
    [self removeChildByTag:26 cleanup:YES];
    [self removeChildByTag:27 cleanup:YES];
    [self removeChildByTag:60 cleanup:YES];
    
    
    CGSize winSize = [[CCDirector sharedDirector] winSize];
    
    
    
    
    CCLabelTTF *label0 = [CCLabelTTF labelWithString:[NSString stringWithFormat:@"Strength: %d", hero.heroStr] dimensions: CGSizeMake(140, 30) alignment:UITextAlignmentLeft fontName:@"Optima-Bold" fontSize:20.0];
    label0.position = ccp(winSize.width/2 - 110, winSize.height/2 + 87);
    label0.color = ccc3(160, 0, 0);
    [self addChild: label0 z:15 tag:21];
    
    
    CCLabelTTF *label1 = [CCLabelTTF labelWithString:[NSString stringWithFormat:@"Defense: %d", hero.heroStrDef] dimensions: CGSizeMake(140, 30) alignment:UITextAlignmentLeft fontName:@"Optima-Bold" fontSize:20.0];
    label1.position = ccp(winSize.width/2 - 110, winSize.height/2 + 45);
    label1.color = ccc3(160, 0, 0);
    [self addChild: label1 z:15 tag:22];
    
    CCLabelTTF *label2 = [CCLabelTTF labelWithString:[NSString stringWithFormat:@"Agility: %d", hero.heroSPD] dimensions: CGSizeMake(140, 30) alignment:UITextAlignmentLeft fontName:@"Optima-Bold" fontSize:20.0];
    label2.position = ccp(winSize.width/2 - 110, winSize.height/2 + 3);
    label2.color = ccc3(160, 0, 0);
    [self addChild: label2 z:15 tag:23];
    
    
    CCLabelTTF *label3 = [CCLabelTTF labelWithString:[NSString stringWithFormat:@"HP: %d/%d", hero.heroCurrentHP, hero.heroHP] dimensions: CGSizeMake(140, 30) alignment:UITextAlignmentLeft fontName:@"Optima-Bold" fontSize:20.0];
    label3.position = ccp(winSize.width/2 - 110, winSize.height/2 - 39);
    label3.color = ccc3(160, 0, 0);
    [self addChild: label3 z:15 tag:24];
    
    
    
    
    
    
    CCLabelTTF *label4 = [CCLabelTTF labelWithString:[NSString stringWithFormat:@"Skill Points: %d", hero.freePoints] dimensions: CGSizeMake(150, 34) alignment:UITextAlignmentLeft fontName:@"Optima-Bold" fontSize:20.0];
    label4.position = ccp(winSize.width/2 - 140 , winSize.height/2 - 83);
    label4.color = ccc3(160, 0, 0);
    [self addChild: label4 z:15 tag:25];
    
    
    
    
    
    
    CCLabelTTF *label5 = [CCLabelTTF labelWithString:[NSString stringWithFormat:@"Total Exp: %d", hero.exp] dimensions: CGSizeMake(170, 30) alignment:UITextAlignmentLeft fontName:@"Optima-Bold" fontSize:18.0];
    label5.position = ccp(winSize.width/2 + 170, winSize.height/2 - 25);
    label5.color = ccc3(0, 0, 0);
    [self addChild: label5 z:15 tag:27];
    
    int nextExp = [self expTillNextLevel];
    CCLabelTTF *label6 = [CCLabelTTF labelWithString:[NSString stringWithFormat:@"Next Level: %d", nextExp] dimensions: CGSizeMake(170, 30) alignment:UITextAlignmentLeft fontName:@"Optima-Bold" fontSize:18.0];
    label6.position = ccp(winSize.width/2 + 170, winSize.height/2 - 49);
    label6.color = ccc3(0, 0, 0);
    [self addChild: label6 z:15 tag:26];
    
    
    
    
    CCLabelTTF *label02 = [CCLabelTTF labelWithString:[NSString stringWithFormat:@"%dG", hero.gold] dimensions: CGSizeMake(140, 30) alignment:UITextAlignmentLeft fontName:@"Optima-Bold" fontSize:18.0];
    label02.position = ccp(98, winSize.height - 20);
    label02.color = ccc3(255, 255, 255);
    [self addChild: label02 z:15 tag:60];
}





-(int) expTillNextLevel
{
    int level = self.hero.heroLvl;
    int tempExp = self.hero.exp;
    int nextExp = 0;
    int expTill = 0;
    
    if (level == 1)
    {
        nextExp = 10;
        expTill = nextExp - tempExp;
    }
    if (level == 2)
    {
        nextExp = 25;
        expTill = nextExp - tempExp;
    }
    if (level == 3)
    {
        nextExp = 50;
        expTill = nextExp - tempExp;
    }
    if (level == 4)
    {
        nextExp = 90;
        expTill = nextExp - tempExp;
    }
    if (level == 5)
    {
        nextExp = 150;
        expTill = nextExp - tempExp;
    }
    if (level == 6)
    {
        nextExp = 240;
        expTill = nextExp - tempExp;
    }
    if (level == 7)
    {
        nextExp = 400;
        expTill = nextExp - tempExp;
    }
    if (level == 8)
    {
        nextExp = 600;
        expTill = nextExp - tempExp;
    }
    if (level == 9)
    {
        nextExp = 950;
        expTill = nextExp - tempExp;
    }
    if (level == 10)
    {
        nextExp = 1500;
        expTill = nextExp - tempExp;
    }
    if (level == 11)
    {
        nextExp = 2200;
        expTill = nextExp - tempExp;
    }
    
    return expTill;
}


-(double) maxExpTillNextLevel
{
    int level = self.hero.heroLvl;
    double maxexpTill = 0;
    
    if (level == 1)
    {
        maxexpTill = 10;
    }
    if (level == 2)
    {
        maxexpTill = 25 - 10;
    }
    if (level == 3)
    {
        maxexpTill = 50 - 25;
    }
    if (level == 4)
    {
        maxexpTill = 90 - 50;
    }
    if (level == 5)
    {
        maxexpTill = 150 - 90;
    }
    if (level == 6)
    {
        maxexpTill = 240 - 150;
    }
    if (level == 7)
    {
        maxexpTill = 400 - 240;
    }
    if (level == 8)
    {
        maxexpTill = 600 - 400;
    }
    if (level == 9)
    {
        maxexpTill = 950 - 600;
    }
    if (level == 10)
    {
        maxexpTill = 1500 - 950;
    }
    if (level == 11)
    {
        maxexpTill = 2200 - 1500;
    }
    
    return maxexpTill;
}

-(void)goMainMenu
{
    [((RealInGameMenu*)(self.parent)) goBackMenu];
    
    return;
}




@end










