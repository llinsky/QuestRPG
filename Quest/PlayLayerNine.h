//
//  PlayLayerNine.h
//  Quest
//
//  Created by Leo Linsky on 2/17/14.
//
//

#import "Playlayer.h"

@interface PlayLayerNine : PlayLayer

@property (nonatomic, retain) CCSprite *item32;
@property (nonatomic, retain) CCSprite *item33;
@property (nonatomic, retain) CCSprite *item34;
@property (nonatomic, retain) CCSprite *item35;

@property (nonatomic, retain) CCSprite *boss6;


-(void) pickedUpItem:(int)itemCode;
-(void) givenItem:(int)itemCode;
-(void) goGate:(int)gate;


//OVERRIDDEN METHODS
- (void) setPlayerPosition: (CGPoint) point;
- (void) dsetPlayerPosition: (CGPoint) point;
-(void) pressedA;
-(void) saveHero;


@end










