//
//  PlayLayerTwo.m
//  Quest
//
//  Created by Leo Linsky on 12/22/13.
//
//

#import "PlayLayerTwo.h"
#import "SceneManager.h"
#import "HKTMXTiledMap.h"
#import "ItemShopMenu.h"
#import "CCSendMessages.h"

@implementation PlayLayerTwo

@synthesize sprite30,sprite31,sprite32,sprite33,sprite34,sprite35,sprite36,sprite37,sprite38,sprite39,sprite40,sprite41,sprite42,sprite43,sprite44,sprite45,sprite46,sprite47,sprite48,sprite49,sprite50,sprite51,sprite52,sprite53, boss12, item5,item6,item7,item8;

-(id)init
{
    if (self = [super init])
    {
        
        self.theHKMap = [HKTMXTiledMap tiledMapWithTMXFile:@"playlayer2_FINAL3.tmx"];
        [[CCDirector sharedDirector] setProjection:kCCDirectorProjection2D];
        
        
        self.bgLayer = [_theHKMap layerNamed:@"bg1"];
        self.bgLayer.visible = NO;
        
        CCTMXObjectGroup *objects = [_theHKMap objectGroupNamed:@"oj1"];
        
        
        [self addChild:_theHKMap z:-1];
        
        self.hero = [GameSceneManager sharedGameSceneManager].hero;
        
        
        
        //#####################################
        
        {
            //########################################
            //########################################
            
            [[CCSpriteFrameCache sharedSpriteFrameCache] addSpriteFramesWithFile:@"herospriteA_ss.plist"];
            spriteASheet = [CCSpriteBatchNode batchNodeWithFile:@"herospriteA_ss.png"];
            [spriteASheet retain];
            [self addChild:spriteASheet];
            
            NSMutableArray *spriteAWalkAnimFramesLeft = [NSMutableArray array];
            NSMutableArray *spriteAWalkAnimFramesRight = [NSMutableArray array];
            NSMutableArray *spriteAAnimFramesUp = [NSMutableArray array];
            NSMutableArray *spriteAAnimFramesDown = [NSMutableArray array];
            NSMutableArray *spriteAAnimFramesUp2 = [NSMutableArray array];
            NSMutableArray *spriteAAnimFramesDown2 = [NSMutableArray array];
            
            [spriteAWalkAnimFramesLeft addObject:[[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:@"herospriteA05.png"]];
            [spriteAWalkAnimFramesLeft addObject:[[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:@"herospriteA06.png"]];
            [spriteAWalkAnimFramesLeft addObject:[[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:@"herospriteA06.png"]];
            [spriteAWalkAnimFramesLeft addObject:[[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:@"herospriteA06.png"]];
            [spriteAWalkAnimFramesLeft addObject:[[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:@"herospriteA05.png"]];
            spriteAWalkLeft = [CCAnimation animationWithFrames:spriteAWalkAnimFramesLeft delay:0.06f];
            [spriteAWalkLeft retain];
            
            [spriteAWalkAnimFramesRight addObject:[[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:@"herospriteA04.png"]];
            [spriteAWalkAnimFramesRight addObject:[[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:@"herospriteA07.png"]];
            [spriteAWalkAnimFramesRight addObject:[[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:@"herospriteA07.png"]];
            [spriteAWalkAnimFramesRight addObject:[[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:@"herospriteA07.png"]];
            [spriteAWalkAnimFramesRight addObject:[[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:@"herospriteA04.png"]];
            spriteAWalkRight = [CCAnimation animationWithFrames:spriteAWalkAnimFramesRight delay:0.06f];
            [spriteAWalkRight retain];
            
            [spriteAAnimFramesUp addObject:[[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:@"herospriteA08.png"]];
            [spriteAAnimFramesUp addObject:[[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:@"herospriteA09.png"]];
            [spriteAAnimFramesUp addObject:[[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:@"herospriteA09.png"]];
            [spriteAAnimFramesUp addObject:[[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:@"herospriteA09.png"]];
            [spriteAAnimFramesUp addObject:[[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:@"herospriteA08.png"]];
            spriteAWalkUp = [CCAnimation animationWithFrames:spriteAAnimFramesUp delay:0.06f];
            [spriteAWalkUp retain];
            
            [spriteAAnimFramesUp2 addObject:[[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:@"herospriteA08.png"]];
            [spriteAAnimFramesUp2 addObject:[[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:@"herospriteA10.png"]];
            [spriteAAnimFramesUp2 addObject:[[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:@"herospriteA10.png"]];
            [spriteAAnimFramesUp2 addObject:[[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:@"herospriteA10.png"]];
            [spriteAAnimFramesUp2 addObject:[[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:@"herospriteA08.png"]];
            spriteAWalkUp2 = [CCAnimation animationWithFrames:spriteAAnimFramesUp2 delay:0.06f];
            [spriteAWalkUp2 retain];
            
            [spriteAAnimFramesDown addObject:[[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:@"herospriteA01.png"]];
            [spriteAAnimFramesDown addObject:[[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:@"herospriteA02.png"]];
            [spriteAAnimFramesDown addObject:[[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:@"herospriteA02.png"]];
            [spriteAAnimFramesDown addObject:[[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:@"herospriteA02.png"]];
            [spriteAAnimFramesDown addObject:[[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:@"herospriteA01.png"]];
            spriteAWalkDown = [CCAnimation animationWithFrames:spriteAAnimFramesDown delay:0.06f];
            [spriteAWalkDown retain];
            
            [spriteAAnimFramesDown2 addObject:[[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:@"herospriteA01.png"]];
            [spriteAAnimFramesDown2 addObject:[[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:@"herospriteA03.png"]];
            [spriteAAnimFramesDown2 addObject:[[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:@"herospriteA03.png"]];
            [spriteAAnimFramesDown2 addObject:[[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:@"herospriteA03.png"]];
            [spriteAAnimFramesDown2 addObject:[[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:@"herospriteA01.png"]];
            spriteAWalkDown2 = [CCAnimation animationWithFrames:spriteAAnimFramesDown2 delay:0.06f];
            [spriteAWalkDown2 retain];
            
            
            
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
            

            [[CCSpriteFrameCache sharedSpriteFrameCache] addSpriteFramesWithFile:@"herospriteLsheet.plist"];
            spriteLSheet = [CCSpriteBatchNode batchNodeWithFile:@"herospriteLsheet.png"];
            [spriteLSheet retain];
            [self addChild:spriteLSheet];
            
            NSMutableArray *spriteLWalkAnimFramesLeft = [NSMutableArray array];
            NSMutableArray *spriteLWalkAnimFramesRight = [NSMutableArray array];
            NSMutableArray *spriteLAnimFramesUp = [NSMutableArray array];
            NSMutableArray *spriteLAnimFramesDown = [NSMutableArray array];
            NSMutableArray *spriteLAnimFramesUp2 = [NSMutableArray array];
            NSMutableArray *spriteLAnimFramesDown2 = [NSMutableArray array];
            
            [spriteLWalkAnimFramesLeft addObject:[[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:@"herospriteL05.png"]];
            [spriteLWalkAnimFramesLeft addObject:[[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:@"herospriteL06.png"]];
            [spriteLWalkAnimFramesLeft addObject:[[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:@"herospriteL06.png"]];
            [spriteLWalkAnimFramesLeft addObject:[[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:@"herospriteL06.png"]];
            [spriteLWalkAnimFramesLeft addObject:[[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:@"herospriteL05.png"]];
            spriteLWalkLeft = [CCAnimation animationWithFrames:spriteLWalkAnimFramesLeft delay:0.06f];
            [spriteLWalkLeft retain];
            
            [spriteLWalkAnimFramesRight addObject:[[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:@"herospriteL04.png"]];
            [spriteLWalkAnimFramesRight addObject:[[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:@"herospriteL07.png"]];
            [spriteLWalkAnimFramesRight addObject:[[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:@"herospriteL07.png"]];
            [spriteLWalkAnimFramesRight addObject:[[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:@"herospriteL07.png"]];
            [spriteLWalkAnimFramesRight addObject:[[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:@"herospriteL04.png"]];
            spriteLWalkRight = [CCAnimation animationWithFrames:spriteLWalkAnimFramesRight delay:0.06f];
            [spriteLWalkRight retain];
            
            [spriteLAnimFramesUp addObject:[[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:@"herospriteL08.png"]];
            [spriteLAnimFramesUp addObject:[[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:@"herospriteL09.png"]];
            [spriteLAnimFramesUp addObject:[[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:@"herospriteL09.png"]];
            [spriteLAnimFramesUp addObject:[[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:@"herospriteL09.png"]];
            [spriteLAnimFramesUp addObject:[[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:@"herospriteL08.png"]];
            spriteLWalkUp = [CCAnimation animationWithFrames:spriteLAnimFramesUp delay:0.06f];
            [spriteLWalkUp retain];
            
            [spriteLAnimFramesUp2 addObject:[[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:@"herospriteL08.png"]];
            [spriteLAnimFramesUp2 addObject:[[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:@"herospriteL10.png"]];
            [spriteLAnimFramesUp2 addObject:[[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:@"herospriteL10.png"]];
            [spriteLAnimFramesUp2 addObject:[[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:@"herospriteL10.png"]];
            [spriteLAnimFramesUp2 addObject:[[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:@"herospriteL08.png"]];
            spriteLWalkUp2 = [CCAnimation animationWithFrames:spriteLAnimFramesUp2 delay:0.06f];
            [spriteLWalkUp2 retain];
            
            [spriteLAnimFramesDown addObject:[[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:@"herospriteL01.png"]];
            [spriteLAnimFramesDown addObject:[[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:@"herospriteL02.png"]];
            [spriteLAnimFramesDown addObject:[[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:@"herospriteL02.png"]];
            [spriteLAnimFramesDown addObject:[[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:@"herospriteL02.png"]];
            [spriteLAnimFramesDown addObject:[[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:@"herospriteL01.png"]];
            spriteLWalkDown = [CCAnimation animationWithFrames:spriteLAnimFramesDown delay:0.06f];
            [spriteLWalkDown retain];
            
            [spriteLAnimFramesDown2 addObject:[[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:@"herospriteL01.png"]];
            [spriteLAnimFramesDown2 addObject:[[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:@"herospriteL03.png"]];
            [spriteLAnimFramesDown2 addObject:[[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:@"herospriteL03.png"]];
            [spriteLAnimFramesDown2 addObject:[[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:@"herospriteL03.png"]];
            [spriteLAnimFramesDown2 addObject:[[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:@"herospriteL01.png"]];
            spriteLWalkDown2 = [CCAnimation animationWithFrames:spriteLAnimFramesDown2 delay:0.06f];
            [spriteLWalkDown2 retain];
            

            [[CCSpriteFrameCache sharedSpriteFrameCache] addSpriteFramesWithFile:@"herospriteMsheet.plist"];
            spriteMSheet = [CCSpriteBatchNode batchNodeWithFile:@"herospriteMsheet.png"];
            [spriteMSheet retain];
            [self addChild:spriteMSheet];
            
            NSMutableArray *spriteMWalkAnimFramesLeft = [NSMutableArray array];
            NSMutableArray *spriteMWalkAnimFramesRight = [NSMutableArray array];
            NSMutableArray *spriteMAnimFramesUp = [NSMutableArray array];
            NSMutableArray *spriteMAnimFramesDown = [NSMutableArray array];
            NSMutableArray *spriteMAnimFramesUp2 = [NSMutableArray array];
            NSMutableArray *spriteMAnimFramesDown2 = [NSMutableArray array];
            
            [spriteMWalkAnimFramesLeft addObject:[[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:@"herospriteM05.png"]];
            [spriteMWalkAnimFramesLeft addObject:[[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:@"herospriteM06.png"]];
            [spriteMWalkAnimFramesLeft addObject:[[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:@"herospriteM06.png"]];
            [spriteMWalkAnimFramesLeft addObject:[[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:@"herospriteM06.png"]];
            [spriteMWalkAnimFramesLeft addObject:[[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:@"herospriteM05.png"]];
            spriteMWalkLeft = [CCAnimation animationWithFrames:spriteMWalkAnimFramesLeft delay:0.06f];
            [spriteMWalkLeft retain];
            
            [spriteMWalkAnimFramesRight addObject:[[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:@"herospriteM04.png"]];
            [spriteMWalkAnimFramesRight addObject:[[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:@"herospriteM07.png"]];
            [spriteMWalkAnimFramesRight addObject:[[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:@"herospriteM07.png"]];
            [spriteMWalkAnimFramesRight addObject:[[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:@"herospriteM07.png"]];
            [spriteMWalkAnimFramesRight addObject:[[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:@"herospriteM04.png"]];
            spriteMWalkRight = [CCAnimation animationWithFrames:spriteMWalkAnimFramesRight delay:0.06f];
            [spriteMWalkRight retain];
            
            [spriteMAnimFramesUp addObject:[[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:@"herospriteM08.png"]];
            [spriteMAnimFramesUp addObject:[[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:@"herospriteM09.png"]];
            [spriteMAnimFramesUp addObject:[[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:@"herospriteM09.png"]];
            [spriteMAnimFramesUp addObject:[[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:@"herospriteM09.png"]];
            [spriteMAnimFramesUp addObject:[[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:@"herospriteM08.png"]];
            spriteMWalkUp = [CCAnimation animationWithFrames:spriteMAnimFramesUp delay:0.06f];
            [spriteMWalkUp retain];
            
            [spriteMAnimFramesUp2 addObject:[[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:@"herospriteM08.png"]];
            [spriteMAnimFramesUp2 addObject:[[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:@"herospriteM10.png"]];
            [spriteMAnimFramesUp2 addObject:[[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:@"herospriteM10.png"]];
            [spriteMAnimFramesUp2 addObject:[[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:@"herospriteM10.png"]];
            [spriteMAnimFramesUp2 addObject:[[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:@"herospriteM08.png"]];
            spriteMWalkUp2 = [CCAnimation animationWithFrames:spriteMAnimFramesUp2 delay:0.06f];
            [spriteMWalkUp2 retain];
            
            [spriteMAnimFramesDown addObject:[[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:@"herospriteM01.png"]];
            [spriteMAnimFramesDown addObject:[[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:@"herospriteM02.png"]];
            [spriteMAnimFramesDown addObject:[[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:@"herospriteM02.png"]];
            [spriteMAnimFramesDown addObject:[[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:@"herospriteM02.png"]];
            [spriteMAnimFramesDown addObject:[[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:@"herospriteM01.png"]];
            spriteMWalkDown = [CCAnimation animationWithFrames:spriteMAnimFramesDown delay:0.06f];
            [spriteMWalkDown retain];
            
            [spriteMAnimFramesDown2 addObject:[[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:@"herospriteM01.png"]];
            [spriteMAnimFramesDown2 addObject:[[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:@"herospriteM03.png"]];
            [spriteMAnimFramesDown2 addObject:[[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:@"herospriteM03.png"]];
            [spriteMAnimFramesDown2 addObject:[[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:@"herospriteM03.png"]];
            [spriteMAnimFramesDown2 addObject:[[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:@"herospriteM01.png"]];
            spriteMWalkDown2 = [CCAnimation animationWithFrames:spriteMAnimFramesDown2 delay:0.06f];
            [spriteMWalkDown2 retain];
            

            [[CCSpriteFrameCache sharedSpriteFrameCache] addSpriteFramesWithFile:@"herospriteOsheet.plist"];
            spriteOSheet = [CCSpriteBatchNode batchNodeWithFile:@"herospriteOsheet.png"];
            [spriteOSheet retain];
            [self addChild:spriteOSheet];
            
            NSMutableArray *spriteOWalkAnimFramesLeft = [NSMutableArray array];
            NSMutableArray *spriteOWalkAnimFramesRight = [NSMutableArray array];
            NSMutableArray *spriteOAnimFramesUp = [NSMutableArray array];
            NSMutableArray *spriteOAnimFramesDown = [NSMutableArray array];
            NSMutableArray *spriteOAnimFramesUp2 = [NSMutableArray array];
            NSMutableArray *spriteOAnimFramesDown2 = [NSMutableArray array];
            
            [spriteOWalkAnimFramesLeft addObject:[[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:@"herospriteO05.png"]];
            [spriteOWalkAnimFramesLeft addObject:[[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:@"herospriteO06.png"]];
            [spriteOWalkAnimFramesLeft addObject:[[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:@"herospriteO06.png"]];
            [spriteOWalkAnimFramesLeft addObject:[[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:@"herospriteO06.png"]];
            [spriteOWalkAnimFramesLeft addObject:[[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:@"herospriteO05.png"]];
            spriteOWalkLeft = [CCAnimation animationWithFrames:spriteOWalkAnimFramesLeft delay:0.06f];
            [spriteOWalkLeft retain];
            
            [spriteOWalkAnimFramesRight addObject:[[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:@"herospriteO04.png"]];
            [spriteOWalkAnimFramesRight addObject:[[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:@"herospriteO07.png"]];
            [spriteOWalkAnimFramesRight addObject:[[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:@"herospriteO07.png"]];
            [spriteOWalkAnimFramesRight addObject:[[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:@"herospriteO07.png"]];
            [spriteOWalkAnimFramesRight addObject:[[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:@"herospriteO04.png"]];
            spriteOWalkRight = [CCAnimation animationWithFrames:spriteOWalkAnimFramesRight delay:0.06f];
            [spriteOWalkRight retain];
            
            [spriteOAnimFramesUp addObject:[[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:@"herospriteO08.png"]];
            [spriteOAnimFramesUp addObject:[[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:@"herospriteO09.png"]];
            [spriteOAnimFramesUp addObject:[[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:@"herospriteO09.png"]];
            [spriteOAnimFramesUp addObject:[[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:@"herospriteO09.png"]];
            [spriteOAnimFramesUp addObject:[[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:@"herospriteO08.png"]];
            spriteOWalkUp = [CCAnimation animationWithFrames:spriteOAnimFramesUp delay:0.06f];
            [spriteOWalkUp retain];
            
            [spriteOAnimFramesUp2 addObject:[[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:@"herospriteO08.png"]];
            [spriteOAnimFramesUp2 addObject:[[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:@"herospriteO10.png"]];
            [spriteOAnimFramesUp2 addObject:[[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:@"herospriteO10.png"]];
            [spriteOAnimFramesUp2 addObject:[[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:@"herospriteO10.png"]];
            [spriteOAnimFramesUp2 addObject:[[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:@"herospriteO08.png"]];
            spriteOWalkUp2 = [CCAnimation animationWithFrames:spriteOAnimFramesUp2 delay:0.06f];
            [spriteOWalkUp2 retain];
            
            [spriteOAnimFramesDown addObject:[[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:@"herospriteO01.png"]];
            [spriteOAnimFramesDown addObject:[[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:@"herospriteO02.png"]];
            [spriteOAnimFramesDown addObject:[[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:@"herospriteO02.png"]];
            [spriteOAnimFramesDown addObject:[[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:@"herospriteO02.png"]];
            [spriteOAnimFramesDown addObject:[[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:@"herospriteO01.png"]];
            spriteOWalkDown = [CCAnimation animationWithFrames:spriteOAnimFramesDown delay:0.06f];
            [spriteOWalkDown retain];
            
            [spriteOAnimFramesDown2 addObject:[[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:@"herospriteO01.png"]];
            [spriteOAnimFramesDown2 addObject:[[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:@"herospriteO03.png"]];
            [spriteOAnimFramesDown2 addObject:[[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:@"herospriteO03.png"]];
            [spriteOAnimFramesDown2 addObject:[[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:@"herospriteO03.png"]];
            [spriteOAnimFramesDown2 addObject:[[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:@"herospriteO01.png"]];
            spriteOWalkDown2 = [CCAnimation animationWithFrames:spriteOAnimFramesDown2 delay:0.06f];
            [spriteOWalkDown2 retain];
            
            
            
            
            [[CCSpriteFrameCache sharedSpriteFrameCache] addSpriteFramesWithFile:@"herospriteQsheet.plist"];
            spriteQSheet = [CCSpriteBatchNode batchNodeWithFile:@"herospriteQsheet.png"];
            [spriteQSheet retain];
            [self addChild:spriteQSheet];
            
            NSMutableArray *spriteQWalkAnimFramesLeft = [NSMutableArray array];
            NSMutableArray *spriteQWalkAnimFramesRight = [NSMutableArray array];
            NSMutableArray *spriteQAnimFramesUp = [NSMutableArray array];
            NSMutableArray *spriteQAnimFramesDown = [NSMutableArray array];
            NSMutableArray *spriteQAnimFramesUp2 = [NSMutableArray array];
            NSMutableArray *spriteQAnimFramesDown2 = [NSMutableArray array];
            
            [spriteQWalkAnimFramesLeft addObject:[[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:@"herospriteQ05.png"]];
            [spriteQWalkAnimFramesLeft addObject:[[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:@"herospriteQ06.png"]];
            [spriteQWalkAnimFramesLeft addObject:[[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:@"herospriteQ06.png"]];
            [spriteQWalkAnimFramesLeft addObject:[[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:@"herospriteQ06.png"]];
            [spriteQWalkAnimFramesLeft addObject:[[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:@"herospriteQ05.png"]];
            spriteQWalkLeft = [CCAnimation animationWithFrames:spriteQWalkAnimFramesLeft delay:0.06f];
            [spriteQWalkLeft retain];
            
            [spriteQWalkAnimFramesRight addObject:[[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:@"herospriteQ04.png"]];
            [spriteQWalkAnimFramesRight addObject:[[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:@"herospriteQ07.png"]];
            [spriteQWalkAnimFramesRight addObject:[[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:@"herospriteQ07.png"]];
            [spriteQWalkAnimFramesRight addObject:[[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:@"herospriteQ07.png"]];
            [spriteQWalkAnimFramesRight addObject:[[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:@"herospriteQ04.png"]];
            spriteQWalkRight = [CCAnimation animationWithFrames:spriteQWalkAnimFramesRight delay:0.06f];
            [spriteQWalkRight retain];
            
            [spriteQAnimFramesUp addObject:[[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:@"herospriteQ08.png"]];
            [spriteQAnimFramesUp addObject:[[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:@"herospriteQ09.png"]];
            [spriteQAnimFramesUp addObject:[[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:@"herospriteQ09.png"]];
            [spriteQAnimFramesUp addObject:[[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:@"herospriteQ09.png"]];
            [spriteQAnimFramesUp addObject:[[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:@"herospriteQ08.png"]];
            spriteQWalkUp = [CCAnimation animationWithFrames:spriteQAnimFramesUp delay:0.06f];
            [spriteQWalkUp retain];
            
            [spriteQAnimFramesUp2 addObject:[[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:@"herospriteQ08.png"]];
            [spriteQAnimFramesUp2 addObject:[[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:@"herospriteQ10.png"]];
            [spriteQAnimFramesUp2 addObject:[[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:@"herospriteQ10.png"]];
            [spriteQAnimFramesUp2 addObject:[[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:@"herospriteQ10.png"]];
            [spriteQAnimFramesUp2 addObject:[[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:@"herospriteQ08.png"]];
            spriteQWalkUp2 = [CCAnimation animationWithFrames:spriteQAnimFramesUp2 delay:0.06f];
            [spriteQWalkUp2 retain];
            
            [spriteQAnimFramesDown addObject:[[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:@"herospriteQ01.png"]];
            [spriteQAnimFramesDown addObject:[[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:@"herospriteQ02.png"]];
            [spriteQAnimFramesDown addObject:[[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:@"herospriteQ02.png"]];
            [spriteQAnimFramesDown addObject:[[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:@"herospriteQ02.png"]];
            [spriteQAnimFramesDown addObject:[[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:@"herospriteQ01.png"]];
            spriteQWalkDown = [CCAnimation animationWithFrames:spriteQAnimFramesDown delay:0.06f];
            [spriteQWalkDown retain];
            
            [spriteQAnimFramesDown2 addObject:[[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:@"herospriteQ01.png"]];
            [spriteQAnimFramesDown2 addObject:[[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:@"herospriteQ03.png"]];
            [spriteQAnimFramesDown2 addObject:[[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:@"herospriteQ03.png"]];
            [spriteQAnimFramesDown2 addObject:[[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:@"herospriteQ03.png"]];
            [spriteQAnimFramesDown2 addObject:[[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:@"herospriteQ01.png"]];
            spriteQWalkDown2 = [CCAnimation animationWithFrames:spriteQAnimFramesDown2 delay:0.06f];
            [spriteQWalkDown2 retain];
            
            
            
            [[CCSpriteFrameCache sharedSpriteFrameCache] addSpriteFramesWithFile:@"herospriteRsheet.plist"];
            spriteRSheet = [CCSpriteBatchNode batchNodeWithFile:@"herospriteRsheet.png"];
            [spriteRSheet retain];
            [self addChild:spriteRSheet];
            
            NSMutableArray *spriteRWalkAnimFramesLeft = [NSMutableArray array];
            NSMutableArray *spriteRWalkAnimFramesRight = [NSMutableArray array];
            NSMutableArray *spriteRAnimFramesUp = [NSMutableArray array];
            NSMutableArray *spriteRAnimFramesDown = [NSMutableArray array];
            NSMutableArray *spriteRAnimFramesUp2 = [NSMutableArray array];
            NSMutableArray *spriteRAnimFramesDown2 = [NSMutableArray array];
            
            [spriteRWalkAnimFramesLeft addObject:[[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:@"herospriteR05.png"]];
            [spriteRWalkAnimFramesLeft addObject:[[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:@"herospriteR06.png"]];
            [spriteRWalkAnimFramesLeft addObject:[[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:@"herospriteR06.png"]];
            [spriteRWalkAnimFramesLeft addObject:[[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:@"herospriteR06.png"]];
            [spriteRWalkAnimFramesLeft addObject:[[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:@"herospriteR05.png"]];
            spriteRWalkLeft = [CCAnimation animationWithFrames:spriteRWalkAnimFramesLeft delay:0.06f];
            [spriteRWalkLeft retain];
            
            [spriteRWalkAnimFramesRight addObject:[[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:@"herospriteR04.png"]];
            [spriteRWalkAnimFramesRight addObject:[[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:@"herospriteR07.png"]];
            [spriteRWalkAnimFramesRight addObject:[[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:@"herospriteR07.png"]];
            [spriteRWalkAnimFramesRight addObject:[[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:@"herospriteR07.png"]];
            [spriteRWalkAnimFramesRight addObject:[[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:@"herospriteR04.png"]];
            spriteRWalkRight = [CCAnimation animationWithFrames:spriteRWalkAnimFramesRight delay:0.06f];
            [spriteRWalkRight retain];
            
            [spriteRAnimFramesUp addObject:[[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:@"herospriteR08.png"]];
            [spriteRAnimFramesUp addObject:[[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:@"herospriteR09.png"]];
            [spriteRAnimFramesUp addObject:[[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:@"herospriteR09.png"]];
            [spriteRAnimFramesUp addObject:[[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:@"herospriteR09.png"]];
            [spriteRAnimFramesUp addObject:[[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:@"herospriteR08.png"]];
            spriteRWalkUp = [CCAnimation animationWithFrames:spriteRAnimFramesUp delay:0.06f];
            [spriteRWalkUp retain];
            
            [spriteRAnimFramesUp2 addObject:[[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:@"herospriteR08.png"]];
            [spriteRAnimFramesUp2 addObject:[[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:@"herospriteR10.png"]];
            [spriteRAnimFramesUp2 addObject:[[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:@"herospriteR10.png"]];
            [spriteRAnimFramesUp2 addObject:[[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:@"herospriteR10.png"]];
            [spriteRAnimFramesUp2 addObject:[[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:@"herospriteR08.png"]];
            spriteRWalkUp2 = [CCAnimation animationWithFrames:spriteRAnimFramesUp2 delay:0.06f];
            [spriteRWalkUp2 retain];
            
            [spriteRAnimFramesDown addObject:[[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:@"herospriteR01.png"]];
            [spriteRAnimFramesDown addObject:[[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:@"herospriteR02.png"]];
            [spriteRAnimFramesDown addObject:[[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:@"herospriteR02.png"]];
            [spriteRAnimFramesDown addObject:[[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:@"herospriteR02.png"]];
            [spriteRAnimFramesDown addObject:[[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:@"herospriteR01.png"]];
            spriteRWalkDown = [CCAnimation animationWithFrames:spriteRAnimFramesDown delay:0.06f];
            [spriteRWalkDown retain];
            
            [spriteRAnimFramesDown2 addObject:[[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:@"herospriteR01.png"]];
            [spriteRAnimFramesDown2 addObject:[[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:@"herospriteR03.png"]];
            [spriteRAnimFramesDown2 addObject:[[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:@"herospriteR03.png"]];
            [spriteRAnimFramesDown2 addObject:[[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:@"herospriteR03.png"]];
            [spriteRAnimFramesDown2 addObject:[[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:@"herospriteR01.png"]];
            spriteRWalkDown2 = [CCAnimation animationWithFrames:spriteRAnimFramesDown2 delay:0.06f];
            [spriteRWalkDown2 retain];
            

            
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
            

            
            [[CCSpriteFrameCache sharedSpriteFrameCache] addSpriteFramesWithFile:@"herospriteVsheet.plist"];
            spriteVSheet = [CCSpriteBatchNode batchNodeWithFile:@"herospriteVsheet.png"];
            [spriteVSheet retain];
            [self addChild:spriteVSheet];
            
            NSMutableArray *spriteVWalkAnimFramesLeft = [NSMutableArray array];
            NSMutableArray *spriteVWalkAnimFramesRight = [NSMutableArray array];
            NSMutableArray *spriteVAnimFramesUp = [NSMutableArray array];
            NSMutableArray *spriteVAnimFramesDown = [NSMutableArray array];
            NSMutableArray *spriteVAnimFramesUp2 = [NSMutableArray array];
            NSMutableArray *spriteVAnimFramesDown2 = [NSMutableArray array];
            
            [spriteVWalkAnimFramesLeft addObject:[[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:@"herospriteV05.png"]];
            [spriteVWalkAnimFramesLeft addObject:[[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:@"herospriteV06.png"]];
            [spriteVWalkAnimFramesLeft addObject:[[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:@"herospriteV06.png"]];
            [spriteVWalkAnimFramesLeft addObject:[[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:@"herospriteV06.png"]];
            [spriteVWalkAnimFramesLeft addObject:[[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:@"herospriteV05.png"]];
            spriteVWalkLeft = [CCAnimation animationWithFrames:spriteVWalkAnimFramesLeft delay:0.06f];
            [spriteVWalkLeft retain];
            
            [spriteVWalkAnimFramesRight addObject:[[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:@"herospriteV04.png"]];
            [spriteVWalkAnimFramesRight addObject:[[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:@"herospriteV07.png"]];
            [spriteVWalkAnimFramesRight addObject:[[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:@"herospriteV07.png"]];
            [spriteVWalkAnimFramesRight addObject:[[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:@"herospriteV07.png"]];
            [spriteVWalkAnimFramesRight addObject:[[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:@"herospriteV04.png"]];
            spriteVWalkRight = [CCAnimation animationWithFrames:spriteVWalkAnimFramesRight delay:0.06f];
            [spriteVWalkRight retain];
            
            [spriteVAnimFramesUp addObject:[[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:@"herospriteV08.png"]];
            [spriteVAnimFramesUp addObject:[[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:@"herospriteV09.png"]];
            [spriteVAnimFramesUp addObject:[[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:@"herospriteV09.png"]];
            [spriteVAnimFramesUp addObject:[[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:@"herospriteV09.png"]];
            [spriteVAnimFramesUp addObject:[[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:@"herospriteV08.png"]];
            spriteVWalkUp = [CCAnimation animationWithFrames:spriteVAnimFramesUp delay:0.06f];
            [spriteVWalkUp retain];
            
            [spriteVAnimFramesUp2 addObject:[[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:@"herospriteV08.png"]];
            [spriteVAnimFramesUp2 addObject:[[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:@"herospriteV10.png"]];
            [spriteVAnimFramesUp2 addObject:[[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:@"herospriteV10.png"]];
            [spriteVAnimFramesUp2 addObject:[[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:@"herospriteV10.png"]];
            [spriteVAnimFramesUp2 addObject:[[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:@"herospriteV08.png"]];
            spriteVWalkUp2 = [CCAnimation animationWithFrames:spriteVAnimFramesUp2 delay:0.06f];
            [spriteVWalkUp2 retain];
            
            [spriteVAnimFramesDown addObject:[[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:@"herospriteV01.png"]];
            [spriteVAnimFramesDown addObject:[[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:@"herospriteV02.png"]];
            [spriteVAnimFramesDown addObject:[[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:@"herospriteV02.png"]];
            [spriteVAnimFramesDown addObject:[[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:@"herospriteV02.png"]];
            [spriteVAnimFramesDown addObject:[[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:@"herospriteV01.png"]];
            spriteVWalkDown = [CCAnimation animationWithFrames:spriteVAnimFramesDown delay:0.06f];
            [spriteVWalkDown retain];
            
            [spriteVAnimFramesDown2 addObject:[[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:@"herospriteV01.png"]];
            [spriteVAnimFramesDown2 addObject:[[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:@"herospriteV03.png"]];
            [spriteVAnimFramesDown2 addObject:[[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:@"herospriteV03.png"]];
            [spriteVAnimFramesDown2 addObject:[[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:@"herospriteV03.png"]];
            [spriteVAnimFramesDown2 addObject:[[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:@"herospriteV01.png"]];
            spriteVWalkDown2 = [CCAnimation animationWithFrames:spriteVAnimFramesDown2 delay:0.06f];
            [spriteVWalkDown2 retain];

            
            

            [[CCSpriteFrameCache sharedSpriteFrameCache] addSpriteFramesWithFile:@"herospriteWsheet.plist"];
            spriteWSheet = [CCSpriteBatchNode batchNodeWithFile:@"herospriteWsheet.png"];
            [spriteWSheet retain];
            [self addChild:spriteWSheet];
            
            NSMutableArray *spriteWWalkAnimFramesLeft = [NSMutableArray array];
            NSMutableArray *spriteWWalkAnimFramesRight = [NSMutableArray array];
            NSMutableArray *spriteWAnimFramesUp = [NSMutableArray array];
            NSMutableArray *spriteWAnimFramesDown = [NSMutableArray array];
            NSMutableArray *spriteWAnimFramesUp2 = [NSMutableArray array];
            NSMutableArray *spriteWAnimFramesDown2 = [NSMutableArray array];
            
            [spriteWWalkAnimFramesLeft addObject:[[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:@"herospriteW05.png"]];
            [spriteWWalkAnimFramesLeft addObject:[[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:@"herospriteW06.png"]];
            [spriteWWalkAnimFramesLeft addObject:[[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:@"herospriteW06.png"]];
            [spriteWWalkAnimFramesLeft addObject:[[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:@"herospriteW06.png"]];
            [spriteWWalkAnimFramesLeft addObject:[[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:@"herospriteW05.png"]];
            spriteWWalkLeft = [CCAnimation animationWithFrames:spriteWWalkAnimFramesLeft delay:0.06f];
            [spriteWWalkLeft retain];
            
            [spriteWWalkAnimFramesRight addObject:[[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:@"herospriteW04.png"]];
            [spriteWWalkAnimFramesRight addObject:[[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:@"herospriteW07.png"]];
            [spriteWWalkAnimFramesRight addObject:[[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:@"herospriteW07.png"]];
            [spriteWWalkAnimFramesRight addObject:[[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:@"herospriteW07.png"]];
            [spriteWWalkAnimFramesRight addObject:[[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:@"herospriteW04.png"]];
            spriteWWalkRight = [CCAnimation animationWithFrames:spriteWWalkAnimFramesRight delay:0.06f];
            [spriteWWalkRight retain];
            
            [spriteWAnimFramesUp addObject:[[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:@"herospriteW08.png"]];
            [spriteWAnimFramesUp addObject:[[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:@"herospriteW09.png"]];
            [spriteWAnimFramesUp addObject:[[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:@"herospriteW09.png"]];
            [spriteWAnimFramesUp addObject:[[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:@"herospriteW09.png"]];
            [spriteWAnimFramesUp addObject:[[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:@"herospriteW08.png"]];
            spriteWWalkUp = [CCAnimation animationWithFrames:spriteWAnimFramesUp delay:0.06f];
            [spriteWWalkUp retain];
            
            [spriteWAnimFramesUp2 addObject:[[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:@"herospriteW08.png"]];
            [spriteWAnimFramesUp2 addObject:[[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:@"herospriteW10.png"]];
            [spriteWAnimFramesUp2 addObject:[[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:@"herospriteW10.png"]];
            [spriteWAnimFramesUp2 addObject:[[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:@"herospriteW10.png"]];
            [spriteWAnimFramesUp2 addObject:[[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:@"herospriteW08.png"]];
            spriteWWalkUp2 = [CCAnimation animationWithFrames:spriteWAnimFramesUp2 delay:0.06f];
            [spriteWWalkUp2 retain];
            
            [spriteWAnimFramesDown addObject:[[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:@"herospriteW01.png"]];
            [spriteWAnimFramesDown addObject:[[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:@"herospriteW02.png"]];
            [spriteWAnimFramesDown addObject:[[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:@"herospriteW02.png"]];
            [spriteWAnimFramesDown addObject:[[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:@"herospriteW02.png"]];
            [spriteWAnimFramesDown addObject:[[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:@"herospriteW01.png"]];
            spriteWWalkDown = [CCAnimation animationWithFrames:spriteWAnimFramesDown delay:0.06f];
            [spriteWWalkDown retain];
            
            [spriteWAnimFramesDown2 addObject:[[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:@"herospriteW01.png"]];
            [spriteWAnimFramesDown2 addObject:[[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:@"herospriteW03.png"]];
            [spriteWAnimFramesDown2 addObject:[[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:@"herospriteW03.png"]];
            [spriteWAnimFramesDown2 addObject:[[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:@"herospriteW03.png"]];
            [spriteWAnimFramesDown2 addObject:[[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:@"herospriteW01.png"]];
            spriteWWalkDown2 = [CCAnimation animationWithFrames:spriteWAnimFramesDown2 delay:0.06f];
            [spriteWWalkDown2 retain];
            
            [[CCSpriteFrameCache sharedSpriteFrameCache] addSpriteFramesWithFile:@"herospriteXsheet.plist"];
            spriteXSheet = [CCSpriteBatchNode batchNodeWithFile:@"herospriteXsheet.png"];
            [spriteXSheet retain];
            [self addChild:spriteXSheet];
            
            NSMutableArray *spriteXWalkAnimFramesLeft = [NSMutableArray array];
            NSMutableArray *spriteXWalkAnimFramesRight = [NSMutableArray array];
            NSMutableArray *spriteXAnimFramesUp = [NSMutableArray array];
            NSMutableArray *spriteXAnimFramesDown = [NSMutableArray array];
            NSMutableArray *spriteXAnimFramesUp2 = [NSMutableArray array];
            NSMutableArray *spriteXAnimFramesDown2 = [NSMutableArray array];
            
            [spriteXWalkAnimFramesLeft addObject:[[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:@"herospriteX05.png"]];
            [spriteXWalkAnimFramesLeft addObject:[[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:@"herospriteX06.png"]];
            [spriteXWalkAnimFramesLeft addObject:[[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:@"herospriteX06.png"]];
            [spriteXWalkAnimFramesLeft addObject:[[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:@"herospriteX06.png"]];
            [spriteXWalkAnimFramesLeft addObject:[[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:@"herospriteX05.png"]];
            spriteXWalkLeft = [CCAnimation animationWithFrames:spriteXWalkAnimFramesLeft delay:0.06f];
            [spriteXWalkLeft retain];
            
            [spriteXWalkAnimFramesRight addObject:[[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:@"herospriteX04.png"]];
            [spriteXWalkAnimFramesRight addObject:[[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:@"herospriteX07.png"]];
            [spriteXWalkAnimFramesRight addObject:[[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:@"herospriteX07.png"]];
            [spriteXWalkAnimFramesRight addObject:[[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:@"herospriteX07.png"]];
            [spriteXWalkAnimFramesRight addObject:[[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:@"herospriteX04.png"]];
            spriteXWalkRight = [CCAnimation animationWithFrames:spriteXWalkAnimFramesRight delay:0.06f];
            [spriteXWalkRight retain];
            
            [spriteXAnimFramesUp addObject:[[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:@"herospriteX08.png"]];
            [spriteXAnimFramesUp addObject:[[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:@"herospriteX09.png"]];
            [spriteXAnimFramesUp addObject:[[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:@"herospriteX09.png"]];
            [spriteXAnimFramesUp addObject:[[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:@"herospriteX09.png"]];
            [spriteXAnimFramesUp addObject:[[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:@"herospriteX08.png"]];
            spriteXWalkUp = [CCAnimation animationWithFrames:spriteXAnimFramesUp delay:0.06f];
            [spriteXWalkUp retain];
            
            [spriteXAnimFramesUp2 addObject:[[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:@"herospriteX08.png"]];
            [spriteXAnimFramesUp2 addObject:[[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:@"herospriteX10.png"]];
            [spriteXAnimFramesUp2 addObject:[[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:@"herospriteX10.png"]];
            [spriteXAnimFramesUp2 addObject:[[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:@"herospriteX10.png"]];
            [spriteXAnimFramesUp2 addObject:[[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:@"herospriteX08.png"]];
            spriteXWalkUp2 = [CCAnimation animationWithFrames:spriteXAnimFramesUp2 delay:0.06f];
            [spriteXWalkUp2 retain];
            
            [spriteXAnimFramesDown addObject:[[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:@"herospriteX01.png"]];
            [spriteXAnimFramesDown addObject:[[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:@"herospriteX02.png"]];
            [spriteXAnimFramesDown addObject:[[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:@"herospriteX02.png"]];
            [spriteXAnimFramesDown addObject:[[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:@"herospriteX02.png"]];
            [spriteXAnimFramesDown addObject:[[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:@"herospriteX01.png"]];
            spriteXWalkDown = [CCAnimation animationWithFrames:spriteXAnimFramesDown delay:0.06f];
            [spriteXWalkDown retain];
            
            [spriteXAnimFramesDown2 addObject:[[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:@"herospriteX01.png"]];
            [spriteXAnimFramesDown2 addObject:[[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:@"herospriteX03.png"]];
            [spriteXAnimFramesDown2 addObject:[[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:@"herospriteX03.png"]];
            [spriteXAnimFramesDown2 addObject:[[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:@"herospriteX03.png"]];
            [spriteXAnimFramesDown2 addObject:[[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:@"herospriteX01.png"]];
            spriteXWalkDown2 = [CCAnimation animationWithFrames:spriteXAnimFramesDown2 delay:0.06f];
            [spriteXWalkDown2 retain];
            
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
            
            [[CCSpriteFrameCache sharedSpriteFrameCache] addSpriteFramesWithFile:@"herospriteZsheet.plist"];
            spriteZSheet = [CCSpriteBatchNode batchNodeWithFile:@"herospriteZsheet.png"];
            [spriteZSheet retain];
            [self addChild:spriteZSheet];
            
            NSMutableArray *spriteZWalkAnimFramesLeft = [NSMutableArray array];
            NSMutableArray *spriteZWalkAnimFramesRight = [NSMutableArray array];
            NSMutableArray *spriteZAnimFramesUp = [NSMutableArray array];
            NSMutableArray *spriteZAnimFramesDown = [NSMutableArray array];
            NSMutableArray *spriteZAnimFramesUp2 = [NSMutableArray array];
            NSMutableArray *spriteZAnimFramesDown2 = [NSMutableArray array];
            
            [spriteZWalkAnimFramesLeft addObject:[[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:@"herospriteZ05.png"]];
            [spriteZWalkAnimFramesLeft addObject:[[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:@"herospriteZ06.png"]];
            [spriteZWalkAnimFramesLeft addObject:[[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:@"herospriteZ06.png"]];
            [spriteZWalkAnimFramesLeft addObject:[[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:@"herospriteZ06.png"]];
            [spriteZWalkAnimFramesLeft addObject:[[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:@"herospriteZ05.png"]];
            spriteZWalkLeft = [CCAnimation animationWithFrames:spriteZWalkAnimFramesLeft delay:0.06f];
            [spriteZWalkLeft retain];
            
            [spriteZWalkAnimFramesRight addObject:[[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:@"herospriteZ04.png"]];
            [spriteZWalkAnimFramesRight addObject:[[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:@"herospriteZ07.png"]];
            [spriteZWalkAnimFramesRight addObject:[[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:@"herospriteZ07.png"]];
            [spriteZWalkAnimFramesRight addObject:[[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:@"herospriteZ07.png"]];
            [spriteZWalkAnimFramesRight addObject:[[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:@"herospriteZ04.png"]];
            spriteZWalkRight = [CCAnimation animationWithFrames:spriteZWalkAnimFramesRight delay:0.06f];
            [spriteZWalkRight retain];
            
            [spriteZAnimFramesUp addObject:[[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:@"herospriteZ08.png"]];
            [spriteZAnimFramesUp addObject:[[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:@"herospriteZ09.png"]];
            [spriteZAnimFramesUp addObject:[[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:@"herospriteZ09.png"]];
            [spriteZAnimFramesUp addObject:[[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:@"herospriteZ09.png"]];
            [spriteZAnimFramesUp addObject:[[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:@"herospriteZ08.png"]];
            spriteZWalkUp = [CCAnimation animationWithFrames:spriteZAnimFramesUp delay:0.06f];
            [spriteZWalkUp retain];
            
            [spriteZAnimFramesUp2 addObject:[[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:@"herospriteZ08.png"]];
            [spriteZAnimFramesUp2 addObject:[[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:@"herospriteZ10.png"]];
            [spriteZAnimFramesUp2 addObject:[[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:@"herospriteZ10.png"]];
            [spriteZAnimFramesUp2 addObject:[[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:@"herospriteZ10.png"]];
            [spriteZAnimFramesUp2 addObject:[[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:@"herospriteZ08.png"]];
            spriteZWalkUp2 = [CCAnimation animationWithFrames:spriteZAnimFramesUp2 delay:0.06f];
            [spriteZWalkUp2 retain];
            
            [spriteZAnimFramesDown addObject:[[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:@"herospriteZ01.png"]];
            [spriteZAnimFramesDown addObject:[[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:@"herospriteZ02.png"]];
            [spriteZAnimFramesDown addObject:[[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:@"herospriteZ02.png"]];
            [spriteZAnimFramesDown addObject:[[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:@"herospriteZ02.png"]];
            [spriteZAnimFramesDown addObject:[[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:@"herospriteZ01.png"]];
            spriteZWalkDown = [CCAnimation animationWithFrames:spriteZAnimFramesDown delay:0.06f];
            [spriteZWalkDown retain];
            
            [spriteZAnimFramesDown2 addObject:[[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:@"herospriteZ01.png"]];
            [spriteZAnimFramesDown2 addObject:[[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:@"herospriteZ03.png"]];
            [spriteZAnimFramesDown2 addObject:[[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:@"herospriteZ03.png"]];
            [spriteZAnimFramesDown2 addObject:[[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:@"herospriteZ03.png"]];
            [spriteZAnimFramesDown2 addObject:[[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:@"herospriteZ01.png"]];
            spriteZWalkDown2 = [CCAnimation animationWithFrames:spriteZAnimFramesDown2 delay:0.06f];
            [spriteZWalkDown2 retain];
            
            
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
            
            [[CCSpriteFrameCache sharedSpriteFrameCache] addSpriteFramesWithFile:@"herospriteZBsheet.plist"];
            spriteZBSheet = [CCSpriteBatchNode batchNodeWithFile:@"herospriteZBsheet.png"];
            [spriteZBSheet retain];
            [self addChild:spriteZBSheet];
            
            NSMutableArray *spriteZBWalkAnimFramesLeft = [NSMutableArray array];
            NSMutableArray *spriteZBWalkAnimFramesRight = [NSMutableArray array];
            NSMutableArray *spriteZBAnimFramesUp = [NSMutableArray array];
            NSMutableArray *spriteZBAnimFramesDown = [NSMutableArray array];
            NSMutableArray *spriteZBAnimFramesUp2 = [NSMutableArray array];
            NSMutableArray *spriteZBAnimFramesDown2 = [NSMutableArray array];
            
            [spriteZBWalkAnimFramesLeft addObject:[[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:@"herospriteZB05.png"]];
            [spriteZBWalkAnimFramesLeft addObject:[[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:@"herospriteZB06.png"]];
            [spriteZBWalkAnimFramesLeft addObject:[[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:@"herospriteZB06.png"]];
            [spriteZBWalkAnimFramesLeft addObject:[[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:@"herospriteZB06.png"]];
            [spriteZBWalkAnimFramesLeft addObject:[[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:@"herospriteZB05.png"]];
            spriteZBWalkLeft = [CCAnimation animationWithFrames:spriteZBWalkAnimFramesLeft delay:0.06f];
            [spriteZBWalkLeft retain];
            
            [spriteZBWalkAnimFramesRight addObject:[[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:@"herospriteZB04.png"]];
            [spriteZBWalkAnimFramesRight addObject:[[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:@"herospriteZB07.png"]];
            [spriteZBWalkAnimFramesRight addObject:[[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:@"herospriteZB07.png"]];
            [spriteZBWalkAnimFramesRight addObject:[[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:@"herospriteZB07.png"]];
            [spriteZBWalkAnimFramesRight addObject:[[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:@"herospriteZB04.png"]];
            spriteZBWalkRight = [CCAnimation animationWithFrames:spriteZBWalkAnimFramesRight delay:0.06f];
            [spriteZBWalkRight retain];
            
            [spriteZBAnimFramesUp addObject:[[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:@"herospriteZB08.png"]];
            [spriteZBAnimFramesUp addObject:[[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:@"herospriteZB09.png"]];
            [spriteZBAnimFramesUp addObject:[[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:@"herospriteZB09.png"]];
            [spriteZBAnimFramesUp addObject:[[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:@"herospriteZB09.png"]];
            [spriteZBAnimFramesUp addObject:[[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:@"herospriteZB08.png"]];
            spriteZBWalkUp = [CCAnimation animationWithFrames:spriteZBAnimFramesUp delay:0.06f];
            [spriteZBWalkUp retain];
            
            [spriteZBAnimFramesUp2 addObject:[[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:@"herospriteZB08.png"]];
            [spriteZBAnimFramesUp2 addObject:[[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:@"herospriteZB10.png"]];
            [spriteZBAnimFramesUp2 addObject:[[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:@"herospriteZB10.png"]];
            [spriteZBAnimFramesUp2 addObject:[[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:@"herospriteZB10.png"]];
            [spriteZBAnimFramesUp2 addObject:[[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:@"herospriteZB08.png"]];
            spriteZBWalkUp2 = [CCAnimation animationWithFrames:spriteZBAnimFramesUp2 delay:0.06f];
            [spriteZBWalkUp2 retain];
            
            [spriteZBAnimFramesDown addObject:[[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:@"herospriteZB01.png"]];
            [spriteZBAnimFramesDown addObject:[[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:@"herospriteZB02.png"]];
            [spriteZBAnimFramesDown addObject:[[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:@"herospriteZB02.png"]];
            [spriteZBAnimFramesDown addObject:[[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:@"herospriteZB02.png"]];
            [spriteZBAnimFramesDown addObject:[[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:@"herospriteZB01.png"]];
            spriteZBWalkDown = [CCAnimation animationWithFrames:spriteZBAnimFramesDown delay:0.06f];
            [spriteZBWalkDown retain];
            
            [spriteZBAnimFramesDown2 addObject:[[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:@"herospriteZB01.png"]];
            [spriteZBAnimFramesDown2 addObject:[[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:@"herospriteZB03.png"]];
            [spriteZBAnimFramesDown2 addObject:[[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:@"herospriteZB03.png"]];
            [spriteZBAnimFramesDown2 addObject:[[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:@"herospriteZB03.png"]];
            [spriteZBAnimFramesDown2 addObject:[[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:@"herospriteZB01.png"]];
            spriteZBWalkDown2 = [CCAnimation animationWithFrames:spriteZBAnimFramesDown2 delay:0.06f];
            [spriteZBWalkDown2 retain];
            
            
        }
        
        
        ////////////////////////////////////////////////////////////////////////
        
        
        self.sprite30 = [InteractiveSprite spriteWithSpriteFrameName:@"herospriteA04.png"];
        self.sprite30.spriteCode = 30;
        
        self.sprite30.orientation = 1;
        if (self.hero.sprite30_Orientation)
        {
            self.sprite30.orientation = self.hero.sprite30_Orientation;
        }
        if (self.sprite30.orientation == 1)
        {
            [self.sprite30 setDisplayFrame:[[spriteAWalkDown frames] objectAtIndex:0]];
        }
        else if (self.sprite30.orientation == 2)
        {
            [self.sprite30 setDisplayFrame:[[spriteAWalkUp frames] objectAtIndex:0]];
        }
        else if (self.sprite30.orientation == 3)
        {
            [self.sprite30 setDisplayFrame:[[spriteAWalkRight frames] objectAtIndex:0]];
        }
        else
        {
            [self.sprite30 setDisplayFrame:[[spriteAWalkLeft frames] objectAtIndex:0]];
        }
        
        //[self schedule:@selector(updateSprite30) interval:(2.0f)];
        
        
        if (self.hero.sprite30position.x != 0)
        {
            self.sprite30.position = self.hero.sprite30position;
        }
        else
        {
            NSMutableDictionary *sprite30start = [objects objectNamed:@"spriteStart30"];
            double x1 = [[sprite30start valueForKey:@"x"]floatValue];
            double y1 = [[sprite30start valueForKey:@"y"]floatValue];
            self.sprite30.position = ccp(x1,y1);
        }
        
        
        [self.theHKMap addChild:self.sprite30 z:self.bgLayer.zOrder];
        
        CGPoint tileCoord1 = [self tileCoordForPosition:self.sprite30.position];
        int tileGID1 = [self.bgLayer tileGIDAt:tileCoord1];
        [self.bgLayer removeTileAt:tileCoord1];
        [self.bgLayer setTileGID:(tileGID1 + 1) at:tileCoord1];
        
        ////////////////////////////////////////////////////////////////////////
        
        
        self.sprite31 = [InteractiveSprite spriteWithSpriteFrameName:@"herospriteA04.png"];
        self.sprite31.spriteCode = 31;
        
        self.sprite31.orientation = 2;
        [self.sprite31 setDisplayFrame:[[spriteAWalkUp frames] objectAtIndex:0]];
        
        NSMutableDictionary *sprite31start = [objects objectNamed:@"spriteStart31"];
        double x2 = [[sprite31start valueForKey:@"x"]floatValue];
        double y2 = [[sprite31start valueForKey:@"y"]floatValue];
        self.sprite31.position = ccp(x2,y2);
        
        [self.theHKMap addChild:self.sprite31 z:self.bgLayer.zOrder];
        
        CGPoint tileCoord2 = [self tileCoordForPosition:self.sprite31.position];
        int tileGID2 = [self.bgLayer tileGIDAt:tileCoord2];
        [self.bgLayer removeTileAt:tileCoord2];
        [self.bgLayer setTileGID:(tileGID2 + 2) at:tileCoord2];
        
        ////////////////////////////////////////////////////////////////////////
        
        
        self.sprite32 = [InteractiveSprite spriteWithSpriteFrameName:@"herospriteA04.png"];
        self.sprite32.spriteCode = 32;
        
        self.sprite32.orientation = 3;
        if (self.hero.sprite32_Orientation)
        {
            self.sprite32.orientation = self.hero.sprite32_Orientation;
        }
        if (self.sprite32.orientation == 1)
        {
            [self.sprite32 setDisplayFrame:[[spriteAWalkDown frames] objectAtIndex:0]];
        }
        else if (self.sprite32.orientation == 2)
        {
            [self.sprite32 setDisplayFrame:[[spriteAWalkUp frames] objectAtIndex:0]];
        }
        else if (self.sprite32.orientation == 3)
        {
            [self.sprite32 setDisplayFrame:[[spriteAWalkRight frames] objectAtIndex:0]];
        }
        else
        {
            [self.sprite32 setDisplayFrame:[[spriteAWalkLeft frames] objectAtIndex:0]];
        }
        
        //[self schedule:@selector(updateSprite32) interval:(1.5f)];
        
        if (self.hero.sprite32position.x != 0)
        {
            self.sprite32.position = self.hero.sprite32position;
        }
        else
        {
        NSMutableDictionary *sprite32start = [objects objectNamed:@"spriteStart32"];
        double x3 = [[sprite32start valueForKey:@"x"]floatValue];
        double y3 = [[sprite32start valueForKey:@"y"]floatValue];
        self.sprite32.position = ccp(x3,y3);
        }
        
        [self.theHKMap addChild:self.sprite32 z:self.bgLayer.zOrder];
        
        CGPoint tileCoord3 = [self tileCoordForPosition:self.sprite32.position];
        int tileGID3 = [self.bgLayer tileGIDAt:tileCoord3];
        [self.bgLayer removeTileAt:tileCoord3];
        [self.bgLayer setTileGID:(tileGID3 + 3) at:tileCoord3];
        
        ////////////////////////////////////////////////////////////////////////
        
        self.sprite33 = [InteractiveSprite spriteWithSpriteFrameName:@"herospriteA04.png"];
        self.sprite33.spriteCode = 33;
        
        self.sprite33.orientation = 1;
        if (self.hero.sprite33_Orientation)
        {
            self.sprite33.orientation = self.hero.sprite33_Orientation;
        }
        if (self.sprite33.orientation == 1)
        {
            [self.sprite33 setDisplayFrame:[[spriteAWalkDown frames] objectAtIndex:0]];
        }
        else if (self.sprite33.orientation == 2)
        {
            [self.sprite33 setDisplayFrame:[[spriteAWalkUp frames] objectAtIndex:0]];
        }
        else if (self.sprite33.orientation == 3)
        {
            [self.sprite33 setDisplayFrame:[[spriteAWalkRight frames] objectAtIndex:0]];
        }
        else
        {
            [self.sprite33 setDisplayFrame:[[spriteAWalkLeft frames] objectAtIndex:0]];
        }
        
        //[self schedule:@selector(updateSprite33) interval:(1.5f)];
        
        if (self.hero.sprite33position.x != 0)
        {
            self.sprite33.position = self.hero.sprite33position;
        }
        else
        {
        NSMutableDictionary *sprite33start = [objects objectNamed:@"spriteStart33"];
        double x4 = [[sprite33start valueForKey:@"x"]floatValue];
        double y4 = [[sprite33start valueForKey:@"y"]floatValue];
        self.sprite33.position = ccp(x4,y4);
        }
        
        [self.theHKMap addChild:self.sprite33 z:self.bgLayer.zOrder];
        
        CGPoint tileCoord4 = [self tileCoordForPosition:self.sprite33.position];
        int tileGID4 = [self.bgLayer tileGIDAt:tileCoord4];
        [self.bgLayer removeTileAt:tileCoord4];
        [self.bgLayer setTileGID:(tileGID4 + 4) at:tileCoord4];
        
        ////////////////////////////////////////////////////////////////////////
        
        
        self.sprite34 = [InteractiveSprite spriteWithSpriteFrameName:@"herospriteX04.png"];
        self.sprite34.spriteCode = 34;
        
        self.sprite34.orientation = 1;
        if (self.hero.sprite34_Orientation)
        {
            self.sprite34.orientation = self.hero.sprite34_Orientation;
        }
        if (self.sprite34.orientation == 1)
        {
            [self.sprite34 setDisplayFrame:[[spriteXWalkDown frames] objectAtIndex:0]];
        }
        else if (self.sprite34.orientation == 2)
        {
            [self.sprite34 setDisplayFrame:[[spriteXWalkUp frames] objectAtIndex:0]];
        }
        else if (self.sprite34.orientation == 3)
        {
            [self.sprite34 setDisplayFrame:[[spriteXWalkRight frames] objectAtIndex:0]];
        }
        else
        {
            [self.sprite34 setDisplayFrame:[[spriteXWalkLeft frames] objectAtIndex:0]];
        }
        
        //[self schedule:@selector(updateSprite34) interval:(1.125f)];
        
        if (self.hero.sprite34position.x != 0)
        {
            self.sprite34.position = self.hero.sprite34position;
        }
        else
        {
        NSMutableDictionary *sprite34start = [objects objectNamed:@"spriteStart34"];
        double x5 = [[sprite34start valueForKey:@"x"]floatValue];
        double y5 = [[sprite34start valueForKey:@"y"]floatValue];
        self.sprite34.position = ccp(x5,y5);
        }
        
        [self.theHKMap addChild:self.sprite34 z:self.bgLayer.zOrder];
        
        CGPoint tileCoord5 = [self tileCoordForPosition:self.sprite34.position];
        int tileGID5 = [self.bgLayer tileGIDAt:tileCoord5];
        [self.bgLayer removeTileAt:tileCoord5];
        [self.bgLayer setTileGID:(tileGID5 + 5) at:tileCoord5];

        ////////////////////////////////////////////////////////////////////////
        
        self.sprite35 = [InteractiveSprite spriteWithSpriteFrameName:@"herospriteL04.png"];
        self.sprite35.spriteCode = 35;
        
        self.sprite35.orientation = 3;
        if (self.hero.sprite35_Orientation)
        {
            self.sprite35.orientation = self.hero.sprite35_Orientation;
        }
        if (self.sprite35.orientation == 1)
        {
            [self.sprite35 setDisplayFrame:[[spriteLWalkDown frames] objectAtIndex:0]];
        }
        else if (self.sprite35.orientation == 2)
        {
            [self.sprite35 setDisplayFrame:[[spriteLWalkUp frames] objectAtIndex:0]];
        }
        else if (self.sprite35.orientation == 3)
        {
            [self.sprite35 setDisplayFrame:[[spriteLWalkRight frames] objectAtIndex:0]];
        }
        else
        {
            [self.sprite35 setDisplayFrame:[[spriteLWalkLeft frames] objectAtIndex:0]];
        }
        
        //[self schedule:@selector(updateSprite35) interval:(1.75f)];
        
        if (self.hero.sprite35position.x != 0)
        {
            self.sprite35.position = self.hero.sprite35position;
        }
        else
        {
        NSMutableDictionary *sprite35start = [objects objectNamed:@"spriteStart35"];
        double x6 = [[sprite35start valueForKey:@"x"]floatValue];
        double y6 = [[sprite35start valueForKey:@"y"]floatValue];
        self.sprite35.position = ccp(x6,y6);
        }
        
        [self.theHKMap addChild:self.sprite35 z:self.bgLayer.zOrder];
        
        CGPoint tileCoord6 = [self tileCoordForPosition:self.sprite35.position];
        int tileGID6 = [self.bgLayer tileGIDAt:tileCoord6];
        [self.bgLayer removeTileAt:tileCoord6];
        [self.bgLayer setTileGID:(tileGID6 + 6) at:tileCoord6]; 
        
        ////////////////////////////////////////////////////////////////////////
        
        self.sprite36 = [InteractiveSprite spriteWithSpriteFrameName:@"herospriteC04.png"];
        self.sprite36.spriteCode = 36;
        
        self.sprite36.orientation = 1;
        if (self.hero.sprite36_Orientation)
        {
            self.sprite36.orientation = self.hero.sprite36_Orientation;
        }
        if (self.sprite36.orientation == 1)
        {
            [self.sprite36 setDisplayFrame:[[spriteCWalkDown frames] objectAtIndex:0]];
        }
        else if (self.sprite36.orientation == 2)
        {
            [self.sprite36 setDisplayFrame:[[spriteCWalkUp frames] objectAtIndex:0]];
        }
        else if (self.sprite36.orientation == 3)
        {
            [self.sprite36 setDisplayFrame:[[spriteCWalkRight frames] objectAtIndex:0]];
        }
        else
        {
            [self.sprite36 setDisplayFrame:[[spriteCWalkLeft frames] objectAtIndex:0]];
        }
        
        //[self schedule:@selector(updateSprite36) interval:(1.625f)];
        
        if (self.hero.sprite36position.x != 0)
        {
            self.sprite36.position = self.hero.sprite36position;
        }
        else
        {
        NSMutableDictionary *sprite36start = [objects objectNamed:@"spriteStart36"];
        double x7 = [[sprite36start valueForKey:@"x"]floatValue];
        double y7 = [[sprite36start valueForKey:@"y"]floatValue];
        self.sprite36.position = ccp(x7,y7);
        }
        
        [self.theHKMap addChild:self.sprite36 z:self.bgLayer.zOrder];
        
        CGPoint tileCoord7 = [self tileCoordForPosition:self.sprite36.position];
        int tileGID7 = [self.bgLayer tileGIDAt:tileCoord7];
        [self.bgLayer removeTileAt:tileCoord7];
        [self.bgLayer setTileGID:(tileGID7 + 7) at:tileCoord7];
        
        ////////////////////////////////////////////////////////////////////////
        
        self.sprite37 = [InteractiveSprite spriteWithSpriteFrameName:@"herospriteZB04.png"];
        self.sprite37.spriteCode = 37;
        
        self.sprite37.orientation = 1;
        if (self.hero.sprite37_Orientation)
        {
            self.sprite37.orientation = self.hero.sprite37_Orientation;
        }
        if (self.sprite37.orientation == 1)
        {
            [self.sprite37 setDisplayFrame:[[spriteZBWalkDown frames] objectAtIndex:0]];
        }
        else if (self.sprite37.orientation == 2)
        {
            [self.sprite37 setDisplayFrame:[[spriteZBWalkUp frames] objectAtIndex:0]];
        }
        else if (self.sprite37.orientation == 3)
        {
            [self.sprite37 setDisplayFrame:[[spriteZBWalkRight frames] objectAtIndex:0]];
        }
        else
        {
            [self.sprite37 setDisplayFrame:[[spriteZBWalkLeft frames] objectAtIndex:0]];
        }
        
        //[self schedule:@selector(updateSprite37) interval:(1.625f)];
        
        
        if (self.hero.sprite37position.x != 0)
        {
            self.sprite37.position = self.hero.sprite37position;
        }
        else
        {
            NSMutableDictionary *sprite37start = [objects objectNamed:@"spriteStart37"];
            double x8 = [[sprite37start valueForKey:@"x"]floatValue];
            double y8 = [[sprite37start valueForKey:@"y"]floatValue];
            self.sprite37.position = ccp(x8,y8);
        }
        
        
        [self.theHKMap addChild:self.sprite37 z:self.bgLayer.zOrder];
        
        CGPoint tileCoord8 = [self tileCoordForPosition:self.sprite37.position];
        int tileGID8 = [self.bgLayer tileGIDAt:tileCoord8];
        [self.bgLayer removeTileAt:tileCoord8];
        [self.bgLayer setTileGID:(tileGID8 + 8) at:tileCoord8];
        
        ////////////////////////////////////////////////////////////////////////
        
        
        self.sprite38 = [InteractiveSprite spriteWithSpriteFrameName:@"herospriteO04.png"];
        self.sprite38.spriteCode = 38;
        
        self.sprite38.orientation = 1;
        if (self.hero.sprite38_Orientation)
        {
            self.sprite38.orientation = self.hero.sprite38_Orientation;
        }
        if (self.sprite38.orientation == 1)
        {
            [self.sprite38 setDisplayFrame:[[spriteOWalkDown frames] objectAtIndex:0]];
        }
        else if (self.sprite38.orientation == 2)
        {
            [self.sprite38 setDisplayFrame:[[spriteOWalkUp frames] objectAtIndex:0]];
        }
        else if (self.sprite38.orientation == 3)
        {
            [self.sprite38 setDisplayFrame:[[spriteOWalkRight frames] objectAtIndex:0]];
        }
        else
        {
            [self.sprite38 setDisplayFrame:[[spriteOWalkLeft frames] objectAtIndex:0]];
        }
        
        //[self schedule:@selector(updateSprite38) interval:(1.0f)];
        
        
        if (self.hero.sprite38position.x != 0)
        {
            self.sprite38.position = self.hero.sprite38position;
        }
        else
        {
            NSMutableDictionary *sprite38start = [objects objectNamed:@"spriteStart38"];
            double x9 = [[sprite38start valueForKey:@"x"]floatValue];
            double y9 = [[sprite38start valueForKey:@"y"]floatValue];
            self.sprite38.position = ccp(x9,y9);
        }
        
        
        [self.theHKMap addChild:self.sprite38 z:self.bgLayer.zOrder];
        
        CGPoint tileCoord9 = [self tileCoordForPosition:self.sprite38.position];
        int tileGID9 = [self.bgLayer tileGIDAt:tileCoord9];
        [self.bgLayer removeTileAt:tileCoord9];
        [self.bgLayer setTileGID:(tileGID9 + 9) at:tileCoord9];
        
        ////////////////////////////////////////////////////////////////////////
        
        self.sprite39 = [InteractiveSprite spriteWithSpriteFrameName:@"herospriteS04.png"];
        self.sprite39.spriteCode = 39;
        
        self.sprite39.orientation = 1;
        if (self.hero.sprite39_Orientation)
        {
            self.sprite39.orientation = self.hero.sprite39_Orientation;
        }
        if (self.sprite39.orientation == 1)
        {
            [self.sprite39 setDisplayFrame:[[spriteSWalkDown frames] objectAtIndex:0]];
        }
        else if (self.sprite39.orientation == 2)
        {
            [self.sprite39 setDisplayFrame:[[spriteSWalkUp frames] objectAtIndex:0]];
        }
        else if (self.sprite39.orientation == 3)
        {
            [self.sprite39 setDisplayFrame:[[spriteSWalkRight frames] objectAtIndex:0]];
        }
        else
        {
            [self.sprite39 setDisplayFrame:[[spriteSWalkLeft frames] objectAtIndex:0]];
        }
        
        //[self schedule:@selector(updateSprite39) interval:(1.875f)];
        
        
        if (self.hero.sprite39position.x != 0)
        {
            self.sprite39.position = self.hero.sprite39position;
        }
        else
        {
            NSMutableDictionary *sprite39start = [objects objectNamed:@"spriteStart39"];
            double x10 = [[sprite39start valueForKey:@"x"]floatValue];
            double y10 = [[sprite39start valueForKey:@"y"]floatValue];
            self.sprite39.position = ccp(x10,y10);
        }
        
        
        [self.theHKMap addChild:self.sprite39 z:self.bgLayer.zOrder];
        
        CGPoint tileCoord10 = [self tileCoordForPosition:self.sprite39.position];
        int tileGID10 = [self.bgLayer tileGIDAt:tileCoord10];
        [self.bgLayer removeTileAt:tileCoord10];
        [self.bgLayer setTileGID:(tileGID10 + 10) at:tileCoord10];
        
        ////////////////////////////////////////////////////////////////////////
        
        self.sprite40 = [InteractiveSprite spriteWithSpriteFrameName:@"herospriteR04.png"];
        self.sprite40.spriteCode = 40;
        
        self.sprite40.orientation = 1;
        if (self.hero.sprite40_Orientation)
        {
            self.sprite40.orientation = self.hero.sprite40_Orientation;
        }
        if (self.sprite40.orientation == 1)
        {
            [self.sprite40 setDisplayFrame:[[spriteRWalkDown frames] objectAtIndex:0]];
        }
        else if (self.sprite40.orientation == 2)
        {
            [self.sprite40 setDisplayFrame:[[spriteRWalkUp frames] objectAtIndex:0]];
        }
        else if (self.sprite40.orientation == 3)
        {
            [self.sprite40 setDisplayFrame:[[spriteRWalkRight frames] objectAtIndex:0]];
        }
        else
        {
            [self.sprite40 setDisplayFrame:[[spriteRWalkLeft frames] objectAtIndex:0]];
        }
        
        //[self schedule:@selector(updateSprite40) interval:(1.625f)];
        
        
        if (self.hero.sprite40position.x != 0)
        {
            self.sprite40.position = self.hero.sprite40position;
        }
        else
        {
            NSMutableDictionary *sprite40start = [objects objectNamed:@"spriteStart40"];
            double x11 = [[sprite40start valueForKey:@"x"]floatValue];
            double y11 = [[sprite40start valueForKey:@"y"]floatValue];
            self.sprite40.position = ccp(x11,y11);
        }
        
        
        [self.theHKMap addChild:self.sprite40 z:self.bgLayer.zOrder];
        
        CGPoint tileCoord11 = [self tileCoordForPosition:self.sprite40.position];
        int tileGID11 = [self.bgLayer tileGIDAt:tileCoord11];
        [self.bgLayer removeTileAt:tileCoord11];
        [self.bgLayer setTileGID:(tileGID11 + 11) at:tileCoord11];
        
        ////////////////////////////////////////////////////////////////////////
        
        
        self.sprite41 = [InteractiveSprite spriteWithSpriteFrameName:@"herospriteM04.png"];
        self.sprite41.spriteCode = 41;
        
        self.sprite41.orientation = 2;
        if (self.hero.sprite41_Orientation)
        {
            self.sprite41.orientation = self.hero.sprite41_Orientation;
        }
        if (self.sprite41.orientation == 1)
        {
            [self.sprite41 setDisplayFrame:[[spriteMWalkDown frames] objectAtIndex:0]];
        }
        else if (self.sprite41.orientation == 2)
        {
            [self.sprite41 setDisplayFrame:[[spriteMWalkUp frames] objectAtIndex:0]];
        }
        else if (self.sprite41.orientation == 3)
        {
            [self.sprite41 setDisplayFrame:[[spriteMWalkRight frames] objectAtIndex:0]];
        }
        else
        {
            [self.sprite41 setDisplayFrame:[[spriteMWalkLeft frames] objectAtIndex:0]];
        }
        
        //[self schedule:@selector(updateSprite41) interval:(2.125f)];
        
        
        if (self.hero.sprite41position.x != 0)
        {
            self.sprite41.position = self.hero.sprite41position;
        }
        else
        {
            NSMutableDictionary *sprite41start = [objects objectNamed:@"spriteStart41"];
            double x12 = [[sprite41start valueForKey:@"x"]floatValue];
            double y12 = [[sprite41start valueForKey:@"y"]floatValue];
            self.sprite41.position = ccp(x12,y12);
        }
        
        
        [self.theHKMap addChild:self.sprite41 z:self.bgLayer.zOrder];
        
        CGPoint tileCoord12 = [self tileCoordForPosition:self.sprite41.position];
        int tileGID12 = [self.bgLayer tileGIDAt:tileCoord12];
        [self.bgLayer removeTileAt:tileCoord12];
        [self.bgLayer setTileGID:(tileGID12 + 12) at:tileCoord12];
        
        ////////////////////////////////////////////////////////////////////////

        self.sprite42 = [InteractiveSprite spriteWithSpriteFrameName:@"herospriteZ04.png"];
        self.sprite42.spriteCode = 42;
        
        self.sprite42.orientation = 1;
        if (self.hero.sprite42_Orientation)
        {
            self.sprite42.orientation = self.hero.sprite42_Orientation;
        }
        if (self.sprite42.orientation == 1)
        {
            [self.sprite42 setDisplayFrame:[[spriteZWalkDown frames] objectAtIndex:0]];
        }
        else if (self.sprite42.orientation == 2)
        {
            [self.sprite42 setDisplayFrame:[[spriteZWalkUp frames] objectAtIndex:0]];
        }
        else if (self.sprite42.orientation == 3)
        {
            [self.sprite42 setDisplayFrame:[[spriteZWalkRight frames] objectAtIndex:0]];
        }
        else
        {
            [self.sprite42 setDisplayFrame:[[spriteZWalkLeft frames] objectAtIndex:0]];
        }
        
        //[self schedule:@selector(updateSprite42) interval:(1.875f)];
        
        
        if (self.hero.sprite42position.x != 0)
        {
            self.sprite42.position = self.hero.sprite42position;
        }
        else
        {
            NSMutableDictionary *sprite42start = [objects objectNamed:@"spriteStart42"];
            double x13 = [[sprite42start valueForKey:@"x"]floatValue];
            double y13 = [[sprite42start valueForKey:@"y"]floatValue];
            self.sprite42.position = ccp(x13,y13);
        }
        
        
        [self.theHKMap addChild:self.sprite42 z:self.bgLayer.zOrder];
        
        CGPoint tileCoord13 = [self tileCoordForPosition:self.sprite42.position];
        int tileGID13 = [self.bgLayer tileGIDAt:tileCoord13];
        [self.bgLayer removeTileAt:tileCoord13];
        [self.bgLayer setTileGID:(tileGID13 + 13) at:tileCoord13];
        
        ////////////////////////////////////////////////////////////////////////

        
        self.sprite43 = [InteractiveSprite spriteWithSpriteFrameName:@"herospriteV04.png"];
        self.sprite43.spriteCode = 43;
        
        self.sprite43.orientation = 1;
        if (self.hero.sprite43_Orientation)
        {
            self.sprite43.orientation = self.hero.sprite43_Orientation;
        }
        if (self.sprite43.orientation == 1)
        {
            [self.sprite43 setDisplayFrame:[[spriteVWalkDown frames] objectAtIndex:0]];
        }
        else if (self.sprite43.orientation == 2)
        {
            [self.sprite43 setDisplayFrame:[[spriteVWalkUp frames] objectAtIndex:0]];
        }
        else if (self.sprite43.orientation == 3)
        {
            [self.sprite43 setDisplayFrame:[[spriteVWalkRight frames] objectAtIndex:0]];
        }
        else
        {
            [self.sprite43 setDisplayFrame:[[spriteVWalkLeft frames] objectAtIndex:0]];
        }
        
        //[self schedule:@selector(updateSprite43) interval:(2.875f)];
        
        
        if (self.hero.sprite43position.x != 0)
        {
            self.sprite43.position = self.hero.sprite43position;
        }
        else
        {
            NSMutableDictionary *sprite43start = [objects objectNamed:@"spriteStart43"];
            double x14 = [[sprite43start valueForKey:@"x"]floatValue];
            double y14 = [[sprite43start valueForKey:@"y"]floatValue];
            self.sprite43.position = ccp(x14,y14);
        }
        
        
        [self.theHKMap addChild:self.sprite43 z:self.bgLayer.zOrder];
        
        CGPoint tileCoord14 = [self tileCoordForPosition:self.sprite43.position];
        int tileGID14 = [self.bgLayer tileGIDAt:tileCoord14];
        [self.bgLayer removeTileAt:tileCoord14];
        [self.bgLayer setTileGID:(tileGID14 + 14) at:tileCoord14];
        
        ////////////////////////////////////////////////////////////////////////
        
        self.sprite44 = [InteractiveSprite spriteWithSpriteFrameName:@"herospriteW04.png"];
        self.sprite44.spriteCode = 44;
        
        self.sprite44.orientation = 1;
        if (self.hero.sprite44_Orientation)
        {
            self.sprite44.orientation = self.hero.sprite44_Orientation;
        }
        if (self.sprite44.orientation == 1)
        {
            [self.sprite44 setDisplayFrame:[[spriteWWalkDown frames] objectAtIndex:0]];
        }
        else if (self.sprite44.orientation == 2)
        {
            [self.sprite44 setDisplayFrame:[[spriteWWalkUp frames] objectAtIndex:0]];
        }
        else if (self.sprite44.orientation == 3)
        {
            [self.sprite44 setDisplayFrame:[[spriteWWalkRight frames] objectAtIndex:0]];
        }
        else
        {
            [self.sprite44 setDisplayFrame:[[spriteWWalkLeft frames] objectAtIndex:0]];
        }
        
        //[self schedule:@selector(updateSprite44) interval:(1.375f)];
        
        
        if (self.hero.sprite44position.x != 0)
        {
            self.sprite44.position = self.hero.sprite44position;
        }
        else
        {
            NSMutableDictionary *sprite44start = [objects objectNamed:@"spriteStart44"];
            double x15 = [[sprite44start valueForKey:@"x"]floatValue];
            double y15 = [[sprite44start valueForKey:@"y"]floatValue];
            self.sprite44.position = ccp(x15,y15);
        }
        
        
        [self.theHKMap addChild:self.sprite44 z:self.bgLayer.zOrder];
        
        CGPoint tileCoord15 = [self tileCoordForPosition:self.sprite44.position];
        int tileGID15 = [self.bgLayer tileGIDAt:tileCoord15];
        [self.bgLayer removeTileAt:tileCoord15];
        [self.bgLayer setTileGID:(tileGID15 + 15) at:tileCoord15];
        
        ////////////////////////////////////////////////////////////////////////

        self.sprite45 = [InteractiveSprite spriteWithSpriteFrameName:@"herospriteQ04.png"];
        self.sprite45.spriteCode = 45;
        
        self.sprite45.orientation = 1;
        if (self.hero.sprite45_Orientation)
        {
            self.sprite45.orientation = self.hero.sprite45_Orientation;
        }
        if (self.sprite45.orientation == 1)
        {
            [self.sprite45 setDisplayFrame:[[spriteQWalkDown frames] objectAtIndex:0]];
        }
        else if (self.sprite45.orientation == 2)
        {
            [self.sprite45 setDisplayFrame:[[spriteQWalkUp frames] objectAtIndex:0]];
        }
        else if (self.sprite45.orientation == 3)
        {
            [self.sprite45 setDisplayFrame:[[spriteQWalkRight frames] objectAtIndex:0]];
        }
        else
        {
            [self.sprite45 setDisplayFrame:[[spriteQWalkLeft frames] objectAtIndex:0]];
        }
        
        //[self schedule:@selector(updateSprite45) interval:(1.875f)];
        
        
        if (self.hero.sprite45position.x != 0)
        {
            self.sprite45.position = self.hero.sprite45position;
        }
        else
        {
            NSMutableDictionary *sprite45start = [objects objectNamed:@"spriteStart45"];
            double x16 = [[sprite45start valueForKey:@"x"]floatValue];
            double y16 = [[sprite45start valueForKey:@"y"]floatValue];
            self.sprite45.position = ccp(x16,y16);
        }
        
        
        [self.theHKMap addChild:self.sprite45 z:self.bgLayer.zOrder];
        
        CGPoint tileCoord16 = [self tileCoordForPosition:self.sprite45.position];
        int tileGID16 = [self.bgLayer tileGIDAt:tileCoord16];
        [self.bgLayer removeTileAt:tileCoord16];
        [self.bgLayer setTileGID:(tileGID16 + 16) at:tileCoord16];
        
        ////////////////////////////////////////////////////////////////////////
        

        self.sprite46 = [InteractiveSprite spriteWithSpriteFrameName:@"herospriteY04.png"];
        self.sprite46.spriteCode = 46;
        
        self.sprite46.orientation = 1;
        if (self.hero.sprite46_Orientation)
        {
            self.sprite46.orientation = self.hero.sprite46_Orientation;
        }
        if (self.sprite46.orientation == 1)
        {
            [self.sprite46 setDisplayFrame:[[spriteYWalkDown frames] objectAtIndex:0]];
        }
        else if (self.sprite46.orientation == 2)
        {
            [self.sprite46 setDisplayFrame:[[spriteYWalkUp frames] objectAtIndex:0]];
        }
        else if (self.sprite46.orientation == 3)
        {
            [self.sprite46 setDisplayFrame:[[spriteYWalkRight frames] objectAtIndex:0]];
        }
        else
        {
            [self.sprite46 setDisplayFrame:[[spriteYWalkLeft frames] objectAtIndex:0]];
        }
        
        //[self schedule:@selector(updateSprite46) interval:(1.175f)];
        
        
        if (self.hero.sprite46position.x != 0)
        {
            self.sprite46.position = self.hero.sprite46position;
        }
        else
        {
            NSMutableDictionary *sprite46start = [objects objectNamed:@"spriteStart46"];
            double x17 = [[sprite46start valueForKey:@"x"]floatValue];
            double y17 = [[sprite46start valueForKey:@"y"]floatValue];
            self.sprite46.position = ccp(x17,y17);
        }
        
        
        [self.theHKMap addChild:self.sprite46 z:self.bgLayer.zOrder];
        
        CGPoint tileCoord17 = [self tileCoordForPosition:self.sprite46.position];
        int tileGID17 = [self.bgLayer tileGIDAt:tileCoord17];
        [self.bgLayer removeTileAt:tileCoord17];
        [self.bgLayer setTileGID:(tileGID17 + 17) at:tileCoord17];
        
        ////////////////////////////////////////////////////////////////////////
        
        self.sprite47 = [InteractiveSprite spriteWithSpriteFrameName:@"herospriteY04.png"];
        self.sprite47.spriteCode = 47;
        
        self.sprite47.orientation = 1;
        if (self.hero.sprite47_Orientation)
        {
            self.sprite47.orientation = self.hero.sprite47_Orientation;
        }
        if (self.sprite47.orientation == 1)
        {
            [self.sprite47 setDisplayFrame:[[spriteYWalkDown frames] objectAtIndex:0]];
        }
        else if (self.sprite47.orientation == 2)
        {
            [self.sprite47 setDisplayFrame:[[spriteYWalkUp frames] objectAtIndex:0]];
        }
        else if (self.sprite47.orientation == 3)
        {
            [self.sprite47 setDisplayFrame:[[spriteYWalkRight frames] objectAtIndex:0]];
        }
        else
        {
            [self.sprite47 setDisplayFrame:[[spriteYWalkLeft frames] objectAtIndex:0]];
        }
        
        //[self schedule:@selector(updateSprite47) interval:(1.25f)];
        
        
        if (self.hero.sprite47position.x != 0)
        {
            self.sprite47.position = self.hero.sprite47position;
        }
        else
        {
            NSMutableDictionary *sprite47start = [objects objectNamed:@"spriteStart47"];
            double x18 = [[sprite47start valueForKey:@"x"]floatValue];
            double y18 = [[sprite47start valueForKey:@"y"]floatValue];
            self.sprite47.position = ccp(x18,y18);
        }
        
        
        [self.theHKMap addChild:self.sprite47 z:self.bgLayer.zOrder];
        
        CGPoint tileCoord18 = [self tileCoordForPosition:self.sprite47.position];
        int tileGID18 = [self.bgLayer tileGIDAt:tileCoord18];
        [self.bgLayer removeTileAt:tileCoord18];
        [self.bgLayer setTileGID:(tileGID18 + 18) at:tileCoord18];
        
        ////////////////////////////////////////////////////////////////////////

        self.sprite48 = [InteractiveSprite spriteWithSpriteFrameName:@"herospriteU04.png"];
        self.sprite48.spriteCode = 48;
        
        self.sprite48.orientation = 1;
        if (self.hero.sprite48_Orientation)
        {
            self.sprite48.orientation = self.hero.sprite48_Orientation;
        }
        if (self.sprite48.orientation == 1)
        {
            [self.sprite48 setDisplayFrame:[[spriteUWalkDown frames] objectAtIndex:0]];
        }
        else if (self.sprite48.orientation == 2)
        {
            [self.sprite48 setDisplayFrame:[[spriteUWalkUp frames] objectAtIndex:0]];
        }
        else if (self.sprite48.orientation == 3)
        {
            [self.sprite48 setDisplayFrame:[[spriteUWalkRight frames] objectAtIndex:0]];
        }
        else
        {
            [self.sprite48 setDisplayFrame:[[spriteUWalkLeft frames] objectAtIndex:0]];
        }
        
        //[self schedule:@selector(updateSprite48) interval:(2.0f)];
        
        
        if (self.hero.sprite48position.x != 0)
        {
            self.sprite48.position = self.hero.sprite48position;
        }
        else
        {
            NSMutableDictionary *sprite48start = [objects objectNamed:@"spriteStart48"];
            double x19 = [[sprite48start valueForKey:@"x"]floatValue];
            double y19 = [[sprite48start valueForKey:@"y"]floatValue];
            self.sprite48.position = ccp(x19,y19);
        }
        
        
        [self.theHKMap addChild:self.sprite48 z:self.bgLayer.zOrder];
        
        CGPoint tileCoord19 = [self tileCoordForPosition:self.sprite48.position];
        int tileGID19 = [self.bgLayer tileGIDAt:tileCoord19];
        [self.bgLayer removeTileAt:tileCoord19];
        [self.bgLayer setTileGID:(tileGID19 + 19) at:tileCoord19];
        
        ////////////////////////////////////////////////////////////////////////
        
        self.sprite49 = [InteractiveSprite spriteWithSpriteFrameName:@"herospriteT04.png"];
        self.sprite49.spriteCode = 49;
        
        self.sprite49.orientation = 1;
        if (self.hero.sprite49_Orientation)
        {
            self.sprite49.orientation = self.hero.sprite49_Orientation;
        }
        if (self.sprite49.orientation == 1)
        {
            [self.sprite49 setDisplayFrame:[[spriteTWalkDown frames] objectAtIndex:0]];
        }
        else if (self.sprite49.orientation == 2)
        {
            [self.sprite49 setDisplayFrame:[[spriteTWalkUp frames] objectAtIndex:0]];
        }
        else if (self.sprite49.orientation == 3)
        {
            [self.sprite49 setDisplayFrame:[[spriteTWalkRight frames] objectAtIndex:0]];
        }
        else
        {
            [self.sprite49 setDisplayFrame:[[spriteTWalkLeft frames] objectAtIndex:0]];
        }
        
        //[self schedule:@selector(updateSprite49) interval:(2.0f)];
        
        
        if (self.hero.sprite49position.x != 0)
        {
            self.sprite49.position = self.hero.sprite49position;
        }
        else
        {
            NSMutableDictionary *sprite49start = [objects objectNamed:@"spriteStart49"];
            double x20 = [[sprite49start valueForKey:@"x"]floatValue];
            double y20 = [[sprite49start valueForKey:@"y"]floatValue];
            self.sprite49.position = ccp(x20,y20);
        }
        
        
        [self.theHKMap addChild:self.sprite49 z:self.bgLayer.zOrder];
        
        CGPoint tileCoord20 = [self tileCoordForPosition:self.sprite49.position];
        int tileGID20 = [self.bgLayer tileGIDAt:tileCoord20];
        [self.bgLayer removeTileAt:tileCoord20];
        [self.bgLayer setTileGID:(tileGID20 + 20) at:tileCoord20];
        
        ////////////////////////////////////////////////////////////////////////
        self.sprite50 = [InteractiveSprite spriteWithSpriteFrameName:@"herospriteZA04.png"];
        self.sprite50.spriteCode = 50;
        
        self.sprite50.orientation = 1;
        if (self.hero.sprite50_Orientation)
        {
            self.sprite50.orientation = self.hero.sprite50_Orientation;
        }
        if (self.sprite50.orientation == 1)
        {
            [self.sprite50 setDisplayFrame:[[spriteZAWalkDown frames] objectAtIndex:0]];
        }
        else if (self.sprite50.orientation == 2)
        {
            [self.sprite50 setDisplayFrame:[[spriteZAWalkUp frames] objectAtIndex:0]];
        }
        else if (self.sprite50.orientation == 3)
        {
            [self.sprite50 setDisplayFrame:[[spriteZAWalkRight frames] objectAtIndex:0]];
        }
        else
        {
            [self.sprite50 setDisplayFrame:[[spriteZAWalkLeft frames] objectAtIndex:0]];
        }
        
        //[self schedule:@selector(updateSprite50) interval:(1.625f)];
        
        
        if (self.hero.sprite50position.x != 0)
        {
            self.sprite50.position = self.hero.sprite50position;
        }
        else
        {
            NSMutableDictionary *sprite50start = [objects objectNamed:@"spriteStart50"];
            double x21 = [[sprite50start valueForKey:@"x"]floatValue];
            double y21 = [[sprite50start valueForKey:@"y"]floatValue];
            self.sprite50.position = ccp(x21,y21);
        }
        
        
        [self.theHKMap addChild:self.sprite50 z:self.bgLayer.zOrder];
        
        CGPoint tileCoord21 = [self tileCoordForPosition:self.sprite50.position];
        int tileGID21 = [self.bgLayer tileGIDAt:tileCoord21];
        [self.bgLayer removeTileAt:tileCoord21];
        [self.bgLayer setTileGID:(tileGID21 + 21) at:tileCoord21];
        
        ////////////////////////////////////////////////////////////////////////
        
        self.sprite51 = [InteractiveSprite spriteWithSpriteFrameName:@"herospriteT04.png"];
        self.sprite51.spriteCode = 51;
        
        self.sprite51.orientation = 4;
        if (self.hero.sprite51_Orientation)
        {
            self.sprite51.orientation = self.hero.sprite51_Orientation;
        }
        if (self.sprite51.orientation == 1)
        {
            [self.sprite51 setDisplayFrame:[[spriteTWalkDown frames] objectAtIndex:0]];
        }
        else if (self.sprite51.orientation == 2)
        {
            [self.sprite51 setDisplayFrame:[[spriteTWalkUp frames] objectAtIndex:0]];
        }
        else if (self.sprite51.orientation == 3)
        {
            [self.sprite51 setDisplayFrame:[[spriteTWalkRight frames] objectAtIndex:0]];
        }
        else
        {
            [self.sprite51 setDisplayFrame:[[spriteTWalkLeft frames] objectAtIndex:0]];
        }
        
        //[self schedule:@selector(updateSprite51) interval:(1.5f)];
        
        
        if (self.hero.sprite51position.x != 0)
        {
            self.sprite51.position = self.hero.sprite51position;
        }
        else
        {
            NSMutableDictionary *sprite51start = [objects objectNamed:@"spriteStart51"];
            double x22 = [[sprite51start valueForKey:@"x"]floatValue];
            double y22 = [[sprite51start valueForKey:@"y"]floatValue];
            self.sprite51.position = ccp(x22,y22);
        }
        
        
        [self.theHKMap addChild:self.sprite51 z:self.bgLayer.zOrder];
        
        CGPoint tileCoord22 = [self tileCoordForPosition:self.sprite51.position];
        int tileGID22 = [self.bgLayer tileGIDAt:tileCoord22];
        [self.bgLayer removeTileAt:tileCoord22];
        [self.bgLayer setTileGID:(tileGID22 + 22) at:tileCoord22];
        
        ////////////////////////////////////////////////////////////////////////

        self.sprite52 = [InteractiveSprite spriteWithSpriteFrameName:@"herospriteI04.png"];
        self.sprite52.spriteCode = 52;
        
        self.sprite52.orientation = 2;
        if (self.hero.sprite52_Orientation)
        {
            self.sprite52.orientation = self.hero.sprite52_Orientation;
        }
        if (self.sprite52.orientation == 1)
        {
            [self.sprite52 setDisplayFrame:[[spriteIWalkDown frames] objectAtIndex:0]];
        }
        else if (self.sprite52.orientation == 2)
        {
            [self.sprite52 setDisplayFrame:[[spriteIWalkUp frames] objectAtIndex:0]];
        }
        else if (self.sprite52.orientation == 3)
        {
            [self.sprite52 setDisplayFrame:[[spriteIWalkRight frames] objectAtIndex:0]];
        }
        else
        {
            [self.sprite52 setDisplayFrame:[[spriteIWalkLeft frames] objectAtIndex:0]];
        }
        
        //[self schedule:@selector(updateSprite52) interval:(1.75f)];
        
        
        if (self.hero.sprite52position.x != 0)
        {
            self.sprite52.position = self.hero.sprite52position;
        }
        else
        {
            NSMutableDictionary *sprite52start = [objects objectNamed:@"spriteStart52"];
            double x23 = [[sprite52start valueForKey:@"x"]floatValue];
            double y23 = [[sprite52start valueForKey:@"y"]floatValue];
            self.sprite52.position = ccp(x23,y23);
        }
        
        
        [self.theHKMap addChild:self.sprite52 z:self.bgLayer.zOrder];
        
        CGPoint tileCoord23 = [self tileCoordForPosition:self.sprite52.position];
        int tileGID23 = [self.bgLayer tileGIDAt:tileCoord23];
        [self.bgLayer removeTileAt:tileCoord23];
        [self.bgLayer setTileGID:(tileGID23 + 23) at:tileCoord23];
        
        ////////////////////////////////////////////////////////////////////////

        self.sprite53 = [InteractiveSprite spriteWithSpriteFrameName:@"herospriteA04.png"];
        self.sprite53.spriteCode = 53;
        
        self.sprite53.orientation = 2;
        if (self.hero.sprite53_Orientation)
        {
            self.sprite53.orientation = self.hero.sprite53_Orientation;
        }
        if (self.sprite53.orientation == 1)
        {
            [self.sprite53 setDisplayFrame:[[spriteAWalkDown frames] objectAtIndex:0]];
        }
        else if (self.sprite53.orientation == 2)
        {
            [self.sprite53 setDisplayFrame:[[spriteAWalkUp frames] objectAtIndex:0]];
        }
        else if (self.sprite53.orientation == 3)
        {
            [self.sprite53 setDisplayFrame:[[spriteAWalkRight frames] objectAtIndex:0]];
        }
        else
        {
            [self.sprite53 setDisplayFrame:[[spriteAWalkLeft frames] objectAtIndex:0]];
        }
        
        //[self schedule:@selector(updateSprite53) interval:(1.5f)];
        
        
        if (self.hero.sprite53position.x != 0)
        {
            self.sprite53.position = self.hero.sprite53position;
        }
        else
        {
            NSMutableDictionary *sprite53start = [objects objectNamed:@"spriteStart53"];
            double x24 = [[sprite53start valueForKey:@"x"]floatValue];
            double y24 = [[sprite53start valueForKey:@"y"]floatValue];
            self.sprite53.position = ccp(x24,y24);
        }
        
        
        [self.theHKMap addChild:self.sprite53 z:self.bgLayer.zOrder];
        
        CGPoint tileCoord24 = [self tileCoordForPosition:self.sprite53.position];
        int tileGID24 = [self.bgLayer tileGIDAt:tileCoord24];
        [self.bgLayer removeTileAt:tileCoord24];
        [self.bgLayer setTileGID:(tileGID24 + 24) at:tileCoord24];
        
        ////////////////////////////////////////////////////////////////////////

        
        //items
        
        if (!self.hero.gotItem5)
        {
            self.item5 = [CCSprite spriteWithFile:@"treasurechestSprite01.png"];
            NSMutableDictionary *item = [objects objectNamed:@"item5"];
            double x1 = [[item valueForKey:@"x"]floatValue];
            double y1 = [[item valueForKey:@"y"]floatValue];
            self.item5.position = ccp(x1,y1);
            [self.theHKMap addChild:self.item5 z:self.bgLayer.zOrder];
        }
        else
        {
            self.item5 = [CCSprite spriteWithFile:@"treasurechestSprite02.png"];
            NSMutableDictionary *item = [objects objectNamed:@"item5"];
            double x1 = [[item valueForKey:@"x"]floatValue];
            double y1 = [[item valueForKey:@"y"]floatValue];
            self.item5.position = ccp(x1,y1);
            [self.theHKMap addChild:self.item5 z:self.bgLayer.zOrder];
        }
        if (!self.hero.gotItem7)
        {
            self.item7 = [CCSprite spriteWithFile:@"treasurechestSprite01.png"];
            NSMutableDictionary *item = [objects objectNamed:@"item7"];
            double x1 = [[item valueForKey:@"x"]floatValue];
            double y1 = [[item valueForKey:@"y"]floatValue];
            self.item7.position = ccp(x1,y1);
            [self.theHKMap addChild:self.item7 z:self.bgLayer.zOrder];
        }
        else
        {
            self.item7 = [CCSprite spriteWithFile:@"treasurechestSprite02.png"];
            NSMutableDictionary *item = [objects objectNamed:@"item7"];
            double x1 = [[item valueForKey:@"x"]floatValue];
            double y1 = [[item valueForKey:@"y"]floatValue];
            self.item7.position = ccp(x1,y1);
            [self.theHKMap addChild:self.item7 z:self.bgLayer.zOrder];
        }
        if (!self.hero.gotItem8)
        {
            self.item8 = [CCSprite spriteWithFile:@"treasurechestSprite01.png"];
            NSMutableDictionary *item = [objects objectNamed:@"item8"];
            double x1 = [[item valueForKey:@"x"]floatValue];
            double y1 = [[item valueForKey:@"y"]floatValue];
            self.item8.position = ccp(x1,y1);
            [self.theHKMap addChild:self.item8 z:self.bgLayer.zOrder];
        }
        else
        {
            self.item8 = [CCSprite spriteWithFile:@"treasurechestSprite02.png"];
            NSMutableDictionary *item = [objects objectNamed:@"item8"];
            double x1 = [[item valueForKey:@"x"]floatValue];
            double y1 = [[item valueForKey:@"y"]floatValue];
            self.item8.position = ccp(x1,y1);
            [self.theHKMap addChild:self.item8 z:self.bgLayer.zOrder];
        }
        if (!self.hero.gotItem6)
        {
            self.item6 = [CCSprite spriteWithFile:@"goldpilesprite01.png"];
            NSMutableDictionary *item = [objects objectNamed:@"item6"];
            double x1 = [[item valueForKey:@"x"]floatValue];
            double y1 = [[item valueForKey:@"y"]floatValue];
            self.item6.position = ccp(x1,y1);
            [self.theHKMap addChild:self.item6 z:self.bgLayer.zOrder];
        }
        
        
        if (!self.hero.beatTowerKeeper)
        {
            self.boss12 = [CCSprite spriteWithFile:@"boss2sprite01.png"]; //temporary image
            NSMutableDictionary *boss2pos = [objects objectNamed:@"boss12"];
            double x1 = [[boss2pos valueForKey:@"x"]floatValue];
            double y1 = [[boss2pos valueForKey:@"y"]floatValue];
            self.boss12.position = ccp(x1,y1);
            [self.theHKMap addChild:boss12 z:self.bgLayer.zOrder];
        }

        
        
        double x;
        double y;
        
        prev = self.hero.musicCode;
        
        //1(coming from login),2(gate), 3(teleport), 4(herodied - pl1), 5(start new game), 6(beat ionak - go pl1),7(item shop/menu),8(battle win/flee),
        if (self.hero.mapInitMode == 1)
        {
            prev = 0;
            
            self.spriteOrientation = 1;
            
            x = self.hero.position.x;
            y = self.hero.position.y;
            
            
        }
        else if (self.hero.mapInitMode == 2)
        {
            self.hero.musicCode = 3;
            prev = 0;
            
            self.spriteOrientation = self.hero.heroOrientation;
            
            if (self.hero.currentMap == 1)
            {
                self.hero.musicCode = 3;
                NSMutableDictionary *startPoint = [objects objectNamed:@"startPoint2"];
                x = [[startPoint valueForKey:@"x"]floatValue];
                y = [[startPoint valueForKey:@"y"]floatValue];
            }
            else if (self.hero.currentMap == 21)
            {
                self.hero.musicCode = 3;
                NSMutableDictionary *startPoint = [objects objectNamed:@"startPoint3"];
                x = [[startPoint valueForKey:@"x"]floatValue];
                y = [[startPoint valueForKey:@"y"]floatValue];
            }
            else
            {
                NSLog(@"Error2");
                self.hero.musicCode = 1;
                NSMutableDictionary *startPoint = [objects objectNamed:@"startPoint1"];
                x = [[startPoint valueForKey:@"x"]floatValue];
                y = [[startPoint valueForKey:@"y"]floatValue];
            }
            
            
        }
        else if (self.hero.mapInitMode == 3)
        {
            prev = 0;
            self.hero.musicCode = 1;
            self.spriteOrientation = 1;
            
            NSMutableDictionary *startPoint = [objects objectNamed:@"startPoint1"];
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
        self.hero.currentMap = 2;
        
        
        spriteCycleCount = 0;
        [self schedule:@selector(spriteCycle) interval:0.125];
    }
    return self;
}




-(void) updateSprite30
{
    CGSize screenSize = [[CCDirector sharedDirector] winSize];
    int x = self.hero.position.x;
    int y = self.hero.position.y;
    
    int p = self.sprite30.position.x;
    int q = self.sprite30.position.y;
    
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
        [self moveleftSprite30];
    }
    if (rand == 2)
    {
        [self moverightSprite30];
    }
    if (rand == 3)
    {
        [self moveupSprite30];
    }
    if (rand == 4)
    {
        [self movedownSprite30];
    }
    return;
}

-(void) moveleftSprite30
{
    CGPoint sprite30Pos = self.sprite30.position;
    self.sprite30.orientation = 4;
    sprite30Pos.x -= _theHKMap.tileSize.width;
    
    CGPoint tileCoord = [self tileCoordForPosition:sprite30Pos];
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
                    CGPoint tileCoord1 = [self tileCoordForPosition:self.sprite30.position];
                    int tileGID1 = [self.bgLayer tileGIDAt:tileCoord1];
                    [self.bgLayer removeTileAt:tileCoord1];
                    [self.bgLayer setTileGID:(tileGID1 - 1) at:tileCoord1];
                    
                    id actionMove = [CCMoveTo actionWithDuration:0.3 position:sprite30Pos];
                    id actionMove2 = [CCAnimate actionWithAnimation:spriteAWalkLeft restoreOriginalFrame:NO];
                    
                    id actionMoveDone = [CCCallFuncN actionWithTarget:self selector:@selector(finishActionSprite30)];
                    
                    [self.sprite30 runAction:[CCSpawn actionOne:[CCSequence actions:actionMove,actionMoveDone,nil] two:actionMove2]];
                    return;
                }
            }
        }
    }
    [self finishActionSprite30];
}
-(void) moverightSprite30
{
    CGPoint sprite30Pos = self.sprite30.position;
    self.sprite30.orientation = 3;
    sprite30Pos.x += _theHKMap.tileSize.width;
    
    CGPoint tileCoord = [self tileCoordForPosition:sprite30Pos];
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
                    CGPoint tileCoord1 = [self tileCoordForPosition:self.sprite30.position];
                    int tileGID1 = [self.bgLayer tileGIDAt:tileCoord1];
                    [self.bgLayer removeTileAt:tileCoord1];
                    [self.bgLayer setTileGID:(tileGID1 - 1) at:tileCoord1];
                    
                    id actionMove = [CCMoveTo actionWithDuration:0.3 position:sprite30Pos];
                    id actionMove2 = [CCAnimate actionWithAnimation:spriteAWalkRight restoreOriginalFrame:NO];
                    
                    id actionMoveDone = [CCCallFuncN actionWithTarget:self selector:@selector(finishActionSprite30)];
                    
                    [self.sprite30 runAction:[CCSpawn actionOne:[CCSequence actions:actionMove,actionMoveDone,nil] two:actionMove2]];
                    return;
                }
            }
        }
    }
    [self finishActionSprite30];
}
-(void) moveupSprite30
{
    CGPoint sprite30Pos = self.sprite30.position;
    self.sprite30.orientation = 2;
    sprite30Pos.y += _theHKMap.tileSize.height;
    
    CGPoint tileCoord = [self tileCoordForPosition:sprite30Pos];
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
                    CGPoint tileCoord1 = [self tileCoordForPosition:self.sprite30.position];
                    int tileGID1 = [self.bgLayer tileGIDAt:tileCoord1];
                    [self.bgLayer removeTileAt:tileCoord1];
                    [self.bgLayer setTileGID:(tileGID1 - 1) at:tileCoord1];
                    
                    id actionMove = [CCMoveTo actionWithDuration:0.3 position:sprite30Pos];
                    id actionMove2 = [CCAnimate actionWithAnimation:spriteAWalkUp restoreOriginalFrame:NO];
                    
                    id actionMoveDone = [CCCallFuncN actionWithTarget:self selector:@selector(finishActionSprite30)];
                    
                    [self.sprite30 runAction:[CCSpawn actionOne:[CCSequence actions:actionMove,actionMoveDone,nil] two:actionMove2]];
                    return;
                }
            }
        }
    }
    [self finishActionSprite30];
}
-(void) movedownSprite30
{
    CGPoint sprite30Pos = self.sprite30.position;
    self.sprite30.orientation = 1;
    sprite30Pos.y -= _theHKMap.tileSize.width;
    
    CGPoint tileCoord = [self tileCoordForPosition:sprite30Pos];
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
                    CGPoint tileCoord1 = [self tileCoordForPosition:self.sprite30.position];
                    int tileGID1 = [self.bgLayer tileGIDAt:tileCoord1];
                    [self.bgLayer removeTileAt:tileCoord1];
                    [self.bgLayer setTileGID:(tileGID1 - 1) at:tileCoord1];
                    
                    id actionMove = [CCMoveTo actionWithDuration:0.3 position:sprite30Pos];
                    id actionMove2 = [CCAnimate actionWithAnimation:spriteAWalkDown restoreOriginalFrame:NO];
                    
                    id actionMoveDone = [CCCallFuncN actionWithTarget:self selector:@selector(finishActionSprite30)];
                    
                    [self.sprite30 runAction:[CCSpawn actionOne:[CCSequence actions:actionMove,actionMoveDone,nil] two:actionMove2]];
                    return;
                }
            }
        }
    }
    [self finishActionSprite30];
}
-(void) finishActionSprite30
{
    if (self.sprite30.orientation == 1)
    {
        [self.sprite30 setDisplayFrame:[[spriteAWalkDown frames] objectAtIndex:0]];
    }
    else if (self.sprite30.orientation == 2)
    {
        [self.sprite30 setDisplayFrame:[[spriteAWalkUp frames] objectAtIndex:0]];
    }
    else if (self.sprite30.orientation == 3)
    {
        [self.sprite30 setDisplayFrame:[[spriteAWalkRight frames] objectAtIndex:0]];
    }
    else
    {
        [self.sprite30 setDisplayFrame:[[spriteAWalkLeft frames] objectAtIndex:0]];
    }
    self.hero.sprite30position = self.sprite30.position;
}

//-(void) updateSprite31;    //no update for sprite 31 (stationary)


-(void) updateSprite32
{
    CGSize screenSize = [[CCDirector sharedDirector] winSize];
    int x = self.hero.position.x;
    int y = self.hero.position.y;
    
    int p = self.sprite32.position.x;
    int q = self.sprite32.position.y;
    
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
        [self moveleftSprite32];
    }
    if (rand == 2)
    {
        [self moverightSprite32];
    }
    if (rand == 3)
    {
        [self moveupSprite32];
    }
    if (rand == 4)
    {
        [self movedownSprite32];
    }
    return;
}

-(void) moveleftSprite32
{
    CGPoint sprite32Pos = self.sprite32.position;
    self.sprite32.orientation = 4;
    sprite32Pos.x -= _theHKMap.tileSize.width;
    
    CGPoint tileCoord = [self tileCoordForPosition:sprite32Pos];
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
                    CGPoint tileCoord1 = [self tileCoordForPosition:self.sprite32.position];
                    int tileGID1 = [self.bgLayer tileGIDAt:tileCoord1];
                    [self.bgLayer removeTileAt:tileCoord1];
                    [self.bgLayer setTileGID:(tileGID1 - 3) at:tileCoord1];
                    
                    id actionMove = [CCMoveTo actionWithDuration:0.3 position:sprite32Pos];
                    id actionMove2 = [CCAnimate actionWithAnimation:spriteAWalkLeft restoreOriginalFrame:NO];
                    
                    id actionMoveDone = [CCCallFuncN actionWithTarget:self selector:@selector(finishActionSprite32)];
                    
                    [self.sprite32 runAction:[CCSpawn actionOne:[CCSequence actions:actionMove,actionMoveDone,nil] two:actionMove2]];
                    return;
                }
            }
        }
    }
    [self finishActionSprite32];
}
-(void) moverightSprite32
{
    CGPoint sprite32Pos = self.sprite32.position;
    self.sprite32.orientation = 3;
    sprite32Pos.x += _theHKMap.tileSize.width;
    
    CGPoint tileCoord = [self tileCoordForPosition:sprite32Pos];
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
                    CGPoint tileCoord1 = [self tileCoordForPosition:self.sprite32.position];
                    int tileGID1 = [self.bgLayer tileGIDAt:tileCoord1];
                    [self.bgLayer removeTileAt:tileCoord1];
                    [self.bgLayer setTileGID:(tileGID1 - 3) at:tileCoord1];
                    
                    id actionMove = [CCMoveTo actionWithDuration:0.3 position:sprite32Pos];
                    id actionMove2 = [CCAnimate actionWithAnimation:spriteAWalkRight restoreOriginalFrame:NO];
                    
                    id actionMoveDone = [CCCallFuncN actionWithTarget:self selector:@selector(finishActionSprite32)];
                    
                    [self.sprite32 runAction:[CCSpawn actionOne:[CCSequence actions:actionMove,actionMoveDone,nil] two:actionMove2]];
                    return;
                }
            }
        }
    }
    [self finishActionSprite32];
}
-(void) moveupSprite32
{
    CGPoint sprite32Pos = self.sprite32.position;
    self.sprite32.orientation = 2;
    sprite32Pos.y += _theHKMap.tileSize.height;
    
    CGPoint tileCoord = [self tileCoordForPosition:sprite32Pos];
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
                    CGPoint tileCoord1 = [self tileCoordForPosition:self.sprite32.position];
                    int tileGID1 = [self.bgLayer tileGIDAt:tileCoord1];
                    [self.bgLayer removeTileAt:tileCoord1];
                    [self.bgLayer setTileGID:(tileGID1 - 3) at:tileCoord1];
                    
                    id actionMove = [CCMoveTo actionWithDuration:0.3 position:sprite32Pos];
                    id actionMove2 = [CCAnimate actionWithAnimation:spriteAWalkUp restoreOriginalFrame:NO];
                    
                    id actionMoveDone = [CCCallFuncN actionWithTarget:self selector:@selector(finishActionSprite32)];
                    
                    [self.sprite32 runAction:[CCSpawn actionOne:[CCSequence actions:actionMove,actionMoveDone,nil] two:actionMove2]];
                    return;
                }
            }
        }
    }
    [self finishActionSprite32];
}
-(void) movedownSprite32
{
    CGPoint sprite32Pos = self.sprite32.position;
    self.sprite32.orientation = 1;
    sprite32Pos.y -= _theHKMap.tileSize.width;
    
    CGPoint tileCoord = [self tileCoordForPosition:sprite32Pos];
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
                    CGPoint tileCoord1 = [self tileCoordForPosition:self.sprite32.position];
                    int tileGID1 = [self.bgLayer tileGIDAt:tileCoord1];
                    [self.bgLayer removeTileAt:tileCoord1];
                    [self.bgLayer setTileGID:(tileGID1 - 3) at:tileCoord1];
                    
                    id actionMove = [CCMoveTo actionWithDuration:0.3 position:sprite32Pos];
                    id actionMove2 = [CCAnimate actionWithAnimation:spriteAWalkDown restoreOriginalFrame:NO];
                    
                    id actionMoveDone = [CCCallFuncN actionWithTarget:self selector:@selector(finishActionSprite32)];
                    
                    [self.sprite32 runAction:[CCSpawn actionOne:[CCSequence actions:actionMove,actionMoveDone,nil] two:actionMove2]];
                    return;
                }
            }
        }
    }
    [self finishActionSprite32];
}
-(void) finishActionSprite32
{
    if (self.sprite32.orientation == 1)
    {
        [self.sprite32 setDisplayFrame:[[spriteAWalkDown frames] objectAtIndex:0]];
    }
    else if (self.sprite32.orientation == 2)
    {
        [self.sprite32 setDisplayFrame:[[spriteAWalkUp frames] objectAtIndex:0]];
    }
    else if (self.sprite32.orientation == 3)
    {
        [self.sprite32 setDisplayFrame:[[spriteAWalkRight frames] objectAtIndex:0]];
    }
    else
    {
        [self.sprite32 setDisplayFrame:[[spriteAWalkLeft frames] objectAtIndex:0]];
    }
    self.hero.sprite32position = self.sprite32.position;
}

-(void) updateSprite33
{
    CGSize screenSize = [[CCDirector sharedDirector] winSize];
    int x = self.hero.position.x;
    int y = self.hero.position.y;
    
    int p = self.sprite33.position.x;
    int q = self.sprite33.position.y;
    
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
    
    int rand = arc4random()%14;
    if (rand == 1)
    {
        [self moveleftSprite33];
    }
    if (rand == 2)
    {
        [self moverightSprite33];
    }
    if (rand == 3)
    {
        [self moveupSprite33];
    }
    if (rand == 4)
    {
        [self movedownSprite33];
    }
    return;
}

-(void) moveleftSprite33
{
    CGPoint sprite33Pos = self.sprite33.position;
    self.sprite33.orientation = 4;
    sprite33Pos.x -= _theHKMap.tileSize.width;
    
    CGPoint tileCoord = [self tileCoordForPosition:sprite33Pos];
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
                    CGPoint tileCoord1 = [self tileCoordForPosition:self.sprite33.position];
                    int tileGID1 = [self.bgLayer tileGIDAt:tileCoord1];
                    [self.bgLayer removeTileAt:tileCoord1];
                    [self.bgLayer setTileGID:(tileGID1 - 4) at:tileCoord1];
                    
                    id actionMove = [CCMoveTo actionWithDuration:0.3 position:sprite33Pos];
                    id actionMove2 = [CCAnimate actionWithAnimation:spriteAWalkLeft restoreOriginalFrame:NO];
                    
                    id actionMoveDone = [CCCallFuncN actionWithTarget:self selector:@selector(finishActionSprite33)];
                    
                    [self.sprite33 runAction:[CCSpawn actionOne:[CCSequence actions:actionMove,actionMoveDone,nil] two:actionMove2]];
                    return;
                }
            }
        }
    }
    [self finishActionSprite33];
}
-(void) moverightSprite33
{
    CGPoint sprite33Pos = self.sprite33.position;
    self.sprite33.orientation = 3;
    sprite33Pos.x += _theHKMap.tileSize.width;
    
    CGPoint tileCoord = [self tileCoordForPosition:sprite33Pos];
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
                    CGPoint tileCoord1 = [self tileCoordForPosition:self.sprite33.position];
                    int tileGID1 = [self.bgLayer tileGIDAt:tileCoord1];
                    [self.bgLayer removeTileAt:tileCoord1];
                    [self.bgLayer setTileGID:(tileGID1 - 4) at:tileCoord1];
                    
                    id actionMove = [CCMoveTo actionWithDuration:0.3 position:sprite33Pos];
                    id actionMove2 = [CCAnimate actionWithAnimation:spriteAWalkRight restoreOriginalFrame:NO];
                    
                    id actionMoveDone = [CCCallFuncN actionWithTarget:self selector:@selector(finishActionSprite33)];
                    
                    [self.sprite33 runAction:[CCSpawn actionOne:[CCSequence actions:actionMove,actionMoveDone,nil] two:actionMove2]];
                    return;
                }
            }
        }
    }
    [self finishActionSprite33];
}
-(void) moveupSprite33
{
    CGPoint sprite33Pos = self.sprite33.position;
    self.sprite33.orientation = 2;
    sprite33Pos.y += _theHKMap.tileSize.height;
    
    CGPoint tileCoord = [self tileCoordForPosition:sprite33Pos];
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
                    CGPoint tileCoord1 = [self tileCoordForPosition:self.sprite33.position];
                    int tileGID1 = [self.bgLayer tileGIDAt:tileCoord1];
                    [self.bgLayer removeTileAt:tileCoord1];
                    [self.bgLayer setTileGID:(tileGID1 - 4) at:tileCoord1];
                    
                    id actionMove = [CCMoveTo actionWithDuration:0.3 position:sprite33Pos];
                    id actionMove2 = [CCAnimate actionWithAnimation:spriteAWalkUp restoreOriginalFrame:NO];
                    
                    id actionMoveDone = [CCCallFuncN actionWithTarget:self selector:@selector(finishActionSprite33)];
                    
                    [self.sprite33 runAction:[CCSpawn actionOne:[CCSequence actions:actionMove,actionMoveDone,nil] two:actionMove2]];
                    return;
                }
            }
        }
    }
    [self finishActionSprite33];
}
-(void) movedownSprite33
{
    CGPoint sprite33Pos = self.sprite33.position;
    self.sprite33.orientation = 1;
    sprite33Pos.y -= _theHKMap.tileSize.width;
    
    CGPoint tileCoord = [self tileCoordForPosition:sprite33Pos];
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
                    CGPoint tileCoord1 = [self tileCoordForPosition:self.sprite33.position];
                    int tileGID1 = [self.bgLayer tileGIDAt:tileCoord1];
                    [self.bgLayer removeTileAt:tileCoord1];
                    [self.bgLayer setTileGID:(tileGID1 - 4) at:tileCoord1];
                    
                    id actionMove = [CCMoveTo actionWithDuration:0.3 position:sprite33Pos];
                    id actionMove2 = [CCAnimate actionWithAnimation:spriteAWalkDown restoreOriginalFrame:NO];
                    
                    id actionMoveDone = [CCCallFuncN actionWithTarget:self selector:@selector(finishActionSprite33)];
                    
                    [self.sprite33 runAction:[CCSpawn actionOne:[CCSequence actions:actionMove,actionMoveDone,nil] two:actionMove2]];
                    return;
                }
            }
        }
    }
    [self finishActionSprite33];
}
-(void) finishActionSprite33
{
    if (self.sprite33.orientation == 1)
    {
        [self.sprite33 setDisplayFrame:[[spriteAWalkDown frames] objectAtIndex:0]];
    }
    else if (self.sprite33.orientation == 2)
    {
        [self.sprite33 setDisplayFrame:[[spriteAWalkUp frames] objectAtIndex:0]];
    }
    else if (self.sprite33.orientation == 3)
    {
        [self.sprite33 setDisplayFrame:[[spriteAWalkRight frames] objectAtIndex:0]];
    }
    else
    {
        [self.sprite33 setDisplayFrame:[[spriteAWalkLeft frames] objectAtIndex:0]];
    }
    self.hero.sprite33position = self.sprite33.position;
}



-(void) updateSprite34
{
    CGSize screenSize = [[CCDirector sharedDirector] winSize];
    int x = self.hero.position.x;
    int y = self.hero.position.y;
    
    int p = self.sprite34.position.x;
    int q = self.sprite34.position.y;
    
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
    
    int rand = arc4random()%11;
    if (rand == 1)
    {
        [self moveleftSprite34];
    }
    if (rand == 2)
    {
        [self moverightSprite34];
    }
    if (rand == 3)
    {
        [self moveupSprite34];
    }
    if (rand == 4)
    {
        [self movedownSprite34];
    }
    return;
}

-(void) moveleftSprite34
{
    CGPoint sprite34Pos = self.sprite34.position;
    self.sprite34.orientation = 4;
    sprite34Pos.x -= _theHKMap.tileSize.width;
    
    CGPoint tileCoord = [self tileCoordForPosition:sprite34Pos];
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
                    CGPoint tileCoord1 = [self tileCoordForPosition:self.sprite34.position];
                    int tileGID1 = [self.bgLayer tileGIDAt:tileCoord1];
                    [self.bgLayer removeTileAt:tileCoord1];
                    [self.bgLayer setTileGID:(tileGID1 - 5) at:tileCoord1];
                    
                    id actionMove = [CCMoveTo actionWithDuration:0.3 position:sprite34Pos];
                    id actionMove2 = [CCAnimate actionWithAnimation:spriteXWalkLeft restoreOriginalFrame:NO];
                    
                    id actionMoveDone = [CCCallFuncN actionWithTarget:self selector:@selector(finishActionSprite34)];
                    
                    [self.sprite34 runAction:[CCSpawn actionOne:[CCSequence actions:actionMove,actionMoveDone,nil] two:actionMove2]];
                    return;
                }
            }
        }
    }
    [self finishActionSprite34];
}
-(void) moverightSprite34
{
    CGPoint sprite34Pos = self.sprite34.position;
    self.sprite34.orientation = 3;
    sprite34Pos.x += _theHKMap.tileSize.width;
    
    CGPoint tileCoord = [self tileCoordForPosition:sprite34Pos];
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
                    CGPoint tileCoord1 = [self tileCoordForPosition:self.sprite34.position];
                    int tileGID1 = [self.bgLayer tileGIDAt:tileCoord1];
                    [self.bgLayer removeTileAt:tileCoord1];
                    [self.bgLayer setTileGID:(tileGID1 - 5) at:tileCoord1];
                    
                    id actionMove = [CCMoveTo actionWithDuration:0.3 position:sprite34Pos];
                    id actionMove2 = [CCAnimate actionWithAnimation:spriteXWalkRight restoreOriginalFrame:NO];
                    
                    id actionMoveDone = [CCCallFuncN actionWithTarget:self selector:@selector(finishActionSprite34)];
                    
                    [self.sprite34 runAction:[CCSpawn actionOne:[CCSequence actions:actionMove,actionMoveDone,nil] two:actionMove2]];
                    return;
                }
            }
        }
    }
    [self finishActionSprite34];
}
-(void) moveupSprite34
{
    CGPoint sprite34Pos = self.sprite34.position;
    self.sprite34.orientation = 2;
    sprite34Pos.y += _theHKMap.tileSize.height;
    
    CGPoint tileCoord = [self tileCoordForPosition:sprite34Pos];
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
                    CGPoint tileCoord1 = [self tileCoordForPosition:self.sprite34.position];
                    int tileGID1 = [self.bgLayer tileGIDAt:tileCoord1];
                    [self.bgLayer removeTileAt:tileCoord1];
                    [self.bgLayer setTileGID:(tileGID1 - 5) at:tileCoord1];
                    
                    id actionMove = [CCMoveTo actionWithDuration:0.3 position:sprite34Pos];
                    id actionMove2 = [CCAnimate actionWithAnimation:spriteXWalkUp restoreOriginalFrame:NO];
                    
                    id actionMoveDone = [CCCallFuncN actionWithTarget:self selector:@selector(finishActionSprite34)];
                    
                    [self.sprite34 runAction:[CCSpawn actionOne:[CCSequence actions:actionMove,actionMoveDone,nil] two:actionMove2]];
                    return;
                }
            }
        }
    }
    [self finishActionSprite34];
}
-(void) movedownSprite34
{
    CGPoint sprite34Pos = self.sprite34.position;
    self.sprite34.orientation = 1;
    sprite34Pos.y -= _theHKMap.tileSize.width;
    
    CGPoint tileCoord = [self tileCoordForPosition:sprite34Pos];
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
                    CGPoint tileCoord1 = [self tileCoordForPosition:self.sprite34.position];
                    int tileGID1 = [self.bgLayer tileGIDAt:tileCoord1];
                    [self.bgLayer removeTileAt:tileCoord1];
                    [self.bgLayer setTileGID:(tileGID1 - 5) at:tileCoord1];
                    
                    id actionMove = [CCMoveTo actionWithDuration:0.3 position:sprite34Pos];
                    id actionMove2 = [CCAnimate actionWithAnimation:spriteXWalkDown restoreOriginalFrame:NO];
                    
                    id actionMoveDone = [CCCallFuncN actionWithTarget:self selector:@selector(finishActionSprite34)];
                    
                    [self.sprite34 runAction:[CCSpawn actionOne:[CCSequence actions:actionMove,actionMoveDone,nil] two:actionMove2]];
                    return;
                }
            }
        }
    }
    [self finishActionSprite34];
}
-(void) finishActionSprite34
{
    if (self.sprite34.orientation == 1)
    {
        [self.sprite34 setDisplayFrame:[[spriteXWalkDown frames] objectAtIndex:0]];
    }
    else if (self.sprite34.orientation == 2)
    {
        [self.sprite34 setDisplayFrame:[[spriteXWalkUp frames] objectAtIndex:0]];
    }
    else if (self.sprite34.orientation == 3)
    {
        [self.sprite34 setDisplayFrame:[[spriteXWalkRight frames] objectAtIndex:0]];
    }
    else
    {
        [self.sprite34 setDisplayFrame:[[spriteXWalkLeft frames] objectAtIndex:0]];
    }
    self.hero.sprite34position = self.sprite34.position;
}


-(void) updateSprite35
{
    CGSize screenSize = [[CCDirector sharedDirector] winSize];
    int x = self.hero.position.x;
    int y = self.hero.position.y;
    
    int p = self.sprite35.position.x;
    int q = self.sprite35.position.y;
    
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
    
    int rand = arc4random()%14;
    if (rand == 1)
    {
        [self moveleftSprite35];
    }
    if (rand == 2)
    {
        [self moverightSprite35];
    }
    if (rand == 3)
    {
        [self moveupSprite35];
    }
    if (rand == 4)
    {
        [self movedownSprite35];
    }
    return;
}

-(void) moveleftSprite35
{
    CGPoint sprite35Pos = self.sprite35.position;
    self.sprite35.orientation = 4;
    sprite35Pos.x -= _theHKMap.tileSize.width;
    
    CGPoint tileCoord = [self tileCoordForPosition:sprite35Pos];
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
                    CGPoint tileCoord1 = [self tileCoordForPosition:self.sprite35.position];
                    int tileGID1 = [self.bgLayer tileGIDAt:tileCoord1];
                    [self.bgLayer removeTileAt:tileCoord1];
                    [self.bgLayer setTileGID:(tileGID1 - 6) at:tileCoord1];
                    
                    id actionMove = [CCMoveTo actionWithDuration:0.3 position:sprite35Pos];
                    id actionMove2 = [CCAnimate actionWithAnimation:spriteLWalkLeft restoreOriginalFrame:NO];
                    
                    id actionMoveDone = [CCCallFuncN actionWithTarget:self selector:@selector(finishActionSprite35)];
                    
                    [self.sprite35 runAction:[CCSpawn actionOne:[CCSequence actions:actionMove,actionMoveDone,nil] two:actionMove2]];
                    return;
                }
            }
        }
    }
    [self finishActionSprite35];
}
-(void) moverightSprite35
{
    CGPoint sprite35Pos = self.sprite35.position;
    self.sprite35.orientation = 3;
    sprite35Pos.x += _theHKMap.tileSize.width;
    
    CGPoint tileCoord = [self tileCoordForPosition:sprite35Pos];
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
                    CGPoint tileCoord1 = [self tileCoordForPosition:self.sprite35.position];
                    int tileGID1 = [self.bgLayer tileGIDAt:tileCoord1];
                    [self.bgLayer removeTileAt:tileCoord1];
                    [self.bgLayer setTileGID:(tileGID1 - 6) at:tileCoord1];
                    
                    id actionMove = [CCMoveTo actionWithDuration:0.3 position:sprite35Pos];
                    id actionMove2 = [CCAnimate actionWithAnimation:spriteLWalkRight restoreOriginalFrame:NO];
                    
                    id actionMoveDone = [CCCallFuncN actionWithTarget:self selector:@selector(finishActionSprite35)];
                    
                    [self.sprite35 runAction:[CCSpawn actionOne:[CCSequence actions:actionMove,actionMoveDone,nil] two:actionMove2]];
                    return;
                }
            }
        }
    }
    [self finishActionSprite35];
}
-(void) moveupSprite35
{
    CGPoint sprite35Pos = self.sprite35.position;
    self.sprite35.orientation = 2;
    sprite35Pos.y += _theHKMap.tileSize.height;
    
    CGPoint tileCoord = [self tileCoordForPosition:sprite35Pos];
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
                    CGPoint tileCoord1 = [self tileCoordForPosition:self.sprite35.position];
                    int tileGID1 = [self.bgLayer tileGIDAt:tileCoord1];
                    [self.bgLayer removeTileAt:tileCoord1];
                    [self.bgLayer setTileGID:(tileGID1 - 6) at:tileCoord1];
                    
                    id actionMove = [CCMoveTo actionWithDuration:0.3 position:sprite35Pos];
                    id actionMove2 = [CCAnimate actionWithAnimation:spriteLWalkUp restoreOriginalFrame:NO];
                    
                    id actionMoveDone = [CCCallFuncN actionWithTarget:self selector:@selector(finishActionSprite35)];
                    
                    [self.sprite35 runAction:[CCSpawn actionOne:[CCSequence actions:actionMove,actionMoveDone,nil] two:actionMove2]];
                    return;
                }
            }
        }
    }
    [self finishActionSprite35];
}
-(void) movedownSprite35
{
    CGPoint sprite35Pos = self.sprite35.position;
    self.sprite35.orientation = 1;
    sprite35Pos.y -= _theHKMap.tileSize.width;
    
    CGPoint tileCoord = [self tileCoordForPosition:sprite35Pos];
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
                    CGPoint tileCoord1 = [self tileCoordForPosition:self.sprite35.position];
                    int tileGID1 = [self.bgLayer tileGIDAt:tileCoord1];
                    [self.bgLayer removeTileAt:tileCoord1];
                    [self.bgLayer setTileGID:(tileGID1 - 6) at:tileCoord1];
                    
                    id actionMove = [CCMoveTo actionWithDuration:0.3 position:sprite35Pos];
                    id actionMove2 = [CCAnimate actionWithAnimation:spriteLWalkDown restoreOriginalFrame:NO];
                    
                    id actionMoveDone = [CCCallFuncN actionWithTarget:self selector:@selector(finishActionSprite35)];
                    
                    [self.sprite35 runAction:[CCSpawn actionOne:[CCSequence actions:actionMove,actionMoveDone,nil] two:actionMove2]];
                    return;
                }
            }
        }
    }
    [self finishActionSprite35];
}
-(void) finishActionSprite35
{
    if (self.sprite35.orientation == 1)
    {
        [self.sprite35 setDisplayFrame:[[spriteLWalkDown frames] objectAtIndex:0]];
    }
    else if (self.sprite35.orientation == 2)
    {
        [self.sprite35 setDisplayFrame:[[spriteLWalkUp frames] objectAtIndex:0]];
    }
    else if (self.sprite35.orientation == 3)
    {
        [self.sprite35 setDisplayFrame:[[spriteLWalkRight frames] objectAtIndex:0]];
    }
    else
    {
        [self.sprite35 setDisplayFrame:[[spriteLWalkLeft frames] objectAtIndex:0]];
    }
    self.hero.sprite35position = self.sprite35.position;
}


-(void) updateSprite36
{
    CGSize screenSize = [[CCDirector sharedDirector] winSize];
    int x = self.hero.position.x;
    int y = self.hero.position.y;
    
    int p = self.sprite36.position.x;
    int q = self.sprite36.position.y;
    
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
        [self moveleftSprite36];
    }
    if (rand == 2)
    {
        [self moverightSprite36];
    }
    if (rand == 3)
    {
        [self moveupSprite36];
    }
    if (rand == 4)
    {
        [self movedownSprite36];
    }
    return;
}

-(void) moveleftSprite36
{
    CGPoint sprite36Pos = self.sprite36.position;
    self.sprite36.orientation = 4;
    sprite36Pos.x -= _theHKMap.tileSize.width;
    
    CGPoint tileCoord = [self tileCoordForPosition:sprite36Pos];
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
                    CGPoint tileCoord1 = [self tileCoordForPosition:self.sprite36.position];
                    int tileGID1 = [self.bgLayer tileGIDAt:tileCoord1];
                    [self.bgLayer removeTileAt:tileCoord1];
                    [self.bgLayer setTileGID:(tileGID1 - 7) at:tileCoord1];
                    
                    id actionMove = [CCMoveTo actionWithDuration:0.3 position:sprite36Pos];
                    id actionMove2 = [CCAnimate actionWithAnimation:spriteCWalkLeft restoreOriginalFrame:NO];
                    
                    id actionMoveDone = [CCCallFuncN actionWithTarget:self selector:@selector(finishActionSprite36)];
                    
                    [self.sprite36 runAction:[CCSpawn actionOne:[CCSequence actions:actionMove,actionMoveDone,nil] two:actionMove2]];
                    return;
                }
            }
        }
    }
    [self finishActionSprite36];
}
-(void) moverightSprite36
{
    CGPoint sprite36Pos = self.sprite36.position;
    self.sprite36.orientation = 3;
    sprite36Pos.x += _theHKMap.tileSize.width;
    
    CGPoint tileCoord = [self tileCoordForPosition:sprite36Pos];
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
                    CGPoint tileCoord1 = [self tileCoordForPosition:self.sprite36.position];
                    int tileGID1 = [self.bgLayer tileGIDAt:tileCoord1];
                    [self.bgLayer removeTileAt:tileCoord1];
                    [self.bgLayer setTileGID:(tileGID1 - 7) at:tileCoord1];
                    
                    id actionMove = [CCMoveTo actionWithDuration:0.3 position:sprite36Pos];
                    id actionMove2 = [CCAnimate actionWithAnimation:spriteCWalkRight restoreOriginalFrame:NO];
                    
                    id actionMoveDone = [CCCallFuncN actionWithTarget:self selector:@selector(finishActionSprite36)];
                    
                    [self.sprite36 runAction:[CCSpawn actionOne:[CCSequence actions:actionMove,actionMoveDone,nil] two:actionMove2]];
                    return;
                }
            }
        }
    }
    [self finishActionSprite36];
}
-(void) moveupSprite36
{
    CGPoint sprite36Pos = self.sprite36.position;
    self.sprite36.orientation = 2;
    sprite36Pos.y += _theHKMap.tileSize.height;
    
    CGPoint tileCoord = [self tileCoordForPosition:sprite36Pos];
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
                    CGPoint tileCoord1 = [self tileCoordForPosition:self.sprite36.position];
                    int tileGID1 = [self.bgLayer tileGIDAt:tileCoord1];
                    [self.bgLayer removeTileAt:tileCoord1];
                    [self.bgLayer setTileGID:(tileGID1 - 7) at:tileCoord1];
                    
                    id actionMove = [CCMoveTo actionWithDuration:0.3 position:sprite36Pos];
                    id actionMove2 = [CCAnimate actionWithAnimation:spriteCWalkUp restoreOriginalFrame:NO];
                    
                    id actionMoveDone = [CCCallFuncN actionWithTarget:self selector:@selector(finishActionSprite36)];
                    
                    [self.sprite36 runAction:[CCSpawn actionOne:[CCSequence actions:actionMove,actionMoveDone,nil] two:actionMove2]];
                    return;
                }
            }
        }
    }
    [self finishActionSprite36];
}
-(void) movedownSprite36
{
    CGPoint sprite36Pos = self.sprite36.position;
    self.sprite36.orientation = 1;
    sprite36Pos.y -= _theHKMap.tileSize.width;
    
    CGPoint tileCoord = [self tileCoordForPosition:sprite36Pos];
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
                    CGPoint tileCoord1 = [self tileCoordForPosition:self.sprite36.position];
                    int tileGID1 = [self.bgLayer tileGIDAt:tileCoord1];
                    [self.bgLayer removeTileAt:tileCoord1];
                    [self.bgLayer setTileGID:(tileGID1 - 7) at:tileCoord1];
                    
                    id actionMove = [CCMoveTo actionWithDuration:0.3 position:sprite36Pos];
                    id actionMove2 = [CCAnimate actionWithAnimation:spriteCWalkDown restoreOriginalFrame:NO];
                    
                    id actionMoveDone = [CCCallFuncN actionWithTarget:self selector:@selector(finishActionSprite36)];
                    
                    [self.sprite36 runAction:[CCSpawn actionOne:[CCSequence actions:actionMove,actionMoveDone,nil] two:actionMove2]];
                    return;
                }
            }
        }
    }
    [self finishActionSprite36];
}
-(void) finishActionSprite36
{
    if (self.sprite36.orientation == 1)
    {
        [self.sprite36 setDisplayFrame:[[spriteCWalkDown frames] objectAtIndex:0]];
    }
    else if (self.sprite36.orientation == 2)
    {
        [self.sprite36 setDisplayFrame:[[spriteCWalkUp frames] objectAtIndex:0]];
    }
    else if (self.sprite36.orientation == 3)
    {
        [self.sprite36 setDisplayFrame:[[spriteCWalkRight frames] objectAtIndex:0]];
    }
    else
    {
        [self.sprite36 setDisplayFrame:[[spriteCWalkLeft frames] objectAtIndex:0]];
    }
    self.hero.sprite36position = self.sprite36.position;
}


-(void) updateSprite37
{
    CGSize screenSize = [[CCDirector sharedDirector] winSize];
    int x = self.hero.position.x;
    int y = self.hero.position.y;
    
    int p = self.sprite37.position.x;
    int q = self.sprite37.position.y;
    
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
    
    int rand = arc4random()%14;
    if (rand == 1)
    {
        [self moveleftSprite37];
    }
    if (rand == 2)
    {
        [self moverightSprite37];
    }
    if (rand == 3)
    {
        [self moveupSprite37];
    }
    if (rand == 4)
    {
        [self movedownSprite37];
    }
    return;
}

-(void) moveleftSprite37
{
    CGPoint sprite37Pos = self.sprite37.position;
    self.sprite37.orientation = 4;
    sprite37Pos.x -= _theHKMap.tileSize.width;
    
    CGPoint tileCoord = [self tileCoordForPosition:sprite37Pos];
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
                    CGPoint tileCoord1 = [self tileCoordForPosition:self.sprite37.position];
                    int tileGID1 = [self.bgLayer tileGIDAt:tileCoord1];
                    [self.bgLayer removeTileAt:tileCoord1];
                    [self.bgLayer setTileGID:(tileGID1 - 8) at:tileCoord1];
                    
                    id actionMove = [CCMoveTo actionWithDuration:0.3 position:sprite37Pos];
                    id actionMove2 = [CCAnimate actionWithAnimation:spriteZBWalkLeft restoreOriginalFrame:NO];
                    
                    id actionMoveDone = [CCCallFuncN actionWithTarget:self selector:@selector(finishActionSprite37)];
                    
                    [self.sprite37 runAction:[CCSpawn actionOne:[CCSequence actions:actionMove,actionMoveDone,nil] two:actionMove2]];
                    return;
                }
            }
        }
    }
    [self finishActionSprite37];
}
-(void) moverightSprite37
{
    CGPoint sprite37Pos = self.sprite37.position;
    self.sprite37.orientation = 3;
    sprite37Pos.x += _theHKMap.tileSize.width;
    
    CGPoint tileCoord = [self tileCoordForPosition:sprite37Pos];
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
                    CGPoint tileCoord1 = [self tileCoordForPosition:self.sprite37.position];
                    int tileGID1 = [self.bgLayer tileGIDAt:tileCoord1];
                    [self.bgLayer removeTileAt:tileCoord1];
                    [self.bgLayer setTileGID:(tileGID1 - 8) at:tileCoord1];
                    
                    id actionMove = [CCMoveTo actionWithDuration:0.3 position:sprite37Pos];
                    id actionMove2 = [CCAnimate actionWithAnimation:spriteZBWalkRight restoreOriginalFrame:NO];
                    
                    id actionMoveDone = [CCCallFuncN actionWithTarget:self selector:@selector(finishActionSprite37)];
                    
                    [self.sprite37 runAction:[CCSpawn actionOne:[CCSequence actions:actionMove,actionMoveDone,nil] two:actionMove2]];
                    return;
                }
            }
        }
    }
    [self finishActionSprite37];
}
-(void) moveupSprite37
{
    CGPoint sprite37Pos = self.sprite37.position;
    self.sprite37.orientation = 2;
    sprite37Pos.y += _theHKMap.tileSize.height;
    
    CGPoint tileCoord = [self tileCoordForPosition:sprite37Pos];
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
                    CGPoint tileCoord1 = [self tileCoordForPosition:self.sprite37.position];
                    int tileGID1 = [self.bgLayer tileGIDAt:tileCoord1];
                    [self.bgLayer removeTileAt:tileCoord1];
                    [self.bgLayer setTileGID:(tileGID1 - 8) at:tileCoord1];
                    
                    id actionMove = [CCMoveTo actionWithDuration:0.3 position:sprite37Pos];
                    id actionMove2 = [CCAnimate actionWithAnimation:spriteZBWalkUp restoreOriginalFrame:NO];
                    
                    id actionMoveDone = [CCCallFuncN actionWithTarget:self selector:@selector(finishActionSprite37)];
                    
                    [self.sprite37 runAction:[CCSpawn actionOne:[CCSequence actions:actionMove,actionMoveDone,nil] two:actionMove2]];
                    return;
                }
            }
        }
    }
    [self finishActionSprite37];
}
-(void) movedownSprite37
{
    CGPoint sprite37Pos = self.sprite37.position;
    self.sprite37.orientation = 1;
    sprite37Pos.y -= _theHKMap.tileSize.width;
    
    CGPoint tileCoord = [self tileCoordForPosition:sprite37Pos];
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
                    CGPoint tileCoord1 = [self tileCoordForPosition:self.sprite37.position];
                    int tileGID1 = [self.bgLayer tileGIDAt:tileCoord1];
                    [self.bgLayer removeTileAt:tileCoord1];
                    [self.bgLayer setTileGID:(tileGID1 - 8) at:tileCoord1];
                    
                    id actionMove = [CCMoveTo actionWithDuration:0.3 position:sprite37Pos];
                    id actionMove2 = [CCAnimate actionWithAnimation:spriteZBWalkDown restoreOriginalFrame:NO];
                    
                    id actionMoveDone = [CCCallFuncN actionWithTarget:self selector:@selector(finishActionSprite37)];
                    
                    [self.sprite37 runAction:[CCSpawn actionOne:[CCSequence actions:actionMove,actionMoveDone,nil] two:actionMove2]];
                    return;
                }
            }
        }
    }
    [self finishActionSprite37];
}
-(void) finishActionSprite37
{
    if (self.sprite37.orientation == 1)
    {
        [self.sprite37 setDisplayFrame:[[spriteZBWalkDown frames] objectAtIndex:0]];
    }
    else if (self.sprite37.orientation == 2)
    {
        [self.sprite37 setDisplayFrame:[[spriteZBWalkUp frames] objectAtIndex:0]];
    }
    else if (self.sprite37.orientation == 3)
    {
        [self.sprite37 setDisplayFrame:[[spriteZBWalkRight frames] objectAtIndex:0]];
    }
    else
    {
        [self.sprite37 setDisplayFrame:[[spriteZBWalkLeft frames] objectAtIndex:0]];
    }
    self.hero.sprite37position = self.sprite37.position;
}


-(void) updateSprite38
{
    CGSize screenSize = [[CCDirector sharedDirector] winSize];
    int x = self.hero.position.x;
    int y = self.hero.position.y;
    
    int p = self.sprite38.position.x;
    int q = self.sprite38.position.y;
    
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
    
    int rand = arc4random()%10;
    if (rand == 1)
    {
        [self moveleftSprite38];
    }
    if (rand == 2)
    {
        [self moverightSprite38];
    }
    if (rand == 3)
    {
        [self moveupSprite38];
    }
    if (rand == 4)
    {
        [self movedownSprite38];
    }
    return;
}

-(void) moveleftSprite38
{
    CGPoint sprite38Pos = self.sprite38.position;
    self.sprite38.orientation = 4;
    sprite38Pos.x -= _theHKMap.tileSize.width;
    
    CGPoint tileCoord = [self tileCoordForPosition:sprite38Pos];
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
                    CGPoint tileCoord1 = [self tileCoordForPosition:self.sprite38.position];
                    int tileGID1 = [self.bgLayer tileGIDAt:tileCoord1];
                    [self.bgLayer removeTileAt:tileCoord1];
                    [self.bgLayer setTileGID:(tileGID1 - 9) at:tileCoord1];
                    
                    id actionMove = [CCMoveTo actionWithDuration:0.3 position:sprite38Pos];
                    id actionMove2 = [CCAnimate actionWithAnimation:spriteOWalkLeft restoreOriginalFrame:NO];
                    
                    id actionMoveDone = [CCCallFuncN actionWithTarget:self selector:@selector(finishActionSprite38)];
                    
                    [self.sprite38 runAction:[CCSpawn actionOne:[CCSequence actions:actionMove,actionMoveDone,nil] two:actionMove2]];
                    return;
                }
            }
        }
    }
    [self finishActionSprite38];
}
-(void) moverightSprite38
{
    CGPoint sprite38Pos = self.sprite38.position;
    self.sprite38.orientation = 3;
    sprite38Pos.x += _theHKMap.tileSize.width;
    
    CGPoint tileCoord = [self tileCoordForPosition:sprite38Pos];
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
                    CGPoint tileCoord1 = [self tileCoordForPosition:self.sprite38.position];
                    int tileGID1 = [self.bgLayer tileGIDAt:tileCoord1];
                    [self.bgLayer removeTileAt:tileCoord1];
                    [self.bgLayer setTileGID:(tileGID1 - 9) at:tileCoord1];
                    
                    id actionMove = [CCMoveTo actionWithDuration:0.3 position:sprite38Pos];
                    id actionMove2 = [CCAnimate actionWithAnimation:spriteOWalkRight restoreOriginalFrame:NO];
                    
                    id actionMoveDone = [CCCallFuncN actionWithTarget:self selector:@selector(finishActionSprite38)];
                    
                    [self.sprite38 runAction:[CCSpawn actionOne:[CCSequence actions:actionMove,actionMoveDone,nil] two:actionMove2]];
                    return;
                }
            }
        }
    }
    [self finishActionSprite38];
}
-(void) moveupSprite38
{
    CGPoint sprite38Pos = self.sprite38.position;
    self.sprite38.orientation = 2;
    sprite38Pos.y += _theHKMap.tileSize.height;
    
    CGPoint tileCoord = [self tileCoordForPosition:sprite38Pos];
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
                    CGPoint tileCoord1 = [self tileCoordForPosition:self.sprite38.position];
                    int tileGID1 = [self.bgLayer tileGIDAt:tileCoord1];
                    [self.bgLayer removeTileAt:tileCoord1];
                    [self.bgLayer setTileGID:(tileGID1 - 9) at:tileCoord1];
                    
                    id actionMove = [CCMoveTo actionWithDuration:0.3 position:sprite38Pos];
                    id actionMove2 = [CCAnimate actionWithAnimation:spriteOWalkUp restoreOriginalFrame:NO];
                    
                    id actionMoveDone = [CCCallFuncN actionWithTarget:self selector:@selector(finishActionSprite38)];
                    
                    [self.sprite38 runAction:[CCSpawn actionOne:[CCSequence actions:actionMove,actionMoveDone,nil] two:actionMove2]];
                    return;
                }
            }
        }
    }
    [self finishActionSprite38];
}
-(void) movedownSprite38
{
    CGPoint sprite38Pos = self.sprite38.position;
    self.sprite38.orientation = 1;
    sprite38Pos.y -= _theHKMap.tileSize.width;
    
    CGPoint tileCoord = [self tileCoordForPosition:sprite38Pos];
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
                    CGPoint tileCoord1 = [self tileCoordForPosition:self.sprite38.position];
                    int tileGID1 = [self.bgLayer tileGIDAt:tileCoord1];
                    [self.bgLayer removeTileAt:tileCoord1];
                    [self.bgLayer setTileGID:(tileGID1 - 9) at:tileCoord1];
                    
                    id actionMove = [CCMoveTo actionWithDuration:0.3 position:sprite38Pos];
                    id actionMove2 = [CCAnimate actionWithAnimation:spriteOWalkDown restoreOriginalFrame:NO];
                    
                    id actionMoveDone = [CCCallFuncN actionWithTarget:self selector:@selector(finishActionSprite38)];
                    
                    [self.sprite38 runAction:[CCSpawn actionOne:[CCSequence actions:actionMove,actionMoveDone,nil] two:actionMove2]];
                    return;
                }
            }
        }
    }
    [self finishActionSprite38];
}
-(void) finishActionSprite38
{
    if (self.sprite38.orientation == 1)
    {
        [self.sprite38 setDisplayFrame:[[spriteOWalkDown frames] objectAtIndex:0]];
    }
    else if (self.sprite38.orientation == 2)
    {
        [self.sprite38 setDisplayFrame:[[spriteOWalkUp frames] objectAtIndex:0]];
    }
    else if (self.sprite38.orientation == 3)
    {
        [self.sprite38 setDisplayFrame:[[spriteOWalkRight frames] objectAtIndex:0]];
    }
    else
    {
        [self.sprite38 setDisplayFrame:[[spriteOWalkLeft frames] objectAtIndex:0]];
    }
    self.hero.sprite38position = self.sprite38.position;
}


-(void) updateSprite39
{
    CGSize screenSize = [[CCDirector sharedDirector] winSize];
    int x = self.hero.position.x;
    int y = self.hero.position.y;
    
    int p = self.sprite39.position.x;
    int q = self.sprite39.position.y;
    
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
    
    int rand = arc4random()%14;
    if (rand == 1)
    {
        [self moveleftSprite39];
    }
    if (rand == 2)
    {
        [self moverightSprite39];
    }
    if (rand == 3)
    {
        [self moveupSprite39];
    }
    if (rand == 4)
    {
        [self movedownSprite39];
    }
    return;
}

-(void) moveleftSprite39
{
    CGPoint sprite39Pos = self.sprite39.position;
    self.sprite39.orientation = 4;
    sprite39Pos.x -= _theHKMap.tileSize.width;
    
    CGPoint tileCoord = [self tileCoordForPosition:sprite39Pos];
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
                    CGPoint tileCoord1 = [self tileCoordForPosition:self.sprite39.position];
                    int tileGID1 = [self.bgLayer tileGIDAt:tileCoord1];
                    [self.bgLayer removeTileAt:tileCoord1];
                    [self.bgLayer setTileGID:(tileGID1 - 10) at:tileCoord1];
                    
                    id actionMove = [CCMoveTo actionWithDuration:0.3 position:sprite39Pos];
                    id actionMove2 = [CCAnimate actionWithAnimation:spriteSWalkLeft restoreOriginalFrame:NO];
                    
                    id actionMoveDone = [CCCallFuncN actionWithTarget:self selector:@selector(finishActionSprite39)];
                    
                    [self.sprite39 runAction:[CCSpawn actionOne:[CCSequence actions:actionMove,actionMoveDone,nil] two:actionMove2]];
                    return;
                }
            }
        }
    }
    [self finishActionSprite39];
}
-(void) moverightSprite39
{
    CGPoint sprite39Pos = self.sprite39.position;
    self.sprite39.orientation = 3;
    sprite39Pos.x += _theHKMap.tileSize.width;
    
    CGPoint tileCoord = [self tileCoordForPosition:sprite39Pos];
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
                    CGPoint tileCoord1 = [self tileCoordForPosition:self.sprite39.position];
                    int tileGID1 = [self.bgLayer tileGIDAt:tileCoord1];
                    [self.bgLayer removeTileAt:tileCoord1];
                    [self.bgLayer setTileGID:(tileGID1 - 10) at:tileCoord1];
                    
                    id actionMove = [CCMoveTo actionWithDuration:0.3 position:sprite39Pos];
                    id actionMove2 = [CCAnimate actionWithAnimation:spriteSWalkRight restoreOriginalFrame:NO];
                    
                    id actionMoveDone = [CCCallFuncN actionWithTarget:self selector:@selector(finishActionSprite39)];
                    
                    [self.sprite39 runAction:[CCSpawn actionOne:[CCSequence actions:actionMove,actionMoveDone,nil] two:actionMove2]];
                    return;
                }
            }
        }
    }
    [self finishActionSprite39];
}
-(void) moveupSprite39
{
    CGPoint sprite39Pos = self.sprite39.position;
    self.sprite39.orientation = 2;
    sprite39Pos.y += _theHKMap.tileSize.height;
    
    CGPoint tileCoord = [self tileCoordForPosition:sprite39Pos];
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
                    CGPoint tileCoord1 = [self tileCoordForPosition:self.sprite39.position];
                    int tileGID1 = [self.bgLayer tileGIDAt:tileCoord1];
                    [self.bgLayer removeTileAt:tileCoord1];
                    [self.bgLayer setTileGID:(tileGID1 - 10) at:tileCoord1];
                    
                    id actionMove = [CCMoveTo actionWithDuration:0.3 position:sprite39Pos];
                    id actionMove2 = [CCAnimate actionWithAnimation:spriteSWalkUp restoreOriginalFrame:NO];
                    
                    id actionMoveDone = [CCCallFuncN actionWithTarget:self selector:@selector(finishActionSprite39)];
                    
                    [self.sprite39 runAction:[CCSpawn actionOne:[CCSequence actions:actionMove,actionMoveDone,nil] two:actionMove2]];
                    return;
                }
            }
        }
    }
    [self finishActionSprite39];
}
-(void) movedownSprite39
{
    CGPoint sprite39Pos = self.sprite39.position;
    self.sprite39.orientation = 1;
    sprite39Pos.y -= _theHKMap.tileSize.width;
    
    CGPoint tileCoord = [self tileCoordForPosition:sprite39Pos];
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
                    CGPoint tileCoord1 = [self tileCoordForPosition:self.sprite39.position];
                    int tileGID1 = [self.bgLayer tileGIDAt:tileCoord1];
                    [self.bgLayer removeTileAt:tileCoord1];
                    [self.bgLayer setTileGID:(tileGID1 - 10) at:tileCoord1];
                    
                    id actionMove = [CCMoveTo actionWithDuration:0.3 position:sprite39Pos];
                    id actionMove2 = [CCAnimate actionWithAnimation:spriteSWalkDown restoreOriginalFrame:NO];
                    
                    id actionMoveDone = [CCCallFuncN actionWithTarget:self selector:@selector(finishActionSprite39)];
                    
                    [self.sprite39 runAction:[CCSpawn actionOne:[CCSequence actions:actionMove,actionMoveDone,nil] two:actionMove2]];
                    return;
                }
            }
        }
    }
    [self finishActionSprite39];
}
-(void) finishActionSprite39
{
    if (self.sprite39.orientation == 1)
    {
        [self.sprite39 setDisplayFrame:[[spriteSWalkDown frames] objectAtIndex:0]];
    }
    else if (self.sprite39.orientation == 2)
    {
        [self.sprite39 setDisplayFrame:[[spriteSWalkUp frames] objectAtIndex:0]];
    }
    else if (self.sprite39.orientation == 3)
    {
        [self.sprite39 setDisplayFrame:[[spriteSWalkRight frames] objectAtIndex:0]];
    }
    else
    {
        [self.sprite39 setDisplayFrame:[[spriteSWalkLeft frames] objectAtIndex:0]];
    }
    self.hero.sprite39position = self.sprite39.position;
}


-(void) updateSprite40
{
    CGSize screenSize = [[CCDirector sharedDirector] winSize];
    int x = self.hero.position.x;
    int y = self.hero.position.y;
    
    int p = self.sprite40.position.x;
    int q = self.sprite40.position.y;
    
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
        [self moveleftSprite40];
    }
    if (rand == 2)
    {
        [self moverightSprite40];
    }
    if (rand == 3)
    {
        [self moveupSprite40];
    }
    if (rand == 4)
    {
        [self movedownSprite40];
    }
    return;
}

-(void) moveleftSprite40
{
    CGPoint sprite40Pos = self.sprite40.position;
    self.sprite40.orientation = 4;
    sprite40Pos.x -= _theHKMap.tileSize.width;
    
    CGPoint tileCoord = [self tileCoordForPosition:sprite40Pos];
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
                    [self.bgLayer setTileGID:(tileGID + 11) at:tileCoord];
                    CGPoint tileCoord1 = [self tileCoordForPosition:self.sprite40.position];
                    int tileGID1 = [self.bgLayer tileGIDAt:tileCoord1];
                    [self.bgLayer removeTileAt:tileCoord1];
                    [self.bgLayer setTileGID:(tileGID1 - 11) at:tileCoord1];
                    
                    id actionMove = [CCMoveTo actionWithDuration:0.3 position:sprite40Pos];
                    id actionMove2 = [CCAnimate actionWithAnimation:spriteRWalkLeft restoreOriginalFrame:NO];
                    
                    id actionMoveDone = [CCCallFuncN actionWithTarget:self selector:@selector(finishActionSprite40)];
                    
                    [self.sprite40 runAction:[CCSpawn actionOne:[CCSequence actions:actionMove,actionMoveDone,nil] two:actionMove2]];
                    return;
                }
            }
        }
    }
    [self finishActionSprite40];
}
-(void) moverightSprite40
{
    CGPoint sprite40Pos = self.sprite40.position;
    self.sprite40.orientation = 3;
    sprite40Pos.x += _theHKMap.tileSize.width;
    
    CGPoint tileCoord = [self tileCoordForPosition:sprite40Pos];
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
                    [self.bgLayer setTileGID:(tileGID + 11) at:tileCoord];
                    CGPoint tileCoord1 = [self tileCoordForPosition:self.sprite40.position];
                    int tileGID1 = [self.bgLayer tileGIDAt:tileCoord1];
                    [self.bgLayer removeTileAt:tileCoord1];
                    [self.bgLayer setTileGID:(tileGID1 - 11) at:tileCoord1];
                    
                    id actionMove = [CCMoveTo actionWithDuration:0.3 position:sprite40Pos];
                    id actionMove2 = [CCAnimate actionWithAnimation:spriteRWalkRight restoreOriginalFrame:NO];
                    
                    id actionMoveDone = [CCCallFuncN actionWithTarget:self selector:@selector(finishActionSprite40)];
                    
                    [self.sprite40 runAction:[CCSpawn actionOne:[CCSequence actions:actionMove,actionMoveDone,nil] two:actionMove2]];
                    return;
                }
            }
        }
    }
    [self finishActionSprite40];
}
-(void) moveupSprite40
{
    CGPoint sprite40Pos = self.sprite40.position;
    self.sprite40.orientation = 2;
    sprite40Pos.y += _theHKMap.tileSize.height;
    
    CGPoint tileCoord = [self tileCoordForPosition:sprite40Pos];
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
                    [self.bgLayer setTileGID:(tileGID + 11) at:tileCoord];
                    CGPoint tileCoord1 = [self tileCoordForPosition:self.sprite40.position];
                    int tileGID1 = [self.bgLayer tileGIDAt:tileCoord1];
                    [self.bgLayer removeTileAt:tileCoord1];
                    [self.bgLayer setTileGID:(tileGID1 - 11) at:tileCoord1];
                    
                    id actionMove = [CCMoveTo actionWithDuration:0.3 position:sprite40Pos];
                    id actionMove2 = [CCAnimate actionWithAnimation:spriteRWalkUp restoreOriginalFrame:NO];
                    
                    id actionMoveDone = [CCCallFuncN actionWithTarget:self selector:@selector(finishActionSprite40)];
                    
                    [self.sprite40 runAction:[CCSpawn actionOne:[CCSequence actions:actionMove,actionMoveDone,nil] two:actionMove2]];
                    return;
                }
            }
        }
    }
    [self finishActionSprite40];
}
-(void) movedownSprite40
{
    CGPoint sprite40Pos = self.sprite40.position;
    self.sprite40.orientation = 1;
    sprite40Pos.y -= _theHKMap.tileSize.width;
    
    CGPoint tileCoord = [self tileCoordForPosition:sprite40Pos];
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
                    [self.bgLayer setTileGID:(tileGID + 11) at:tileCoord];
                    CGPoint tileCoord1 = [self tileCoordForPosition:self.sprite40.position];
                    int tileGID1 = [self.bgLayer tileGIDAt:tileCoord1];
                    [self.bgLayer removeTileAt:tileCoord1];
                    [self.bgLayer setTileGID:(tileGID1 - 11) at:tileCoord1];
                    
                    id actionMove = [CCMoveTo actionWithDuration:0.3 position:sprite40Pos];
                    id actionMove2 = [CCAnimate actionWithAnimation:spriteRWalkDown restoreOriginalFrame:NO];
                    
                    id actionMoveDone = [CCCallFuncN actionWithTarget:self selector:@selector(finishActionSprite40)];
                    
                    [self.sprite40 runAction:[CCSpawn actionOne:[CCSequence actions:actionMove,actionMoveDone,nil] two:actionMove2]];
                    return;
                }
            }
        }
    }
    [self finishActionSprite40];
}
-(void) finishActionSprite40
{
    if (self.sprite40.orientation == 1)
    {
        [self.sprite40 setDisplayFrame:[[spriteRWalkDown frames] objectAtIndex:0]];
    }
    else if (self.sprite40.orientation == 2)
    {
        [self.sprite40 setDisplayFrame:[[spriteRWalkUp frames] objectAtIndex:0]];
    }
    else if (self.sprite40.orientation == 3)
    {
        [self.sprite40 setDisplayFrame:[[spriteRWalkRight frames] objectAtIndex:0]];
    }
    else
    {
        [self.sprite40 setDisplayFrame:[[spriteRWalkLeft frames] objectAtIndex:0]];
    }
    self.hero.sprite40position = self.sprite40.position;
}


-(void) updateSprite41
{
    CGSize screenSize = [[CCDirector sharedDirector] winSize];
    int x = self.hero.position.x;
    int y = self.hero.position.y;
    
    int p = self.sprite41.position.x;
    int q = self.sprite41.position.y;
    
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
    
    int rand = arc4random()%11;
    if (rand == 1)
    {
        [self moveleftSprite41];
    }
    if (rand == 2)
    {
        [self moverightSprite41];
    }
    if (rand == 3)
    {
        [self moveupSprite41];
    }
    if (rand == 4)
    {
        [self movedownSprite41];
    }
    return;
}

-(void) moveleftSprite41
{
    CGPoint sprite41Pos = self.sprite41.position;
    self.sprite41.orientation = 4;
    sprite41Pos.x -= _theHKMap.tileSize.width;
    
    CGPoint tileCoord = [self tileCoordForPosition:sprite41Pos];
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
                    [self.bgLayer setTileGID:(tileGID + 12) at:tileCoord];
                    CGPoint tileCoord1 = [self tileCoordForPosition:self.sprite41.position];
                    int tileGID1 = [self.bgLayer tileGIDAt:tileCoord1];
                    [self.bgLayer removeTileAt:tileCoord1];
                    [self.bgLayer setTileGID:(tileGID1 - 12) at:tileCoord1];
                    
                    id actionMove = [CCMoveTo actionWithDuration:0.3 position:sprite41Pos];
                    id actionMove2 = [CCAnimate actionWithAnimation:spriteMWalkLeft restoreOriginalFrame:NO];
                    
                    id actionMoveDone = [CCCallFuncN actionWithTarget:self selector:@selector(finishActionSprite41)];
                    
                    [self.sprite41 runAction:[CCSpawn actionOne:[CCSequence actions:actionMove,actionMoveDone,nil] two:actionMove2]];
                    return;
                }
            }
        }
    }
    [self finishActionSprite41];
}
-(void) moverightSprite41
{
    CGPoint sprite41Pos = self.sprite41.position;
    self.sprite41.orientation = 3;
    sprite41Pos.x += _theHKMap.tileSize.width;
    
    CGPoint tileCoord = [self tileCoordForPosition:sprite41Pos];
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
                    [self.bgLayer setTileGID:(tileGID + 12) at:tileCoord];
                    CGPoint tileCoord1 = [self tileCoordForPosition:self.sprite41.position];
                    int tileGID1 = [self.bgLayer tileGIDAt:tileCoord1];
                    [self.bgLayer removeTileAt:tileCoord1];
                    [self.bgLayer setTileGID:(tileGID1 - 12) at:tileCoord1];
                    
                    id actionMove = [CCMoveTo actionWithDuration:0.3 position:sprite41Pos];
                    id actionMove2 = [CCAnimate actionWithAnimation:spriteMWalkRight restoreOriginalFrame:NO];
                    
                    id actionMoveDone = [CCCallFuncN actionWithTarget:self selector:@selector(finishActionSprite41)];
                    
                    [self.sprite41 runAction:[CCSpawn actionOne:[CCSequence actions:actionMove,actionMoveDone,nil] two:actionMove2]];
                    return;
                }
            }
        }
    }
    [self finishActionSprite41];
}
-(void) moveupSprite41
{
    CGPoint sprite41Pos = self.sprite41.position;
    self.sprite41.orientation = 2;
    sprite41Pos.y += _theHKMap.tileSize.height;
    
    CGPoint tileCoord = [self tileCoordForPosition:sprite41Pos];
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
                    [self.bgLayer setTileGID:(tileGID + 12) at:tileCoord];
                    CGPoint tileCoord1 = [self tileCoordForPosition:self.sprite41.position];
                    int tileGID1 = [self.bgLayer tileGIDAt:tileCoord1];
                    [self.bgLayer removeTileAt:tileCoord1];
                    [self.bgLayer setTileGID:(tileGID1 - 12) at:tileCoord1];
                    
                    id actionMove = [CCMoveTo actionWithDuration:0.3 position:sprite41Pos];
                    id actionMove2 = [CCAnimate actionWithAnimation:spriteMWalkUp restoreOriginalFrame:NO];
                    
                    id actionMoveDone = [CCCallFuncN actionWithTarget:self selector:@selector(finishActionSprite41)];
                    
                    [self.sprite41 runAction:[CCSpawn actionOne:[CCSequence actions:actionMove,actionMoveDone,nil] two:actionMove2]];
                    return;
                }
            }
        }
    }
    [self finishActionSprite41];
}
-(void) movedownSprite41
{
    CGPoint sprite41Pos = self.sprite41.position;
    self.sprite41.orientation = 1;
    sprite41Pos.y -= _theHKMap.tileSize.width;
    
    CGPoint tileCoord = [self tileCoordForPosition:sprite41Pos];
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
                    [self.bgLayer setTileGID:(tileGID + 12) at:tileCoord];
                    CGPoint tileCoord1 = [self tileCoordForPosition:self.sprite41.position];
                    int tileGID1 = [self.bgLayer tileGIDAt:tileCoord1];
                    [self.bgLayer removeTileAt:tileCoord1];
                    [self.bgLayer setTileGID:(tileGID1 - 12) at:tileCoord1];
                    
                    id actionMove = [CCMoveTo actionWithDuration:0.3 position:sprite41Pos];
                    id actionMove2 = [CCAnimate actionWithAnimation:spriteMWalkDown restoreOriginalFrame:NO];
                    
                    id actionMoveDone = [CCCallFuncN actionWithTarget:self selector:@selector(finishActionSprite41)];
                    
                    [self.sprite41 runAction:[CCSpawn actionOne:[CCSequence actions:actionMove,actionMoveDone,nil] two:actionMove2]];
                    return;
                }
            }
        }
    }
    [self finishActionSprite41];
}
-(void) finishActionSprite41
{
    if (self.sprite41.orientation == 1)
    {
        [self.sprite41 setDisplayFrame:[[spriteMWalkDown frames] objectAtIndex:0]];
    }
    else if (self.sprite41.orientation == 2)
    {
        [self.sprite41 setDisplayFrame:[[spriteMWalkUp frames] objectAtIndex:0]];
    }
    else if (self.sprite41.orientation == 3)
    {
        [self.sprite41 setDisplayFrame:[[spriteMWalkRight frames] objectAtIndex:0]];
    }
    else
    {
        [self.sprite41 setDisplayFrame:[[spriteMWalkLeft frames] objectAtIndex:0]];
    }
    self.hero.sprite41position = self.sprite41.position;
}


-(void) updateSprite42
{
    CGSize screenSize = [[CCDirector sharedDirector] winSize];
    int x = self.hero.position.x;
    int y = self.hero.position.y;
    
    int p = self.sprite42.position.x;
    int q = self.sprite42.position.y;
    
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
        [self moveleftSprite42];
    }
    if (rand == 2)
    {
        [self moverightSprite42];
    }
    if (rand == 3)
    {
        [self moveupSprite42];
    }
    if (rand == 4)
    {
        [self movedownSprite42];
    }
    return;
}

-(void) moveleftSprite42
{
    CGPoint sprite42Pos = self.sprite42.position;
    self.sprite42.orientation = 4;
    sprite42Pos.x -= _theHKMap.tileSize.width;
    
    CGPoint tileCoord = [self tileCoordForPosition:sprite42Pos];
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
                    [self.bgLayer setTileGID:(tileGID + 13) at:tileCoord];
                    CGPoint tileCoord1 = [self tileCoordForPosition:self.sprite42.position];
                    int tileGID1 = [self.bgLayer tileGIDAt:tileCoord1];
                    [self.bgLayer removeTileAt:tileCoord1];
                    [self.bgLayer setTileGID:(tileGID1 - 13) at:tileCoord1];
                    
                    id actionMove = [CCMoveTo actionWithDuration:0.3 position:sprite42Pos];
                    id actionMove2 = [CCAnimate actionWithAnimation:spriteZWalkLeft restoreOriginalFrame:NO];
                    
                    id actionMoveDone = [CCCallFuncN actionWithTarget:self selector:@selector(finishActionSprite42)];
                    
                    [self.sprite42 runAction:[CCSpawn actionOne:[CCSequence actions:actionMove,actionMoveDone,nil] two:actionMove2]];
                    return;
                }
            }
        }
    }
    [self finishActionSprite42];
}
-(void) moverightSprite42
{
    CGPoint sprite42Pos = self.sprite42.position;
    self.sprite42.orientation = 3;
    sprite42Pos.x += _theHKMap.tileSize.width;
    
    CGPoint tileCoord = [self tileCoordForPosition:sprite42Pos];
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
                    [self.bgLayer setTileGID:(tileGID + 13) at:tileCoord];
                    CGPoint tileCoord1 = [self tileCoordForPosition:self.sprite42.position];
                    int tileGID1 = [self.bgLayer tileGIDAt:tileCoord1];
                    [self.bgLayer removeTileAt:tileCoord1];
                    [self.bgLayer setTileGID:(tileGID1 - 13) at:tileCoord1];
                    
                    id actionMove = [CCMoveTo actionWithDuration:0.3 position:sprite42Pos];
                    id actionMove2 = [CCAnimate actionWithAnimation:spriteZWalkRight restoreOriginalFrame:NO];
                    
                    id actionMoveDone = [CCCallFuncN actionWithTarget:self selector:@selector(finishActionSprite42)];
                    
                    [self.sprite42 runAction:[CCSpawn actionOne:[CCSequence actions:actionMove,actionMoveDone,nil] two:actionMove2]];
                    return;
                }
            }
        }
    }
    [self finishActionSprite42];
}
-(void) moveupSprite42
{
    CGPoint sprite42Pos = self.sprite42.position;
    self.sprite42.orientation = 2;
    sprite42Pos.y += _theHKMap.tileSize.height;
    
    CGPoint tileCoord = [self tileCoordForPosition:sprite42Pos];
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
                    [self.bgLayer setTileGID:(tileGID + 13) at:tileCoord];
                    CGPoint tileCoord1 = [self tileCoordForPosition:self.sprite42.position];
                    int tileGID1 = [self.bgLayer tileGIDAt:tileCoord1];
                    [self.bgLayer removeTileAt:tileCoord1];
                    [self.bgLayer setTileGID:(tileGID1 - 13) at:tileCoord1];
                    
                    id actionMove = [CCMoveTo actionWithDuration:0.3 position:sprite42Pos];
                    id actionMove2 = [CCAnimate actionWithAnimation:spriteZWalkUp restoreOriginalFrame:NO];
                    
                    id actionMoveDone = [CCCallFuncN actionWithTarget:self selector:@selector(finishActionSprite42)];
                    
                    [self.sprite42 runAction:[CCSpawn actionOne:[CCSequence actions:actionMove,actionMoveDone,nil] two:actionMove2]];
                    return;
                }
            }
        }
    }
    [self finishActionSprite42];
}
-(void) movedownSprite42
{
    CGPoint sprite42Pos = self.sprite42.position;
    self.sprite42.orientation = 1;
    sprite42Pos.y -= _theHKMap.tileSize.width;
    
    CGPoint tileCoord = [self tileCoordForPosition:sprite42Pos];
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
                    [self.bgLayer setTileGID:(tileGID + 13) at:tileCoord];
                    CGPoint tileCoord1 = [self tileCoordForPosition:self.sprite42.position];
                    int tileGID1 = [self.bgLayer tileGIDAt:tileCoord1];
                    [self.bgLayer removeTileAt:tileCoord1];
                    [self.bgLayer setTileGID:(tileGID1 - 13) at:tileCoord1];
                    
                    id actionMove = [CCMoveTo actionWithDuration:0.3 position:sprite42Pos];
                    id actionMove2 = [CCAnimate actionWithAnimation:spriteZWalkDown restoreOriginalFrame:NO];
                    
                    id actionMoveDone = [CCCallFuncN actionWithTarget:self selector:@selector(finishActionSprite42)];
                    
                    [self.sprite42 runAction:[CCSpawn actionOne:[CCSequence actions:actionMove,actionMoveDone,nil] two:actionMove2]];
                    return;
                }
            }
        }
    }
    [self finishActionSprite42];
}
-(void) finishActionSprite42
{
    if (self.sprite42.orientation == 1)
    {
        [self.sprite42 setDisplayFrame:[[spriteZWalkDown frames] objectAtIndex:0]];
    }
    else if (self.sprite42.orientation == 2)
    {
        [self.sprite42 setDisplayFrame:[[spriteZWalkUp frames] objectAtIndex:0]];
    }
    else if (self.sprite42.orientation == 3)
    {
        [self.sprite42 setDisplayFrame:[[spriteZWalkRight frames] objectAtIndex:0]];
    }
    else
    {
        [self.sprite42 setDisplayFrame:[[spriteZWalkLeft frames] objectAtIndex:0]];
    }
    self.hero.sprite42position = self.sprite42.position;
}



-(void) updateSprite43
{
    CGSize screenSize = [[CCDirector sharedDirector] winSize];
    int x = self.hero.position.x;
    int y = self.hero.position.y;
    
    int p = self.sprite43.position.x;
    int q = self.sprite43.position.y;
    
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
    
    int rand = arc4random()%14;
    if (rand == 1)
    {
        [self moveleftSprite43];
    }
    if (rand == 2)
    {
        [self moverightSprite43];
    }
    if (rand == 3)
    {
        [self moveupSprite43];
    }
    if (rand == 4)
    {
        [self movedownSprite43];
    }
    return;
}

-(void) moveleftSprite43
{
    CGPoint sprite43Pos = self.sprite43.position;
    self.sprite43.orientation = 4;
    sprite43Pos.x -= _theHKMap.tileSize.width;
    
    CGPoint tileCoord = [self tileCoordForPosition:sprite43Pos];
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
                    [self.bgLayer setTileGID:(tileGID + 14) at:tileCoord];
                    CGPoint tileCoord1 = [self tileCoordForPosition:self.sprite43.position];
                    int tileGID1 = [self.bgLayer tileGIDAt:tileCoord1];
                    [self.bgLayer removeTileAt:tileCoord1];
                    [self.bgLayer setTileGID:(tileGID1 - 14) at:tileCoord1];
                    
                    id actionMove = [CCMoveTo actionWithDuration:0.3 position:sprite43Pos];
                    id actionMove2 = [CCAnimate actionWithAnimation:spriteVWalkLeft restoreOriginalFrame:NO];
                    
                    id actionMoveDone = [CCCallFuncN actionWithTarget:self selector:@selector(finishActionSprite43)];
                    
                    [self.sprite43 runAction:[CCSpawn actionOne:[CCSequence actions:actionMove,actionMoveDone,nil] two:actionMove2]];
                    return;
                }
            }
        }
    }
    [self finishActionSprite43];
}
-(void) moverightSprite43
{
    CGPoint sprite43Pos = self.sprite43.position;
    self.sprite43.orientation = 3;
    sprite43Pos.x += _theHKMap.tileSize.width;
    
    CGPoint tileCoord = [self tileCoordForPosition:sprite43Pos];
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
                    [self.bgLayer setTileGID:(tileGID + 14) at:tileCoord];
                    CGPoint tileCoord1 = [self tileCoordForPosition:self.sprite43.position];
                    int tileGID1 = [self.bgLayer tileGIDAt:tileCoord1];
                    [self.bgLayer removeTileAt:tileCoord1];
                    [self.bgLayer setTileGID:(tileGID1 - 14) at:tileCoord1];
                    
                    id actionMove = [CCMoveTo actionWithDuration:0.3 position:sprite43Pos];
                    id actionMove2 = [CCAnimate actionWithAnimation:spriteVWalkRight restoreOriginalFrame:NO];
                    
                    id actionMoveDone = [CCCallFuncN actionWithTarget:self selector:@selector(finishActionSprite43)];
                    
                    [self.sprite43 runAction:[CCSpawn actionOne:[CCSequence actions:actionMove,actionMoveDone,nil] two:actionMove2]];
                    return;
                }
            }
        }
    }
    [self finishActionSprite43];
}
-(void) moveupSprite43
{
    CGPoint sprite43Pos = self.sprite43.position;
    self.sprite43.orientation = 2;
    sprite43Pos.y += _theHKMap.tileSize.height;
    
    CGPoint tileCoord = [self tileCoordForPosition:sprite43Pos];
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
                    [self.bgLayer setTileGID:(tileGID + 14) at:tileCoord];
                    CGPoint tileCoord1 = [self tileCoordForPosition:self.sprite43.position];
                    int tileGID1 = [self.bgLayer tileGIDAt:tileCoord1];
                    [self.bgLayer removeTileAt:tileCoord1];
                    [self.bgLayer setTileGID:(tileGID1 - 14) at:tileCoord1];
                    
                    id actionMove = [CCMoveTo actionWithDuration:0.3 position:sprite43Pos];
                    id actionMove2 = [CCAnimate actionWithAnimation:spriteVWalkUp restoreOriginalFrame:NO];
                    
                    id actionMoveDone = [CCCallFuncN actionWithTarget:self selector:@selector(finishActionSprite43)];
                    
                    [self.sprite43 runAction:[CCSpawn actionOne:[CCSequence actions:actionMove,actionMoveDone,nil] two:actionMove2]];
                    return;
                }
            }
        }
    }
    [self finishActionSprite43];
}
-(void) movedownSprite43
{
    CGPoint sprite43Pos = self.sprite43.position;
    self.sprite43.orientation = 1;
    sprite43Pos.y -= _theHKMap.tileSize.width;
    
    CGPoint tileCoord = [self tileCoordForPosition:sprite43Pos];
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
                    [self.bgLayer setTileGID:(tileGID + 14) at:tileCoord];
                    CGPoint tileCoord1 = [self tileCoordForPosition:self.sprite43.position];
                    int tileGID1 = [self.bgLayer tileGIDAt:tileCoord1];
                    [self.bgLayer removeTileAt:tileCoord1];
                    [self.bgLayer setTileGID:(tileGID1 - 14) at:tileCoord1];
                    
                    id actionMove = [CCMoveTo actionWithDuration:0.3 position:sprite43Pos];
                    id actionMove2 = [CCAnimate actionWithAnimation:spriteVWalkDown restoreOriginalFrame:NO];
                    
                    id actionMoveDone = [CCCallFuncN actionWithTarget:self selector:@selector(finishActionSprite43)];
                    
                    [self.sprite43 runAction:[CCSpawn actionOne:[CCSequence actions:actionMove,actionMoveDone,nil] two:actionMove2]];
                    return;
                }
            }
        }
    }
    [self finishActionSprite43];
}
-(void) finishActionSprite43
{
    if (self.sprite43.orientation == 1)
    {
        [self.sprite43 setDisplayFrame:[[spriteVWalkDown frames] objectAtIndex:0]];
    }
    else if (self.sprite43.orientation == 2)
    {
        [self.sprite43 setDisplayFrame:[[spriteVWalkUp frames] objectAtIndex:0]];
    }
    else if (self.sprite43.orientation == 3)
    {
        [self.sprite43 setDisplayFrame:[[spriteVWalkRight frames] objectAtIndex:0]];
    }
    else
    {
        [self.sprite43 setDisplayFrame:[[spriteVWalkLeft frames] objectAtIndex:0]];
    }
    self.hero.sprite43position = self.sprite43.position;
}


-(void) updateSprite44
{
    CGSize screenSize = [[CCDirector sharedDirector] winSize];
    int x = self.hero.position.x;
    int y = self.hero.position.y;
    
    int p = self.sprite44.position.x;
    int q = self.sprite44.position.y;
    
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
        [self moveleftSprite44];
    }
    if (rand == 2)
    {
        [self moverightSprite44];
    }
    if (rand == 3)
    {
        [self moveupSprite44];
    }
    if (rand == 4)
    {
        [self movedownSprite44];
    }
    return;
}

-(void) moveleftSprite44
{
    CGPoint sprite44Pos = self.sprite44.position;
    self.sprite44.orientation = 4;
    sprite44Pos.x -= _theHKMap.tileSize.width;
    
    CGPoint tileCoord = [self tileCoordForPosition:sprite44Pos];
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
                    [self.bgLayer setTileGID:(tileGID + 15) at:tileCoord];
                    CGPoint tileCoord1 = [self tileCoordForPosition:self.sprite44.position];
                    int tileGID1 = [self.bgLayer tileGIDAt:tileCoord1];
                    [self.bgLayer removeTileAt:tileCoord1];
                    [self.bgLayer setTileGID:(tileGID1 - 15) at:tileCoord1];
                    
                    id actionMove = [CCMoveTo actionWithDuration:0.3 position:sprite44Pos];
                    id actionMove2 = [CCAnimate actionWithAnimation:spriteWWalkLeft restoreOriginalFrame:NO];
                    
                    id actionMoveDone = [CCCallFuncN actionWithTarget:self selector:@selector(finishActionSprite44)];
                    
                    [self.sprite44 runAction:[CCSpawn actionOne:[CCSequence actions:actionMove,actionMoveDone,nil] two:actionMove2]];
                    return;
                }
            }
        }
    }
    [self finishActionSprite44];
}
-(void) moverightSprite44
{
    CGPoint sprite44Pos = self.sprite44.position;
    self.sprite44.orientation = 3;
    sprite44Pos.x += _theHKMap.tileSize.width;
    
    CGPoint tileCoord = [self tileCoordForPosition:sprite44Pos];
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
                    [self.bgLayer setTileGID:(tileGID + 15) at:tileCoord];
                    CGPoint tileCoord1 = [self tileCoordForPosition:self.sprite44.position];
                    int tileGID1 = [self.bgLayer tileGIDAt:tileCoord1];
                    [self.bgLayer removeTileAt:tileCoord1];
                    [self.bgLayer setTileGID:(tileGID1 - 15) at:tileCoord1];
                    
                    id actionMove = [CCMoveTo actionWithDuration:0.3 position:sprite44Pos];
                    id actionMove2 = [CCAnimate actionWithAnimation:spriteWWalkRight restoreOriginalFrame:NO];
                    
                    id actionMoveDone = [CCCallFuncN actionWithTarget:self selector:@selector(finishActionSprite44)];
                    
                    [self.sprite44 runAction:[CCSpawn actionOne:[CCSequence actions:actionMove,actionMoveDone,nil] two:actionMove2]];
                    return;
                }
            }
        }
    }
    [self finishActionSprite44];
}
-(void) moveupSprite44
{
    CGPoint sprite44Pos = self.sprite44.position;
    self.sprite44.orientation = 2;
    sprite44Pos.y += _theHKMap.tileSize.height;
    
    CGPoint tileCoord = [self tileCoordForPosition:sprite44Pos];
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
                    [self.bgLayer setTileGID:(tileGID + 15) at:tileCoord];
                    CGPoint tileCoord1 = [self tileCoordForPosition:self.sprite44.position];
                    int tileGID1 = [self.bgLayer tileGIDAt:tileCoord1];
                    [self.bgLayer removeTileAt:tileCoord1];
                    [self.bgLayer setTileGID:(tileGID1 - 15) at:tileCoord1];
                    
                    id actionMove = [CCMoveTo actionWithDuration:0.3 position:sprite44Pos];
                    id actionMove2 = [CCAnimate actionWithAnimation:spriteWWalkUp restoreOriginalFrame:NO];
                    
                    id actionMoveDone = [CCCallFuncN actionWithTarget:self selector:@selector(finishActionSprite44)];
                    
                    [self.sprite44 runAction:[CCSpawn actionOne:[CCSequence actions:actionMove,actionMoveDone,nil] two:actionMove2]];
                    return;
                }
            }
        }
    }
    [self finishActionSprite44];
}
-(void) movedownSprite44
{
    CGPoint sprite44Pos = self.sprite44.position;
    self.sprite44.orientation = 1;
    sprite44Pos.y -= _theHKMap.tileSize.width;
    
    CGPoint tileCoord = [self tileCoordForPosition:sprite44Pos];
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
                    [self.bgLayer setTileGID:(tileGID + 15) at:tileCoord];
                    CGPoint tileCoord1 = [self tileCoordForPosition:self.sprite44.position];
                    int tileGID1 = [self.bgLayer tileGIDAt:tileCoord1];
                    [self.bgLayer removeTileAt:tileCoord1];
                    [self.bgLayer setTileGID:(tileGID1 - 15) at:tileCoord1];
                    
                    id actionMove = [CCMoveTo actionWithDuration:0.3 position:sprite44Pos];
                    id actionMove2 = [CCAnimate actionWithAnimation:spriteWWalkDown restoreOriginalFrame:NO];
                    
                    id actionMoveDone = [CCCallFuncN actionWithTarget:self selector:@selector(finishActionSprite44)];
                    
                    [self.sprite44 runAction:[CCSpawn actionOne:[CCSequence actions:actionMove,actionMoveDone,nil] two:actionMove2]];
                    return;
                }
            }
        }
    }
    [self finishActionSprite44];
}
-(void) finishActionSprite44
{
    if (self.sprite44.orientation == 1)
    {
        [self.sprite44 setDisplayFrame:[[spriteWWalkDown frames] objectAtIndex:0]];
    }
    else if (self.sprite44.orientation == 2)
    {
        [self.sprite44 setDisplayFrame:[[spriteWWalkUp frames] objectAtIndex:0]];
    }
    else if (self.sprite44.orientation == 3)
    {
        [self.sprite44 setDisplayFrame:[[spriteWWalkRight frames] objectAtIndex:0]];
    }
    else
    {
        [self.sprite44 setDisplayFrame:[[spriteWWalkLeft frames] objectAtIndex:0]];
    }
    self.hero.sprite44position = self.sprite44.position;
}



-(void) updateSprite45
{
    CGSize screenSize = [[CCDirector sharedDirector] winSize];
    int x = self.hero.position.x;
    int y = self.hero.position.y;
    
    int p = self.sprite45.position.x;
    int q = self.sprite45.position.y;
    
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
        [self moveleftSprite45];
    }
    if (rand == 2)
    {
        [self moverightSprite45];
    }
    if (rand == 3)
    {
        [self moveupSprite45];
    }
    if (rand == 4)
    {
        [self movedownSprite45];
    }
    return;
}

-(void) moveleftSprite45
{
    CGPoint sprite45Pos = self.sprite45.position;
    self.sprite45.orientation = 4;
    sprite45Pos.x -= _theHKMap.tileSize.width;
    
    CGPoint tileCoord = [self tileCoordForPosition:sprite45Pos];
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
                    [self.bgLayer setTileGID:(tileGID + 16) at:tileCoord];
                    CGPoint tileCoord1 = [self tileCoordForPosition:self.sprite45.position];
                    int tileGID1 = [self.bgLayer tileGIDAt:tileCoord1];
                    [self.bgLayer removeTileAt:tileCoord1];
                    [self.bgLayer setTileGID:(tileGID1 - 16) at:tileCoord1];
                    
                    id actionMove = [CCMoveTo actionWithDuration:0.3 position:sprite45Pos];
                    id actionMove2 = [CCAnimate actionWithAnimation:spriteQWalkLeft restoreOriginalFrame:NO];
                    
                    id actionMoveDone = [CCCallFuncN actionWithTarget:self selector:@selector(finishActionSprite45)];
                    
                    [self.sprite45 runAction:[CCSpawn actionOne:[CCSequence actions:actionMove,actionMoveDone,nil] two:actionMove2]];
                    return;
                }
            }
        }
    }
    [self finishActionSprite45];
}
-(void) moverightSprite45
{
    CGPoint sprite45Pos = self.sprite45.position;
    self.sprite45.orientation = 3;
    sprite45Pos.x += _theHKMap.tileSize.width;
    
    CGPoint tileCoord = [self tileCoordForPosition:sprite45Pos];
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
                    [self.bgLayer setTileGID:(tileGID + 16) at:tileCoord];
                    CGPoint tileCoord1 = [self tileCoordForPosition:self.sprite45.position];
                    int tileGID1 = [self.bgLayer tileGIDAt:tileCoord1];
                    [self.bgLayer removeTileAt:tileCoord1];
                    [self.bgLayer setTileGID:(tileGID1 - 16) at:tileCoord1];
                    
                    id actionMove = [CCMoveTo actionWithDuration:0.3 position:sprite45Pos];
                    id actionMove2 = [CCAnimate actionWithAnimation:spriteQWalkRight restoreOriginalFrame:NO];
                    
                    id actionMoveDone = [CCCallFuncN actionWithTarget:self selector:@selector(finishActionSprite45)];
                    
                    [self.sprite45 runAction:[CCSpawn actionOne:[CCSequence actions:actionMove,actionMoveDone,nil] two:actionMove2]];
                    return;
                }
            }
        }
    }
    [self finishActionSprite45];
}
-(void) moveupSprite45
{
    CGPoint sprite45Pos = self.sprite45.position;
    self.sprite45.orientation = 2;
    sprite45Pos.y += _theHKMap.tileSize.height;
    
    CGPoint tileCoord = [self tileCoordForPosition:sprite45Pos];
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
                    [self.bgLayer setTileGID:(tileGID + 16) at:tileCoord];
                    CGPoint tileCoord1 = [self tileCoordForPosition:self.sprite45.position];
                    int tileGID1 = [self.bgLayer tileGIDAt:tileCoord1];
                    [self.bgLayer removeTileAt:tileCoord1];
                    [self.bgLayer setTileGID:(tileGID1 - 16) at:tileCoord1];
                    
                    id actionMove = [CCMoveTo actionWithDuration:0.3 position:sprite45Pos];
                    id actionMove2 = [CCAnimate actionWithAnimation:spriteQWalkUp restoreOriginalFrame:NO];
                    
                    id actionMoveDone = [CCCallFuncN actionWithTarget:self selector:@selector(finishActionSprite45)];
                    
                    [self.sprite45 runAction:[CCSpawn actionOne:[CCSequence actions:actionMove,actionMoveDone,nil] two:actionMove2]];
                    return;
                }
            }
        }
    }
    [self finishActionSprite45];
}
-(void) movedownSprite45
{
    CGPoint sprite45Pos = self.sprite45.position;
    self.sprite45.orientation = 1;
    sprite45Pos.y -= _theHKMap.tileSize.width;
    
    CGPoint tileCoord = [self tileCoordForPosition:sprite45Pos];
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
                    [self.bgLayer setTileGID:(tileGID + 16) at:tileCoord];
                    CGPoint tileCoord1 = [self tileCoordForPosition:self.sprite45.position];
                    int tileGID1 = [self.bgLayer tileGIDAt:tileCoord1];
                    [self.bgLayer removeTileAt:tileCoord1];
                    [self.bgLayer setTileGID:(tileGID1 - 16) at:tileCoord1];
                    
                    id actionMove = [CCMoveTo actionWithDuration:0.3 position:sprite45Pos];
                    id actionMove2 = [CCAnimate actionWithAnimation:spriteQWalkDown restoreOriginalFrame:NO];
                    
                    id actionMoveDone = [CCCallFuncN actionWithTarget:self selector:@selector(finishActionSprite45)];
                    
                    [self.sprite45 runAction:[CCSpawn actionOne:[CCSequence actions:actionMove,actionMoveDone,nil] two:actionMove2]];
                    return;
                }
            }
        }
    }
    [self finishActionSprite45];
}
-(void) finishActionSprite45
{
    if (self.sprite45.orientation == 1)
    {
        [self.sprite45 setDisplayFrame:[[spriteQWalkDown frames] objectAtIndex:0]];
    }
    else if (self.sprite45.orientation == 2)
    {
        [self.sprite45 setDisplayFrame:[[spriteQWalkUp frames] objectAtIndex:0]];
    }
    else if (self.sprite45.orientation == 3)
    {
        [self.sprite45 setDisplayFrame:[[spriteQWalkRight frames] objectAtIndex:0]];
    }
    else
    {
        [self.sprite45 setDisplayFrame:[[spriteQWalkLeft frames] objectAtIndex:0]];
    }
    self.hero.sprite45position = self.sprite45.position;
}


-(void) updateSprite46
{
    CGSize screenSize = [[CCDirector sharedDirector] winSize];
    int x = self.hero.position.x;
    int y = self.hero.position.y;
    
    int p = self.sprite46.position.x;
    int q = self.sprite46.position.y;
    
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
        [self moveleftSprite46];
    }
    if (rand == 2)
    {
        [self moverightSprite46];
    }
    if (rand == 3)
    {
        [self moveupSprite46];
    }
    if (rand == 4)
    {
        [self movedownSprite46];
    }
    return;
}

-(void) moveleftSprite46
{
    CGPoint sprite46Pos = self.sprite46.position;
    self.sprite46.orientation = 4;
    sprite46Pos.x -= _theHKMap.tileSize.width;
    
    CGPoint tileCoord = [self tileCoordForPosition:sprite46Pos];
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
                    [self.bgLayer setTileGID:(tileGID + 17) at:tileCoord];
                    CGPoint tileCoord1 = [self tileCoordForPosition:self.sprite46.position];
                    int tileGID1 = [self.bgLayer tileGIDAt:tileCoord1];
                    [self.bgLayer removeTileAt:tileCoord1];
                    [self.bgLayer setTileGID:(tileGID1 - 17) at:tileCoord1];
                    
                    id actionMove = [CCMoveTo actionWithDuration:0.3 position:sprite46Pos];
                    id actionMove2 = [CCAnimate actionWithAnimation:spriteYWalkLeft restoreOriginalFrame:NO];
                    
                    id actionMoveDone = [CCCallFuncN actionWithTarget:self selector:@selector(finishActionSprite46)];
                    
                    [self.sprite46 runAction:[CCSpawn actionOne:[CCSequence actions:actionMove,actionMoveDone,nil] two:actionMove2]];
                    return;
                }
            }
        }
    }
    [self finishActionSprite46];
}
-(void) moverightSprite46
{
    CGPoint sprite46Pos = self.sprite46.position;
    self.sprite46.orientation = 3;
    sprite46Pos.x += _theHKMap.tileSize.width;
    
    CGPoint tileCoord = [self tileCoordForPosition:sprite46Pos];
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
                    [self.bgLayer setTileGID:(tileGID + 17) at:tileCoord];
                    CGPoint tileCoord1 = [self tileCoordForPosition:self.sprite46.position];
                    int tileGID1 = [self.bgLayer tileGIDAt:tileCoord1];
                    [self.bgLayer removeTileAt:tileCoord1];
                    [self.bgLayer setTileGID:(tileGID1 - 17) at:tileCoord1];
                    
                    id actionMove = [CCMoveTo actionWithDuration:0.3 position:sprite46Pos];
                    id actionMove2 = [CCAnimate actionWithAnimation:spriteYWalkRight restoreOriginalFrame:NO];
                    
                    id actionMoveDone = [CCCallFuncN actionWithTarget:self selector:@selector(finishActionSprite46)];
                    
                    [self.sprite46 runAction:[CCSpawn actionOne:[CCSequence actions:actionMove,actionMoveDone,nil] two:actionMove2]];
                    return;
                }
            }
        }
    }
    [self finishActionSprite46];
}
-(void) moveupSprite46
{
    CGPoint sprite46Pos = self.sprite46.position;
    self.sprite46.orientation = 2;
    sprite46Pos.y += _theHKMap.tileSize.height;
    
    CGPoint tileCoord = [self tileCoordForPosition:sprite46Pos];
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
                    [self.bgLayer setTileGID:(tileGID + 17) at:tileCoord];
                    CGPoint tileCoord1 = [self tileCoordForPosition:self.sprite46.position];
                    int tileGID1 = [self.bgLayer tileGIDAt:tileCoord1];
                    [self.bgLayer removeTileAt:tileCoord1];
                    [self.bgLayer setTileGID:(tileGID1 - 17) at:tileCoord1];
                    
                    id actionMove = [CCMoveTo actionWithDuration:0.3 position:sprite46Pos];
                    id actionMove2 = [CCAnimate actionWithAnimation:spriteYWalkUp restoreOriginalFrame:NO];
                    
                    id actionMoveDone = [CCCallFuncN actionWithTarget:self selector:@selector(finishActionSprite46)];
                    
                    [self.sprite46 runAction:[CCSpawn actionOne:[CCSequence actions:actionMove,actionMoveDone,nil] two:actionMove2]];
                    return;
                }
            }
        }
    }
    [self finishActionSprite46];
}
-(void) movedownSprite46
{
    CGPoint sprite46Pos = self.sprite46.position;
    self.sprite46.orientation = 1;
    sprite46Pos.y -= _theHKMap.tileSize.width;
    
    CGPoint tileCoord = [self tileCoordForPosition:sprite46Pos];
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
                    [self.bgLayer setTileGID:(tileGID + 17) at:tileCoord];
                    CGPoint tileCoord1 = [self tileCoordForPosition:self.sprite46.position];
                    int tileGID1 = [self.bgLayer tileGIDAt:tileCoord1];
                    [self.bgLayer removeTileAt:tileCoord1];
                    [self.bgLayer setTileGID:(tileGID1 - 17) at:tileCoord1];
                    
                    id actionMove = [CCMoveTo actionWithDuration:0.3 position:sprite46Pos];
                    id actionMove2 = [CCAnimate actionWithAnimation:spriteYWalkDown restoreOriginalFrame:NO];
                    
                    id actionMoveDone = [CCCallFuncN actionWithTarget:self selector:@selector(finishActionSprite46)];
                    
                    [self.sprite46 runAction:[CCSpawn actionOne:[CCSequence actions:actionMove,actionMoveDone,nil] two:actionMove2]];
                    return;
                }
            }
        }
    }
    [self finishActionSprite46];
}
-(void) finishActionSprite46
{
    if (self.sprite46.orientation == 1)
    {
        [self.sprite46 setDisplayFrame:[[spriteYWalkDown frames] objectAtIndex:0]];
    }
    else if (self.sprite46.orientation == 2)
    {
        [self.sprite46 setDisplayFrame:[[spriteYWalkUp frames] objectAtIndex:0]];
    }
    else if (self.sprite46.orientation == 3)
    {
        [self.sprite46 setDisplayFrame:[[spriteYWalkRight frames] objectAtIndex:0]];
    }
    else
    {
        [self.sprite46 setDisplayFrame:[[spriteYWalkLeft frames] objectAtIndex:0]];
    }
    self.hero.sprite46position = self.sprite46.position;
}


-(void) updateSprite47
{
    CGSize screenSize = [[CCDirector sharedDirector] winSize];
    int x = self.hero.position.x;
    int y = self.hero.position.y;
    
    int p = self.sprite47.position.x;
    int q = self.sprite47.position.y;
    
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
    
    int rand = arc4random()%14;
    if (rand == 1)
    {
        [self moveleftSprite47];
    }
    if (rand == 2)
    {
        [self moverightSprite47];
    }
    if (rand == 3)
    {
        [self moveupSprite47];
    }
    if (rand == 4)
    {
        [self movedownSprite47];
    }
    return;
}

-(void) moveleftSprite47
{
    CGPoint sprite47Pos = self.sprite47.position;
    self.sprite47.orientation = 4;
    sprite47Pos.x -= _theHKMap.tileSize.width;
    
    CGPoint tileCoord = [self tileCoordForPosition:sprite47Pos];
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
                    [self.bgLayer setTileGID:(tileGID + 18) at:tileCoord];
                    CGPoint tileCoord1 = [self tileCoordForPosition:self.sprite47.position];
                    int tileGID1 = [self.bgLayer tileGIDAt:tileCoord1];
                    [self.bgLayer removeTileAt:tileCoord1];
                    [self.bgLayer setTileGID:(tileGID1 - 18) at:tileCoord1];
                    
                    id actionMove = [CCMoveTo actionWithDuration:0.3 position:sprite47Pos];
                    id actionMove2 = [CCAnimate actionWithAnimation:spriteYWalkLeft restoreOriginalFrame:NO];
                    
                    id actionMoveDone = [CCCallFuncN actionWithTarget:self selector:@selector(finishActionSprite47)];
                    
                    [self.sprite47 runAction:[CCSpawn actionOne:[CCSequence actions:actionMove,actionMoveDone,nil] two:actionMove2]];
                    return;
                }
            }
        }
    }
    [self finishActionSprite47];
}
-(void) moverightSprite47
{
    CGPoint sprite47Pos = self.sprite47.position;
    self.sprite47.orientation = 3;
    sprite47Pos.x += _theHKMap.tileSize.width;
    
    CGPoint tileCoord = [self tileCoordForPosition:sprite47Pos];
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
                    [self.bgLayer setTileGID:(tileGID + 18) at:tileCoord];
                    CGPoint tileCoord1 = [self tileCoordForPosition:self.sprite47.position];
                    int tileGID1 = [self.bgLayer tileGIDAt:tileCoord1];
                    [self.bgLayer removeTileAt:tileCoord1];
                    [self.bgLayer setTileGID:(tileGID1 - 18) at:tileCoord1];
                    
                    id actionMove = [CCMoveTo actionWithDuration:0.3 position:sprite47Pos];
                    id actionMove2 = [CCAnimate actionWithAnimation:spriteYWalkRight restoreOriginalFrame:NO];
                    
                    id actionMoveDone = [CCCallFuncN actionWithTarget:self selector:@selector(finishActionSprite47)];
                    
                    [self.sprite47 runAction:[CCSpawn actionOne:[CCSequence actions:actionMove,actionMoveDone,nil] two:actionMove2]];
                    return;
                }
            }
        }
    }
    [self finishActionSprite47];
}
-(void) moveupSprite47
{
    CGPoint sprite47Pos = self.sprite47.position;
    self.sprite47.orientation = 2;
    sprite47Pos.y += _theHKMap.tileSize.height;
    
    CGPoint tileCoord = [self tileCoordForPosition:sprite47Pos];
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
                    [self.bgLayer setTileGID:(tileGID + 18) at:tileCoord];
                    CGPoint tileCoord1 = [self tileCoordForPosition:self.sprite47.position];
                    int tileGID1 = [self.bgLayer tileGIDAt:tileCoord1];
                    [self.bgLayer removeTileAt:tileCoord1];
                    [self.bgLayer setTileGID:(tileGID1 - 18) at:tileCoord1];
                    
                    id actionMove = [CCMoveTo actionWithDuration:0.3 position:sprite47Pos];
                    id actionMove2 = [CCAnimate actionWithAnimation:spriteYWalkUp restoreOriginalFrame:NO];
                    
                    id actionMoveDone = [CCCallFuncN actionWithTarget:self selector:@selector(finishActionSprite47)];
                    
                    [self.sprite47 runAction:[CCSpawn actionOne:[CCSequence actions:actionMove,actionMoveDone,nil] two:actionMove2]];
                    return;
                }
            }
        }
    }
    [self finishActionSprite47];
}
-(void) movedownSprite47
{
    CGPoint sprite47Pos = self.sprite47.position;
    self.sprite47.orientation = 1;
    sprite47Pos.y -= _theHKMap.tileSize.width;
    
    CGPoint tileCoord = [self tileCoordForPosition:sprite47Pos];
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
                    [self.bgLayer setTileGID:(tileGID + 18) at:tileCoord];
                    CGPoint tileCoord1 = [self tileCoordForPosition:self.sprite47.position];
                    int tileGID1 = [self.bgLayer tileGIDAt:tileCoord1];
                    [self.bgLayer removeTileAt:tileCoord1];
                    [self.bgLayer setTileGID:(tileGID1 - 18) at:tileCoord1];
                    
                    id actionMove = [CCMoveTo actionWithDuration:0.3 position:sprite47Pos];
                    id actionMove2 = [CCAnimate actionWithAnimation:spriteYWalkDown restoreOriginalFrame:NO];
                    
                    id actionMoveDone = [CCCallFuncN actionWithTarget:self selector:@selector(finishActionSprite47)];
                    
                    [self.sprite47 runAction:[CCSpawn actionOne:[CCSequence actions:actionMove,actionMoveDone,nil] two:actionMove2]];
                    return;
                }
            }
        }
    }
    [self finishActionSprite47];
}
-(void) finishActionSprite47
{
    if (self.sprite47.orientation == 1)
    {
        [self.sprite47 setDisplayFrame:[[spriteYWalkDown frames] objectAtIndex:0]];
    }
    else if (self.sprite47.orientation == 2)
    {
        [self.sprite47 setDisplayFrame:[[spriteYWalkUp frames] objectAtIndex:0]];
    }
    else if (self.sprite47.orientation == 3)
    {
        [self.sprite47 setDisplayFrame:[[spriteYWalkRight frames] objectAtIndex:0]];
    }
    else
    {
        [self.sprite47 setDisplayFrame:[[spriteYWalkLeft frames] objectAtIndex:0]];
    }
    self.hero.sprite47position = self.sprite47.position;
}


-(void) updateSprite48
{
    CGSize screenSize = [[CCDirector sharedDirector] winSize];
    int x = self.hero.position.x;
    int y = self.hero.position.y;
    
    int p = self.sprite48.position.x;
    int q = self.sprite48.position.y;
    
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
        [self moveleftSprite48];
    }
    if (rand == 2)
    {
        [self moverightSprite48];
    }
    if (rand == 3)
    {
        [self moveupSprite48];
    }
    if (rand == 4)
    {
        [self movedownSprite48];
    }
    return;
}

-(void) moveleftSprite48
{
    CGPoint sprite48Pos = self.sprite48.position;
    self.sprite48.orientation = 4;
    sprite48Pos.x -= _theHKMap.tileSize.width;
    
    CGPoint tileCoord = [self tileCoordForPosition:sprite48Pos];
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
                    [self.bgLayer setTileGID:(tileGID + 19) at:tileCoord];
                    CGPoint tileCoord1 = [self tileCoordForPosition:self.sprite48.position];
                    int tileGID1 = [self.bgLayer tileGIDAt:tileCoord1];
                    [self.bgLayer removeTileAt:tileCoord1];
                    [self.bgLayer setTileGID:(tileGID1 - 19) at:tileCoord1];
                    
                    id actionMove = [CCMoveTo actionWithDuration:0.3 position:sprite48Pos];
                    id actionMove2 = [CCAnimate actionWithAnimation:spriteUWalkLeft restoreOriginalFrame:NO];
                    
                    id actionMoveDone = [CCCallFuncN actionWithTarget:self selector:@selector(finishActionSprite48)];
                    
                    [self.sprite48 runAction:[CCSpawn actionOne:[CCSequence actions:actionMove,actionMoveDone,nil] two:actionMove2]];
                    return;
                }
            }
        }
    }
    [self finishActionSprite48];
}
-(void) moverightSprite48
{
    CGPoint sprite48Pos = self.sprite48.position;
    self.sprite48.orientation = 3;
    sprite48Pos.x += _theHKMap.tileSize.width;
    
    CGPoint tileCoord = [self tileCoordForPosition:sprite48Pos];
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
                    [self.bgLayer setTileGID:(tileGID + 19) at:tileCoord];
                    CGPoint tileCoord1 = [self tileCoordForPosition:self.sprite48.position];
                    int tileGID1 = [self.bgLayer tileGIDAt:tileCoord1];
                    [self.bgLayer removeTileAt:tileCoord1];
                    [self.bgLayer setTileGID:(tileGID1 - 19) at:tileCoord1];
                    
                    id actionMove = [CCMoveTo actionWithDuration:0.3 position:sprite48Pos];
                    id actionMove2 = [CCAnimate actionWithAnimation:spriteUWalkRight restoreOriginalFrame:NO];
                    
                    id actionMoveDone = [CCCallFuncN actionWithTarget:self selector:@selector(finishActionSprite48)];
                    
                    [self.sprite48 runAction:[CCSpawn actionOne:[CCSequence actions:actionMove,actionMoveDone,nil] two:actionMove2]];
                    return;
                }
            }
        }
    }
    [self finishActionSprite48];
}
-(void) moveupSprite48
{
    CGPoint sprite48Pos = self.sprite48.position;
    self.sprite48.orientation = 2;
    sprite48Pos.y += _theHKMap.tileSize.height;
    
    CGPoint tileCoord = [self tileCoordForPosition:sprite48Pos];
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
                    [self.bgLayer setTileGID:(tileGID + 19) at:tileCoord];
                    CGPoint tileCoord1 = [self tileCoordForPosition:self.sprite48.position];
                    int tileGID1 = [self.bgLayer tileGIDAt:tileCoord1];
                    [self.bgLayer removeTileAt:tileCoord1];
                    [self.bgLayer setTileGID:(tileGID1 - 19) at:tileCoord1];
                    
                    id actionMove = [CCMoveTo actionWithDuration:0.3 position:sprite48Pos];
                    id actionMove2 = [CCAnimate actionWithAnimation:spriteUWalkUp restoreOriginalFrame:NO];
                    
                    id actionMoveDone = [CCCallFuncN actionWithTarget:self selector:@selector(finishActionSprite48)];
                    
                    [self.sprite48 runAction:[CCSpawn actionOne:[CCSequence actions:actionMove,actionMoveDone,nil] two:actionMove2]];
                    return;
                }
            }
        }
    }
    [self finishActionSprite48];
}
-(void) movedownSprite48
{
    CGPoint sprite48Pos = self.sprite48.position;
    self.sprite48.orientation = 1;
    sprite48Pos.y -= _theHKMap.tileSize.width;
    
    CGPoint tileCoord = [self tileCoordForPosition:sprite48Pos];
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
                    [self.bgLayer setTileGID:(tileGID + 19) at:tileCoord];
                    CGPoint tileCoord1 = [self tileCoordForPosition:self.sprite48.position];
                    int tileGID1 = [self.bgLayer tileGIDAt:tileCoord1];
                    [self.bgLayer removeTileAt:tileCoord1];
                    [self.bgLayer setTileGID:(tileGID1 - 19) at:tileCoord1];
                    
                    id actionMove = [CCMoveTo actionWithDuration:0.3 position:sprite48Pos];
                    id actionMove2 = [CCAnimate actionWithAnimation:spriteUWalkDown restoreOriginalFrame:NO];
                    
                    id actionMoveDone = [CCCallFuncN actionWithTarget:self selector:@selector(finishActionSprite48)];
                    
                    [self.sprite48 runAction:[CCSpawn actionOne:[CCSequence actions:actionMove,actionMoveDone,nil] two:actionMove2]];
                    return;
                }
            }
        }
    }
    [self finishActionSprite48];
}
-(void) finishActionSprite48
{
    if (self.sprite48.orientation == 1)
    {
        [self.sprite48 setDisplayFrame:[[spriteUWalkDown frames] objectAtIndex:0]];
    }
    else if (self.sprite48.orientation == 2)
    {
        [self.sprite48 setDisplayFrame:[[spriteUWalkUp frames] objectAtIndex:0]];
    }
    else if (self.sprite48.orientation == 3)
    {
        [self.sprite48 setDisplayFrame:[[spriteUWalkRight frames] objectAtIndex:0]];
    }
    else
    {
        [self.sprite48 setDisplayFrame:[[spriteUWalkLeft frames] objectAtIndex:0]];
    }
    self.hero.sprite48position = self.sprite48.position;
}


-(void) updateSprite49
{
    CGSize screenSize = [[CCDirector sharedDirector] winSize];
    int x = self.hero.position.x;
    int y = self.hero.position.y;
    
    int p = self.sprite49.position.x;
    int q = self.sprite49.position.y;
    
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
    
    int rand = arc4random()%14;
    if (rand == 1)
    {
        [self moveleftSprite49];
    }
    if (rand == 2)
    {
        [self moverightSprite49];
    }
    if (rand == 3)
    {
        [self moveupSprite49];
    }
    if (rand == 4)
    {
        [self movedownSprite49];
    }
    return;
}

-(void) moveleftSprite49
{
    CGPoint sprite49Pos = self.sprite49.position;
    self.sprite49.orientation = 4;
    sprite49Pos.x -= _theHKMap.tileSize.width;
    
    CGPoint tileCoord = [self tileCoordForPosition:sprite49Pos];
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
                    [self.bgLayer setTileGID:(tileGID + 20) at:tileCoord];
                    CGPoint tileCoord1 = [self tileCoordForPosition:self.sprite49.position];
                    int tileGID1 = [self.bgLayer tileGIDAt:tileCoord1];
                    [self.bgLayer removeTileAt:tileCoord1];
                    [self.bgLayer setTileGID:(tileGID1 - 20) at:tileCoord1];
                    
                    id actionMove = [CCMoveTo actionWithDuration:0.3 position:sprite49Pos];
                    id actionMove2 = [CCAnimate actionWithAnimation:spriteTWalkLeft restoreOriginalFrame:NO];
                    
                    id actionMoveDone = [CCCallFuncN actionWithTarget:self selector:@selector(finishActionSprite49)];
                    
                    [self.sprite49 runAction:[CCSpawn actionOne:[CCSequence actions:actionMove,actionMoveDone,nil] two:actionMove2]];
                    return;
                }
            }
        }
    }
    [self finishActionSprite49];
}
-(void) moverightSprite49
{
    CGPoint sprite49Pos = self.sprite49.position;
    self.sprite49.orientation = 3;
    sprite49Pos.x += _theHKMap.tileSize.width;
    
    CGPoint tileCoord = [self tileCoordForPosition:sprite49Pos];
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
                    [self.bgLayer setTileGID:(tileGID + 20) at:tileCoord];
                    CGPoint tileCoord1 = [self tileCoordForPosition:self.sprite49.position];
                    int tileGID1 = [self.bgLayer tileGIDAt:tileCoord1];
                    [self.bgLayer removeTileAt:tileCoord1];
                    [self.bgLayer setTileGID:(tileGID1 - 20) at:tileCoord1];
                    
                    id actionMove = [CCMoveTo actionWithDuration:0.3 position:sprite49Pos];
                    id actionMove2 = [CCAnimate actionWithAnimation:spriteTWalkRight restoreOriginalFrame:NO];
                    
                    id actionMoveDone = [CCCallFuncN actionWithTarget:self selector:@selector(finishActionSprite49)];
                    
                    [self.sprite49 runAction:[CCSpawn actionOne:[CCSequence actions:actionMove,actionMoveDone,nil] two:actionMove2]];
                    return;
                }
            }
        }
    }
    [self finishActionSprite49];
}
-(void) moveupSprite49
{
    CGPoint sprite49Pos = self.sprite49.position;
    self.sprite49.orientation = 2;
    sprite49Pos.y += _theHKMap.tileSize.height;
    
    CGPoint tileCoord = [self tileCoordForPosition:sprite49Pos];
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
                    [self.bgLayer setTileGID:(tileGID + 20) at:tileCoord];
                    CGPoint tileCoord1 = [self tileCoordForPosition:self.sprite49.position];
                    int tileGID1 = [self.bgLayer tileGIDAt:tileCoord1];
                    [self.bgLayer removeTileAt:tileCoord1];
                    [self.bgLayer setTileGID:(tileGID1 - 20) at:tileCoord1];
                    
                    id actionMove = [CCMoveTo actionWithDuration:0.3 position:sprite49Pos];
                    id actionMove2 = [CCAnimate actionWithAnimation:spriteTWalkUp restoreOriginalFrame:NO];
                    
                    id actionMoveDone = [CCCallFuncN actionWithTarget:self selector:@selector(finishActionSprite49)];
                    
                    [self.sprite49 runAction:[CCSpawn actionOne:[CCSequence actions:actionMove,actionMoveDone,nil] two:actionMove2]];
                    return;
                }
            }
        }
    }
    [self finishActionSprite49];
}
-(void) movedownSprite49
{
    CGPoint sprite49Pos = self.sprite49.position;
    self.sprite49.orientation = 1;
    sprite49Pos.y -= _theHKMap.tileSize.width;
    
    CGPoint tileCoord = [self tileCoordForPosition:sprite49Pos];
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
                    [self.bgLayer setTileGID:(tileGID + 20) at:tileCoord];
                    CGPoint tileCoord1 = [self tileCoordForPosition:self.sprite49.position];
                    int tileGID1 = [self.bgLayer tileGIDAt:tileCoord1];
                    [self.bgLayer removeTileAt:tileCoord1];
                    [self.bgLayer setTileGID:(tileGID1 - 20) at:tileCoord1];
                    
                    id actionMove = [CCMoveTo actionWithDuration:0.3 position:sprite49Pos];
                    id actionMove2 = [CCAnimate actionWithAnimation:spriteTWalkDown restoreOriginalFrame:NO];
                    
                    id actionMoveDone = [CCCallFuncN actionWithTarget:self selector:@selector(finishActionSprite49)];
                    
                    [self.sprite49 runAction:[CCSpawn actionOne:[CCSequence actions:actionMove,actionMoveDone,nil] two:actionMove2]];
                    return;
                }
            }
        }
    }
    [self finishActionSprite49];
}
-(void) finishActionSprite49
{
    if (self.sprite49.orientation == 1)
    {
        [self.sprite49 setDisplayFrame:[[spriteTWalkDown frames] objectAtIndex:0]];
    }
    else if (self.sprite49.orientation == 2)
    {
        [self.sprite49 setDisplayFrame:[[spriteTWalkUp frames] objectAtIndex:0]];
    }
    else if (self.sprite49.orientation == 3)
    {
        [self.sprite49 setDisplayFrame:[[spriteTWalkRight frames] objectAtIndex:0]];
    }
    else
    {
        [self.sprite49 setDisplayFrame:[[spriteTWalkLeft frames] objectAtIndex:0]];
    }
    self.hero.sprite49position = self.sprite49.position;
}


-(void) updateSprite50
{
    CGSize screenSize = [[CCDirector sharedDirector] winSize];
    int x = self.hero.position.x;
    int y = self.hero.position.y;
    
    int p = self.sprite50.position.x;
    int q = self.sprite50.position.y;
    
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
        [self moveleftSprite50];
    }
    if (rand == 2)
    {
        [self moverightSprite50];
    }
    if (rand == 3)
    {
        [self moveupSprite50];
    }
    if (rand == 4)
    {
        [self movedownSprite50];
    }
    return;
}

-(void) moveleftSprite50
{
    CGPoint sprite50Pos = self.sprite50.position;
    self.sprite50.orientation = 4;
    sprite50Pos.x -= _theHKMap.tileSize.width;
    
    CGPoint tileCoord = [self tileCoordForPosition:sprite50Pos];
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
                    [self.bgLayer setTileGID:(tileGID + 21) at:tileCoord];
                    CGPoint tileCoord1 = [self tileCoordForPosition:self.sprite50.position];
                    int tileGID1 = [self.bgLayer tileGIDAt:tileCoord1];
                    [self.bgLayer removeTileAt:tileCoord1];
                    [self.bgLayer setTileGID:(tileGID1 - 21) at:tileCoord1];
                    
                    id actionMove = [CCMoveTo actionWithDuration:0.3 position:sprite50Pos];
                    id actionMove2 = [CCAnimate actionWithAnimation:spriteZAWalkLeft restoreOriginalFrame:NO];
                    
                    id actionMoveDone = [CCCallFuncN actionWithTarget:self selector:@selector(finishActionSprite50)];
                    
                    [self.sprite50 runAction:[CCSpawn actionOne:[CCSequence actions:actionMove,actionMoveDone,nil] two:actionMove2]];
                    return;
                }
            }
        }
    }
    [self finishActionSprite50];
}
-(void) moverightSprite50
{
    CGPoint sprite50Pos = self.sprite50.position;
    self.sprite50.orientation = 3;
    sprite50Pos.x += _theHKMap.tileSize.width;
    
    CGPoint tileCoord = [self tileCoordForPosition:sprite50Pos];
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
                    [self.bgLayer setTileGID:(tileGID + 21) at:tileCoord];
                    CGPoint tileCoord1 = [self tileCoordForPosition:self.sprite50.position];
                    int tileGID1 = [self.bgLayer tileGIDAt:tileCoord1];
                    [self.bgLayer removeTileAt:tileCoord1];
                    [self.bgLayer setTileGID:(tileGID1 - 21) at:tileCoord1];
                    
                    id actionMove = [CCMoveTo actionWithDuration:0.3 position:sprite50Pos];
                    id actionMove2 = [CCAnimate actionWithAnimation:spriteZAWalkRight restoreOriginalFrame:NO];
                    
                    id actionMoveDone = [CCCallFuncN actionWithTarget:self selector:@selector(finishActionSprite50)];
                    
                    [self.sprite50 runAction:[CCSpawn actionOne:[CCSequence actions:actionMove,actionMoveDone,nil] two:actionMove2]];
                    return;
                }
            }
        }
    }
    [self finishActionSprite50];
}
-(void) moveupSprite50
{
    CGPoint sprite50Pos = self.sprite50.position;
    self.sprite50.orientation = 2;
    sprite50Pos.y += _theHKMap.tileSize.height;
    
    CGPoint tileCoord = [self tileCoordForPosition:sprite50Pos];
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
                    [self.bgLayer setTileGID:(tileGID + 21) at:tileCoord];
                    CGPoint tileCoord1 = [self tileCoordForPosition:self.sprite50.position];
                    int tileGID1 = [self.bgLayer tileGIDAt:tileCoord1];
                    [self.bgLayer removeTileAt:tileCoord1];
                    [self.bgLayer setTileGID:(tileGID1 - 21) at:tileCoord1];
                    
                    id actionMove = [CCMoveTo actionWithDuration:0.3 position:sprite50Pos];
                    id actionMove2 = [CCAnimate actionWithAnimation:spriteZAWalkUp restoreOriginalFrame:NO];
                    
                    id actionMoveDone = [CCCallFuncN actionWithTarget:self selector:@selector(finishActionSprite50)];
                    
                    [self.sprite50 runAction:[CCSpawn actionOne:[CCSequence actions:actionMove,actionMoveDone,nil] two:actionMove2]];
                    return;
                }
            }
        }
    }
    [self finishActionSprite50];
}
-(void) movedownSprite50
{
    CGPoint sprite50Pos = self.sprite50.position;
    self.sprite50.orientation = 1;
    sprite50Pos.y -= _theHKMap.tileSize.width;
    
    CGPoint tileCoord = [self tileCoordForPosition:sprite50Pos];
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
                    [self.bgLayer setTileGID:(tileGID + 21) at:tileCoord];
                    CGPoint tileCoord1 = [self tileCoordForPosition:self.sprite50.position];
                    int tileGID1 = [self.bgLayer tileGIDAt:tileCoord1];
                    [self.bgLayer removeTileAt:tileCoord1];
                    [self.bgLayer setTileGID:(tileGID1 - 21) at:tileCoord1];
                    
                    id actionMove = [CCMoveTo actionWithDuration:0.3 position:sprite50Pos];
                    id actionMove2 = [CCAnimate actionWithAnimation:spriteZAWalkDown restoreOriginalFrame:NO];
                    
                    id actionMoveDone = [CCCallFuncN actionWithTarget:self selector:@selector(finishActionSprite50)];
                    
                    [self.sprite50 runAction:[CCSpawn actionOne:[CCSequence actions:actionMove,actionMoveDone,nil] two:actionMove2]];
                    return;
                }
            }
        }
    }
    [self finishActionSprite50];
}
-(void) finishActionSprite50
{
    if (self.sprite50.orientation == 1)
    {
        [self.sprite50 setDisplayFrame:[[spriteZAWalkDown frames] objectAtIndex:0]];
    }
    else if (self.sprite50.orientation == 2)
    {
        [self.sprite50 setDisplayFrame:[[spriteZAWalkUp frames] objectAtIndex:0]];
    }
    else if (self.sprite50.orientation == 3)
    {
        [self.sprite50 setDisplayFrame:[[spriteZAWalkRight frames] objectAtIndex:0]];
    }
    else
    {
        [self.sprite50 setDisplayFrame:[[spriteZAWalkLeft frames] objectAtIndex:0]];
    }
    self.hero.sprite50position = self.sprite50.position;
}


-(void) updateSprite51
{
    CGSize screenSize = [[CCDirector sharedDirector] winSize];
    int x = self.hero.position.x;
    int y = self.hero.position.y;
    
    int p = self.sprite51.position.x;
    int q = self.sprite51.position.y;
    
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
    
    int rand = arc4random()%14;
    if (rand == 1)
    {
        [self moveleftSprite51];
    }
    if (rand == 2)
    {
        [self moverightSprite51];
    }
    if (rand == 3)
    {
        [self moveupSprite51];
    }
    if (rand == 4)
    {
        [self movedownSprite51];
    }
    return;
}

-(void) moveleftSprite51
{
    CGPoint sprite51Pos = self.sprite51.position;
    self.sprite51.orientation = 4;
    sprite51Pos.x -= _theHKMap.tileSize.width;
    
    CGPoint tileCoord = [self tileCoordForPosition:sprite51Pos];
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
                    [self.bgLayer setTileGID:(tileGID + 22) at:tileCoord];
                    CGPoint tileCoord1 = [self tileCoordForPosition:self.sprite51.position];
                    int tileGID1 = [self.bgLayer tileGIDAt:tileCoord1];
                    [self.bgLayer removeTileAt:tileCoord1];
                    [self.bgLayer setTileGID:(tileGID1 - 22) at:tileCoord1];
                    
                    id actionMove = [CCMoveTo actionWithDuration:0.3 position:sprite51Pos];
                    id actionMove2 = [CCAnimate actionWithAnimation:spriteTWalkLeft restoreOriginalFrame:NO];
                    
                    id actionMoveDone = [CCCallFuncN actionWithTarget:self selector:@selector(finishActionSprite51)];
                    
                    [self.sprite51 runAction:[CCSpawn actionOne:[CCSequence actions:actionMove,actionMoveDone,nil] two:actionMove2]];
                    return;
                }
            }
        }
    }
    [self finishActionSprite51];
}
-(void) moverightSprite51
{
    CGPoint sprite51Pos = self.sprite51.position;
    self.sprite51.orientation = 3;
    sprite51Pos.x += _theHKMap.tileSize.width;
    
    CGPoint tileCoord = [self tileCoordForPosition:sprite51Pos];
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
                    [self.bgLayer setTileGID:(tileGID + 22) at:tileCoord];
                    CGPoint tileCoord1 = [self tileCoordForPosition:self.sprite51.position];
                    int tileGID1 = [self.bgLayer tileGIDAt:tileCoord1];
                    [self.bgLayer removeTileAt:tileCoord1];
                    [self.bgLayer setTileGID:(tileGID1 - 22) at:tileCoord1];
                    
                    id actionMove = [CCMoveTo actionWithDuration:0.3 position:sprite51Pos];
                    id actionMove2 = [CCAnimate actionWithAnimation:spriteTWalkRight restoreOriginalFrame:NO];
                    
                    id actionMoveDone = [CCCallFuncN actionWithTarget:self selector:@selector(finishActionSprite51)];
                    
                    [self.sprite51 runAction:[CCSpawn actionOne:[CCSequence actions:actionMove,actionMoveDone,nil] two:actionMove2]];
                    return;
                }
            }
        }
    }
    [self finishActionSprite51];
}
-(void) moveupSprite51
{
    CGPoint sprite51Pos = self.sprite51.position;
    self.sprite51.orientation = 2;
    sprite51Pos.y += _theHKMap.tileSize.height;
    
    CGPoint tileCoord = [self tileCoordForPosition:sprite51Pos];
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
                    [self.bgLayer setTileGID:(tileGID + 22) at:tileCoord];
                    CGPoint tileCoord1 = [self tileCoordForPosition:self.sprite51.position];
                    int tileGID1 = [self.bgLayer tileGIDAt:tileCoord1];
                    [self.bgLayer removeTileAt:tileCoord1];
                    [self.bgLayer setTileGID:(tileGID1 - 22) at:tileCoord1];
                    
                    id actionMove = [CCMoveTo actionWithDuration:0.3 position:sprite51Pos];
                    id actionMove2 = [CCAnimate actionWithAnimation:spriteTWalkUp restoreOriginalFrame:NO];
                    
                    id actionMoveDone = [CCCallFuncN actionWithTarget:self selector:@selector(finishActionSprite51)];
                    
                    [self.sprite51 runAction:[CCSpawn actionOne:[CCSequence actions:actionMove,actionMoveDone,nil] two:actionMove2]];
                    return;
                }
            }
        }
    }
    [self finishActionSprite51];
}
-(void) movedownSprite51
{
    CGPoint sprite51Pos = self.sprite51.position;
    self.sprite51.orientation = 1;
    sprite51Pos.y -= _theHKMap.tileSize.width;
    
    CGPoint tileCoord = [self tileCoordForPosition:sprite51Pos];
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
                    [self.bgLayer setTileGID:(tileGID + 22) at:tileCoord];
                    CGPoint tileCoord1 = [self tileCoordForPosition:self.sprite51.position];
                    int tileGID1 = [self.bgLayer tileGIDAt:tileCoord1];
                    [self.bgLayer removeTileAt:tileCoord1];
                    [self.bgLayer setTileGID:(tileGID1 - 22) at:tileCoord1];
                    
                    id actionMove = [CCMoveTo actionWithDuration:0.3 position:sprite51Pos];
                    id actionMove2 = [CCAnimate actionWithAnimation:spriteTWalkDown restoreOriginalFrame:NO];
                    
                    id actionMoveDone = [CCCallFuncN actionWithTarget:self selector:@selector(finishActionSprite51)];
                    
                    [self.sprite51 runAction:[CCSpawn actionOne:[CCSequence actions:actionMove,actionMoveDone,nil] two:actionMove2]];
                    return;
                }
            }
        }
    }
    [self finishActionSprite51];
}
-(void) finishActionSprite51
{
    if (self.sprite51.orientation == 1)
    {
        [self.sprite51 setDisplayFrame:[[spriteTWalkDown frames] objectAtIndex:0]];
    }
    else if (self.sprite51.orientation == 2)
    {
        [self.sprite51 setDisplayFrame:[[spriteTWalkUp frames] objectAtIndex:0]];
    }
    else if (self.sprite51.orientation == 3)
    {
        [self.sprite51 setDisplayFrame:[[spriteTWalkRight frames] objectAtIndex:0]];
    }
    else
    {
        [self.sprite51 setDisplayFrame:[[spriteTWalkLeft frames] objectAtIndex:0]];
    }
    self.hero.sprite51position = self.sprite51.position;
}


