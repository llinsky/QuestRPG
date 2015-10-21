//
//  PlayLayerSix.m
//  Quest
//
//  Created by Leo Linsky on 1/19/14.
//
//

#import "PlayLayerSix.h"
#import "SceneManager.h"
#import "HKTMXTiledMap.h"
#import "ItemShopMenu.h"
#import "CCSendMessages.h"

@implementation PlayLayerSix

@synthesize sprite111,sprite112,sprite113,sprite114,sprite115,sprite116,sprite117,sprite118,sprite119,item25,item26,item27;

-(id)init
{
    if (self = [super init])
    {
        
        self.theHKMap = [HKTMXTiledMap tiledMapWithTMXFile:@"playlayer6_FINAL1.tmx"];
        [[CCDirector sharedDirector] setProjection:kCCDirectorProjection2D];
        
        
        self.bgLayer = [theHKMap layerNamed:@"bg1"];
        self.bgLayer.visible = NO;
        
        CCTMXObjectGroup *objects = [theHKMap objectGroupNamed:@"oj1"];
        
        [self addChild:theHKMap z:-1];
        
        self.hero = [GameSceneManager sharedGameSceneManager].hero;
        
        {
            [[CCSpriteFrameCache sharedSpriteFrameCache] addSpriteFramesWithFile:@"herospriteHsheet.plist"];
            spriteHSheet = [CCSpriteBatchNode batchNodeWithFile:@"herospriteHsheet.png"];
            [spriteHSheet retain];
            [self addChild:spriteHSheet];
            
            NSMutableArray *spriteHWalkAnimFramesLeft = [NSMutableArray array];
            NSMutableArray *spriteHWalkAnimFramesRight = [NSMutableArray array];
            NSMutableArray *spriteHAnimFramesUp = [NSMutableArray array];
            NSMutableArray *spriteHAnimFramesDown = [NSMutableArray array];
            NSMutableArray *spriteHAnimFramesUp2 = [NSMutableArray array];
            NSMutableArray *spriteHAnimFramesDown2 = [NSMutableArray array];
            
            [spriteHWalkAnimFramesLeft addObject:[[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:@"herospriteH05.png"]];
            [spriteHWalkAnimFramesLeft addObject:[[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:@"herospriteH06.png"]];
            [spriteHWalkAnimFramesLeft addObject:[[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:@"herospriteH06.png"]];
            [spriteHWalkAnimFramesLeft addObject:[[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:@"herospriteH06.png"]];
            [spriteHWalkAnimFramesLeft addObject:[[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:@"herospriteH05.png"]];
            spriteHWalkLeft = [CCAnimation animationWithFrames:spriteHWalkAnimFramesLeft delay:0.06f];
            [spriteHWalkLeft retain];
            
            [spriteHWalkAnimFramesRight addObject:[[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:@"herospriteH04.png"]];
            [spriteHWalkAnimFramesRight addObject:[[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:@"herospriteH07.png"]];
            [spriteHWalkAnimFramesRight addObject:[[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:@"herospriteH07.png"]];
            [spriteHWalkAnimFramesRight addObject:[[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:@"herospriteH07.png"]];
            [spriteHWalkAnimFramesRight addObject:[[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:@"herospriteH04.png"]];
            spriteHWalkRight = [CCAnimation animationWithFrames:spriteHWalkAnimFramesRight delay:0.06f];
            [spriteHWalkRight retain];
            
            [spriteHAnimFramesUp addObject:[[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:@"herospriteH08.png"]];
            [spriteHAnimFramesUp addObject:[[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:@"herospriteH09.png"]];
            [spriteHAnimFramesUp addObject:[[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:@"herospriteH09.png"]];
            [spriteHAnimFramesUp addObject:[[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:@"herospriteH09.png"]];
            [spriteHAnimFramesUp addObject:[[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:@"herospriteH08.png"]];
            spriteHWalkUp = [CCAnimation animationWithFrames:spriteHAnimFramesUp delay:0.06f];
            [spriteHWalkUp retain];
            
            [spriteHAnimFramesUp2 addObject:[[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:@"herospriteH08.png"]];
            [spriteHAnimFramesUp2 addObject:[[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:@"herospriteH10.png"]];
            [spriteHAnimFramesUp2 addObject:[[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:@"herospriteH10.png"]];
            [spriteHAnimFramesUp2 addObject:[[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:@"herospriteH10.png"]];
            [spriteHAnimFramesUp2 addObject:[[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:@"herospriteH08.png"]];
            spriteHWalkUp2 = [CCAnimation animationWithFrames:spriteHAnimFramesUp2 delay:0.06f];
            [spriteHWalkUp2 retain];
            
            [spriteHAnimFramesDown addObject:[[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:@"herospriteH01.png"]];
            [spriteHAnimFramesDown addObject:[[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:@"herospriteH02.png"]];
            [spriteHAnimFramesDown addObject:[[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:@"herospriteH02.png"]];
            [spriteHAnimFramesDown addObject:[[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:@"herospriteH02.png"]];
            [spriteHAnimFramesDown addObject:[[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:@"herospriteH01.png"]];
            spriteHWalkDown = [CCAnimation animationWithFrames:spriteHAnimFramesDown delay:0.06f];
            [spriteHWalkDown retain];
            
            [spriteHAnimFramesDown2 addObject:[[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:@"herospriteH01.png"]];
            [spriteHAnimFramesDown2 addObject:[[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:@"herospriteH03.png"]];
            [spriteHAnimFramesDown2 addObject:[[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:@"herospriteH03.png"]];
            [spriteHAnimFramesDown2 addObject:[[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:@"herospriteH03.png"]];
            [spriteHAnimFramesDown2 addObject:[[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:@"herospriteH01.png"]];
            spriteHWalkDown2 = [CCAnimation animationWithFrames:spriteHAnimFramesDown2 delay:0.06f];
            [spriteHWalkDown2 retain];
            
            [[CCSpriteFrameCache sharedSpriteFrameCache] addSpriteFramesWithFile:@"herospriteBsheet.plist"];
            spriteBSheet = [CCSpriteBatchNode batchNodeWithFile:@"herospriteBsheet.png"];
            [spriteBSheet retain];
            [self addChild:spriteBSheet];
            
            NSMutableArray *spriteBWalkAnimFramesLeft = [NSMutableArray array];
            NSMutableArray *spriteBWalkAnimFramesRight = [NSMutableArray array];
            NSMutableArray *spriteBAnimFramesUp = [NSMutableArray array];
            NSMutableArray *spriteBAnimFramesDown = [NSMutableArray array];
            NSMutableArray *spriteBAnimFramesUp2 = [NSMutableArray array];
            NSMutableArray *spriteBAnimFramesDown2 = [NSMutableArray array];
            
            [spriteBWalkAnimFramesLeft addObject:[[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:@"herospriteB05.png"]];
            [spriteBWalkAnimFramesLeft addObject:[[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:@"herospriteB06.png"]];
            [spriteBWalkAnimFramesLeft addObject:[[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:@"herospriteB06.png"]];
            [spriteBWalkAnimFramesLeft addObject:[[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:@"herospriteB06.png"]];
            [spriteBWalkAnimFramesLeft addObject:[[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:@"herospriteB05.png"]];
            spriteBWalkLeft = [CCAnimation animationWithFrames:spriteBWalkAnimFramesLeft delay:0.06f];
            [spriteBWalkLeft retain];
            
            [spriteBWalkAnimFramesRight addObject:[[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:@"herospriteB04.png"]];
            [spriteBWalkAnimFramesRight addObject:[[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:@"herospriteB07.png"]];
            [spriteBWalkAnimFramesRight addObject:[[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:@"herospriteB07.png"]];
            [spriteBWalkAnimFramesRight addObject:[[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:@"herospriteB07.png"]];
            [spriteBWalkAnimFramesRight addObject:[[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:@"herospriteB04.png"]];
            spriteBWalkRight = [CCAnimation animationWithFrames:spriteBWalkAnimFramesRight delay:0.06f];
            [spriteBWalkRight retain];
            
            [spriteBAnimFramesUp addObject:[[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:@"herospriteB08.png"]];
            [spriteBAnimFramesUp addObject:[[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:@"herospriteB09.png"]];
            [spriteBAnimFramesUp addObject:[[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:@"herospriteB09.png"]];
            [spriteBAnimFramesUp addObject:[[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:@"herospriteB09.png"]];
            [spriteBAnimFramesUp addObject:[[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:@"herospriteB08.png"]];
            spriteBWalkUp = [CCAnimation animationWithFrames:spriteBAnimFramesUp delay:0.06f];
            [spriteBWalkUp retain];
            
            [spriteBAnimFramesUp2 addObject:[[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:@"herospriteB08.png"]];
            [spriteBAnimFramesUp2 addObject:[[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:@"herospriteB10.png"]];
            [spriteBAnimFramesUp2 addObject:[[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:@"herospriteB10.png"]];
            [spriteBAnimFramesUp2 addObject:[[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:@"herospriteB10.png"]];
            [spriteBAnimFramesUp2 addObject:[[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:@"herospriteB08.png"]];
            spriteBWalkUp2 = [CCAnimation animationWithFrames:spriteBAnimFramesUp2 delay:0.06f];
            [spriteBWalkUp2 retain];
            
            [spriteBAnimFramesDown addObject:[[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:@"herospriteB01.png"]];
            [spriteBAnimFramesDown addObject:[[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:@"herospriteB02.png"]];
            [spriteBAnimFramesDown addObject:[[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:@"herospriteB02.png"]];
            [spriteBAnimFramesDown addObject:[[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:@"herospriteB02.png"]];
            [spriteBAnimFramesDown addObject:[[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:@"herospriteB01.png"]];
            spriteBWalkDown = [CCAnimation animationWithFrames:spriteBAnimFramesDown delay:0.06f];
            [spriteBWalkDown retain];
            
            [spriteBAnimFramesDown2 addObject:[[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:@"herospriteB01.png"]];
            [spriteBAnimFramesDown2 addObject:[[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:@"herospriteB03.png"]];
            [spriteBAnimFramesDown2 addObject:[[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:@"herospriteB03.png"]];
            [spriteBAnimFramesDown2 addObject:[[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:@"herospriteB03.png"]];
            [spriteBAnimFramesDown2 addObject:[[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:@"herospriteB01.png"]];
            spriteBWalkDown2 = [CCAnimation animationWithFrames:spriteBAnimFramesDown2 delay:0.06f];
            [spriteBWalkDown2 retain];
            
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
            
            
            [[CCSpriteFrameCache sharedSpriteFrameCache] addSpriteFramesWithFile:@"herospriteNsheet.plist"];
            spriteNSheet = [CCSpriteBatchNode batchNodeWithFile:@"herospriteNsheet.png"];
            [spriteNSheet retain];
            [self addChild:spriteNSheet];
            
            NSMutableArray *spriteNWalkAnimFramesLeft = [NSMutableArray array];
            NSMutableArray *spriteNWalkAnimFramesRight = [NSMutableArray array];
            NSMutableArray *spriteNAnimFramesUp = [NSMutableArray array];
            NSMutableArray *spriteNAnimFramesDown = [NSMutableArray array];
            NSMutableArray *spriteNAnimFramesUp2 = [NSMutableArray array];
            NSMutableArray *spriteNAnimFramesDown2 = [NSMutableArray array];
            
            [spriteNWalkAnimFramesLeft addObject:[[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:@"herospriteN05.png"]];
            [spriteNWalkAnimFramesLeft addObject:[[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:@"herospriteN06.png"]];
            [spriteNWalkAnimFramesLeft addObject:[[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:@"herospriteN06.png"]];
            [spriteNWalkAnimFramesLeft addObject:[[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:@"herospriteN06.png"]];
            [spriteNWalkAnimFramesLeft addObject:[[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:@"herospriteN05.png"]];
            spriteNWalkLeft = [CCAnimation animationWithFrames:spriteNWalkAnimFramesLeft delay:0.06f];
            [spriteNWalkLeft retain];
            
            [spriteNWalkAnimFramesRight addObject:[[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:@"herospriteN04.png"]];
            [spriteNWalkAnimFramesRight addObject:[[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:@"herospriteN07.png"]];
            [spriteNWalkAnimFramesRight addObject:[[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:@"herospriteN07.png"]];
            [spriteNWalkAnimFramesRight addObject:[[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:@"herospriteN07.png"]];
            [spriteNWalkAnimFramesRight addObject:[[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:@"herospriteN04.png"]];
            spriteNWalkRight = [CCAnimation animationWithFrames:spriteNWalkAnimFramesRight delay:0.06f];
            [spriteNWalkRight retain];
            
            [spriteNAnimFramesUp addObject:[[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:@"herospriteN08.png"]];
            [spriteNAnimFramesUp addObject:[[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:@"herospriteN09.png"]];
            [spriteNAnimFramesUp addObject:[[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:@"herospriteN09.png"]];
            [spriteNAnimFramesUp addObject:[[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:@"herospriteN09.png"]];
            [spriteNAnimFramesUp addObject:[[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:@"herospriteN08.png"]];
            spriteNWalkUp = [CCAnimation animationWithFrames:spriteNAnimFramesUp delay:0.06f];
            [spriteNWalkUp retain];
            
            [spriteNAnimFramesUp2 addObject:[[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:@"herospriteN08.png"]];
            [spriteNAnimFramesUp2 addObject:[[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:@"herospriteN10.png"]];
            [spriteNAnimFramesUp2 addObject:[[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:@"herospriteN10.png"]];
            [spriteNAnimFramesUp2 addObject:[[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:@"herospriteN10.png"]];
            [spriteNAnimFramesUp2 addObject:[[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:@"herospriteN08.png"]];
            spriteNWalkUp2 = [CCAnimation animationWithFrames:spriteNAnimFramesUp2 delay:0.06f];
            [spriteNWalkUp2 retain];
            
            [spriteNAnimFramesDown addObject:[[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:@"herospriteN01.png"]];
            [spriteNAnimFramesDown addObject:[[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:@"herospriteN02.png"]];
            [spriteNAnimFramesDown addObject:[[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:@"herospriteN02.png"]];
            [spriteNAnimFramesDown addObject:[[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:@"herospriteN02.png"]];
            [spriteNAnimFramesDown addObject:[[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:@"herospriteN01.png"]];
            spriteNWalkDown = [CCAnimation animationWithFrames:spriteNAnimFramesDown delay:0.06f];
            [spriteNWalkDown retain];
            
            [spriteNAnimFramesDown2 addObject:[[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:@"herospriteN01.png"]];
            [spriteNAnimFramesDown2 addObject:[[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:@"herospriteN03.png"]];
            [spriteNAnimFramesDown2 addObject:[[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:@"herospriteN03.png"]];
            [spriteNAnimFramesDown2 addObject:[[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:@"herospriteN03.png"]];
            [spriteNAnimFramesDown2 addObject:[[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:@"herospriteN01.png"]];
            spriteNWalkDown2 = [CCAnimation animationWithFrames:spriteNAnimFramesDown2 delay:0.06f];
            [spriteNWalkDown2 retain];
            
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
        }
        
        /////////////////////////////////////////////////////////
        
        if (!self.hero.beatIonak)
        {
            self.sprite111 = [InteractiveSprite spriteWithSpriteFrameName:@"herospriteH04.png"];
            self.sprite111.spriteCode = 111;
            
            self.sprite111.orientation = 1;
            if (self.hero.sprite111_Orientation)
            {
                self.sprite111.orientation = self.hero.sprite111_Orientation;
            }
            if (self.sprite111.orientation == 1)
            {
                [self.sprite111 setDisplayFrame:[[spriteHWalkDown frames] objectAtIndex:0]];
            }
            else if (self.sprite111.orientation == 2)
            {
                [self.sprite111 setDisplayFrame:[[spriteHWalkUp frames] objectAtIndex:0]];
            }
            else if (self.sprite111.orientation == 3)
            {
                [self.sprite111 setDisplayFrame:[[spriteHWalkRight frames] objectAtIndex:0]];
            }
            else
            {
                [self.sprite111 setDisplayFrame:[[spriteHWalkLeft frames] objectAtIndex:0]];
            }
            
            //[self schedule:@selector(updateSprite111) interval:(2.0f)];
            
            
            if (self.hero.sprite111position.x != 0)
            {
                self.sprite111.position = self.hero.sprite111position;
            }
            else
            {
                NSMutableDictionary *sprite111start = [objects objectNamed:@"spriteStart111"];
                double x1 = [[sprite111start valueForKey:@"x"]floatValue];
                double y1 = [[sprite111start valueForKey:@"y"]floatValue];
                self.sprite111.position = ccp(x1,y1);
            }
            
            [self.theHKMap addChild:self.sprite111 z:self.bgLayer.zOrder];
            
            CGPoint tileCoord1 = [self tileCoordForPosition:self.sprite111.position];
            int tileGID1 = [self.bgLayer tileGIDAt:tileCoord1];
            [self.bgLayer removeTileAt:tileCoord1];
            [self.bgLayer setTileGID:(tileGID1 + 1) at:tileCoord1];
        }
        /////////////////////////////////////////////////////////
        
        self.sprite112 = [InteractiveSprite spriteWithSpriteFrameName:@"herospriteB04.png"];
        self.sprite112.spriteCode = 112;
        
        self.sprite112.orientation = 1;
        if (self.hero.sprite112_Orientation)
        {
            self.sprite112.orientation = self.hero.sprite112_Orientation;
        }
        if (self.sprite112.orientation == 1)
        {
            [self.sprite112 setDisplayFrame:[[spriteBWalkDown frames] objectAtIndex:0]];
        }
        else if (self.sprite112.orientation == 2)
        {
            [self.sprite112 setDisplayFrame:[[spriteBWalkUp frames] objectAtIndex:0]];
        }
        else if (self.sprite112.orientation == 3)
        {
            [self.sprite112 setDisplayFrame:[[spriteBWalkRight frames] objectAtIndex:0]];
        }
        else
        {
            [self.sprite112 setDisplayFrame:[[spriteBWalkLeft frames] objectAtIndex:0]];
        }
        
        //[self schedule:@selector(updateSprite112) interval:(1.5f)];
        
        
        if (self.hero.sprite112position.x != 0)
        {
            self.sprite112.position = self.hero.sprite112position;
        }
        else
        {
            NSMutableDictionary *sprite112start = [objects objectNamed:@"spriteStart112"];
            double x1 = [[sprite112start valueForKey:@"x"]floatValue];
            double y1 = [[sprite112start valueForKey:@"y"]floatValue];
            self.sprite112.position = ccp(x1,y1);
        }
        
        
        [self.theHKMap addChild:self.sprite112 z:self.bgLayer.zOrder];
        
        CGPoint tileCoord2 = [self tileCoordForPosition:self.sprite112.position];
        int tileGID2 = [self.bgLayer tileGIDAt:tileCoord2];
        [self.bgLayer removeTileAt:tileCoord2];
        [self.bgLayer setTileGID:(tileGID2 + 2) at:tileCoord2];
        
        /////////////////////////////////////////////////////////
        
        self.sprite113 = [InteractiveSprite spriteWithSpriteFrameName:@"herospriteS04.png"];
        self.sprite113.spriteCode = 113;
        
        self.sprite113.orientation = 1;
        if (self.hero.sprite113_Orientation)
        {
            self.sprite113.orientation = self.hero.sprite113_Orientation;
        }
        if (self.sprite113.orientation == 1)
        {
            [self.sprite113 setDisplayFrame:[[spriteSWalkDown frames] objectAtIndex:0]];
        }
        else if (self.sprite113.orientation == 2)
        {
            [self.sprite113 setDisplayFrame:[[spriteSWalkUp frames] objectAtIndex:0]];
        }
        else if (self.sprite113.orientation == 3)
        {
            [self.sprite113 setDisplayFrame:[[spriteSWalkRight frames] objectAtIndex:0]];
        }
        else
        {
            [self.sprite113 setDisplayFrame:[[spriteSWalkLeft frames] objectAtIndex:0]];
        }
        
        //[self schedule:@selector(updateSprite113) interval:(1.25f)];
        
        
        if (self.hero.sprite113position.x != 0)
        {
            self.sprite113.position = self.hero.sprite113position;
        }
        else
        {
            NSMutableDictionary *sprite113start = [objects objectNamed:@"spriteStart113"];
            double x1 = [[sprite113start valueForKey:@"x"]floatValue];
            double y1 = [[sprite113start valueForKey:@"y"]floatValue];
            self.sprite113.position = ccp(x1,y1);
        }
        
        
        [self.theHKMap addChild:self.sprite113 z:self.bgLayer.zOrder];
        
        CGPoint tileCoord3 = [self tileCoordForPosition:self.sprite113.position];
        int tileGID3 = [self.bgLayer tileGIDAt:tileCoord3];
        [self.bgLayer removeTileAt:tileCoord3];
        [self.bgLayer setTileGID:(tileGID3 + 3) at:tileCoord3];
        
        /////////////////////////////////////////////////////////
        
        self.sprite114 = [InteractiveSprite spriteWithSpriteFrameName:@"herospriteU04.png"];
        self.sprite114.spriteCode = 114;
        
        self.sprite114.orientation = 1;
        if (self.hero.sprite114_Orientation)
        {
            self.sprite114.orientation = self.hero.sprite114_Orientation;
        }
        if (self.sprite114.orientation == 1)
        {
            [self.sprite114 setDisplayFrame:[[spriteUWalkDown frames] objectAtIndex:0]];
        }
        else if (self.sprite114.orientation == 2)
        {
            [self.sprite114 setDisplayFrame:[[spriteUWalkUp frames] objectAtIndex:0]];
        }
        else if (self.sprite114.orientation == 3)
        {
            [self.sprite114 setDisplayFrame:[[spriteUWalkRight frames] objectAtIndex:0]];
        }
        else
        {
            [self.sprite114 setDisplayFrame:[[spriteUWalkLeft frames] objectAtIndex:0]];
        }
        
        //[self schedule:@selector(updateSprite114) interval:(1.625f)];
        
        
        if (self.hero.sprite114position.x != 0)
        {
            self.sprite114.position = self.hero.sprite114position;
        }
        else
        {
            NSMutableDictionary *sprite114start = [objects objectNamed:@"spriteStart114"];
            double x1 = [[sprite114start valueForKey:@"x"]floatValue];
            double y1 = [[sprite114start valueForKey:@"y"]floatValue];
            self.sprite114.position = ccp(x1,y1);
        }
        
        
        [self.theHKMap addChild:self.sprite114 z:self.bgLayer.zOrder];
        
        CGPoint tileCoord4 = [self tileCoordForPosition:self.sprite114.position];
        int tileGID4 = [self.bgLayer tileGIDAt:tileCoord4];
        [self.bgLayer removeTileAt:tileCoord4];
        [self.bgLayer setTileGID:(tileGID4 + 4) at:tileCoord4];
        
        /////////////////////////////////////////////////////////
        
        self.sprite115 = [InteractiveSprite spriteWithSpriteFrameName:@"herospriteY04.png"];
        self.sprite115.spriteCode = 115;
        
        self.sprite115.orientation = 1;
        if (self.hero.sprite115_Orientation)
        {
            self.sprite115.orientation = self.hero.sprite115_Orientation;
        }
        if (self.sprite115.orientation == 1)
        {
            [self.sprite115 setDisplayFrame:[[spriteYWalkDown frames] objectAtIndex:0]];
        }
        else if (self.sprite115.orientation == 2)
        {
            [self.sprite115 setDisplayFrame:[[spriteYWalkUp frames] objectAtIndex:0]];
        }
        else if (self.sprite115.orientation == 3)
        {
            [self.sprite115 setDisplayFrame:[[spriteYWalkRight frames] objectAtIndex:0]];
        }
        else
        {
            [self.sprite115 setDisplayFrame:[[spriteYWalkLeft frames] objectAtIndex:0]];
        }
        
        //[self schedule:@selector(updateSprite115) interval:(1.375f)];
        
        
        if (self.hero.sprite115position.x != 0)
        {
            self.sprite115.position = self.hero.sprite115position;
        }
        else
        {
            NSMutableDictionary *sprite115start = [objects objectNamed:@"spriteStart115"];
            double x1 = [[sprite115start valueForKey:@"x"]floatValue];
            double y1 = [[sprite115start valueForKey:@"y"]floatValue];
            self.sprite115.position = ccp(x1,y1);
        }
        
        
        [self.theHKMap addChild:self.sprite115 z:self.bgLayer.zOrder];
        
        CGPoint tileCoord5 = [self tileCoordForPosition:self.sprite115.position];
        int tileGID5 = [self.bgLayer tileGIDAt:tileCoord5];
        [self.bgLayer removeTileAt:tileCoord5];
        [self.bgLayer setTileGID:(tileGID5 + 5) at:tileCoord5];
        
        
        /////////////////////////////////////////////////////////
        
        self.sprite116 = [InteractiveSprite spriteWithSpriteFrameName:@"herospriteT04.png"];
        self.sprite116.spriteCode = 116;
        
        self.sprite116.orientation = 1;
        if (self.hero.sprite116_Orientation)
        {
            self.sprite116.orientation = self.hero.sprite116_Orientation;
        }
        if (self.sprite116.orientation == 1)
        {
            [self.sprite116 setDisplayFrame:[[spriteTWalkDown frames] objectAtIndex:0]];
        }
        else if (self.sprite116.orientation == 2)
        {
            [self.sprite116 setDisplayFrame:[[spriteTWalkUp frames] objectAtIndex:0]];
        }
        else if (self.sprite116.orientation == 3)
        {
            [self.sprite116 setDisplayFrame:[[spriteTWalkRight frames] objectAtIndex:0]];
        }
        else
        {
            [self.sprite116 setDisplayFrame:[[spriteTWalkLeft frames] objectAtIndex:0]];
        }
        
        //[self schedule:@selector(updateSprite116) interval:(1.125f)];
        
        
        if (self.hero.sprite116position.x != 0)
        {
            self.sprite116.position = self.hero.sprite116position;
        }
        else
        {
            NSMutableDictionary *sprite116start = [objects objectNamed:@"spriteStart116"];
            double x1 = [[sprite116start valueForKey:@"x"]floatValue];
            double y1 = [[sprite116start valueForKey:@"y"]floatValue];
            self.sprite116.position = ccp(x1,y1);
        }
        
        
        [self.theHKMap addChild:self.sprite116 z:self.bgLayer.zOrder];
        
        CGPoint tileCoord6 = [self tileCoordForPosition:self.sprite116.position];
        int tileGID6 = [self.bgLayer tileGIDAt:tileCoord6];
        [self.bgLayer removeTileAt:tileCoord6];
        [self.bgLayer setTileGID:(tileGID6 + 6) at:tileCoord6];
        
        /////////////////////////////////////////////////////////
        
        if (self.hero.beatIonak)
        {
            self.sprite117 = [InteractiveSprite spriteWithSpriteFrameName:@"herospriteI04.png"];
            self.sprite117.spriteCode = 117;
            
            self.sprite117.orientation = 1;
            if (self.hero.sprite117_Orientation)
            {
                self.sprite117.orientation = self.hero.sprite117_Orientation;
            }
            if (self.sprite117.orientation == 1)
            {
                [self.sprite117 setDisplayFrame:[[spriteIWalkDown frames] objectAtIndex:0]];
            }
            else if (self.sprite117.orientation == 2)
            {
                [self.sprite117 setDisplayFrame:[[spriteIWalkUp frames] objectAtIndex:0]];
            }
            else if (self.sprite117.orientation == 3)
            {
                [self.sprite117 setDisplayFrame:[[spriteIWalkRight frames] objectAtIndex:0]];
            }
            else
            {
                [self.sprite117 setDisplayFrame:[[spriteIWalkLeft frames] objectAtIndex:0]];
            }
            
            //[self schedule:@selector(updateSprite117) interval:(1.5f)];
            
            
            if (self.hero.sprite117position.x != 0)
            {
                self.sprite117.position = self.hero.sprite117position;
            }
            else
            {
                NSMutableDictionary *sprite117start = [objects objectNamed:@"spriteStart117"];
                double x1 = [[sprite117start valueForKey:@"x"]floatValue];
                double y1 = [[sprite117start valueForKey:@"y"]floatValue];
                self.sprite117.position = ccp(x1,y1);
            }
            
            
            [self.theHKMap addChild:self.sprite117 z:self.bgLayer.zOrder];
            
            CGPoint tileCoord7 = [self tileCoordForPosition:self.sprite117.position];
            int tileGID7 = [self.bgLayer tileGIDAt:tileCoord7];
            [self.bgLayer removeTileAt:tileCoord7];
            [self.bgLayer setTileGID:(tileGID7 + 7) at:tileCoord7];
            
            /////////////////////////////////////////////////////////
            
            self.sprite118 = [InteractiveSprite spriteWithSpriteFrameName:@"herospriteN04.png"];
            self.sprite118.spriteCode = 118;
            
            self.sprite118.orientation = 1;
            if (self.hero.sprite118_Orientation)
            {
                self.sprite118.orientation = self.hero.sprite118_Orientation;
            }
            if (self.sprite118.orientation == 1)
            {
                [self.sprite118 setDisplayFrame:[[spriteNWalkDown frames] objectAtIndex:0]];
            }
            else if (self.sprite118.orientation == 2)
            {
                [self.sprite118 setDisplayFrame:[[spriteNWalkUp frames] objectAtIndex:0]];
            }
            else if (self.sprite118.orientation == 3)
            {
                [self.sprite118 setDisplayFrame:[[spriteNWalkRight frames] objectAtIndex:0]];
            }
            else
            {
                [self.sprite118 setDisplayFrame:[[spriteNWalkLeft frames] objectAtIndex:0]];
            }
            
            //[self schedule:@selector(updateSprite118) interval:(1.875f)];
            
            
            if (self.hero.sprite118position.x != 0)
            {
                self.sprite118.position = self.hero.sprite118position;
            }
            else
            {
                NSMutableDictionary *sprite118start = [objects objectNamed:@"spriteStart118"];
                double x1 = [[sprite118start valueForKey:@"x"]floatValue];
                double y1 = [[sprite118start valueForKey:@"y"]floatValue];
                self.sprite118.position = ccp(x1,y1);
            }
            
            
            [self.theHKMap addChild:self.sprite118 z:self.bgLayer.zOrder];
            
            CGPoint tileCoord8 = [self tileCoordForPosition:self.sprite118.position];
            int tileGID8 = [self.bgLayer tileGIDAt:tileCoord8];
            [self.bgLayer removeTileAt:tileCoord8];
            [self.bgLayer setTileGID:(tileGID8 + 8) at:tileCoord8];
            
            /////////////////////////////////////////////////////////
            
            self.sprite119 = [InteractiveSprite spriteWithSpriteFrameName:@"herospriteC04.png"];
            self.sprite119.spriteCode = 119;
            
            self.sprite119.orientation = 1;
            if (self.hero.sprite119_Orientation)
            {
                self.sprite119.orientation = self.hero.sprite119_Orientation;
            }
            if (self.sprite119.orientation == 1)
            {
                [self.sprite119 setDisplayFrame:[[spriteCWalkDown frames] objectAtIndex:0]];
            }
            else if (self.sprite119.orientation == 2)
            {
                [self.sprite119 setDisplayFrame:[[spriteCWalkUp frames] objectAtIndex:0]];
            }
            else if (self.sprite119.orientation == 3)
            {
                [self.sprite119 setDisplayFrame:[[spriteCWalkRight frames] objectAtIndex:0]];
            }
            else
            {
                [self.sprite119 setDisplayFrame:[[spriteCWalkLeft frames] objectAtIndex:0]];
            }
            
            //[self schedule:@selector(updateSprite119) interval:(1.25f)];
            
            
            if (self.hero.sprite119position.x != 0)
            {
                self.sprite119.position = self.hero.sprite119position;
            }
            else
            {
                NSMutableDictionary *sprite119start = [objects objectNamed:@"spriteStart119"];
                double x1 = [[sprite119start valueForKey:@"x"]floatValue];
                double y1 = [[sprite119start valueForKey:@"y"]floatValue];
                self.sprite119.position = ccp(x1,y1);
            }
            
            
            [self.theHKMap addChild:self.sprite119 z:self.bgLayer.zOrder];
            
            CGPoint tileCoord9 = [self tileCoordForPosition:self.sprite119.position];
            int tileGID9 = [self.bgLayer tileGIDAt:tileCoord9];
            [self.bgLayer removeTileAt:tileCoord9];
            [self.bgLayer setTileGID:(tileGID9 + 9) at:tileCoord9];
        }
        
        //
        //items
        //
        
        if (self.hero.beatIonak)
        {
            if (!self.hero.gotItem25)
            {
                self.item25 = [CCSprite spriteWithFile:@"treasurechestSprite01.png"];
                NSMutableDictionary *item = [objects objectNamed:@"item25"];
                double x1 = [[item valueForKey:@"x"]floatValue];
                double y1 = [[item valueForKey:@"y"]floatValue];
                self.item25.position = ccp(x1,y1);
                [self.theHKMap addChild:self.item25 z:self.bgLayer.zOrder];
            }
            else
            {
                self.item25 = [CCSprite spriteWithFile:@"treasurechestSprite02.png"];
                NSMutableDictionary *item = [objects objectNamed:@"item25"];
                double x1 = [[item valueForKey:@"x"]floatValue];
                double y1 = [[item valueForKey:@"y"]floatValue];
                self.item25.position = ccp(x1,y1);
                [self.theHKMap addChild:self.item25 z:self.bgLayer.zOrder];
            }
        }
        
        if (!self.hero.gotItem26)
        {
            self.item26 = [CCSprite spriteWithFile:@"treasurechestSprite01.png"];
            NSMutableDictionary *item = [objects objectNamed:@"item26"];
            double x1 = [[item valueForKey:@"x"]floatValue];
            double y1 = [[item valueForKey:@"y"]floatValue];
            self.item26.position = ccp(x1,y1);
            [self.theHKMap addChild:self.item26 z:self.bgLayer.zOrder];
        }
        else
        {
            self.item26 = [CCSprite spriteWithFile:@"treasurechestSprite02.png"];
            NSMutableDictionary *item = [objects objectNamed:@"item26"];
            double x1 = [[item valueForKey:@"x"]floatValue];
            double y1 = [[item valueForKey:@"y"]floatValue];
            self.item26.position = ccp(x1,y1);
            [self.theHKMap addChild:self.item26 z:self.bgLayer.zOrder];
        }
        
        if (!self.hero.gotItem27)
        {
            self.item27 = [CCSprite spriteWithFile:@"treasurechestSprite01.png"];
            NSMutableDictionary *item = [objects objectNamed:@"item27"];
            double x1 = [[item valueForKey:@"x"]floatValue];
            double y1 = [[item valueForKey:@"y"]floatValue];
            self.item27.position = ccp(x1,y1);
            [self.theHKMap addChild:self.item27 z:self.bgLayer.zOrder];
        }
        else
        {
            self.item27 = [CCSprite spriteWithFile:@"treasurechestSprite02.png"];
            NSMutableDictionary *item = [objects objectNamed:@"item27"];
            double x1 = [[item valueForKey:@"x"]floatValue];
            double y1 = [[item valueForKey:@"y"]floatValue];
            self.item27.position = ccp(x1,y1);
            [self.theHKMap addChild:self.item27 z:self.bgLayer.zOrder];
        }
        
        
        
        double x;
        double y;
        
        prev = self.hero.musicCode;
        
        int randWeather = arc4random()%10;
        bool willSnow = self.hero.isSnowingPL6;
        
        
        //1(coming from login),2(gate/cave/stairs/dungeon), 3(teleport), 4(herodied - pl1), 5(start new game), 6(beat ionak - go pl1),7(item shop/menu),8(battle win/flee),121-beatVankurian Orc
        if (self.hero.mapInitMode == 1)
        {
            prev = 0;
            self.spriteOrientation = 1;
            
            x = self.hero.position.x;
            y = self.hero.position.y;
            
            willSnow = (randWeather >= 5);
        }
        else if (self.hero.mapInitMode == 2)
        {
            prev = 0;
            if (self.hero.currentMap == 7)
            {
                NSMutableDictionary *startPoint = [objects objectNamed:@"startPoint3"];
                x = [[startPoint valueForKey:@"x"]floatValue];
                y = [[startPoint valueForKey:@"y"]floatValue];
                self.hero.musicCode = 3;
                willSnow = (randWeather >= 8);
            }
            else if (self.hero.currentMap == 5)
            {
                NSMutableDictionary *startPoint = [objects objectNamed:@"startPoint1"];
                x = [[startPoint valueForKey:@"x"]floatValue];
                y = [[startPoint valueForKey:@"y"]floatValue];
                self.hero.musicCode = 3;
                willSnow = (randWeather >= 5);
            }
            else if (self.hero.currentMap == 22)
            {
                NSMutableDictionary *startPoint = [objects objectNamed:@"startPoint4"];
                x = [[startPoint valueForKey:@"x"]floatValue];
                y = [[startPoint valueForKey:@"y"]floatValue];
                self.hero.musicCode = 2;
                willSnow = (randWeather >= 5);
            }
            else
            {
                NSLog(@"Error2");
                NSMutableDictionary *startPoint = [objects objectNamed:@"startPoint1"];
                x = [[startPoint valueForKey:@"x"]floatValue];
                y = [[startPoint valueForKey:@"y"]floatValue];
                self.hero.musicCode = 3;
                willSnow = (randWeather >= 5);
            }
            
            
            self.spriteOrientation = self.hero.heroOrientation;
            
        }
        else if (self.hero.mapInitMode == 3)
        {
            prev = 0;
            NSMutableDictionary *startPoint = [objects objectNamed:@"startPoint2"];
            x = [[startPoint valueForKey:@"x"]floatValue];
            y = [[startPoint valueForKey:@"y"]floatValue];
            self.hero.musicCode = 1;
            
            self.spriteOrientation = self.hero.heroOrientation;
            
            willSnow = (randWeather >= 5);
        }
        else if (self.hero.mapInitMode == 4)
        {
            NSLog(@"Error4");
        }
        else if (self.hero.mapInitMode == 5)
        {
            /*
             // DELETE THIS STUFF LATER
             //////////////
            NSMutableDictionary *startPoint = [objects objectNamed:@"startPoint4"];
            x = [[startPoint valueForKey:@"x"]floatValue];
            y = [[startPoint valueForKey:@"y"]floatValue];
            self.hero.musicCode = 2;
            
             /////////////
            */
            
            
            NSLog(@"Error5");
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
        
        if (prev != self.hero.musicCode)
        {
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
        self.hero.currentMap = 6;
        
        spriteCycleCount = 0;
        [self schedule:@selector(spriteCycle) interval:0.125];
        
        self.hero.isSnowingPL6 = willSnow;
        if (willSnow)
        {
            [self performSelector:@selector(startSnow) withObject:nil afterDelay:0.125];
        }
    }
    return self;
}

-(void)startSnow
{
    [self.myHUD startSnow];
}


-(void)pickedUpItem:(int)itemCode
{
    [MusicHandler playButtonClick];
    if (itemCode == 25)
    {
        CGPoint pos = self.item25.position;
        self.hero.gotItem25 = YES;
        [self.theHKMap removeChild:self.item25 cleanup:YES];
        self.item25 = [CCSprite spriteWithFile:@"treasurechestSprite02.png"];
        self.item25.position = pos;
        [self.theHKMap addChild:self.item25 z:self.bgLayer.zOrder];
        
        [self givenItem:72];
    }
    else if (itemCode == 26)
    {
        CGPoint pos = self.item26.position;
        self.hero.gotItem26 = YES;
        [self.theHKMap removeChild:self.item26 cleanup:YES];
        self.item26 = [CCSprite spriteWithFile:@"treasurechestSprite02.png"];
        self.item26.position = pos;
        [self.theHKMap addChild:self.item26 z:self.bgLayer.zOrder];
        
        [self givenItem:118];
        
    }
    else if (itemCode == 27)
    {
        CGPoint pos = self.item27.position;
        self.hero.gotItem27 = YES;
        [self.theHKMap removeChild:self.item27 cleanup:YES];
        self.item27 = [CCSprite spriteWithFile:@"treasurechestSprite02.png"];
        self.item27.position = pos;
        [self.theHKMap addChild:self.item27 z:self.bgLayer.zOrder];
        
        [self givenItem:136];
    }
    else{
        NSLog(@"ErrorPICKEDUPITEM");
    }
    return;
}

-(void) givenItem:(int)itemCode 
{
    if (itemCode == 999)
    {
        self.hero.gold += 100;
        self.hero.talkedToArnuk = YES;
        [self saveHero];
        return;
    }
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
    
    if (gate == 5)
    {
        [SceneManager goPlay:5];
    }
    else if (gate == 6)
    {
        [SceneManager goPlay:7];
    }
    else if (gate == 22)
    {
        [SceneManager goPlay:22];
    }
    else{
        NSLog(@"gate error");
    }
    return;
}


-(void) updateSprite111
{
    CGSize screenSize = [[CCDirector sharedDirector] winSize];
    int x = self.hero.position.x;
    int y = self.hero.position.y;
    
    int p = self.sprite111.position.x;
    int q = self.sprite111.position.y;
    
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
    
    int rand = arc4random()%16;
    if (rand == 1)
    {
        [self moveleftSprite111];
    }
    if (rand == 2)
    {
        [self moverightSprite111];
    }
    if (rand == 3)
    {
        [self moveupSprite111];
    }
    if (rand == 4)
    {
        [self movedownSprite111];
    }
    return;
}

-(void) moveleftSprite111
{
    CGPoint sprite111Pos = self.sprite111.position;
    self.sprite111.orientation = 4;
    sprite111Pos.x -= theHKMap.tileSize.width;
    
    CGPoint tileCoord = [self tileCoordForPosition:sprite111Pos];
    int tileGID = [self.bgLayer tileGIDAt:tileCoord];
    if (tileGID)
    {
        NSDictionary *properties = [theHKMap propertiesForGID:tileGID];
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
                    CGPoint tileCoord1 = [self tileCoordForPosition:self.sprite111.position];
                    int tileGID1 = [self.bgLayer tileGIDAt:tileCoord1];
                    [self.bgLayer removeTileAt:tileCoord1];
                    [self.bgLayer setTileGID:(tileGID1 - 1) at:tileCoord1];
                    
                    id actionMove = [CCMoveTo actionWithDuration:0.3 position:sprite111Pos];
                    id actionMove2 = [CCAnimate actionWithAnimation:spriteHWalkLeft restoreOriginalFrame:NO];
                    
                    id actionMoveDone = [CCCallFuncN actionWithTarget:self selector:@selector(finishActionSprite111)];
                    
                    [self.sprite111 runAction:[CCSpawn actionOne:[CCSequence actions:actionMove,actionMoveDone,nil] two:actionMove2]];
                    return;
                }
            }
        }
    }
    [self finishActionSprite111];
}
-(void) moverightSprite111
{
    CGPoint sprite111Pos = self.sprite111.position;
    self.sprite111.orientation = 3;
    sprite111Pos.x += theHKMap.tileSize.width;
    
    CGPoint tileCoord = [self tileCoordForPosition:sprite111Pos];
    int tileGID = [self.bgLayer tileGIDAt:tileCoord];
    if (tileGID)
    {
        NSDictionary *properties = [theHKMap propertiesForGID:tileGID];
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
                    CGPoint tileCoord1 = [self tileCoordForPosition:self.sprite111.position];
                    int tileGID1 = [self.bgLayer tileGIDAt:tileCoord1];
                    [self.bgLayer removeTileAt:tileCoord1];
                    [self.bgLayer setTileGID:(tileGID1 - 1) at:tileCoord1];
                    
                    id actionMove = [CCMoveTo actionWithDuration:0.3 position:sprite111Pos];
                    id actionMove2 = [CCAnimate actionWithAnimation:spriteHWalkRight restoreOriginalFrame:NO];
                    
                    id actionMoveDone = [CCCallFuncN actionWithTarget:self selector:@selector(finishActionSprite111)];
                    
                    [self.sprite111 runAction:[CCSpawn actionOne:[CCSequence actions:actionMove,actionMoveDone,nil] two:actionMove2]];
                    return;
                }
            }
        }
    }
    [self finishActionSprite111];
}
-(void) moveupSprite111
{
    CGPoint sprite111Pos = self.sprite111.position;
    self.sprite111.orientation = 2;
    sprite111Pos.y += theHKMap.tileSize.height;
    
    CGPoint tileCoord = [self tileCoordForPosition:sprite111Pos];
    int tileGID = [self.bgLayer tileGIDAt:tileCoord];
    if (tileGID)
    {
        NSDictionary *properties = [theHKMap propertiesForGID:tileGID];
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
                    CGPoint tileCoord1 = [self tileCoordForPosition:self.sprite111.position];
                    int tileGID1 = [self.bgLayer tileGIDAt:tileCoord1];
                    [self.bgLayer removeTileAt:tileCoord1];
                    [self.bgLayer setTileGID:(tileGID1 - 1) at:tileCoord1];
                    
                    id actionMove = [CCMoveTo actionWithDuration:0.3 position:sprite111Pos];
                    id actionMove2 = [CCAnimate actionWithAnimation:spriteHWalkUp restoreOriginalFrame:NO];
                    
                    id actionMoveDone = [CCCallFuncN actionWithTarget:self selector:@selector(finishActionSprite111)];
                    
                    [self.sprite111 runAction:[CCSpawn actionOne:[CCSequence actions:actionMove,actionMoveDone,nil] two:actionMove2]];
                    return;
                }
            }
        }
    }
    [self finishActionSprite111];
}
-(void) movedownSprite111
{
    CGPoint sprite111Pos = self.sprite111.position;
    self.sprite111.orientation = 1;
    sprite111Pos.y -= theHKMap.tileSize.width;
    
    CGPoint tileCoord = [self tileCoordForPosition:sprite111Pos];
    int tileGID = [self.bgLayer tileGIDAt:tileCoord];
    if (tileGID)
    {
        NSDictionary *properties = [theHKMap propertiesForGID:tileGID];
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
                    CGPoint tileCoord1 = [self tileCoordForPosition:self.sprite111.position];
                    int tileGID1 = [self.bgLayer tileGIDAt:tileCoord1];
                    [self.bgLayer removeTileAt:tileCoord1];
                    [self.bgLayer setTileGID:(tileGID1 - 1) at:tileCoord1];
                    
                    id actionMove = [CCMoveTo actionWithDuration:0.3 position:sprite111Pos];
                    id actionMove2 = [CCAnimate actionWithAnimation:spriteHWalkDown restoreOriginalFrame:NO];
                    
                    id actionMoveDone = [CCCallFuncN actionWithTarget:self selector:@selector(finishActionSprite111)];
                    
                    [self.sprite111 runAction:[CCSpawn actionOne:[CCSequence actions:actionMove,actionMoveDone,nil] two:actionMove2]];
                    return;
                }
            }
        }
    }
    [self finishActionSprite111];
}
-(void) finishActionSprite111
{
    if (self.sprite111.orientation == 1)
    {
        [self.sprite111 setDisplayFrame:[[spriteHWalkDown frames] objectAtIndex:0]];
    }
    else if (self.sprite111.orientation == 2)
    {
        [self.sprite111 setDisplayFrame:[[spriteHWalkUp frames] objectAtIndex:0]];
    }
    else if (self.sprite111.orientation == 3)
    {
        [self.sprite111 setDisplayFrame:[[spriteHWalkRight frames] objectAtIndex:0]];
    }
    else
    {
        [self.sprite111 setDisplayFrame:[[spriteHWalkLeft frames] objectAtIndex:0]];
    }
    self.hero.sprite111position = self.sprite111.position;
}
-(void) updateSprite112
{
    CGSize screenSize = [[CCDirector sharedDirector] winSize];
    int x = self.hero.position.x;
    int y = self.hero.position.y;
    
    int p = self.sprite112.position.x;
    int q = self.sprite112.position.y;
    
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
        [self moveleftSprite112];
    }
    if (rand == 2)
    {
        [self moverightSprite112];
    }
    if (rand == 3)
    {
        [self moveupSprite112];
    }
    if (rand == 4)
    {
        [self movedownSprite112];
    }
    return;
}

-(void) moveleftSprite112
{
    CGPoint sprite112Pos = self.sprite112.position;
    self.sprite112.orientation = 4;
    sprite112Pos.x -= theHKMap.tileSize.width;
    
    CGPoint tileCoord = [self tileCoordForPosition:sprite112Pos];
    int tileGID = [self.bgLayer tileGIDAt:tileCoord];
    if (tileGID)
    {
        NSDictionary *properties = [theHKMap propertiesForGID:tileGID];
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
                    CGPoint tileCoord1 = [self tileCoordForPosition:self.sprite112.position];
                    int tileGID1 = [self.bgLayer tileGIDAt:tileCoord1];
                    [self.bgLayer removeTileAt:tileCoord1];
                    [self.bgLayer setTileGID:(tileGID1 - 2) at:tileCoord1];
                    
                    id actionMove = [CCMoveTo actionWithDuration:0.3 position:sprite112Pos];
                    id actionMove2 = [CCAnimate actionWithAnimation:spriteBWalkLeft restoreOriginalFrame:NO];
                    
                    id actionMoveDone = [CCCallFuncN actionWithTarget:self selector:@selector(finishActionSprite112)];
                    
                    [self.sprite112 runAction:[CCSpawn actionOne:[CCSequence actions:actionMove,actionMoveDone,nil] two:actionMove2]];
                    return;
                }
            }
        }
    }
    [self finishActionSprite112];
}
-(void) moverightSprite112
{
    CGPoint sprite112Pos = self.sprite112.position;
    self.sprite112.orientation = 3;
    sprite112Pos.x += theHKMap.tileSize.width;
    
    CGPoint tileCoord = [self tileCoordForPosition:sprite112Pos];
    int tileGID = [self.bgLayer tileGIDAt:tileCoord];
    if (tileGID)
    {
        NSDictionary *properties = [theHKMap propertiesForGID:tileGID];
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
                    CGPoint tileCoord1 = [self tileCoordForPosition:self.sprite112.position];
                    int tileGID1 = [self.bgLayer tileGIDAt:tileCoord1];
                    [self.bgLayer removeTileAt:tileCoord1];
                    [self.bgLayer setTileGID:(tileGID1 - 2) at:tileCoord1];
                    
                    id actionMove = [CCMoveTo actionWithDuration:0.3 position:sprite112Pos];
                    id actionMove2 = [CCAnimate actionWithAnimation:spriteBWalkRight restoreOriginalFrame:NO];
                    
                    id actionMoveDone = [CCCallFuncN actionWithTarget:self selector:@selector(finishActionSprite112)];
                    
                    [self.sprite112 runAction:[CCSpawn actionOne:[CCSequence actions:actionMove,actionMoveDone,nil] two:actionMove2]];
                    return;
                }
            }
        }
    }
    [self finishActionSprite112];
}
-(void) moveupSprite112
{
    CGPoint sprite112Pos = self.sprite112.position;
    self.sprite112.orientation = 2;
    sprite112Pos.y += theHKMap.tileSize.height;
    
    CGPoint tileCoord = [self tileCoordForPosition:sprite112Pos];
    int tileGID = [self.bgLayer tileGIDAt:tileCoord];
    if (tileGID)
    {
        NSDictionary *properties = [theHKMap propertiesForGID:tileGID];
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
                    CGPoint tileCoord1 = [self tileCoordForPosition:self.sprite112.position];
                    int tileGID1 = [self.bgLayer tileGIDAt:tileCoord1];
                    [self.bgLayer removeTileAt:tileCoord1];
                    [self.bgLayer setTileGID:(tileGID1 - 2) at:tileCoord1];
                    
                    id actionMove = [CCMoveTo actionWithDuration:0.3 position:sprite112Pos];
                    id actionMove2 = [CCAnimate actionWithAnimation:spriteBWalkUp restoreOriginalFrame:NO];
                    
                    id actionMoveDone = [CCCallFuncN actionWithTarget:self selector:@selector(finishActionSprite112)];
                    
                    [self.sprite112 runAction:[CCSpawn actionOne:[CCSequence actions:actionMove,actionMoveDone,nil] two:actionMove2]];
                    return;
                }
            }
        }
    }
    [self finishActionSprite112];
}
-(void) movedownSprite112
{
    CGPoint sprite112Pos = self.sprite112.position;
    self.sprite112.orientation = 1;
    sprite112Pos.y -= theHKMap.tileSize.width;
    
    CGPoint tileCoord = [self tileCoordForPosition:sprite112Pos];
    int tileGID = [self.bgLayer tileGIDAt:tileCoord];
    if (tileGID)
    {
        NSDictionary *properties = [theHKMap propertiesForGID:tileGID];
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
                    CGPoint tileCoord1 = [self tileCoordForPosition:self.sprite112.position];
                    int tileGID1 = [self.bgLayer tileGIDAt:tileCoord1];
                    [self.bgLayer removeTileAt:tileCoord1];
                    [self.bgLayer setTileGID:(tileGID1 - 2) at:tileCoord1];
                    
                    id actionMove = [CCMoveTo actionWithDuration:0.3 position:sprite112Pos];
                    id actionMove2 = [CCAnimate actionWithAnimation:spriteBWalkDown restoreOriginalFrame:NO];
                    
                    id actionMoveDone = [CCCallFuncN actionWithTarget:self selector:@selector(finishActionSprite112)];
                    
                    [self.sprite112 runAction:[CCSpawn actionOne:[CCSequence actions:actionMove,actionMoveDone,nil] two:actionMove2]];
                    return;
                }
            }
        }
    }
    [self finishActionSprite112];
}
-(void) finishActionSprite112
{
    if (self.sprite112.orientation == 1)
    {
        [self.sprite112 setDisplayFrame:[[spriteBWalkDown frames] objectAtIndex:0]];
    }
    else if (self.sprite112.orientation == 2)
    {
        [self.sprite112 setDisplayFrame:[[spriteBWalkUp frames] objectAtIndex:0]];
    }
    else if (self.sprite112.orientation == 3)
    {
        [self.sprite112 setDisplayFrame:[[spriteBWalkRight frames] objectAtIndex:0]];
    }
    else
    {
        [self.sprite112 setDisplayFrame:[[spriteBWalkLeft frames] objectAtIndex:0]];
    }
    self.hero.sprite112position = self.sprite112.position;
}
-(void) updateSprite113
{
    CGSize screenSize = [[CCDirector sharedDirector] winSize];
    int x = self.hero.position.x;
    int y = self.hero.position.y;
    
    int p = self.sprite113.position.x;
    int q = self.sprite113.position.y;
    
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
        [self moveleftSprite113];
    }
    if (rand == 2)
    {
        [self moverightSprite113];
    }
    if (rand == 3)
    {
        [self moveupSprite113];
    }
    if (rand == 4)
    {
        [self movedownSprite113];
    }
    return;
}

-(void) moveleftSprite113
{
    CGPoint sprite113Pos = self.sprite113.position;
    self.sprite113.orientation = 4;
    sprite113Pos.x -= theHKMap.tileSize.width;
    
    CGPoint tileCoord = [self tileCoordForPosition:sprite113Pos];
    int tileGID = [self.bgLayer tileGIDAt:tileCoord];
    if (tileGID)
    {
        NSDictionary *properties = [theHKMap propertiesForGID:tileGID];
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
                    CGPoint tileCoord1 = [self tileCoordForPosition:self.sprite113.position];
                    int tileGID1 = [self.bgLayer tileGIDAt:tileCoord1];
                    [self.bgLayer removeTileAt:tileCoord1];
                    [self.bgLayer setTileGID:(tileGID1 - 3) at:tileCoord1];
                    
                    id actionMove = [CCMoveTo actionWithDuration:0.3 position:sprite113Pos];
                    id actionMove2 = [CCAnimate actionWithAnimation:spriteSWalkLeft restoreOriginalFrame:NO];
                    
                    id actionMoveDone = [CCCallFuncN actionWithTarget:self selector:@selector(finishActionSprite113)];
                    
                    [self.sprite113 runAction:[CCSpawn actionOne:[CCSequence actions:actionMove,actionMoveDone,nil] two:actionMove2]];
                    return;
                }
            }
        }
    }
    [self finishActionSprite113];
}
-(void) moverightSprite113
{
    CGPoint sprite113Pos = self.sprite113.position;
    self.sprite113.orientation = 3;
    sprite113Pos.x += theHKMap.tileSize.width;
    
    CGPoint tileCoord = [self tileCoordForPosition:sprite113Pos];
    int tileGID = [self.bgLayer tileGIDAt:tileCoord];
    if (tileGID)
    {
        NSDictionary *properties = [theHKMap propertiesForGID:tileGID];
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
                    CGPoint tileCoord1 = [self tileCoordForPosition:self.sprite113.position];
                    int tileGID1 = [self.bgLayer tileGIDAt:tileCoord1];
                    [self.bgLayer removeTileAt:tileCoord1];
                    [self.bgLayer setTileGID:(tileGID1 - 3) at:tileCoord1];
                    
                    id actionMove = [CCMoveTo actionWithDuration:0.3 position:sprite113Pos];
                    id actionMove2 = [CCAnimate actionWithAnimation:spriteSWalkRight restoreOriginalFrame:NO];
                    
                    id actionMoveDone = [CCCallFuncN actionWithTarget:self selector:@selector(finishActionSprite113)];
                    
                    [self.sprite113 runAction:[CCSpawn actionOne:[CCSequence actions:actionMove,actionMoveDone,nil] two:actionMove2]];
                    return;
                }
            }
        }
    }
    [self finishActionSprite113];
}
-(void) moveupSprite113
{
    CGPoint sprite113Pos = self.sprite113.position;
    self.sprite113.orientation = 2;
    sprite113Pos.y += theHKMap.tileSize.height;
    
    CGPoint tileCoord = [self tileCoordForPosition:sprite113Pos];
    int tileGID = [self.bgLayer tileGIDAt:tileCoord];
    if (tileGID)
    {
        NSDictionary *properties = [theHKMap propertiesForGID:tileGID];
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
                    CGPoint tileCoord1 = [self tileCoordForPosition:self.sprite113.position];
                    int tileGID1 = [self.bgLayer tileGIDAt:tileCoord1];
                    [self.bgLayer removeTileAt:tileCoord1];
                    [self.bgLayer setTileGID:(tileGID1 - 3) at:tileCoord1];
                    
                    id actionMove = [CCMoveTo actionWithDuration:0.3 position:sprite113Pos];
                    id actionMove2 = [CCAnimate actionWithAnimation:spriteSWalkUp restoreOriginalFrame:NO];
                    
                    id actionMoveDone = [CCCallFuncN actionWithTarget:self selector:@selector(finishActionSprite113)];
                    
                    [self.sprite113 runAction:[CCSpawn actionOne:[CCSequence actions:actionMove,actionMoveDone,nil] two:actionMove2]];
                    return;
                }
            }
        }
    }
    [self finishActionSprite113];
}
-(void) movedownSprite113
{
    CGPoint sprite113Pos = self.sprite113.position;
    self.sprite113.orientation = 1;
    sprite113Pos.y -= theHKMap.tileSize.width;
    
    CGPoint tileCoord = [self tileCoordForPosition:sprite113Pos];
    int tileGID = [self.bgLayer tileGIDAt:tileCoord];
    if (tileGID)
    {
        NSDictionary *properties = [theHKMap propertiesForGID:tileGID];
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
                    CGPoint tileCoord1 = [self tileCoordForPosition:self.sprite113.position];
                    int tileGID1 = [self.bgLayer tileGIDAt:tileCoord1];
                    [self.bgLayer removeTileAt:tileCoord1];
                    [self.bgLayer setTileGID:(tileGID1 - 3) at:tileCoord1];
                    
                    id actionMove = [CCMoveTo actionWithDuration:0.3 position:sprite113Pos];
                    id actionMove2 = [CCAnimate actionWithAnimation:spriteSWalkDown restoreOriginalFrame:NO];
                    
                    id actionMoveDone = [CCCallFuncN actionWithTarget:self selector:@selector(finishActionSprite113)];
                    
                    [self.sprite113 runAction:[CCSpawn actionOne:[CCSequence actions:actionMove,actionMoveDone,nil] two:actionMove2]];
                    return;
                }
            }
        }
    }
    [self finishActionSprite113];
}
-(void) finishActionSprite113
{
    if (self.sprite113.orientation == 1)
    {
        [self.sprite113 setDisplayFrame:[[spriteSWalkDown frames] objectAtIndex:0]];
    }
    else if (self.sprite113.orientation == 2)
    {
        [self.sprite113 setDisplayFrame:[[spriteSWalkUp frames] objectAtIndex:0]];
    }
    else if (self.sprite113.orientation == 3)
    {
        [self.sprite113 setDisplayFrame:[[spriteSWalkRight frames] objectAtIndex:0]];
    }
    else
    {
        [self.sprite113 setDisplayFrame:[[spriteSWalkLeft frames] objectAtIndex:0]];
    }
    self.hero.sprite113position = self.sprite113.position;
}
-(void) updateSprite114
{
    CGSize screenSize = [[CCDirector sharedDirector] winSize];
    int x = self.hero.position.x;
    int y = self.hero.position.y;
    
    int p = self.sprite114.position.x;
    int q = self.sprite114.position.y;
    
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
    
    int rand = arc4random()%14;
    if (rand == 1)
    {
        [self moveleftSprite114];
    }
    if (rand == 2)
    {
        [self moverightSprite114];
    }
    if (rand == 3)
    {
        [self moveupSprite114];
    }
    if (rand == 4)
    {
        [self movedownSprite114];
    }
    return;
}

-(void) moveleftSprite114
{
    CGPoint sprite114Pos = self.sprite114.position;
    self.sprite114.orientation = 4;
    sprite114Pos.x -= theHKMap.tileSize.width;
    
    CGPoint tileCoord = [self tileCoordForPosition:sprite114Pos];
    int tileGID = [self.bgLayer tileGIDAt:tileCoord];
    if (tileGID)
    {
        NSDictionary *properties = [theHKMap propertiesForGID:tileGID];
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
                    CGPoint tileCoord1 = [self tileCoordForPosition:self.sprite114.position];
                    int tileGID1 = [self.bgLayer tileGIDAt:tileCoord1];
                    [self.bgLayer removeTileAt:tileCoord1];
                    [self.bgLayer setTileGID:(tileGID1 - 4) at:tileCoord1];
                    
                    id actionMove = [CCMoveTo actionWithDuration:0.3 position:sprite114Pos];
                    id actionMove2 = [CCAnimate actionWithAnimation:spriteUWalkLeft restoreOriginalFrame:NO];
                    
                    id actionMoveDone = [CCCallFuncN actionWithTarget:self selector:@selector(finishActionSprite114)];
                    
                    [self.sprite114 runAction:[CCSpawn actionOne:[CCSequence actions:actionMove,actionMoveDone,nil] two:actionMove2]];
                    return;
                }
            }
        }
    }
    [self finishActionSprite114];
}
-(void) moverightSprite114
{
    CGPoint sprite114Pos = self.sprite114.position;
    self.sprite114.orientation = 3;
    sprite114Pos.x += theHKMap.tileSize.width;
    
    CGPoint tileCoord = [self tileCoordForPosition:sprite114Pos];
    int tileGID = [self.bgLayer tileGIDAt:tileCoord];
    if (tileGID)
    {
        NSDictionary *properties = [theHKMap propertiesForGID:tileGID];
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
                    CGPoint tileCoord1 = [self tileCoordForPosition:self.sprite114.position];
                    int tileGID1 = [self.bgLayer tileGIDAt:tileCoord1];
                    [self.bgLayer removeTileAt:tileCoord1];
                    [self.bgLayer setTileGID:(tileGID1 - 4) at:tileCoord1];
                    
                    id actionMove = [CCMoveTo actionWithDuration:0.3 position:sprite114Pos];
                    id actionMove2 = [CCAnimate actionWithAnimation:spriteUWalkRight restoreOriginalFrame:NO];
                    
                    id actionMoveDone = [CCCallFuncN actionWithTarget:self selector:@selector(finishActionSprite114)];
                    
                    [self.sprite114 runAction:[CCSpawn actionOne:[CCSequence actions:actionMove,actionMoveDone,nil] two:actionMove2]];
                    return;
                }
            }
        }
    }
    [self finishActionSprite114];
}
-(void) moveupSprite114
{
    CGPoint sprite114Pos = self.sprite114.position;
    self.sprite114.orientation = 2;
    sprite114Pos.y += theHKMap.tileSize.height;
    
    CGPoint tileCoord = [self tileCoordForPosition:sprite114Pos];
    int tileGID = [self.bgLayer tileGIDAt:tileCoord];
    if (tileGID)
    {
        NSDictionary *properties = [theHKMap propertiesForGID:tileGID];
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
                    CGPoint tileCoord1 = [self tileCoordForPosition:self.sprite114.position];
                    int tileGID1 = [self.bgLayer tileGIDAt:tileCoord1];
                    [self.bgLayer removeTileAt:tileCoord1];
                    [self.bgLayer setTileGID:(tileGID1 - 4) at:tileCoord1];
                    
                    id actionMove = [CCMoveTo actionWithDuration:0.3 position:sprite114Pos];
                    id actionMove2 = [CCAnimate actionWithAnimation:spriteUWalkUp restoreOriginalFrame:NO];
                    
                    id actionMoveDone = [CCCallFuncN actionWithTarget:self selector:@selector(finishActionSprite114)];
                    
                    [self.sprite114 runAction:[CCSpawn actionOne:[CCSequence actions:actionMove,actionMoveDone,nil] two:actionMove2]];
                    return;
                }
            }
        }
    }
    [self finishActionSprite114];
}
-(void) movedownSprite114
{
    CGPoint sprite114Pos = self.sprite114.position;
    self.sprite114.orientation = 1;
    sprite114Pos.y -= theHKMap.tileSize.width;
    
    CGPoint tileCoord = [self tileCoordForPosition:sprite114Pos];
    int tileGID = [self.bgLayer tileGIDAt:tileCoord];
    if (tileGID)
    {
        NSDictionary *properties = [theHKMap propertiesForGID:tileGID];
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
                    CGPoint tileCoord1 = [self tileCoordForPosition:self.sprite114.position];
                    int tileGID1 = [self.bgLayer tileGIDAt:tileCoord1];
                    [self.bgLayer removeTileAt:tileCoord1];
                    [self.bgLayer setTileGID:(tileGID1 - 4) at:tileCoord1];
                    
                    id actionMove = [CCMoveTo actionWithDuration:0.3 position:sprite114Pos];
                    id actionMove2 = [CCAnimate actionWithAnimation:spriteUWalkDown restoreOriginalFrame:NO];
                    
                    id actionMoveDone = [CCCallFuncN actionWithTarget:self selector:@selector(finishActionSprite114)];
                    
                    [self.sprite114 runAction:[CCSpawn actionOne:[CCSequence actions:actionMove,actionMoveDone,nil] two:actionMove2]];
                    return;
                }
            }
        }
    }
    [self finishActionSprite114];
}
-(void) finishActionSprite114
{
    if (self.sprite114.orientation == 1)
    {
        [self.sprite114 setDisplayFrame:[[spriteUWalkDown frames] objectAtIndex:0]];
    }
    else if (self.sprite114.orientation == 2)
    {
        [self.sprite114 setDisplayFrame:[[spriteUWalkUp frames] objectAtIndex:0]];
    }
    else if (self.sprite114.orientation == 3)
    {
        [self.sprite114 setDisplayFrame:[[spriteUWalkRight frames] objectAtIndex:0]];
    }
    else
    {
        [self.sprite114 setDisplayFrame:[[spriteUWalkLeft frames] objectAtIndex:0]];
    }
    self.hero.sprite114position = self.sprite114.position;
}
-(void) updateSprite115
{
    CGSize screenSize = [[CCDirector sharedDirector] winSize];
    int x = self.hero.position.x;
    int y = self.hero.position.y;
    
    int p = self.sprite115.position.x;
    int q = self.sprite115.position.y;
    
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
        [self moveleftSprite115];
    }
    if (rand == 2)
    {
        [self moverightSprite115];
    }
    if (rand == 3)
    {
        [self moveupSprite115];
    }
    if (rand == 4)
    {
        [self movedownSprite115];
    }
    return;
}

-(void) moveleftSprite115
{
    CGPoint sprite115Pos = self.sprite115.position;
    self.sprite115.orientation = 4;
    sprite115Pos.x -= theHKMap.tileSize.width;
    
    CGPoint tileCoord = [self tileCoordForPosition:sprite115Pos];
    int tileGID = [self.bgLayer tileGIDAt:tileCoord];
    if (tileGID)
    {
        NSDictionary *properties = [theHKMap propertiesForGID:tileGID];
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
                    CGPoint tileCoord1 = [self tileCoordForPosition:self.sprite115.position];
                    int tileGID1 = [self.bgLayer tileGIDAt:tileCoord1];
                    [self.bgLayer removeTileAt:tileCoord1];
                    [self.bgLayer setTileGID:(tileGID1 - 5) at:tileCoord1];
                    
                    id actionMove = [CCMoveTo actionWithDuration:0.3 position:sprite115Pos];
                    id actionMove2 = [CCAnimate actionWithAnimation:spriteYWalkLeft restoreOriginalFrame:NO];
                    
                    id actionMoveDone = [CCCallFuncN actionWithTarget:self selector:@selector(finishActionSprite115)];
                    
                    [self.sprite115 runAction:[CCSpawn actionOne:[CCSequence actions:actionMove,actionMoveDone,nil] two:actionMove2]];
                    return;
                }
            }
        }
    }
    [self finishActionSprite115];
}
-(void) moverightSprite115
{
    CGPoint sprite115Pos = self.sprite115.position;
    self.sprite115.orientation = 3;
    sprite115Pos.x += theHKMap.tileSize.width;
    
    CGPoint tileCoord = [self tileCoordForPosition:sprite115Pos];
    int tileGID = [self.bgLayer tileGIDAt:tileCoord];
    if (tileGID)
    {
        NSDictionary *properties = [theHKMap propertiesForGID:tileGID];
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
                    CGPoint tileCoord1 = [self tileCoordForPosition:self.sprite115.position];
                    int tileGID1 = [self.bgLayer tileGIDAt:tileCoord1];
                    [self.bgLayer removeTileAt:tileCoord1];
                    [self.bgLayer setTileGID:(tileGID1 - 5) at:tileCoord1];
                    
                    id actionMove = [CCMoveTo actionWithDuration:0.3 position:sprite115Pos];
                    id actionMove2 = [CCAnimate actionWithAnimation:spriteYWalkRight restoreOriginalFrame:NO];
                    
                    id actionMoveDone = [CCCallFuncN actionWithTarget:self selector:@selector(finishActionSprite115)];
                    
                    [self.sprite115 runAction:[CCSpawn actionOne:[CCSequence actions:actionMove,actionMoveDone,nil] two:actionMove2]];
                    return;
                }
            }
        }
    }
    [self finishActionSprite115];
}
-(void) moveupSprite115
{
    CGPoint sprite115Pos = self.sprite115.position;
    self.sprite115.orientation = 2;
    sprite115Pos.y += theHKMap.tileSize.height;
    
    CGPoint tileCoord = [self tileCoordForPosition:sprite115Pos];
    int tileGID = [self.bgLayer tileGIDAt:tileCoord];
    if (tileGID)
    {
        NSDictionary *properties = [theHKMap propertiesForGID:tileGID];
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
                    CGPoint tileCoord1 = [self tileCoordForPosition:self.sprite115.position];
                    int tileGID1 = [self.bgLayer tileGIDAt:tileCoord1];
                    [self.bgLayer removeTileAt:tileCoord1];
                    [self.bgLayer setTileGID:(tileGID1 - 5) at:tileCoord1];
                    
                    id actionMove = [CCMoveTo actionWithDuration:0.3 position:sprite115Pos];
                    id actionMove2 = [CCAnimate actionWithAnimation:spriteYWalkUp restoreOriginalFrame:NO];
                    
                    id actionMoveDone = [CCCallFuncN actionWithTarget:self selector:@selector(finishActionSprite115)];
                    
                    [self.sprite115 runAction:[CCSpawn actionOne:[CCSequence actions:actionMove,actionMoveDone,nil] two:actionMove2]];
                    return;
                }
            }
        }
    }
    [self finishActionSprite115];
}
-(void) movedownSprite115
{
    CGPoint sprite115Pos = self.sprite115.position;
    self.sprite115.orientation = 1;
    sprite115Pos.y -= theHKMap.tileSize.width;
    
    CGPoint tileCoord = [self tileCoordForPosition:sprite115Pos];
    int tileGID = [self.bgLayer tileGIDAt:tileCoord];
    if (tileGID)
    {
        NSDictionary *properties = [theHKMap propertiesForGID:tileGID];
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
                    CGPoint tileCoord1 = [self tileCoordForPosition:self.sprite115.position];
                    int tileGID1 = [self.bgLayer tileGIDAt:tileCoord1];
                    [self.bgLayer removeTileAt:tileCoord1];
                    [self.bgLayer setTileGID:(tileGID1 - 5) at:tileCoord1];
                    
                    id actionMove = [CCMoveTo actionWithDuration:0.3 position:sprite115Pos];
                    id actionMove2 = [CCAnimate actionWithAnimation:spriteYWalkDown restoreOriginalFrame:NO];
                    
                    id actionMoveDone = [CCCallFuncN actionWithTarget:self selector:@selector(finishActionSprite115)];
                    
                    [self.sprite115 runAction:[CCSpawn actionOne:[CCSequence actions:actionMove,actionMoveDone,nil] two:actionMove2]];
                    return;
                }
            }
        }
    }
    [self finishActionSprite115];
}
-(void) finishActionSprite115
{
    if (self.sprite115.orientation == 1)
    {
        [self.sprite115 setDisplayFrame:[[spriteYWalkDown frames] objectAtIndex:0]];
    }
    else if (self.sprite115.orientation == 2)
    {
        [self.sprite115 setDisplayFrame:[[spriteYWalkUp frames] objectAtIndex:0]];
    }
    else if (self.sprite115.orientation == 3)
    {
        [self.sprite115 setDisplayFrame:[[spriteYWalkRight frames] objectAtIndex:0]];
    }
    else
    {
        [self.sprite115 setDisplayFrame:[[spriteYWalkLeft frames] objectAtIndex:0]];
    }
    self.hero.sprite115position = self.sprite115.position;
}
-(void) updateSprite116
{
    CGSize screenSize = [[CCDirector sharedDirector] winSize];
    int x = self.hero.position.x;
    int y = self.hero.position.y;
    
    int p = self.sprite116.position.x;
    int q = self.sprite116.position.y;
    
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
        [self moveleftSprite116];
    }
    if (rand == 2)
    {
        [self moverightSprite116];
    }
    if (rand == 3)
    {
        [self moveupSprite116];
    }
    if (rand == 4)
    {
        [self movedownSprite116];
    }
    return;
}

-(void) moveleftSprite116
{
    CGPoint sprite116Pos = self.sprite116.position;
    self.sprite116.orientation = 4;
    sprite116Pos.x -= theHKMap.tileSize.width;
    
    CGPoint tileCoord = [self tileCoordForPosition:sprite116Pos];
    int tileGID = [self.bgLayer tileGIDAt:tileCoord];
    if (tileGID)
    {
        NSDictionary *properties = [theHKMap propertiesForGID:tileGID];
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
                    CGPoint tileCoord1 = [self tileCoordForPosition:self.sprite116.position];
                    int tileGID1 = [self.bgLayer tileGIDAt:tileCoord1];
                    [self.bgLayer removeTileAt:tileCoord1];
                    [self.bgLayer setTileGID:(tileGID1 - 6) at:tileCoord1];
                    
                    id actionMove = [CCMoveTo actionWithDuration:0.3 position:sprite116Pos];
                    id actionMove2 = [CCAnimate actionWithAnimation:spriteTWalkLeft restoreOriginalFrame:NO];
                    
                    id actionMoveDone = [CCCallFuncN actionWithTarget:self selector:@selector(finishActionSprite116)];
                    
                    [self.sprite116 runAction:[CCSpawn actionOne:[CCSequence actions:actionMove,actionMoveDone,nil] two:actionMove2]];
                    return;
                }
            }
        }
    }
    [self finishActionSprite116];
}
-(void) moverightSprite116
{
    CGPoint sprite116Pos = self.sprite116.position;
    self.sprite116.orientation = 3;
    sprite116Pos.x += theHKMap.tileSize.width;
    
    CGPoint tileCoord = [self tileCoordForPosition:sprite116Pos];
    int tileGID = [self.bgLayer tileGIDAt:tileCoord];
    if (tileGID)
    {
        NSDictionary *properties = [theHKMap propertiesForGID:tileGID];
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
                    CGPoint tileCoord1 = [self tileCoordForPosition:self.sprite116.position];
                    int tileGID1 = [self.bgLayer tileGIDAt:tileCoord1];
                    [self.bgLayer removeTileAt:tileCoord1];
                    [self.bgLayer setTileGID:(tileGID1 - 6) at:tileCoord1];
                    
                    id actionMove = [CCMoveTo actionWithDuration:0.3 position:sprite116Pos];
                    id actionMove2 = [CCAnimate actionWithAnimation:spriteTWalkRight restoreOriginalFrame:NO];
                    
                    id actionMoveDone = [CCCallFuncN actionWithTarget:self selector:@selector(finishActionSprite116)];
                    
                    [self.sprite116 runAction:[CCSpawn actionOne:[CCSequence actions:actionMove,actionMoveDone,nil] two:actionMove2]];
                    return;
                }
            }
        }
    }
    [self finishActionSprite116];
}
-(void) moveupSprite116
{
    CGPoint sprite116Pos = self.sprite116.position;
    self.sprite116.orientation = 2;
    sprite116Pos.y += theHKMap.tileSize.height;
    
    CGPoint tileCoord = [self tileCoordForPosition:sprite116Pos];
    int tileGID = [self.bgLayer tileGIDAt:tileCoord];
    if (tileGID)
    {
        NSDictionary *properties = [theHKMap propertiesForGID:tileGID];
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
                    CGPoint tileCoord1 = [self tileCoordForPosition:self.sprite116.position];
                    int tileGID1 = [self.bgLayer tileGIDAt:tileCoord1];
                    [self.bgLayer removeTileAt:tileCoord1];
                    [self.bgLayer setTileGID:(tileGID1 - 6) at:tileCoord1];
                    
                    id actionMove = [CCMoveTo actionWithDuration:0.3 position:sprite116Pos];
                    id actionMove2 = [CCAnimate actionWithAnimation:spriteTWalkUp restoreOriginalFrame:NO];
                    
                    id actionMoveDone = [CCCallFuncN actionWithTarget:self selector:@selector(finishActionSprite116)];
                    
                    [self.sprite116 runAction:[CCSpawn actionOne:[CCSequence actions:actionMove,actionMoveDone,nil] two:actionMove2]];
                    return;
                }
            }
        }
    }
    [self finishActionSprite116];
}
-(void) movedownSprite116
{
    CGPoint sprite116Pos = self.sprite116.position;
    self.sprite116.orientation = 1;
    sprite116Pos.y -= theHKMap.tileSize.width;
    
    CGPoint tileCoord = [self tileCoordForPosition:sprite116Pos];
    int tileGID = [self.bgLayer tileGIDAt:tileCoord];
    if (tileGID)
    {
        NSDictionary *properties = [theHKMap propertiesForGID:tileGID];
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
                    CGPoint tileCoord1 = [self tileCoordForPosition:self.sprite116.position];
                    int tileGID1 = [self.bgLayer tileGIDAt:tileCoord1];
                    [self.bgLayer removeTileAt:tileCoord1];
                    [self.bgLayer setTileGID:(tileGID1 - 6) at:tileCoord1];
                    
                    id actionMove = [CCMoveTo actionWithDuration:0.3 position:sprite116Pos];
                    id actionMove2 = [CCAnimate actionWithAnimation:spriteTWalkDown restoreOriginalFrame:NO];
                    
                    id actionMoveDone = [CCCallFuncN actionWithTarget:self selector:@selector(finishActionSprite116)];
                    
                    [self.sprite116 runAction:[CCSpawn actionOne:[CCSequence actions:actionMove,actionMoveDone,nil] two:actionMove2]];
                    return;
                }
            }
        }
    }
    [self finishActionSprite116];
}
-(void) finishActionSprite116
{
    if (self.sprite116.orientation == 1)
    {
        [self.sprite116 setDisplayFrame:[[spriteTWalkDown frames] objectAtIndex:0]];
    }
    else if (self.sprite116.orientation == 2)
    {
        [self.sprite116 setDisplayFrame:[[spriteTWalkUp frames] objectAtIndex:0]];
    }
    else if (self.sprite116.orientation == 3)
    {
        [self.sprite116 setDisplayFrame:[[spriteTWalkRight frames] objectAtIndex:0]];
    }
    else
    {
        [self.sprite116 setDisplayFrame:[[spriteTWalkLeft frames] objectAtIndex:0]];
    }
    self.hero.sprite116position = self.sprite116.position;
}
-(void) updateSprite117
{
    CGSize screenSize = [[CCDirector sharedDirector] winSize];
    int x = self.hero.position.x;
    int y = self.hero.position.y;
    
    int p = self.sprite117.position.x;
    int q = self.sprite117.position.y;
    
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
        [self moveleftSprite117];
    }
    if (rand == 2)
    {
        [self moverightSprite117];
    }
    if (rand == 3)
    {
        [self moveupSprite117];
    }
    if (rand == 4)
    {
        [self movedownSprite117];
    }
    return;
}

-(void) moveleftSprite117
{
    CGPoint sprite117Pos = self.sprite117.position;
    self.sprite117.orientation = 4;
    sprite117Pos.x -= theHKMap.tileSize.width;
    
    CGPoint tileCoord = [self tileCoordForPosition:sprite117Pos];
    int tileGID = [self.bgLayer tileGIDAt:tileCoord];
    if (tileGID)
    {
        NSDictionary *properties = [theHKMap propertiesForGID:tileGID];
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
                    CGPoint tileCoord1 = [self tileCoordForPosition:self.sprite117.position];
                    int tileGID1 = [self.bgLayer tileGIDAt:tileCoord1];
                    [self.bgLayer removeTileAt:tileCoord1];
                    [self.bgLayer setTileGID:(tileGID1 - 7) at:tileCoord1];
                    
                    id actionMove = [CCMoveTo actionWithDuration:0.3 position:sprite117Pos];
                    id actionMove2 = [CCAnimate actionWithAnimation:spriteIWalkLeft restoreOriginalFrame:NO];
                    
                    id actionMoveDone = [CCCallFuncN actionWithTarget:self selector:@selector(finishActionSprite117)];
                    
                    [self.sprite117 runAction:[CCSpawn actionOne:[CCSequence actions:actionMove,actionMoveDone,nil] two:actionMove2]];
                    return;
                }
            }
        }
    }
    [self finishActionSprite117];
}
-(void) moverightSprite117
{
    CGPoint sprite117Pos = self.sprite117.position;
    self.sprite117.orientation = 3;
    sprite117Pos.x += theHKMap.tileSize.width;
    
    CGPoint tileCoord = [self tileCoordForPosition:sprite117Pos];
    int tileGID = [self.bgLayer tileGIDAt:tileCoord];
    if (tileGID)
    {
        NSDictionary *properties = [theHKMap propertiesForGID:tileGID];
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
                    CGPoint tileCoord1 = [self tileCoordForPosition:self.sprite117.position];
                    int tileGID1 = [self.bgLayer tileGIDAt:tileCoord1];
                    [self.bgLayer removeTileAt:tileCoord1];
                    [self.bgLayer setTileGID:(tileGID1 - 7) at:tileCoord1];
                    
                    id actionMove = [CCMoveTo actionWithDuration:0.3 position:sprite117Pos];
                    id actionMove2 = [CCAnimate actionWithAnimation:spriteIWalkRight restoreOriginalFrame:NO];
                    
                    id actionMoveDone = [CCCallFuncN actionWithTarget:self selector:@selector(finishActionSprite117)];
                    
                    [self.sprite117 runAction:[CCSpawn actionOne:[CCSequence actions:actionMove,actionMoveDone,nil] two:actionMove2]];
                    return;
                }
            }
        }
    }
    [self finishActionSprite117];
}
-(void) moveupSprite117
{
    CGPoint sprite117Pos = self.sprite117.position;
    self.sprite117.orientation = 2;
    sprite117Pos.y += theHKMap.tileSize.height;
    
    CGPoint tileCoord = [self tileCoordForPosition:sprite117Pos];
    int tileGID = [self.bgLayer tileGIDAt:tileCoord];
    if (tileGID)
    {
        NSDictionary *properties = [theHKMap propertiesForGID:tileGID];
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
                    CGPoint tileCoord1 = [self tileCoordForPosition:self.sprite117.position];
                    int tileGID1 = [self.bgLayer tileGIDAt:tileCoord1];
                    [self.bgLayer removeTileAt:tileCoord1];
                    [self.bgLayer setTileGID:(tileGID1 - 7) at:tileCoord1];
                    
                    id actionMove = [CCMoveTo actionWithDuration:0.3 position:sprite117Pos];
                    id actionMove2 = [CCAnimate actionWithAnimation:spriteIWalkUp restoreOriginalFrame:NO];
                    
                    id actionMoveDone = [CCCallFuncN actionWithTarget:self selector:@selector(finishActionSprite117)];
                    
                    [self.sprite117 runAction:[CCSpawn actionOne:[CCSequence actions:actionMove,actionMoveDone,nil] two:actionMove2]];
                    return;
                }
            }
        }
    }
    [self finishActionSprite117];
}
-(void) movedownSprite117
{
    CGPoint sprite117Pos = self.sprite117.position;
    self.sprite117.orientation = 1;
    sprite117Pos.y -= theHKMap.tileSize.width;
    
    CGPoint tileCoord = [self tileCoordForPosition:sprite117Pos];
    int tileGID = [self.bgLayer tileGIDAt:tileCoord];
    if (tileGID)
    {
        NSDictionary *properties = [theHKMap propertiesForGID:tileGID];
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
                    CGPoint tileCoord1 = [self tileCoordForPosition:self.sprite117.position];
                    int tileGID1 = [self.bgLayer tileGIDAt:tileCoord1];
                    [self.bgLayer removeTileAt:tileCoord1];
                    [self.bgLayer setTileGID:(tileGID1 - 7) at:tileCoord1];
                    
                    id actionMove = [CCMoveTo actionWithDuration:0.3 position:sprite117Pos];
                    id actionMove2 = [CCAnimate actionWithAnimation:spriteIWalkDown restoreOriginalFrame:NO];
                    
                    id actionMoveDone = [CCCallFuncN actionWithTarget:self selector:@selector(finishActionSprite117)];
                    
                    [self.sprite117 runAction:[CCSpawn actionOne:[CCSequence actions:actionMove,actionMoveDone,nil] two:actionMove2]];
                    return;
                }
            }
        }
    }
    [self finishActionSprite117];
}
-(void) finishActionSprite117
{
    if (self.sprite117.orientation == 1)
    {
        [self.sprite117 setDisplayFrame:[[spriteIWalkDown frames] objectAtIndex:0]];
    }
    else if (self.sprite117.orientation == 2)
    {
        [self.sprite117 setDisplayFrame:[[spriteIWalkUp frames] objectAtIndex:0]];
    }
    else if (self.sprite117.orientation == 3)
    {
        [self.sprite117 setDisplayFrame:[[spriteIWalkRight frames] objectAtIndex:0]];
    }
    else
    {
        [self.sprite117 setDisplayFrame:[[spriteIWalkLeft frames] objectAtIndex:0]];
    }
    self.hero.sprite117position = self.sprite117.position;
}
-(void) updateSprite118
{
    CGSize screenSize = [[CCDirector sharedDirector] winSize];
    int x = self.hero.position.x;
    int y = self.hero.position.y;
    
    int p = self.sprite118.position.x;
    int q = self.sprite118.position.y;
    
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
        [self moveleftSprite118];
    }
    if (rand == 2)
    {
        [self moverightSprite118];
    }
    if (rand == 3)
    {
        [self moveupSprite118];
    }
    if (rand == 4)
    {
        [self movedownSprite118];
    }
    return;
}

-(void) moveleftSprite118
{
    CGPoint sprite118Pos = self.sprite118.position;
    self.sprite118.orientation = 4;
    sprite118Pos.x -= theHKMap.tileSize.width;
    
    CGPoint tileCoord = [self tileCoordForPosition:sprite118Pos];
    int tileGID = [self.bgLayer tileGIDAt:tileCoord];
    if (tileGID)
    {
        NSDictionary *properties = [theHKMap propertiesForGID:tileGID];
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
                    CGPoint tileCoord1 = [self tileCoordForPosition:self.sprite118.position];
                    int tileGID1 = [self.bgLayer tileGIDAt:tileCoord1];
                    [self.bgLayer removeTileAt:tileCoord1];
                    [self.bgLayer setTileGID:(tileGID1 - 8) at:tileCoord1];
                    
                    id actionMove = [CCMoveTo actionWithDuration:0.3 position:sprite118Pos];
                    id actionMove2 = [CCAnimate actionWithAnimation:spriteNWalkLeft restoreOriginalFrame:NO];
                    
                    id actionMoveDone = [CCCallFuncN actionWithTarget:self selector:@selector(finishActionSprite118)];
                    
                    [self.sprite118 runAction:[CCSpawn actionOne:[CCSequence actions:actionMove,actionMoveDone,nil] two:actionMove2]];
                    return;
                }
            }
        }
    }
    [self finishActionSprite118];
}
-(void) moverightSprite118
{
    CGPoint sprite118Pos = self.sprite118.position;
    self.sprite118.orientation = 3;
    sprite118Pos.x += theHKMap.tileSize.width;
    
    CGPoint tileCoord = [self tileCoordForPosition:sprite118Pos];
    int tileGID = [self.bgLayer tileGIDAt:tileCoord];
    if (tileGID)
    {
        NSDictionary *properties = [theHKMap propertiesForGID:tileGID];
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
                    CGPoint tileCoord1 = [self tileCoordForPosition:self.sprite118.position];
                    int tileGID1 = [self.bgLayer tileGIDAt:tileCoord1];
                    [self.bgLayer removeTileAt:tileCoord1];
                    [self.bgLayer setTileGID:(tileGID1 - 8) at:tileCoord1];
                    
                    id actionMove = [CCMoveTo actionWithDuration:0.3 position:sprite118Pos];
                    id actionMove2 = [CCAnimate actionWithAnimation:spriteNWalkRight restoreOriginalFrame:NO];
                    
                    id actionMoveDone = [CCCallFuncN actionWithTarget:self selector:@selector(finishActionSprite118)];
                    
                    [self.sprite118 runAction:[CCSpawn actionOne:[CCSequence actions:actionMove,actionMoveDone,nil] two:actionMove2]];
                    return;
                }
            }
        }
    }
    [self finishActionSprite118];
}
-(void) moveupSprite118
{
    CGPoint sprite118Pos = self.sprite118.position;
    self.sprite118.orientation = 2;
    sprite118Pos.y += theHKMap.tileSize.height;
    
    CGPoint tileCoord = [self tileCoordForPosition:sprite118Pos];
    int tileGID = [self.bgLayer tileGIDAt:tileCoord];
    if (tileGID)
    {
        NSDictionary *properties = [theHKMap propertiesForGID:tileGID];
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
                    CGPoint tileCoord1 = [self tileCoordForPosition:self.sprite118.position];
                    int tileGID1 = [self.bgLayer tileGIDAt:tileCoord1];
                    [self.bgLayer removeTileAt:tileCoord1];
                    [self.bgLayer setTileGID:(tileGID1 - 8) at:tileCoord1];
                    
                    id actionMove = [CCMoveTo actionWithDuration:0.3 position:sprite118Pos];
                    id actionMove2 = [CCAnimate actionWithAnimation:spriteNWalkUp restoreOriginalFrame:NO];
                    
                    id actionMoveDone = [CCCallFuncN actionWithTarget:self selector:@selector(finishActionSprite118)];
                    
                    [self.sprite118 runAction:[CCSpawn actionOne:[CCSequence actions:actionMove,actionMoveDone,nil] two:actionMove2]];
                    return;
                }
            }
        }
    }
    [self finishActionSprite118];
}
-(void) movedownSprite118
{
    CGPoint sprite118Pos = self.sprite118.position;
    self.sprite118.orientation = 1;
    sprite118Pos.y -= theHKMap.tileSize.width;
    
    CGPoint tileCoord = [self tileCoordForPosition:sprite118Pos];
    int tileGID = [self.bgLayer tileGIDAt:tileCoord];
    if (tileGID)
    {
        NSDictionary *properties = [theHKMap propertiesForGID:tileGID];
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
                    CGPoint tileCoord1 = [self tileCoordForPosition:self.sprite118.position];
                    int tileGID1 = [self.bgLayer tileGIDAt:tileCoord1];
                    [self.bgLayer removeTileAt:tileCoord1];
                    [self.bgLayer setTileGID:(tileGID1 - 8) at:tileCoord1];
                    
                    id actionMove = [CCMoveTo actionWithDuration:0.3 position:sprite118Pos];
                    id actionMove2 = [CCAnimate actionWithAnimation:spriteNWalkDown restoreOriginalFrame:NO];
                    
                    id actionMoveDone = [CCCallFuncN actionWithTarget:self selector:@selector(finishActionSprite118)];
                    
                    [self.sprite118 runAction:[CCSpawn actionOne:[CCSequence actions:actionMove,actionMoveDone,nil] two:actionMove2]];
                    return;
                }
            }
        }
    }
    [self finishActionSprite118];
}
-(void) finishActionSprite118
{
    if (self.sprite118.orientation == 1)
    {
        [self.sprite118 setDisplayFrame:[[spriteNWalkDown frames] objectAtIndex:0]];
    }
    else if (self.sprite118.orientation == 2)
    {
        [self.sprite118 setDisplayFrame:[[spriteNWalkUp frames] objectAtIndex:0]];
    }
    else if (self.sprite118.orientation == 3)
    {
        [self.sprite118 setDisplayFrame:[[spriteNWalkRight frames] objectAtIndex:0]];
    }
    else
    {
        [self.sprite118 setDisplayFrame:[[spriteNWalkLeft frames] objectAtIndex:0]];
    }
    self.hero.sprite118position = self.sprite118.position;
}
-(void) updateSprite119
{
    CGSize screenSize = [[CCDirector sharedDirector] winSize];
    int x = self.hero.position.x;
    int y = self.hero.position.y;
    
    int p = self.sprite119.position.x;
    int q = self.sprite119.position.y;
    
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
        [self moveleftSprite119];
    }
    if (rand == 2)
    {
        [self moverightSprite119];
    }
    if (rand == 3)
    {
        [self moveupSprite119];
    }
    if (rand == 4)
    {
        [self movedownSprite119];
    }
    return;
}

