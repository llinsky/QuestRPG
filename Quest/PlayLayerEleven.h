//
//  PlayLayerEleven.h
//  Quest
//
//  Created by Leo Linsky on 2/17/14.
//
//

#import "Playlayer.h"

@interface PlayLayerEleven : PlayLayer

{
    CCAnimation *spriteGWalkLeft;
    CCAnimation *spriteGWalkRight;
    CCAnimation *spriteGWalkUp;
    CCAnimation *spriteGWalkDown;
    CCAnimation *spriteGWalkUp2;
    CCAnimation *spriteGWalkDown2;
    CCSpriteBatchNode *spriteGSheet;
}

@property (nonatomic, retain) CCSprite *item59;
@property (nonatomic, retain) CCSprite *item60;
@property (nonatomic, retain) CCSprite *item61;
@property (nonatomic, retain) CCSprite *item62;
@property (nonatomic, retain) CCSprite *item63;

@property (nonatomic, retain) CCSprite *boss8;
@property (nonatomic, retain) CCSprite *boss9;
@property (nonatomic, retain) CCSprite *boss10;

@property (nonatomic, retain) InteractiveSprite *sprite130;

-(void) updateSprite130;

-(void) moveleftSprite130;
-(void) moverightSprite130;
-(void) moveupSprite130;
-(void) movedownSprite130;
-(void) finishActionSprite130;

-(void) pickedUpItem:(int)itemCode;
-(void) givenItem:(int)itemCode;
-(void) goGate:(int)gate;


//OVERRIDDEN METHODS
- (void) setPlayerPosition: (CGPoint) point;
- (void) dsetPlayerPosition: (CGPoint) point;
-(void) pressedA;
-(void) saveHero;



@end