-(void) updateSprite52
{
    CGSize screenSize = [[CCDirector sharedDirector] winSize];
    int x = self.hero.position.x;
    int y = self.hero.position.y;
    
    int p = self.sprite52.position.x;
    int q = self.sprite52.position.y;
    
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
        [self moveleftSprite52];
    }
    if (rand == 2)
    {
        [self moverightSprite52];
    }
    if (rand == 3)
    {
        [self moveupSprite52];
    }
    if (rand == 4)
    {
        [self movedownSprite52];
    }
    return;
}

-(void) moveleftSprite52
{
    CGPoint sprite52Pos = self.sprite52.position;
    self.sprite52.orientation = 4;
    sprite52Pos.x -= _theHKMap.tileSize.width;
    
    CGPoint tileCoord = [self tileCoordForPosition:sprite52Pos];
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
                    [self.bgLayer setTileGID:(tileGID + 23) at:tileCoord];
                    CGPoint tileCoord1 = [self tileCoordForPosition:self.sprite52.position];
                    int tileGID1 = [self.bgLayer tileGIDAt:tileCoord1];
                    [self.bgLayer removeTileAt:tileCoord1];
                    [self.bgLayer setTileGID:(tileGID1 - 23) at:tileCoord1];
                    
                    id actionMove = [CCMoveTo actionWithDuration:0.3 position:sprite52Pos];
                    id actionMove2 = [CCAnimate actionWithAnimation:spriteIWalkLeft restoreOriginalFrame:NO];
                    
                    id actionMoveDone = [CCCallFuncN actionWithTarget:self selector:@selector(finishActionSprite52)];
                    
                    [self.sprite52 runAction:[CCSpawn actionOne:[CCSequence actions:actionMove,actionMoveDone,nil] two:actionMove2]];
                    return;
                }
            }
        }
    }
    [self finishActionSprite52];
}
-(void) moverightSprite52
{
    CGPoint sprite52Pos = self.sprite52.position;
    self.sprite52.orientation = 3;
    sprite52Pos.x += _theHKMap.tileSize.width;
    
    CGPoint tileCoord = [self tileCoordForPosition:sprite52Pos];
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
                    [self.bgLayer setTileGID:(tileGID + 23) at:tileCoord];
                    CGPoint tileCoord1 = [self tileCoordForPosition:self.sprite52.position];
                    int tileGID1 = [self.bgLayer tileGIDAt:tileCoord1];
                    [self.bgLayer removeTileAt:tileCoord1];
                    [self.bgLayer setTileGID:(tileGID1 - 23) at:tileCoord1];
                    
                    id actionMove = [CCMoveTo actionWithDuration:0.3 position:sprite52Pos];
                    id actionMove2 = [CCAnimate actionWithAnimation:spriteIWalkRight restoreOriginalFrame:NO];
                    
                    id actionMoveDone = [CCCallFuncN actionWithTarget:self selector:@selector(finishActionSprite52)];
                    
                    [self.sprite52 runAction:[CCSpawn actionOne:[CCSequence actions:actionMove,actionMoveDone,nil] two:actionMove2]];
                    return;
                }
            }
        }
    }
    [self finishActionSprite52];
}
-(void) moveupSprite52
{
    CGPoint sprite52Pos = self.sprite52.position;
    self.sprite52.orientation = 2;
    sprite52Pos.y += _theHKMap.tileSize.height;
    
    CGPoint tileCoord = [self tileCoordForPosition:sprite52Pos];
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
                    [self.bgLayer setTileGID:(tileGID + 23) at:tileCoord];
                    CGPoint tileCoord1 = [self tileCoordForPosition:self.sprite52.position];
                    int tileGID1 = [self.bgLayer tileGIDAt:tileCoord1];
                    [self.bgLayer removeTileAt:tileCoord1];
                    [self.bgLayer setTileGID:(tileGID1 - 23) at:tileCoord1];
                    
                    id actionMove = [CCMoveTo actionWithDuration:0.3 position:sprite52Pos];
                    id actionMove2 = [CCAnimate actionWithAnimation:spriteIWalkUp restoreOriginalFrame:NO];
                    
                    id actionMoveDone = [CCCallFuncN actionWithTarget:self selector:@selector(finishActionSprite52)];
                    
                    [self.sprite52 runAction:[CCSpawn actionOne:[CCSequence actions:actionMove,actionMoveDone,nil] two:actionMove2]];
                    return;
                }
            }
        }
    }
    [self finishActionSprite52];
}
-(void) movedownSprite52
{
    CGPoint sprite52Pos = self.sprite52.position;
    self.sprite52.orientation = 1;
    sprite52Pos.y -= _theHKMap.tileSize.width;
    
    CGPoint tileCoord = [self tileCoordForPosition:sprite52Pos];
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
                    [self.bgLayer setTileGID:(tileGID + 23) at:tileCoord];
                    CGPoint tileCoord1 = [self tileCoordForPosition:self.sprite52.position];
                    int tileGID1 = [self.bgLayer tileGIDAt:tileCoord1];
                    [self.bgLayer removeTileAt:tileCoord1];
                    [self.bgLayer setTileGID:(tileGID1 - 23) at:tileCoord1];
                    
                    id actionMove = [CCMoveTo actionWithDuration:0.3 position:sprite52Pos];
                    id actionMove2 = [CCAnimate actionWithAnimation:spriteIWalkDown restoreOriginalFrame:NO];
                    
                    id actionMoveDone = [CCCallFuncN actionWithTarget:self selector:@selector(finishActionSprite52)];
                    
                    [self.sprite52 runAction:[CCSpawn actionOne:[CCSequence actions:actionMove,actionMoveDone,nil] two:actionMove2]];
                    return;
                }
            }
        }
    }
    [self finishActionSprite52];
}
-(void) finishActionSprite52
{
    if (self.sprite52.orientation == 1)
    {
        [self.sprite52 setDisplayFrame:[[spriteIWalkDown frames] objectAtIndex:0]];
    }
    else if (self.sprite52.orientation == 2)
    {
        [self.sprite52 setDisplayFrame:[[spriteIWalkUp frames] objectAtIndex:0]];
    }
    else if (self.sprite52.orientation == 3)
    {
        [self.sprite52 setDisplayFrame:[[spriteIWalkRight frames] objectAtIndex:0]];
    }
    else
    {
        [self.sprite52 setDisplayFrame:[[spriteIWalkLeft frames] objectAtIndex:0]];
    }
    self.hero.sprite52position = self.sprite52.position;
}