-(void) moveleftSprite119
{
    CGPoint sprite119Pos = self.sprite119.position;
    self.sprite119.orientation = 4;
    sprite119Pos.x -= theHKMap.tileSize.width;
    
    CGPoint tileCoord = [self tileCoordForPosition:sprite119Pos];
    int tileGID = [self.bgLayer tileGIDAt:tileCoord];
    if (tileGID)
    {
        NSDictionary *properties = [theHKMap propertiesForGID:tileGID];
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
                    CGPoint tileCoord1 = [self tileCoordForPosition:self.sprite119.position];
                    int tileGID1 = [self.bgLayer tileGIDAt:tileCoord1];
                    [self.bgLayer removeTileAt:tileCoord1];
                    [self.bgLayer setTileGID:(tileGID1 - 9) at:tileCoord1];
                    
                    id actionMove = [CCMoveTo actionWithDuration:0.3 position:sprite119Pos];
                    id actionMove2 = [CCAnimate actionWithAnimation:spriteCWalkLeft restoreOriginalFrame:NO];
                    
                    id actionMoveDone = [CCCallFuncN actionWithTarget:self selector:@selector(finishActionSprite119)];
                    
                    [self.sprite119 runAction:[CCSpawn actionOne:[CCSequence actions:actionMove,actionMoveDone,nil] two:actionMove2]];
                    return;
                }
            }
        }
    }
    [self finishActionSprite119];
}
-(void) moverightSprite119
{
    CGPoint sprite119Pos = self.sprite119.position;
    self.sprite119.orientation = 3;
    sprite119Pos.x += theHKMap.tileSize.width;
    
    CGPoint tileCoord = [self tileCoordForPosition:sprite119Pos];
    int tileGID = [self.bgLayer tileGIDAt:tileCoord];
    if (tileGID)
    {
        NSDictionary *properties = [theHKMap propertiesForGID:tileGID];
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
                    CGPoint tileCoord1 = [self tileCoordForPosition:self.sprite119.position];
                    int tileGID1 = [self.bgLayer tileGIDAt:tileCoord1];
                    [self.bgLayer removeTileAt:tileCoord1];
                    [self.bgLayer setTileGID:(tileGID1 - 9) at:tileCoord1];
                    
                    id actionMove = [CCMoveTo actionWithDuration:0.3 position:sprite119Pos];
                    id actionMove2 = [CCAnimate actionWithAnimation:spriteCWalkRight restoreOriginalFrame:NO];
                    
                    id actionMoveDone = [CCCallFuncN actionWithTarget:self selector:@selector(finishActionSprite119)];
                    
                    [self.sprite119 runAction:[CCSpawn actionOne:[CCSequence actions:actionMove,actionMoveDone,nil] two:actionMove2]];
                    return;
                }
            }
        }
    }
    [self finishActionSprite119];
}
-(void) moveupSprite119
{
    CGPoint sprite119Pos = self.sprite119.position;
    self.sprite119.orientation = 2;
    sprite119Pos.y += theHKMap.tileSize.height;
    
    CGPoint tileCoord = [self tileCoordForPosition:sprite119Pos];
    int tileGID = [self.bgLayer tileGIDAt:tileCoord];
    if (tileGID)
    {
        NSDictionary *properties = [theHKMap propertiesForGID:tileGID];
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
                    CGPoint tileCoord1 = [self tileCoordForPosition:self.sprite119.position];
                    int tileGID1 = [self.bgLayer tileGIDAt:tileCoord1];
                    [self.bgLayer removeTileAt:tileCoord1];
                    [self.bgLayer setTileGID:(tileGID1 - 9) at:tileCoord1];
                    
                    id actionMove = [CCMoveTo actionWithDuration:0.3 position:sprite119Pos];
                    id actionMove2 = [CCAnimate actionWithAnimation:spriteCWalkUp restoreOriginalFrame:NO];
                    
                    id actionMoveDone = [CCCallFuncN actionWithTarget:self selector:@selector(finishActionSprite119)];
                    
                    [self.sprite119 runAction:[CCSpawn actionOne:[CCSequence actions:actionMove,actionMoveDone,nil] two:actionMove2]];
                    return;
                }
            }
        }
    }
    [self finishActionSprite119];
}
-(void) movedownSprite119
{
    CGPoint sprite119Pos = self.sprite119.position;
    self.sprite119.orientation = 1;
    sprite119Pos.y -= theHKMap.tileSize.width;
    
    CGPoint tileCoord = [self tileCoordForPosition:sprite119Pos];
    int tileGID = [self.bgLayer tileGIDAt:tileCoord];
    if (tileGID)
    {
        NSDictionary *properties = [theHKMap propertiesForGID:tileGID];
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
                    CGPoint tileCoord1 = [self tileCoordForPosition:self.sprite119.position];
                    int tileGID1 = [self.bgLayer tileGIDAt:tileCoord1];
                    [self.bgLayer removeTileAt:tileCoord1];
                    [self.bgLayer setTileGID:(tileGID1 - 9) at:tileCoord1];
                    
                    id actionMove = [CCMoveTo actionWithDuration:0.3 position:sprite119Pos];
                    id actionMove2 = [CCAnimate actionWithAnimation:spriteCWalkDown restoreOriginalFrame:NO];
                    
                    id actionMoveDone = [CCCallFuncN actionWithTarget:self selector:@selector(finishActionSprite119)];
                    
                    [self.sprite119 runAction:[CCSpawn actionOne:[CCSequence actions:actionMove,actionMoveDone,nil] two:actionMove2]];
                    return;
                }
            }
        }
    }
    [self finishActionSprite119];
}
-(void) finishActionSprite119
{
    if (self.sprite119.orientation == 1)
    {
        [self.sprite119 setDisplayFrame:[[spriteCWalkDown frames] objectAtIndex:0]];
    }
    else if (self.sprite119.orientation == 2)
    {
        [self.sprite119 setDisplayFrame:[[spriteCWalkUp frames] objectAtIndex:0]];
    }
    else if (self.sprite119.orientation == 3)
    {
        [self.sprite119 setDisplayFrame:[[spriteCWalkRight frames] objectAtIndex:0]];
    }
    else
    {
        [self.sprite119 setDisplayFrame:[[spriteCWalkLeft frames] objectAtIndex:0]];
    }
    self.hero.sprite119position = self.sprite119.position;
}


