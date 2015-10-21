//
//  PlayLayerFour.h
//  Quest
//
//  Created by Leo Linsky on 1/7/14.
//  Copyright 2014 __MyCompanyName__. All rights reserved.
//

#import "PlayLayer.h"

@interface PlayLayerFour : PlayLayer

{
    int spriteCycleCount;
    
    CCAnimation *spriteAWalkLeft;
    CCAnimation *spriteAWalkRight;
    CCAnimation *spriteAWalkUp;
    CCAnimation *spriteAWalkDown;
    CCAnimation *spriteAWalkUp2;
    CCAnimation *spriteAWalkDown2;
    CCSpriteBatchNode *spriteASheet;
    
    CCAnimation *spriteGWalkLeft;
    CCAnimation *spriteGWalkRight;
    CCAnimation *spriteGWalkUp;
    CCAnimation *spriteGWalkDown;
    CCAnimation *spriteGWalkUp2;
    CCAnimation *spriteGWalkDown2;
    CCSpriteBatchNode *spriteGSheet;
    
    CCAnimation *spriteTWalkLeft;
    CCAnimation *spriteTWalkRight;
    CCAnimation *spriteTWalkUp;
    CCAnimation *spriteTWalkDown;
    CCAnimation *spriteTWalkUp2;
    CCAnimation *spriteTWalkDown2;
    CCSpriteBatchNode *spriteTSheet;
    
    CCAnimation *spriteWWalkLeft;
    CCAnimation *spriteWWalkRight;
    CCAnimation *spriteWWalkUp;
    CCAnimation *spriteWWalkDown;
    CCAnimation *spriteWWalkUp2;
    CCAnimation *spriteWWalkDown2;
    CCSpriteBatchNode *spriteWSheet;
    
    CCAnimation *spriteXWalkLeft;
    CCAnimation *spriteXWalkRight;
    CCAnimation *spriteXWalkUp;
    CCAnimation *spriteXWalkDown;
    CCAnimation *spriteXWalkUp2;
    CCAnimation *spriteXWalkDown2;
    CCSpriteBatchNode *spriteXSheet;
    
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
    
    CCAnimation *spriteIWalkLeft;
    CCAnimation *spriteIWalkRight;
    CCAnimation *spriteIWalkUp;
    CCAnimation *spriteIWalkDown;
    CCAnimation *spriteIWalkUp2;
    CCAnimation *spriteIWalkDown2;
    CCSpriteBatchNode *spriteISheet;
    
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
    
    CCAnimation *spriteLWalkLeft;
    CCAnimation *spriteLWalkRight;
    CCAnimation *spriteLWalkUp;
    CCAnimation *spriteLWalkDown;
    CCAnimation *spriteLWalkUp2;
    CCAnimation *spriteLWalkDown2;
    CCSpriteBatchNode *spriteLSheet;
    
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
    
    CCAnimation *spriteZAWalkLeft;
    CCAnimation *spriteZAWalkRight;
    CCAnimation *spriteZAWalkUp;
    CCAnimation *spriteZAWalkDown;
    CCAnimation *spriteZAWalkUp2;
    CCAnimation *spriteZAWalkDown2;
    CCSpriteBatchNode *spriteZASheet;
    
    CCAnimation *spriteZBWalkLeft;
    CCAnimation *spriteZBWalkRight;
    CCAnimation *spriteZBWalkUp;
    CCAnimation *spriteZBWalkDown;
    CCAnimation *spriteZBWalkUp2;
    CCAnimation *spriteZBWalkDown2;
    CCSpriteBatchNode *spriteZBSheet;
}



@property (nonatomic, retain) InteractiveSprite *sprite81;
@property (nonatomic, retain) InteractiveSprite *sprite82;
@property (nonatomic, retain) InteractiveSprite *sprite83;
@property (nonatomic, retain) InteractiveSprite *sprite84;
@property (nonatomic, retain) InteractiveSprite *sprite85;
@property (nonatomic, retain) InteractiveSprite *sprite86;
@property (nonatomic, retain) InteractiveSprite *sprite87;
@property (nonatomic, retain) InteractiveSprite *sprite88;
@property (nonatomic, retain) InteractiveSprite *sprite89;
@property (nonatomic, retain) InteractiveSprite *sprite90;
@property (nonatomic, retain) InteractiveSprite *sprite91;
@property (nonatomic, retain) InteractiveSprite *sprite92;
@property (nonatomic, retain) InteractiveSprite *sprite93;
@property (nonatomic, retain) InteractiveSprite *sprite94;
@property (nonatomic, retain) InteractiveSprite *sprite95;
@property (nonatomic, retain) InteractiveSprite *sprite96;
@property (nonatomic, retain) InteractiveSprite *sprite97;
@property (nonatomic, retain) InteractiveSprite *sprite98;
@property (nonatomic, retain) InteractiveSprite *sprite99;
@property (nonatomic, retain) InteractiveSprite *sprite100;
@property (nonatomic, retain) InteractiveSprite *sprite101;
@property (nonatomic, retain) InteractiveSprite *sprite102;
@property (nonatomic, retain) InteractiveSprite *sprite103;
@property (nonatomic, retain) InteractiveSprite *sprite104;



@property (nonatomic, retain) CCSprite *item13;
@property (nonatomic, retain) CCSprite *item14;
@property (nonatomic, retain) CCSprite *item15;
@property (nonatomic, retain) CCSprite *item16;

@property (nonatomic, retain) CCSprite *swarm;



-(void) updateSprite81;