-(void) updateSprite53
{
    CGSize screenSize = [[CCDirector sharedDirector] winSize];
    int x = self.hero.position.x;
    int y = self.hero.position.y;
    
    int p = self.sprite53.position.x;
    int q = self.sprite53.position.y;
    
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
    
    int rand = arc4random()%14;
    if (rand == 1)
    {
        [self moveleftSprite53];
    }
    if (rand == 2)
    {
        [self moverightSprite53];
    }
    if (rand == 3)
    {
        [self moveupSprite53];
    }
    if (rand == 4)
    {
        [self movedownSprite53];
    }
    return;
}

-(void) moveleftSprite53
{
    CGPoint sprite53Pos = self.sprite53.position;
    self.sprite53.orientation = 4;
    sprite53Pos.x -= _theHKMap.tileSize.width;
    
    CGPoint tileCoord = [self tileCoordForPosition:sprite53Pos];
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
                    [self.bgLayer setTileGID:(tileGID + 24) at:tileCoord];
                    CGPoint tileCoord1 = [self tileCoordForPosition:self.sprite53.position];
                    int tileGID1 = [self.bgLayer tileGIDAt:tileCoord1];
                    [self.bgLayer removeTileAt:tileCoord1];
                    [self.bgLayer setTileGID:(tileGID1 - 24) at:tileCoord1];
                    
                    id actionMove = [CCMoveTo actionWithDuration:0.3 position:sprite53Pos];
                    id actionMove2 = [CCAnimate actionWithAnimation:spriteAWalkLeft restoreOriginalFrame:NO];
                    
                    id actionMoveDone = [CCCallFuncN actionWithTarget:self selector:@selector(finishActionSprite53)];
                    
                    [self.sprite53 runAction:[CCSpawn actionOne:[CCSequence actions:actionMove,actionMoveDone,nil] two:actionMove2]];
                    return;
                }
            }
        }
    }
    [self finishActionSprite53];
}
-(void) moverightSprite53
{
    CGPoint sprite53Pos = self.sprite53.position;
    self.sprite53.orientation = 3;
    sprite53Pos.x += _theHKMap.tileSize.width;
    
    CGPoint tileCoord = [self tileCoordForPosition:sprite53Pos];
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
                    [self.bgLayer setTileGID:(tileGID + 24) at:tileCoord];
                    CGPoint tileCoord1 = [self tileCoordForPosition:self.sprite53.position];
                    int tileGID1 = [self.bgLayer tileGIDAt:tileCoord1];
                    [self.bgLayer removeTileAt:tileCoord1];
                    [self.bgLayer setTileGID:(tileGID1 - 24) at:tileCoord1];
                    
                    id actionMove = [CCMoveTo actionWithDuration:0.3 position:sprite53Pos];
                    id actionMove2 = [CCAnimate actionWithAnimation:spriteAWalkRight restoreOriginalFrame:NO];
                    
                    id actionMoveDone = [CCCallFuncN actionWithTarget:self selector:@selector(finishActionSprite53)];
                    
                    [self.sprite53 runAction:[CCSpawn actionOne:[CCSequence actions:actionMove,actionMoveDone,nil] two:actionMove2]];
                    return;
                }
            }
        }
    }
    [self finishActionSprite53];
}
-(void) moveupSprite53
{
    CGPoint sprite53Pos = self.sprite53.position;
    self.sprite53.orientation = 2;
    sprite53Pos.y += _theHKMap.tileSize.height;
    
    CGPoint tileCoord = [self tileCoordForPosition:sprite53Pos];
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
                    [self.bgLayer setTileGID:(tileGID + 24) at:tileCoord];
                    CGPoint tileCoord1 = [self tileCoordForPosition:self.sprite53.position];
                    int tileGID1 = [self.bgLayer tileGIDAt:tileCoord1];
                    [self.bgLayer removeTileAt:tileCoord1];
                    [self.bgLayer setTileGID:(tileGID1 - 24) at:tileCoord1];
                    
                    id actionMove = [CCMoveTo actionWithDuration:0.3 position:sprite53Pos];
                    id actionMove2 = [CCAnimate actionWithAnimation:spriteAWalkUp restoreOriginalFrame:NO];
                    
                    id actionMoveDone = [CCCallFuncN actionWithTarget:self selector:@selector(finishActionSprite53)];
                    
                    [self.sprite53 runAction:[CCSpawn actionOne:[CCSequence actions:actionMove,actionMoveDone,nil] two:actionMove2]];
                    return;
                }
            }
        }
    }
    [self finishActionSprite53];
}
-(void) movedownSprite53
{
    CGPoint sprite53Pos = self.sprite53.position;
    self.sprite53.orientation = 1;
    sprite53Pos.y -= _theHKMap.tileSize.width;
    
    CGPoint tileCoord = [self tileCoordForPosition:sprite53Pos];
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
                    [self.bgLayer setTileGID:(tileGID + 24) at:tileCoord];
                    CGPoint tileCoord1 = [self tileCoordForPosition:self.sprite53.position];
                    int tileGID1 = [self.bgLayer tileGIDAt:tileCoord1];
                    [self.bgLayer removeTileAt:tileCoord1];
                    [self.bgLayer setTileGID:(tileGID1 - 24) at:tileCoord1];
                    
                    id actionMove = [CCMoveTo actionWithDuration:0.3 position:sprite53Pos];
                    id actionMove2 = [CCAnimate actionWithAnimation:spriteAWalkDown restoreOriginalFrame:NO];
                    
                    id actionMoveDone = [CCCallFuncN actionWithTarget:self selector:@selector(finishActionSprite53)];
                    
                    [self.sprite53 runAction:[CCSpawn actionOne:[CCSequence actions:actionMove,actionMoveDone,nil] two:actionMove2]];
                    return;
                }
            }
        }
    }
    [self finishActionSprite53];
}
-(void) finishActionSprite53
{
    if (self.sprite53.orientation == 1)
    {
        [self.sprite53 setDisplayFrame:[[spriteAWalkDown frames] objectAtIndex:0]];
    }
    else if (self.sprite53.orientation == 2)
    {
        [self.sprite53 setDisplayFrame:[[spriteAWalkUp frames] objectAtIndex:0]];
    }
    else if (self.sprite53.orientation == 3)
    {
        [self.sprite53 setDisplayFrame:[[spriteAWalkRight frames] objectAtIndex:0]];
    }
    else
    {
        [self.sprite53 setDisplayFrame:[[spriteAWalkLeft frames] objectAtIndex:0]];
    }
    self.hero.sprite53position = self.sprite53.position;
}




