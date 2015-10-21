//
//  PlayLayerEight.m
//  Quest
//
//  Created by Leo Linsky on 1/28/14.
//
//

#import "PlayLayerEight.h"
#import "SceneManager.h"
#import "HKTMXTiledMap.h"
#import "ItemShopMenu.h"
#import "CCSendMessages.h"

@implementation PlayLayerEight

-(id)init
{
    if (self = [super init])
    {
        self.theHKMap = [HKTMXTiledMap tiledMapWithTMXFile:@"playlayer8_FINAL1.tmx"];
        [[CCDirector sharedDirector] setProjection:kCCDirectorProjection2D];
        
        
        self.bgLayer = [_theHKMap layerNamed:@"bg1"];
        self.bgLayer.visible = NO;
        
        CCTMXObjectGroup *objects = [_theHKMap objectGroupNamed:@"oj1"];
        
        [self addChild:_theHKMap z:-1];
        
        self.hero = [GameSceneManager sharedGameSceneManager].hero;
        
        {
            [[CCSpriteFrameCache sharedSpriteFrameCache] addSpriteFramesWithFile:@"herospriteGsheet.plist"];
            spriteGSheet = [CCSpriteBatchNode batchNodeWithFile:@"herospriteGsheet.png"];
            [spriteGSheet retain];
            [self addChild:spriteGSheet];
            
            NSMutableArray *spriteGWalkAnimFramesLeft = [NSMutableArray array];
            NSMutableArray *spriteGWalkAnimFramesRight = [NSMutableArray array];
            NSMutableArray *spriteGAnimFramesUp = [NSMutableArray array];
            NSMutableArray *spriteGAnimFramesDown = [NSMutableArray array];
            NSMutableArray *spriteGAnimFramesUp2 = [NSMutableArray array];
            NSMutableArray *spriteGAnimFramesDown2 = [NSMutableArray array];
            
            [spriteGWalkAnimFramesLeft addObject:[[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:@"herospriteG05.png"]];
            [spriteGWalkAnimFramesLeft addObject:[[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:@"herospriteG06.png"]];
            [spriteGWalkAnimFramesLeft addObject:[[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:@"herospriteG06.png"]];
            [spriteGWalkAnimFramesLeft addObject:[[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:@"herospriteG06.png"]];
            [spriteGWalkAnimFramesLeft addObject:[[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:@"herospriteG05.png"]];
            spriteGWalkLeft = [CCAnimation animationWithFrames:spriteGWalkAnimFramesLeft delay:0.06f];
            [spriteGWalkLeft retain];
            
            [spriteGWalkAnimFramesRight addObject:[[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:@"herospriteG04.png"]];
            [spriteGWalkAnimFramesRight addObject:[[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:@"herospriteG07.png"]];
            [spriteGWalkAnimFramesRight addObject:[[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:@"herospriteG07.png"]];
            [spriteGWalkAnimFramesRight addObject:[[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:@"herospriteG07.png"]];
            [spriteGWalkAnimFramesRight addObject:[[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:@"herospriteG04.png"]];
            spriteGWalkRight = [CCAnimation animationWithFrames:spriteGWalkAnimFramesRight delay:0.06f];
            [spriteGWalkRight retain];
            
            [spriteGAnimFramesUp addObject:[[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:@"herospriteG08.png"]];
            [spriteGAnimFramesUp addObject:[[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:@"herospriteG09.png"]];
            [spriteGAnimFramesUp addObject:[[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:@"herospriteG09.png"]];
            [spriteGAnimFramesUp addObject:[[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:@"herospriteG09.png"]];
            [spriteGAnimFramesUp addObject:[[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:@"herospriteG08.png"]];
            spriteGWalkUp = [CCAnimation animationWithFrames:spriteGAnimFramesUp delay:0.06f];
            [spriteGWalkUp retain];
            
            [spriteGAnimFramesUp2 addObject:[[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:@"herospriteG08.png"]];
            [spriteGAnimFramesUp2 addObject:[[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:@"herospriteG10.png"]];
            [spriteGAnimFramesUp2 addObject:[[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:@"herospriteG10.png"]];
            [spriteGAnimFramesUp2 addObject:[[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:@"herospriteG10.png"]];
            [spriteGAnimFramesUp2 addObject:[[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:@"herospriteG08.png"]];
            spriteGWalkUp2 = [CCAnimation animationWithFrames:spriteGAnimFramesUp2 delay:0.06f];
            [spriteGWalkUp2 retain];
            
            [spriteGAnimFramesDown addObject:[[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:@"herospriteG01.png"]];
            [spriteGAnimFramesDown addObject:[[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:@"herospriteG02.png"]];
            [spriteGAnimFramesDown addObject:[[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:@"herospriteG02.png"]];
            [spriteGAnimFramesDown addObject:[[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:@"herospriteG02.png"]];
            [spriteGAnimFramesDown addObject:[[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:@"herospriteG01.png"]];
            spriteGWalkDown = [CCAnimation animationWithFrames:spriteGAnimFramesDown delay:0.06f];
            [spriteGWalkDown retain];
            
            [spriteGAnimFramesDown2 addObject:[[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:@"herospriteG01.png"]];
            [spriteGAnimFramesDown2 addObject:[[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:@"herospriteG03.png"]];
            [spriteGAnimFramesDown2 addObject:[[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:@"herospriteG03.png"]];
            [spriteGAnimFramesDown2 addObject:[[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:@"herospriteG03.png"]];
            [spriteGAnimFramesDown2 addObject:[[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:@"herospriteG01.png"]];
            spriteGWalkDown2 = [CCAnimation animationWithFrames:spriteGAnimFramesDown2 delay:0.06f];
            [spriteGWalkDown2 retain];
            
            [[CCSpriteFrameCache sharedSpriteFrameCache] addSpriteFramesWithFile:@"herospriteYsheet.plist"];
            spriteYSheet = [CCSpriteBatchNode batchNodeWithFile:@"herospriteYsheet.png"];
            [spriteYSheet retain];
            [self addChild:spriteYSheet];
            
            NSMutableArray *spriteYWalkAnimFramesLeft = [NSMutableArray array];
            NSMutableArray *spriteYWalkAnimFramesRight = [NSMutableArray array];
            NSMutableArray *spriteYAnimFramesUp = [NSMutableArray array];
            NSMutableArray *spriteYAnimFramesDown = [NSMutableArray array];
            NSMutableArray *spriteYAnimFramesUp2 = [NSMutableArray array];
            NSMutableArray *spriteYAnimFramesDown2 = [NSMutableArray array];
            
            [spriteYWalkAnimFramesLeft addObject:[[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:@"herospriteY05.png"]];
            [spriteYWalkAnimFramesLeft addObject:[[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:@"herospriteY06.png"]];
            [spriteYWalkAnimFramesLeft addObject:[[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:@"herospriteY06.png"]];
            [spriteYWalkAnimFramesLeft addObject:[[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:@"herospriteY06.png"]];
            [spriteYWalkAnimFramesLeft addObject:[[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:@"herospriteY05.png"]];
            spriteYWalkLeft = [CCAnimation animationWithFrames:spriteYWalkAnimFramesLeft delay:0.06f];
            [spriteYWalkLeft retain];
            
            [spriteYWalkAnimFramesRight addObject:[[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:@"herospriteY04.png"]];
            [spriteYWalkAnimFramesRight addObject:[[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:@"herospriteY07.png"]];
            [spriteYWalkAnimFramesRight addObject:[[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:@"herospriteY07.png"]];
            [spriteYWalkAnimFramesRight addObject:[[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:@"herospriteY07.png"]];
            [spriteYWalkAnimFramesRight addObject:[[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:@"herospriteY04.png"]];
            spriteYWalkRight = [CCAnimation animationWithFrames:spriteYWalkAnimFramesRight delay:0.06f];
            [spriteYWalkRight retain];
            
            [spriteYAnimFramesUp addObject:[[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:@"herospriteY08.png"]];
            [spriteYAnimFramesUp addObject:[[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:@"herospriteY09.png"]];
            [spriteYAnimFramesUp addObject:[[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:@"herospriteY09.png"]];
            [spriteYAnimFramesUp addObject:[[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:@"herospriteY09.png"]];
            [spriteYAnimFramesUp addObject:[[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:@"herospriteY08.png"]];
            spriteYWalkUp = [CCAnimation animationWithFrames:spriteYAnimFramesUp delay:0.06f];
            [spriteYWalkUp retain];
            
            [spriteYAnimFramesUp2 addObject:[[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:@"herospriteY08.png"]];
            [spriteYAnimFramesUp2 addObject:[[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:@"herospriteY10.png"]];
            [spriteYAnimFramesUp2 addObject:[[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:@"herospriteY10.png"]];
            [spriteYAnimFramesUp2 addObject:[[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:@"herospriteY10.png"]];
            [spriteYAnimFramesUp2 addObject:[[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:@"herospriteY08.png"]];
            spriteYWalkUp2 = [CCAnimation animationWithFrames:spriteYAnimFramesUp2 delay:0.06f];
            [spriteYWalkUp2 retain];
            
            [spriteYAnimFramesDown addObject:[[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:@"herospriteY01.png"]];
            [spriteYAnimFramesDown addObject:[[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:@"herospriteY02.png"]];
            [spriteYAnimFramesDown addObject:[[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:@"herospriteY02.png"]];
            [spriteYAnimFramesDown addObject:[[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:@"herospriteY02.png"]];
            [spriteYAnimFramesDown addObject:[[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:@"herospriteY01.png"]];
            spriteYWalkDown = [CCAnimation animationWithFrames:spriteYAnimFramesDown delay:0.06f];
            [spriteYWalkDown retain];
            
            [spriteYAnimFramesDown2 addObject:[[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:@"herospriteY01.png"]];
            [spriteYAnimFramesDown2 addObject:[[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:@"herospriteY03.png"]];
            [spriteYAnimFramesDown2 addObject:[[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:@"herospriteY03.png"]];
            [spriteYAnimFramesDown2 addObject:[[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:@"herospriteY03.png"]];
            [spriteYAnimFramesDown2 addObject:[[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:@"herospriteY01.png"]];
            spriteYWalkDown2 = [CCAnimation animationWithFrames:spriteYAnimFramesDown2 delay:0.06f];
            [spriteYWalkDown2 retain];
            
            [[CCSpriteFrameCache sharedSpriteFrameCache] addSpriteFramesWithFile:@"herospriteZAsheet.plist"];
            spriteZASheet = [CCSpriteBatchNode batchNodeWithFile:@"herospriteZAsheet.png"];
            [spriteZASheet retain];
            [self addChild:spriteZASheet];
            
            NSMutableArray *spriteZAWalkAnimFramesLeft = [NSMutableArray array];
            NSMutableArray *spriteZAWalkAnimFramesRight = [NSMutableArray array];
            NSMutableArray *spriteZAAnimFramesUp = [NSMutableArray array];
            NSMutableArray *spriteZAAnimFramesDown = [NSMutableArray array];
            NSMutableArray *spriteZAAnimFramesUp2 = [NSMutableArray array];
            NSMutableArray *spriteZAAnimFramesDown2 = [NSMutableArray array];
            
            [spriteZAWalkAnimFramesLeft addObject:[[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:@"herospriteZA05.png"]];
            [spriteZAWalkAnimFramesLeft addObject:[[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:@"herospriteZA06.png"]];
            [spriteZAWalkAnimFramesLeft addObject:[[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:@"herospriteZA06.png"]];
            [spriteZAWalkAnimFramesLeft addObject:[[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:@"herospriteZA06.png"]];
            [spriteZAWalkAnimFramesLeft addObject:[[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:@"herospriteZA05.png"]];
            spriteZAWalkLeft = [CCAnimation animationWithFrames:spriteZAWalkAnimFramesLeft delay:0.06f];
            [spriteZAWalkLeft retain];
            
            [spriteZAWalkAnimFramesRight addObject:[[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:@"herospriteZA04.png"]];
            [spriteZAWalkAnimFramesRight addObject:[[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:@"herospriteZA07.png"]];
            [spriteZAWalkAnimFramesRight addObject:[[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:@"herospriteZA07.png"]];
            [spriteZAWalkAnimFramesRight addObject:[[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:@"herospriteZA07.png"]];
            [spriteZAWalkAnimFramesRight addObject:[[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:@"herospriteZA04.png"]];
            spriteZAWalkRight = [CCAnimation animationWithFrames:spriteZAWalkAnimFramesRight delay:0.06f];
            [spriteZAWalkRight retain];
            
            [spriteZAAnimFramesUp addObject:[[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:@"herospriteZA08.png"]];
            [spriteZAAnimFramesUp addObject:[[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:@"herospriteZA09.png"]];
            [spriteZAAnimFramesUp addObject:[[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:@"herospriteZA09.png"]];
            [spriteZAAnimFramesUp addObject:[[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:@"herospriteZA09.png"]];
            [spriteZAAnimFramesUp addObject:[[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:@"herospriteZA08.png"]];
            spriteZAWalkUp = [CCAnimation animationWithFrames:spriteZAAnimFramesUp delay:0.06f];
            [spriteZAWalkUp retain];
            
            [spriteZAAnimFramesUp2 addObject:[[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:@"herospriteZA08.png"]];
            [spriteZAAnimFramesUp2 addObject:[[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:@"herospriteZA10.png"]];
            [spriteZAAnimFramesUp2 addObject:[[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:@"herospriteZA10.png"]];
            [spriteZAAnimFramesUp2 addObject:[[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:@"herospriteZA10.png"]];
            [spriteZAAnimFramesUp2 addObject:[[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:@"herospriteZA08.png"]];
            spriteZAWalkUp2 = [CCAnimation animationWithFrames:spriteZAAnimFramesUp2 delay:0.06f];
            [spriteZAWalkUp2 retain];
            
            [spriteZAAnimFramesDown addObject:[[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:@"herospriteZA01.png"]];
            [spriteZAAnimFramesDown addObject:[[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:@"herospriteZA02.png"]];
            [spriteZAAnimFramesDown addObject:[[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:@"herospriteZA02.png"]];
            [spriteZAAnimFramesDown addObject:[[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:@"herospriteZA02.png"]];
            [spriteZAAnimFramesDown addObject:[[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:@"herospriteZA01.png"]];
            spriteZAWalkDown = [CCAnimation animationWithFrames:spriteZAAnimFramesDown delay:0.06f];
            [spriteZAWalkDown retain];
            
            [spriteZAAnimFramesDown2 addObject:[[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:@"herospriteZA01.png"]];
            [spriteZAAnimFramesDown2 addObject:[[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:@"herospriteZA03.png"]];
            [spriteZAAnimFramesDown2 addObject:[[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:@"herospriteZA03.png"]];
            [spriteZAAnimFramesDown2 addObject:[[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:@"herospriteZA03.png"]];
            [spriteZAAnimFramesDown2 addObject:[[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:@"herospriteZA01.png"]];
            spriteZAWalkDown2 = [CCAnimation animationWithFrames:spriteZAAnimFramesDown2 delay:0.06f];
            [spriteZAWalkDown2 retain];
            
            [[CCSpriteFrameCache sharedSpriteFrameCache] addSpriteFramesWithFile:@"herospriteTsheet.plist"];
            spriteTSheet = [CCSpriteBatchNode batchNodeWithFile:@"herospriteTsheet.png"];
            [spriteTSheet retain];
            [self addChild:spriteTSheet];
            
            NSMutableArray *spriteTWalkAnimFramesLeft = [NSMutableArray array];
            NSMutableArray *spriteTWalkAnimFramesRight = [NSMutableArray array];
            NSMutableArray *spriteTAnimFramesUp = [NSMutableArray array];
            NSMutableArray *spriteTAnimFramesDown = [NSMutableArray array];
            NSMutableArray *spriteTAnimFramesUp2 = [NSMutableArray array];
            NSMutableArray *spriteTAnimFramesDown2 = [NSMutableArray array];
            
            [spriteTWalkAnimFramesLeft addObject:[[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:@"herospriteT05.png"]];
            [spriteTWalkAnimFramesLeft addObject:[[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:@"herospriteT06.png"]];
            [spriteTWalkAnimFramesLeft addObject:[[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:@"herospriteT06.png"]];
            [spriteTWalkAnimFramesLeft addObject:[[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:@"herospriteT06.png"]];
            [spriteTWalkAnimFramesLeft addObject:[[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:@"herospriteT05.png"]];
            spriteTWalkLeft = [CCAnimation animationWithFrames:spriteTWalkAnimFramesLeft delay:0.06f];
            [spriteTWalkLeft retain];
            
            [spriteTWalkAnimFramesRight addObject:[[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:@"herospriteT04.png"]];
            [spriteTWalkAnimFramesRight addObject:[[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:@"herospriteT07.png"]];
            [spriteTWalkAnimFramesRight addObject:[[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:@"herospriteT07.png"]];
            [spriteTWalkAnimFramesRight addObject:[[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:@"herospriteT07.png"]];
            [spriteTWalkAnimFramesRight addObject:[[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:@"herospriteT04.png"]];
            spriteTWalkRight = [CCAnimation animationWithFrames:spriteTWalkAnimFramesRight delay:0.06f];
            [spriteTWalkRight retain];
            
            [spriteTAnimFramesUp addObject:[[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:@"herospriteT08.png"]];
            [spriteTAnimFramesUp addObject:[[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:@"herospriteT09.png"]];
            [spriteTAnimFramesUp addObject:[[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:@"herospriteT09.png"]];
            [spriteTAnimFramesUp addObject:[[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:@"herospriteT09.png"]];
            [spriteTAnimFramesUp addObject:[[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:@"herospriteT08.png"]];
            spriteTWalkUp = [CCAnimation animationWithFrames:spriteTAnimFramesUp delay:0.06f];
            [spriteTWalkUp retain];
            
            [spriteTAnimFramesUp2 addObject:[[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:@"herospriteT08.png"]];
            [spriteTAnimFramesUp2 addObject:[[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:@"herospriteT10.png"]];
            [spriteTAnimFramesUp2 addObject:[[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:@"herospriteT10.png"]];
            [spriteTAnimFramesUp2 addObject:[[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:@"herospriteT10.png"]];
            [spriteTAnimFramesUp2 addObject:[[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:@"herospriteT08.png"]];
            spriteTWalkUp2 = [CCAnimation animationWithFrames:spriteTAnimFramesUp2 delay:0.06f];
            [spriteTWalkUp2 retain];
            
            [spriteTAnimFramesDown addObject:[[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:@"herospriteT01.png"]];
            [spriteTAnimFramesDown addObject:[[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:@"herospriteT02.png"]];
            [spriteTAnimFramesDown addObject:[[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:@"herospriteT02.png"]];
            [spriteTAnimFramesDown addObject:[[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:@"herospriteT02.png"]];
            [spriteTAnimFramesDown addObject:[[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:@"herospriteT01.png"]];
            spriteTWalkDown = [CCAnimation animationWithFrames:spriteTAnimFramesDown delay:0.06f];
            [spriteTWalkDown retain];
            
            [spriteTAnimFramesDown2 addObject:[[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:@"herospriteT01.png"]];
            [spriteTAnimFramesDown2 addObject:[[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:@"herospriteT03.png"]];
            [spriteTAnimFramesDown2 addObject:[[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:@"herospriteT03.png"]];
            [spriteTAnimFramesDown2 addObject:[[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:@"herospriteT03.png"]];
            [spriteTAnimFramesDown2 addObject:[[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:@"herospriteT01.png"]];
            spriteTWalkDown2 = [CCAnimation animationWithFrames:spriteTAnimFramesDown2 delay:0.06f];
            [spriteTWalkDown2 retain];
            
            [[CCSpriteFrameCache sharedSpriteFrameCache] addSpriteFramesWithFile:@"herospriteUsheet.plist"];
            spriteUSheet = [CCSpriteBatchNode batchNodeWithFile:@"herospriteUsheet.png"];
            [spriteUSheet retain];
            [self addChild:spriteUSheet];
            
            NSMutableArray *spriteUWalkAnimFramesLeft = [NSMutableArray array];
            NSMutableArray *spriteUWalkAnimFramesRight = [NSMutableArray array];
            NSMutableArray *spriteUAnimFramesUp = [NSMutableArray array];
            NSMutableArray *spriteUAnimFramesDown = [NSMutableArray array];
            NSMutableArray *spriteUAnimFramesUp2 = [NSMutableArray array];
            NSMutableArray *spriteUAnimFramesDown2 = [NSMutableArray array];
            
            [spriteUWalkAnimFramesLeft addObject:[[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:@"herospriteU05.png"]];
            [spriteUWalkAnimFramesLeft addObject:[[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:@"herospriteU06.png"]];
            [spriteUWalkAnimFramesLeft addObject:[[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:@"herospriteU06.png"]];
            [spriteUWalkAnimFramesLeft addObject:[[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:@"herospriteU06.png"]];
            [spriteUWalkAnimFramesLeft addObject:[[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:@"herospriteU05.png"]];
            spriteUWalkLeft = [CCAnimation animationWithFrames:spriteUWalkAnimFramesLeft delay:0.06f];
            [spriteUWalkLeft retain];
            
            [spriteUWalkAnimFramesRight addObject:[[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:@"herospriteU04.png"]];
            [spriteUWalkAnimFramesRight addObject:[[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:@"herospriteU07.png"]];
            [spriteUWalkAnimFramesRight addObject:[[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:@"herospriteU07.png"]];
            [spriteUWalkAnimFramesRight addObject:[[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:@"herospriteU07.png"]];
            [spriteUWalkAnimFramesRight addObject:[[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:@"herospriteU04.png"]];
            spriteUWalkRight = [CCAnimation animationWithFrames:spriteUWalkAnimFramesRight delay:0.06f];
            [spriteUWalkRight retain];
            
            [spriteUAnimFramesUp addObject:[[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:@"herospriteU08.png"]];
            [spriteUAnimFramesUp addObject:[[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:@"herospriteU09.png"]];
            [spriteUAnimFramesUp addObject:[[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:@"herospriteU09.png"]];
            [spriteUAnimFramesUp addObject:[[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:@"herospriteU09.png"]];
            [spriteUAnimFramesUp addObject:[[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:@"herospriteU08.png"]];
            spriteUWalkUp = [CCAnimation animationWithFrames:spriteUAnimFramesUp delay:0.06f];
            [spriteUWalkUp retain];
            
            [spriteUAnimFramesUp2 addObject:[[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:@"herospriteU08.png"]];
            [spriteUAnimFramesUp2 addObject:[[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:@"herospriteU10.png"]];
            [spriteUAnimFramesUp2 addObject:[[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:@"herospriteU10.png"]];
            [spriteUAnimFramesUp2 addObject:[[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:@"herospriteU10.png"]];
            [spriteUAnimFramesUp2 addObject:[[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:@"herospriteU08.png"]];
            spriteUWalkUp2 = [CCAnimation animationWithFrames:spriteUAnimFramesUp2 delay:0.06f];
            [spriteUWalkUp2 retain];
            
            [spriteUAnimFramesDown addObject:[[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:@"herospriteU01.png"]];
            [spriteUAnimFramesDown addObject:[[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:@"herospriteU02.png"]];
            [spriteUAnimFramesDown addObject:[[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:@"herospriteU02.png"]];
            [spriteUAnimFramesDown addObject:[[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:@"herospriteU02.png"]];
            [spriteUAnimFramesDown addObject:[[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:@"herospriteU01.png"]];
            spriteUWalkDown = [CCAnimation animationWithFrames:spriteUAnimFramesDown delay:0.06f];
            [spriteUWalkDown retain];
            
            [spriteUAnimFramesDown2 addObject:[[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:@"herospriteU01.png"]];
            [spriteUAnimFramesDown2 addObject:[[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:@"herospriteU03.png"]];
            [spriteUAnimFramesDown2 addObject:[[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:@"herospriteU03.png"]];
            [spriteUAnimFramesDown2 addObject:[[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:@"herospriteU03.png"]];
            [spriteUAnimFramesDown2 addObject:[[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:@"herospriteU01.png"]];
            spriteUWalkDown2 = [CCAnimation animationWithFrames:spriteUAnimFramesDown2 delay:0.06f];
            [spriteUWalkDown2 retain];
            
            [[CCSpriteFrameCache sharedSpriteFrameCache] addSpriteFramesWithFile:@"herospriteCsheet.plist"];
            spriteCSheet = [CCSpriteBatchNode batchNodeWithFile:@"herospriteCsheet.png"];
            [spriteCSheet retain];
            [self addChild:spriteCSheet];
            
            NSMutableArray *spriteCWalkAnimFramesLeft = [NSMutableArray array];
            NSMutableArray *spriteCWalkAnimFramesRight = [NSMutableArray array];
            NSMutableArray *spriteCAnimFramesUp = [NSMutableArray array];
            NSMutableArray *spriteCAnimFramesDown = [NSMutableArray array];
            NSMutableArray *spriteCAnimFramesUp2 = [NSMutableArray array];
            NSMutableArray *spriteCAnimFramesDown2 = [NSMutableArray array];
            
            [spriteCWalkAnimFramesLeft addObject:[[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:@"herospriteC05.png"]];
            [spriteCWalkAnimFramesLeft addObject:[[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:@"herospriteC06.png"]];
            [spriteCWalkAnimFramesLeft addObject:[[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:@"herospriteC06.png"]];
            [spriteCWalkAnimFramesLeft addObject:[[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:@"herospriteC06.png"]];
            [spriteCWalkAnimFramesLeft addObject:[[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:@"herospriteC05.png"]];
            spriteCWalkLeft = [CCAnimation animationWithFrames:spriteCWalkAnimFramesLeft delay:0.06f];
            [spriteCWalkLeft retain];
            
            [spriteCWalkAnimFramesRight addObject:[[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:@"herospriteC04.png"]];
            [spriteCWalkAnimFramesRight addObject:[[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:@"herospriteC07.png"]];
            [spriteCWalkAnimFramesRight addObject:[[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:@"herospriteC07.png"]];
            [spriteCWalkAnimFramesRight addObject:[[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:@"herospriteC07.png"]];
            [spriteCWalkAnimFramesRight addObject:[[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:@"herospriteC04.png"]];
            spriteCWalkRight = [CCAnimation animationWithFrames:spriteCWalkAnimFramesRight delay:0.06f];
            [spriteCWalkRight retain];
            
            [spriteCAnimFramesUp addObject:[[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:@"herospriteC08.png"]];
            [spriteCAnimFramesUp addObject:[[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:@"herospriteC09.png"]];
            [spriteCAnimFramesUp addObject:[[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:@"herospriteC09.png"]];
            [spriteCAnimFramesUp addObject:[[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:@"herospriteC09.png"]];
            [spriteCAnimFramesUp addObject:[[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:@"herospriteC08.png"]];
            spriteCWalkUp = [CCAnimation animationWithFrames:spriteCAnimFramesUp delay:0.06f];
            [spriteCWalkUp retain];
            
            [spriteCAnimFramesUp2 addObject:[[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:@"herospriteC08.png"]];
            [spriteCAnimFramesUp2 addObject:[[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:@"herospriteC10.png"]];
            [spriteCAnimFramesUp2 addObject:[[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:@"herospriteC10.png"]];
            [spriteCAnimFramesUp2 addObject:[[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:@"herospriteC10.png"]];
            [spriteCAnimFramesUp2 addObject:[[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:@"herospriteC08.png"]];
            spriteCWalkUp2 = [CCAnimation animationWithFrames:spriteCAnimFramesUp2 delay:0.06f];
            [spriteCWalkUp2 retain];
            
            [spriteCAnimFramesDown addObject:[[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:@"herospriteC01.png"]];
            [spriteCAnimFramesDown addObject:[[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:@"herospriteC02.png"]];
            [spriteCAnimFramesDown addObject:[[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:@"herospriteC02.png"]];
            [spriteCAnimFramesDown addObject:[[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:@"herospriteC02.png"]];
            [spriteCAnimFramesDown addObject:[[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:@"herospriteC01.png"]];
            spriteCWalkDown = [CCAnimation animationWithFrames:spriteCAnimFramesDown delay:0.06f];
            [spriteCWalkDown retain];
            
            [spriteCAnimFramesDown2 addObject:[[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:@"herospriteC01.png"]];
            [spriteCAnimFramesDown2 addObject:[[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:@"herospriteC03.png"]];
            [spriteCAnimFramesDown2 addObject:[[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:@"herospriteC03.png"]];
            [spriteCAnimFramesDown2 addObject:[[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:@"herospriteC03.png"]];
            [spriteCAnimFramesDown2 addObject:[[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:@"herospriteC01.png"]];
            spriteCWalkDown2 = [CCAnimation animationWithFrames:spriteCAnimFramesDown2 delay:0.06f];
            [spriteCWalkDown2 retain];
            
            [[CCSpriteFrameCache sharedSpriteFrameCache] addSpriteFramesWithFile:@"herospriteIsheet.plist"];
            spriteISheet = [CCSpriteBatchNode batchNodeWithFile:@"herospriteIsheet.png"];
            [spriteISheet retain];
            [self addChild:spriteISheet];
            
            NSMutableArray *spriteIWalkAnimFramesLeft = [NSMutableArray array];
            NSMutableArray *spriteIWalkAnimFramesRight = [NSMutableArray array];
            NSMutableArray *spriteIAnimFramesUp = [NSMutableArray array];
            NSMutableArray *spriteIAnimFramesDown = [NSMutableArray array];
            NSMutableArray *spriteIAnimFramesUp2 = [NSMutableArray array];
            NSMutableArray *spriteIAnimFramesDown2 = [NSMutableArray array];
            
            [spriteIWalkAnimFramesLeft addObject:[[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:@"herospriteI05.png"]];
            [spriteIWalkAnimFramesLeft addObject:[[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:@"herospriteI06.png"]];
            [spriteIWalkAnimFramesLeft addObject:[[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:@"herospriteI06.png"]];
            [spriteIWalkAnimFramesLeft addObject:[[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:@"herospriteI06.png"]];
            [spriteIWalkAnimFramesLeft addObject:[[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:@"herospriteI05.png"]];
            spriteIWalkLeft = [CCAnimation animationWithFrames:spriteIWalkAnimFramesLeft delay:0.06f];
            [spriteIWalkLeft retain];
            
            [spriteIWalkAnimFramesRight addObject:[[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:@"herospriteI04.png"]];
            [spriteIWalkAnimFramesRight addObject:[[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:@"herospriteI07.png"]];
            [spriteIWalkAnimFramesRight addObject:[[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:@"herospriteI07.png"]];
            [spriteIWalkAnimFramesRight addObject:[[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:@"herospriteI07.png"]];
            [spriteIWalkAnimFramesRight addObject:[[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:@"herospriteI04.png"]];
            spriteIWalkRight = [CCAnimation animationWithFrames:spriteIWalkAnimFramesRight delay:0.06f];
            [spriteIWalkRight retain];
            
            [spriteIAnimFramesUp addObject:[[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:@"herospriteI08.png"]];
            [spriteIAnimFramesUp addObject:[[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:@"herospriteI09.png"]];
            [spriteIAnimFramesUp addObject:[[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:@"herospriteI09.png"]];
            [spriteIAnimFramesUp addObject:[[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:@"herospriteI09.png"]];
            [spriteIAnimFramesUp addObject:[[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:@"herospriteI08.png"]];
            spriteIWalkUp = [CCAnimation animationWithFrames:spriteIAnimFramesUp delay:0.06f];
            [spriteIWalkUp retain];
            
            [spriteIAnimFramesUp2 addObject:[[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:@"herospriteI08.png"]];
            [spriteIAnimFramesUp2 addObject:[[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:@"herospriteI10.png"]];
            [spriteIAnimFramesUp2 addObject:[[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:@"herospriteI10.png"]];
            [spriteIAnimFramesUp2 addObject:[[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:@"herospriteI10.png"]];
            [spriteIAnimFramesUp2 addObject:[[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:@"herospriteI08.png"]];
            spriteIWalkUp2 = [CCAnimation animationWithFrames:spriteIAnimFramesUp2 delay:0.06f];
            [spriteIWalkUp2 retain];
            
            [spriteIAnimFramesDown addObject:[[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:@"herospriteI01.png"]];
            [spriteIAnimFramesDown addObject:[[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:@"herospriteI02.png"]];
            [spriteIAnimFramesDown addObject:[[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:@"herospriteI02.png"]];
            [spriteIAnimFramesDown addObject:[[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:@"herospriteI02.png"]];
            [spriteIAnimFramesDown addObject:[[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:@"herospriteI01.png"]];
            spriteIWalkDown = [CCAnimation animationWithFrames:spriteIAnimFramesDown delay:0.06f];
            [spriteIWalkDown retain];
            
            [spriteIAnimFramesDown2 addObject:[[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:@"herospriteI01.png"]];
            [spriteIAnimFramesDown2 addObject:[[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:@"herospriteI03.png"]];
            [spriteIAnimFramesDown2 addObject:[[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:@"herospriteI03.png"]];
            [spriteIAnimFramesDown2 addObject:[[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:@"herospriteI03.png"]];
            [spriteIAnimFramesDown2 addObject:[[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:@"herospriteI01.png"]];
            spriteIWalkDown2 = [CCAnimation animationWithFrames:spriteIAnimFramesDown2 delay:0.06f];
            [spriteIWalkDown2 retain];
            
            [[CCSpriteFrameCache sharedSpriteFrameCache] addSpriteFramesWithFile:@"herospriteSsheet.plist"];
            spriteSSheet = [CCSpriteBatchNode batchNodeWithFile:@"herospriteSsheet.png"];
            [spriteSSheet retain];
            [self addChild:spriteSSheet];
            
            NSMutableArray *spriteSWalkAnimFramesLeft = [NSMutableArray array];
            NSMutableArray *spriteSWalkAnimFramesRight = [NSMutableArray array];
            NSMutableArray *spriteSAnimFramesUp = [NSMutableArray array];
            NSMutableArray *spriteSAnimFramesDown = [NSMutableArray array];
            NSMutableArray *spriteSAnimFramesUp2 = [NSMutableArray array];
            NSMutableArray *spriteSAnimFramesDown2 = [NSMutableArray array];
            
            [spriteSWalkAnimFramesLeft addObject:[[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:@"herospriteS05.png"]];
            [spriteSWalkAnimFramesLeft addObject:[[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:@"herospriteS06.png"]];
            [spriteSWalkAnimFramesLeft addObject:[[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:@"herospriteS06.png"]];
            [spriteSWalkAnimFramesLeft addObject:[[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:@"herospriteS06.png"]];
            [spriteSWalkAnimFramesLeft addObject:[[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:@"herospriteS05.png"]];
            spriteSWalkLeft = [CCAnimation animationWithFrames:spriteSWalkAnimFramesLeft delay:0.06f];
            [spriteSWalkLeft retain];
            
            [spriteSWalkAnimFramesRight addObject:[[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:@"herospriteS04.png"]];
            [spriteSWalkAnimFramesRight addObject:[[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:@"herospriteS07.png"]];
            [spriteSWalkAnimFramesRight addObject:[[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:@"herospriteS07.png"]];
            [spriteSWalkAnimFramesRight addObject:[[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:@"herospriteS07.png"]];
            [spriteSWalkAnimFramesRight addObject:[[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:@"herospriteS04.png"]];
            spriteSWalkRight = [CCAnimation animationWithFrames:spriteSWalkAnimFramesRight delay:0.06f];
            [spriteSWalkRight retain];
            
            [spriteSAnimFramesUp addObject:[[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:@"herospriteS08.png"]];
            [spriteSAnimFramesUp addObject:[[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:@"herospriteS09.png"]];
            [spriteSAnimFramesUp addObject:[[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:@"herospriteS09.png"]];
            [spriteSAnimFramesUp addObject:[[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:@"herospriteS09.png"]];
            [spriteSAnimFramesUp addObject:[[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:@"herospriteS08.png"]];
            spriteSWalkUp = [CCAnimation animationWithFrames:spriteSAnimFramesUp delay:0.06f];
            [spriteSWalkUp retain];
            
            [spriteSAnimFramesUp2 addObject:[[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:@"herospriteS08.png"]];
            [spriteSAnimFramesUp2 addObject:[[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:@"herospriteS10.png"]];
            [spriteSAnimFramesUp2 addObject:[[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:@"herospriteS10.png"]];
            [spriteSAnimFramesUp2 addObject:[[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:@"herospriteS10.png"]];
            [spriteSAnimFramesUp2 addObject:[[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:@"herospriteS08.png"]];
            spriteSWalkUp2 = [CCAnimation animationWithFrames:spriteSAnimFramesUp2 delay:0.06f];
            [spriteSWalkUp2 retain];
            
            [spriteSAnimFramesDown addObject:[[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:@"herospriteS01.png"]];
            [spriteSAnimFramesDown addObject:[[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:@"herospriteS02.png"]];
            [spriteSAnimFramesDown addObject:[[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:@"herospriteS02.png"]];
            [spriteSAnimFramesDown addObject:[[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:@"herospriteS02.png"]];
            [spriteSAnimFramesDown addObject:[[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:@"herospriteS01.png"]];
            spriteSWalkDown = [CCAnimation animationWithFrames:spriteSAnimFramesDown delay:0.06f];
            [spriteSWalkDown retain];
            
            [spriteSAnimFramesDown2 addObject:[[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:@"herospriteS01.png"]];
            [spriteSAnimFramesDown2 addObject:[[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:@"herospriteS03.png"]];
            [spriteSAnimFramesDown2 addObject:[[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:@"herospriteS03.png"]];
            [spriteSAnimFramesDown2 addObject:[[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:@"herospriteS03.png"]];
            [spriteSAnimFramesDown2 addObject:[[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:@"herospriteS01.png"]];
            spriteSWalkDown2 = [CCAnimation animationWithFrames:spriteSAnimFramesDown2 delay:0.06f];
            [spriteSWalkDown2 retain];
        }
        
        /////////////////////////////////////////////////////////
        
        self.sprite120 = [InteractiveSprite spriteWithSpriteFrameName:@"herospriteG04.png"];
        self.sprite120.spriteCode = 120;
        
        self.sprite120.orientation = 1;
        if (self.hero.sprite120_Orientation)
        {
            self.sprite120.orientation = self.hero.sprite120_Orientation;
        }
        if (self.sprite120.orientation == 1)
        {
            [self.sprite120 setDisplayFrame:[[spriteGWalkDown frames] objectAtIndex:0]];
        }
        else if (self.sprite120.orientation == 2)
        {
            [self.sprite120 setDisplayFrame:[[spriteGWalkUp frames] objectAtIndex:0]];
        }
        else if (self.sprite120.orientation == 3)
        {
            [self.sprite120 setDisplayFrame:[[spriteGWalkRight frames] objectAtIndex:0]];
        }
        else
        {
            [self.sprite120 setDisplayFrame:[[spriteGWalkLeft frames] objectAtIndex:0]];
        }
        
        //[self schedule:@selector(updateSprite120) interval:(1.5f)];
        
        
        if (self.hero.sprite120position.x != 0)
        {
            self.sprite120.position = self.hero.sprite120position;
        }
        else
        {
            NSMutableDictionary *sprite120start = [objects objectNamed:@"spriteStart120"];
            double x1 = [[sprite120start valueForKey:@"x"]floatValue];
            double y1 = [[sprite120start valueForKey:@"y"]floatValue];
            self.sprite120.position = ccp(x1,y1);
        }
        
        [self.theHKMap addChild:self.sprite120 z:self.bgLayer.zOrder];
        
        CGPoint tileCoord1 = [self tileCoordForPosition:self.sprite120.position];
        int tileGID1 = [self.bgLayer tileGIDAt:tileCoord1];
        [self.bgLayer removeTileAt:tileCoord1];
        [self.bgLayer setTileGID:(tileGID1 + 1) at:tileCoord1];
        
        /////////////////////////////////////////////////////////
        
        self.sprite121 = [InteractiveSprite spriteWithSpriteFrameName:@"herospriteG04.png"];
        self.sprite121.spriteCode = 121;
        
        self.sprite121.orientation = 1;
        if (self.hero.sprite121_Orientation)
        {
            self.sprite121.orientation = self.hero.sprite121_Orientation;
        }
        if (self.sprite121.orientation == 1)
        {
            [self.sprite121 setDisplayFrame:[[spriteGWalkDown frames] objectAtIndex:0]];
        }
        else if (self.sprite121.orientation == 2)
        {
            [self.sprite121 setDisplayFrame:[[spriteGWalkUp frames] objectAtIndex:0]];
        }
        else if (self.sprite121.orientation == 3)
        {
            [self.sprite121 setDisplayFrame:[[spriteGWalkRight frames] objectAtIndex:0]];
        }
        else
        {
            [self.sprite121 setDisplayFrame:[[spriteGWalkLeft frames] objectAtIndex:0]];
        }
        
        //[self schedule:@selector(updateSprite121) interval:(1.375f)];
        
        
        if (self.hero.sprite121position.x != 0)
        {
            self.sprite121.position = self.hero.sprite121position;
        }
        else
        {
            NSMutableDictionary *sprite121start = [objects objectNamed:@"spriteStart121"];
            double x1 = [[sprite121start valueForKey:@"x"]floatValue];
            double y1 = [[sprite121start valueForKey:@"y"]floatValue];
            self.sprite121.position = ccp(x1,y1);
        }
        
        [self.theHKMap addChild:self.sprite121 z:self.bgLayer.zOrder];
        
        CGPoint tileCoord2 = [self tileCoordForPosition:self.sprite121.position];
        int tileGID2 = [self.bgLayer tileGIDAt:tileCoord2];
        [self.bgLayer removeTileAt:tileCoord2];
        [self.bgLayer setTileGID:(tileGID2 + 2) at:tileCoord2];
        
        /////////////////////////////////////////////////////////
        
        self.sprite122 = [InteractiveSprite spriteWithSpriteFrameName:@"herospriteY04.png"];
        self.sprite122.spriteCode = 122;
        
        self.sprite122.orientation = 1;
        if (self.hero.sprite122_Orientation)
        {
            self.sprite122.orientation = self.hero.sprite122_Orientation;
        }
        if (self.sprite122.orientation == 1)
        {
            [self.sprite122 setDisplayFrame:[[spriteYWalkDown frames] objectAtIndex:0]];
        }
        else if (self.sprite122.orientation == 2)
        {
            [self.sprite122 setDisplayFrame:[[spriteYWalkUp frames] objectAtIndex:0]];
        }
        else if (self.sprite122.orientation == 3)
        {
            [self.sprite122 setDisplayFrame:[[spriteYWalkRight frames] objectAtIndex:0]];
        }
        else
        {
            [self.sprite122 setDisplayFrame:[[spriteYWalkLeft frames] objectAtIndex:0]];
        }
        
        //[self schedule:@selector(updateSprite122) interval:(1.625f)];
        
        
        if (self.hero.sprite122position.x != 0)
        {
            self.sprite122.position = self.hero.sprite122position;
        }
        else
        {
            NSMutableDictionary *sprite122start = [objects objectNamed:@"spriteStart122"];
            double x1 = [[sprite122start valueForKey:@"x"]floatValue];
            double y1 = [[sprite122start valueForKey:@"y"]floatValue];
            self.sprite122.position = ccp(x1,y1);
        }
        
        [self.theHKMap addChild:self.sprite122 z:self.bgLayer.zOrder];
        
        CGPoint tileCoord3 = [self tileCoordForPosition:self.sprite122.position];
        int tileGID3 = [self.bgLayer tileGIDAt:tileCoord3];
        [self.bgLayer removeTileAt:tileCoord3];
        [self.bgLayer setTileGID:(tileGID3 + 3) at:tileCoord3];
        
        /////////////////////////////////////////////////////////
        
        self.sprite123 = [InteractiveSprite spriteWithSpriteFrameName:@"herospriteZA04.png"];
        self.sprite123.spriteCode = 123;
        
        self.sprite123.orientation = 1;
        if (self.hero.sprite123_Orientation)
        {
            self.sprite123.orientation = self.hero.sprite123_Orientation;
        }
        if (self.sprite123.orientation == 1)
        {
            [self.sprite123 setDisplayFrame:[[spriteZAWalkDown frames] objectAtIndex:0]];
        }
        else if (self.sprite123.orientation == 2)
        {
            [self.sprite123 setDisplayFrame:[[spriteZAWalkUp frames] objectAtIndex:0]];
        }
        else if (self.sprite123.orientation == 3)
        {
            [self.sprite123 setDisplayFrame:[[spriteZAWalkRight frames] objectAtIndex:0]];
        }
        else
        {
            [self.sprite123 setDisplayFrame:[[spriteZAWalkLeft frames] objectAtIndex:0]];
        }
        
        //[self schedule:@selector(updateSprite123) interval:(1.25f)];
        
        
        if (self.hero.sprite123position.x != 0)
        {
            self.sprite123.position = self.hero.sprite123position;
        }
        else
        {
            NSMutableDictionary *sprite123start = [objects objectNamed:@"spriteStart123"];
            double x1 = [[sprite123start valueForKey:@"x"]floatValue];
            double y1 = [[sprite123start valueForKey:@"y"]floatValue];
            self.sprite123.position = ccp(x1,y1);
        }
        
        [self.theHKMap addChild:self.sprite123 z:self.bgLayer.zOrder];
        
        CGPoint tileCoord4 = [self tileCoordForPosition:self.sprite123.position];
        int tileGID4 = [self.bgLayer tileGIDAt:tileCoord4];
        [self.bgLayer removeTileAt:tileCoord4];
        [self.bgLayer setTileGID:(tileGID4 + 4) at:tileCoord4];
        
        /////////////////////////////////////////////////////////
        
        self.sprite124 = [InteractiveSprite spriteWithSpriteFrameName:@"herospriteT05.png"];
        self.sprite124.spriteCode = 124;
        
        self.sprite124.orientation = 1;
        if (self.hero.sprite124_Orientation)
        {
            self.sprite124.orientation = self.hero.sprite124_Orientation;
        }
        if (self.sprite124.orientation == 1)
        {
            [self.sprite124 setDisplayFrame:[[spriteTWalkDown frames] objectAtIndex:0]];
        }
        else if (self.sprite124.orientation == 2)
        {
            [self.sprite124 setDisplayFrame:[[spriteTWalkUp frames] objectAtIndex:0]];
        }
        else if (self.sprite124.orientation == 3)
        {
            [self.sprite124 setDisplayFrame:[[spriteTWalkRight frames] objectAtIndex:0]];
        }
        else
        {
            [self.sprite124 setDisplayFrame:[[spriteTWalkLeft frames] objectAtIndex:0]];
        }
        
        //[self schedule:@selector(updateSprite124) interval:(1.25f)];
        
        
        if (self.hero.sprite124position.x != 0)
        {
            self.sprite124.position = self.hero.sprite124position;
        }
        else
        {
            NSMutableDictionary *sprite124start = [objects objectNamed:@"spriteStart124"];
            double x1 = [[sprite124start valueForKey:@"x"]floatValue];
            double y1 = [[sprite124start valueForKey:@"y"]floatValue];
            self.sprite124.position = ccp(x1,y1);
        }
        
        [self.theHKMap addChild:self.sprite124 z:self.bgLayer.zOrder];
        
        CGPoint tileCoord5 = [self tileCoordForPosition:self.sprite124.position];
        int tileGID5 = [self.bgLayer tileGIDAt:tileCoord5];
        [self.bgLayer removeTileAt:tileCoord5];
        [self.bgLayer setTileGID:(tileGID5 + 5) at:tileCoord5];
        
        /////////////////////////////////////////////////////////
        
        self.sprite125 = [InteractiveSprite spriteWithSpriteFrameName:@"herospriteT05.png"];
        self.sprite125.spriteCode = 125;
        
        self.sprite125.orientation = 1;
        if (self.hero.sprite125_Orientation)
        {
            self.sprite125.orientation = self.hero.sprite125_Orientation;
        }
        if (self.sprite125.orientation == 1)
        {
            [self.sprite125 setDisplayFrame:[[spriteTWalkDown frames] objectAtIndex:0]];
        }
        else if (self.sprite125.orientation == 2)
        {
            [self.sprite125 setDisplayFrame:[[spriteTWalkUp frames] objectAtIndex:0]];
        }
        else if (self.sprite125.orientation == 3)
        {
            [self.sprite125 setDisplayFrame:[[spriteTWalkRight frames] objectAtIndex:0]];
        }
        else
        {
            [self.sprite125 setDisplayFrame:[[spriteTWalkLeft frames] objectAtIndex:0]];
        }
        
        //[self schedule:@selector(updateSprite125) interval:(1.75f)];
        
        
        if (self.hero.sprite125position.x != 0)
        {
            self.sprite125.position = self.hero.sprite125position;
        }
        else
        {
            NSMutableDictionary *sprite125start = [objects objectNamed:@"spriteStart125"];
            double x1 = [[sprite125start valueForKey:@"x"]floatValue];
            double y1 = [[sprite125start valueForKey:@"y"]floatValue];
            self.sprite125.position = ccp(x1,y1);
        }
        
        [self.theHKMap addChild:self.sprite125 z:self.bgLayer.zOrder];
        
        CGPoint tileCoord6 = [self tileCoordForPosition:self.sprite125.position];
        int tileGID6 = [self.bgLayer tileGIDAt:tileCoord6];
        [self.bgLayer removeTileAt:tileCoord6];
        [self.bgLayer setTileGID:(tileGID6 + 6) at:tileCoord6];
        
        /////////////////////////////////////////////////////////
        
        self.sprite126 = [InteractiveSprite spriteWithSpriteFrameName:@"herospriteU05.png"];
        self.sprite126.spriteCode = 126;
        
        self.sprite126.orientation = 1;
        if (self.hero.sprite126_Orientation)
        {
            self.sprite126.orientation = self.hero.sprite126_Orientation;
        }
        if (self.sprite126.orientation == 1)
        {
            [self.sprite126 setDisplayFrame:[[spriteUWalkDown frames] objectAtIndex:0]];
        }
        else if (self.sprite126.orientation == 2)
        {
            [self.sprite126 setDisplayFrame:[[spriteUWalkUp frames] objectAtIndex:0]];
        }
        else if (self.sprite126.orientation == 3)
        {
            [self.sprite126 setDisplayFrame:[[spriteUWalkRight frames] objectAtIndex:0]];
        }
        else
        {
            [self.sprite126 setDisplayFrame:[[spriteUWalkLeft frames] objectAtIndex:0]];
        }
        
        //[self schedule:@selector(updateSprite126) interval:(1.5625f)];
        
        
        if (self.hero.sprite126position.x != 0)
        {
            self.sprite126.position = self.hero.sprite126position;
        }
        else
        {
            NSMutableDictionary *sprite126start = [objects objectNamed:@"spriteStart126"];
            double x1 = [[sprite126start valueForKey:@"x"]floatValue];
            double y1 = [[sprite126start valueForKey:@"y"]floatValue];
            self.sprite126.position = ccp(x1,y1);
        }
        
        [self.theHKMap addChild:self.sprite126 z:self.bgLayer.zOrder];
        
        CGPoint tileCoord7 = [self tileCoordForPosition:self.sprite126.position];
        int tileGID7 = [self.bgLayer tileGIDAt:tileCoord7];
        [self.bgLayer removeTileAt:tileCoord7];
        [self.bgLayer setTileGID:(tileGID7 + 7) at:tileCoord7];
        
        /////////////////////////////////////////////////////////
        
        self.sprite127 = [InteractiveSprite spriteWithSpriteFrameName:@"herospriteC05.png"];
        self.sprite127.spriteCode = 127;
        
        self.sprite127.orientation = 1;
        if (self.hero.sprite127_Orientation)
        {
            self.sprite127.orientation = self.hero.sprite127_Orientation;
        }
        if (self.sprite127.orientation == 1)
        {
            [self.sprite127 setDisplayFrame:[[spriteCWalkDown frames] objectAtIndex:0]];
        }
        else if (self.sprite127.orientation == 2)
        {
            [self.sprite127 setDisplayFrame:[[spriteCWalkUp frames] objectAtIndex:0]];
        }
        else if (self.sprite127.orientation == 3)
        {
            [self.sprite127 setDisplayFrame:[[spriteCWalkRight frames] objectAtIndex:0]];
        }
        else
        {
            [self.sprite127 setDisplayFrame:[[spriteCWalkLeft frames] objectAtIndex:0]];
        }
        
        //[self schedule:@selector(updateSprite127) interval:(1.4325f)];
        
        
        if (self.hero.sprite127position.x != 0)
        {
            self.sprite127.position = self.hero.sprite127position;
        }
        else
        {
            NSMutableDictionary *sprite127start = [objects objectNamed:@"spriteStart127"];
            double x1 = [[sprite127start valueForKey:@"x"]floatValue];
            double y1 = [[sprite127start valueForKey:@"y"]floatValue];
            self.sprite127.position = ccp(x1,y1);
        }
        
        [self.theHKMap addChild:self.sprite127 z:self.bgLayer.zOrder];
        
        CGPoint tileCoord8 = [self tileCoordForPosition:self.sprite127.position];
        int tileGID8 = [self.bgLayer tileGIDAt:tileCoord8];
        [self.bgLayer removeTileAt:tileCoord8];
        [self.bgLayer setTileGID:(tileGID8 + 8) at:tileCoord8];
        
        /////////////////////////////////////////////////////////

        self.sprite128 = [InteractiveSprite spriteWithSpriteFrameName:@"herospriteI05.png"];
        self.sprite128.spriteCode = 128;
        
        self.sprite128.orientation = 1;
        if (self.hero.sprite128_Orientation)
        {
            self.sprite128.orientation = self.hero.sprite128_Orientation;
        }
        if (self.sprite128.orientation == 1)
        {
            [self.sprite128 setDisplayFrame:[[spriteIWalkDown frames] objectAtIndex:0]];
        }
        else if (self.sprite128.orientation == 2)
        {
            [self.sprite128 setDisplayFrame:[[spriteIWalkUp frames] objectAtIndex:0]];
        }
        else if (self.sprite128.orientation == 3)
        {
            [self.sprite128 setDisplayFrame:[[spriteIWalkRight frames] objectAtIndex:0]];
        }
        else
        {
            [self.sprite128 setDisplayFrame:[[spriteIWalkLeft frames] objectAtIndex:0]];
        }
        
        //[self schedule:@selector(updateSprite128) interval:(1.8125f)];
        
        
        if (self.hero.sprite128position.x != 0)
        {
            self.sprite128.position = self.hero.sprite128position;
        }
        else
        {
            NSMutableDictionary *sprite128start = [objects objectNamed:@"spriteStart128"];
            double x1 = [[sprite128start valueForKey:@"x"]floatValue];
            double y1 = [[sprite128start valueForKey:@"y"]floatValue];
            self.sprite128.position = ccp(x1,y1);
        }
        
        [self.theHKMap addChild:self.sprite128 z:self.bgLayer.zOrder];
        
        CGPoint tileCoord9 = [self tileCoordForPosition:self.sprite128.position];
        int tileGID9 = [self.bgLayer tileGIDAt:tileCoord9];
        [self.bgLayer removeTileAt:tileCoord9];
        [self.bgLayer setTileGID:(tileGID9 + 9) at:tileCoord9];
        
        /////////////////////////////////////////////////////////
        
        self.sprite129 = [InteractiveSprite spriteWithSpriteFrameName:@"herospriteS05.png"];
        self.sprite129.spriteCode = 129;
        
        self.sprite129.orientation = 1;
        if (self.hero.sprite129_Orientation)
        {
            self.sprite129.orientation = self.hero.sprite129_Orientation;
        }
        if (self.sprite129.orientation == 1)
        {
            [self.sprite129 setDisplayFrame:[[spriteSWalkDown frames] objectAtIndex:0]];
        }
        else if (self.sprite129.orientation == 2)
        {
            [self.sprite129 setDisplayFrame:[[spriteSWalkUp frames] objectAtIndex:0]];
        }
        else if (self.sprite129.orientation == 3)
        {
            [self.sprite129 setDisplayFrame:[[spriteSWalkRight frames] objectAtIndex:0]];
        }
        else
        {
            [self.sprite129 setDisplayFrame:[[spriteSWalkLeft frames] objectAtIndex:0]];
        }
        
        //[self schedule:@selector(updateSprite129) interval:(1.8125f)];
        
        
        if (self.hero.sprite129position.x != 0)
        {
            self.sprite129.position = self.hero.sprite129position;
        }
        else
        {
            NSMutableDictionary *sprite129start = [objects objectNamed:@"spriteStart129"];
            double x1 = [[sprite129start valueForKey:@"x"]floatValue];
            double y1 = [[sprite129start valueForKey:@"y"]floatValue];
            self.sprite129.position = ccp(x1,y1);
        }
        
        [self.theHKMap addChild:self.sprite129 z:self.bgLayer.zOrder];
        
        CGPoint tileCoord10 = [self tileCoordForPosition:self.sprite129.position];
        int tileGID10 = [self.bgLayer tileGIDAt:tileCoord10];
        [self.bgLayer removeTileAt:tileCoord10];
        [self.bgLayer setTileGID:(tileGID10 + 10) at:tileCoord10];
        
        /////////////////////////////////////////////////////////
        
        
        
        
        
        //
        //items
        //
        
        if (!self.hero.gotItem29)
        {
            self.item29 = [CCSprite spriteWithFile:@"treasurechestSprite01.png"];
            NSMutableDictionary *item = [objects objectNamed:@"item29"];
            double x1 = [[item valueForKey:@"x"]floatValue];
            double y1 = [[item valueForKey:@"y"]floatValue];
            self.item29.position = ccp(x1,y1);
            [self.theHKMap addChild:self.item29 z:self.bgLayer.zOrder];
        }
        else
        {
            self.item29 = [CCSprite spriteWithFile:@"treasurechestSprite02.png"];
            NSMutableDictionary *item = [objects objectNamed:@"item29"];
            double x1 = [[item valueForKey:@"x"]floatValue];
            double y1 = [[item valueForKey:@"y"]floatValue];
            self.item29.position = ccp(x1,y1);
            [self.theHKMap addChild:self.item29 z:self.bgLayer.zOrder];
        }
        if (!self.hero.gotItem30)
        {
            self.item30 = [CCSprite spriteWithFile:@"treasurechestSprite01.png"];
            NSMutableDictionary *item = [objects objectNamed:@"item30"];
            double x1 = [[item valueForKey:@"x"]floatValue];
            double y1 = [[item valueForKey:@"y"]floatValue];
            self.item30.position = ccp(x1,y1);
            [self.theHKMap addChild:self.item30 z:self.bgLayer.zOrder];
        }
        else
        {
            self.item30 = [CCSprite spriteWithFile:@"treasurechestSprite02.png"];
            NSMutableDictionary *item = [objects objectNamed:@"item30"];
            double x1 = [[item valueForKey:@"x"]floatValue];
            double y1 = [[item valueForKey:@"y"]floatValue];
            self.item30.position = ccp(x1,y1);
            [self.theHKMap addChild:self.item30 z:self.bgLayer.zOrder];
        }
        if (!self.hero.gotItem31)
        {
            self.item31 = [CCSprite spriteWithFile:@"treasurechestSprite01.png"];
            NSMutableDictionary *item = [objects objectNamed:@"item31"];
            double x1 = [[item valueForKey:@"x"]floatValue];
            double y1 = [[item valueForKey:@"y"]floatValue];
            self.item31.position = ccp(x1,y1);
            [self.theHKMap addChild:self.item31 z:self.bgLayer.zOrder];
        }
        else
        {
            self.item31 = [CCSprite spriteWithFile:@"treasurechestSprite02.png"];
            NSMutableDictionary *item = [objects objectNamed:@"item31"];
            double x1 = [[item valueForKey:@"x"]floatValue];
            double y1 = [[item valueForKey:@"y"]floatValue];
            self.item31.position = ccp(x1,y1);
            [self.theHKMap addChild:self.item31 z:self.bgLayer.zOrder];
        }
        
        double x;
        double y;
        
        prev = self.hero.musicCode;
        
        //1(coming from login),2(gate/cave/stairs/dungeon), 3(teleport), 4(herodied - pl1), 5(start new game), 6(beat ionak - go pl1),7(item shop/menu),8(battle win/flee),121-beatVankurian Orc
        if (self.hero.mapInitMode == 1)
        {
            prev = 0; 
            
            self.spriteOrientation = 1;
            
            x = self.hero.position.x;
            y = self.hero.position.y;
            
            
        }
        else if (self.hero.mapInitMode == 2)
        {
            prev = 0;
            if (self.hero.currentMap == 4)
            {
                NSMutableDictionary *startPoint = [objects objectNamed:@"startPoint1"];
                x = [[startPoint valueForKey:@"x"]floatValue];
                y = [[startPoint valueForKey:@"y"]floatValue];
                self.hero.musicCode = 3;
            }
            else if (self.hero.currentMap == 11)
            {
                NSMutableDictionary *startPoint = [objects objectNamed:@"startPoint3"];
                x = [[startPoint valueForKey:@"x"]floatValue];
                y = [[startPoint valueForKey:@"y"]floatValue];
                self.hero.musicCode = 6;
            }
            else
            {
                NSLog(@"Error2");
                NSMutableDictionary *startPoint = [objects objectNamed:@"startPoint1"];
                x = [[startPoint valueForKey:@"x"]floatValue];
                y = [[startPoint valueForKey:@"y"]floatValue];
                self.hero.musicCode = 3;
            }
            
            self.spriteOrientation = self.hero.heroOrientation;
            
        }
        else if (self.hero.mapInitMode == 3)
        {
            prev = 0;
            self.hero.musicCode = 5;
            
            self.spriteOrientation = 1;
            
            NSMutableDictionary *startPoint = [objects objectNamed:@"startPoint2"];
            x = [[startPoint valueForKey:@"x"]floatValue];
            y = [[startPoint valueForKey:@"y"]floatValue];
        }
        else if (self.hero.mapInitMode == 4)
        {
            NSLog(@"Error4");
        }
        else if (self.hero.mapInitMode == 5)
        {
            NSLog(@"Error5");
            //DELETE
            NSMutableDictionary *startPoint = [objects objectNamed:@"startPoint3"];
            x = [[startPoint valueForKey:@"x"]floatValue];
            y = [[startPoint valueForKey:@"y"]floatValue];
            self.hero.musicCode = 6;
        }
        else if (self.hero.mapInitMode == 6)
        {
            NSLog(@"Error6");
        }
        else if (self.hero.mapInitMode == 7)
        {
            self.spriteOrientation = self.hero.heroOrientation;
            x = self.hero.position.x;
            y = self.hero.position.y;
        }
        else if (self.hero.mapInitMode == 8)
        {
            self.spriteOrientation = self.hero.heroOrientation;
            x = self.hero.position.x;
            y = self.hero.position.y;
            
            prev = 0;
        }
        else
            NSLog(@"Error");
        
        
        if ((prev != self.hero.musicCode) && ![GameSceneManager sharedGameSceneManager].menuMusic)
        {
            [GameSceneManager sharedGameSceneManager].menuMusic = false;
            [self changeMusic:self.hero.musicCode];
        }
        
        
        {
            self.guy = [CCSprite spriteWithSpriteFrame:[[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:
                                                        [NSString stringWithFormat:@"herospriteJ01.png"]]];
            if (self.spriteOrientation == 1)
            {
                [self.guy setDisplayFrame:[[heroWalkDown frames] objectAtIndex:0]];
            }
            
            if (self.spriteOrientation == 2)
            {
                [self.guy setDisplayFrame:[[heroWalkUp frames] objectAtIndex:0]];
            }
            
            if (self.spriteOrientation == 3)
            {
                [self.guy setDisplayFrame:[[heroWalkRight frames] objectAtIndex:0]];
            }
            
            if (self.spriteOrientation == 4)
            {
                [self.guy setDisplayFrame:[[heroWalkLeft frames] objectAtIndex:0]];
            }
            
            ////////////////////////////////////////////////////////////////////////
        }
        self.guy.position = ccp(x,y);
        self.position = guy.position;
        self.hero.position = self.position;
        [self addChild:guy];
        [self setCenterOfScreen:self.position];
        self.hero.currentMap = 8;
        
        spriteCycleCount = 0;
        [self schedule:@selector(spriteCycle) interval:0.125];
        
    }
    return self;
}



-(void) updateSprite120
{
    CGSize screenSize = [[CCDirector sharedDirector] winSize];
    int x = self.hero.position.x;
    int y = self.hero.position.y;
    
    int p = self.sprite120.position.x;
    int q = self.sprite120.position.y;
    
    int diffx = abs(x-p);
    int diffy = abs(y-q);
    
    if ((diffx > screenSize.width/1.5) || (diffy > screenSize.height/1.5))
    {
        return;
    }
    if (self.spriteEvenIsTalking)
    {
        return;
    }
    
    int rand = arc4random()%12;
    if (rand == 1)
    {
        [self moveleftSprite120];
    }
    if (rand == 2)
    {
        [self moverightSprite120];
    }
    if (rand == 3)
    {
        [self moveupSprite120];
    }
    if (rand == 4)
    {
        [self movedownSprite120];
    }
    return;
}

-(void) moveleftSprite120
{
    CGPoint sprite120Pos = self.sprite120.position;
    self.sprite120.orientation = 4;
    sprite120Pos.x -= _theHKMap.tileSize.width;
    
    CGPoint tileCoord = [self tileCoordForPosition:sprite120Pos];
    int tileGID = [self.bgLayer tileGIDAt:tileCoord];
    if (tileGID)
    {
        NSDictionary *properties = [_theHKMap propertiesForGID:tileGID];
        if (properties)
        {
            NSString *range = [properties valueForKey:@"spriteRange"];
            if (range && [range compare:@"true"] == NSOrderedSame)
            {
                CGPoint heroTileCoord = [self tileCoordForPosition:self.hero.position];
                CGPoint nextHeroTileCoord = [self tileCoordForPosition:self.tempLocation2];
                if (!((heroTileCoord.x == tileCoord.x) && (heroTileCoord.y == tileCoord.y)) && !((nextHeroTileCoord.x == tileCoord.x) && (nextHeroTileCoord.y == tileCoord.y)))
                {
                    [self.bgLayer removeTileAt:tileCoord];
                    [self.bgLayer setTileGID:(tileGID + 1) at:tileCoord];
                    CGPoint tileCoord1 = [self tileCoordForPosition:self.sprite120.position];
                    int tileGID1 = [self.bgLayer tileGIDAt:tileCoord1];
                    [self.bgLayer removeTileAt:tileCoord1];
                    [self.bgLayer setTileGID:(tileGID1 - 1) at:tileCoord1];
                    
                    id actionMove = [CCMoveTo actionWithDuration:0.3 position:sprite120Pos];
                    id actionMove2 = [CCAnimate actionWithAnimation:spriteGWalkLeft restoreOriginalFrame:NO];
                    
                    id actionMoveDone = [CCCallFuncN actionWithTarget:self selector:@selector(finishActionSprite120)];
                    
                    [self.sprite120 runAction:[CCSpawn actionOne:[CCSequence actions:actionMove,actionMoveDone,nil] two:actionMove2]];
                    return;
                }
            }
        }
    }
    [self finishActionSprite120];
}
-(void) moverightSprite120
{
    CGPoint sprite120Pos = self.sprite120.position;
    self.sprite120.orientation = 3;
    sprite120Pos.x += _theHKMap.tileSize.width;
    
    CGPoint tileCoord = [self tileCoordForPosition:sprite120Pos];
    int tileGID = [self.bgLayer tileGIDAt:tileCoord];
    if (tileGID)
    {
        NSDictionary *properties = [_theHKMap propertiesForGID:tileGID];
        if (properties)
        {
            NSString *range = [properties valueForKey:@"spriteRange"];
            if (range && [range compare:@"true"] == NSOrderedSame)
            {
                CGPoint heroTileCoord = [self tileCoordForPosition:self.hero.position];
                CGPoint nextHeroTileCoord = [self tileCoordForPosition:self.tempLocation2];
                if (!((heroTileCoord.x == tileCoord.x) && (heroTileCoord.y == tileCoord.y)) && !((nextHeroTileCoord.x == tileCoord.x) && (nextHeroTileCoord.y == tileCoord.y)))
                {
                    [self.bgLayer removeTileAt:tileCoord];
                    [self.bgLayer setTileGID:(tileGID + 1) at:tileCoord];
                    CGPoint tileCoord1 = [self tileCoordForPosition:self.sprite120.position];
                    int tileGID1 = [self.bgLayer tileGIDAt:tileCoord1];
                    [self.bgLayer removeTileAt:tileCoord1];
                    [self.bgLayer setTileGID:(tileGID1 - 1) at:tileCoord1];
                    
                    id actionMove = [CCMoveTo actionWithDuration:0.3 position:sprite120Pos];
                    id actionMove2 = [CCAnimate actionWithAnimation:spriteGWalkRight restoreOriginalFrame:NO];
                    
                    id actionMoveDone = [CCCallFuncN actionWithTarget:self selector:@selector(finishActionSprite120)];
                    
                    [self.sprite120 runAction:[CCSpawn actionOne:[CCSequence actions:actionMove,actionMoveDone,nil] two:actionMove2]];
                    return;
                }
            }
        }
    }
    [self finishActionSprite120];
}
-(void) moveupSprite120
{
    CGPoint sprite120Pos = self.sprite120.position;
    self.sprite120.orientation = 2;
    sprite120Pos.y += _theHKMap.tileSize.height;
    
    CGPoint tileCoord = [self tileCoordForPosition:sprite120Pos];
    int tileGID = [self.bgLayer tileGIDAt:tileCoord];
    if (tileGID)
    {
        NSDictionary *properties = [_theHKMap propertiesForGID:tileGID];
        if (properties)
        {
            NSString *range = [properties valueForKey:@"spriteRange"];
            if (range && [range compare:@"true"] == NSOrderedSame)
            {
                CGPoint heroTileCoord = [self tileCoordForPosition:self.hero.position];
                CGPoint nextHeroTileCoord = [self tileCoordForPosition:self.tempLocation2];
                if (!((heroTileCoord.x == tileCoord.x) && (heroTileCoord.y == tileCoord.y)) && !((nextHeroTileCoord.x == tileCoord.x) && (nextHeroTileCoord.y == tileCoord.y)))
                {
                    [self.bgLayer removeTileAt:tileCoord];
                    [self.bgLayer setTileGID:(tileGID + 1) at:tileCoord];
                    CGPoint tileCoord1 = [self tileCoordForPosition:self.sprite120.position];
                    int tileGID1 = [self.bgLayer tileGIDAt:tileCoord1];
                    [self.bgLayer removeTileAt:tileCoord1];
                    [self.bgLayer setTileGID:(tileGID1 - 1) at:tileCoord1];
                    
                    id actionMove = [CCMoveTo actionWithDuration:0.3 position:sprite120Pos];
                    id actionMove2 = [CCAnimate actionWithAnimation:spriteGWalkUp restoreOriginalFrame:NO];
                    
                    id actionMoveDone = [CCCallFuncN actionWithTarget:self selector:@selector(finishActionSprite120)];
                    
                    [self.sprite120 runAction:[CCSpawn actionOne:[CCSequence actions:actionMove,actionMoveDone,nil] two:actionMove2]];
                    return;
                }
            }
        }
    }
    [self finishActionSprite120];
}
-(void) movedownSprite120
{
    CGPoint sprite120Pos = self.sprite120.position;
    self.sprite120.orientation = 1;
    sprite120Pos.y -= _theHKMap.tileSize.width;
    
    CGPoint tileCoord = [self tileCoordForPosition:sprite120Pos];
    int tileGID = [self.bgLayer tileGIDAt:tileCoord];
    if (tileGID)
    {
        NSDictionary *properties = [_theHKMap propertiesForGID:tileGID];
        if (properties)
        {
            NSString *range = [properties valueForKey:@"spriteRange"];
            if (range && [range compare:@"true"] == NSOrderedSame)
            {
                CGPoint heroTileCoord = [self tileCoordForPosition:self.hero.position];
                CGPoint nextHeroTileCoord = [self tileCoordForPosition:self.tempLocation2];
                if (!((heroTileCoord.x == tileCoord.x) && (heroTileCoord.y == tileCoord.y)) && !((nextHeroTileCoord.x == tileCoord.x) && (nextHeroTileCoord.y == tileCoord.y)))
                {
                    [self.bgLayer removeTileAt:tileCoord];
                    [self.bgLayer setTileGID:(tileGID + 1) at:tileCoord];
                    CGPoint tileCoord1 = [self tileCoordForPosition:self.sprite120.position];
                    int tileGID1 = [self.bgLayer tileGIDAt:tileCoord1];
                    [self.bgLayer removeTileAt:tileCoord1];
                    [self.bgLayer setTileGID:(tileGID1 - 1) at:tileCoord1];
                    
                    id actionMove = [CCMoveTo actionWithDuration:0.3 position:sprite120Pos];
                    id actionMove2 = [CCAnimate actionWithAnimation:spriteGWalkDown restoreOriginalFrame:NO];
                    
                    id actionMoveDone = [CCCallFuncN actionWithTarget:self selector:@selector(finishActionSprite120)];
                    
                    [self.sprite120 runAction:[CCSpawn actionOne:[CCSequence actions:actionMove,actionMoveDone,nil] two:actionMove2]];
                    return;
                }
            }
        }
    }
    [self finishActionSprite120];
}
-(void) finishActionSprite120
{
    if (self.sprite120.orientation == 1)
    {
        [self.sprite120 setDisplayFrame:[[spriteGWalkDown frames] objectAtIndex:0]];
    }
    else if (self.sprite120.orientation == 2)
    {
        [self.sprite120 setDisplayFrame:[[spriteGWalkUp frames] objectAtIndex:0]];
    }
    else if (self.sprite120.orientation == 3)
    {
        [self.sprite120 setDisplayFrame:[[spriteGWalkRight frames] objectAtIndex:0]];
    }
    else
    {
        [self.sprite120 setDisplayFrame:[[spriteGWalkLeft frames] objectAtIndex:0]];
    }
    self.hero.sprite120position = self.sprite120.position;
}

-(void) updateSprite121
{
    CGSize screenSize = [[CCDirector sharedDirector] winSize];
    int x = self.hero.position.x;
    int y = self.hero.position.y;
    
    int p = self.sprite121.position.x;
    int q = self.sprite121.position.y;
    
    int diffx = abs(x-p);
    int diffy = abs(y-q);
    
    if ((diffx > screenSize.width/1.5) || (diffy > screenSize.height/1.5))
    {
        return;
    }
    if (self.spriteOddIsTalking)
    {
        return;
    }
    
    int rand = arc4random()%12;
    if (rand == 1)
    {
        [self moveleftSprite121];
    }
    if (rand == 2)
    {
        [self moverightSprite121];
    }
    if (rand == 3)
    {
        [self moveupSprite121];
    }
    if (rand == 4)
    {
        [self movedownSprite121];
    }
    return;
}

-(void) moveleftSprite121
{
    CGPoint sprite121Pos = self.sprite121.position;
    self.sprite121.orientation = 4;
    sprite121Pos.x -= _theHKMap.tileSize.width;
    
    CGPoint tileCoord = [self tileCoordForPosition:sprite121Pos];
    int tileGID = [self.bgLayer tileGIDAt:tileCoord];
    if (tileGID)
    {
        NSDictionary *properties = [_theHKMap propertiesForGID:tileGID];
        if (properties)
        {
            NSString *range = [properties valueForKey:@"spriteRange"];
            if (range && [range compare:@"true"] == NSOrderedSame)
            {
                CGPoint heroTileCoord = [self tileCoordForPosition:self.hero.position];
                CGPoint nextHeroTileCoord = [self tileCoordForPosition:self.tempLocation2];
                if (!((heroTileCoord.x == tileCoord.x) && (heroTileCoord.y == tileCoord.y)) && !((nextHeroTileCoord.x == tileCoord.x) && (nextHeroTileCoord.y == tileCoord.y)))
                {
                    [self.bgLayer removeTileAt:tileCoord];
                    [self.bgLayer setTileGID:(tileGID + 2) at:tileCoord];
                    CGPoint tileCoord1 = [self tileCoordForPosition:self.sprite121.position];
                    int tileGID1 = [self.bgLayer tileGIDAt:tileCoord1];
                    [self.bgLayer removeTileAt:tileCoord1];
                    [self.bgLayer setTileGID:(tileGID1 - 2) at:tileCoord1];
                    
                    id actionMove = [CCMoveTo actionWithDuration:0.3 position:sprite121Pos];
                    id actionMove2 = [CCAnimate actionWithAnimation:spriteGWalkLeft restoreOriginalFrame:NO];
                    
                    id actionMoveDone = [CCCallFuncN actionWithTarget:self selector:@selector(finishActionSprite121)];
                    
                    [self.sprite121 runAction:[CCSpawn actionOne:[CCSequence actions:actionMove,actionMoveDone,nil] two:actionMove2]];
                    return;
                }
            }
        }
    }
    [self finishActionSprite121];
}
-(void) moverightSprite121
{
    CGPoint sprite121Pos = self.sprite121.position;
    self.sprite121.orientation = 3;
    sprite121Pos.x += _theHKMap.tileSize.width;
    
    CGPoint tileCoord = [self tileCoordForPosition:sprite121Pos];
    int tileGID = [self.bgLayer tileGIDAt:tileCoord];
    if (tileGID)
    {
        NSDictionary *properties = [_theHKMap propertiesForGID:tileGID];
        if (properties)
        {
            NSString *range = [properties valueForKey:@"spriteRange"];
            if (range && [range compare:@"true"] == NSOrderedSame)
            {
                CGPoint heroTileCoord = [self tileCoordForPosition:self.hero.position];
                CGPoint nextHeroTileCoord = [self tileCoordForPosition:self.tempLocation2];
                if (!((heroTileCoord.x == tileCoord.x) && (heroTileCoord.y == tileCoord.y)) && !((nextHeroTileCoord.x == tileCoord.x) && (nextHeroTileCoord.y == tileCoord.y)))
                {
                    [self.bgLayer removeTileAt:tileCoord];
                    [self.bgLayer setTileGID:(tileGID + 2) at:tileCoord];
                    CGPoint tileCoord1 = [self tileCoordForPosition:self.sprite121.position];
                    int tileGID1 = [self.bgLayer tileGIDAt:tileCoord1];
                    [self.bgLayer removeTileAt:tileCoord1];
                    [self.bgLayer setTileGID:(tileGID1 - 2) at:tileCoord1];
                    
                    id actionMove = [CCMoveTo actionWithDuration:0.3 position:sprite121Pos];
                    id actionMove2 = [CCAnimate actionWithAnimation:spriteGWalkRight restoreOriginalFrame:NO];
                    
                    id actionMoveDone = [CCCallFuncN actionWithTarget:self selector:@selector(finishActionSprite121)];
                    
                    [self.sprite121 runAction:[CCSpawn actionOne:[CCSequence actions:actionMove,actionMoveDone,nil] two:actionMove2]];
                    return;
                }
            }
        }
    }
    [self finishActionSprite121];
}
-(void) moveupSprite121
{
    CGPoint sprite121Pos = self.sprite121.position;
    self.sprite121.orientation = 2;
    sprite121Pos.y += _theHKMap.tileSize.height;
    
    CGPoint tileCoord = [self tileCoordForPosition:sprite121Pos];
    int tileGID = [self.bgLayer tileGIDAt:tileCoord];
    if (tileGID)
    {
        NSDictionary *properties = [_theHKMap propertiesForGID:tileGID];
        if (properties)
        {
            NSString *range = [properties valueForKey:@"spriteRange"];
            if (range && [range compare:@"true"] == NSOrderedSame)
            {
                CGPoint heroTileCoord = [self tileCoordForPosition:self.hero.position];
                CGPoint nextHeroTileCoord = [self tileCoordForPosition:self.tempLocation2];
                if (!((heroTileCoord.x == tileCoord.x) && (heroTileCoord.y == tileCoord.y)) && !((nextHeroTileCoord.x == tileCoord.x) && (nextHeroTileCoord.y == tileCoord.y)))
                {
                    [self.bgLayer removeTileAt:tileCoord];
                    [self.bgLayer setTileGID:(tileGID + 2) at:tileCoord];
                    CGPoint tileCoord1 = [self tileCoordForPosition:self.sprite121.position];
                    int tileGID1 = [self.bgLayer tileGIDAt:tileCoord1];
                    [self.bgLayer removeTileAt:tileCoord1];
                    [self.bgLayer setTileGID:(tileGID1 - 2) at:tileCoord1];
                    
                    id actionMove = [CCMoveTo actionWithDuration:0.3 position:sprite121Pos];
                    id actionMove2 = [CCAnimate actionWithAnimation:spriteGWalkUp restoreOriginalFrame:NO];
                    
                    id actionMoveDone = [CCCallFuncN actionWithTarget:self selector:@selector(finishActionSprite121)];
                    
                    [self.sprite121 runAction:[CCSpawn actionOne:[CCSequence actions:actionMove,actionMoveDone,nil] two:actionMove2]];
                    return;
                }
            }
        }
    }
    [self finishActionSprite121];
}
-(void) movedownSprite121
{
    CGPoint sprite121Pos = self.sprite121.position;
    self.sprite121.orientation = 1;
    sprite121Pos.y -= _theHKMap.tileSize.width;
    
    CGPoint tileCoord = [self tileCoordForPosition:sprite121Pos];
    int tileGID = [self.bgLayer tileGIDAt:tileCoord];
    if (tileGID)
    {
        NSDictionary *properties = [_theHKMap propertiesForGID:tileGID];
        if (properties)
        {
            NSString *range = [properties valueForKey:@"spriteRange"];
            if (range && [range compare:@"true"] == NSOrderedSame)
            {
                CGPoint heroTileCoord = [self tileCoordForPosition:self.hero.position];
                CGPoint nextHeroTileCoord = [self tileCoordForPosition:self.tempLocation2];
                if (!((heroTileCoord.x == tileCoord.x) && (heroTileCoord.y == tileCoord.y)) && !((nextHeroTileCoord.x == tileCoord.x) && (nextHeroTileCoord.y == tileCoord.y)))
                {
                    [self.bgLayer removeTileAt:tileCoord];
                    [self.bgLayer setTileGID:(tileGID + 2) at:tileCoord];
                    CGPoint tileCoord1 = [self tileCoordForPosition:self.sprite121.position];
                    int tileGID1 = [self.bgLayer tileGIDAt:tileCoord1];
                    [self.bgLayer removeTileAt:tileCoord1];
                    [self.bgLayer setTileGID:(tileGID1 - 2) at:tileCoord1];
                    
                    id actionMove = [CCMoveTo actionWithDuration:0.3 position:sprite121Pos];
                    id actionMove2 = [CCAnimate actionWithAnimation:spriteGWalkDown restoreOriginalFrame:NO];
                    
                    id actionMoveDone = [CCCallFuncN actionWithTarget:self selector:@selector(finishActionSprite121)];
                    
                    [self.sprite121 runAction:[CCSpawn actionOne:[CCSequence actions:actionMove,actionMoveDone,nil] two:actionMove2]];
                    return;
                }
            }
        }
    }
    [self finishActionSprite121];
}
-(void) finishActionSprite121
{
    if (self.sprite121.orientation == 1)
    {
        [self.sprite121 setDisplayFrame:[[spriteGWalkDown frames] objectAtIndex:0]];
    }
    else if (self.sprite121.orientation == 2)
    {
        [self.sprite121 setDisplayFrame:[[spriteGWalkUp frames] objectAtIndex:0]];
    }
    else if (self.sprite121.orientation == 3)
    {
        [self.sprite121 setDisplayFrame:[[spriteGWalkRight frames] objectAtIndex:0]];
    }
    else
    {
        [self.sprite121 setDisplayFrame:[[spriteGWalkLeft frames] objectAtIndex:0]];
    }
    self.hero.sprite121position = self.sprite121.position;
}

-(void) updateSprite122
{
    CGSize screenSize = [[CCDirector sharedDirector] winSize];
    int x = self.hero.position.x;
    int y = self.hero.position.y;
    
    int p = self.sprite122.position.x;
    int q = self.sprite122.position.y;
    
    int diffx = abs(x-p);
    int diffy = abs(y-q);
    
    if ((diffx > screenSize.width/1.5) || (diffy > screenSize.height/1.5))
    {
        return;
    }
    if (self.spriteEvenIsTalking)
    {
        return;
    }
    
    int rand = arc4random()%12;
    if (rand == 1)
    {
        [self moveleftSprite122];
    }
    if (rand == 2)
    {
        [self moverightSprite122];
    }
    if (rand == 3)
    {
        [self moveupSprite122];
    }
    if (rand == 4)
    {
        [self movedownSprite122];
    }
    return;
}

-(void) moveleftSprite122
{
    CGPoint sprite122Pos = self.sprite122.position;
    self.sprite122.orientation = 4;
    sprite122Pos.x -= _theHKMap.tileSize.width;
    
    CGPoint tileCoord = [self tileCoordForPosition:sprite122Pos];
    int tileGID = [self.bgLayer tileGIDAt:tileCoord];
    if (tileGID)
    {
        NSDictionary *properties = [_theHKMap propertiesForGID:tileGID];
        if (properties)
        {
            NSString *range = [properties valueForKey:@"spriteRange"];
            if (range && [range compare:@"true"] == NSOrderedSame)
            {
                CGPoint heroTileCoord = [self tileCoordForPosition:self.hero.position];
                CGPoint nextHeroTileCoord = [self tileCoordForPosition:self.tempLocation2];
                if (!((heroTileCoord.x == tileCoord.x) && (heroTileCoord.y == tileCoord.y)) && !((nextHeroTileCoord.x == tileCoord.x) && (nextHeroTileCoord.y == tileCoord.y)))
                {
                    [self.bgLayer removeTileAt:tileCoord];
                    [self.bgLayer setTileGID:(tileGID + 3) at:tileCoord];
                    CGPoint tileCoord1 = [self tileCoordForPosition:self.sprite122.position];
                    int tileGID1 = [self.bgLayer tileGIDAt:tileCoord1];
                    [self.bgLayer removeTileAt:tileCoord1];
                    [self.bgLayer setTileGID:(tileGID1 - 3) at:tileCoord1];
                    
                    id actionMove = [CCMoveTo actionWithDuration:0.3 position:sprite122Pos];
                    id actionMove2 = [CCAnimate actionWithAnimation:spriteYWalkLeft restoreOriginalFrame:NO];
                    
                    id actionMoveDone = [CCCallFuncN actionWithTarget:self selector:@selector(finishActionSprite122)];
                    
                    [self.sprite122 runAction:[CCSpawn actionOne:[CCSequence actions:actionMove,actionMoveDone,nil] two:actionMove2]];
                    return;
                }
            }
        }
    }
    [self finishActionSprite122];
}
-(void) moverightSprite122
{
    CGPoint sprite122Pos = self.sprite122.position;
    self.sprite122.orientation = 3;
    sprite122Pos.x += _theHKMap.tileSize.width;
    
    CGPoint tileCoord = [self tileCoordForPosition:sprite122Pos];
    int tileGID = [self.bgLayer tileGIDAt:tileCoord];
    if (tileGID)
    {
        NSDictionary *properties = [_theHKMap propertiesForGID:tileGID];
        if (properties)
        {
            NSString *range = [properties valueForKey:@"spriteRange"];
            if (range && [range compare:@"true"] == NSOrderedSame)
            {
                CGPoint heroTileCoord = [self tileCoordForPosition:self.hero.position];
                CGPoint nextHeroTileCoord = [self tileCoordForPosition:self.tempLocation2];
                if (!((heroTileCoord.x == tileCoord.x) && (heroTileCoord.y == tileCoord.y)) && !((nextHeroTileCoord.x == tileCoord.x) && (nextHeroTileCoord.y == tileCoord.y)))
                {
                    [self.bgLayer removeTileAt:tileCoord];
                    [self.bgLayer setTileGID:(tileGID + 3) at:tileCoord];
                    CGPoint tileCoord1 = [self tileCoordForPosition:self.sprite122.position];
                    int tileGID1 = [self.bgLayer tileGIDAt:tileCoord1];
                    [self.bgLayer removeTileAt:tileCoord1];
                    [self.bgLayer setTileGID:(tileGID1 - 3) at:tileCoord1];
                    
                    id actionMove = [CCMoveTo actionWithDuration:0.3 position:sprite122Pos];
                    id actionMove2 = [CCAnimate actionWithAnimation:spriteYWalkRight restoreOriginalFrame:NO];
                    
                    id actionMoveDone = [CCCallFuncN actionWithTarget:self selector:@selector(finishActionSprite122)];
                    
                    [self.sprite122 runAction:[CCSpawn actionOne:[CCSequence actions:actionMove,actionMoveDone,nil] two:actionMove2]];
                    return;
                }
            }
        }
    }
    [self finishActionSprite122];
}
-(void) moveupSprite122
{
    CGPoint sprite122Pos = self.sprite122.position;
    self.sprite122.orientation = 2;
    sprite122Pos.y += _theHKMap.tileSize.height;
    
    CGPoint tileCoord = [self tileCoordForPosition:sprite122Pos];
    int tileGID = [self.bgLayer tileGIDAt:tileCoord];
    if (tileGID)
    {
        NSDictionary *properties = [_theHKMap propertiesForGID:tileGID];
        if (properties)
        {
            NSString *range = [properties valueForKey:@"spriteRange"];
            if (range && [range compare:@"true"] == NSOrderedSame)
            {
                CGPoint heroTileCoord = [self tileCoordForPosition:self.hero.position];
                CGPoint nextHeroTileCoord = [self tileCoordForPosition:self.tempLocation2];
                if (!((heroTileCoord.x == tileCoord.x) && (heroTileCoord.y == tileCoord.y)) && !((nextHeroTileCoord.x == tileCoord.x) && (nextHeroTileCoord.y == tileCoord.y)))
                {
                    [self.bgLayer removeTileAt:tileCoord];
                    [self.bgLayer setTileGID:(tileGID + 3) at:tileCoord];
                    CGPoint tileCoord1 = [self tileCoordForPosition:self.sprite122.position];
                    int tileGID1 = [self.bgLayer tileGIDAt:tileCoord1];
                    [self.bgLayer removeTileAt:tileCoord1];
                    [self.bgLayer setTileGID:(tileGID1 - 3) at:tileCoord1];
                    
                    id actionMove = [CCMoveTo actionWithDuration:0.3 position:sprite122Pos];
                    id actionMove2 = [CCAnimate actionWithAnimation:spriteYWalkUp restoreOriginalFrame:NO];
                    
                    id actionMoveDone = [CCCallFuncN actionWithTarget:self selector:@selector(finishActionSprite122)];
                    
                    [self.sprite122 runAction:[CCSpawn actionOne:[CCSequence actions:actionMove,actionMoveDone,nil] two:actionMove2]];
                    return;
                }
            }
        }
    }
    [self finishActionSprite122];
}
-(void) movedownSprite122
{
    CGPoint sprite122Pos = self.sprite122.position;
    self.sprite122.orientation = 1;
    sprite122Pos.y -= _theHKMap.tileSize.width;
    
    CGPoint tileCoord = [self tileCoordForPosition:sprite122Pos];
    int tileGID = [self.bgLayer tileGIDAt:tileCoord];
    if (tileGID)
    {
        NSDictionary *properties = [_theHKMap propertiesForGID:tileGID];
        if (properties)
        {
            NSString *range = [properties valueForKey:@"spriteRange"];
            if (range && [range compare:@"true"] == NSOrderedSame)
            {
                CGPoint heroTileCoord = [self tileCoordForPosition:self.hero.position];
                CGPoint nextHeroTileCoord = [self tileCoordForPosition:self.tempLocation2];
                if (!((heroTileCoord.x == tileCoord.x) && (heroTileCoord.y == tileCoord.y)) && !((nextHeroTileCoord.x == tileCoord.x) && (nextHeroTileCoord.y == tileCoord.y)))
                {
                    [self.bgLayer removeTileAt:tileCoord];
                    [self.bgLayer setTileGID:(tileGID + 3) at:tileCoord];
                    CGPoint tileCoord1 = [self tileCoordForPosition:self.sprite122.position];
                    int tileGID1 = [self.bgLayer tileGIDAt:tileCoord1];
                    [self.bgLayer removeTileAt:tileCoord1];
                    [self.bgLayer setTileGID:(tileGID1 - 3) at:tileCoord1];
                    
                    id actionMove = [CCMoveTo actionWithDuration:0.3 position:sprite122Pos];
                    id actionMove2 = [CCAnimate actionWithAnimation:spriteYWalkDown restoreOriginalFrame:NO];
                    
                    id actionMoveDone = [CCCallFuncN actionWithTarget:self selector:@selector(finishActionSprite122)];
                    
                    [self.sprite122 runAction:[CCSpawn actionOne:[CCSequence actions:actionMove,actionMoveDone,nil] two:actionMove2]];
                    return;
                }
            }
        }
    }
    [self finishActionSprite122];
}
-(void) finishActionSprite122
{
    if (self.sprite122.orientation == 1)
    {
        [self.sprite122 setDisplayFrame:[[spriteYWalkDown frames] objectAtIndex:0]];
    }
    else if (self.sprite122.orientation == 2)
    {
        [self.sprite122 setDisplayFrame:[[spriteYWalkUp frames] objectAtIndex:0]];
    }
    else if (self.sprite122.orientation == 3)
    {
        [self.sprite122 setDisplayFrame:[[spriteYWalkRight frames] objectAtIndex:0]];
    }
    else
    {
        [self.sprite122 setDisplayFrame:[[spriteYWalkLeft frames] objectAtIndex:0]];
    }
    self.hero.sprite122position = self.sprite122.position;
}
-(void) updateSprite123
{
    CGSize screenSize = [[CCDirector sharedDirector] winSize];
    int x = self.hero.position.x;
    int y = self.hero.position.y;
    
    int p = self.sprite123.position.x;
    int q = self.sprite123.position.y;
    
    int diffx = abs(x-p);
    int diffy = abs(y-q);
    
    if ((diffx > screenSize.width/1.5) || (diffy > screenSize.height/1.5))
    {
        return;
    }
    if (self.spriteOddIsTalking)
    {
        return;
    }
    
    int rand = arc4random()%12;
    if (rand == 1)
    {
        [self moveleftSprite123];
    }
    if (rand == 2)
    {
        [self moverightSprite123];
    }
    if (rand == 3)
    {
        [self moveupSprite123];
    }
    if (rand == 4)
    {
        [self movedownSprite123];
    }
    return;
}

-(void) moveleftSprite123
{
    CGPoint sprite123Pos = self.sprite123.position;
    self.sprite123.orientation = 4;
    sprite123Pos.x -= _theHKMap.tileSize.width;
    
    CGPoint tileCoord = [self tileCoordForPosition:sprite123Pos];
    int tileGID = [self.bgLayer tileGIDAt:tileCoord];
    if (tileGID)
    {
        NSDictionary *properties = [_theHKMap propertiesForGID:tileGID];
        if (properties)
        {
            NSString *range = [properties valueForKey:@"spriteRange"];
            if (range && [range compare:@"true"] == NSOrderedSame)
            {
                CGPoint heroTileCoord = [self tileCoordForPosition:self.hero.position];
                CGPoint nextHeroTileCoord = [self tileCoordForPosition:self.tempLocation2];
                if (!((heroTileCoord.x == tileCoord.x) && (heroTileCoord.y == tileCoord.y)) && !((nextHeroTileCoord.x == tileCoord.x) && (nextHeroTileCoord.y == tileCoord.y)))
                {
                    [self.bgLayer removeTileAt:tileCoord];
                    [self.bgLayer setTileGID:(tileGID + 4) at:tileCoord];
                    CGPoint tileCoord1 = [self tileCoordForPosition:self.sprite123.position];
                    int tileGID1 = [self.bgLayer tileGIDAt:tileCoord1];
                    [self.bgLayer removeTileAt:tileCoord1];
                    [self.bgLayer setTileGID:(tileGID1 - 4) at:tileCoord1];
                    
                    id actionMove = [CCMoveTo actionWithDuration:0.3 position:sprite123Pos];
                    id actionMove2 = [CCAnimate actionWithAnimation:spriteZAWalkLeft restoreOriginalFrame:NO];
                    
                    id actionMoveDone = [CCCallFuncN actionWithTarget:self selector:@selector(finishActionSprite123)];
                    
                    [self.sprite123 runAction:[CCSpawn actionOne:[CCSequence actions:actionMove,actionMoveDone,nil] two:actionMove2]];
                    return;
                }
            }
        }
    }
    [self finishActionSprite123];
}
-(void) moverightSprite123
{
    CGPoint sprite123Pos = self.sprite123.position;
    self.sprite123.orientation = 3;
    sprite123Pos.x += _theHKMap.tileSize.width;
    
    CGPoint tileCoord = [self tileCoordForPosition:sprite123Pos];
    int tileGID = [self.bgLayer tileGIDAt:tileCoord];
    if (tileGID)
    {
        NSDictionary *properties = [_theHKMap propertiesForGID:tileGID];
        if (properties)
        {
            NSString *range = [properties valueForKey:@"spriteRange"];
            if (range && [range compare:@"true"] == NSOrderedSame)
            {
                CGPoint heroTileCoord = [self tileCoordForPosition:self.hero.position];
                CGPoint nextHeroTileCoord = [self tileCoordForPosition:self.tempLocation2];
                if (!((heroTileCoord.x == tileCoord.x) && (heroTileCoord.y == tileCoord.y)) && !((nextHeroTileCoord.x == tileCoord.x) && (nextHeroTileCoord.y == tileCoord.y)))
                {
                    [self.bgLayer removeTileAt:tileCoord];
                    [self.bgLayer setTileGID:(tileGID + 4) at:tileCoord];
                    CGPoint tileCoord1 = [self tileCoordForPosition:self.sprite123.position];
                    int tileGID1 = [self.bgLayer tileGIDAt:tileCoord1];
                    [self.bgLayer removeTileAt:tileCoord1];
                    [self.bgLayer setTileGID:(tileGID1 - 4) at:tileCoord1];
                    
                    id actionMove = [CCMoveTo actionWithDuration:0.3 position:sprite123Pos];
                    id actionMove2 = [CCAnimate actionWithAnimation:spriteZAWalkRight restoreOriginalFrame:NO];
                    
                    id actionMoveDone = [CCCallFuncN actionWithTarget:self selector:@selector(finishActionSprite123)];
                    
                    [self.sprite123 runAction:[CCSpawn actionOne:[CCSequence actions:actionMove,actionMoveDone,nil] two:actionMove2]];
                    return;
                }
            }
        }
    }
    [self finishActionSprite123];
}
-(void) moveupSprite123
{
    CGPoint sprite123Pos = self.sprite123.position;
    self.sprite123.orientation = 2;
    sprite123Pos.y += _theHKMap.tileSize.height;
    
    CGPoint tileCoord = [self tileCoordForPosition:sprite123Pos];
    int tileGID = [self.bgLayer tileGIDAt:tileCoord];
    if (tileGID)
    {
        NSDictionary *properties = [_theHKMap propertiesForGID:tileGID];
        if (properties)
        {
            NSString *range = [properties valueForKey:@"spriteRange"];
            if (range && [range compare:@"true"] == NSOrderedSame)
            {
                CGPoint heroTileCoord = [self tileCoordForPosition:self.hero.position];
                CGPoint nextHeroTileCoord = [self tileCoordForPosition:self.tempLocation2];
                if (!((heroTileCoord.x == tileCoord.x) && (heroTileCoord.y == tileCoord.y)) && !((nextHeroTileCoord.x == tileCoord.x) && (nextHeroTileCoord.y == tileCoord.y)))
                {
                    [self.bgLayer removeTileAt:tileCoord];
                    [self.bgLayer setTileGID:(tileGID + 4) at:tileCoord];
                    CGPoint tileCoord1 = [self tileCoordForPosition:self.sprite123.position];
                    int tileGID1 = [self.bgLayer tileGIDAt:tileCoord1];
                    [self.bgLayer removeTileAt:tileCoord1];
                    [self.bgLayer setTileGID:(tileGID1 - 4) at:tileCoord1];
                    
                    id actionMove = [CCMoveTo actionWithDuration:0.3 position:sprite123Pos];
                    id actionMove2 = [CCAnimate actionWithAnimation:spriteZAWalkUp restoreOriginalFrame:NO];
                    
                    id actionMoveDone = [CCCallFuncN actionWithTarget:self selector:@selector(finishActionSprite123)];
                    
                    [self.sprite123 runAction:[CCSpawn actionOne:[CCSequence actions:actionMove,actionMoveDone,nil] two:actionMove2]];
                    return;
                }
            }
        }
    }
    [self finishActionSprite123];
}
-(void) movedownSprite123
{
    CGPoint sprite123Pos = self.sprite123.position;
    self.sprite123.orientation = 1;
    sprite123Pos.y -= _theHKMap.tileSize.width;
    
    CGPoint tileCoord = [self tileCoordForPosition:sprite123Pos];
    int tileGID = [self.bgLayer tileGIDAt:tileCoord];
    if (tileGID)
    {
        NSDictionary *properties = [_theHKMap propertiesForGID:tileGID];
        if (properties)
        {
            NSString *range = [properties valueForKey:@"spriteRange"];
            if (range && [range compare:@"true"] == NSOrderedSame)
            {
                CGPoint heroTileCoord = [self tileCoordForPosition:self.hero.position];
                CGPoint nextHeroTileCoord = [self tileCoordForPosition:self.tempLocation2];
                if (!((heroTileCoord.x == tileCoord.x) && (heroTileCoord.y == tileCoord.y)) && !((nextHeroTileCoord.x == tileCoord.x) && (nextHeroTileCoord.y == tileCoord.y)))
                {
                    [self.bgLayer removeTileAt:tileCoord];
                    [self.bgLayer setTileGID:(tileGID + 4) at:tileCoord];
                    CGPoint tileCoord1 = [self tileCoordForPosition:self.sprite123.position];
                    int tileGID1 = [self.bgLayer tileGIDAt:tileCoord1];
                    [self.bgLayer removeTileAt:tileCoord1];
                    [self.bgLayer setTileGID:(tileGID1 - 4) at:tileCoord1];
                    
                    id actionMove = [CCMoveTo actionWithDuration:0.3 position:sprite123Pos];
                    id actionMove2 = [CCAnimate actionWithAnimation:spriteZAWalkDown restoreOriginalFrame:NO];
                    
                    id actionMoveDone = [CCCallFuncN actionWithTarget:self selector:@selector(finishActionSprite123)];
                    
                    [self.sprite123 runAction:[CCSpawn actionOne:[CCSequence actions:actionMove,actionMoveDone,nil] two:actionMove2]];
                    return;
                }
            }
        }
    }
    [self finishActionSprite123];
}
-(void) finishActionSprite123
{
    if (self.sprite123.orientation == 1)
    {
        [self.sprite123 setDisplayFrame:[[spriteZAWalkDown frames] objectAtIndex:0]];
    }
    else if (self.sprite123.orientation == 2)
    {
        [self.sprite123 setDisplayFrame:[[spriteZAWalkUp frames] objectAtIndex:0]];
    }
    else if (self.sprite123.orientation == 3)
    {
        [self.sprite123 setDisplayFrame:[[spriteZAWalkRight frames] objectAtIndex:0]];
    }
    else
    {
        [self.sprite123 setDisplayFrame:[[spriteZAWalkLeft frames] objectAtIndex:0]];
    }
    self.hero.sprite123position = self.sprite123.position;
}
-(void) updateSprite124
{
    CGSize screenSize = [[CCDirector sharedDirector] winSize];
    int x = self.hero.position.x;
    int y = self.hero.position.y;
    
    int p = self.sprite124.position.x;
    int q = self.sprite124.position.y;
    
    int diffx = abs(x-p);
    int diffy = abs(y-q);
    
    if ((diffx > screenSize.width/1.5) || (diffy > screenSize.height/1.5))
    {
        return;
    }
    if (self.spriteEvenIsTalking)
    {
        return;
    }
    
    int rand = arc4random()%12;
    if (rand == 1)
    {
        [self moveleftSprite124];
    }
    if (rand == 2)
    {
        [self moverightSprite124];
    }
    if (rand == 3)
    {
        [self moveupSprite124];
    }
    if (rand == 4)
    {
        [self movedownSprite124];
    }
    return;
}

-(void) moveleftSprite124
{
    CGPoint sprite124Pos = self.sprite124.position;
    self.sprite124.orientation = 4;
    sprite124Pos.x -= _theHKMap.tileSize.width;
    
    CGPoint tileCoord = [self tileCoordForPosition:sprite124Pos];
    int tileGID = [self.bgLayer tileGIDAt:tileCoord];
    if (tileGID)
    {
        NSDictionary *properties = [_theHKMap propertiesForGID:tileGID];
        if (properties)
        {
            NSString *range = [properties valueForKey:@"spriteRange"];
            if (range && [range compare:@"true"] == NSOrderedSame)
            {
                CGPoint heroTileCoord = [self tileCoordForPosition:self.hero.position];
                CGPoint nextHeroTileCoord = [self tileCoordForPosition:self.tempLocation2];
                if (!((heroTileCoord.x == tileCoord.x) && (heroTileCoord.y == tileCoord.y)) && !((nextHeroTileCoord.x == tileCoord.x) && (nextHeroTileCoord.y == tileCoord.y)))
                {
                    [self.bgLayer removeTileAt:tileCoord];
                    [self.bgLayer setTileGID:(tileGID + 5) at:tileCoord];
                    CGPoint tileCoord1 = [self tileCoordForPosition:self.sprite124.position];
                    int tileGID1 = [self.bgLayer tileGIDAt:tileCoord1];
                    [self.bgLayer removeTileAt:tileCoord1];
                    [self.bgLayer setTileGID:(tileGID1 - 5) at:tileCoord1];
                    
                    id actionMove = [CCMoveTo actionWithDuration:0.3 position:sprite124Pos];
                    id actionMove2 = [CCAnimate actionWithAnimation:spriteTWalkLeft restoreOriginalFrame:NO];
                    
                    id actionMoveDone = [CCCallFuncN actionWithTarget:self selector:@selector(finishActionSprite124)];
                    
                    [self.sprite124 runAction:[CCSpawn actionOne:[CCSequence actions:actionMove,actionMoveDone,nil] two:actionMove2]];
                    return;
                }
            }
        }
    }
    [self finishActionSprite124];
}
-(void) moverightSprite124
{
    CGPoint sprite124Pos = self.sprite124.position;
    self.sprite124.orientation = 3;
    sprite124Pos.x += _theHKMap.tileSize.width;
    
    CGPoint tileCoord = [self tileCoordForPosition:sprite124Pos];
    int tileGID = [self.bgLayer tileGIDAt:tileCoord];
    if (tileGID)
    {
        NSDictionary *properties = [_theHKMap propertiesForGID:tileGID];
        if (properties)
        {
            NSString *range = [properties valueForKey:@"spriteRange"];
            if (range && [range compare:@"true"] == NSOrderedSame)
            {
                CGPoint heroTileCoord = [self tileCoordForPosition:self.hero.position];
                CGPoint nextHeroTileCoord = [self tileCoordForPosition:self.tempLocation2];
                if (!((heroTileCoord.x == tileCoord.x) && (heroTileCoord.y == tileCoord.y)) && !((nextHeroTileCoord.x == tileCoord.x) && (nextHeroTileCoord.y == tileCoord.y)))
                {
                    [self.bgLayer removeTileAt:tileCoord];
                    [self.bgLayer setTileGID:(tileGID + 5) at:tileCoord];
                    CGPoint tileCoord1 = [self tileCoordForPosition:self.sprite124.position];
                    int tileGID1 = [self.bgLayer tileGIDAt:tileCoord1];
                    [self.bgLayer removeTileAt:tileCoord1];
                    [self.bgLayer setTileGID:(tileGID1 - 5) at:tileCoord1];
                    
                    id actionMove = [CCMoveTo actionWithDuration:0.3 position:sprite124Pos];
                    id actionMove2 = [CCAnimate actionWithAnimation:spriteTWalkRight restoreOriginalFrame:NO];
                    
                    id actionMoveDone = [CCCallFuncN actionWithTarget:self selector:@selector(finishActionSprite124)];
                    
                    [self.sprite124 runAction:[CCSpawn actionOne:[CCSequence actions:actionMove,actionMoveDone,nil] two:actionMove2]];
                    return;
                }
            }
        }
    }
    [self finishActionSprite124];
}
-(void) moveupSprite124
{
    CGPoint sprite124Pos = self.sprite124.position;
    self.sprite124.orientation = 2;
    sprite124Pos.y += _theHKMap.tileSize.height;
    
    CGPoint tileCoord = [self tileCoordForPosition:sprite124Pos];
    int tileGID = [self.bgLayer tileGIDAt:tileCoord];
    if (tileGID)
    {
        NSDictionary *properties = [_theHKMap propertiesForGID:tileGID];
        if (properties)
        {
            NSString *range = [properties valueForKey:@"spriteRange"];
            if (range && [range compare:@"true"] == NSOrderedSame)
            {
                CGPoint heroTileCoord = [self tileCoordForPosition:self.hero.position];
                CGPoint nextHeroTileCoord = [self tileCoordForPosition:self.tempLocation2];
                if (!((heroTileCoord.x == tileCoord.x) && (heroTileCoord.y == tileCoord.y)) && !((nextHeroTileCoord.x == tileCoord.x) && (nextHeroTileCoord.y == tileCoord.y)))
                {
                    [self.bgLayer removeTileAt:tileCoord];
                    [self.bgLayer setTileGID:(tileGID + 5) at:tileCoord];
                    CGPoint tileCoord1 = [self tileCoordForPosition:self.sprite124.position];
                    int tileGID1 = [self.bgLayer tileGIDAt:tileCoord1];
                    [self.bgLayer removeTileAt:tileCoord1];
                    [self.bgLayer setTileGID:(tileGID1 - 5) at:tileCoord1];
                    
                    id actionMove = [CCMoveTo actionWithDuration:0.3 position:sprite124Pos];
                    id actionMove2 = [CCAnimate actionWithAnimation:spriteTWalkUp restoreOriginalFrame:NO];
                    
                    id actionMoveDone = [CCCallFuncN actionWithTarget:self selector:@selector(finishActionSprite124)];
                    
                    [self.sprite124 runAction:[CCSpawn actionOne:[CCSequence actions:actionMove,actionMoveDone,nil] two:actionMove2]];
                    return;
                }
            }
        }
    }
    [self finishActionSprite124];
}
-(void) movedownSprite124
{
    CGPoint sprite124Pos = self.sprite124.position;
    self.sprite124.orientation = 1;
    sprite124Pos.y -= _theHKMap.tileSize.width;
    
    CGPoint tileCoord = [self tileCoordForPosition:sprite124Pos];
    int tileGID = [self.bgLayer tileGIDAt:tileCoord];
    if (tileGID)
    {
        NSDictionary *properties = [_theHKMap propertiesForGID:tileGID];
        if (properties)
        {
            NSString *range = [properties valueForKey:@"spriteRange"];
            if (range && [range compare:@"true"] == NSOrderedSame)
            {
                CGPoint heroTileCoord = [self tileCoordForPosition:self.hero.position];
                CGPoint nextHeroTileCoord = [self tileCoordForPosition:self.tempLocation2];
                if (!((heroTileCoord.x == tileCoord.x) && (heroTileCoord.y == tileCoord.y)) && !((nextHeroTileCoord.x == tileCoord.x) && (nextHeroTileCoord.y == tileCoord.y)))
                {
                    [self.bgLayer removeTileAt:tileCoord];
                    [self.bgLayer setTileGID:(tileGID + 5) at:tileCoord];
                    CGPoint tileCoord1 = [self tileCoordForPosition:self.sprite124.position];
                    int tileGID1 = [self.bgLayer tileGIDAt:tileCoord1];
                    [self.bgLayer removeTileAt:tileCoord1];
                    [self.bgLayer setTileGID:(tileGID1 - 5) at:tileCoord1];
                    
                    id actionMove = [CCMoveTo actionWithDuration:0.3 position:sprite124Pos];
                    id actionMove2 = [CCAnimate actionWithAnimation:spriteTWalkDown restoreOriginalFrame:NO];
                    
                    id actionMoveDone = [CCCallFuncN actionWithTarget:self selector:@selector(finishActionSprite124)];
                    
                    [self.sprite124 runAction:[CCSpawn actionOne:[CCSequence actions:actionMove,actionMoveDone,nil] two:actionMove2]];
                    return;
                }
            }
        }
    }
    [self finishActionSprite124];
}
-(void) finishActionSprite124
{
    if (self.sprite124.orientation == 1)
    {
        [self.sprite124 setDisplayFrame:[[spriteTWalkDown frames] objectAtIndex:0]];
    }
    else if (self.sprite124.orientation == 2)
    {
        [self.sprite124 setDisplayFrame:[[spriteTWalkUp frames] objectAtIndex:0]];
    }
    else if (self.sprite124.orientation == 3)
    {
        [self.sprite124 setDisplayFrame:[[spriteTWalkRight frames] objectAtIndex:0]];
    }
    else
    {
        [self.sprite124 setDisplayFrame:[[spriteTWalkLeft frames] objectAtIndex:0]];
    }
    self.hero.sprite124position = self.sprite124.position;
}

-(void) updateSprite125
{
    CGSize screenSize = [[CCDirector sharedDirector] winSize];
    int x = self.hero.position.x;
    int y = self.hero.position.y;
    
    int p = self.sprite125.position.x;
    int q = self.sprite125.position.y;
    
    int diffx = abs(x-p);
    int diffy = abs(y-q);
    
    if ((diffx > screenSize.width/1.5) || (diffy > screenSize.height/1.5))
    {
        return;
    }
    if (self.spriteOddIsTalking)
    {
        return;
    }
    
    int rand = arc4random()%12;
    if (rand == 1)
    {
        [self moveleftSprite125];
    }
    if (rand == 2)
    {
        [self moverightSprite125];
    }
    if (rand == 3)
    {
        [self moveupSprite125];
    }
    if (rand == 4)
    {
        [self movedownSprite125];
    }
    return;
}

-(void) moveleftSprite125
{
    CGPoint sprite125Pos = self.sprite125.position;
    self.sprite125.orientation = 4;
    sprite125Pos.x -= _theHKMap.tileSize.width;
    
    CGPoint tileCoord = [self tileCoordForPosition:sprite125Pos];
    int tileGID = [self.bgLayer tileGIDAt:tileCoord];
    if (tileGID)
    {
        NSDictionary *properties = [_theHKMap propertiesForGID:tileGID];
        if (properties)
        {
            NSString *range = [properties valueForKey:@"spriteRange"];
            if (range && [range compare:@"true"] == NSOrderedSame)
            {
                CGPoint heroTileCoord = [self tileCoordForPosition:self.hero.position];
                CGPoint nextHeroTileCoord = [self tileCoordForPosition:self.tempLocation2];
                if (!((heroTileCoord.x == tileCoord.x) && (heroTileCoord.y == tileCoord.y)) && !((nextHeroTileCoord.x == tileCoord.x) && (nextHeroTileCoord.y == tileCoord.y)))
                {
                    [self.bgLayer removeTileAt:tileCoord];
                    [self.bgLayer setTileGID:(tileGID + 6) at:tileCoord];
                    CGPoint tileCoord1 = [self tileCoordForPosition:self.sprite125.position];
                    int tileGID1 = [self.bgLayer tileGIDAt:tileCoord1];
                    [self.bgLayer removeTileAt:tileCoord1];
                    [self.bgLayer setTileGID:(tileGID1 - 6) at:tileCoord1];
                    
                    id actionMove = [CCMoveTo actionWithDuration:0.3 position:sprite125Pos];
                    id actionMove2 = [CCAnimate actionWithAnimation:spriteTWalkLeft restoreOriginalFrame:NO];
                    
                    id actionMoveDone = [CCCallFuncN actionWithTarget:self selector:@selector(finishActionSprite125)];
                    
                    [self.sprite125 runAction:[CCSpawn actionOne:[CCSequence actions:actionMove,actionMoveDone,nil] two:actionMove2]];
                    return;
                }
            }
        }
    }
    [self finishActionSprite125];
}
-(void) moverightSprite125
{
    CGPoint sprite125Pos = self.sprite125.position;
    self.sprite125.orientation = 3;
    sprite125Pos.x += _theHKMap.tileSize.width;
    
    CGPoint tileCoord = [self tileCoordForPosition:sprite125Pos];
    int tileGID = [self.bgLayer tileGIDAt:tileCoord];
    if (tileGID)
    {
        NSDictionary *properties = [_theHKMap propertiesForGID:tileGID];
        if (properties)
        {
            NSString *range = [properties valueForKey:@"spriteRange"];
            if (range && [range compare:@"true"] == NSOrderedSame)
            {
                CGPoint heroTileCoord = [self tileCoordForPosition:self.hero.position];
                CGPoint nextHeroTileCoord = [self tileCoordForPosition:self.tempLocation2];
                if (!((heroTileCoord.x == tileCoord.x) && (heroTileCoord.y == tileCoord.y)) && !((nextHeroTileCoord.x == tileCoord.x) && (nextHeroTileCoord.y == tileCoord.y)))
                {
                    [self.bgLayer removeTileAt:tileCoord];
                    [self.bgLayer setTileGID:(tileGID + 6) at:tileCoord];
                    CGPoint tileCoord1 = [self tileCoordForPosition:self.sprite125.position];
                    int tileGID1 = [self.bgLayer tileGIDAt:tileCoord1];
                    [self.bgLayer removeTileAt:tileCoord1];
                    [self.bgLayer setTileGID:(tileGID1 - 6) at:tileCoord1];
                    
                    id actionMove = [CCMoveTo actionWithDuration:0.3 position:sprite125Pos];
                    id actionMove2 = [CCAnimate actionWithAnimation:spriteTWalkRight restoreOriginalFrame:NO];
                    
                    id actionMoveDone = [CCCallFuncN actionWithTarget:self selector:@selector(finishActionSprite125)];
                    
                    [self.sprite125 runAction:[CCSpawn actionOne:[CCSequence actions:actionMove,actionMoveDone,nil] two:actionMove2]];
                    return;
                }
            }
        }
    }
    [self finishActionSprite125];
}
-(void) moveupSprite125
{
    CGPoint sprite125Pos = self.sprite125.position;
    self.sprite125.orientation = 2;
    sprite125Pos.y += _theHKMap.tileSize.height;
    
    CGPoint tileCoord = [self tileCoordForPosition:sprite125Pos];
    int tileGID = [self.bgLayer tileGIDAt:tileCoord];
    if (tileGID)
    {
        NSDictionary *properties = [_theHKMap propertiesForGID:tileGID];
        if (properties)
        {
            NSString *range = [properties valueForKey:@"spriteRange"];
            if (range && [range compare:@"true"] == NSOrderedSame)
            {
                CGPoint heroTileCoord = [self tileCoordForPosition:self.hero.position];
                CGPoint nextHeroTileCoord = [self tileCoordForPosition:self.tempLocation2];
                if (!((heroTileCoord.x == tileCoord.x) && (heroTileCoord.y == tileCoord.y)) && !((nextHeroTileCoord.x == tileCoord.x) && (nextHeroTileCoord.y == tileCoord.y)))
                {
                    [self.bgLayer removeTileAt:tileCoord];
                    [self.bgLayer setTileGID:(tileGID + 6) at:tileCoord];
                    CGPoint tileCoord1 = [self tileCoordForPosition:self.sprite125.position];
                    int tileGID1 = [self.bgLayer tileGIDAt:tileCoord1];
                    [self.bgLayer removeTileAt:tileCoord1];
                    [self.bgLayer setTileGID:(tileGID1 - 6) at:tileCoord1];
                    
                    id actionMove = [CCMoveTo actionWithDuration:0.3 position:sprite125Pos];
                    id actionMove2 = [CCAnimate actionWithAnimation:spriteTWalkUp restoreOriginalFrame:NO];
                    
                    id actionMoveDone = [CCCallFuncN actionWithTarget:self selector:@selector(finishActionSprite125)];
                    
                    [self.sprite125 runAction:[CCSpawn actionOne:[CCSequence actions:actionMove,actionMoveDone,nil] two:actionMove2]];
                    return;
                }
            }
        }
    }
    [self finishActionSprite125];
}
-(void) movedownSprite125
{
    CGPoint sprite125Pos = self.sprite125.position;
    self.sprite125.orientation = 1;
    sprite125Pos.y -= _theHKMap.tileSize.width;
    
    CGPoint tileCoord = [self tileCoordForPosition:sprite125Pos];
    int tileGID = [self.bgLayer tileGIDAt:tileCoord];
    if (tileGID)
    {
        NSDictionary *properties = [_theHKMap propertiesForGID:tileGID];
        if (properties)
        {
            NSString *range = [properties valueForKey:@"spriteRange"];
            if (range && [range compare:@"true"] == NSOrderedSame)
            {
                CGPoint heroTileCoord = [self tileCoordForPosition:self.hero.position];
                CGPoint nextHeroTileCoord = [self tileCoordForPosition:self.tempLocation2];
                if (!((heroTileCoord.x == tileCoord.x) && (heroTileCoord.y == tileCoord.y)) && !((nextHeroTileCoord.x == tileCoord.x) && (nextHeroTileCoord.y == tileCoord.y)))
                {
                    [self.bgLayer removeTileAt:tileCoord];
                    [self.bgLayer setTileGID:(tileGID + 6) at:tileCoord];
                    CGPoint tileCoord1 = [self tileCoordForPosition:self.sprite125.position];
                    int tileGID1 = [self.bgLayer tileGIDAt:tileCoord1];
                    [self.bgLayer removeTileAt:tileCoord1];
                    [self.bgLayer setTileGID:(tileGID1 - 6) at:tileCoord1];
                    
                    id actionMove = [CCMoveTo actionWithDuration:0.3 position:sprite125Pos];
                    id actionMove2 = [CCAnimate actionWithAnimation:spriteTWalkDown restoreOriginalFrame:NO];
                    
                    id actionMoveDone = [CCCallFuncN actionWithTarget:self selector:@selector(finishActionSprite125)];
                    
                    [self.sprite125 runAction:[CCSpawn actionOne:[CCSequence actions:actionMove,actionMoveDone,nil] two:actionMove2]];
                    return;
                }
            }
        }
    }
    [self finishActionSprite125];
}
-(void) finishActionSprite125
{
    if (self.sprite125.orientation == 1)
    {
        [self.sprite125 setDisplayFrame:[[spriteTWalkDown frames] objectAtIndex:0]];
    }
    else if (self.sprite125.orientation == 2)
    {
        [self.sprite125 setDisplayFrame:[[spriteTWalkUp frames] objectAtIndex:0]];
    }
    else if (self.sprite125.orientation == 3)
    {
        [self.sprite125 setDisplayFrame:[[spriteTWalkRight frames] objectAtIndex:0]];
    }
    else
    {
        [self.sprite125 setDisplayFrame:[[spriteTWalkLeft frames] objectAtIndex:0]];
    }
    self.hero.sprite125position = self.sprite125.position;
}
-(void) updateSprite126
{
    CGSize screenSize = [[CCDirector sharedDirector] winSize];
    int x = self.hero.position.x;
    int y = self.hero.position.y;
    
    int p = self.sprite126.position.x;
    int q = self.sprite126.position.y;
    
    int diffx = abs(x-p);
    int diffy = abs(y-q);
    
    if ((diffx > screenSize.width/1.5) || (diffy > screenSize.height/1.5))
    {
        return;
    }
    if (self.spriteEvenIsTalking)
    {
        return;
    }
    
    int rand = arc4random()%12;
    if (rand == 1)
    {
        [self moveleftSprite126];
    }
    if (rand == 2)
    {
        [self moverightSprite126];
    }
    if (rand == 3)
    {
        [self moveupSprite126];
    }
    if (rand == 4)
    {
        [self movedownSprite126];
    }
    return;
}

-(void) moveleftSprite126
{
    CGPoint sprite126Pos = self.sprite126.position;
    self.sprite126.orientation = 4;
    sprite126Pos.x -= _theHKMap.tileSize.width;
    
    CGPoint tileCoord = [self tileCoordForPosition:sprite126Pos];
    int tileGID = [self.bgLayer tileGIDAt:tileCoord];
    if (tileGID)
    {
        NSDictionary *properties = [_theHKMap propertiesForGID:tileGID];
        if (properties)
        {
            NSString *range = [properties valueForKey:@"spriteRange"];
            if (range && [range compare:@"true"] == NSOrderedSame)
            {
                CGPoint heroTileCoord = [self tileCoordForPosition:self.hero.position];
                CGPoint nextHeroTileCoord = [self tileCoordForPosition:self.tempLocation2];
                if (!((heroTileCoord.x == tileCoord.x) && (heroTileCoord.y == tileCoord.y)) && !((nextHeroTileCoord.x == tileCoord.x) && (nextHeroTileCoord.y == tileCoord.y)))
                {
                    [self.bgLayer removeTileAt:tileCoord];
                    [self.bgLayer setTileGID:(tileGID + 7) at:tileCoord];
                    CGPoint tileCoord1 = [self tileCoordForPosition:self.sprite126.position];
                    int tileGID1 = [self.bgLayer tileGIDAt:tileCoord1];
                    [self.bgLayer removeTileAt:tileCoord1];
                    [self.bgLayer setTileGID:(tileGID1 - 7) at:tileCoord1];
                    
                    id actionMove = [CCMoveTo actionWithDuration:0.3 position:sprite126Pos];
                    id actionMove2 = [CCAnimate actionWithAnimation:spriteUWalkLeft restoreOriginalFrame:NO];
                    
                    id actionMoveDone = [CCCallFuncN actionWithTarget:self selector:@selector(finishActionSprite126)];
                    
                    [self.sprite126 runAction:[CCSpawn actionOne:[CCSequence actions:actionMove,actionMoveDone,nil] two:actionMove2]];
                    return;
                }
            }
        }
    }
    [self finishActionSprite126];
}
-(void) moverightSprite126
{
    CGPoint sprite126Pos = self.sprite126.position;
    self.sprite126.orientation = 3;
    sprite126Pos.x += _theHKMap.tileSize.width;
    
    CGPoint tileCoord = [self tileCoordForPosition:sprite126Pos];
    int tileGID = [self.bgLayer tileGIDAt:tileCoord];
    if (tileGID)
    {
        NSDictionary *properties = [_theHKMap propertiesForGID:tileGID];
        if (properties)
        {
            NSString *range = [properties valueForKey:@"spriteRange"];
            if (range && [range compare:@"true"] == NSOrderedSame)
            {
                CGPoint heroTileCoord = [self tileCoordForPosition:self.hero.position];
                CGPoint nextHeroTileCoord = [self tileCoordForPosition:self.tempLocation2];
                if (!((heroTileCoord.x == tileCoord.x) && (heroTileCoord.y == tileCoord.y)) && !((nextHeroTileCoord.x == tileCoord.x) && (nextHeroTileCoord.y == tileCoord.y)))
                {
                    [self.bgLayer removeTileAt:tileCoord];
                    [self.bgLayer setTileGID:(tileGID + 7) at:tileCoord];
                    CGPoint tileCoord1 = [self tileCoordForPosition:self.sprite126.position];
                    int tileGID1 = [self.bgLayer tileGIDAt:tileCoord1];
                    [self.bgLayer removeTileAt:tileCoord1];
                    [self.bgLayer setTileGID:(tileGID1 - 7) at:tileCoord1];
                    
                    id actionMove = [CCMoveTo actionWithDuration:0.3 position:sprite126Pos];
                    id actionMove2 = [CCAnimate actionWithAnimation:spriteUWalkRight restoreOriginalFrame:NO];
                    
                    id actionMoveDone = [CCCallFuncN actionWithTarget:self selector:@selector(finishActionSprite126)];
                    
                    [self.sprite126 runAction:[CCSpawn actionOne:[CCSequence actions:actionMove,actionMoveDone,nil] two:actionMove2]];
                    return;
                }
            }
        }
    }
    [self finishActionSprite126];
}
-(void) moveupSprite126
{
    CGPoint sprite126Pos = self.sprite126.position;
    self.sprite126.orientation = 2;
    sprite126Pos.y += _theHKMap.tileSize.height;
    
    CGPoint tileCoord = [self tileCoordForPosition:sprite126Pos];
    int tileGID = [self.bgLayer tileGIDAt:tileCoord];
    if (tileGID)
    {
        NSDictionary *properties = [_theHKMap propertiesForGID:tileGID];
        if (properties)
        {
            NSString *range = [properties valueForKey:@"spriteRange"];
            if (range && [range compare:@"true"] == NSOrderedSame)
            {
                CGPoint heroTileCoord = [self tileCoordForPosition:self.hero.position];
                CGPoint nextHeroTileCoord = [self tileCoordForPosition:self.tempLocation2];
                if (!((heroTileCoord.x == tileCoord.x) && (heroTileCoord.y == tileCoord.y)) && !((nextHeroTileCoord.x == tileCoord.x) && (nextHeroTileCoord.y == tileCoord.y)))
                {
                    [self.bgLayer removeTileAt:tileCoord];
                    [self.bgLayer setTileGID:(tileGID + 7) at:tileCoord];
                    CGPoint tileCoord1 = [self tileCoordForPosition:self.sprite126.position];
                    int tileGID1 = [self.bgLayer tileGIDAt:tileCoord1];
                    [self.bgLayer removeTileAt:tileCoord1];
                    [self.bgLayer setTileGID:(tileGID1 - 7) at:tileCoord1];
                    
                    id actionMove = [CCMoveTo actionWithDuration:0.3 position:sprite126Pos];
                    id actionMove2 = [CCAnimate actionWithAnimation:spriteUWalkUp restoreOriginalFrame:NO];
                    
                    id actionMoveDone = [CCCallFuncN actionWithTarget:self selector:@selector(finishActionSprite126)];
                    
                    [self.sprite126 runAction:[CCSpawn actionOne:[CCSequence actions:actionMove,actionMoveDone,nil] two:actionMove2]];
                    return;
                }
            }
        }
    }
    [self finishActionSprite126];
}
-(void) movedownSprite126
{
    CGPoint sprite126Pos = self.sprite126.position;
    self.sprite126.orientation = 1;
    sprite126Pos.y -= _theHKMap.tileSize.width;
    
    CGPoint tileCoord = [self tileCoordForPosition:sprite126Pos];
    int tileGID = [self.bgLayer tileGIDAt:tileCoord];
    if (tileGID)
    {
        NSDictionary *properties = [_theHKMap propertiesForGID:tileGID];
        if (properties)
        {
            NSString *range = [properties valueForKey:@"spriteRange"];
            if (range && [range compare:@"true"] == NSOrderedSame)
            {
                CGPoint heroTileCoord = [self tileCoordForPosition:self.hero.position];
                CGPoint nextHeroTileCoord = [self tileCoordForPosition:self.tempLocation2];
                if (!((heroTileCoord.x == tileCoord.x) && (heroTileCoord.y == tileCoord.y)) && !((nextHeroTileCoord.x == tileCoord.x) && (nextHeroTileCoord.y == tileCoord.y)))
                {
                    [self.bgLayer removeTileAt:tileCoord];
                    [self.bgLayer setTileGID:(tileGID + 7) at:tileCoord];
                    CGPoint tileCoord1 = [self tileCoordForPosition:self.sprite126.position];
                    int tileGID1 = [self.bgLayer tileGIDAt:tileCoord1];
                    [self.bgLayer removeTileAt:tileCoord1];
                    [self.bgLayer setTileGID:(tileGID1 - 7) at:tileCoord1];
                    
                    id actionMove = [CCMoveTo actionWithDuration:0.3 position:sprite126Pos];
                    id actionMove2 = [CCAnimate actionWithAnimation:spriteUWalkDown restoreOriginalFrame:NO];
                    
                    id actionMoveDone = [CCCallFuncN actionWithTarget:self selector:@selector(finishActionSprite126)];
                    
                    [self.sprite126 runAction:[CCSpawn actionOne:[CCSequence actions:actionMove,actionMoveDone,nil] two:actionMove2]];
                    return;
                }
            }
        }
    }
    [self finishActionSprite126];
}
-(void) finishActionSprite126
{
    if (self.sprite126.orientation == 1)
    {
        [self.sprite126 setDisplayFrame:[[spriteUWalkDown frames] objectAtIndex:0]];
    }
    else if (self.sprite126.orientation == 2)
    {
        [self.sprite126 setDisplayFrame:[[spriteUWalkUp frames] objectAtIndex:0]];
    }
    else if (self.sprite126.orientation == 3)
    {
        [self.sprite126 setDisplayFrame:[[spriteUWalkRight frames] objectAtIndex:0]];
    }
    else
    {
        [self.sprite126 setDisplayFrame:[[spriteUWalkLeft frames] objectAtIndex:0]];
    }
    self.hero.sprite126position = self.sprite126.position;
}
-(void) updateSprite127
{
    CGSize screenSize = [[CCDirector sharedDirector] winSize];
    int x = self.hero.position.x;
    int y = self.hero.position.y;
    
    int p = self.sprite127.position.x;
    int q = self.sprite127.position.y;
    
    int diffx = abs(x-p);
    int diffy = abs(y-q);
    
    if ((diffx > screenSize.width/1.5) || (diffy > screenSize.height/1.5))
    {
        return;
    }
    if (self.spriteOddIsTalking)
    {
        return;
    }
    
    int rand = arc4random()%12;
    if (rand == 1)
    {
        [self moveleftSprite127];
    }
    if (rand == 2)
    {
        [self moverightSprite127];
    }
    if (rand == 3)
    {
        [self moveupSprite127];
    }
    if (rand == 4)
    {
        [self movedownSprite127];
    }
    return;
}

-(void) moveleftSprite127
{
    CGPoint sprite127Pos = self.sprite127.position;
    self.sprite127.orientation = 4;
    sprite127Pos.x -= _theHKMap.tileSize.width;
    
    CGPoint tileCoord = [self tileCoordForPosition:sprite127Pos];
    int tileGID = [self.bgLayer tileGIDAt:tileCoord];
    if (tileGID)
    {
        NSDictionary *properties = [_theHKMap propertiesForGID:tileGID];
        if (properties)
        {
            NSString *range = [properties valueForKey:@"spriteRange"];
            if (range && [range compare:@"true"] == NSOrderedSame)
            {
                CGPoint heroTileCoord = [self tileCoordForPosition:self.hero.position];
                CGPoint nextHeroTileCoord = [self tileCoordForPosition:self.tempLocation2];
                if (!((heroTileCoord.x == tileCoord.x) && (heroTileCoord.y == tileCoord.y)) && !((nextHeroTileCoord.x == tileCoord.x) && (nextHeroTileCoord.y == tileCoord.y)))
                {
                    [self.bgLayer removeTileAt:tileCoord];
                    [self.bgLayer setTileGID:(tileGID + 8) at:tileCoord];
                    CGPoint tileCoord1 = [self tileCoordForPosition:self.sprite127.position];
                    int tileGID1 = [self.bgLayer tileGIDAt:tileCoord1];
                    [self.bgLayer removeTileAt:tileCoord1];
                    [self.bgLayer setTileGID:(tileGID1 - 8) at:tileCoord1];
                    
                    id actionMove = [CCMoveTo actionWithDuration:0.3 position:sprite127Pos];
                    id actionMove2 = [CCAnimate actionWithAnimation:spriteCWalkLeft restoreOriginalFrame:NO];
                    
                    id actionMoveDone = [CCCallFuncN actionWithTarget:self selector:@selector(finishActionSprite127)];
                    
                    [self.sprite127 runAction:[CCSpawn actionOne:[CCSequence actions:actionMove,actionMoveDone,nil] two:actionMove2]];
                    return;
                }
            }
        }
    }
    [self finishActionSprite127];
}
-(void) moverightSprite127
{
    CGPoint sprite127Pos = self.sprite127.position;
    self.sprite127.orientation = 3;
    sprite127Pos.x += _theHKMap.tileSize.width;
    
    CGPoint tileCoord = [self tileCoordForPosition:sprite127Pos];
    int tileGID = [self.bgLayer tileGIDAt:tileCoord];
    if (tileGID)
    {
        NSDictionary *properties = [_theHKMap propertiesForGID:tileGID];
        if (properties)
        {
            NSString *range = [properties valueForKey:@"spriteRange"];
            if (range && [range compare:@"true"] == NSOrderedSame)
            {
                CGPoint heroTileCoord = [self tileCoordForPosition:self.hero.position];
                CGPoint nextHeroTileCoord = [self tileCoordForPosition:self.tempLocation2];
                if (!((heroTileCoord.x == tileCoord.x) && (heroTileCoord.y == tileCoord.y)) && !((nextHeroTileCoord.x == tileCoord.x) && (nextHeroTileCoord.y == tileCoord.y)))
                {
                    [self.bgLayer removeTileAt:tileCoord];
                    [self.bgLayer setTileGID:(tileGID + 8) at:tileCoord];
                    CGPoint tileCoord1 = [self tileCoordForPosition:self.sprite127.position];
                    int tileGID1 = [self.bgLayer tileGIDAt:tileCoord1];
                    [self.bgLayer removeTileAt:tileCoord1];
                    [self.bgLayer setTileGID:(tileGID1 - 8) at:tileCoord1];
                    
                    id actionMove = [CCMoveTo actionWithDuration:0.3 position:sprite127Pos];
                    id actionMove2 = [CCAnimate actionWithAnimation:spriteCWalkRight restoreOriginalFrame:NO];
                    
                    id actionMoveDone = [CCCallFuncN actionWithTarget:self selector:@selector(finishActionSprite127)];
                    
                    [self.sprite127 runAction:[CCSpawn actionOne:[CCSequence actions:actionMove,actionMoveDone,nil] two:actionMove2]];
                    return;
                }
            }
        }
    }
    [self finishActionSprite127];
}
-(void) moveupSprite127
{
    CGPoint sprite127Pos = self.sprite127.position;
    self.sprite127.orientation = 2;
    sprite127Pos.y += _theHKMap.tileSize.height;
    
    CGPoint tileCoord = [self tileCoordForPosition:sprite127Pos];
    int tileGID = [self.bgLayer tileGIDAt:tileCoord];
    if (tileGID)
    {
        NSDictionary *properties = [_theHKMap propertiesForGID:tileGID];
        if (properties)
        {
            NSString *range = [properties valueForKey:@"spriteRange"];
            if (range && [range compare:@"true"] == NSOrderedSame)
            {
                CGPoint heroTileCoord = [self tileCoordForPosition:self.hero.position];
                CGPoint nextHeroTileCoord = [self tileCoordForPosition:self.tempLocation2];
                if (!((heroTileCoord.x == tileCoord.x) && (heroTileCoord.y == tileCoord.y)) && !((nextHeroTileCoord.x == tileCoord.x) && (nextHeroTileCoord.y == tileCoord.y)))
                {
                    [self.bgLayer removeTileAt:tileCoord];
                    [self.bgLayer setTileGID:(tileGID + 8) at:tileCoord];
                    CGPoint tileCoord1 = [self tileCoordForPosition:self.sprite127.position];
                    int tileGID1 = [self.bgLayer tileGIDAt:tileCoord1];
                    [self.bgLayer removeTileAt:tileCoord1];
                    [self.bgLayer setTileGID:(tileGID1 - 8) at:tileCoord1];
                    
                    id actionMove = [CCMoveTo actionWithDuration:0.3 position:sprite127Pos];
                    id actionMove2 = [CCAnimate actionWithAnimation:spriteCWalkUp restoreOriginalFrame:NO];
                    
                    id actionMoveDone = [CCCallFuncN actionWithTarget:self selector:@selector(finishActionSprite127)];
                    
                    [self.sprite127 runAction:[CCSpawn actionOne:[CCSequence actions:actionMove,actionMoveDone,nil] two:actionMove2]];
                    return;
                }
            }
        }
    }
    [self finishActionSprite127];
}
-(void) movedownSprite127
{
    CGPoint sprite127Pos = self.sprite127.position;
    self.sprite127.orientation = 1;
    sprite127Pos.y -= _theHKMap.tileSize.width;
    
    CGPoint tileCoord = [self tileCoordForPosition:sprite127Pos];
    int tileGID = [self.bgLayer tileGIDAt:tileCoord];
    if (tileGID)
    {
        NSDictionary *properties = [_theHKMap propertiesForGID:tileGID];
        if (properties)
        {
            NSString *range = [properties valueForKey:@"spriteRange"];
            if (range && [range compare:@"true"] == NSOrderedSame)
            {
                CGPoint heroTileCoord = [self tileCoordForPosition:self.hero.position];
                CGPoint nextHeroTileCoord = [self tileCoordForPosition:self.tempLocation2];
                if (!((heroTileCoord.x == tileCoord.x) && (heroTileCoord.y == tileCoord.y)) && !((nextHeroTileCoord.x == tileCoord.x) && (nextHeroTileCoord.y == tileCoord.y)))
                {
                    [self.bgLayer removeTileAt:tileCoord];
                    [self.bgLayer setTileGID:(tileGID + 8) at:tileCoord];
                    CGPoint tileCoord1 = [self tileCoordForPosition:self.sprite127.position];
                    int tileGID1 = [self.bgLayer tileGIDAt:tileCoord1];
                    [self.bgLayer removeTileAt:tileCoord1];
                    [self.bgLayer setTileGID:(tileGID1 - 8) at:tileCoord1];
                    
                    id actionMove = [CCMoveTo actionWithDuration:0.3 position:sprite127Pos];
                    id actionMove2 = [CCAnimate actionWithAnimation:spriteCWalkDown restoreOriginalFrame:NO];
                    
                    id actionMoveDone = [CCCallFuncN actionWithTarget:self selector:@selector(finishActionSprite127)];
                    
                    [self.sprite127 runAction:[CCSpawn actionOne:[CCSequence actions:actionMove,actionMoveDone,nil] two:actionMove2]];
                    return;
                }
            }
        }
    }
    [self finishActionSprite127];
}
-(void) finishActionSprite127
{
    if (self.sprite127.orientation == 1)
    {
        [self.sprite127 setDisplayFrame:[[spriteCWalkDown frames] objectAtIndex:0]];
    }
    else if (self.sprite127.orientation == 2)
    {
        [self.sprite127 setDisplayFrame:[[spriteCWalkUp frames] objectAtIndex:0]];
    }
    else if (self.sprite127.orientation == 3)
    {
        [self.sprite127 setDisplayFrame:[[spriteCWalkRight frames] objectAtIndex:0]];
    }
    else
    {
        [self.sprite127 setDisplayFrame:[[spriteCWalkLeft frames] objectAtIndex:0]];
    }
    self.hero.sprite127position = self.sprite127.position;
}
-(void) updateSprite128
{
    CGSize screenSize = [[CCDirector sharedDirector] winSize];
    int x = self.hero.position.x;
    int y = self.hero.position.y;
    
    int p = self.sprite128.position.x;
    int q = self.sprite128.position.y;
    
    int diffx = abs(x-p);
    int diffy = abs(y-q);
    
    if ((diffx > screenSize.width/1.5) || (diffy > screenSize.height/1.5))
    {
        return;
    }
    if (self.spriteEvenIsTalking)
    {
        return;
    }
    
    int rand = arc4random()%12;
    if (rand == 1)
    {
        [self moveleftSprite128];
    }
    if (rand == 2)
    {
        [self moverightSprite128];
    }
    if (rand == 3)
    {
        [self moveupSprite128];
    }
    if (rand == 4)
    {
        [self movedownSprite128];
    }
    return;
}

-(void) moveleftSprite128
{
    CGPoint sprite128Pos = self.sprite128.position;
    self.sprite128.orientation = 4;
    sprite128Pos.x -= _theHKMap.tileSize.width;
    
    CGPoint tileCoord = [self tileCoordForPosition:sprite128Pos];
    int tileGID = [self.bgLayer tileGIDAt:tileCoord];
    if (tileGID)
    {
        NSDictionary *properties = [_theHKMap propertiesForGID:tileGID];
        if (properties)
        {
            NSString *range = [properties valueForKey:@"spriteRange"];
            if (range && [range compare:@"true"] == NSOrderedSame)
            {
                CGPoint heroTileCoord = [self tileCoordForPosition:self.hero.position];
                CGPoint nextHeroTileCoord = [self tileCoordForPosition:self.tempLocation2];
                if (!((heroTileCoord.x == tileCoord.x) && (heroTileCoord.y == tileCoord.y)) && !((nextHeroTileCoord.x == tileCoord.x) && (nextHeroTileCoord.y == tileCoord.y)))
                {
                    [self.bgLayer removeTileAt:tileCoord];
                    [self.bgLayer setTileGID:(tileGID + 9) at:tileCoord];
                    CGPoint tileCoord1 = [self tileCoordForPosition:self.sprite128.position];
                    int tileGID1 = [self.bgLayer tileGIDAt:tileCoord1];
                    [self.bgLayer removeTileAt:tileCoord1];
                    [self.bgLayer setTileGID:(tileGID1 - 9) at:tileCoord1];
                    
                    id actionMove = [CCMoveTo actionWithDuration:0.3 position:sprite128Pos];
                    id actionMove2 = [CCAnimate actionWithAnimation:spriteIWalkLeft restoreOriginalFrame:NO];
                    
                    id actionMoveDone = [CCCallFuncN actionWithTarget:self selector:@selector(finishActionSprite128)];
                    
                    [self.sprite128 runAction:[CCSpawn actionOne:[CCSequence actions:actionMove,actionMoveDone,nil] two:actionMove2]];
                    return;
                }
            }
        }
    }
    [self finishActionSprite128];
}
-(void) moverightSprite128
{
    CGPoint sprite128Pos = self.sprite128.position;
    self.sprite128.orientation = 3;
    sprite128Pos.x += _theHKMap.tileSize.width;
    
    CGPoint tileCoord = [self tileCoordForPosition:sprite128Pos];
    int tileGID = [self.bgLayer tileGIDAt:tileCoord];
    if (tileGID)
    {
        NSDictionary *properties = [_theHKMap propertiesForGID:tileGID];
        if (properties)
        {
            NSString *range = [properties valueForKey:@"spriteRange"];
            if (range && [range compare:@"true"] == NSOrderedSame)
            {
                CGPoint heroTileCoord = [self tileCoordForPosition:self.hero.position];
                CGPoint nextHeroTileCoord = [self tileCoordForPosition:self.tempLocation2];
                if (!((heroTileCoord.x == tileCoord.x) && (heroTileCoord.y == tileCoord.y)) && !((nextHeroTileCoord.x == tileCoord.x) && (nextHeroTileCoord.y == tileCoord.y)))
                {
                    [self.bgLayer removeTileAt:tileCoord];
                    [self.bgLayer setTileGID:(tileGID + 9) at:tileCoord];
                    CGPoint tileCoord1 = [self tileCoordForPosition:self.sprite128.position];
                    int tileGID1 = [self.bgLayer tileGIDAt:tileCoord1];
                    [self.bgLayer removeTileAt:tileCoord1];
                    [self.bgLayer setTileGID:(tileGID1 - 9) at:tileCoord1];
                    
                    id actionMove = [CCMoveTo actionWithDuration:0.3 position:sprite128Pos];
                    id actionMove2 = [CCAnimate actionWithAnimation:spriteIWalkRight restoreOriginalFrame:NO];
                    
                    id actionMoveDone = [CCCallFuncN actionWithTarget:self selector:@selector(finishActionSprite128)];
                    
                    [self.sprite128 runAction:[CCSpawn actionOne:[CCSequence actions:actionMove,actionMoveDone,nil] two:actionMove2]];
                    return;
                }
            }
        }
    }
    [self finishActionSprite128];
}
-(void) moveupSprite128
{
    CGPoint sprite128Pos = self.sprite128.position;
    self.sprite128.orientation = 2;
    sprite128Pos.y += _theHKMap.tileSize.height;
    
    CGPoint tileCoord = [self tileCoordForPosition:sprite128Pos];
    int tileGID = [self.bgLayer tileGIDAt:tileCoord];
    if (tileGID)
    {
        NSDictionary *properties = [_theHKMap propertiesForGID:tileGID];
        if (properties)
        {
            NSString *range = [properties valueForKey:@"spriteRange"];
            if (range && [range compare:@"true"] == NSOrderedSame)
            {
                CGPoint heroTileCoord = [self tileCoordForPosition:self.hero.position];
                CGPoint nextHeroTileCoord = [self tileCoordForPosition:self.tempLocation2];
                if (!((heroTileCoord.x == tileCoord.x) && (heroTileCoord.y == tileCoord.y)) && !((nextHeroTileCoord.x == tileCoord.x) && (nextHeroTileCoord.y == tileCoord.y)))
                {
                    [self.bgLayer removeTileAt:tileCoord];
                    [self.bgLayer setTileGID:(tileGID + 9) at:tileCoord];
                    CGPoint tileCoord1 = [self tileCoordForPosition:self.sprite128.position];
                    int tileGID1 = [self.bgLayer tileGIDAt:tileCoord1];
                    [self.bgLayer removeTileAt:tileCoord1];
                    [self.bgLayer setTileGID:(tileGID1 - 9) at:tileCoord1];
                    
                    id actionMove = [CCMoveTo actionWithDuration:0.3 position:sprite128Pos];
                    id actionMove2 = [CCAnimate actionWithAnimation:spriteIWalkUp restoreOriginalFrame:NO];
                    
                    id actionMoveDone = [CCCallFuncN actionWithTarget:self selector:@selector(finishActionSprite128)];
                    
                    [self.sprite128 runAction:[CCSpawn actionOne:[CCSequence actions:actionMove,actionMoveDone,nil] two:actionMove2]];
                    return;
                }
            }
        }
    }
    [self finishActionSprite128];
}
-(void) movedownSprite128
{
    CGPoint sprite128Pos = self.sprite128.position;
    self.sprite128.orientation = 1;
    sprite128Pos.y -= _theHKMap.tileSize.width;
    
    CGPoint tileCoord = [self tileCoordForPosition:sprite128Pos];
    int tileGID = [self.bgLayer tileGIDAt:tileCoord];
    if (tileGID)
    {
        NSDictionary *properties = [_theHKMap propertiesForGID:tileGID];
        if (properties)
        {
            NSString *range = [properties valueForKey:@"spriteRange"];
            if (range && [range compare:@"true"] == NSOrderedSame)
            {
                CGPoint heroTileCoord = [self tileCoordForPosition:self.hero.position];
                CGPoint nextHeroTileCoord = [self tileCoordForPosition:self.tempLocation2];
                if (!((heroTileCoord.x == tileCoord.x) && (heroTileCoord.y == tileCoord.y)) && !((nextHeroTileCoord.x == tileCoord.x) && (nextHeroTileCoord.y == tileCoord.y)))
                {
                    [self.bgLayer removeTileAt:tileCoord];
                    [self.bgLayer setTileGID:(tileGID + 9) at:tileCoord];
                    CGPoint tileCoord1 = [self tileCoordForPosition:self.sprite128.position];
                    int tileGID1 = [self.bgLayer tileGIDAt:tileCoord1];
                    [self.bgLayer removeTileAt:tileCoord1];
                    [self.bgLayer setTileGID:(tileGID1 - 9) at:tileCoord1];
                    
                    id actionMove = [CCMoveTo actionWithDuration:0.3 position:sprite128Pos];
                    id actionMove2 = [CCAnimate actionWithAnimation:spriteIWalkDown restoreOriginalFrame:NO];
                    
                    id actionMoveDone = [CCCallFuncN actionWithTarget:self selector:@selector(finishActionSprite128)];
                    
                    [self.sprite128 runAction:[CCSpawn actionOne:[CCSequence actions:actionMove,actionMoveDone,nil] two:actionMove2]];
                    return;
                }
            }
        }
    }
    [self finishActionSprite128];
}
-(void) finishActionSprite128
{
    if (self.sprite128.orientation == 1)
    {
        [self.sprite128 setDisplayFrame:[[spriteIWalkDown frames] objectAtIndex:0]];
    }
    else if (self.sprite128.orientation == 2)
    {
        [self.sprite128 setDisplayFrame:[[spriteIWalkUp frames] objectAtIndex:0]];
    }
    else if (self.sprite128.orientation == 3)
    {
        [self.sprite128 setDisplayFrame:[[spriteIWalkRight frames] objectAtIndex:0]];
    }
    else
    {
        [self.sprite128 setDisplayFrame:[[spriteIWalkLeft frames] objectAtIndex:0]];
    }
    self.hero.sprite128position = self.sprite128.position;
}
-(void) updateSprite129
{
    CGSize screenSize = [[CCDirector sharedDirector] winSize];
    int x = self.hero.position.x;
    int y = self.hero.position.y;
    
    int p = self.sprite129.position.x;
    int q = self.sprite129.position.y;
    
    int diffx = abs(x-p);
    int diffy = abs(y-q);
    
    if ((diffx > screenSize.width/1.5) || (diffy > screenSize.height/1.5))
    {
        return;
    }
    if (self.spriteOddIsTalking)
    {
        return;
    }
    
    int rand = arc4random()%12;
    if (rand == 1)
    {
        [self moveleftSprite129];
    }
    if (rand == 2)
    {
        [self moverightSprite129];
    }
    if (rand == 3)
    {
        [self moveupSprite129];
    }
    if (rand == 4)
    {
        [self movedownSprite129];
    }
    return;
}

-(void) moveleftSprite129
{
    CGPoint sprite129Pos = self.sprite129.position;
    self.sprite129.orientation = 4;
    sprite129Pos.x -= _theHKMap.tileSize.width;
    
    CGPoint tileCoord = [self tileCoordForPosition:sprite129Pos];
    int tileGID = [self.bgLayer tileGIDAt:tileCoord];
    if (tileGID)
    {
        NSDictionary *properties = [_theHKMap propertiesForGID:tileGID];
        if (properties)
        {
            NSString *range = [properties valueForKey:@"spriteRange"];
            if (range && [range compare:@"true"] == NSOrderedSame)
            {
                CGPoint heroTileCoord = [self tileCoordForPosition:self.hero.position];
                CGPoint nextHeroTileCoord = [self tileCoordForPosition:self.tempLocation2];
                if (!((heroTileCoord.x == tileCoord.x) && (heroTileCoord.y == tileCoord.y)) && !((nextHeroTileCoord.x == tileCoord.x) && (nextHeroTileCoord.y == tileCoord.y)))
                {
                    [self.bgLayer removeTileAt:tileCoord];
                    [self.bgLayer setTileGID:(tileGID + 10) at:tileCoord];
                    CGPoint tileCoord1 = [self tileCoordForPosition:self.sprite129.position];
                    int tileGID1 = [self.bgLayer tileGIDAt:tileCoord1];
                    [self.bgLayer removeTileAt:tileCoord1];
                    [self.bgLayer setTileGID:(tileGID1 - 10) at:tileCoord1];
                    
                    id actionMove = [CCMoveTo actionWithDuration:0.3 position:sprite129Pos];
                    id actionMove2 = [CCAnimate actionWithAnimation:spriteSWalkLeft restoreOriginalFrame:NO];
                    
                    id actionMoveDone = [CCCallFuncN actionWithTarget:self selector:@selector(finishActionSprite129)];
                    
                    [self.sprite129 runAction:[CCSpawn actionOne:[CCSequence actions:actionMove,actionMoveDone,nil] two:actionMove2]];
                    return;
                }
            }
        }
    }
    [self finishActionSprite129];
}
-(void) moverightSprite129
{
    CGPoint sprite129Pos = self.sprite129.position;
    self.sprite129.orientation = 3;
    sprite129Pos.x += _theHKMap.tileSize.width;
    
    CGPoint tileCoord = [self tileCoordForPosition:sprite129Pos];
    int tileGID = [self.bgLayer tileGIDAt:tileCoord];
    if (tileGID)
    {
        NSDictionary *properties = [_theHKMap propertiesForGID:tileGID];
        if (properties)
        {
            NSString *range = [properties valueForKey:@"spriteRange"];
            if (range && [range compare:@"true"] == NSOrderedSame)
            {
                CGPoint heroTileCoord = [self tileCoordForPosition:self.hero.position];
                CGPoint nextHeroTileCoord = [self tileCoordForPosition:self.tempLocation2];
                if (!((heroTileCoord.x == tileCoord.x) && (heroTileCoord.y == tileCoord.y)) && !((nextHeroTileCoord.x == tileCoord.x) && (nextHeroTileCoord.y == tileCoord.y)))
                {
                    [self.bgLayer removeTileAt:tileCoord];
                    [self.bgLayer setTileGID:(tileGID + 10) at:tileCoord];
                    CGPoint tileCoord1 = [self tileCoordForPosition:self.sprite129.position];
                    int tileGID1 = [self.bgLayer tileGIDAt:tileCoord1];
                    [self.bgLayer removeTileAt:tileCoord1];
                    [self.bgLayer setTileGID:(tileGID1 - 10) at:tileCoord1];
                    
                    id actionMove = [CCMoveTo actionWithDuration:0.3 position:sprite129Pos];
                    id actionMove2 = [CCAnimate actionWithAnimation:spriteSWalkRight restoreOriginalFrame:NO];
                    
                    id actionMoveDone = [CCCallFuncN actionWithTarget:self selector:@selector(finishActionSprite129)];
                    
                    [self.sprite129 runAction:[CCSpawn actionOne:[CCSequence actions:actionMove,actionMoveDone,nil] two:actionMove2]];
                    return;
                }
            }
        }
    }
    [self finishActionSprite129];
}
-(void) moveupSprite129
{
    CGPoint sprite129Pos = self.sprite129.position;
    self.sprite129.orientation = 2;
    sprite129Pos.y += _theHKMap.tileSize.height;
    
    CGPoint tileCoord = [self tileCoordForPosition:sprite129Pos];
    int tileGID = [self.bgLayer tileGIDAt:tileCoord];
    if (tileGID)
    {
        NSDictionary *properties = [_theHKMap propertiesForGID:tileGID];
        if (properties)
        {
            NSString *range = [properties valueForKey:@"spriteRange"];
            if (range && [range compare:@"true"] == NSOrderedSame)
            {
                CGPoint heroTileCoord = [self tileCoordForPosition:self.hero.position];
                CGPoint nextHeroTileCoord = [self tileCoordForPosition:self.tempLocation2];
                if (!((heroTileCoord.x == tileCoord.x) && (heroTileCoord.y == tileCoord.y)) && !((nextHeroTileCoord.x == tileCoord.x) && (nextHeroTileCoord.y == tileCoord.y)))
                {
                    [self.bgLayer removeTileAt:tileCoord];
                    [self.bgLayer setTileGID:(tileGID + 10) at:tileCoord];
                    CGPoint tileCoord1 = [self tileCoordForPosition:self.sprite129.position];
                    int tileGID1 = [self.bgLayer tileGIDAt:tileCoord1];
                    [self.bgLayer removeTileAt:tileCoord1];
                    [self.bgLayer setTileGID:(tileGID1 - 10) at:tileCoord1];
                    
                    id actionMove = [CCMoveTo actionWithDuration:0.3 position:sprite129Pos];
                    id actionMove2 = [CCAnimate actionWithAnimation:spriteSWalkUp restoreOriginalFrame:NO];
                    
                    id actionMoveDone = [CCCallFuncN actionWithTarget:self selector:@selector(finishActionSprite129)];
                    
                    [self.sprite129 runAction:[CCSpawn actionOne:[CCSequence actions:actionMove,actionMoveDone,nil] two:actionMove2]];
                    return;
                }
            }
        }
    }
    [self finishActionSprite129];
}
-(void) movedownSprite129
{
    CGPoint sprite129Pos = self.sprite129.position;
    self.sprite129.orientation = 1;
    sprite129Pos.y -= _theHKMap.tileSize.width;
    
    CGPoint tileCoord = [self tileCoordForPosition:sprite129Pos];
    int tileGID = [self.bgLayer tileGIDAt:tileCoord];
    if (tileGID)
    {
        NSDictionary *properties = [_theHKMap propertiesForGID:tileGID];
        if (properties)
        {
            NSString *range = [properties valueForKey:@"spriteRange"];
            if (range && [range compare:@"true"] == NSOrderedSame)
            {
                CGPoint heroTileCoord = [self tileCoordForPosition:self.hero.position];
                CGPoint nextHeroTileCoord = [self tileCoordForPosition:self.tempLocation2];
                if (!((heroTileCoord.x == tileCoord.x) && (heroTileCoord.y == tileCoord.y)) && !((nextHeroTileCoord.x == tileCoord.x) && (nextHeroTileCoord.y == tileCoord.y)))
                {
                    [self.bgLayer removeTileAt:tileCoord];
                    [self.bgLayer setTileGID:(tileGID + 10) at:tileCoord];
                    CGPoint tileCoord1 = [self tileCoordForPosition:self.sprite129.position];
                    int tileGID1 = [self.bgLayer tileGIDAt:tileCoord1];
                    [self.bgLayer removeTileAt:tileCoord1];
                    [self.bgLayer setTileGID:(tileGID1 - 10) at:tileCoord1];
                    
                    id actionMove = [CCMoveTo actionWithDuration:0.3 position:sprite129Pos];
                    id actionMove2 = [CCAnimate actionWithAnimation:spriteSWalkDown restoreOriginalFrame:NO];
                    
                    id actionMoveDone = [CCCallFuncN actionWithTarget:self selector:@selector(finishActionSprite129)];
                    
                    [self.sprite129 runAction:[CCSpawn actionOne:[CCSequence actions:actionMove,actionMoveDone,nil] two:actionMove2]];
                    return;
                }
            }
        }
    }
    [self finishActionSprite129];
}
-(void) finishActionSprite129
{
    if (self.sprite129.orientation == 1)
    {
        [self.sprite129 setDisplayFrame:[[spriteSWalkDown frames] objectAtIndex:0]];
    }
    else if (self.sprite129.orientation == 2)
    {
        [self.sprite129 setDisplayFrame:[[spriteSWalkUp frames] objectAtIndex:0]];
    }
    else if (self.sprite129.orientation == 3)
    {
        [self.sprite129 setDisplayFrame:[[spriteSWalkRight frames] objectAtIndex:0]];
    }
    else
    {
        [self.sprite129 setDisplayFrame:[[spriteSWalkLeft frames] objectAtIndex:0]];
    }
    self.hero.sprite129position = self.sprite129.position;
}







































































-(void) spriteCycle //should be scheduled for .125 seconds
{
    spriteCycleCount++;
    
    if (spriteCycleCount == 1)
    {
        [self updateSprite120];
        [self updateSprite121];
    }
    else if (spriteCycleCount == 2)
    {
        [self updateSprite128];
    }
    else if (spriteCycleCount == 3)
    {
        [self updateSprite122];
    }
    else if (spriteCycleCount == 4)
    {
        [self updateSprite123];
    }
    else if (spriteCycleCount == 5)
    {
        [self updateSprite124];
        [self updateSprite125];
    }
    else if (spriteCycleCount == 6)
    {
        [self updateSprite129];
    }
    else if (spriteCycleCount == 7)
    {
        [self updateSprite126];
    }
    else if (spriteCycleCount == 8)
    {
        [self updateSprite127];
    }
    
    
    if (spriteCycleCount > 8)
    {
        spriteCycleCount = 0;
    }
    return;
}

- (void) setPlayerPosition: (CGPoint) position
{
    
    if (self.textPresent)
        return;
    
    if (self.willBattle)
        return;
    
    if (self.spriteEvenIsTalking || self.spriteOddIsTalking)
        return;
    
    [self.myHUD updateSprite];
    
    CGPoint tileCoord = [self tileCoordForPosition:position];
    
    int tileGID = [self.bgLayer tileGIDAt:tileCoord];
    
    if (tileGID)
    {
        NSDictionary *properties = [_theHKMap propertiesForGID:tileGID];
        if (properties)
        {
            NSString *collision = [properties valueForKey:@"collidable"];
            if (collision && [collision compare:@"true"] == NSOrderedSame)
            {
                {
                    
                    if (self.canRespondToTouch)
                        self.canRespondToTouch = NO;
                    else
                        self.canRespondToTouch = YES;
                    [self performSelector:@selector(toggleTouchEnabled) withObject:nil afterDelay:0.04];
                }
                
                return;
            }
            
            NSString *gate7 = [properties valueForKey:@"gate7"];
            if (gate7 && [gate7 compare:@"true"] == NSOrderedSame)
            {
                [self goGate:7];
                return;
            }
            NSString *cave = [properties valueForKey:@"caveDoor"];
            if (cave && [cave compare:@"true"] == NSOrderedSame)
            {
                [self goGate:11];
                return;
            }
            
            NSString *musicChange = [properties valueForKey:@"musicChange"];
            if (musicChange)
            {
                prev = self.hero.musicCode;
                self.hero.musicCode = [musicChange intValue];
                if (prev != self.hero.musicCode)
                {
                    [self changeMusic:self.hero.musicCode];
                }
                
            }
            
            NSString *battleID = [properties valueForKey:@"battleID"];
            if (battleID)
            {
                if (self.hero.freeSteps <= 0)
                {
                    currentBID = [battleID intValue];
                    double rando = arc4random()%20;
                    if (rando == 0)
                    {
                        [self saveHero];
                        self.willBattle = YES;
                        
                    }
                }
            }
            
            
        }
    }
    if (self.canRespondToTouch)
        self.canRespondToTouch = NO;
    else
        self.canRespondToTouch = YES;
    [self moveSprite:position];
}



- (void) dsetPlayerPosition: (CGPoint) position
{
    
    if (self.textPresent)
        return;
    
    if (self.willBattle)
        return;
    
    if (self.spriteEvenIsTalking || self.spriteOddIsTalking)
        return;
    
    [self.myHUD updateSprite];
    
    CGPoint tileCoord = [self tileCoordForPosition:position];
    
    int tileGID = [self.bgLayer tileGIDAt:tileCoord];
    
    if (tileGID)
    {
        NSDictionary *properties = [_theHKMap propertiesForGID:tileGID];
        if (properties)
        {
            NSString *collision = [properties valueForKey:@"collidable"];
            if (collision && [collision compare:@"true"] == NSOrderedSame)
            {
                isBeingTouched = NO;
                if (self.canRespondToTouch)
                    self.canRespondToTouch = NO;
                else
                    self.canRespondToTouch = YES;
                
                self.myHUD.isInMotion = NO;
                {
                    if (self.spriteOrientation == 1)
                    {
                        [self.guy setDisplayFrame:[[heroWalkDown frames] objectAtIndex:0]];
                    }
                    
                    if (self.spriteOrientation == 2)
                    {
                        [self.guy setDisplayFrame:[[heroWalkUp frames] objectAtIndex:0]];
                    }
                    
                    if (self.spriteOrientation == 3)
                    {
                        [self.guy setDisplayFrame:[[heroWalkRight frames] objectAtIndex:0]];
                    }
                    
                    if (self.spriteOrientation == 4)
                    {
                        [self.guy setDisplayFrame:[[heroWalkLeft frames] objectAtIndex:0]];
                    }
                }
                return;
            }
            
            NSString *musicChange = [properties valueForKey:@"musicChange"];
            if (musicChange)
            {
                prev = self.hero.musicCode;
                self.hero.musicCode = [musicChange intValue];
                if (prev != self.hero.musicCode)
                {
                    [self changeMusic:self.hero.musicCode];
                }
                
            }
            
            NSString *cave = [properties valueForKey:@"caveDoor"];
            if (cave && [cave compare:@"true"] == NSOrderedSame)
            {
                
                if (self.spriteOrientation == 1)
                {
                    [self.guy setDisplayFrame:[[heroWalkDown frames] objectAtIndex:0]];
                }
                
                if (self.spriteOrientation == 2)
                {
                    [self.guy setDisplayFrame:[[heroWalkUp frames] objectAtIndex:0]];
                }
                
                if (self.spriteOrientation == 3)
                {
                    [self.guy setDisplayFrame:[[heroWalkRight frames] objectAtIndex:0]];
                }
                
                if (self.spriteOrientation == 4)
                {
                    [self.guy setDisplayFrame:[[heroWalkLeft frames] objectAtIndex:0]];
                }
                
                [self goGate:11];
                return;
            }
            NSString *gate7 = [properties valueForKey:@"gate7"];
            if (gate7 && [gate7 compare:@"true"] == NSOrderedSame)
            {
                if (self.spriteOrientation == 1)
                {
                    [self.guy setDisplayFrame:[[heroWalkDown frames] objectAtIndex:0]];
                }
                
                if (self.spriteOrientation == 2)
                {
                    [self.guy setDisplayFrame:[[heroWalkUp frames] objectAtIndex:0]];
                }
                
                if (self.spriteOrientation == 3)
                {
                    [self.guy setDisplayFrame:[[heroWalkRight frames] objectAtIndex:0]];
                }
                
                if (self.spriteOrientation == 4)
                {
                    [self.guy setDisplayFrame:[[heroWalkLeft frames] objectAtIndex:0]];
                }
                [self goGate:7];
                return;
            }
            NSString *battleID = [properties valueForKey:@"battleID"];
            if (battleID)
            {
                if (self.hero.freeSteps <= 0)
                {
                    currentBID = [battleID intValue];
                    double rando = arc4random()%20;
                    if (rando == 0)
                    {
                        [self saveHero];
                        self.willBattle = YES;
                        
                    }
                }
            }
        }
    }
    if (self.canRespondToTouch)
        self.canRespondToTouch = NO;
    else
        self.canRespondToTouch = YES;
    
    [self dmoveSprite:position];
}


-(void)pickedUpItem:(int)itemCode
{
    [MusicHandler playButtonClick];
    if (itemCode == 29)
    {
        CGPoint pos = self.item29.position;
        self.hero.gotItem29 = YES;
        [self.theHKMap removeChild:self.item29 cleanup:YES];
        self.item29 = [CCSprite spriteWithFile:@"treasurechestSprite02.png"];
        self.item29.position = pos;
        [self.theHKMap addChild:self.item29 z:self.bgLayer.zOrder];
        
        [self givenItem:139];
    }
    if (itemCode == 30)
    {
        CGPoint pos = self.item30.position;
        self.hero.gotItem30 = YES;
        [self.theHKMap removeChild:self.item30 cleanup:YES];
        self.item30 = [CCSprite spriteWithFile:@"treasurechestSprite02.png"];
        self.item30.position = pos;
        [self.theHKMap addChild:self.item30 z:self.bgLayer.zOrder];
        
        [self givenItem:126];
    }
    if (itemCode == 31)
    {
        CGPoint pos = self.item31.position;
        self.hero.gotItem31 = YES;
        [self.theHKMap removeChild:self.item31 cleanup:YES];
        self.item31 = [CCSprite spriteWithFile:@"treasurechestSprite02.png"];
        self.item31.position = pos;
        [self.theHKMap addChild:self.item31 z:self.bgLayer.zOrder];
        
        [self givenItem:72];
    }
    else{
        NSLog(@"ErrorPICKEDUPITEM");
    }
    
    
    return;
}

-(void) givenItem:(int)itemCode
{
    NSMutableArray *array = [self.hero.heroInventory mutableCopy];
    
    Item *itemGiven = [[Item alloc] initWithItemCode:itemCode];
    
    [array addObject:(itemGiven)];
    self.hero.heroInventory = array;
    [self saveHero];
}

-(void) goGate:(int)gate
{
    
    self.hero.mapInitMode = 2;
    [self saveHero];
    
    if (gate == 7)
    {
        [SceneManager goPlay:4];
    }
    else if (gate == 11)
    {
        [SceneManager goPlay:11];
    }
    else{
        NSLog(@"gate error");
    }
    return;
}


-(void)saveHero
{
    self.hero.heroOrientation = self.spriteOrientation;
    
    self.hero.sprite112position = self.sprite120.position;
    self.hero.sprite112position = self.sprite121.position;
    self.hero.sprite112position = self.sprite122.position;
    self.hero.sprite113position = self.sprite123.position;
    self.hero.sprite114position = self.sprite124.position;
    self.hero.sprite115position = self.sprite125.position;
    self.hero.sprite116position = self.sprite126.position;
    self.hero.sprite112position = self.sprite127.position;
    self.hero.sprite112position = self.sprite128.position;
    self.hero.sprite112position = self.sprite129.position;
    
    self.hero.sprite112_Orientation = self.sprite120.orientation;
    self.hero.sprite113_Orientation = self.sprite121.orientation;
    self.hero.sprite112_Orientation = self.sprite122.orientation;
    self.hero.sprite113_Orientation = self.sprite123.orientation;
    self.hero.sprite114_Orientation = self.sprite124.orientation;
    self.hero.sprite115_Orientation = self.sprite125.orientation;
    self.hero.sprite116_Orientation = self.sprite126.orientation;
    self.hero.sprite114_Orientation = self.sprite127.orientation;
    self.hero.sprite115_Orientation = self.sprite128.orientation;
    self.hero.sprite116_Orientation = self.sprite129.orientation;
    
    //[GameSceneManager sharedGameSceneManager].hero = self.hero;
}

-(void)stayAtInn
{
    self.hero.heroCurrentHP = self.hero.heroHP;
    self.hero.gold -= 1;
    self.hero.mapInitMode = 1;
    [self saveHero];
    [SceneManager goPlay:8];
    return;
}


- (void) dealloc
{
    [GameSceneManager sharedGameSceneManager].hero = self.hero;
    
    while ([self.hero retainCount] > 1)
    {
        [self.hero release];
    }
    [self.hero release];
    self.hero = nil;
    
    
    self.theHKMap = nil;
    self.bgLayer = nil;
    self.guy = nil;
    self.clLayer = nil;
	[super dealloc];
}



- (void) pressedA
{
    
    /*
     NSLog(@"IntroducedtoKingV value: %d",self.hero.introducedToKingV);
     NSLog(@"talkedToKingVInitial value: %d",self.hero.talkedToKingVInitial); //accepted task
     NSLog(@"gotOrb value: %d", self.hero.gotOrb);
     NSLog(@"hasLitOrb value: %d", self.hero.hasLitOrb);
     NSLog(@"beatBoss1 value: %d", self.hero.beatBoss1);
     NSLog(@"talkedToKingVPostOrb value: %d", self.hero.talkedToKingVPostOrb);
     NSLog(@"acceptedTaskKingVPostOrb value: %d", self.hero.acceptedTaskKingVPostOrb); //got gold
     NSLog(@"deliveredLetterToKingK value: %d", self.hero.deliveredLetterToKingK);
     NSLog(@"acceptedMessageKingK value: %d", self.hero.acceptedMessageKingK);
     NSLog(@"toldNewsKingV value: %d", self.hero.toldNewsKingV);
     NSLog(@"acceptedFindEilifKingV value: %d", self.hero.acceptedFindEilifKingV);
     NSLog(@"beatCyclops value: %d", self.hero.beatCyclops);
     NSLog(@"talkedToEilif value: %d", self.hero.talkedToEilif);
     NSLog(@"beatCaveBoss value: %d", self.hero.beatCaveBoss);
     NSLog(@"talkedToEilifPostBoss value: %d", self.hero.talkedToEilifPostBoss);
     NSLog(@"savedKing value: %d", self.hero.savedKing);
     NSLog(@"talkedToArnuk value: %d", self.hero.talkedToArnuk);
     NSLog(@"beatDragon value: %d", self.hero.beatDragon);
     NSLog(@"beatIonak value: %d", self.hero.beatIonak);
     NSLog(@"gotPrizeFromKingV value: %d", self.hero.gotPrizeFromKingV);
     
     //Side Quest - affecting PL1    ...later
     
     NSLog(@"acceptedTaskTraveler value: %d", self.hero.acceptedTaskTraveler);
     NSLog(@"talkedToWatchmen value: %d", self.hero.talkedToWatchmen);
     NSLog(@"finishedTaskTraveler value: %d", self.hero.finishedTaskTraveler);
     NSLog(@"usedBook value: %d", self.hero.usedBook);
     
     //Other BOOLS (intermediates, items, talkedToRando, etc
     
     NSLog(@"gotItem1 value: %d", self.hero.gotItem1);
     NSLog(@"gotItem2 value: %d", self.hero.gotItem2);
     NSLog(@"gotItem3 value: %d", self.hero.gotItem3);
     NSLog(@"gotItem4 value: %d", self.hero.gotItem4);
     
     NSLog(@"beatIceGolem1 value: %d", self.hero.beatIceGolem1);
     NSLog(@"beatIceGolem2 value: %d", self.hero.beatIceGolem2);
     NSLog(@"beatIceGolem3 value: %d", self.hero.beatIceGolem3);
     NSLog(@"beatVank value: %d", self.hero.beatVank);
     NSLog(@"beatCaveTroll value: %d", self.hero.beatCaveTroll);
     NSLog(@"beatSunDragon value: %d", self.hero.beatSunDragon);
     NSLog(@"beatTitan value: %d", self.hero.beatTitan);
     NSLog(@"beatVodek value: %d", self.hero.beatVodek);
     
     NSLog(@"beatTowerKeeper value: %d", self.hero.beatTowerKeeper);
     */
    
    CGPoint currentPos = self.hero.position;
    int oppOrientation;
    
    if (self.spriteOrientation == 1)
    {
        currentPos.y -= _theHKMap.tileSize.height;
        oppOrientation = 2;
    }
    else if (self.spriteOrientation == 2)
    {
        currentPos.y += _theHKMap.tileSize.height;
        oppOrientation = 1;
    }
    else if (self.spriteOrientation == 3)
    {
        currentPos.x += _theHKMap.tileSize.width;
        oppOrientation = 4;
    }
    else if (self.spriteOrientation == 4)
    {
        currentPos.x -= _theHKMap.tileSize.width;
        oppOrientation = 3;
    }
    else{
        NSLog(@"Sprite Orientation Error: pressedA");
    }
    CGPoint tc = [self tileCoordForPosition:currentPos];
    int tileGID = [self.bgLayer tileGIDAt:tc];
    if (tileGID)
    {
        NSDictionary *properties = [_theHKMap propertiesForGID:tileGID];
        if (properties)
        {
            
            NSString *sprite120Interact = [properties valueForKey:@"sprite120IsHere"];
            if (sprite120Interact && [sprite120Interact compare:@"true"] == NSOrderedSame)
            {
                self.sprite120.orientation = oppOrientation;
                
                if (self.sprite120.orientation == 1)
                {
                    [self.sprite120 setDisplayFrame:[[spriteGWalkDown frames] objectAtIndex:0]];
                }
                else if (self.sprite120.orientation == 2)
                {
                    [self.sprite120 setDisplayFrame:[[spriteGWalkUp frames] objectAtIndex:0]];
                }
                else if (self.sprite120.orientation == 3)
                {
                    [self.sprite120 setDisplayFrame:[[spriteGWalkRight frames] objectAtIndex:0]];
                }
                else
                {
                    [self.sprite120 setDisplayFrame:[[spriteGWalkLeft frames] objectAtIndex:0]];
                }
                
                
                [self goText:7001];
                
                return;
            }
            NSString *sprite121Interact = [properties valueForKey:@"sprite121IsHere"];
            if (sprite121Interact && [sprite121Interact compare:@"true"] == NSOrderedSame)
            {
                self.sprite121.orientation = oppOrientation;
                
                if (self.sprite121.orientation == 1)
                {
                    [self.sprite121 setDisplayFrame:[[spriteGWalkDown frames] objectAtIndex:0]];
                }
                else if (self.sprite121.orientation == 2)
                {
                    [self.sprite121 setDisplayFrame:[[spriteGWalkUp frames] objectAtIndex:0]];
                }
                else if (self.sprite121.orientation == 3)
                {
                    [self.sprite121 setDisplayFrame:[[spriteGWalkRight frames] objectAtIndex:0]];
                }
                else
                {
                    [self.sprite121 setDisplayFrame:[[spriteGWalkLeft frames] objectAtIndex:0]];
                }
                
                
                [self goText:7002];
                
                return;
            }
            NSString *sprite122Interact = [properties valueForKey:@"sprite122IsHere"];
            if (sprite122Interact && [sprite122Interact compare:@"true"] == NSOrderedSame)
            {
                self.sprite122.orientation = oppOrientation;
                
                if (self.sprite122.orientation == 1)
                {
                    [self.sprite122 setDisplayFrame:[[spriteYWalkDown frames] objectAtIndex:0]];
                }
                else if (self.sprite122.orientation == 2)
                {
                    [self.sprite122 setDisplayFrame:[[spriteYWalkUp frames] objectAtIndex:0]];
                }
                else if (self.sprite122.orientation == 3)
                {
                    [self.sprite122 setDisplayFrame:[[spriteYWalkRight frames] objectAtIndex:0]];
                }
                else
                {
                    [self.sprite122 setDisplayFrame:[[spriteYWalkLeft frames] objectAtIndex:0]];
                }
                
                
                [self goText:7103];
                
                return;
            }
            NSString *sprite123Interact = [properties valueForKey:@"sprite123IsHere"];
            if (sprite123Interact && [sprite123Interact compare:@"true"] == NSOrderedSame)
            {
                self.sprite123.orientation = oppOrientation;
                
                if (self.sprite123.orientation == 1)
                {
                    [self.sprite123 setDisplayFrame:[[spriteZAWalkDown frames] objectAtIndex:0]];
                }
                else if (self.sprite123.orientation == 2)
                {
                    [self.sprite123 setDisplayFrame:[[spriteZAWalkUp frames] objectAtIndex:0]];
                }
                else if (self.sprite123.orientation == 3)
                {
                    [self.sprite123 setDisplayFrame:[[spriteZAWalkRight frames] objectAtIndex:0]];
                }
                else
                {
                    [self.sprite123 setDisplayFrame:[[spriteZAWalkLeft frames] objectAtIndex:0]];
                }
                
                
                [self goText:7100];
                
                return;
            }
            NSString *sprite124Interact = [properties valueForKey:@"sprite124IsHere"];
            if (sprite124Interact && [sprite124Interact compare:@"true"] == NSOrderedSame)
            {
                self.sprite124.orientation = oppOrientation;
                
                if (self.sprite124.orientation == 1)
                {
                    [self.sprite124 setDisplayFrame:[[spriteTWalkDown frames] objectAtIndex:0]];
                }
                else if (self.sprite124.orientation == 2)
                {
                    [self.sprite124 setDisplayFrame:[[spriteTWalkUp frames] objectAtIndex:0]];
                }
                else if (self.sprite124.orientation == 3)
                {
                    [self.sprite124 setDisplayFrame:[[spriteTWalkRight frames] objectAtIndex:0]];
                }
                else
                {
                    [self.sprite124 setDisplayFrame:[[spriteTWalkLeft frames] objectAtIndex:0]];
                }
                
                
                [self goText:7101];
                
                return;
            }
            
            NSString *sprite125Interact = [properties valueForKey:@"sprite125IsHere"];
            if (sprite125Interact && [sprite125Interact compare:@"true"] == NSOrderedSame)
            {
                self.sprite125.orientation = oppOrientation;
                
                if (self.sprite125.orientation == 1)
                {
                    [self.sprite125 setDisplayFrame:[[spriteTWalkDown frames] objectAtIndex:0]];
                }
                else if (self.sprite125.orientation == 2)
                {
                    [self.sprite125 setDisplayFrame:[[spriteTWalkUp frames] objectAtIndex:0]];
                }
                else if (self.sprite125.orientation == 3)
                {
                    [self.sprite125 setDisplayFrame:[[spriteTWalkRight frames] objectAtIndex:0]];
                }
                else
                {
                    [self.sprite125 setDisplayFrame:[[spriteTWalkLeft frames] objectAtIndex:0]];
                }
                
                
                [self goText:7102];
                
                return;
            }
            NSString *sprite126Interact = [properties valueForKey:@"sprite126IsHere"];
            if (sprite126Interact && [sprite126Interact compare:@"true"] == NSOrderedSame)
            {
                self.sprite126.orientation = oppOrientation;
                
                if (self.sprite126.orientation == 1)
                {
                    [self.sprite126 setDisplayFrame:[[spriteUWalkDown frames] objectAtIndex:0]];
                }
                else if (self.sprite126.orientation == 2)
                {
                    [self.sprite126 setDisplayFrame:[[spriteUWalkUp frames] objectAtIndex:0]];
                }
                else if (self.sprite126.orientation == 3)
                {
                    [self.sprite126 setDisplayFrame:[[spriteUWalkRight frames] objectAtIndex:0]];
                }
                else
                {
                    [self.sprite126 setDisplayFrame:[[spriteUWalkLeft frames] objectAtIndex:0]];
                }
                
                
                [self goText:7105];
                
                return;
            }
            NSString *sprite127Interact = [properties valueForKey:@"sprite127IsHere"];
            if (sprite127Interact && [sprite127Interact compare:@"true"] == NSOrderedSame)
            {
                self.sprite127.orientation = oppOrientation;
                
                if (self.sprite127.orientation == 1)
                {
                    [self.sprite127 setDisplayFrame:[[spriteCWalkDown frames] objectAtIndex:0]];
                }
                else if (self.sprite127.orientation == 2)
                {
                    [self.sprite127 setDisplayFrame:[[spriteCWalkUp frames] objectAtIndex:0]];
                }
                else if (self.sprite127.orientation == 3)
                {
                    [self.sprite127 setDisplayFrame:[[spriteCWalkRight frames] objectAtIndex:0]];
                }
                else
                {
                    [self.sprite127 setDisplayFrame:[[spriteCWalkLeft frames] objectAtIndex:0]];
                }
                
                
                [self goText:7004];
                
                return;
            }
            NSString *sprite128Interact = [properties valueForKey:@"sprite128IsHere"];
            if (sprite128Interact && [sprite128Interact compare:@"true"] == NSOrderedSame)
            {
                self.sprite128.orientation = oppOrientation;
                
                if (self.sprite128.orientation == 1)
                {
                    [self.sprite128 setDisplayFrame:[[spriteIWalkDown frames] objectAtIndex:0]];
                }
                else if (self.sprite128.orientation == 2)
                {
                    [self.sprite128 setDisplayFrame:[[spriteIWalkUp frames] objectAtIndex:0]];
                }
                else if (self.sprite128.orientation == 3)
                {
                    [self.sprite128 setDisplayFrame:[[spriteIWalkRight frames] objectAtIndex:0]];
                }
                else
                {
                    [self.sprite128 setDisplayFrame:[[spriteIWalkLeft frames] objectAtIndex:0]];
                }
                
                
                [self goText:7005];
                
                return;
            }
            NSString *sprite129Interact = [properties valueForKey:@"sprite129IsHere"];
            if (sprite129Interact && [sprite129Interact compare:@"true"] == NSOrderedSame)
            {
                self.sprite129.orientation = oppOrientation;
                
                if (self.sprite129.orientation == 1)
                {
                    [self.sprite129 setDisplayFrame:[[spriteSWalkDown frames] objectAtIndex:0]];
                }
                else if (self.sprite129.orientation == 2)
                {
                    [self.sprite129 setDisplayFrame:[[spriteSWalkUp frames] objectAtIndex:0]];
                }
                else if (self.sprite129.orientation == 3)
                {
                    [self.sprite129 setDisplayFrame:[[spriteSWalkRight frames] objectAtIndex:0]];
                }
                else
                {
                    [self.sprite129 setDisplayFrame:[[spriteSWalkLeft frames] objectAtIndex:0]];
                }
                
                
                [self goText:7006];
                
                return;
            }
            
            
            NSString *mapItem29 = [properties valueForKey:@"item29"];
            if (mapItem29 && [mapItem29 compare:@"true"] == NSOrderedSame)
            {
                if (!self.hero.gotItem29)
                {
                    [self goText:7329];
                    return;
                }
                else
                {
                    [self goText:4399];
                    return;
                }
            }
            NSString *mapItem30 = [properties valueForKey:@"item30"];
            if (mapItem30 && [mapItem30 compare:@"true"] == NSOrderedSame)
            {
                if (!self.hero.gotItem30)
                {
                    [self goText:7330];
                    return;
                }
                else
                {
                    [self goText:4399];
                    return;
                }
            }
            NSString *mapItem31 = [properties valueForKey:@"item31"];
            if (mapItem31 && [mapItem31 compare:@"true"] == NSOrderedSame)
            {
                if (!self.hero.gotItem31)
                {
                    [self goText:7331];
                    return;
                }
                else
                {
                    [self goText:4399];
                    return;
                }
            }
            
            
            NSString *sign31 = [properties valueForKey:@"sign31"];
            if (sign31 && [sign31 compare:@"true"] == NSOrderedSame)
            {
                [self goText:7200];
                return;
            }
            NSString *sign32 = [properties valueForKey:@"sign32"];
            if (sign32 && [sign32 compare:@"true"] == NSOrderedSame)
            {
                [self goText:7201];
                return;
            }
            NSString *sign33 = [properties valueForKey:@"sign33"];
            if (sign33 && [sign33 compare:@"true"] == NSOrderedSame)
            {
                [self goText:7202];
                return;
            }
            NSString *sign34 = [properties valueForKey:@"sign34"];
            if (sign34 && [sign34 compare:@"true"] == NSOrderedSame)
            {
                [self goText:7203];
                return;
            }
            
            
        }
    }
}



@end










