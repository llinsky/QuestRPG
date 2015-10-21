//
//  PL30.h
//  Quest
//
//  Created by Leo Linsky on 2/17/14.
//
//

#import "Playlayer.h"

@interface PL30 : PlayLayer

@property (nonatomic, retain) CCSprite *item50;
@property (nonatomic, retain) CCSprite *item51;


-(void) pickedUpItem:(int)itemCode;
-(void) givenItem:(int)itemCode;
-(void) goGate:(int)gate;


//OVERRIDDEN METHODS
- (void) setPlayerPosition: (CGPoint) point;
- (void) dsetPlayerPosition: (CGPoint) point;
-(void) pressedA;
-(void) saveHero;



@end


