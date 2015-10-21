//
//  PlayLayerTwentyOne.h
//  Quest
//
//  Created by Leo Linsky on 2/17/14.
//
//

#import "Playlayer.h"

@interface PlayLayerTwentyOne : PlayLayer

@property (nonatomic, retain) CCSprite *item40;
@property (nonatomic, retain) CCSprite *item41;
@property (nonatomic, retain) CCSprite *item42;


-(void) pickedUpItem:(int)itemCode;
-(void) givenItem:(int)itemCode;
-(void) goGate:(int)gate;


//OVERRIDDEN METHODS
- (void) setPlayerPosition: (CGPoint) point;
- (void) dsetPlayerPosition: (CGPoint) point;
-(void) pressedA;
-(void) saveHero;


@end