-(void)pickedUpItem:(int)itemCode
{
    [MusicHandler playButtonClick];
    if (itemCode == 5)
    {
        CGPoint pos = self.item5.position;
        self.hero.gotItem5 = YES;
        [self.theHKMap removeChild:self.item5 cleanup:YES];
        self.item5 = [CCSprite spriteWithFile:@"treasurechestSprite02.png"];
        self.item5.position = pos;
        [self.theHKMap addChild:self.item5 z:self.bgLayer.zOrder];
        
        [self givenItem:91];
    }
    else if (itemCode == 6)
    {
        self.hero.gotItem6 = YES;
        [self.theHKMap removeChild:self.item6 cleanup:YES];
        self.hero.gold += 10;
        
    }
    else if (itemCode == 7)
    {
        CGPoint pos = self.item7.position;
        self.hero.gotItem7 = YES;
        [self.theHKMap removeChild:self.item7 cleanup:YES];
        self.item7 = [CCSprite spriteWithFile:@"treasurechestSprite02.png"];
        self.item7.position = pos;
        [self.theHKMap addChild:self.item7 z:self.bgLayer.zOrder];
        
        self.hero.gold += 25;
        
    }
    else if (itemCode == 8)
    {
        CGPoint pos = self.item8.position;
        self.hero.gotItem8 = YES;
        [self.theHKMap removeChild:self.item8 cleanup:YES];
        self.item8 = [CCSprite spriteWithFile:@"treasurechestSprite02.png"];
        self.item8.position = pos;
        [self.theHKMap addChild:self.item8 z:self.bgLayer.zOrder];
        
        [self givenItem:153];
    }
    else{
        NSLog(@"ErrorPICKEDUPITEM");
    }
    return;
}

