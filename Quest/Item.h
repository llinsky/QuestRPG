//
//  Item.h
//  Quest
//
//  Created by Leo Linsky on 5/19/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Item : NSObject <NSCoding>

@property (nonatomic, retain) NSString *name;
@property int itemCode;
@property int itemCount;

@property int itemTextColor; //0: white/black, 1:red, 2:green, 3:blue

@property (nonatomic, assign) int goldValue;

@property (nonatomic, assign) int sellGoldValue;

@property (nonatomic, retain) NSString *image;
@property (nonatomic, retain) NSString *bigImage;
@property BOOL canThrowAway;
@property BOOL canEquip;
@property BOOL canUse;
@property BOOL canUseInBattle;

@property int strBonus, defBonus, magDefBonus, aglBonus;
@property double strMult, defMult, magDefMult, aglMult;

@property int equipCode;

@property (nonatomic, retain) NSString *description;

@property double goldMult, expMult;

@property (nonatomic, retain) NSArray *moveSet;


-(id)initWithItemCode:(int)code;




@end
