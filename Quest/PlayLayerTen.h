//
//  PlayLayerTen.h
//  Quest
//
//  Created by Leo Linsky on 2/17/14.
//
//

#import "Playlayer.h"

@interface PlayLayerTen : PlayLayer


@property (nonatomic, retain) CCSprite *item36;
@property (nonatomic, retain) CCSprite *item37;
@property (nonatomic, retain) CCSprite *item38;
@property (nonatomic, retain) CCSprite *item39;

@property (nonatomic, retain) CCSprite *boss7;


-(void) pickedUpItem:(int)itemCode;
-(void) givenItem:(int)itemCode;
-(void) goGate:(int)gate;


//OVERRIDDEN METHODS
- (void) setPlayerPosition: (CGPoint) point;
- (void) dsetPlayerPosition: (CGPoint) point;
-(void) pressedA;
-(void) saveHero;


@end



