//
//  BattleEngineLayer.h
//  Quest
//
//  Created by Leo Linsky on 7/15/12.
//  Copyright 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "cocos2d.h"
#import "SceneManager.h"
#import "MusicHandler.h"
#import "InGameMenu.h"
#import "PlayLayer.h"
#import "Monster.h"
#import "GameSceneManager.h"
#import "TextBox.h"
#import "TextBoxLayer.h"
#import "MyHero.h"
#import "Item.h"
#import "DisplayBattleItems.h"

@interface BattleEngineLayer : CCLayer <TextBoxDelegate> {
    
    TextBoxLayer *textBoxLayer;
    CCSprite *enemySprite;
    CCSprite *heroSprite;
    
    CCMenuItemImage *aggr;
    CCMenuItemImage *quick;
    CCMenuItemImage *def; 
    
    CCSprite *hpBar;
    CCSprite *hpBarCover;
    CCLabelTTF *hpLabel;
    
    BOOL heroMissed;
    BOOL monsterMissed;
    BOOL heroMovesFirst;
    
    BOOL willAttack;
    BOOL willFlee;
    BOOL willItem;
    
    int plusHP;
    int plusStr;
    int plusDef;
    int plusAgi;
    int plusFP;
    int plusAttrib;
    
    BOOL animationBusy;
    
    
    double inBattleGoldMult;
    double inBattleExpMult;
    
    BOOL canAttackAgain;
    int lastDamageDealtByMe;
    int lastDamageDealtByEnemy;
    
    
    BOOL isShowingItemScreen;
    
    DisplayBattleItems *itemDisplay;

    int currentItemCode;
    
    double tempStrMult;
    double tempDefMult;
    double tempAgiMult;
    
    BOOL escapeFailed;
    
    BOOL won;
    int wonOnCycle;
}

@property (nonatomic, assign) int battleID;

@property (nonatomic, retain) Monster* enemy;
@property (nonatomic, retain) MyHero *hero;

@property BOOL battleIsStillGoing;
@property int battleCycleStatus;

@property BOOL canTouchButtons;
@property int heroMoveCode;
@property BOOL textPresent;



@property BOOL isArenaBattle;
@property BOOL isBossBattle;











-(void) startBattle: (int) battleSceneID;
-(void) battleCycle;

-(void) onAttack;
-(void) onEnemy;
-(void) onAggressive;
-(void) onQuick;
-(void) onDefensive;
-(void) goBackGame: (id) sender;

-(void) onItem;
-(void) onFlee;

-(void) animateHeroGetsAttacked;
-(void) animateEnemyGetsAttacked;

-(int) levelForExp:(int)exp;
-(void) levelFrom:(int)oldLevel ToLevel:(int)newLevel;

-(void) heroDies;

-(void) playAttackSound;

-(void) letTextGoAway;

-(void) updateHP:(int)newHP;
-(void) updateHPLabelTo:(int)newVal WithTime:(double)time;



-(void) gameLoop: (ccTime) dT;






-(void)touchedBack;




// later, after I figure out how to make a modal item menu.
-(void) itemCycle:(int)itemCode;
-(void) fleeCycle;


@end








