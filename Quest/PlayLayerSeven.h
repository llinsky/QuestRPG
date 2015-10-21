//
//  PlayLayerSeven.h
//  Quest
//
//  Created by Leo Linsky on 1/25/14.
//
//

#import "Playlayer.h"

@interface PlayLayerSeven : PlayLayer


@property (nonatomic, retain) CCSprite *item28;

@property (nonatomic, retain) CCSprite *boss5;


-(void) pickedUpItem:(int)itemCode;
-(void) givenItem:(int)itemCode;
-(void) goGate:(int)gate;



//OVERRIDDEN METHODS
- (void) setPlayerPosition: (CGPoint) point;
- (void) dsetPlayerPosition: (CGPoint) point;
-(void) pressedA;
-(void) saveHero;



@end




