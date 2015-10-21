//
//  GameSceneManager.m
//  Quest
//
//  Created by Leo Linsky on 3/17/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "GameSceneManager.h"

@implementation GameSceneManager

@synthesize hero = _hero;

@synthesize justDied;
@synthesize usingVirtualControlPad;
@synthesize soundVolume,musicVolume,textSpeed;

@synthesize foundSavedGameData;
@synthesize menuMusic;

@synthesize saveFile;


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

+ (void) setGameSceneManager:(GameSceneManager *)singleton {
    sharedSingleton = [[self alloc] init];
    sharedSingleton.hero = singleton.hero;
    sharedSingleton.justDied = singleton.justDied;
    sharedSingleton.usingVirtualControlPad = singleton.usingVirtualControlPad;
    sharedSingleton.soundVolume = singleton.soundVolume;
    sharedSingleton.musicVolume = singleton.musicVolume;
    sharedSingleton.textSpeed = singleton.textSpeed;
    
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
        self.hero.heroName = @"Leonard";
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
        
        self.textSpeed = 25;
        self.musicVolume = 1;
        self.soundVolume = 1;
        //DELETE
        //self.hero.beatIonak = YES;
        //...
        self.saveFile = true;
    }
    return self;
}


- (id)initWithCoder:(NSCoder *)decoder {
    self = [super init];
    if(self) {
        self.saveFile = [decoder decodeBoolForKey:@"saveFile"];
        if (self.saveFile)
            return nil;
        
        self.hero = [decoder decodeObjectForKey:@"hero"];

        self.musicVolume = [decoder decodeFloatForKey:@"musicVolume"];
        self.soundVolume = [decoder decodeFloatForKey:@"soundVolume"];
        self.textSpeed = [decoder decodeIntForKey:@"textSpeed"];
        self.usingVirtualControlPad = [decoder decodeBoolForKey:@"usingVirtualControlPad"];
    }
    return self;
}

- (void)encodeWithCoder:(NSCoder *)encoder {
    sharedSingleton = [GameSceneManager sharedGameSceneManager];
    sharedSingleton.saveFile = true;
    [encoder encodeBool:sharedSingleton.saveFile forKey:@"saveFile"];
    [encoder encodeObject:sharedSingleton.hero forKey:@"hero"];
    
    [encoder encodeFloat:sharedSingleton.musicVolume forKey:@"musicVolume"];
    [encoder encodeFloat:sharedSingleton.soundVolume forKey:@"soundVolume"];
    [encoder encodeInt:sharedSingleton.textSpeed forKey:@"textSpeed"];
    [encoder encodeBool:sharedSingleton.usingVirtualControlPad forKey:@"usingVirtualControlPad"];
}


@end

