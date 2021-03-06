//
//  PlayLayerTwenty.h
//  Quest
//
//  Created by Leo Linsky on 2/17/14.
//
//

#import "Playlayer.h"

@interface PlayLayerTwenty : PlayLayer

@property (nonatomic, retain) CCSprite *item43;
@property (nonatomic, retain) CCSprite *item44;
@property (nonatomic, retain) CCSprite *item45;


-(void) pickedUpItem:(int)itemCode;
-(void) givenItem:(int)itemCode;
-(void) goGate:(int)gate;


//OVERRIDDEN METHODS
- (void) setPlayerPosition: (CGPoint) point;
- (void) dsetPlayerPosition: (CGPoint) point;
-(void) pressedA;
-(void) saveHero;

@end


