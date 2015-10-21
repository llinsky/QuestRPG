//
//  PL34.h
//  Quest
//
//  Created by Leo Linsky on 2/17/14.
//
//

#import "Playlayer.h"

@interface PL34 : PlayLayer

@property (nonatomic, retain) CCSprite *item56;
@property (nonatomic, retain) CCSprite *item57;
@property (nonatomic, retain) CCSprite *item58;

@property (nonatomic, retain) CCSprite *ionak;


-(void) pickedUpItem:(int)itemCode;
-(void) givenItem:(int)itemCode;
-(void) goGate:(int)gate;


//OVERRIDDEN METHODS
- (void) setPlayerPosition: (CGPoint) point;
- (void) dsetPlayerPosition: (CGPoint) point;
-(void) pressedA;
-(void) saveHero;



@end
