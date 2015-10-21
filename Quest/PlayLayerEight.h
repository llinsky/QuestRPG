//
//  PlayLayerEight.h
//  Quest
//
//  Created by Leo Linsky on 1/28/14.
//
//

#import "Playlayer.h"

@interface PlayLayerEight : PlayLayer

{
    int spriteCycleCount;
    
    CCAnimation *spriteGWalkLeft;
    CCAnimation *spriteGWalkRight;
    CCAnimation *spriteGWalkUp;
    CCAnimation *spriteGWalkDown;
    CCAnimation *spriteGWalkUp2;
    CCAnimation *spriteGWalkDown2;
    CCSpriteBatchNode *spriteGSheet;
    
    CCAnimation *spriteCWalkLeft;
    CCAnimation *spriteCWalkRight;
    CCAnimation *spriteCWalkUp;
    CCAnimation *spriteCWalkDown;
    CCAnimation *spriteCWalkUp2;
    CCAnimation *spriteCWalkDown2;
    CCSpriteBatchNode *spriteCSheet;
    
    CCAnimation *spriteSWalkLeft;
    CCAnimation *spriteSWalkRight;
    CCAnimation *spriteSWalkUp;
    CCAnimation *spriteSWalkDown;
    CCAnimation *spriteSWalkUp2;
    CCAnimation *spriteSWalkDown2;
    CCSpriteBatchNode *spriteSSheet;
    
    CCAnimation *spriteUWalkLeft;
    CCAnimation *spriteUWalkRight;
    CCAnimation *spriteUWalkUp;
    CCAnimation *spriteUWalkDown;
    CCAnimation *spriteUWalkUp2;
    CCAnimation *spriteUWalkDown2;
    CCSpriteBatchNode *spriteUSheet;
    
    CCAnimation *spriteYWalkLeft;
    CCAnimation *spriteYWalkRight;
    CCAnimation *spriteYWalkUp;
    CCAnimation *spriteYWalkDown;
    CCAnimation *spriteYWalkUp2;
    CCAnimation *spriteYWalkDown2;
    CCSpriteBatchNode *spriteYSheet;
    
    CCAnimation *spriteTWalkLeft;
    CCAnimation *spriteTWalkRight;
    CCAnimation *spriteTWalkUp;
    CCAnimation *spriteTWalkDown;
    CCAnimation *spriteTWalkUp2;
    CCAnimation *spriteTWalkDown2;
    CCSpriteBatchNode *spriteTSheet;
    
    CCAnimation *spriteIWalkLeft;
    CCAnimation *spriteIWalkRight;
    CCAnimation *spriteIWalkUp;
    CCAnimation *spriteIWalkDown;
    CCAnimation *spriteIWalkUp2;
    CCAnimation *spriteIWalkDown2;
    CCSpriteBatchNode *spriteISheet;
    
    CCAnimation *spriteZAWalkLeft;
    CCAnimation *spriteZAWalkRight;
    CCAnimation *spriteZAWalkUp;
    CCAnimation *spriteZAWalkDown;
    CCAnimation *spriteZAWalkUp2;
    CCAnimation *spriteZAWalkDown2;
    CCSpriteBatchNode *spriteZASheet;
    
}

@property (nonatomic, retain) CCSprite *item29;
@property (nonatomic, retain) CCSprite *item30;
@property (nonatomic, retain) CCSprite *item31;


@property (nonatomic, retain) InteractiveSprite *sprite120;
@property (nonatomic, retain) InteractiveSprite *sprite121;
@property (nonatomic, retain) InteractiveSprite *sprite122;
@property (nonatomic, retain) InteractiveSprite *sprite123;
@property (nonatomic, retain) InteractiveSprite *sprite124;
@property (nonatomic, retain) InteractiveSprite *sprite125;
@property (nonatomic, retain) InteractiveSprite *sprite126;
@property (nonatomic, retain) InteractiveSprite *sprite127;
@property (nonatomic, retain) InteractiveSprite *sprite128;
@property (nonatomic, retain) InteractiveSprite *sprite129;



-(void) updateSprite120;

-(void) moveleftSprite120;
-(void) moverightSprite120;
-(void) moveupSprite120;
-(void) movedownSprite120;
-(void) finishActionSprite120;

-(void) updateSprite121;

-(void) moveleftSprite121;
-(void) moverightSprite121;
-(void) moveupSprite121;
-(void) movedownSprite121;
-(void) finishActionSprite121;

-(void) updateSprite122;

-(void) moveleftSprite122;
-(void) moverightSprite122;
-(void) moveupSprite122;
-(void) movedownSprite122;
-(void) finishActionSprite122;

-(void) updateSprite123;

-(void) moveleftSprite123;
-(void) moverightSprite123;
-(void) moveupSprite123;
-(void) movedownSprite123;
-(void) finishActionSprite123;

-(void) updateSprite124;

-(void) moveleftSprite124;
-(void) moverightSprite124;
-(void) moveupSprite124;
-(void) movedownSprite124;
-(void) finishActionSprite124;

-(void) updateSprite125;

-(void) moveleftSprite125;
-(void) moverightSprite125;
-(void) moveupSprite125;
-(void) movedownSprite125;
-(void) finishActionSprite125;

-(void) updateSprite126;

-(void) moveleftSprite126;
-(void) moverightSprite126;
-(void) moveupSprite126;
-(void) movedownSprite126;
-(void) finishActionSprite126;

-(void) updateSprite127;

-(void) moveleftSprite127;
-(void) moverightSprite127;
-(void) moveupSprite127;
-(void) movedownSprite127;
-(void) finishActionSprite127;

-(void) updateSprite128;

-(void) moveleftSprite128;
-(void) moverightSprite128;
-(void) moveupSprite128;
-(void) movedownSprite128;
-(void) finishActionSprite128;

-(void) updateSprite129;

-(void) moveleftSprite129;
-(void) moverightSprite129;
-(void) moveupSprite129;
-(void) movedownSprite129;
-(void) finishActionSprite129;



-(void) pickedUpItem:(int)itemCode;
-(void) givenItem:(int)itemCode;
-(void) goGate:(int)gate;



//OVERRIDDEN METHODS
- (void) setPlayerPosition: (CGPoint) point;
- (void) dsetPlayerPosition: (CGPoint) point;
-(void) pressedA;
-(void) saveHero;
-(void) stayAtInn;


-(void)spriteCycle;



@end







