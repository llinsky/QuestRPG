//
//  PlayLayerSix.h
//  Quest
//
//  Created by Leo Linsky on 1/19/14.
//
//

#import "Playlayer.h"

@interface PlayLayerSix : PlayLayer

{
    int spriteCycleCount;
    
    CCAnimation *spriteHWalkLeft;
    CCAnimation *spriteHWalkRight;
    CCAnimation *spriteHWalkUp;
    CCAnimation *spriteHWalkDown;
    CCAnimation *spriteHWalkUp2;
    CCAnimation *spriteHWalkDown2;
    CCSpriteBatchNode *spriteHSheet;

    CCAnimation *spriteBWalkLeft;
    CCAnimation *spriteBWalkRight;
    CCAnimation *spriteBWalkUp;
    CCAnimation *spriteBWalkDown;
    CCAnimation *spriteBWalkUp2;
    CCAnimation *spriteBWalkDown2;
    CCSpriteBatchNode *spriteBSheet;
    
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

    CCAnimation *spriteNWalkLeft;
    CCAnimation *spriteNWalkRight;
    CCAnimation *spriteNWalkUp;
    CCAnimation *spriteNWalkDown;
    CCAnimation *spriteNWalkUp2;
    CCAnimation *spriteNWalkDown2;
    CCSpriteBatchNode *spriteNSheet;

    CCAnimation *spriteCWalkLeft;
    CCAnimation *spriteCWalkRight;
    CCAnimation *spriteCWalkUp;
    CCAnimation *spriteCWalkDown;
    CCAnimation *spriteCWalkUp2;
    CCAnimation *spriteCWalkDown2;
    CCSpriteBatchNode *spriteCSheet;
    
}

@property (nonatomic, retain) CCSprite *item25;
@property (nonatomic, retain) CCSprite *item26;
@property (nonatomic, retain) CCSprite *item27;


@property (nonatomic, retain) InteractiveSprite *sprite111;
@property (nonatomic, retain) InteractiveSprite *sprite112;
@property (nonatomic, retain) InteractiveSprite *sprite113;
@property (nonatomic, retain) InteractiveSprite *sprite114;
@property (nonatomic, retain) InteractiveSprite *sprite115;
@property (nonatomic, retain) InteractiveSprite *sprite116;
@property (nonatomic, retain) InteractiveSprite *sprite117;
@property (nonatomic, retain) InteractiveSprite *sprite118;
@property (nonatomic, retain) InteractiveSprite *sprite119;



-(void) updateSprite111;

-(void) moveleftSprite111;
-(void) moverightSprite111;
-(void) moveupSprite111;
-(void) movedownSprite111;
-(void) finishActionSprite111;

-(void) updateSprite112;

-(void) moveleftSprite112;
-(void) moverightSprite112;
-(void) moveupSprite112;
-(void) movedownSprite112;
-(void) finishActionSprite112;

-(void) updateSprite113;

-(void) moveleftSprite113;
-(void) moverightSprite113;
-(void) moveupSprite113;
-(void) movedownSprite113;
-(void) finishActionSprite113;

-(void) updateSprite114;

-(void) moveleftSprite114;
-(void) moverightSprite114;
-(void) moveupSprite114;
-(void) movedownSprite114;
-(void) finishActionSprite114;

-(void) updateSprite115;

-(void) moveleftSprite115;
-(void) moverightSprite115;
-(void) moveupSprite115;
-(void) movedownSprite115;
-(void) finishActionSprite115;

-(void) updateSprite116;

-(void) moveleftSprite116;
-(void) moverightSprite116;
-(void) moveupSprite116;
-(void) movedownSprite116;
-(void) finishActionSprite116;

-(void) updateSprite117;

-(void) moveleftSprite117;
-(void) moverightSprite117;
-(void) moveupSprite117;
-(void) movedownSprite117;
-(void) finishActionSprite117;

-(void) updateSprite118;

-(void) moveleftSprite118;
-(void) moverightSprite118;
-(void) moveupSprite118;
-(void) movedownSprite118;
-(void) finishActionSprite118;

-(void) updateSprite119;

-(void) moveleftSprite119;
-(void) moverightSprite119;
-(void) moveupSprite119;
-(void) movedownSprite119;
-(void) finishActionSprite119;



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

-(void)startSnow;

@end