-(void) givenItem:(int)itemCode //used for repellent (sprite 39)
{
    NSMutableArray *array = [self.hero.heroInventory mutableCopy];
    
    Item *itemGiven = [[Item alloc] initWithItemCode:itemCode];
    
    [array addObject:(itemGiven)];
    self.hero.heroInventory = array;
    [self saveHero];
}

-(void)stayAtInn
{
    self.hero.heroCurrentHP = self.hero.heroHP;
    self.hero.gold -= 1;
    self.hero.mapInitMode = 1;
    [self saveHero];
    [SceneManager goPlay:2];
    return;
}



-(void) goGate:(int)gate
{
    
    
    self.hero.mapInitMode = 2;
    [self saveHero];
    
    if (gate == 1)
    {
        [SceneManager goPlay:1];
    }
    else if (gate == 121)
    {
        [SceneManager goPlay:21];
    }
    else{
        NSLog(@"PL2 GATE ERROR");
    }
    return;
}



-(void)saveHero
{
    self.hero.sprite30position = self.sprite30.position;
    self.hero.sprite31position = self.sprite31.position;
    self.hero.sprite32position = self.sprite32.position;
    self.hero.sprite33position = self.sprite33.position;
    self.hero.sprite34position = self.sprite34.position;
    self.hero.sprite35position = self.sprite35.position;
    self.hero.sprite36position = self.sprite36.position;
    self.hero.sprite37position = self.sprite37.position;
    self.hero.sprite38position = self.sprite38.position;
    self.hero.sprite39position = self.sprite39.position;
    self.hero.sprite40position = self.sprite40.position;
    self.hero.sprite41position = self.sprite41.position;
    self.hero.sprite42position = self.sprite42.position;
    self.hero.sprite43position = self.sprite43.position;
    self.hero.sprite44position = self.sprite44.position;
    self.hero.sprite45position = self.sprite45.position;
    self.hero.sprite46position = self.sprite46.position;
    self.hero.sprite47position = self.sprite47.position;
    self.hero.sprite48position = self.sprite48.position;
    self.hero.sprite49position = self.sprite49.position;
    self.hero.sprite50position = self.sprite50.position;
    self.hero.sprite51position = self.sprite51.position;
    self.hero.sprite52position = self.sprite52.position;
    self.hero.sprite53position = self.sprite53.position;
    
    self.hero.heroOrientation = self.spriteOrientation;
    
    self.hero.sprite30_Orientation = self.sprite30.orientation;
    self.hero.sprite31_Orientation = self.sprite31.orientation;
    self.hero.sprite32_Orientation = self.sprite32.orientation;
    self.hero.sprite33_Orientation = self.sprite33.orientation;
    self.hero.sprite34_Orientation = self.sprite34.orientation;
    self.hero.sprite35_Orientation = self.sprite35.orientation;
    self.hero.sprite36_Orientation = self.sprite36.orientation;
    self.hero.sprite37_Orientation = self.sprite37.orientation;
    self.hero.sprite38_Orientation = self.sprite38.orientation;
    self.hero.sprite39_Orientation = self.sprite39.orientation;
    self.hero.sprite40_Orientation = self.sprite40.orientation;
    self.hero.sprite41_Orientation = self.sprite41.orientation;
    self.hero.sprite42_Orientation = self.sprite42.orientation;
    self.hero.sprite43_Orientation = self.sprite43.orientation;
    self.hero.sprite44_Orientation = self.sprite44.orientation;
    self.hero.sprite45_Orientation = self.sprite45.orientation;
    self.hero.sprite46_Orientation = self.sprite46.orientation;
    self.hero.sprite47_Orientation = self.sprite47.orientation;
    self.hero.sprite48_Orientation = self.sprite48.orientation;
    self.hero.sprite49_Orientation = self.sprite49.orientation;
    self.hero.sprite50_Orientation = self.sprite50.orientation;
    self.hero.sprite51_Orientation = self.sprite51.orientation;
    self.hero.sprite52_Orientation = self.sprite52.orientation;
    self.hero.sprite53_Orientation = self.sprite53.orientation;
    
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
            
            NSString *gate1 = [properties valueForKey:@"gate1"];
            if (gate1 && [gate1 compare:@"true"] == NSOrderedSame)
            {
                
                [self goGate:1];
                return;
                
            }
            
            NSString *cave1 = [properties valueForKey:@"cave"];
            if (cave1 && [cave1 compare:@"true"] == NSOrderedSame)
            {
                
                {
                    [self goGate:121];
                    return;
                }
            }
            
            NSString *boss12Interact = [properties valueForKey:@"autoBattleID"];
            if (boss12Interact && [boss12Interact compare:@"12"] == NSOrderedSame)
            {
                if (!self.hero.beatTowerKeeper)
                {
                    
                    if (self.canRespondToTouch)
                        self.canRespondToTouch = NO;
                    else
                        self.canRespondToTouch = YES;
                    [self performSelector:@selector(toggleTouchEnabled) withObject:nil afterDelay:0.04];
                    return;
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
            
            NSString *mapitem6 = [properties valueForKey:@"item6"];
            if (mapitem6 && [mapitem6 compare:@"true"] == NSOrderedSame)
            {
                if (!self.hero.gotItem6)
                {
                    [self pickedUpItem:6];
                    [self saveHero];
                    [self goText:1306];
                }
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
            NSString *cave1 = [properties valueForKey:@"cave"];
            if (cave1 && [cave1 compare:@"true"] == NSOrderedSame)
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
                    
                    [self goGate:121];
                    return;
                }
            }
            
            NSString *gate1 = [properties valueForKey:@"gate1"];
            if (gate1 && [gate1 compare:@"true"] == NSOrderedSame)
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
                    [self goGate:1];
                    return;
                }
            }
            NSString *boss12Interact = [properties valueForKey:@"autoBattleID"];
            if (boss12Interact && [boss12Interact compare:@"12"] == NSOrderedSame)
            {
                if (!self.hero.beatTowerKeeper)
                {
                    
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
            
            NSString *mapitem6 = [properties valueForKey:@"item6"];
            if (mapitem6 && [mapitem6 compare:@"true"] == NSOrderedSame)
            {
                if (!self.hero.gotItem6)
                {
                    [self pickedUpItem:6];
                    [self saveHero];
                    [self goText:1306];
                }
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
            
            NSString *sprite30Interact = [properties valueForKey:@"sprite30IsHere"];
            if (sprite30Interact && [sprite30Interact compare:@"true"] == NSOrderedSame)
            {
                self.sprite30.orientation = oppOrientation;
                
                if (self.sprite30.orientation == 1)
                {
                    [self.sprite30 setDisplayFrame:[[spriteAWalkDown frames] objectAtIndex:0]];
                }
                else if (self.sprite30.orientation == 2)
                {
                    [self.sprite30 setDisplayFrame:[[spriteAWalkUp frames] objectAtIndex:0]];
                }
                else if (self.sprite30.orientation == 3)
                {
                    [self.sprite30 setDisplayFrame:[[spriteAWalkRight frames] objectAtIndex:0]];
                }
                else
                {
                    [self.sprite30 setDisplayFrame:[[spriteAWalkLeft frames] objectAtIndex:0]];
                }
                
                if (self.hero.beatIonak)
                {
                    [self goText:1002 sprite:30];
                    return;
                }
                else if (self.hero.deliveredLetterToKingK)
                {
                    [self goText:1001 sprite:30];
                    return;
                }
                else
                {
                    [self goText:1000 sprite:30];
                    return;
                }
            }
            
            NSString *sprite31Interact = [properties valueForKey:@"sprite31IsHere"];
            if (sprite31Interact && [sprite31Interact compare:@"true"] == NSOrderedSame)
            {
                self.sprite31.orientation = oppOrientation;
                
                if (self.sprite31.orientation == 1)
                {
                    [self.sprite31 setDisplayFrame:[[spriteAWalkDown frames] objectAtIndex:0]];
                }
                else if (self.sprite31.orientation == 2)
                {
                    [self.sprite31 setDisplayFrame:[[spriteAWalkUp frames] objectAtIndex:0]];
                }
                else if (self.sprite31.orientation == 3)
                {
                    [self.sprite31 setDisplayFrame:[[spriteAWalkRight frames] objectAtIndex:0]];
                }
                else
                {
                    [self.sprite31 setDisplayFrame:[[spriteAWalkLeft frames] objectAtIndex:0]];
                }
                
                if (self.hero.beatIonak)
                {
                    [self goText:1005 sprite:31];
                    return;
                }
                else
                {
                    [self goText:1004 sprite:31];
                }
            }
            
            NSString *sprite32Interact = [properties valueForKey:@"sprite32IsHere"];
            if (sprite32Interact && [sprite32Interact compare:@"true"] == NSOrderedSame)
            {
                self.sprite32.orientation = oppOrientation;
                
                if (self.sprite32.orientation == 1)
                {
                    [self.sprite32 setDisplayFrame:[[spriteAWalkDown frames] objectAtIndex:0]];
                }
                else if (self.sprite32.orientation == 2)
                {
                    [self.sprite32 setDisplayFrame:[[spriteAWalkUp frames] objectAtIndex:0]];
                }
                else if (self.sprite32.orientation == 3)
                {
                    [self.sprite32 setDisplayFrame:[[spriteAWalkRight frames] objectAtIndex:0]];
                }
                else
                {
                    [self.sprite32 setDisplayFrame:[[spriteAWalkLeft frames] objectAtIndex:0]];
                }
                
                if (self.hero.beatIonak)
                {
                    [self goText:1007 sprite:32];
                    return;
                }
                else
                {
                    [self goText:1006 sprite:32];
                }
            }
            
            NSString *sprite33Interact = [properties valueForKey:@"sprite33IsHere"];
            if (sprite33Interact && [sprite33Interact compare:@"true"] == NSOrderedSame)
            {
                self.sprite33.orientation = oppOrientation;
                
                if (self.sprite33.orientation == 1)
                {
                    [self.sprite33 setDisplayFrame:[[spriteAWalkDown frames] objectAtIndex:0]];
                }
                else if (self.sprite33.orientation == 2)
                {
                    [self.sprite33 setDisplayFrame:[[spriteAWalkUp frames] objectAtIndex:0]];
                }
                else if (self.sprite33.orientation == 3)
                {
                    [self.sprite33 setDisplayFrame:[[spriteAWalkRight frames] objectAtIndex:0]];
                }
                else
                {
                    [self.sprite33 setDisplayFrame:[[spriteAWalkLeft frames] objectAtIndex:0]];
                }
                
                if (self.hero.beatIonak)
                {
                    [self goText:1009 sprite:33];
                    return;
                }
                else
                {
                    [self goText:1008 sprite:33];
                }
            }
            
            NSString *sprite34Interact = [properties valueForKey:@"sprite34IsHere"];
            if (sprite34Interact && [sprite34Interact compare:@"true"] == NSOrderedSame)
            {
                self.sprite34.orientation = oppOrientation;
                
                if (self.sprite34.orientation == 1)
                {
                    [self.sprite34 setDisplayFrame:[[spriteXWalkDown frames] objectAtIndex:0]];
                }
                else if (self.sprite34.orientation == 2)
                {
                    [self.sprite34 setDisplayFrame:[[spriteXWalkUp frames] objectAtIndex:0]];
                }
                else if (self.sprite34.orientation == 3)
                {
                    [self.sprite34 setDisplayFrame:[[spriteXWalkRight frames] objectAtIndex:0]];
                }
                else
                {
                    [self.sprite34 setDisplayFrame:[[spriteXWalkLeft frames] objectAtIndex:0]];
                }
                
                if (self.hero.beatIonak)
                {
                    [self goText:1950 sprite:34];
                    return;
                }
                else if (self.hero.deliveredLetterToKingK)
                {
                    [self goText:1949 sprite:34];
                    return;
                }
                else
                {
                    [self goText:1948 sprite:34];
                }
            }
            
            NSString *sprite35Interact = [properties valueForKey:@"sprite35IsHere"];
            if (sprite35Interact && [sprite35Interact compare:@"true"] == NSOrderedSame)
            {
                self.sprite35.orientation = oppOrientation;
                
                if (self.sprite35.orientation == 1)
                {
                    [self.sprite35 setDisplayFrame:[[spriteLWalkDown frames] objectAtIndex:0]];
                }
                else if (self.sprite35.orientation == 2)
                {
                    [self.sprite35 setDisplayFrame:[[spriteLWalkUp frames] objectAtIndex:0]];
                }
                else if (self.sprite35.orientation == 3)
                {
                    [self.sprite35 setDisplayFrame:[[spriteLWalkRight frames] objectAtIndex:0]];
                }
                else
                {
                    [self.sprite35 setDisplayFrame:[[spriteLWalkLeft frames] objectAtIndex:0]];
                }
                
                if (self.hero.gotEarthSword)
                {
                    [self goText:1015];
                    return;
                }
                else if (self.hero.beatIonak)
                {
                    [self goText:1016 sprite:35];
                    return;
                }
                else if (self.hero.toldNewsKingV)
                {
                    [self goText:1014 sprite:35];
                    return;
                }
                else if (self.hero.acceptedMessageKingK)
                {
                    [self goText:1013 sprite:35];
                    return;
                }
                else
                {
                    [self goText:1010 sprite:35];
                    return;
                }
            }
            
            NSString *sprite36Interact = [properties valueForKey:@"sprite36IsHere"];
            if (sprite36Interact && [sprite36Interact compare:@"true"] == NSOrderedSame)
            {
                self.sprite36.orientation = oppOrientation;
                
                if (self.sprite36.orientation == 1)
                {
                    [self.sprite36 setDisplayFrame:[[spriteCWalkDown frames] objectAtIndex:0]];
                }
                else if (self.sprite36.orientation == 2)
                {
                    [self.sprite36 setDisplayFrame:[[spriteCWalkUp frames] objectAtIndex:0]];
                }
                else if (self.sprite36.orientation == 3)
                {
                    [self.sprite36 setDisplayFrame:[[spriteCWalkRight frames] objectAtIndex:0]];
                }
                else
                {
                    [self.sprite36 setDisplayFrame:[[spriteCWalkLeft frames] objectAtIndex:0]];
                }
                [self goText:1017];
                return;
            }
            
            NSString *sprite37Interact = [properties valueForKey:@"sprite37IsHere"];
            if (sprite37Interact && [sprite37Interact compare:@"true"] == NSOrderedSame)
            {
                self.sprite37.orientation = oppOrientation;
                
                if (self.sprite37.orientation == 1)
                {
                    [self.sprite37 setDisplayFrame:[[spriteZBWalkDown frames] objectAtIndex:0]];
                }
                else if (self.sprite37.orientation == 2)
                {
                    [self.sprite37 setDisplayFrame:[[spriteZBWalkUp frames] objectAtIndex:0]];
                }
                else if (self.sprite37.orientation == 3)
                {
                    [self.sprite37 setDisplayFrame:[[spriteZBWalkRight frames] objectAtIndex:0]];
                }
                else
                {
                    [self.sprite37 setDisplayFrame:[[spriteZBWalkLeft frames] objectAtIndex:0]];
                }
                
                if (self.hero.beatIonak)
                {
                    [self goText:1019 sprite:37];
                    return;
                }
                else
                {
                    [self goText:1018 sprite:37];
                    return;
                }
            }
            
            NSString *sprite38Interact = [properties valueForKey:@"sprite38IsHere"];
            if (sprite38Interact && [sprite38Interact compare:@"true"] == NSOrderedSame)
            {
                self.sprite38.orientation = oppOrientation;
                
                if (self.sprite38.orientation == 1)
                {
                    [self.sprite38 setDisplayFrame:[[spriteOWalkDown frames] objectAtIndex:0]];
                }
                else if (self.sprite38.orientation == 2)
                {
                    [self.sprite38 setDisplayFrame:[[spriteOWalkUp frames] objectAtIndex:0]];
                }
                else if (self.sprite38.orientation == 3)
                {
                    [self.sprite38 setDisplayFrame:[[spriteOWalkRight frames] objectAtIndex:0]];
                }
                else
                {
                    [self.sprite38 setDisplayFrame:[[spriteOWalkLeft frames] objectAtIndex:0]];
                }
                
                if (self.hero.beatIonak)
                {
                    [self goText:1021];
                    return;
                }
                else
                {
                    [self goText:1020];
                    return;
                }
                
                return;
            }
            
            NSString *sprite39Interact = [properties valueForKey:@"sprite39IsHere"];
            if (sprite39Interact && [sprite39Interact compare:@"true"] == NSOrderedSame)
            {
                self.sprite39.orientation = oppOrientation;
                
                if (self.sprite39.orientation == 1)
                {
                    [self.sprite39 setDisplayFrame:[[spriteSWalkDown frames] objectAtIndex:0]];
                }
                else if (self.sprite39.orientation == 2)
                {
                    [self.sprite39 setDisplayFrame:[[spriteSWalkUp frames] objectAtIndex:0]];
                }
                else if (self.sprite39.orientation == 3)
                {
                    [self.sprite39 setDisplayFrame:[[spriteSWalkRight frames] objectAtIndex:0]];
                }
                else
                {
                    [self.sprite39 setDisplayFrame:[[spriteSWalkLeft frames] objectAtIndex:0]];
                }
                
                if (self.hero.gotRepellent)
                {
                    [self goText:1023 sprite:39];
                    return;
                }
                else
                {
                    [self goText:1022 sprite:39];
                    return;
                }
            }
            
            NSString *sprite40Interact = [properties valueForKey:@"sprite40IsHere"];
            if (sprite40Interact && [sprite40Interact compare:@"true"] == NSOrderedSame)
            {
                self.sprite40.orientation = oppOrientation;
                
                if (self.sprite40.orientation == 1)
                {
                    [self.sprite40 setDisplayFrame:[[spriteRWalkDown frames] objectAtIndex:0]];
                }
                else if (self.sprite40.orientation == 2)
                {
                    [self.sprite40 setDisplayFrame:[[spriteRWalkUp frames] objectAtIndex:0]];
                }
                else if (self.sprite40.orientation == 3)
                {
                    [self.sprite40 setDisplayFrame:[[spriteRWalkRight frames] objectAtIndex:0]];
                }
                else
                {
                    [self.sprite40 setDisplayFrame:[[spriteRWalkLeft frames] objectAtIndex:0]];
                }
                
                [self goText:1025];
                return;
            }
            
            NSString *sprite41Interact = [properties valueForKey:@"sprite41IsHere"];
            if (sprite41Interact && [sprite41Interact compare:@"true"] == NSOrderedSame)
            {
                self.sprite41.orientation = oppOrientation;
                
                if (self.sprite41.orientation == 1)
                {
                    [self.sprite41 setDisplayFrame:[[spriteMWalkDown frames] objectAtIndex:0]];
                }
                else if (self.sprite41.orientation == 2)
                {
                    [self.sprite41 setDisplayFrame:[[spriteMWalkUp frames] objectAtIndex:0]];
                }
                else if (self.sprite41.orientation == 3)
                {
                    [self.sprite41 setDisplayFrame:[[spriteMWalkRight frames] objectAtIndex:0]];
                }
                else
                {
                    [self.sprite41 setDisplayFrame:[[spriteMWalkLeft frames] objectAtIndex:0]];
                }
                return;
            }
            
            NSString *sprite42Interact = [properties valueForKey:@"sprite42IsHere"];
            if (sprite42Interact && [sprite42Interact compare:@"true"] == NSOrderedSame)
            {
                self.sprite42.orientation = oppOrientation;
                
                if (self.sprite42.orientation == 1)
                {
                    [self.sprite42 setDisplayFrame:[[spriteZWalkDown frames] objectAtIndex:0]];
                }
                else if (self.sprite42.orientation == 2)
                {
                    [self.sprite42 setDisplayFrame:[[spriteZWalkUp frames] objectAtIndex:0]];
                }
                else if (self.sprite42.orientation == 3)
                {
                    [self.sprite42 setDisplayFrame:[[spriteZWalkRight frames] objectAtIndex:0]];
                }
                else
                {
                    [self.sprite42 setDisplayFrame:[[spriteZWalkLeft frames] objectAtIndex:0]];
                }
                
                if (self.hero.beatIonak)
                {
                    [self goText:1027];
                }
                else{
                    [self goText:1026];
                }
                return;
            }
            
            NSString *sprite43Interact = [properties valueForKey:@"sprite43IsHere"];
            if (sprite43Interact && [sprite43Interact compare:@"true"] == NSOrderedSame)
            {
                self.sprite43.orientation = oppOrientation;
                
                if (self.sprite43.orientation == 1)
                {
                    [self.sprite43 setDisplayFrame:[[spriteVWalkDown frames] objectAtIndex:0]];
                }
                else if (self.sprite43.orientation == 2)
                {
                    [self.sprite43 setDisplayFrame:[[spriteVWalkUp frames] objectAtIndex:0]];
                }
                else if (self.sprite43.orientation == 3)
                {
                    [self.sprite43 setDisplayFrame:[[spriteVWalkRight frames] objectAtIndex:0]];
                }
                else
                {
                    [self.sprite43 setDisplayFrame:[[spriteVWalkLeft frames] objectAtIndex:0]];
                }
                
                if (self.hero.beatIonak)
                {
                    [self goText:1029 sprite:43];
                    return;
                }
                else
                {
                    [self goText:1028 sprite:43];
                    return;
                }
            }
            
            NSString *sprite44Interact = [properties valueForKey:@"sprite44IsHere"];
            if (sprite44Interact && [sprite44Interact compare:@"true"] == NSOrderedSame)
            {
                self.sprite44.orientation = oppOrientation;
                
                if (self.sprite44.orientation == 1)
                {
                    [self.sprite44 setDisplayFrame:[[spriteWWalkDown frames] objectAtIndex:0]];
                }
                else if (self.sprite44.orientation == 2)
                {
                    [self.sprite44 setDisplayFrame:[[spriteWWalkUp frames] objectAtIndex:0]];
                }
                else if (self.sprite44.orientation == 3)
                {
                    [self.sprite44 setDisplayFrame:[[spriteWWalkRight frames] objectAtIndex:0]];
                }
                else
                {
                    [self.sprite44 setDisplayFrame:[[spriteWWalkLeft frames] objectAtIndex:0]];
                }
                
                [self goText:1030];
                return;
            }
            
            NSString *sprite45Interact = [properties valueForKey:@"sprite45IsHere"];
            if (sprite45Interact && [sprite45Interact compare:@"true"] == NSOrderedSame)
            {
                self.sprite45.orientation = oppOrientation;
                
                if (self.sprite45.orientation == 1)
                {
                    [self.sprite45 setDisplayFrame:[[spriteQWalkDown frames] objectAtIndex:0]];
                }
                else if (self.sprite45.orientation == 2)
                {
                    [self.sprite45 setDisplayFrame:[[spriteQWalkUp frames] objectAtIndex:0]];
                }
                else if (self.sprite45.orientation == 3)
                {
                    [self.sprite45 setDisplayFrame:[[spriteQWalkRight frames] objectAtIndex:0]];
                }
                else
                {
                    [self.sprite45 setDisplayFrame:[[spriteQWalkLeft frames] objectAtIndex:0]];
                }
                
                [self goText:1031 sprite:45];
                return;
            }
            
            NSString *sprite46Interact = [properties valueForKey:@"sprite46IsHere"];
            if (sprite46Interact && [sprite46Interact compare:@"true"] == NSOrderedSame)
            {
                self.sprite46.orientation = oppOrientation;
                
                if (self.sprite46.orientation == 1)
                {
                    [self.sprite46 setDisplayFrame:[[spriteYWalkDown frames] objectAtIndex:0]];
                }
                else if (self.sprite46.orientation == 2)
                {
                    [self.sprite46 setDisplayFrame:[[spriteYWalkUp frames] objectAtIndex:0]];
                }
                else if (self.sprite46.orientation == 3)
                {
                    [self.sprite46 setDisplayFrame:[[spriteYWalkRight frames] objectAtIndex:0]];
                }
                else
                {
                    [self.sprite46 setDisplayFrame:[[spriteYWalkLeft frames] objectAtIndex:0]];
                }
                
                [self goText:1101];
                return;
            }
            
            NSString *sprite47Interact = [properties valueForKey:@"sprite47IsHere"];
            if (sprite47Interact && [sprite47Interact compare:@"true"] == NSOrderedSame)
            {
                self.sprite47.orientation = oppOrientation;
                
                if (self.sprite47.orientation == 1)
                {
                    [self.sprite47 setDisplayFrame:[[spriteYWalkDown frames] objectAtIndex:0]];
                }
                else if (self.sprite47.orientation == 2)
                {
                    [self.sprite47 setDisplayFrame:[[spriteYWalkUp frames] objectAtIndex:0]];
                }
                else if (self.sprite47.orientation == 3)
                {
                    [self.sprite47 setDisplayFrame:[[spriteYWalkRight frames] objectAtIndex:0]];
                }
                else
                {
                    [self.sprite47 setDisplayFrame:[[spriteYWalkLeft frames] objectAtIndex:0]];
                }
                
                [self goText:1102 sprite:47];
                return;
            }
            
            NSString *sprite48Interact = [properties valueForKey:@"sprite48IsHere"];
            if (sprite48Interact && [sprite48Interact compare:@"true"] == NSOrderedSame)
            {
                self.sprite48.orientation = oppOrientation;
                
                if (self.sprite48.orientation == 1)
                {
                    [self.sprite48 setDisplayFrame:[[spriteUWalkDown frames] objectAtIndex:0]];
                }
                else if (self.sprite48.orientation == 2)
                {
                    [self.sprite48 setDisplayFrame:[[spriteUWalkUp frames] objectAtIndex:0]];
                }
                else if (self.sprite48.orientation == 3)
                {
                    [self.sprite48 setDisplayFrame:[[spriteUWalkRight frames] objectAtIndex:0]];
                }
                else
                {
                    [self.sprite48 setDisplayFrame:[[spriteUWalkLeft frames] objectAtIndex:0]];
                }
                
                [self goText:1103];
                return;
            }
            
            NSString *sprite49Interact = [properties valueForKey:@"sprite49IsHere"];
            if (sprite49Interact && [sprite49Interact compare:@"true"] == NSOrderedSame)
            {
                self.sprite49.orientation = oppOrientation;
                
                if (self.sprite49.orientation == 1)
                {
                    [self.sprite49 setDisplayFrame:[[spriteTWalkDown frames] objectAtIndex:0]];
                }
                else if (self.sprite49.orientation == 2)
                {
                    [self.sprite49 setDisplayFrame:[[spriteTWalkUp frames] objectAtIndex:0]];
                }
                else if (self.sprite49.orientation == 3)
                {
                    [self.sprite49 setDisplayFrame:[[spriteTWalkRight frames] objectAtIndex:0]];
                }
                else
                {
                    [self.sprite49 setDisplayFrame:[[spriteTWalkLeft frames] objectAtIndex:0]];
                }
                
                [self goText:1106 sprite:49];
                return;
            }
            
            NSString *sprite50Interact = [properties valueForKey:@"sprite50IsHere"];
            if (sprite50Interact && [sprite50Interact compare:@"true"] == NSOrderedSame)
            {
                self.sprite50.orientation = oppOrientation;
                
                if (self.sprite50.orientation == 1)
                {
                    [self.sprite50 setDisplayFrame:[[spriteZAWalkDown frames] objectAtIndex:0]];
                }
                else if (self.sprite50.orientation == 2)
                {
                    [self.sprite50 setDisplayFrame:[[spriteZAWalkUp frames] objectAtIndex:0]];
                }
                else if (self.sprite50.orientation == 3)
                {
                    [self.sprite50 setDisplayFrame:[[spriteZAWalkRight frames] objectAtIndex:0]];
                }
                else
                {
                    [self.sprite50 setDisplayFrame:[[spriteZAWalkLeft frames] objectAtIndex:0]];
                }
                
                [self goText:1107 sprite:50];
                return;
            }
            
            NSString *sprite51Interact = [properties valueForKey:@"sprite51IsHere"];
            if (sprite51Interact && [sprite51Interact compare:@"true"] == NSOrderedSame)
            {
                self.sprite51.orientation = oppOrientation;
                
                if (self.sprite51.orientation == 1)
                {
                    [self.sprite51 setDisplayFrame:[[spriteTWalkDown frames] objectAtIndex:0]];
                }
                else if (self.sprite51.orientation == 2)
                {
                    [self.sprite51 setDisplayFrame:[[spriteTWalkUp frames] objectAtIndex:0]];
                }
                else if (self.sprite51.orientation == 3)
                {
                    [self.sprite51 setDisplayFrame:[[spriteTWalkRight frames] objectAtIndex:0]];
                }
                else
                {
                    [self.sprite51 setDisplayFrame:[[spriteTWalkLeft frames] objectAtIndex:0]];
                }
                
                [self goText:1108 sprite:51];
                return;
            }
            
            NSString *sprite52Interact = [properties valueForKey:@"sprite52IsHere"];
            if (sprite52Interact && [sprite52Interact compare:@"true"] == NSOrderedSame)
            {
                self.sprite52.orientation = oppOrientation;
                
                if (self.sprite52.orientation == 1)
                {
                    [self.sprite52 setDisplayFrame:[[spriteIWalkDown frames] objectAtIndex:0]];
                }
                else if (self.sprite52.orientation == 2)
                {
                    [self.sprite52 setDisplayFrame:[[spriteIWalkUp frames] objectAtIndex:0]];
                }
                else if (self.sprite52.orientation == 3)
                {
                    [self.sprite52 setDisplayFrame:[[spriteIWalkRight frames] objectAtIndex:0]];
                }
                else
                {
                    [self.sprite52 setDisplayFrame:[[spriteIWalkLeft frames] objectAtIndex:0]];
                }
                
                if (self.hero.finishedTaskTraveler) 
                {
                    [self goText:1033];
                    return;
                }
                else
                {
                    [self goText:1032];
                    return;
                }
            }
            
            NSString *sprite53Interact = [properties valueForKey:@"sprite53IsHere"];
            if (sprite53Interact && [sprite53Interact compare:@"true"] == NSOrderedSame)
            {
                self.sprite53.orientation = oppOrientation;
                
                if (self.sprite53.orientation == 1)
                {
                    [self.sprite53 setDisplayFrame:[[spriteAWalkDown frames] objectAtIndex:0]];
                }
                else if (self.sprite53.orientation == 2)
                {
                    [self.sprite53 setDisplayFrame:[[spriteAWalkUp frames] objectAtIndex:0]];
                }
                else if (self.sprite53.orientation == 3)
                {
                    [self.sprite53 setDisplayFrame:[[spriteAWalkRight frames] objectAtIndex:0]];
                }
                else
                {
                    [self.sprite53 setDisplayFrame:[[spriteAWalkLeft frames] objectAtIndex:0]];
                }
                
                if (self.hero.beatIonak)
                {
                    [self goText:1037 sprite:53];
                    return;
                }
                else if (self.hero.acceptedFindEilifKingV)
                {
                    [self goText:1036 sprite:53];
                    return;
                }
                else if (self.hero.acceptedMessageKingK)
                {
                    [self goText:1035 sprite:53];
                    return;
                }
                else
                {
                    [self goText:1034 sprite:53];
                    return;
                }
            }
            
            
            NSString *boss12Interact = [properties valueForKey:@"autoBattleID"];
            if (boss12Interact && [boss12Interact compare:@"12"] == NSOrderedSame)
            {
                
                if (!self.hero.beatTowerKeeper)
                {
                    currentBID = 101;
                    [self goText:1412];
                    return;
                }
            }
            
            
            NSString *mapItem5 = [properties valueForKey:@"item5"];
            if (mapItem5 && [mapItem5 compare:@"true"] == NSOrderedSame)
            {
                
                if (!self.hero.gotItem5)
                {
                    [self goText:1305];
                    return;
                }
                else
                {
                    [self goText:1399];
                    return;
                }
            }
            NSString *mapItem6 = [properties valueForKey:@"item6"];
            if (mapItem6 && [mapItem6 compare:@"true"] == NSOrderedSame)
            {
                
                if (!self.hero.gotItem6)
                {
                    [self goText:1306];
                    return;
                }
                else
                {
                    return;
                }
            }
            NSString *mapItem7 = [properties valueForKey:@"item7"];
            if (mapItem7 && [mapItem7 compare:@"true"] == NSOrderedSame)
            {
                
                if (!self.hero.gotItem7)
                {
                    [self goText:1307];
                    return;
                }
                else
                {
                    [self goText:1399];
                    return;
                }
            }
            NSString *mapItem8 = [properties valueForKey:@"item8"];
            if (mapItem8 && [mapItem8 compare:@"true"] == NSOrderedSame)
            {
                
                if (!self.hero.gotItem8)
                {
                    [self goText:1308];
                    return;
                }
                else
                {
                    [self goText:1399];
                    return;
                }
            }
            
            NSString *sign31 = [properties valueForKey:@"sign31"];
            if (sign31 && [sign31 compare:@"true"] == NSOrderedSame)
            {
                [self goText:1200];
                return;
            }
            NSString *sign32 = [properties valueForKey:@"sign32"];
            if (sign32 && [sign32 compare:@"true"] == NSOrderedSame)
            {
                [self goText:1201];
                return;
            }
            NSString *sign33 = [properties valueForKey:@"sign33"];
            if (sign33 && [sign33 compare:@"true"] == NSOrderedSame)
            {
                [self goText:1202];
                return;
            }
            NSString *sign34 = [properties valueForKey:@"sign34"];
            if (sign34 && [sign34 compare:@"true"] == NSOrderedSame)
            {
                [self goText:1203];
                return;
            }
            
        }
    }
}




