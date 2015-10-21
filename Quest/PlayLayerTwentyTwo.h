//
//  PlayLayerTwentyTwo.h
//  Quest
//
//  Created by Leo Linsky on 2/17/14.
//
//

#import "Playlayer.h"

@interface PlayLayerTwentyTwo : PlayLayer

@property (nonatomic, retain) CCSprite *item46;
@property (nonatomic, retain) CCSprite *item47;
@property (nonatomic, retain) CCSprite *item48;
@property (nonatomic, retain) CCSprite *item49;


-(void) pickedUpItem:(int)itemCode;
-(void) givenItem:(int)itemCode;
-(void) goGate:(int)gate;


//OVERRIDDEN METHODS
- (void) setPlayerPosition: (CGPoint) point;
- (void) dsetPlayerPosition: (CGPoint) point;
-(void) pressedA;
-(void) saveHero;


@end