-(void) moveleftSprite81;
-(void) moverightSprite81;
-(void) moveupSprite81;
-(void) movedownSprite81;
-(void) finishActionSprite81;

-(void) updateSprite82;

-(void) moveleftSprite82;
-(void) moverightSprite82;
-(void) moveupSprite82;
-(void) movedownSprite82;
-(void) finishActionSprite82;

-(void) updateSprite83;

-(void) moveleftSprite83;
-(void) moverightSprite83;
-(void) moveupSprite83;
-(void) movedownSprite83;
-(void) finishActionSprite83;

-(void) updateSprite84;

-(void) moveleftSprite84;
-(void) moverightSprite84;
-(void) moveupSprite84;
-(void) movedownSprite84;
-(void) finishActionSprite84;

-(void) updateSprite85;

-(void) moveleftSprite85;
-(void) moverightSprite85;
-(void) moveupSprite85;
-(void) movedownSprite85;
-(void) finishActionSprite85;

-(void) updateSprite86;

-(void) moveleftSprite86;
-(void) moverightSprite86;
-(void) moveupSprite86;
-(void) movedownSprite86;
-(void) finishActionSprite86;

-(void) updateSprite87;

-(void) moveleftSprite87;
-(void) moverightSprite87;
-(void) moveupSprite87;
-(void) movedownSprite87;
-(void) finishActionSprite87;

-(void) updateSprite88;

-(void) moveleftSprite88;
-(void) moverightSprite88;
-(void) moveupSprite88;
-(void) movedownSprite88;
-(void) finishActionSprite88;

-(void) updateSprite89;

-(void) moveleftSprite89;
-(void) moverightSprite89;
-(void) moveupSprite89;
-(void) movedownSprite89;
-(void) finishActionSprite89;

-(void) updateSprite90;

-(void) moveleftSprite90;
-(void) moverightSprite90;
-(void) moveupSprite90;
-(void) movedownSprite90;
-(void) finishActionSprite90;

-(void) updateSprite91;

-(void) moveleftSprite91;
-(void) moverightSprite91;
-(void) moveupSprite91;
-(void) movedownSprite91;
-(void) finishActionSprite91;

-(void) updateSprite92;

-(void) moveleftSprite92;
-(void) moverightSprite92;
-(void) moveupSprite92;
-(void) movedownSprite92;
-(void) finishActionSprite92;

-(void) updateSprite93;

-(void) moveleftSprite93;
-(void) moverightSprite93;
-(void) moveupSprite93;
-(void) movedownSprite93;
-(void) finishActionSprite93;

-(void) updateSprite94;

-(void) moveleftSprite94;
-(void) moverightSprite94;
-(void) moveupSprite94;
-(void) movedownSprite94;
-(void) finishActionSprite94;

-(void) updateSprite95;

-(void) moveleftSprite95;
-(void) moverightSprite95;
-(void) moveupSprite95;
-(void) movedownSprite95;
-(void) finishActionSprite95;

-(void) updateSprite96;

-(void) moveleftSprite96;
-(void) moverightSprite96;
-(void) moveupSprite96;
-(void) movedownSprite96;
-(void) finishActionSprite96;

-(void) updateSprite97;

-(void) moveleftSprite97;
-(void) moverightSprite97;
-(void) moveupSprite97;
-(void) movedownSprite97;
-(void) finishActionSprite97;

-(void) updateSprite98;

-(void) moveleftSprite98;
-(void) moverightSprite98;
-(void) moveupSprite98;
-(void) movedownSprite98;
-(void) finishActionSprite98;

-(void) updateSprite99;

-(void) moveleftSprite99;
-(void) moverightSprite99;
-(void) moveupSprite99;
-(void) movedownSprite99;
-(void) finishActionSprite99;

-(void) updateSprite100;

-(void) moveleftSprite100;
-(void) moverightSprite100;
-(void) moveupSprite100;
-(void) movedownSprite100;
-(void) finishActionSprite100;

-(void) updateSprite101;

-(void) moveleftSprite101;
-(void) moverightSprite101;
-(void) moveupSprite101;
-(void) movedownSprite101;
-(void) finishActionSprite101;

-(void) updateSprite102;

-(void) moveleftSprite102;
-(void) moverightSprite102;
-(void) moveupSprite102;
-(void) movedownSprite102;
-(void) finishActionSprite102;

-(void) updateSprite103;

-(void) moveleftSprite103;
-(void) moverightSprite103;
-(void) moveupSprite103;
-(void) movedownSprite103;
-(void) finishActionSprite103;

-(void) updateSprite104;

-(void) moveleftSprite104;
-(void) moverightSprite104;
-(void) moveupSprite104;
-(void) movedownSprite104;
-(void) finishActionSprite104;






-(void) pickedUpItem:(int)itemCode;
-(void) givenItem:(int)itemCode;
-(void) stayAtInn;
-(void) goGate:(int)gate; //cave1 will be gate 101, cave2 will be gate 102
-(void) killBugs; //done when you pressA on swarm. Also causes text to come up.
-(void) unblockFjordland;

//There will NOT be an additional mapInit mode for beating Traveler, text: I am the greatest remaining warrior in all the land. I will give you a prize if you can best me. What do you say? After win: So the rumors are true about you...

//OVERRIDDEN METHODS
- (void) setPlayerPosition: (CGPoint) point;
- (void) dsetPlayerPosition: (CGPoint) point;
-(void) pressedA;
-(void) saveHero;

-(void)spriteCycle;

-(void)startRain;

@end