-(void)saveHero
{
    self.hero.heroOrientation = self.spriteOrientation;
    if (self.hero.beatIonak)
    {
        self.hero.sprite117position = self.sprite117.position;
        self.hero.sprite118position = self.sprite118.position;
        self.hero.sprite119position = self.sprite119.position;
        self.hero.sprite117_Orientation = self.sprite117.orientation;
        self.hero.sprite118_Orientation = self.sprite118.orientation;
        self.hero.sprite119_Orientation = self.sprite119.orientation;
    }
    else{
        self.hero.sprite111position = self.sprite111.position;
        self.hero.sprite111_Orientation = self.sprite111.orientation;
    }
    self.hero.sprite112position = self.sprite112.position;
    self.hero.sprite113position = self.sprite113.position;
    self.hero.sprite114position = self.sprite114.position;
    self.hero.sprite115position = self.sprite115.position;
    self.hero.sprite116position = self.sprite116.position;
    
    self.hero.sprite112_Orientation = self.sprite112.orientation;
    self.hero.sprite113_Orientation = self.sprite113.orientation;
    self.hero.sprite114_Orientation = self.sprite114.orientation;
    self.hero.sprite115_Orientation = self.sprite115.orientation;
    self.hero.sprite116_Orientation = self.sprite116.orientation;
    
    //[GameSceneManager sharedGameSceneManager].hero = self.hero;
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
        NSDictionary *properties = [theHKMap propertiesForGID:tileGID];
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
            
            NSString *gate5 = [properties valueForKey:@"gate5"];
            if (gate5 && [gate5 compare:@"true"] == NSOrderedSame)
            {
                [self goGate:5];
                return;
            }
            NSString *gate6 = [properties valueForKey:@"gate6"];
            if (gate6 && [gate6 compare:@"true"] == NSOrderedSame)
            {
                if (!self.hero.talkedToArnuk)
                {
                    [self goText:5240];
                    return;
                }
                [self goGate:6];
                return;
            }
            
            NSString *cave = [properties valueForKey:@"caveIsHere"];
            if (cave && [cave compare:@"true"] == NSOrderedSame)
            {
                [self goGate:22];
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
        NSDictionary *properties = [theHKMap propertiesForGID:tileGID];
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
            
            NSString *cave = [properties valueForKey:@"caveIsHere"];
            if (cave && [cave compare:@"true"] == NSOrderedSame)
            {
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
                [self goGate:22];
                return;
            }
            NSString *gate5 = [properties valueForKey:@"gate5"];
            if (gate5 && [gate5 compare:@"true"] == NSOrderedSame)
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
                [self goGate:5];
                return;
            }
            NSString *gate6 = [properties valueForKey:@"gate6"];
            if (gate6 && [gate6 compare:@"true"] == NSOrderedSame)
            {
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
                if (!self.hero.talkedToArnuk)
                {
                    isBeingTouched = NO;
                    if (self.canRespondToTouch)
                        self.canRespondToTouch = NO;
                    else
                        self.canRespondToTouch = YES;
                    
                    self.myHUD.isInMotion = NO;
                    [self goText:5240];
                    return;
                }
                [self goGate:6];
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
    if (self.willBattle)
    {
        return;
    }
    
    CGPoint currentPos = self.hero.position;
    int oppOrientation;
    
    if (self.spriteOrientation == 1)
    {
        currentPos.y -= theHKMap.tileSize.height;
        oppOrientation = 2;
    }
    else if (self.spriteOrientation == 2)
    {
        currentPos.y += theHKMap.tileSize.height;
        oppOrientation = 1;
    }
    else if (self.spriteOrientation == 3)
    {
        currentPos.x += theHKMap.tileSize.width;
        oppOrientation = 4;
    }
    else if (self.spriteOrientation == 4)
    {
        currentPos.x -= theHKMap.tileSize.width;
        oppOrientation = 3;
    }
    else{
        NSLog(@"Sprite Orientation Error: pressedA");
    }
    CGPoint tc = [self tileCoordForPosition:currentPos];
    int tileGID = [self.bgLayer tileGIDAt:tc];
    if (tileGID)
    {
        NSDictionary *properties = [theHKMap propertiesForGID:tileGID];
        if (properties)
        {
            NSString *sprite111Interact = [properties valueForKey:@"sprite111IsHere"];
            if (sprite111Interact && [sprite111Interact compare:@"true"] == NSOrderedSame)
            {
                self.sprite111.orientation = oppOrientation;
                
                if (self.sprite111.orientation == 1)
                {
                    [self.sprite111 setDisplayFrame:[[spriteHWalkDown frames] objectAtIndex:0]];
                }
                else if (self.sprite111.orientation == 2)
                {
                    [self.sprite111 setDisplayFrame:[[spriteHWalkUp frames] objectAtIndex:0]];
                }
                else if (self.sprite111.orientation == 3)
                {
                    [self.sprite111 setDisplayFrame:[[spriteHWalkRight frames] objectAtIndex:0]];
                }
                else
                {
                    [self.sprite111 setDisplayFrame:[[spriteHWalkLeft frames] objectAtIndex:0]];
                }
                
                if (self.hero.talkedToArnuk)
                {
                    [self goText:5002];
                }
                else
                {
                    [self goText:5000];
                }
                return;
            }
            NSString *sprite112Interact = [properties valueForKey:@"sprite112IsHere"];
            if (sprite112Interact && [sprite112Interact compare:@"true"] == NSOrderedSame)
            {
                self.sprite112.orientation = oppOrientation;
                
                if (self.sprite112.orientation == 1)
                {
                    [self.sprite112 setDisplayFrame:[[spriteBWalkDown frames] objectAtIndex:0]];
                }
                else if (self.sprite112.orientation == 2)
                {
                    [self.sprite112 setDisplayFrame:[[spriteBWalkUp frames] objectAtIndex:0]];
                }
                else if (self.sprite112.orientation == 3)
                {
                    [self.sprite112 setDisplayFrame:[[spriteBWalkRight frames] objectAtIndex:0]];
                }
                else
                {
                    [self.sprite112 setDisplayFrame:[[spriteBWalkLeft frames] objectAtIndex:0]];
                }
                
                if (self.hero.beatIonak)
                {
                    [self goText:5004];
                }
                else
                {
                    [self goText:5003];
                }
                return;
            }
            NSString *sprite113Interact = [properties valueForKey:@"sprite113IsHere"];
            if (sprite113Interact && [sprite113Interact compare:@"true"] == NSOrderedSame)
            {
                self.sprite113.orientation = oppOrientation;
                
                if (self.sprite113.orientation == 1)
                {
                    [self.sprite113 setDisplayFrame:[[spriteSWalkDown frames] objectAtIndex:0]];
                }
                else if (self.sprite113.orientation == 2)
                {
                    [self.sprite113 setDisplayFrame:[[spriteSWalkUp frames] objectAtIndex:0]];
                }
                else if (self.sprite113.orientation == 3)
                {
                    [self.sprite113 setDisplayFrame:[[spriteSWalkRight frames] objectAtIndex:0]];
                }
                else
                {
                    [self.sprite113 setDisplayFrame:[[spriteSWalkLeft frames] objectAtIndex:0]];
                }
                
                if (self.hero.beatIonak)
                {
                    [self goText:5006];
                }
                else
                {
                    [self goText:5005];
                }
                return;
            }
            NSString *sprite114Interact = [properties valueForKey:@"sprite114IsHere"];
            if (sprite114Interact && [sprite114Interact compare:@"true"] == NSOrderedSame)
            {
                self.sprite114.orientation = oppOrientation;
                
                if (self.sprite114.orientation == 1)
                {
                    [self.sprite114 setDisplayFrame:[[spriteUWalkDown frames] objectAtIndex:0]];
                }
                else if (self.sprite114.orientation == 2)
                {
                    [self.sprite114 setDisplayFrame:[[spriteUWalkUp frames] objectAtIndex:0]];
                }
                else if (self.sprite114.orientation == 3)
                {
                    [self.sprite114 setDisplayFrame:[[spriteUWalkRight frames] objectAtIndex:0]];
                }
                else
                {
                    [self.sprite114 setDisplayFrame:[[spriteUWalkLeft frames] objectAtIndex:0]];
                }
                
                
                [self goText:5101];
                return;
            }
            NSString *sprite115Interact = [properties valueForKey:@"sprite115IsHere"];
            if (sprite115Interact && [sprite115Interact compare:@"true"] == NSOrderedSame)
            {
                self.sprite115.orientation = oppOrientation;
                
                if (self.sprite115.orientation == 1)
                {
                    [self.sprite115 setDisplayFrame:[[spriteYWalkDown frames] objectAtIndex:0]];
                }
                else if (self.sprite115.orientation == 2)
                {
                    [self.sprite115 setDisplayFrame:[[spriteYWalkUp frames] objectAtIndex:0]];
                }
                else if (self.sprite115.orientation == 3)
                {
                    [self.sprite115 setDisplayFrame:[[spriteYWalkRight frames] objectAtIndex:0]];
                }
                else
                {
                    [self.sprite115 setDisplayFrame:[[spriteYWalkLeft frames] objectAtIndex:0]];
                }
                
                
                [self goText:5100];
                return;
            }
            NSString *sprite116Interact = [properties valueForKey:@"sprite116IsHere"];
            if (sprite116Interact && [sprite116Interact compare:@"true"] == NSOrderedSame)
            {
                self.sprite116.orientation = oppOrientation;
                
                if (self.sprite116.orientation == 1)
                {
                    [self.sprite116 setDisplayFrame:[[spriteTWalkDown frames] objectAtIndex:0]];
                }
                else if (self.sprite116.orientation == 2)
                {
                    [self.sprite116 setDisplayFrame:[[spriteTWalkUp frames] objectAtIndex:0]];
                }
                else if (self.sprite116.orientation == 3)
                {
                    [self.sprite116 setDisplayFrame:[[spriteTWalkRight frames] objectAtIndex:0]];
                }
                else
                {
                    [self.sprite116 setDisplayFrame:[[spriteTWalkLeft frames] objectAtIndex:0]];
                }
                
                
                [self goText:5104];
                return;
            }
            
            NSString *sprite117Interact = [properties valueForKey:@"sprite117IsHere"];
            if (sprite117Interact && [sprite117Interact compare:@"true"] == NSOrderedSame)
            {
                self.sprite117.orientation = oppOrientation;
                
                if (self.sprite117.orientation == 1)
                {
                    [self.sprite117 setDisplayFrame:[[spriteIWalkDown frames] objectAtIndex:0]];
                }
                else if (self.sprite117.orientation == 2)
                {
                    [self.sprite117 setDisplayFrame:[[spriteIWalkUp frames] objectAtIndex:0]];
                }
                else if (self.sprite117.orientation == 3)
                {
                    [self.sprite117 setDisplayFrame:[[spriteIWalkRight frames] objectAtIndex:0]];
                }
                else
                {
                    [self.sprite117 setDisplayFrame:[[spriteIWalkLeft frames] objectAtIndex:0]];
                }
                
                
                [self goText:5010];
                return;
            }
            NSString *sprite118Interact = [properties valueForKey:@"sprite118IsHere"];
            if (sprite118Interact && [sprite118Interact compare:@"true"] == NSOrderedSame)
            {
                self.sprite118.orientation = oppOrientation;
                
                if (self.sprite118.orientation == 1)
                {
                    [self.sprite118 setDisplayFrame:[[spriteNWalkDown frames] objectAtIndex:0]];
                }
                else if (self.sprite118.orientation == 2)
                {
                    [self.sprite118 setDisplayFrame:[[spriteNWalkUp frames] objectAtIndex:0]];
                }
                else if (self.sprite118.orientation == 3)
                {
                    [self.sprite118 setDisplayFrame:[[spriteNWalkRight frames] objectAtIndex:0]];
                }
                else
                {
                    [self.sprite118 setDisplayFrame:[[spriteNWalkLeft frames] objectAtIndex:0]];
                }
                
                
                [self goText:5011];
                return;
            }
            NSString *sprite119Interact = [properties valueForKey:@"sprite119IsHere"];
            if (sprite119Interact && [sprite119Interact compare:@"true"] == NSOrderedSame)
            {
                self.sprite119.orientation = oppOrientation;
                
                if (self.sprite119.orientation == 1)
                {
                    [self.sprite119 setDisplayFrame:[[spriteCWalkDown frames] objectAtIndex:0]];
                }
                else if (self.sprite119.orientation == 2)
                {
                    [self.sprite119 setDisplayFrame:[[spriteCWalkUp frames] objectAtIndex:0]];
                }
                else if (self.sprite119.orientation == 3)
                {
                    [self.sprite119 setDisplayFrame:[[spriteCWalkRight frames] objectAtIndex:0]];
                }
                else
                {
                    [self.sprite119 setDisplayFrame:[[spriteCWalkLeft frames] objectAtIndex:0]];
                }
                
                
                [self goText:5012];
                return;
            }

            
            
            
            
            
            NSString *mapItem25 = [properties valueForKey:@"item25"];
            if (mapItem25 && [mapItem25 compare:@"true"] == NSOrderedSame)
            {
                if (!self.hero.beatIonak)
                    return;
                if (!self.hero.gotItem25)
                {
                    [self goText:5325];
                    return;
                }
                else
                {
                    [self goText:4399];
                    return;
                }
            }
            NSString *mapItem26 = [properties valueForKey:@"item26"];
            if (mapItem26 && [mapItem26 compare:@"true"] == NSOrderedSame)
            {
                
                if (!self.hero.gotItem26)
                {
                    [self goText:5326];
                    return;
                }
                else
                {
                    [self goText:4399];
                    return;
                }
            }
            NSString *mapItem27 = [properties valueForKey:@"item27"];
            if (mapItem27 && [mapItem27 compare:@"true"] == NSOrderedSame)
            {
                
                if (!self.hero.gotItem27)
                {
                    [self goText:5327];
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
                [self goText:5200];
                return;
            }
            NSString *sign32 = [properties valueForKey:@"sign32"];
            if (sign32 && [sign32 compare:@"true"] == NSOrderedSame)
            {
                [self goText:5201];
                return;
            }
            NSString *sign33 = [properties valueForKey:@"sign33"];
            if (sign33 && [sign33 compare:@"true"] == NSOrderedSame)
            {
                [self goText:5202];
                return;
            }
            NSString *sign34 = [properties valueForKey:@"sign34"];
            if (sign34 && [sign34 compare:@"true"] == NSOrderedSame)
            {
                [self goText:5203];
                return;
            }
            NSString *sign35 = [properties valueForKey:@"sign35"];
            if (sign35 && [sign35 compare:@"true"] == NSOrderedSame)
            {
                [self goText:5204];
                return;
            }
            
            
        }
    }
}



-(void)stayAtInn
{
    self.hero.heroCurrentHP = self.hero.heroHP;
    self.hero.gold -= 1;
    self.hero.mapInitMode = 1;
    [self saveHero];
    [SceneManager goPlay:6];
    return;
}




-(void) spriteCycle //should be scheduled for .125 seconds
{
    spriteCycleCount++;
    
    if (spriteCycleCount == 1)
    {
        if (self.hero.beatIonak)
        {
            [self updateSprite111];
        }
        else{
            [self updateSprite119];
        }
    }
    else if (spriteCycleCount == 2)
    {
        [self updateSprite112];
    }
    else if (spriteCycleCount == 3)
    {
        [self updateSprite113];
    }
    else if (spriteCycleCount == 4)
    {
        [self updateSprite114];
    }
    else if (spriteCycleCount == 5)
    {
        [self updateSprite115];
    }
    else if (spriteCycleCount == 6)
    {
        [self updateSprite116];
    }
    else if (spriteCycleCount == 7)
    {
        if (self.hero.beatIonak)
        {
            [self updateSprite117];
        }
    }
    else if (spriteCycleCount == 8)
    {
        if (self.hero.beatIonak)
        {
            [self updateSprite118];
        }
    }
    
    
    if (spriteCycleCount > 8)
    {
        spriteCycleCount = 0;
    }
    return;
}







@end
















