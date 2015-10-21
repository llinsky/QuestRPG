//
//  PlayLayerThree.h
//  Quest
//
//  Created by Leo Linsky on 1/3/14.
//
//

#import "Playlayer.h"

@interface PlayLayerThree : PlayLayer

{
    int spriteCycleCount;
    
    CCAnimation *spriteAWalkLeft;
    CCAnimation *spriteAWalkRight;
    CCAnimation *spriteAWalkUp;
    CCAnimation *spriteAWalkDown;
    CCAnimation *spriteAWalkUp2;
    CCAnimation *spriteAWalkDown2;
    CCSpriteBatchNode *spriteASheet;
    
    CCAnimation *spriteKWalkLeft;
    CCAnimation *spriteKWalkRight;
    CCAnimation *spriteKWalkUp;
    CCAnimation *spriteKWalkDown;
    CCAnimation *spriteKWalkUp2;
    CCAnimation *spriteKWalkDown2;
    CCSpriteBatchNode *spriteKSheet;
    
    CCAnimation *spriteVWalkLeft;
    CCAnimation *spriteVWalkRight;
    CCAnimation *spriteVWalkUp;
    CCAnimation *spriteVWalkDown;
    CCAnimation *spriteVWalkUp2;
    CCAnimation *spriteVWalkDown2;
    CCSpriteBatchNode *spriteVSheet;
    
    CCAnimation *spriteNWalkLeft;
    CCAnimation *spriteNWalkRight;
    CCAnimation *spriteNWalkUp;
    CCAnimation *spriteNWalkDown;
    CCAnimation *spriteNWalkUp2;
    CCAnimation *spriteNWalkDown2;
    CCSpriteBatchNode *spriteNSheet;
    
    CCAnimation *spriteRWalkLeft;
    CCAnimation *spriteRWalkRight;
    CCAnimation *spriteRWalkUp;
    CCAnimation *spriteRWalkDown;
    CCAnimation *spriteRWalkUp2;
    CCAnimation *spriteRWalkDown2;
    CCSpriteBatchNode *spriteRSheet;
    
    CCAnimation *spriteGWalkLeft;
    CCAnimation *spriteGWalkRight;
    CCAnimation *spriteGWalkUp;
    CCAnimation *spriteGWalkDown;
    CCAnimation *spriteGWalkUp2;
    CCAnimation *spriteGWalkDown2;
    CCSpriteBatchNode *spriteGSheet;
    
    CCAnimation *spriteHWalkLeft;
    CCAnimation *spriteHWalkRight;
    CCAnimation *spriteHWalkUp;
    CCAnimation *spriteHWalkDown;
    CCAnimation *spriteHWalkUp2;
    CCAnimation *spriteHWalkDown2;
    CCSpriteBatchNode *spriteHSheet;
    
    CCAnimation *spriteMWalkLeft;
    CCAnimation *spriteMWalkRight;
    CCAnimation *spriteMWalkUp;
    CCAnimation *spriteMWalkDown;
    CCAnimation *spriteMWalkUp2;
    CCAnimation *spriteMWalkDown2;
    CCSpriteBatchNode *spriteMSheet;
    
    CCAnimation *spritePWalkLeft;
    CCAnimation *spritePWalkRight;
    CCAnimation *spritePWalkUp;
    CCAnimation *spritePWalkDown;
    CCAnimation *spritePWalkUp2;
    CCAnimation *spritePWalkDown2;
    CCSpriteBatchNode *spritePSheet;
    
    CCAnimation *spriteTWalkLeft;
    CCAnimation *spriteTWalkRight;
    CCAnimation *spriteTWalkUp;
    CCAnimation *spriteTWalkDown;
    CCAnimation *spriteTWalkUp2;
    CCAnimation *spriteTWalkDown2;
    CCSpriteBatchNode *spriteTSheet;
    
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
    
    CCAnimation *spriteZWalkLeft;
    CCAnimation *spriteZWalkRight;
    CCAnimation *spriteZWalkUp;
    CCAnimation *spriteZWalkDown;
    CCAnimation *spriteZWalkUp2;
    CCAnimation *spriteZWalkDown2;
    CCSpriteBatchNode *spriteZSheet;
    
    CCAnimation *spriteZBWalkLeft;
    CCAnimation *spriteZBWalkRight;
    CCAnimation *spriteZBWalkUp;
    CCAnimation *spriteZBWalkDown;
    CCAnimation *spriteZBWalkUp2;
    CCAnimation *spriteZBWalkDown2;
    CCSpriteBatchNode *spriteZBSheet;
}



