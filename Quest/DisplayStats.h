//
//  DisplayStats.h
//  Quest
//
//  Created by Leo Linsky on 5/19/12.
//  Copyright 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "cocos2d.h"
#import "MyHero.h"

@interface DisplayStats : CCLayer {
}

@property (nonatomic, retain) MyHero *hero;

-(void)addStrength:(id)sender;
-(void)addDefense:(id)sender;
-(void)addAgility:(id)sender;
-(void)addHP:(id)sender;

-(void) updateTaggedStuff;


-(int) expTillNextLevel;

-(double) maxExpTillNextLevel;

-(void)goMainMenu;

@end