-(void) spriteCycle //should be scheduled for .125 seconds
{
    spriteCycleCount++;
    
    if (spriteCycleCount == 1)
    {
        [self updateSprite30];
        [self updateSprite49];
    }
    else if (spriteCycleCount == 2)
    {
        [self updateSprite32];
        [self updateSprite50];
    }
    else if (spriteCycleCount == 3)
    {
        [self updateSprite33];
        [self updateSprite51];
    }
    else if (spriteCycleCount == 4)
    {
        [self updateSprite34];
        [self updateSprite52];
    }
    else if (spriteCycleCount == 5)
    {
        [self updateSprite35];
        [self updateSprite36];
        [self updateSprite37];
        [self updateSprite53];
    }
    else if (spriteCycleCount == 6)
    {
        [self updateSprite38];
        [self updateSprite39];
    }
    else if (spriteCycleCount == 7)
    {
        [self updateSprite40];
        [self updateSprite41];
        [self updateSprite42];
    }
    else if (spriteCycleCount == 8)
    {
        [self updateSprite43];
        [self updateSprite44];
    }
    else if (spriteCycleCount == 9)
    {
        [self updateSprite45];
        [self updateSprite47];
    }
    else if (spriteCycleCount == 10)
    {
        [self updateSprite46];
        [self updateSprite48];
    }
    
    
    if (spriteCycleCount > 11)
    {
        spriteCycleCount = 0;
    }
    return;
}






@end