@property (nonatomic, retain) InteractiveSprite *sprite61;
@property (nonatomic, retain) InteractiveSprite *sprite62;
@property (nonatomic, retain) InteractiveSprite *sprite63;
@property (nonatomic, retain) InteractiveSprite *sprite64;
@property (nonatomic, retain) InteractiveSprite *sprite65;
@property (nonatomic, retain) InteractiveSprite *sprite66;
@property (nonatomic, retain) InteractiveSprite *sprite67;
@property (nonatomic, retain) InteractiveSprite *sprite68;
@property (nonatomic, retain) InteractiveSprite *sprite69;
@property (nonatomic, retain) InteractiveSprite *sprite70;
@property (nonatomic, retain) InteractiveSprite *sprite71;
@property (nonatomic, retain) InteractiveSprite *sprite72;
@property (nonatomic, retain) InteractiveSprite *sprite73;
@property (nonatomic, retain) InteractiveSprite *sprite74;
@property (nonatomic, retain) InteractiveSprite *sprite75;
@property (nonatomic, retain) InteractiveSprite *sprite76;



@property (nonatomic, retain) CCSprite *item9;
@property (nonatomic, retain) CCSprite *item10;
@property (nonatomic, retain) CCSprite *item11;
@property (nonatomic, retain) CCSprite *item12;



-(void) updateSprite61;

-(void) moveleftSprite61;
-(void) moverightSprite61;
-(void) moveupSprite61;
-(void) movedownSprite61;
-(void) finishActionSprite61;

-(void) updateSprite62;

-(void) moveleftSprite62;
-(void) moverightSprite62;
-(void) moveupSprite62;
-(void) movedownSprite62;
-(void) finishActionSprite62;

-(void) updateSprite63;

-(void) moveleftSprite63;
-(void) moverightSprite63;
-(void) moveupSprite63;
-(void) movedownSprite63;
-(void) finishActionSprite63;

-(void) updateSprite64;

-(void) moveleftSprite64;
-(void) moverightSprite64;
-(void) moveupSprite64;
-(void) movedownSprite64;
-(void) finishActionSprite64;

-(void) updateSprite65;

-(void) moveleftSprite65;
-(void) moverightSprite65;
-(void) moveupSprite65;
-(void) movedownSprite65;
-(void) finishActionSprite65;

-(void) updateSprite66;

-(void) moveleftSprite66;
-(void) moverightSprite66;
-(void) moveupSprite66;
-(void) movedownSprite66;
-(void) finishActionSprite66;

-(void) updateSprite67;

-(void) moveleftSprite67;
-(void) moverightSprite67;
-(void) moveupSprite67;
-(void) movedownSprite67;
-(void) finishActionSprite67;

-(void) updateSprite68;

-(void) moveleftSprite68;
-(void) moverightSprite68;
-(void) moveupSprite68;
-(void) movedownSprite68;
-(void) finishActionSprite68;

-(void) updateSprite69;

-(void) moveleftSprite69;
-(void) moverightSprite69;
-(void) moveupSprite69;
-(void) movedownSprite69;
-(void) finishActionSprite69;

-(void) updateSprite70;

-(void) moveleftSprite70;
-(void) moverightSprite70;
-(void) moveupSprite70;
-(void) movedownSprite70;
-(void) finishActionSprite70;

-(void) updateSprite71;

-(void) moveleftSprite71;
-(void) moverightSprite71;
-(void) moveupSprite71;
-(void) movedownSprite71;
-(void) finishActionSprite71;

-(void) updateSprite72;

-(void) moveleftSprite72;
-(void) moverightSprite72;
-(void) moveupSprite72;
-(void) movedownSprite72;
-(void) finishActionSprite72;

-(void) updateSprite73;

-(void) moveleftSprite73;
-(void) moverightSprite73;
-(void) moveupSprite73;
-(void) movedownSprite73;
-(void) finishActionSprite73;

-(void) updateSprite74;

-(void) moveleftSprite74;
-(void) moverightSprite74;
-(void) moveupSprite74;
-(void) movedownSprite74;
-(void) finishActionSprite74;

-(void) updateSprite75;

-(void) moveleftSprite75;
-(void) moverightSprite75;
-(void) moveupSprite75;
-(void) movedownSprite75;
-(void) finishActionSprite75;

-(void) updateSprite76;

-(void) moveleftSprite76;
-(void) moverightSprite76;
-(void) moveupSprite76;
-(void) movedownSprite76;
-(void) finishActionSprite76;






-(void) pickedUpItem:(int)itemCode;
-(void) givenItem:(int)itemCode;
-(void) stayAtInn;
-(void) goGate:(int)gate;
-(void) unblockCave;
-(void) goCave;

//OVERRIDDEN METHODS
- (void) setPlayerPosition: (CGPoint) point;
- (void) dsetPlayerPosition: (CGPoint) point;
-(void) pressedA;
-(void) saveHero;

-(void)spriteCycle;

-(void)startRain;

@end














