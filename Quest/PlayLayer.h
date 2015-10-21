//
//  PlayLayer.h
//  Quest
//
//  Created by Leo Linsky on 3/17/12.
//  Copyright 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "cocos2d.h"
#import "SceneManager.h"
#import "MusicHandler.h"
#import "InGameMenu.h"
#import "GameSceneManager.h"
#import "MyHero.h"
#import "HKTMXTiledMap.h"
#import "InteractiveSprite.h"

#import "CCTMXTiledMap.h"

@interface PlayLayer : CCLayer 

{
    CCSprite *guy;
    
    CGPoint tempPos;
    BOOL centeredScreen;

    int currentBID;
    int currentShopCode;
    
    HKTMXTiledMap *_theHKMap;
    
    BOOL isBeingTouched;
    
    BOOL canRespondToTouch;
    
    CGPoint tempLocation;
    
    CGPoint tempLocation2;
    //ANIMATION
    int spriteOrientation;
    // 1 is down, 2 is up, 3 is right, 4 is left
    
    BOOL lastRight;
    
    int currentlyPlayingMusic;
    
    
    InGameMenu *_myHUD;
    
    MyHero *_hero;
    
    BOOL _textPresent;
    
    
    //
    CCAnimation *heroWalkLeft;
    CCAnimation *heroWalkRight;
    CCAnimation *heroWalkUp;
    CCAnimation *heroWalkDown;
    CCAnimation *heroWalkUp2;
    CCAnimation *heroWalkDown2;
    CCSpriteBatchNode *spriteSheet;
    //
    
    
    int prev;
}



//-(void)moveMap;


@property BOOL textPresent;

@property (nonatomic, retain) MyHero* hero;
@property (nonatomic, assign) int spriteOrientation;
@property BOOL willBattle;

- (id) init;

@property BOOL lastRight;
@property BOOL canRespondToTouch;
@property BOOL isBeingTouched;
@property CGPoint tempLocation;
@property CGPoint tempLocation2;
@property (nonatomic, retain) UITouch *tempTouch;

@property BOOL doneMove;

@property (nonatomic, retain) HKTMXTiledMap *theHKMap;
@property (nonatomic, retain) HKTMXLayer *bgLayer;
@property (nonatomic, retain) HKTMXLayer *clLayer;


@property (nonatomic, retain) CCSprite *guy;
//
//@property (nonatomic, retain) CCSprite *actualGuy;
//
@property (nonatomic, assign) InGameMenu *myHUD;





+(CCScene*) scene;

- (void) setPlayerPosition: (CGPoint) point;

-(void) setCenterOfScreen: (CGPoint) position;

- (CGPoint) tileCoordForPosition: (CGPoint) point;

-(void) toggleTouchEnabled;

-(void) moveSprite: (CGPoint) position;






-(void) pressedA;

-(void) goBattle;//: (int) enemyCode;
-(void) goText: (int) textCode;
-(void) goText: (int) textCode sprite:(int)spriteCode;




-(void) enableTouch;
-(void) disableTouch;

-(void) saveHero;





@property BOOL sprite1LastRight;
@property BOOL spriteOddIsTalking;
@property BOOL spriteEvenIsTalking;


-(void) goShop:(int)shopCode;


@property BOOL isUsingDPad;
- (void) dmoveSprite: (CGPoint) position;
- (void) dsetPlayerPosition: (CGPoint) point;
- (void) dtoggleTouchEnabled;


-(void) changeMusic:(int)newCode;

-(void) removeItem:(int)itemIndex;

@property (nonatomic,assign) int currentBID;





@end





