//
//  GameSceneManager.m
//  Quest
//
//  Created by Leo Linsky on 3/17/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "GameSceneManager.h"

USING_NS_CC;

@implementation GameSceneManager

@synthesize hero = _hero;

@synthesize justDied;
@synthesize usingVirtualControlPad;


static GameSceneManager *sharedSingleton;

+ (GameSceneManager*) sharedGameSceneManager {
    if (sharedSingleton)
        return sharedSingleton;
    @synchronized(self) {
        if (sharedSingleton == nil) {
            sharedSingleton = [[self alloc] init];
        }
    }
    return sharedSingleton;
}

- (id)init {
    self = [super init];
    if (self) {
        
        _hero = [[MyHero alloc] init];
        self.hero.gold = 5;
        self.hero.heroStr = 8;
        self.hero.heroHP = 12;
        self.hero.heroStrDef = 6;
        self.hero.freePoints = 0;
        self.hero.heroOrientation = 1;
        self.hero.heroName = @"Leo";
        self.hero.heroLvl = 1;
        self.hero.exp = 0;
        self.hero.attributePoints = 0;
        self.hero.heroSPD = 6;
        self.hero.heroCurrentHP = self.hero.heroHP;
        
        self.hero.strMult = 1.0;
        self.hero.strBonus = 0;
        self.hero.aglMult = 1.0;
        self.hero.aglBonus = 0;
        self.hero.defMult = 1.0;
        self.hero.defBonus = 0;
        
        self.hero.attribAgiMult = 1.0;
        self.hero.attribStrMult = 1.0;
        self.hero.attribDefMult = 1.0;
        
        
        self.hero.heroAtkStyle = 1;
        
        self.hero.heroInventory = [NSArray array];
        
        self.hero.itemInPos1 = NO;
        self.hero.itemInPos2 = NO;
        self.hero.itemInPos3 = NO;
        self.hero.itemInPos4 = NO;
        self.hero.itemInPos5 = NO;
        self.hero.itemInPos6 = NO;
        
        
        CGPoint point = ccp(0,0);
        self.hero.position = point;
        self.hero.mapInitMode = 1;
        
        self.hero.itemGoldMult = 1.0;
        self.hero.itemExpMult = 1.0;
        
        self.hero.attribGoldMult = 1.0;
        self.hero.attribExpMult = 1.0;
        
        self.hero.beatBoss1 = NO;
        
        justDied = NO;
        usingVirtualControlPad = YES;
        
        self.hero.mapInitMode = 5;
        self.hero.currentMap = 1;
        
        self.hero.freePoints = 50;
        self.hero.attributePoints = 50;
        
        self.hero.freeSteps = 0;
        
        
        //DELETE
        //self.hero.beatIonak = YES;
        //...
    }
    return self;
}



@end

