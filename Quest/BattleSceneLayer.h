//
//  BattleSceneLayer.h
//  Quest
//
//  Created by Leo Linsky on 3/17/12.
//  Copyright 2012 __MyCompanyName__. All rights reserved.
//

/*

#import <Foundation/Foundation.h>
#import "cocos2d.h"
#import "SceneManager.h"
#import "MusicHandler.h"
#import "InGameMenu.h"
#import "PlayLayer.h"
#import "MenuLayer.h"
#import "Monster.h"
#import "GameSceneManager.h"
#import "TextBox.h"
#import "TextBoxLayer.h"
#import "MyHero.h"


@interface BattleSceneLayer : CCLayer <TextBoxDelegate> {
    
    TextBoxLayer *textBoxLayer;
    CCSprite *enemySprite;
    
    CCMenuItemImage *aggr;
    CCMenuItemImage *quick;
    CCMenuItemImage *def;
    
    CCSprite *heroSprite;
    
    BOOL willAttack; //(vs. use item)
    
    BOOL heroMissed;
    BOOL monsterMissed;
    BOOL heroMovesFirst;

}

@property (nonatomic, assign) int battleID;

@property (nonatomic, retain) Monster* enemy;
@property (nonatomic, retain) MyHero *hero;

@property BOOL battleIsStillGoing;
@property int battleCycleStatus;


@property BOOL textPresent;


@property BOOL battleCycleBusy;

@property int heroMoveCode;
@property int itemUseCode;

@property BOOL canTouchButtons;


@property int enemyAttackID;


@property BOOL textCanCycle;




@property int tempDamageDealt;




- (id)init;

-(void) scheduleBattleCycle;


-(void) startBattle: (int) battleSceneID;
-(void) battleCycle;
-(void) battleCycle2:(int)heroMoveCode;

-(void) onAttack; //later add a button to change attack style, like stab, slash, defensive, crush, etc, or just aggressive, defensive
-(void) onEnemy;


-(void) onAggressive;
-(void) onQuick;
-(void) onDefensive;
  

-(void) heroGetsAttacked1;
-(void) heroGetsAttacked2;
-(void) enemyGetsAttacked1;
-(void) enemyGetsAttacked2;


-(void) bothHeroFirstAttack1:(int)enemyDamageDone;
-(void) bothHeroFirstAttack2;
-(void) bothHeroFirstAttack3;
-(void) bothHeroFirstAttack4;
-(void) bothHeroLastAttack1:(int)heroDamageDone;
-(void) bothHeroLastAttack2;
-(void) bothHeroLastAttack3;
-(void) bothHeroLastAttack4;



-(void) goBackGame: (id) sender;




-(int) levelForExp:(int)exp;

-(void) levelFrom:(int)oldLevel ToLevel:(int)newLevel;



-(void) gameLoop: (ccTime) dT;


-(void) heroDies;
-(void) heroWins;



@end

*/