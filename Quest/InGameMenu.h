//
//  InGameMenu.h
//  Quest
//
//  Created by Leo Linsky on 3/17/12.
//  Copyright 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "cocos2d.h"
#import "SceneManager.h"
#import "MusicHandler.h"
#import "TextBox.h"
#import "TextBoxLayer.h"
#import "BoolLayer.h"
#import "DPad.h"
//#import "PlayLayer.h"

@class PlayLayer;

@interface InGameMenu : CCLayer <TextBoxDelegate> {
    PlayLayer *layer;
    
    TextBoxLayer *textBoxLayer;
    
    int currentTextCode;
    
    CCAnimation *heroWalkLeft;
    CCAnimation *heroWalkRight;
    CCAnimation *heroWalkUp;
    CCAnimation *heroWalkDown;
    CCAnimation *heroWalkUp2;
    CCAnimation *heroWalkDown2;
    CCSpriteBatchNode *spriteSheet1;
    
    BoolLayer *bModal;
    BOOL bModalIsShowing;
    
    CCSprite *_bear;
    CCAction *_walkAction;
    CCAction *_moveAction;
    BOOL _moving;
    
    DPad *dPad;
    
    BOOL _isBackground;
}
    // Add after the HelloWorld interface
@property (nonatomic, retain) CCSprite *bear;
@property (nonatomic, retain) CCAction *walkAction;
@property (nonatomic, retain) CCAction *moveAction;



@property (nonatomic, retain) CCSprite *spriteHero;


@property BOOL textPresent;

@property (nonatomic, retain) PlayLayer *layer;

-(void) onBackClick: (id) sender;

-(id)initAsBackground;
+(id) nodeAsBackground;


-(void) clickButtonA: (id) sender;


-(void) displayModal: (int) modalID;

-(void) displayBattleScene: (int) battleSceneID;

-(void) showText: (int) textCode;
-(void) showText: (int) textCode spriteCode:(int)code;

-(void) gameLoop: (ccTime) dT;

-(void)pressedYes;
-(void)pressedNo;
-(void)showBModal;

-(void)updateDPad;
@property BOOL isInMotion;

-(void)updateHealth;

-(void) animateHero;
-(void) updateSprite;

-(void) startRain;
-(void) startSnow;

@end
