//
//  PlayLayerFive.h
//  Quest
//
//  Created by Leo Linsky on 1/13/14.
//
//

#import "PlayLayer.h"
#import "CCParticleSystem.h"

@interface PlayLayerFive : PlayLayer
{
    CCAnimation *spriteLWalkLeft;
    CCAnimation *spriteLWalkRight;
    CCAnimation *spriteLWalkUp;
    CCAnimation *spriteLWalkDown;
    CCAnimation *spriteLWalkUp2;
    CCAnimation *spriteLWalkDown2;
    CCSpriteBatchNode *spriteLSheet;
}


@property (nonatomic, retain) InteractiveSprite *sprite89;

@property (nonatomic, retain) CCSprite *item17;
@property (nonatomic, retain) CCSprite *item18;
@property (nonatomic, retain) CCSprite *item19;
@property (nonatomic, retain) CCSprite *item20;
@property (nonatomic, retain) CCSprite *item21;
@property (nonatomic, retain) CCSprite *item22;
@property (nonatomic, retain) CCSprite *item23;
@property (nonatomic, retain) CCSprite *item24;

@property (nonatomic, retain) CCSprite *boss3_1;
@property (nonatomic, retain) CCSprite *boss3_2;
@property (nonatomic, retain) CCSprite *boss3_3;
@property (nonatomic, retain) CCSprite *boss4;


-(void) updateSprite89;

-(void) moveleftSprite89;
-(void) moverightSprite89;
-(void) moveupSprite89;
-(void) movedownSprite89;
-(void) finishActionSprite89;



-(void) pickedUpItem:(int)itemCode;
-(void) givenItem:(int)itemCode;
-(void) goGate:(int)gate;


-(void) removeBoss4;


//OVERRIDDEN METHODS
- (void) setPlayerPosition: (CGPoint) point;
- (void) dsetPlayerPosition: (CGPoint) point;
-(void) pressedA;
-(void) saveHero;

-(void)startSnow;


@end









