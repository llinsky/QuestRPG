//
//  BattleLayer.h
//  Quest
//
//  Created by Leo Linsky on 3/17/14.
//
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

@interface BattleLayer : CCLayer <TextBoxDelegate>

{
    TextBoxLayer *textBoxLayer;
    CCSprite *enemySprite;
    CCSprite *heroSprite;
    
    CCMenuItemImage *styleA;
    CCMenuItemImage *styleB;
    CCMenuItemImage *styleC;
    
    CCSprite *hpBar;
    CCSprite *hpBarCover;
    CCLabelTTF *hpLabel;
    
    CCSprite *background;
    
    DisplayBattleItems *itemDisplay;
    BOOL isShowingItemScreen;
    
    int currentMove;
    int battleCycleStatus;
    
    bool isBossBattle;
    
    bool wonBattle;
    bool lostBattle;
    
    Monster* enemy;
    int BID;
    
    bool heroMovedFirst;
    
    
    double tempStrMultItem; //item multipliers
    double tempDefMultItem;
    double tempAgiMultItem;
    
    NSArray *moveSet;
    int currentStyle;
    double styleStrMult; //attack style multiplier
    double styleDefMult;
    double styleAgiMult;
    
    double inBattleGoldMult; // attrib gold/exp mults are separate
    double inBattleExpMult;
    
    //misc. multipliers - TBD (ex: enemy defense reduces as battle goes on, etc)
    double miscEnemyStrMult;
    double miscEnemyDefMult; //only planning on using this one right now
    double miscEnemyAgiMult;
    
    //Remember to update these in attach methods and init to 0
    int lastDamageDone;
    int lastDamageTaken;
    BOOL lastHitCritical; // by me, only hero hits critical hits
    
    int minEnemyDef; // = def/2
    int minEnemyStr; // = str/2
    
    int oldExp;
    
    int plusHP;
    int plusStr;
    int plusDef;
    int plusAgi;
    int plusFP;
    int plusAttrib;
}

@property (nonatomic, retain) MyHero *hero;

@property BOOL textPresent;
@property int currentItemCode;
@property BOOL canTouchButtons;
@property BOOL isUpdating;
@property BOOL animationBusy;

@property BOOL isBoss;

@property int currentAttackCode; //1-13, this will be obtained from the attack style button that was last pressed / the default




+(id)nodeWithBattleID:(int)BID; //DONE
-(id)initWithBattleID:(int)battleCode;

-(void)startBattle;


//This does one battle cycle; it is called by an event button (attack, use item, flee, etc)
-(void)doBattleCycle:(int)moveCode; //DONE

-(void)fleeCycle; //DONE
-(void)attackCycle; //DONE
-(void)itemCycle;

-(BOOL)canUseItem:(int)itemCode;

-(void)winCycle;

-(void)showText:(NSString*) string; //Functional

-(BOOL)tryEscape; //DONE

-(void)enemyAttack; //DONE
-(void)heroAttack; //DONE


//
//These methods inc battleCycle if they don't show text
-(void)atkEquipPos1;
-(void)atkEquipPos2;
-(void)atkEquipPos3;
-(void)atkEquipPos4;
-(void)atkEquipPos5;

-(void)defEquipPos1;
-(void)defEquipPos2;
-(void)defEquipPos3;
-(void)defEquipPos4;
-(void)defEquipPos5;






//////////////////// UPDATE THESE VALUES

-(void)enemyAttackAnimation;                    //str*1.0   //1
-(void)enemyScratchAnimation;                   //str*1.4   //2
-(void)enemyMaulAnimation;                      //str*2.0   //3
-(void)enemyBiteAnimation;                      //str*1.5   //4
-(void)enemyRamAnimation;                       //str*2.3   //5
-(void)enemyLashAnimation;                      //str*1.2   //6
-(void)enemySlashAnimation;                     //str*2.2   //7
-(void)enemyStabAnimation;                      //str*1.3   //8
-(void)enemyGustAnimation;          //magic     //str*2.8   //9
-(void)enemyCurseAnimation;         //magic     //str*2.5   //10
-(void)enemyFireAnimation;          //magic     //str*3.5   //11
-(void)enemyBlizzardAnimation;      //magic     //str*3.5   //12
-(void)enemyHealAnimation;          //heal by 1/8 HP        //13

-(void)enemyFinishAtkAnimation; // (This finishes an attack on you)


-(void)heroChargeAnimation;     //str *1.5 def *0.7 agi*1.0
-(void)heroKickAnimation;       //str *1.1 def *1.5 agi*0.9
-(void)heroPunchAnimation;      //str *1.0 def *1.0 agi*1.5
-(void)heroMeleeAnimation;      //str *1.5 def *1.0 agi*1.0
-(void)heroStabAnimation;       //str *1.4 def *1.3 agi*1.0
-(void)heroSliceAnimation;      //str *1.3 def *0.8 agi*1.7
-(void)heroChopAnimation;       //str *1.9 def *1.0 agi*1.0
-(void)heroCrushAnimation;      //str *2.5 def *0.8 agi*0.8
-(void)heroCleaveAnimation;     //str *2.0 def *1.2 agi*1.0
-(void)heroSlashAnimation;      //str *2.2 def *1.0 agi*1.8
-(void)heroFireSlashAnimation;  //str *2.6 def *1.0 agi*1.4
-(void)heroLightSlashAnimation; //str *2.8 def *1.0 agi*1.4
-(void)heroMagicSliceAnimation; //str *2.2 def *1.2 agi*1.6

// TODO: Shield / Helmet Effects
-(void)shieldBashAnimation;     //str *1.2 def *2.2 agi*1.0 //replaces second weapon attack
-(void)backSlashAnimation;      //str *1.6 def *2.0 agi*1.4 //replaces second weapon attack
-(void)headButtAnimation;       //str *1.8 def *0.6 agi*1.0 //replaces third weapon attack

-(void)heroFinishAtkAnimation; // (This finishes an attack on the enemy)


//Additional animations will be added for special effects, such as staffs, special items (leech), etc

-(void)heroBurnAnimation;
-(void)heroLeechAnimation;
-(void)heroWindStaffAnimation;
-(void)heroFireStaffAnimation;
-(void)heroIceStaffAnimation;










-(BOOL)doesHeroGoFirst;

//Damage done by hero -- WILL ONLY VERY RARELY RETURN 0
-(int)getAttackDamageHero;
//Tells if you missed or hit
-(BOOL)getAttackHitHero;

//Damage done by enemy -- WILL RARELY RETURN 0
-(int)getAttackDamageEnemy:(int)index;
-(BOOL)getAttackHitEnemy;

-(void)atkAttrib;
-(void)defAttrib;



-(void)heroDies;
-(void)heroWins;

-(void)die;

-(void) updateHP:(int)newHP;
-(void) updateHPLabelTo:(int)newVal WithTime:(double)time;
-(void) doneUpdating;
-(int) levelForExp:(int)exp;
-(void) levelFrom:(int)oldLevel ToLevel:(int)newLevel;

-(void) givenItem:(int)itemCode; //For bosses


-(void)letTextGoAway;

-(void)touchedBack;



//UI Methods
-(void)onAttack;
-(void)onStyleA;
-(void)onStyleB;
-(void)onStyleC;
-(void)onItem;
-(void)onFlee;
-(void)onEnemy;

//For debugging only
-(void) goBackGame; //skips out of battle

@end













