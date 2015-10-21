//
//  Monster.h
//  Quest
//
//  Created by Leo Linsky on 5/20/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Item.h"

@interface Monster : NSObject

@property (nonatomic, retain) NSString *name;
@property (nonatomic, retain) NSString* imageFile;


@property (nonatomic, retain) NSString* backgroundImageFile;

@property (nonatomic, assign) int monsterStr;
@property (nonatomic, assign) int monsterMag;
@property (nonatomic, assign) int monsterStrDef;

@property (nonatomic, assign) int monsterLvl;
@property (nonatomic, assign) int monsterHP;
@property (nonatomic, assign) int monsterSpeed;
@property (nonatomic, assign) int monsterCurrentHP;


@property (nonatomic, copy) NSArray *monsterSkills;

@property (nonatomic, assign) int monsterExperience;
@property (nonatomic, assign) int monsterRewardGold;
@property (nonatomic, assign) int monsterRewardItem;
@property BOOL isBoss;

-(id)initWithCode:(int)code;

+(id)monsterWithCode:(int)code;

@end
