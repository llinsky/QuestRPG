//
//  PlayLayerFour.m
//  Quest
//
//  Created by Leo Linsky on 1/7/14.
//  Copyright 2014 __MyCompanyName__. All rights reserved.
//

#import "PlayLayerFour.h"
#import "SceneManager.h"
#import "HKTMXTiledMap.h"
#import "ItemShopMenu.h"
#import "CCSendMessages.h"


@implementation PlayLayerFour


@synthesize sprite81,sprite82,sprite83,sprite84,sprite85,sprite86,sprite87,sprite88,sprite89,sprite90,sprite91,sprite92,sprite93,sprite94,sprite95,sprite96,sprite97,sprite98,sprite99,sprite100,sprite101,sprite102,sprite103,sprite104,item13,item14,item15,item16,swarm;


-(id)init
{
    if (self = [super init])
    {
        
        self.theHKMap = [HKTMXTiledMap tiledMapWithTMXFile:@"playlayer4_FINAL2.tmx"];
        [[CCDirector sharedDirector] setProjection:kCCDirectorProjection2D];
        
        
        self.bgLayer = [theHKMap layerNamed:@"bg1"];
        self.bgLayer.visible = NO;
        
        CCTMXObjectGroup *objects = [theHKMap objectGroupNamed:@"oj1"];
        
        
        [self addChild:theHKMap z:-1];
        
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
            
            [[CCSpriteFrameCache sharedSpriteFrameCache] addSpriteFramesWithFile:@"herospritePsheet.plist"];
            spritePSheet = [CCSpriteBatchNode batchNodeWithFile:@"herospritePsheet.png"];
            [spritePSheet retain];
            [self addChild:spritePSheet];
            
            NSMutableArray *spritePWalkAnimFramesLeft = [NSMutableArray array];
            NSMutableArray *spritePWalkAnimFramesRight = [NSMutableArray array];
            NSMutableArray *spritePAnimFramesUp = [NSMutableArray array];
            NSMutableArray *spritePAnimFramesDown = [NSMutableArray array];
            NSMutableArray *spritePAnimFramesUp2 = [NSMutableArray array];
            NSMutableArray *spritePAnimFramesDown2 = [NSMutableArray array];
            
            [spritePWalkAnimFramesLeft addObject:[[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:@"herospriteP05.png"]];
            [spritePWalkAnimFramesLeft addObject:[[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:@"herospriteP06.png"]];
            [spritePWalkAnimFramesLeft addObject:[[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:@"herospriteP06.png"]];
            [spritePWalkAnimFramesLeft addObject:[[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:@"herospriteP06.png"]];
            [spritePWalkAnimFramesLeft addObject:[[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:@"herospriteP05.png"]];
            spritePWalkLeft = [CCAnimation animationWithFrames:spritePWalkAnimFramesLeft delay:0.06f];
            [spritePWalkLeft retain];
            
            [spritePWalkAnimFramesRight addObject:[[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:@"herospriteP04.png"]];
            [spritePWalkAnimFramesRight addObject:[[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:@"herospriteP07.png"]];
            [spritePWalkAnimFramesRight addObject:[[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:@"herospriteP07.png"]];
            [spritePWalkAnimFramesRight addObject:[[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:@"herospriteP07.png"]];
            [spritePWalkAnimFramesRight addObject:[[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:@"herospriteP04.png"]];
            spritePWalkRight = [CCAnimation animationWithFrames:spritePWalkAnimFramesRight delay:0.06f];
            [spritePWalkRight retain];
            
            [spritePAnimFramesUp addObject:[[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:@"herospriteP08.png"]];
            [spritePAnimFramesUp addObject:[[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:@"herospriteP09.png"]];
            [spritePAnimFramesUp addObject:[[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:@"herospriteP09.png"]];
            [spritePAnimFramesUp addObject:[[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:@"herospriteP09.png"]];
            [spritePAnimFramesUp addObject:[[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:@"herospriteP08.png"]];
            spritePWalkUp = [CCAnimation animationWithFrames:spritePAnimFramesUp delay:0.06f];
            [spritePWalkUp retain];
            
            [spritePAnimFramesUp2 addObject:[[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:@"herospriteP08.png"]];
            [spritePAnimFramesUp2 addObject:[[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:@"herospriteP10.png"]];
            [spritePAnimFramesUp2 addObject:[[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:@"herospriteP10.png"]];
            [spritePAnimFramesUp2 addObject:[[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:@"herospriteP10.png"]];
            [spritePAnimFramesUp2 addObject:[[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:@"herospriteP08.png"]];
            spritePWalkUp2 = [CCAnimation animationWithFrames:spritePAnimFramesUp2 delay:0.06f];
            [spritePWalkUp2 retain];
            
            [spritePAnimFramesDown addObject:[[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:@"herospriteP01.png"]];
            [spritePAnimFramesDown addObject:[[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:@"herospriteP02.png"]];
            [spritePAnimFramesDown addObject:[[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:@"herospriteP02.png"]];
            [spritePAnimFramesDown addObject:[[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:@"herospriteP02.png"]];
            [spritePAnimFramesDown addObject:[[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:@"herospriteP01.png"]];
            spritePWalkDown = [CCAnimation animationWithFrames:spritePAnimFramesDown delay:0.06f];
            [spritePWalkDown retain];
            
            [spritePAnimFramesDown2 addObject:[[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:@"herospriteP01.png"]];
            [spritePAnimFramesDown2 addObject:[[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:@"herospriteP03.png"]];
            [spritePAnimFramesDown2 addObject:[[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:@"herospriteP03.png"]];
            [spritePAnimFramesDown2 addObject:[[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:@"herospriteP03.png"]];
            [spritePAnimFramesDown2 addObject:[[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:@"herospriteP01.png"]];
            spritePWalkDown2 = [CCAnimation animationWithFrames:spritePAnimFramesDown2 delay:0.06f];
            [spritePWalkDown2 retain];
            
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
            
            
        }
        /////////////////////////////////////////////////////////
        
        self.sprite81 = [InteractiveSprite spriteWithSpriteFrameName:@"herospriteA04.png"];
        self.sprite81.spriteCode = 81;
        
        self.sprite81.orientation = 1;
        if (self.hero.sprite81_Orientation)
        {
            self.sprite81.orientation = self.hero.sprite81_Orientation;
        }
        if (self.sprite81.orientation == 1)
        {
            [self.sprite81 setDisplayFrame:[[spriteAWalkDown frames] objectAtIndex:0]];
        }
        else if (self.sprite81.orientation == 2)
        {
            [self.sprite81 setDisplayFrame:[[spriteAWalkUp frames] objectAtIndex:0]];
        }
        else if (self.sprite81.orientation == 3)
        {
            [self.sprite81 setDisplayFrame:[[spriteAWalkRight frames] objectAtIndex:0]];
        }
        else
        {
            [self.sprite81 setDisplayFrame:[[spriteAWalkLeft frames] objectAtIndex:0]];
        }
        
        //[self schedule:@selector(updateSprite81) interval:(1.5f)];
        
        
        if (self.hero.sprite81position.x != 0)
        {
            self.sprite81.position = self.hero.sprite81position;
        }
        else
        {
            NSMutableDictionary *sprite81start = [objects objectNamed:@"spriteStart81"];
            double x1 = [[sprite81start valueForKey:@"x"]floatValue];
            double y1 = [[sprite81start valueForKey:@"y"]floatValue];
            self.sprite81.position = ccp(x1,y1);
        }
        
        
        [self.theHKMap addChild:self.sprite81 z:self.bgLayer.zOrder];
        
        CGPoint tileCoord1 = [self tileCoordForPosition:self.sprite81.position];
        int tileGID1 = [self.bgLayer tileGIDAt:tileCoord1];
        [self.bgLayer removeTileAt:tileCoord1];
        [self.bgLayer setTileGID:(tileGID1 + 1) at:tileCoord1];

        /////////////////////////////////////////////////////////
        
        self.sprite82 = [InteractiveSprite spriteWithSpriteFrameName:@"herospriteA04.png"];
        self.sprite82.spriteCode = 82;
        
        self.sprite82.orientation = 1;
        if (self.hero.sprite82_Orientation)
        {
            self.sprite82.orientation = self.hero.sprite82_Orientation;
        }
        if (self.sprite82.orientation == 1)
        {
            [self.sprite82 setDisplayFrame:[[spriteAWalkDown frames] objectAtIndex:0]];
        }
        else if (self.sprite82.orientation == 2)
        {
            [self.sprite82 setDisplayFrame:[[spriteAWalkUp frames] objectAtIndex:0]];
        }
        else if (self.sprite82.orientation == 3)
        {
            [self.sprite82 setDisplayFrame:[[spriteAWalkRight frames] objectAtIndex:0]];
        }
        else
        {
            [self.sprite82 setDisplayFrame:[[spriteAWalkLeft frames] objectAtIndex:0]];
        }
        
        //[self schedule:@selector(updateSprite82) interval:(1.5f)];
        
        if (!self.hero.talkedToEilifPostBoss)
        {
            NSMutableDictionary *sprite82start = [objects objectNamed:@"startPoint3"];
            double x1 = [[sprite82start valueForKey:@"x"]floatValue];
            double y1 = [[sprite82start valueForKey:@"y"]floatValue];
            self.sprite82.position = ccp(x1,y1);
        }
        else if (self.hero.sprite82position.x != 0)
        {
            self.sprite82.position = self.hero.sprite82position;
        }
        else
        {
            NSMutableDictionary *sprite82start = [objects objectNamed:@"spriteStart82"];
            double x1 = [[sprite82start valueForKey:@"x"]floatValue];
            double y1 = [[sprite82start valueForKey:@"y"]floatValue];
            self.sprite82.position = ccp(x1,y1);
        }
        
        
        [self.theHKMap addChild:self.sprite82 z:self.bgLayer.zOrder];
        
        CGPoint tileCoord2 = [self tileCoordForPosition:self.sprite82.position];
        int tileGID2 = [self.bgLayer tileGIDAt:tileCoord2];
        [self.bgLayer removeTileAt:tileCoord2];
        [self.bgLayer setTileGID:(tileGID2 + 2) at:tileCoord2];

        /////////////////////////////////////////////////////////
        
        self.sprite83 = [InteractiveSprite spriteWithSpriteFrameName:@"herospriteG04.png"];
        self.sprite83.spriteCode = 83;
        
        self.sprite83.orientation = 3;
        if (self.hero.sprite83_Orientation)
        {
            self.sprite83.orientation = self.hero.sprite83_Orientation;
        }
        if (self.sprite83.orientation == 1)
        {
            [self.sprite83 setDisplayFrame:[[spriteGWalkDown frames] objectAtIndex:0]];
        }
        else if (self.sprite83.orientation == 2)
        {
            [self.sprite83 setDisplayFrame:[[spriteGWalkUp frames] objectAtIndex:0]];
        }
        else if (self.sprite83.orientation == 3)
        {
            [self.sprite83 setDisplayFrame:[[spriteGWalkRight frames] objectAtIndex:0]];
        }
        else
        {
            [self.sprite83 setDisplayFrame:[[spriteGWalkLeft frames] objectAtIndex:0]];
        }
        
        if (self.hero.beatIonak && !self.hero.wentEllemakPostBeatIonak)
        {
            self.hero.wentEllemakPostBeatIonak = YES;
            NSMutableDictionary *sprite83start = [objects objectNamed:@"spriteStart83"];
            double x1 = [[sprite83start valueForKey:@"x"]floatValue];
            double y1 = [[sprite83start valueForKey:@"y"]floatValue];
            self.sprite83.position = ccp(x1,y1);
            //[self schedule:@selector(updateSprite83) interval:(1.375f)];
        }
        else if ((self.hero.sprite83position.x != 0) && self.hero.wentEllemakPostBeatIonak)
        {
            self.sprite83.position = self.hero.sprite83position;
        }
        else
        {
            NSMutableDictionary *sprite83start = [objects objectNamed:@"startPoint4"];
            double x1 = [[sprite83start valueForKey:@"x"]floatValue];
            double y1 = [[sprite83start valueForKey:@"y"]floatValue];
            self.sprite83.position = ccp(x1,y1);
            //[self schedule:@selector(updateSprite83) interval:(1.375f)];
        }
        
        
        [self.theHKMap addChild:self.sprite83 z:self.bgLayer.zOrder];
        
        CGPoint tileCoord3 = [self tileCoordForPosition:self.sprite83.position];
        int tileGID3 = [self.bgLayer tileGIDAt:tileCoord3];
        [self.bgLayer removeTileAt:tileCoord3];
        [self.bgLayer setTileGID:(tileGID3 + 3) at:tileCoord3];

        /////////////////////////////////////////////////////////
        
        self.sprite84 = [InteractiveSprite spriteWithSpriteFrameName:@"herospriteA04.png"];
        self.sprite84.spriteCode = 84;
        
        self.sprite84.orientation = 1;
        if (self.hero.sprite84_Orientation)
        {
            self.sprite84.orientation = self.hero.sprite84_Orientation;
        }
        if (self.sprite84.orientation == 1)
        {
            [self.sprite84 setDisplayFrame:[[spriteAWalkDown frames] objectAtIndex:0]];
        }
        else if (self.sprite84.orientation == 2)
        {
            [self.sprite84 setDisplayFrame:[[spriteAWalkUp frames] objectAtIndex:0]];
        }
        else if (self.sprite84.orientation == 3)
        {
            [self.sprite84 setDisplayFrame:[[spriteAWalkRight frames] objectAtIndex:0]];
        }
        else
        {
            [self.sprite84 setDisplayFrame:[[spriteAWalkLeft frames] objectAtIndex:0]];
        }
        
        //[self schedule:@selector(updateSprite84) interval:(1.5f)];
        
        if (self.hero.sprite84position.x != 0)
        {
            self.sprite84.position = self.hero.sprite84position;
        }
        else
        {
            NSMutableDictionary *sprite84start = [objects objectNamed:@"spriteStart84"];
            double x1 = [[sprite84start valueForKey:@"x"]floatValue];
            double y1 = [[sprite84start valueForKey:@"y"]floatValue];
            self.sprite84.position = ccp(x1,y1);
        }
        
        
        [self.theHKMap addChild:self.sprite84 z:self.bgLayer.zOrder];
        
        CGPoint tileCoord4 = [self tileCoordForPosition:self.sprite84.position];
        int tileGID4 = [self.bgLayer tileGIDAt:tileCoord4];
        [self.bgLayer removeTileAt:tileCoord4];
        [self.bgLayer setTileGID:(tileGID4 + 4) at:tileCoord4];
        
        /////////////////////////////////////////////////////////
        
        self.sprite85 = [InteractiveSprite spriteWithSpriteFrameName:@"herospriteA04.png"];
        self.sprite85.spriteCode = 85;
        
        self.sprite85.orientation = 1;
        if (self.hero.sprite85_Orientation)
        {
            self.sprite85.orientation = self.hero.sprite85_Orientation;
        }
        if (self.sprite85.orientation == 1)
        {
            [self.sprite85 setDisplayFrame:[[spriteAWalkDown frames] objectAtIndex:0]];
        }
        else if (self.sprite85.orientation == 2)
        {
            [self.sprite85 setDisplayFrame:[[spriteAWalkUp frames] objectAtIndex:0]];
        }
        else if (self.sprite85.orientation == 3)
        {
            [self.sprite85 setDisplayFrame:[[spriteAWalkRight frames] objectAtIndex:0]];
        }
        else
        {
            [self.sprite85 setDisplayFrame:[[spriteAWalkLeft frames] objectAtIndex:0]];
        }
        
        //[self schedule:@selector(updateSprite85) interval:(1.375f)];
        
        
        if (self.hero.sprite85position.x != 0)
        {
            self.sprite85.position = self.hero.sprite85position;
        }
        else
        {
            NSMutableDictionary *sprite85start = [objects objectNamed:@"spriteStart85"];
            double x1 = [[sprite85start valueForKey:@"x"]floatValue];
            double y1 = [[sprite85start valueForKey:@"y"]floatValue];
            self.sprite85.position = ccp(x1,y1);
        }
        
        
        [self.theHKMap addChild:self.sprite85 z:self.bgLayer.zOrder];
        
        CGPoint tileCoord5 = [self tileCoordForPosition:self.sprite85.position];
        int tileGID5 = [self.bgLayer tileGIDAt:tileCoord5];
        [self.bgLayer removeTileAt:tileCoord5];
        [self.bgLayer setTileGID:(tileGID5 + 5) at:tileCoord5];

        /////////////////////////////////////////////////////////
        
        self.sprite86 = [InteractiveSprite spriteWithSpriteFrameName:@"herospriteG04.png"];
        self.sprite86.spriteCode = 86;
        
        self.sprite86.orientation = 1;
        if (self.hero.sprite86_Orientation)
        {
            self.sprite86.orientation = self.hero.sprite86_Orientation;
        }
        if (self.sprite86.orientation == 1)
        {
            [self.sprite86 setDisplayFrame:[[spriteGWalkDown frames] objectAtIndex:0]];
        }
        else if (self.sprite86.orientation == 2)
        {
            [self.sprite86 setDisplayFrame:[[spriteGWalkUp frames] objectAtIndex:0]];
        }
        else if (self.sprite86.orientation == 3)
        {
            [self.sprite86 setDisplayFrame:[[spriteGWalkRight frames] objectAtIndex:0]];
        }
        else
        {
            [self.sprite86 setDisplayFrame:[[spriteGWalkLeft frames] objectAtIndex:0]];
        }
        
        //[self schedule:@selector(updateSprite86) interval:(1.625f)];
        
        
        if (self.hero.sprite86position.x != 0)
        {
            self.sprite86.position = self.hero.sprite86position;
        }
        else
        {
            NSMutableDictionary *sprite86start = [objects objectNamed:@"spriteStart86"];
            double x1 = [[sprite86start valueForKey:@"x"]floatValue];
            double y1 = [[sprite86start valueForKey:@"y"]floatValue];
            self.sprite86.position = ccp(x1,y1);
        }
        
        
        [self.theHKMap addChild:self.sprite86 z:self.bgLayer.zOrder];
        
        CGPoint tileCoord6 = [self tileCoordForPosition:self.sprite86.position];
        int tileGID6 = [self.bgLayer tileGIDAt:tileCoord6];
        [self.bgLayer removeTileAt:tileCoord6];
        [self.bgLayer setTileGID:(tileGID6 + 6) at:tileCoord6];

        /////////////////////////////////////////////////////////
        
        self.sprite87 = [InteractiveSprite spriteWithSpriteFrameName:@"herospriteG04.png"];
        self.sprite87.spriteCode = 87;
        
        self.sprite87.orientation = 1;
        if (self.hero.sprite87_Orientation)
        {
            self.sprite87.orientation = self.hero.sprite87_Orientation;
        }
        if (self.sprite87.orientation == 1)
        {
            [self.sprite87 setDisplayFrame:[[spriteGWalkDown frames] objectAtIndex:0]];
        }
        else if (self.sprite87.orientation == 2)
        {
            [self.sprite87 setDisplayFrame:[[spriteGWalkUp frames] objectAtIndex:0]];
        }
        else if (self.sprite87.orientation == 3)
        {
            [self.sprite87 setDisplayFrame:[[spriteGWalkRight frames] objectAtIndex:0]];
        }
        else
        {
            [self.sprite87 setDisplayFrame:[[spriteGWalkLeft frames] objectAtIndex:0]];
        }
        
        //[self schedule:@selector(updateSprite87) interval:(1.375f)];
        
        
        if (self.hero.sprite87position.x != 0)
        {
            self.sprite87.position = self.hero.sprite87position;
        }
        else
        {
            NSMutableDictionary *sprite87start = [objects objectNamed:@"spriteStart87"];
            double x1 = [[sprite87start valueForKey:@"x"]floatValue];
            double y1 = [[sprite87start valueForKey:@"y"]floatValue];
            self.sprite87.position = ccp(x1,y1);
        }
        
        
        [self.theHKMap addChild:self.sprite87 z:self.bgLayer.zOrder];
        
        CGPoint tileCoord7 = [self tileCoordForPosition:self.sprite87.position];
        int tileGID7 = [self.bgLayer tileGIDAt:tileCoord7];
        [self.bgLayer removeTileAt:tileCoord7];
        [self.bgLayer setTileGID:(tileGID7 + 7) at:tileCoord7];
        
        /////////////////////////////////////////////////////////
        
        self.sprite88 = [InteractiveSprite spriteWithSpriteFrameName:@"herospriteX04.png"];
        self.sprite88.spriteCode = 88;
        
        self.sprite88.orientation = 1;
        if (self.hero.sprite88_Orientation)
        {
            self.sprite88.orientation = self.hero.sprite88_Orientation;
        }
        if (self.sprite88.orientation == 1)
        {
            [self.sprite88 setDisplayFrame:[[spriteXWalkDown frames] objectAtIndex:0]];
        }
        else if (self.sprite88.orientation == 2)
        {
            [self.sprite88 setDisplayFrame:[[spriteXWalkUp frames] objectAtIndex:0]];
        }
        else if (self.sprite88.orientation == 3)
        {
            [self.sprite88 setDisplayFrame:[[spriteXWalkRight frames] objectAtIndex:0]];
        }
        else
        {
            [self.sprite88 setDisplayFrame:[[spriteXWalkLeft frames] objectAtIndex:0]];
        }
        
        //[self schedule:@selector(updateSprite88) interval:(1.375f)];
        
        
        if (self.hero.sprite88position.x != 0)
        {
            self.sprite88.position = self.hero.sprite88position;
        }
        else
        {
            NSMutableDictionary *sprite88start = [objects objectNamed:@"spriteStart88"];
            double x1 = [[sprite88start valueForKey:@"x"]floatValue];
            double y1 = [[sprite88start valueForKey:@"y"]floatValue];
            self.sprite88.position = ccp(x1,y1);
        }
        
        
        [self.theHKMap addChild:self.sprite88 z:self.bgLayer.zOrder];
        
        CGPoint tileCoord8 = [self tileCoordForPosition:self.sprite88.position];
        int tileGID8 = [self.bgLayer tileGIDAt:tileCoord8];
        [self.bgLayer removeTileAt:tileCoord8];
        [self.bgLayer setTileGID:(tileGID8 + 8) at:tileCoord8];


        /////////////////////////////////////////////////////////
        if (self.hero.savedKing)
        {
        
        self.sprite89 = [InteractiveSprite spriteWithSpriteFrameName:@"herospriteL04.png"];
        self.sprite89.spriteCode = 89;
        
        self.sprite89.orientation = 1;
        if (self.hero.sprite89_Orientation)
        {
            self.sprite89.orientation = self.hero.sprite89_Orientation;
        }
        if (self.sprite89.orientation == 1)
        {
            [self.sprite89 setDisplayFrame:[[spriteLWalkDown frames] objectAtIndex:0]];
        }
        else if (self.sprite89.orientation == 2)
        {
            [self.sprite89 setDisplayFrame:[[spriteLWalkUp frames] objectAtIndex:0]];
        }
        else if (self.sprite89.orientation == 3)
        {
            [self.sprite89 setDisplayFrame:[[spriteLWalkRight frames] objectAtIndex:0]];
        }
        else
        {
            [self.sprite89 setDisplayFrame:[[spriteLWalkLeft frames] objectAtIndex:0]];
        }
        
        
        if ((self.hero.sprite89position.x != 0) && (self.hero.wentEllemakPostSaveKing))
        {
            self.sprite89.position = self.hero.sprite89position;
            //[self schedule:@selector(updateSprite89) interval:(1.375f)];
        }
        else
        {
            self.hero.wentEllemakPostSaveKing = YES;
            NSMutableDictionary *sprite89start = [objects objectNamed:@"spriteStart89"];
            double x1 = [[sprite89start valueForKey:@"x"]floatValue];
            double y1 = [[sprite89start valueForKey:@"y"]floatValue];
            self.sprite89.position = ccp(x1,y1);
            //[self schedule:@selector(updateSprite89) interval:(1.375f)];
        }
        
        
        [self.theHKMap addChild:self.sprite89 z:self.bgLayer.zOrder];
        
        CGPoint tileCoord9 = [self tileCoordForPosition:self.sprite89.position];
        int tileGID9 = [self.bgLayer tileGIDAt:tileCoord9];
        [self.bgLayer removeTileAt:tileCoord9];
        [self.bgLayer setTileGID:(tileGID9 + 9) at:tileCoord9];
        }
        
        /////////////////////////////////////////////////////////
        
        self.sprite90 = [InteractiveSprite spriteWithSpriteFrameName:@"herospriteR04.png"];
        self.sprite90.spriteCode = 90;
        
        self.sprite90.orientation = 1;
        if (self.hero.sprite90_Orientation)
        {
            self.sprite90.orientation = self.hero.sprite90_Orientation;
        }
        if (self.sprite90.orientation == 1)
        {
            [self.sprite90 setDisplayFrame:[[spriteRWalkDown frames] objectAtIndex:0]];
        }
        else if (self.sprite90.orientation == 2)
        {
            [self.sprite90 setDisplayFrame:[[spriteRWalkUp frames] objectAtIndex:0]];
        }
        else if (self.sprite90.orientation == 3)
        {
            [self.sprite90 setDisplayFrame:[[spriteRWalkRight frames] objectAtIndex:0]];
        }
        else
        {
            [self.sprite90 setDisplayFrame:[[spriteRWalkLeft frames] objectAtIndex:0]];
        }
        
        //[self schedule:@selector(updateSprite90) interval:(1.375f)];
        
        
        if (self.hero.sprite90position.x != 0)
        {
            self.sprite90.position = self.hero.sprite90position;
        }
        else
        {
            NSMutableDictionary *sprite90start = [objects objectNamed:@"spriteStart90"];
            double x1 = [[sprite90start valueForKey:@"x"]floatValue];
            double y1 = [[sprite90start valueForKey:@"y"]floatValue];
            self.sprite90.position = ccp(x1,y1);
        }
        
        
        [self.theHKMap addChild:self.sprite90 z:self.bgLayer.zOrder];
        
        CGPoint tileCoord10 = [self tileCoordForPosition:self.sprite90.position];
        int tileGID10 = [self.bgLayer tileGIDAt:tileCoord10];
        [self.bgLayer removeTileAt:tileCoord10];
        [self.bgLayer setTileGID:(tileGID10 + 10) at:tileCoord10];
        
        /////////////////////////////////////////////////////////
        
        self.sprite91 = [InteractiveSprite spriteWithSpriteFrameName:@"herospriteV04.png"];
        self.sprite91.spriteCode = 91;
        
        self.sprite91.orientation = 1;
        if (self.hero.sprite91_Orientation)
        {
            self.sprite91.orientation = self.hero.sprite91_Orientation;
        }
        if (self.sprite91.orientation == 1)
        {
            [self.sprite91 setDisplayFrame:[[spriteVWalkDown frames] objectAtIndex:0]];
        }
        else if (self.sprite91.orientation == 2)
        {
            [self.sprite91 setDisplayFrame:[[spriteVWalkUp frames] objectAtIndex:0]];
        }
        else if (self.sprite91.orientation == 3)
        {
            [self.sprite91 setDisplayFrame:[[spriteVWalkRight frames] objectAtIndex:0]];
        }
        else
        {
            [self.sprite91 setDisplayFrame:[[spriteVWalkLeft frames] objectAtIndex:0]];
        }
        
        //[self schedule:@selector(updateSprite91) interval:(1.75f)];
        
        
        if (self.hero.sprite91position.x != 0)
        {
            self.sprite91.position = self.hero.sprite91position;
        }
        else
        {
            NSMutableDictionary *sprite91start = [objects objectNamed:@"spriteStart91"];
            double x1 = [[sprite91start valueForKey:@"x"]floatValue];
            double y1 = [[sprite91start valueForKey:@"y"]floatValue];
            self.sprite91.position = ccp(x1,y1);
        }
        
        
        [self.theHKMap addChild:self.sprite91 z:self.bgLayer.zOrder];
        
        CGPoint tileCoord11 = [self tileCoordForPosition:self.sprite91.position];
        int tileGID11 = [self.bgLayer tileGIDAt:tileCoord11];
        [self.bgLayer removeTileAt:tileCoord11];
        [self.bgLayer setTileGID:(tileGID11 + 11) at:tileCoord11];
        

        /////////////////////////////////////////////////////////
        
        self.sprite92 = [InteractiveSprite spriteWithSpriteFrameName:@"herospriteM04.png"];
        self.sprite92.spriteCode = 92;
        
        self.sprite92.orientation = 1;
        if (self.hero.sprite92_Orientation)
        {
            self.sprite92.orientation = self.hero.sprite92_Orientation;
        }
        if (self.sprite92.orientation == 1)
        {
            [self.sprite92 setDisplayFrame:[[spriteMWalkDown frames] objectAtIndex:0]];
        }
        else if (self.sprite92.orientation == 2)
        {
            [self.sprite92 setDisplayFrame:[[spriteMWalkUp frames] objectAtIndex:0]];
        }
        else if (self.sprite92.orientation == 3)
        {
            [self.sprite92 setDisplayFrame:[[spriteMWalkRight frames] objectAtIndex:0]];
        }
        else
        {
            [self.sprite92 setDisplayFrame:[[spriteMWalkLeft frames] objectAtIndex:0]];
        }
        
        //[self schedule:@selector(updateSprite92) interval:(1.75f)];
        
        
        if (self.hero.sprite92position.x != 0)
        {
            self.sprite92.position = self.hero.sprite92position;
        }
        else
        {
            NSMutableDictionary *sprite92start = [objects objectNamed:@"spriteStart92"];
            double x1 = [[sprite92start valueForKey:@"x"]floatValue];
            double y1 = [[sprite92start valueForKey:@"y"]floatValue];
            self.sprite92.position = ccp(x1,y1);
        }
        
        
        [self.theHKMap addChild:self.sprite92 z:self.bgLayer.zOrder];
        
        CGPoint tileCoord12 = [self tileCoordForPosition:self.sprite92.position];
        int tileGID12 = [self.bgLayer tileGIDAt:tileCoord12];
        [self.bgLayer removeTileAt:tileCoord12];
        [self.bgLayer setTileGID:(tileGID12 + 12) at:tileCoord12];

        /////////////////////////////////////////////////////////
        
        self.sprite93 = [InteractiveSprite spriteWithSpriteFrameName:@"herospriteP04.png"];
        self.sprite93.spriteCode = 93;
        
        self.sprite93.orientation = 1;
        if (self.hero.sprite93_Orientation)
        {
            self.sprite93.orientation = self.hero.sprite93_Orientation;
        }
        if (self.sprite93.orientation == 1)
        {
            [self.sprite93 setDisplayFrame:[[spritePWalkDown frames] objectAtIndex:0]];
        }
        else if (self.sprite93.orientation == 2)
        {
            [self.sprite93 setDisplayFrame:[[spritePWalkUp frames] objectAtIndex:0]];
        }
        else if (self.sprite93.orientation == 3)
        {
            [self.sprite93 setDisplayFrame:[[spritePWalkRight frames] objectAtIndex:0]];
        }
        else
        {
            [self.sprite93 setDisplayFrame:[[spritePWalkLeft frames] objectAtIndex:0]];
        }
        
        //[self schedule:@selector(updateSprite93) interval:(1.0f)];
        
        
        if (self.hero.sprite93position.x != 0)
        {
            self.sprite93.position = self.hero.sprite93position;
        }
        else
        {
            NSMutableDictionary *sprite93start = [objects objectNamed:@"spriteStart93"];
            double x1 = [[sprite93start valueForKey:@"x"]floatValue];
            double y1 = [[sprite93start valueForKey:@"y"]floatValue];
            self.sprite93.position = ccp(x1,y1);
        }
        
        
        [self.theHKMap addChild:self.sprite93 z:self.bgLayer.zOrder];
        
        CGPoint tileCoord13 = [self tileCoordForPosition:self.sprite93.position];
        int tileGID13 = [self.bgLayer tileGIDAt:tileCoord13];
        [self.bgLayer removeTileAt:tileCoord13];
        [self.bgLayer setTileGID:(tileGID13 + 13) at:tileCoord13];

        /////////////////////////////////////////////////////////
        
        self.sprite94 = [InteractiveSprite spriteWithSpriteFrameName:@"herospriteS04.png"];
        self.sprite94.spriteCode = 94;
        
        self.sprite94.orientation = 1;
        if (self.hero.sprite94_Orientation)
        {
            self.sprite94.orientation = self.hero.sprite94_Orientation;
        }
        if (self.sprite94.orientation == 1)
        {
            [self.sprite94 setDisplayFrame:[[spriteSWalkDown frames] objectAtIndex:0]];
        }
        else if (self.sprite94.orientation == 2)
        {
            [self.sprite94 setDisplayFrame:[[spriteSWalkUp frames] objectAtIndex:0]];
        }
        else if (self.sprite94.orientation == 3)
        {
            [self.sprite94 setDisplayFrame:[[spriteSWalkRight frames] objectAtIndex:0]];
        }
        else
        {
            [self.sprite94 setDisplayFrame:[[spriteSWalkLeft frames] objectAtIndex:0]];
        }
        
        //[self schedule:@selector(updateSprite94) interval:(1.0f)];
        
        
        if (self.hero.sprite94position.x != 0)
        {
            self.sprite94.position = self.hero.sprite94position;
        }
        else
        {
            NSMutableDictionary *sprite94start = [objects objectNamed:@"spriteStart94"];
            double x1 = [[sprite94start valueForKey:@"x"]floatValue];
            double y1 = [[sprite94start valueForKey:@"y"]floatValue];
            self.sprite94.position = ccp(x1,y1);
        }
        
        
        [self.theHKMap addChild:self.sprite94 z:self.bgLayer.zOrder];
        
        CGPoint tileCoord14 = [self tileCoordForPosition:self.sprite94.position];
        int tileGID14 = [self.bgLayer tileGIDAt:tileCoord14];
        [self.bgLayer removeTileAt:tileCoord14];
        [self.bgLayer setTileGID:(tileGID14 + 14) at:tileCoord14];

        /////////////////////////////////////////////////////////
        
        self.sprite95 = [InteractiveSprite spriteWithSpriteFrameName:@"herospriteI04.png"];
        self.sprite95.spriteCode = 95;
        
        self.sprite95.orientation = 1;
        if (self.hero.sprite95_Orientation)
        {
            self.sprite95.orientation = self.hero.sprite95_Orientation;
        }
        if (self.sprite95.orientation == 1)
        {
            [self.sprite95 setDisplayFrame:[[spriteIWalkDown frames] objectAtIndex:0]];
        }
        else if (self.sprite95.orientation == 2)
        {
            [self.sprite95 setDisplayFrame:[[spriteIWalkUp frames] objectAtIndex:0]];
        }
        else if (self.sprite95.orientation == 3)
        {
            [self.sprite95 setDisplayFrame:[[spriteIWalkRight frames] objectAtIndex:0]];
        }
        else
        {
            [self.sprite95 setDisplayFrame:[[spriteIWalkLeft frames] objectAtIndex:0]];
        }
        
        //[self schedule:@selector(updateSprite95) interval:(1.125f)];
        
        
        if (self.hero.sprite95position.x != 0)
        {
            self.sprite95.position = self.hero.sprite95position;
        }
        else
        {
            NSMutableDictionary *sprite95start = [objects objectNamed:@"spriteStart95"];
            double x1 = [[sprite95start valueForKey:@"x"]floatValue];
            double y1 = [[sprite95start valueForKey:@"y"]floatValue];
            self.sprite95.position = ccp(x1,y1);
        }
        
        
        [self.theHKMap addChild:self.sprite95 z:self.bgLayer.zOrder];
        
        CGPoint tileCoord15 = [self tileCoordForPosition:self.sprite95.position];
        int tileGID15 = [self.bgLayer tileGIDAt:tileCoord15];
        [self.bgLayer removeTileAt:tileCoord15];
        [self.bgLayer setTileGID:(tileGID15 + 15) at:tileCoord15];

        /////////////////////////////////////////////////////////
        
        self.sprite96 = [InteractiveSprite spriteWithSpriteFrameName:@"herospriteC04.png"];
        self.sprite96.spriteCode = 96;
        
        self.sprite96.orientation = 1;
        if (self.hero.sprite96_Orientation)
        {
            self.sprite96.orientation = self.hero.sprite96_Orientation;
        }
        if (self.sprite96.orientation == 1)
        {
            [self.sprite96 setDisplayFrame:[[spriteCWalkDown frames] objectAtIndex:0]];
        }
        else if (self.sprite96.orientation == 2)
        {
            [self.sprite96 setDisplayFrame:[[spriteCWalkUp frames] objectAtIndex:0]];
        }
        else if (self.sprite96.orientation == 3)
        {
            [self.sprite96 setDisplayFrame:[[spriteCWalkRight frames] objectAtIndex:0]];
        }
        else
        {
            [self.sprite96 setDisplayFrame:[[spriteCWalkLeft frames] objectAtIndex:0]];
        }
        
        //[self schedule:@selector(updateSprite96) interval:(1.5f)];
        
        
        if (self.hero.sprite96position.x != 0)
        {
            self.sprite96.position = self.hero.sprite96position;
        }
        else
        {
            NSMutableDictionary *sprite96start = [objects objectNamed:@"spriteStart96"];
            double x1 = [[sprite96start valueForKey:@"x"]floatValue];
            double y1 = [[sprite96start valueForKey:@"y"]floatValue];
            self.sprite96.position = ccp(x1,y1);
        }
        
        
        [self.theHKMap addChild:self.sprite96 z:self.bgLayer.zOrder];
        
        CGPoint tileCoord16 = [self tileCoordForPosition:self.sprite96.position];
        int tileGID16 = [self.bgLayer tileGIDAt:tileCoord16];
        [self.bgLayer removeTileAt:tileCoord16];
        [self.bgLayer setTileGID:(tileGID16 + 16) at:tileCoord16];

        
        /////////////////////////////////////////////////////////
        
        self.sprite97 = [InteractiveSprite spriteWithSpriteFrameName:@"herospriteN04.png"];
        self.sprite97.spriteCode = 97;
        
        self.sprite97.orientation = 1;
        if (self.hero.sprite97_Orientation)
        {
            self.sprite97.orientation = self.hero.sprite97_Orientation;
        }
        if (self.sprite97.orientation == 1)
        {
            [self.sprite97 setDisplayFrame:[[spriteNWalkDown frames] objectAtIndex:0]];
        }
        else if (self.sprite97.orientation == 2)
        {
            [self.sprite97 setDisplayFrame:[[spriteNWalkUp frames] objectAtIndex:0]];
        }
        else if (self.sprite97.orientation == 3)
        {
            [self.sprite97 setDisplayFrame:[[spriteNWalkRight frames] objectAtIndex:0]];
        }
        else
        {
            [self.sprite97 setDisplayFrame:[[spriteNWalkLeft frames] objectAtIndex:0]];
        }
        
        //[self schedule:@selector(updateSprite97) interval:(1.875f)];
        
        
        if (self.hero.sprite97position.x != 0)
        {
            self.sprite97.position = self.hero.sprite97position;
        }
        else
        {
            NSMutableDictionary *sprite97start = [objects objectNamed:@"spriteStart97"];
            double x1 = [[sprite97start valueForKey:@"x"]floatValue];
            double y1 = [[sprite97start valueForKey:@"y"]floatValue];
            self.sprite97.position = ccp(x1,y1);
        }
        
        
        [self.theHKMap addChild:self.sprite97 z:self.bgLayer.zOrder];
        
        CGPoint tileCoord17 = [self tileCoordForPosition:self.sprite97.position];
        int tileGID17 = [self.bgLayer tileGIDAt:tileCoord17];
        [self.bgLayer removeTileAt:tileCoord17];
        [self.bgLayer setTileGID:(tileGID17 + 17) at:tileCoord17];
        
        /////////////////////////////////////////////////////////
        
        self.sprite98 = [InteractiveSprite spriteWithSpriteFrameName:@"herospriteZB04.png"];
        self.sprite98.spriteCode = 98;
        
        self.sprite98.orientation = 1;
        if (self.hero.sprite98_Orientation)
        {
            self.sprite98.orientation = self.hero.sprite98_Orientation;
        }
        if (self.sprite98.orientation == 1)
        {
            [self.sprite98 setDisplayFrame:[[spriteZBWalkDown frames] objectAtIndex:0]];
        }
        else if (self.sprite98.orientation == 2)
        {
            [self.sprite98 setDisplayFrame:[[spriteZBWalkUp frames] objectAtIndex:0]];
        }
        else if (self.sprite98.orientation == 3)
        {
            [self.sprite98 setDisplayFrame:[[spriteZBWalkRight frames] objectAtIndex:0]];
        }
        else
        {
            [self.sprite98 setDisplayFrame:[[spriteZBWalkLeft frames] objectAtIndex:0]];
        }
        
        //[self schedule:@selector(updateSprite98) interval:(1.875f)];
        
        
        if (self.hero.sprite98position.x != 0)
        {
            self.sprite98.position = self.hero.sprite98position;
        }
        else
        {
            NSMutableDictionary *sprite98start = [objects objectNamed:@"spriteStart98"];
            double x1 = [[sprite98start valueForKey:@"x"]floatValue];
            double y1 = [[sprite98start valueForKey:@"y"]floatValue];
            self.sprite98.position = ccp(x1,y1);
        }
        
        
        [self.theHKMap addChild:self.sprite98 z:self.bgLayer.zOrder];
        
        CGPoint tileCoord18 = [self tileCoordForPosition:self.sprite98.position];
        int tileGID18 = [self.bgLayer tileGIDAt:tileCoord18];
        [self.bgLayer removeTileAt:tileCoord18];
        [self.bgLayer setTileGID:(tileGID18 + 18) at:tileCoord18];
        /////////////////////////////////////////////////////////
        
        self.sprite99 = [InteractiveSprite spriteWithSpriteFrameName:@"herospriteW04.png"];
        self.sprite99.spriteCode = 99;
        
        self.sprite99.orientation = 1;
        if (self.hero.sprite99_Orientation)
        {
            self.sprite99.orientation = self.hero.sprite99_Orientation;
        }
        if (self.sprite99.orientation == 1)
        {
            [self.sprite99 setDisplayFrame:[[spriteWWalkDown frames] objectAtIndex:0]];
        }
        else if (self.sprite99.orientation == 2)
        {
            [self.sprite99 setDisplayFrame:[[spriteWWalkUp frames] objectAtIndex:0]];
        }
        else if (self.sprite99.orientation == 3)
        {
            [self.sprite99 setDisplayFrame:[[spriteWWalkRight frames] objectAtIndex:0]];
        }
        else
        {
            [self.sprite99 setDisplayFrame:[[spriteWWalkLeft frames] objectAtIndex:0]];
        }
        
        //[self schedule:@selector(updateSprite99) interval:(1.5f)];
        
        
        if (self.hero.sprite99position.x != 0)
        {
            self.sprite99.position = self.hero.sprite99position;
        }
        else
        {
            NSMutableDictionary *sprite99start = [objects objectNamed:@"spriteStart99"];
            double x1 = [[sprite99start valueForKey:@"x"]floatValue];
            double y1 = [[sprite99start valueForKey:@"y"]floatValue];
            self.sprite99.position = ccp(x1,y1);
        }
        
        
        [self.theHKMap addChild:self.sprite99 z:self.bgLayer.zOrder];
        
        CGPoint tileCoord19 = [self tileCoordForPosition:self.sprite99.position];
        int tileGID19 = [self.bgLayer tileGIDAt:tileCoord19];
        [self.bgLayer removeTileAt:tileCoord19];
        [self.bgLayer setTileGID:(tileGID19 + 19) at:tileCoord19];
        /////////////////////////////////////////////////////////
        
        self.sprite100 = [InteractiveSprite spriteWithSpriteFrameName:@"herospriteY04.png"];
        self.sprite100.spriteCode = 100;
        
        self.sprite100.orientation = 1;
        if (self.hero.sprite100_Orientation)
        {
            self.sprite100.orientation = self.hero.sprite100_Orientation;
        }
        if (self.sprite100.orientation == 1)
        {
            [self.sprite100 setDisplayFrame:[[spriteYWalkDown frames] objectAtIndex:0]];
        }
        else if (self.sprite100.orientation == 2)
        {
            [self.sprite100 setDisplayFrame:[[spriteYWalkUp frames] objectAtIndex:0]];
        }
        else if (self.sprite100.orientation == 3)
        {
            [self.sprite100 setDisplayFrame:[[spriteYWalkRight frames] objectAtIndex:0]];
        }
        else
        {
            [self.sprite100 setDisplayFrame:[[spriteYWalkLeft frames] objectAtIndex:0]];
        }
        
        //[self schedule:@selector(updateSprite100) interval:(1.375f)];
        
        
        if (self.hero.sprite100position.x != 0)
        {
            self.sprite100.position = self.hero.sprite100position;
        }
        else
        {
            NSMutableDictionary *sprite100start = [objects objectNamed:@"spriteStart100"];
            double x1 = [[sprite100start valueForKey:@"x"]floatValue];
            double y1 = [[sprite100start valueForKey:@"y"]floatValue];
            self.sprite100.position = ccp(x1,y1);
        }
        
        
        [self.theHKMap addChild:self.sprite100 z:self.bgLayer.zOrder];
        
        CGPoint tileCoord20 = [self tileCoordForPosition:self.sprite100.position];
        int tileGID20 = [self.bgLayer tileGIDAt:tileCoord20];
        [self.bgLayer removeTileAt:tileCoord20];
        [self.bgLayer setTileGID:(tileGID20 + 20) at:tileCoord20];
        
        /////////////////////////////////////////////////////////
        
        self.sprite101 = [InteractiveSprite spriteWithSpriteFrameName:@"herospriteY04.png"];
        self.sprite101.spriteCode = 101;
        
        self.sprite101.orientation = 1;
        if (self.hero.sprite101_Orientation)
        {
            self.sprite101.orientation = self.hero.sprite101_Orientation;
        }
        if (self.sprite101.orientation == 1)
        {
            [self.sprite101 setDisplayFrame:[[spriteYWalkDown frames] objectAtIndex:0]];
        }
        else if (self.sprite101.orientation == 2)
        {
            [self.sprite101 setDisplayFrame:[[spriteYWalkUp frames] objectAtIndex:0]];
        }
        else if (self.sprite101.orientation == 3)
        {
            [self.sprite101 setDisplayFrame:[[spriteYWalkRight frames] objectAtIndex:0]];
        }
        else
        {
            [self.sprite101 setDisplayFrame:[[spriteYWalkLeft frames] objectAtIndex:0]];
        }
        
        //[self schedule:@selector(updateSprite101) interval:(1.75f)];
        
        
        if (self.hero.sprite101position.x != 0)
        {
            self.sprite101.position = self.hero.sprite101position;
        }
        else
        {
            NSMutableDictionary *sprite101start = [objects objectNamed:@"spriteStart101"];
            double x1 = [[sprite101start valueForKey:@"x"]floatValue];
            double y1 = [[sprite101start valueForKey:@"y"]floatValue];
            self.sprite101.position = ccp(x1,y1);
        }
        
        
        [self.theHKMap addChild:self.sprite101 z:self.bgLayer.zOrder];
        
        CGPoint tileCoord21 = [self tileCoordForPosition:self.sprite101.position];
        int tileGID21 = [self.bgLayer tileGIDAt:tileCoord21];
        [self.bgLayer removeTileAt:tileCoord21];
        [self.bgLayer setTileGID:(tileGID21 + 21) at:tileCoord21];
        /////////////////////////////////////////////////////////
        
        self.sprite102 = [InteractiveSprite spriteWithSpriteFrameName:@"herospriteZA04.png"];
        self.sprite102.spriteCode = 102;
        
        self.sprite102.orientation = 1;
        if (self.hero.sprite102_Orientation)
        {
            self.sprite102.orientation = self.hero.sprite102_Orientation;
        }
        if (self.sprite102.orientation == 1)
        {
            [self.sprite102 setDisplayFrame:[[spriteZAWalkDown frames] objectAtIndex:0]];
        }
        else if (self.sprite102.orientation == 2)
        {
            [self.sprite102 setDisplayFrame:[[spriteZAWalkUp frames] objectAtIndex:0]];
        }
        else if (self.sprite102.orientation == 3)
        {
            [self.sprite102 setDisplayFrame:[[spriteZAWalkRight frames] objectAtIndex:0]];
        }
        else
        {
            [self.sprite102 setDisplayFrame:[[spriteZAWalkLeft frames] objectAtIndex:0]];
        }
        
        //[self schedule:@selector(updateSprite102) interval:(1.5f)];
        
        
        if (self.hero.sprite102position.x != 0)
        {
            self.sprite102.position = self.hero.sprite102position;
        }
        else
        {
            NSMutableDictionary *sprite102start = [objects objectNamed:@"spriteStart102"];
            double x1 = [[sprite102start valueForKey:@"x"]floatValue];
            double y1 = [[sprite102start valueForKey:@"y"]floatValue];
            self.sprite102.position = ccp(x1,y1);
        }
        
        
        [self.theHKMap addChild:self.sprite102 z:self.bgLayer.zOrder];
        
        CGPoint tileCoord22 = [self tileCoordForPosition:self.sprite102.position];
        int tileGID22 = [self.bgLayer tileGIDAt:tileCoord22];
        [self.bgLayer removeTileAt:tileCoord22];
        [self.bgLayer setTileGID:(tileGID22 + 22) at:tileCoord22];
        /////////////////////////////////////////////////////////
        
        self.sprite103 = [InteractiveSprite spriteWithSpriteFrameName:@"herospriteT04.png"];
        self.sprite103.spriteCode = 103;
        
        self.sprite103.orientation = 1;
        if (self.hero.sprite103_Orientation)
        {
            self.sprite103.orientation = self.hero.sprite103_Orientation;
        }
        if (self.sprite103.orientation == 1)
        {
            [self.sprite103 setDisplayFrame:[[spriteTWalkDown frames] objectAtIndex:0]];
        }
        else if (self.sprite103.orientation == 2)
        {
            [self.sprite103 setDisplayFrame:[[spriteTWalkUp frames] objectAtIndex:0]];
        }
        else if (self.sprite103.orientation == 3)
        {
            [self.sprite103 setDisplayFrame:[[spriteTWalkRight frames] objectAtIndex:0]];
        }
        else
        {
            [self.sprite103 setDisplayFrame:[[spriteTWalkLeft frames] objectAtIndex:0]];
        }
        
        //[self schedule:@selector(updateSprite103) interval:(1.5f)];
        
        
        if (self.hero.sprite103position.x != 0)
        {
            self.sprite103.position = self.hero.sprite103position;
        }
        else
        {
            NSMutableDictionary *sprite103start = [objects objectNamed:@"spriteStart103"];
            double x1 = [[sprite103start valueForKey:@"x"]floatValue];
            double y1 = [[sprite103start valueForKey:@"y"]floatValue];
            self.sprite103.position = ccp(x1,y1);
        }
        
        
        [self.theHKMap addChild:self.sprite103 z:self.bgLayer.zOrder];
        
        CGPoint tileCoord23 = [self tileCoordForPosition:self.sprite103.position];
        int tileGID23 = [self.bgLayer tileGIDAt:tileCoord23];
        [self.bgLayer removeTileAt:tileCoord23];
        [self.bgLayer setTileGID:(tileGID23 + 23) at:tileCoord23];
        /////////////////////////////////////////////////////////
        
        self.sprite104 = [InteractiveSprite spriteWithSpriteFrameName:@"herospriteZ04.png"];
        self.sprite104.spriteCode = 104;
        
        self.sprite104.orientation = 1;
        if (self.hero.sprite104_Orientation)
        {
            self.sprite104.orientation = self.hero.sprite104_Orientation;
        }
        if (self.sprite104.orientation == 1)
        {
            [self.sprite104 setDisplayFrame:[[spriteZWalkDown frames] objectAtIndex:0]];
        }
        else if (self.sprite104.orientation == 2)
        {
            [self.sprite104 setDisplayFrame:[[spriteZWalkUp frames] objectAtIndex:0]];
        }
        else if (self.sprite104.orientation == 3)
        {
            [self.sprite104 setDisplayFrame:[[spriteZWalkRight frames] objectAtIndex:0]];
        }
        else
        {
            [self.sprite104 setDisplayFrame:[[spriteZWalkLeft frames] objectAtIndex:0]];
        }
        
        //[self schedule:@selector(updateSprite104) interval:(1.625f)];
        
        
        if (self.hero.sprite104position.x != 0)
        {
            self.sprite104.position = self.hero.sprite104position;
        }
        else
        {
            NSMutableDictionary *sprite104start = [objects objectNamed:@"spriteStart104"];
            double x1 = [[sprite104start valueForKey:@"x"]floatValue];
            double y1 = [[sprite104start valueForKey:@"y"]floatValue];
            self.sprite104.position = ccp(x1,y1);
        }
        
        
        [self.theHKMap addChild:self.sprite104 z:self.bgLayer.zOrder];
        
        CGPoint tileCoord24 = [self tileCoordForPosition:self.sprite104.position];
        int tileGID24 = [self.bgLayer tileGIDAt:tileCoord24];
        [self.bgLayer removeTileAt:tileCoord24];
        [self.bgLayer setTileGID:(tileGID24 + 24) at:tileCoord24];
        

        //
        //items
        //
        
        if (!self.hero.gotItem13)
        {
            self.item13 = [CCSprite spriteWithFile:@"treasurechestSprite01.png"];
            NSMutableDictionary *item = [objects objectNamed:@"item13"];
            double x1 = [[item valueForKey:@"x"]floatValue];
            double y1 = [[item valueForKey:@"y"]floatValue];
            self.item13.position = ccp(x1,y1);
            [self.theHKMap addChild:self.item13 z:self.bgLayer.zOrder];
        }
        else
        {
            self.item13 = [CCSprite spriteWithFile:@"treasurechestSprite02.png"];
            NSMutableDictionary *item = [objects objectNamed:@"item13"];
            double x1 = [[item valueForKey:@"x"]floatValue];
            double y1 = [[item valueForKey:@"y"]floatValue];
            self.item13.position = ccp(x1,y1);
            [self.theHKMap addChild:self.item13 z:self.bgLayer.zOrder];
        }
        if (!self.hero.gotItem15)
        {
            self.item15 = [CCSprite spriteWithFile:@"treasurechestSprite01.png"];
            NSMutableDictionary *item = [objects objectNamed:@"item15"];
            double x1 = [[item valueForKey:@"x"]floatValue];
            double y1 = [[item valueForKey:@"y"]floatValue];
            self.item15.position = ccp(x1,y1);
            [self.theHKMap addChild:self.item15 z:self.bgLayer.zOrder];
        }
        else
        {
            self.item15 = [CCSprite spriteWithFile:@"treasurechestSprite02.png"];
            NSMutableDictionary *item = [objects objectNamed:@"item15"];
            double x1 = [[item valueForKey:@"x"]floatValue];
            double y1 = [[item valueForKey:@"y"]floatValue];
            self.item15.position = ccp(x1,y1);
            [self.theHKMap addChild:self.item15 z:self.bgLayer.zOrder];
        }
        if (!self.hero.gotItem16)
        {
            self.item16 = [CCSprite spriteWithFile:@"treasurechestSprite01.png"];
            NSMutableDictionary *item = [objects objectNamed:@"item16"];
            double x1 = [[item valueForKey:@"x"]floatValue];
            double y1 = [[item valueForKey:@"y"]floatValue];
            self.item16.position = ccp(x1,y1);
            [self.theHKMap addChild:self.item16 z:self.bgLayer.zOrder];
        }
        else
        {
            self.item16 = [CCSprite spriteWithFile:@"treasurechestSprite02.png"];
            NSMutableDictionary *item = [objects objectNamed:@"item16"];
            double x1 = [[item valueForKey:@"x"]floatValue];
            double y1 = [[item valueForKey:@"y"]floatValue];
            self.item16.position = ccp(x1,y1);
            [self.theHKMap addChild:self.item16 z:self.bgLayer.zOrder];
        }
        if (!self.hero.gotItem14)
        {
            self.item14 = [CCSprite spriteWithFile:@"goldpilesprite01.png"];
            NSMutableDictionary *item = [objects objectNamed:@"item14"];
            double x1 = [[item valueForKey:@"x"]floatValue];
            double y1 = [[item valueForKey:@"y"]floatValue];
            self.item14.position = ccp(x1,y1);
            [self.theHKMap addChild:self.item14 z:self.bgLayer.zOrder];
        }
        
        
        //swarm
        
        if (!self.hero.killedBugs)
        {
            [[CCSpriteFrameCache sharedSpriteFrameCache] addSpriteFramesWithFile:@"swarmsheet1.plist"];
            CCSpriteBatchNode *swarmSheet = [CCSpriteBatchNode batchNodeWithFile:@"swarmsheet1.png"];
            [swarmSheet retain];
            [self.theHKMap addChild:swarmSheet];
            
            NSMutableArray *swarmAnimation = [NSMutableArray array];
            
            [swarmAnimation addObject:[[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:@"swarmsprite01.png"]];
            [swarmAnimation addObject:[[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:@"swarmsprite02.png"]];
            [swarmAnimation addObject:[[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:@"swarmsprite03.png"]];
            [swarmAnimation addObject:[[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:@"swarmsprite04.png"]];
            [swarmAnimation addObject:[[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:@"swarmsprite03.png"]];
            [swarmAnimation addObject:[[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:@"swarmsprite02.png"]];
            CCAnimation *animateBeacon = [CCAnimation animationWithFrames:swarmAnimation delay:0.1f];
            
            swarm = [CCSprite spriteWithSpriteFrameName:@"swarmsprite01.png"];
            NSMutableDictionary *swarmpos = [objects objectNamed:@"swarm"];
            double x = [[swarmpos valueForKey:@"x"]floatValue];
            double y = [[swarmpos valueForKey:@"y"]floatValue];
            swarm.position = ccp(x,y);
            CCAction *action = [CCRepeatForever actionWithAction:[CCAnimate actionWithAnimation:animateBeacon restoreOriginalFrame:NO]];
            [swarm runAction:action];
            [self.theHKMap addChild:swarm z:INT_MAX];
        }
        
        
        double x;
        double y;
        
        prev = self.hero.musicCode;
        
        int randWeather = arc4random()%10;
        bool willRain = self.hero.isRainingPL4;
        
        
        //1(coming from login),2(gate/cave/stairs/dungeon), 3(teleport), 4(herodied - pl1), 5(start new game), 6(beat ionak - go pl1),7(item shop/menu),8(battle win/flee)
        if (self.hero.mapInitMode == 1)
        {
            prev = 0;
            
            self.spriteOrientation = 1;
            
            x = self.hero.position.x;
            y = self.hero.position.y;
            
            willRain = (randWeather <= 3);
        }
        else if (self.hero.mapInitMode == 2)
        {
            prev = 0;
            if (self.hero.currentMap == 1)
            {
                NSMutableDictionary *startPoint = [objects objectNamed:@"startPoint1"];
                x = [[startPoint valueForKey:@"x"]floatValue];
                y = [[startPoint valueForKey:@"y"]floatValue];
                self.hero.musicCode = 2;
            }
            else if (self.hero.currentMap == 5)
            {
                NSMutableDictionary *startPoint = [objects objectNamed:@"startPoint3"];
                x = [[startPoint valueForKey:@"x"]floatValue];
                y = [[startPoint valueForKey:@"y"]floatValue];
                self.hero.musicCode = 2;
            }
            else if (self.hero.currentMap == 8)
            {
                NSMutableDictionary *startPoint = [objects objectNamed:@"startPoint4"];
                x = [[startPoint valueForKey:@"x"]floatValue];
                y = [[startPoint valueForKey:@"y"]floatValue];
                self.hero.musicCode = 2;
            }
            else if (self.hero.currentMap == 11)
            {
                NSMutableDictionary *startPoint = [objects objectNamed:@"startPoint5"];
                x = [[startPoint valueForKey:@"x"]floatValue];
                y = [[startPoint valueForKey:@"y"]floatValue];
                self.hero.heroOrientation = 1;
                self.hero.musicCode = 3;
            }
            else if (self.hero.currentMap == 20)
            {
                NSMutableDictionary *startPoint = [objects objectNamed:@"startPoint6"];
                x = [[startPoint valueForKey:@"x"]floatValue];
                y = [[startPoint valueForKey:@"y"]floatValue];
                self.hero.heroOrientation = 1;
                self.hero.musicCode = 2;
            }
            else
            {
                NSLog(@"Error2");
                NSMutableDictionary *startPoint = [objects objectNamed:@"startPoint1"];
                x = [[startPoint valueForKey:@"x"]floatValue];
                y = [[startPoint valueForKey:@"y"]floatValue];
            }
            
            self.spriteOrientation = self.hero.heroOrientation;
            
            willRain = (randWeather <= 3);
        }
        else if (self.hero.mapInitMode == 3)
        {
            prev = 0;
            self.hero.musicCode = 4;
            
            self.spriteOrientation = 1;
            
            NSMutableDictionary *startPoint = [objects objectNamed:@"startPoint2"];
            x = [[startPoint valueForKey:@"x"]floatValue];
            y = [[startPoint valueForKey:@"y"]floatValue];
            
            willRain = (randWeather <= 3);
        }
        else if (self.hero.mapInitMode == 4)
        {
            NSLog(@"Error4");
        }
        else if (self.hero.mapInitMode == 5)
        {
            /*
            /////////////
            //DELETE
            NSMutableDictionary *startPoint = [objects objectNamed:@"startPoint6"];
            x = [[startPoint valueForKey:@"x"]floatValue];
            y = [[startPoint valueForKey:@"y"]floatValue];
            self.hero.heroOrientation = 1;
            self.hero.musicCode = 2;
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
        self.hero.currentMap = 4;
        
        spriteCycleCount = 0;
        [self schedule:@selector(spriteCycle) interval:0.125];
        
        self.hero.isRainingPL4 = willRain;
        if (willRain)
        {
            [self performSelector:@selector(startRain) withObject:nil afterDelay:0.125];
        }
    }
    return self;
}

-(void)startRain
{
    [self.myHUD startRain];
}


-(void) updateSprite81
{
    CGSize screenSize = [[CCDirector sharedDirector] winSize];
    int x = self.hero.position.x;
    int y = self.hero.position.y;
    
    int p = self.sprite81.position.x;
    int q = self.sprite81.position.y;
    
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
        [self moveleftSprite81];
    }
    if (rand == 2)
    {
        [self moverightSprite81];
    }
    if (rand == 3)
    {
        [self moveupSprite81];
    }
    if (rand == 4)
    {
        [self movedownSprite81];
    }
    return;
}

-(void) moveleftSprite81
{
    CGPoint sprite81Pos = self.sprite81.position;
    self.sprite81.orientation = 4;
    sprite81Pos.x -= theHKMap.tileSize.width;
    
    CGPoint tileCoord = [self tileCoordForPosition:sprite81Pos];
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
                    CGPoint tileCoord1 = [self tileCoordForPosition:self.sprite81.position];
                    int tileGID1 = [self.bgLayer tileGIDAt:tileCoord1];
                    [self.bgLayer removeTileAt:tileCoord1];
                    [self.bgLayer setTileGID:(tileGID1 - 1) at:tileCoord1];
                    
                    id actionMove = [CCMoveTo actionWithDuration:0.3 position:sprite81Pos];
                    id actionMove2 = [CCAnimate actionWithAnimation:spriteAWalkLeft restoreOriginalFrame:NO];
                    
                    id actionMoveDone = [CCCallFuncN actionWithTarget:self selector:@selector(finishActionSprite81)];
                    
                    [self.sprite81 runAction:[CCSpawn actionOne:[CCSequence actions:actionMove,actionMoveDone,nil] two:actionMove2]];
                    return;
                }
            }
        }
    }
    [self finishActionSprite81];
}
-(void) moverightSprite81
{
    CGPoint sprite81Pos = self.sprite81.position;
    self.sprite81.orientation = 3;
    sprite81Pos.x += theHKMap.tileSize.width;
    
    CGPoint tileCoord = [self tileCoordForPosition:sprite81Pos];
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
                    CGPoint tileCoord1 = [self tileCoordForPosition:self.sprite81.position];
                    int tileGID1 = [self.bgLayer tileGIDAt:tileCoord1];
                    [self.bgLayer removeTileAt:tileCoord1];
                    [self.bgLayer setTileGID:(tileGID1 - 1) at:tileCoord1];
                    
                    id actionMove = [CCMoveTo actionWithDuration:0.3 position:sprite81Pos];
                    id actionMove2 = [CCAnimate actionWithAnimation:spriteAWalkRight restoreOriginalFrame:NO];
                    
                    id actionMoveDone = [CCCallFuncN actionWithTarget:self selector:@selector(finishActionSprite81)];
                    
                    [self.sprite81 runAction:[CCSpawn actionOne:[CCSequence actions:actionMove,actionMoveDone,nil] two:actionMove2]];
                    return;
                }
            }
        }
    }
    [self finishActionSprite81];
}
-(void) moveupSprite81
{
    CGPoint sprite81Pos = self.sprite81.position;
    self.sprite81.orientation = 2;
    sprite81Pos.y += theHKMap.tileSize.height;
    
    CGPoint tileCoord = [self tileCoordForPosition:sprite81Pos];
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
                    CGPoint tileCoord1 = [self tileCoordForPosition:self.sprite81.position];
                    int tileGID1 = [self.bgLayer tileGIDAt:tileCoord1];
                    [self.bgLayer removeTileAt:tileCoord1];
                    [self.bgLayer setTileGID:(tileGID1 - 1) at:tileCoord1];
                    
                    id actionMove = [CCMoveTo actionWithDuration:0.3 position:sprite81Pos];
                    id actionMove2 = [CCAnimate actionWithAnimation:spriteAWalkUp restoreOriginalFrame:NO];
                    
                    id actionMoveDone = [CCCallFuncN actionWithTarget:self selector:@selector(finishActionSprite81)];
                    
                    [self.sprite81 runAction:[CCSpawn actionOne:[CCSequence actions:actionMove,actionMoveDone,nil] two:actionMove2]];
                    return;
                }
            }
        }
    }
    [self finishActionSprite81];
}
-(void) movedownSprite81
{
    CGPoint sprite81Pos = self.sprite81.position;
    self.sprite81.orientation = 1;
    sprite81Pos.y -= theHKMap.tileSize.width;
    
    CGPoint tileCoord = [self tileCoordForPosition:sprite81Pos];
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
                    CGPoint tileCoord1 = [self tileCoordForPosition:self.sprite81.position];
                    int tileGID1 = [self.bgLayer tileGIDAt:tileCoord1];
                    [self.bgLayer removeTileAt:tileCoord1];
                    [self.bgLayer setTileGID:(tileGID1 - 1) at:tileCoord1];
                    
                    id actionMove = [CCMoveTo actionWithDuration:0.3 position:sprite81Pos];
                    id actionMove2 = [CCAnimate actionWithAnimation:spriteAWalkDown restoreOriginalFrame:NO];
                    
                    id actionMoveDone = [CCCallFuncN actionWithTarget:self selector:@selector(finishActionSprite81)];
                    
                    [self.sprite81 runAction:[CCSpawn actionOne:[CCSequence actions:actionMove,actionMoveDone,nil] two:actionMove2]];
                    return;
                }
            }
        }
    }
    [self finishActionSprite81];
}
-(void) finishActionSprite81
{
    if (self.sprite81.orientation == 1)
    {
        [self.sprite81 setDisplayFrame:[[spriteAWalkDown frames] objectAtIndex:0]];
    }
    else if (self.sprite81.orientation == 2)
    {
        [self.sprite81 setDisplayFrame:[[spriteAWalkUp frames] objectAtIndex:0]];
    }
    else if (self.sprite81.orientation == 3)
    {
        [self.sprite81 setDisplayFrame:[[spriteAWalkRight frames] objectAtIndex:0]];
    }
    else
    {
        [self.sprite81 setDisplayFrame:[[spriteAWalkLeft frames] objectAtIndex:0]];
    }
    self.hero.sprite81position = self.sprite81.position;
}

-(void) updateSprite82
{
    CGSize screenSize = [[CCDirector sharedDirector] winSize];
    int x = self.hero.position.x;
    int y = self.hero.position.y;
    
    int p = self.sprite82.position.x;
    int q = self.sprite82.position.y;
    
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
        [self moveleftSprite82];
    }
    if (rand == 2)
    {
        [self moverightSprite82];
    }
    if (rand == 3)
    {
        [self moveupSprite82];
    }
    if (rand == 4)
    {
        [self movedownSprite82];
    }
    return;
}

-(void) moveleftSprite82
{
    CGPoint sprite82Pos = self.sprite82.position;
    self.sprite82.orientation = 4;
    sprite82Pos.x -= theHKMap.tileSize.width;
    
    CGPoint tileCoord = [self tileCoordForPosition:sprite82Pos];
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
                    CGPoint tileCoord1 = [self tileCoordForPosition:self.sprite82.position];
                    int tileGID1 = [self.bgLayer tileGIDAt:tileCoord1];
                    [self.bgLayer removeTileAt:tileCoord1];
                    [self.bgLayer setTileGID:(tileGID1 - 2) at:tileCoord1];
                    
                    id actionMove = [CCMoveTo actionWithDuration:0.3 position:sprite82Pos];
                    id actionMove2 = [CCAnimate actionWithAnimation:spriteAWalkLeft restoreOriginalFrame:NO];
                    
                    id actionMoveDone = [CCCallFuncN actionWithTarget:self selector:@selector(finishActionSprite82)];
                    
                    [self.sprite82 runAction:[CCSpawn actionOne:[CCSequence actions:actionMove,actionMoveDone,nil] two:actionMove2]];
                    return;
                }
            }
        }
    }
    [self finishActionSprite82];
}
-(void) moverightSprite82
{
    CGPoint sprite82Pos = self.sprite82.position;
    self.sprite82.orientation = 3;
    sprite82Pos.x += theHKMap.tileSize.width;
    
    CGPoint tileCoord = [self tileCoordForPosition:sprite82Pos];
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
                    CGPoint tileCoord1 = [self tileCoordForPosition:self.sprite82.position];
                    int tileGID1 = [self.bgLayer tileGIDAt:tileCoord1];
                    [self.bgLayer removeTileAt:tileCoord1];
                    [self.bgLayer setTileGID:(tileGID1 - 2) at:tileCoord1];
                    
                    id actionMove = [CCMoveTo actionWithDuration:0.3 position:sprite82Pos];
                    id actionMove2 = [CCAnimate actionWithAnimation:spriteAWalkRight restoreOriginalFrame:NO];
                    
                    id actionMoveDone = [CCCallFuncN actionWithTarget:self selector:@selector(finishActionSprite82)];
                    
                    [self.sprite82 runAction:[CCSpawn actionOne:[CCSequence actions:actionMove,actionMoveDone,nil] two:actionMove2]];
                    return;
                }
            }
        }
    }
    [self finishActionSprite82];
}
-(void) moveupSprite82
{
    CGPoint sprite82Pos = self.sprite82.position;
    self.sprite82.orientation = 2;
    sprite82Pos.y += theHKMap.tileSize.height;
    
    CGPoint tileCoord = [self tileCoordForPosition:sprite82Pos];
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
                    CGPoint tileCoord1 = [self tileCoordForPosition:self.sprite82.position];
                    int tileGID1 = [self.bgLayer tileGIDAt:tileCoord1];
                    [self.bgLayer removeTileAt:tileCoord1];
                    [self.bgLayer setTileGID:(tileGID1 - 2) at:tileCoord1];
                    
                    id actionMove = [CCMoveTo actionWithDuration:0.3 position:sprite82Pos];
                    id actionMove2 = [CCAnimate actionWithAnimation:spriteAWalkUp restoreOriginalFrame:NO];
                    
                    id actionMoveDone = [CCCallFuncN actionWithTarget:self selector:@selector(finishActionSprite82)];
                    
                    [self.sprite82 runAction:[CCSpawn actionOne:[CCSequence actions:actionMove,actionMoveDone,nil] two:actionMove2]];
                    return;
                }
            }
        }
    }
    [self finishActionSprite82];
}
-(void) movedownSprite82
{
    CGPoint sprite82Pos = self.sprite82.position;
    self.sprite82.orientation = 1;
    sprite82Pos.y -= theHKMap.tileSize.width;
    
    CGPoint tileCoord = [self tileCoordForPosition:sprite82Pos];
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
                    CGPoint tileCoord1 = [self tileCoordForPosition:self.sprite82.position];
                    int tileGID1 = [self.bgLayer tileGIDAt:tileCoord1];
                    [self.bgLayer removeTileAt:tileCoord1];
                    [self.bgLayer setTileGID:(tileGID1 - 2) at:tileCoord1];
                    
                    id actionMove = [CCMoveTo actionWithDuration:0.3 position:sprite82Pos];
                    id actionMove2 = [CCAnimate actionWithAnimation:spriteAWalkDown restoreOriginalFrame:NO];
                    
                    id actionMoveDone = [CCCallFuncN actionWithTarget:self selector:@selector(finishActionSprite82)];
                    
                    [self.sprite82 runAction:[CCSpawn actionOne:[CCSequence actions:actionMove,actionMoveDone,nil] two:actionMove2]];
                    return;
                }
            }
        }
    }
    [self finishActionSprite82];
}
-(void) finishActionSprite82
{
    if (self.sprite82.orientation == 1)
    {
        [self.sprite82 setDisplayFrame:[[spriteAWalkDown frames] objectAtIndex:0]];
    }
    else if (self.sprite82.orientation == 2)
    {
        [self.sprite82 setDisplayFrame:[[spriteAWalkUp frames] objectAtIndex:0]];
    }
    else if (self.sprite82.orientation == 3)
    {
        [self.sprite82 setDisplayFrame:[[spriteAWalkRight frames] objectAtIndex:0]];
    }
    else
    {
        [self.sprite82 setDisplayFrame:[[spriteAWalkLeft frames] objectAtIndex:0]];
    }
    self.hero.sprite82position = self.sprite82.position;
}

-(void) updateSprite83
{
    CGSize screenSize = [[CCDirector sharedDirector] winSize];
    int x = self.hero.position.x;
    int y = self.hero.position.y;
    
    int p = self.sprite83.position.x;
    int q = self.sprite83.position.y;
    
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
        [self moveleftSprite83];
    }
    if (rand == 2)
    {
        [self moverightSprite83];
    }
    if (rand == 3)
    {
        [self moveupSprite83];
    }
    if (rand == 4)
    {
        [self movedownSprite83];
    }
    return;
}

-(void) moveleftSprite83
{
    CGPoint sprite83Pos = self.sprite83.position;
    self.sprite83.orientation = 4;
    sprite83Pos.x -= theHKMap.tileSize.width;
    
    CGPoint tileCoord = [self tileCoordForPosition:sprite83Pos];
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
                    CGPoint tileCoord1 = [self tileCoordForPosition:self.sprite83.position];
                    int tileGID1 = [self.bgLayer tileGIDAt:tileCoord1];
                    [self.bgLayer removeTileAt:tileCoord1];
                    [self.bgLayer setTileGID:(tileGID1 - 3) at:tileCoord1];
                    
                    id actionMove = [CCMoveTo actionWithDuration:0.3 position:sprite83Pos];
                    id actionMove2 = [CCAnimate actionWithAnimation:spriteGWalkLeft restoreOriginalFrame:NO];
                    
                    id actionMoveDone = [CCCallFuncN actionWithTarget:self selector:@selector(finishActionSprite83)];
                    
                    [self.sprite83 runAction:[CCSpawn actionOne:[CCSequence actions:actionMove,actionMoveDone,nil] two:actionMove2]];
                    return;
                }
            }
        }
    }
    [self finishActionSprite83];
}
-(void) moverightSprite83
{
    CGPoint sprite83Pos = self.sprite83.position;
    self.sprite83.orientation = 3;
    sprite83Pos.x += theHKMap.tileSize.width;
    
    CGPoint tileCoord = [self tileCoordForPosition:sprite83Pos];
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
                    CGPoint tileCoord1 = [self tileCoordForPosition:self.sprite83.position];
                    int tileGID1 = [self.bgLayer tileGIDAt:tileCoord1];
                    [self.bgLayer removeTileAt:tileCoord1];
                    [self.bgLayer setTileGID:(tileGID1 - 3) at:tileCoord1];
                    
                    id actionMove = [CCMoveTo actionWithDuration:0.3 position:sprite83Pos];
                    id actionMove2 = [CCAnimate actionWithAnimation:spriteGWalkRight restoreOriginalFrame:NO];
                    
                    id actionMoveDone = [CCCallFuncN actionWithTarget:self selector:@selector(finishActionSprite83)];
                    
                    [self.sprite83 runAction:[CCSpawn actionOne:[CCSequence actions:actionMove,actionMoveDone,nil] two:actionMove2]];
                    return;
                }
            }
        }
    }
    [self finishActionSprite83];
}
-(void) moveupSprite83
{
    CGPoint sprite83Pos = self.sprite83.position;
    self.sprite83.orientation = 2;
    sprite83Pos.y += theHKMap.tileSize.height;
    
    CGPoint tileCoord = [self tileCoordForPosition:sprite83Pos];
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
                    CGPoint tileCoord1 = [self tileCoordForPosition:self.sprite83.position];
                    int tileGID1 = [self.bgLayer tileGIDAt:tileCoord1];
                    [self.bgLayer removeTileAt:tileCoord1];
                    [self.bgLayer setTileGID:(tileGID1 - 3) at:tileCoord1];
                    
                    id actionMove = [CCMoveTo actionWithDuration:0.3 position:sprite83Pos];
                    id actionMove2 = [CCAnimate actionWithAnimation:spriteGWalkUp restoreOriginalFrame:NO];
                    
                    id actionMoveDone = [CCCallFuncN actionWithTarget:self selector:@selector(finishActionSprite83)];
                    
                    [self.sprite83 runAction:[CCSpawn actionOne:[CCSequence actions:actionMove,actionMoveDone,nil] two:actionMove2]];
                    return;
                }
            }
        }
    }
    [self finishActionSprite83];
}
-(void) movedownSprite83
{
    CGPoint sprite83Pos = self.sprite83.position;
    self.sprite83.orientation = 1;
    sprite83Pos.y -= theHKMap.tileSize.width;
    
    CGPoint tileCoord = [self tileCoordForPosition:sprite83Pos];
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
                    CGPoint tileCoord1 = [self tileCoordForPosition:self.sprite83.position];
                    int tileGID1 = [self.bgLayer tileGIDAt:tileCoord1];
                    [self.bgLayer removeTileAt:tileCoord1];
                    [self.bgLayer setTileGID:(tileGID1 - 3) at:tileCoord1];
                    
                    id actionMove = [CCMoveTo actionWithDuration:0.3 position:sprite83Pos];
                    id actionMove2 = [CCAnimate actionWithAnimation:spriteGWalkDown restoreOriginalFrame:NO];
                    
                    id actionMoveDone = [CCCallFuncN actionWithTarget:self selector:@selector(finishActionSprite83)];
                    
                    [self.sprite83 runAction:[CCSpawn actionOne:[CCSequence actions:actionMove,actionMoveDone,nil] two:actionMove2]];
                    return;
                }
            }
        }
    }
    [self finishActionSprite83];
}
-(void) finishActionSprite83
{
    if (self.sprite83.orientation == 1)
    {
        [self.sprite83 setDisplayFrame:[[spriteGWalkDown frames] objectAtIndex:0]];
    }
    else if (self.sprite83.orientation == 2)
    {
        [self.sprite83 setDisplayFrame:[[spriteGWalkUp frames] objectAtIndex:0]];
    }
    else if (self.sprite83.orientation == 3)
    {
        [self.sprite83 setDisplayFrame:[[spriteGWalkRight frames] objectAtIndex:0]];
    }
    else
    {
        [self.sprite83 setDisplayFrame:[[spriteGWalkLeft frames] objectAtIndex:0]];
    }
    self.hero.sprite83position = self.sprite83.position;
}

-(void) updateSprite84
{
    CGSize screenSize = [[CCDirector sharedDirector] winSize];
    int x = self.hero.position.x;
    int y = self.hero.position.y;
    
    int p = self.sprite84.position.x;
    int q = self.sprite84.position.y;
    
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
        [self moveleftSprite84];
    }
    if (rand == 2)
    {
        [self moverightSprite84];
    }
    if (rand == 3)
    {
        [self moveupSprite84];
    }
    if (rand == 4)
    {
        [self movedownSprite84];
    }
    return;
}

-(void) moveleftSprite84
{
    CGPoint sprite84Pos = self.sprite84.position;
    self.sprite84.orientation = 4;
    sprite84Pos.x -= theHKMap.tileSize.width;
    
    CGPoint tileCoord = [self tileCoordForPosition:sprite84Pos];
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
                    CGPoint tileCoord1 = [self tileCoordForPosition:self.sprite84.position];
                    int tileGID1 = [self.bgLayer tileGIDAt:tileCoord1];
                    [self.bgLayer removeTileAt:tileCoord1];
                    [self.bgLayer setTileGID:(tileGID1 - 4) at:tileCoord1];
                    
                    id actionMove = [CCMoveTo actionWithDuration:0.3 position:sprite84Pos];
                    id actionMove2 = [CCAnimate actionWithAnimation:spriteAWalkLeft restoreOriginalFrame:NO];
                    
                    id actionMoveDone = [CCCallFuncN actionWithTarget:self selector:@selector(finishActionSprite84)];
                    
                    [self.sprite84 runAction:[CCSpawn actionOne:[CCSequence actions:actionMove,actionMoveDone,nil] two:actionMove2]];
                    return;
                }
            }
        }
    }
    [self finishActionSprite84];
}
-(void) moverightSprite84
{
    CGPoint sprite84Pos = self.sprite84.position;
    self.sprite84.orientation = 3;
    sprite84Pos.x += theHKMap.tileSize.width;
    
    CGPoint tileCoord = [self tileCoordForPosition:sprite84Pos];
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
                    CGPoint tileCoord1 = [self tileCoordForPosition:self.sprite84.position];
                    int tileGID1 = [self.bgLayer tileGIDAt:tileCoord1];
                    [self.bgLayer removeTileAt:tileCoord1];
                    [self.bgLayer setTileGID:(tileGID1 - 4) at:tileCoord1];
                    
                    id actionMove = [CCMoveTo actionWithDuration:0.3 position:sprite84Pos];
                    id actionMove2 = [CCAnimate actionWithAnimation:spriteAWalkRight restoreOriginalFrame:NO];
                    
                    id actionMoveDone = [CCCallFuncN actionWithTarget:self selector:@selector(finishActionSprite84)];
                    
                    [self.sprite84 runAction:[CCSpawn actionOne:[CCSequence actions:actionMove,actionMoveDone,nil] two:actionMove2]];
                    return;
                }
            }
        }
    }
    [self finishActionSprite84];
}
-(void) moveupSprite84
{
    CGPoint sprite84Pos = self.sprite84.position;
    self.sprite84.orientation = 2;
    sprite84Pos.y += theHKMap.tileSize.height;
    
    CGPoint tileCoord = [self tileCoordForPosition:sprite84Pos];
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
                    CGPoint tileCoord1 = [self tileCoordForPosition:self.sprite84.position];
                    int tileGID1 = [self.bgLayer tileGIDAt:tileCoord1];
                    [self.bgLayer removeTileAt:tileCoord1];
                    [self.bgLayer setTileGID:(tileGID1 - 4) at:tileCoord1];
                    
                    id actionMove = [CCMoveTo actionWithDuration:0.3 position:sprite84Pos];
                    id actionMove2 = [CCAnimate actionWithAnimation:spriteAWalkUp restoreOriginalFrame:NO];
                    
                    id actionMoveDone = [CCCallFuncN actionWithTarget:self selector:@selector(finishActionSprite84)];
                    
                    [self.sprite84 runAction:[CCSpawn actionOne:[CCSequence actions:actionMove,actionMoveDone,nil] two:actionMove2]];
                    return;
                }
            }
        }
    }
    [self finishActionSprite84];
}
-(void) movedownSprite84
{
    CGPoint sprite84Pos = self.sprite84.position;
    self.sprite84.orientation = 1;
    sprite84Pos.y -= theHKMap.tileSize.width;
    
    CGPoint tileCoord = [self tileCoordForPosition:sprite84Pos];
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
                    CGPoint tileCoord1 = [self tileCoordForPosition:self.sprite84.position];
                    int tileGID1 = [self.bgLayer tileGIDAt:tileCoord1];
                    [self.bgLayer removeTileAt:tileCoord1];
                    [self.bgLayer setTileGID:(tileGID1 - 4) at:tileCoord1];
                    
                    id actionMove = [CCMoveTo actionWithDuration:0.3 position:sprite84Pos];
                    id actionMove2 = [CCAnimate actionWithAnimation:spriteAWalkDown restoreOriginalFrame:NO];
                    
                    id actionMoveDone = [CCCallFuncN actionWithTarget:self selector:@selector(finishActionSprite84)];
                    
                    [self.sprite84 runAction:[CCSpawn actionOne:[CCSequence actions:actionMove,actionMoveDone,nil] two:actionMove2]];
                    return;
                }
            }
        }
    }
    [self finishActionSprite84];
}
-(void) finishActionSprite84
{
    if (self.sprite84.orientation == 1)
    {
        [self.sprite84 setDisplayFrame:[[spriteAWalkDown frames] objectAtIndex:0]];
    }
    else if (self.sprite84.orientation == 2)
    {
        [self.sprite84 setDisplayFrame:[[spriteAWalkUp frames] objectAtIndex:0]];
    }
    else if (self.sprite84.orientation == 3)
    {
        [self.sprite84 setDisplayFrame:[[spriteAWalkRight frames] objectAtIndex:0]];
    }
    else
    {
        [self.sprite84 setDisplayFrame:[[spriteAWalkLeft frames] objectAtIndex:0]];
    }
    self.hero.sprite84position = self.sprite84.position;
}

-(void) updateSprite85
{
    CGSize screenSize = [[CCDirector sharedDirector] winSize];
    int x = self.hero.position.x;
    int y = self.hero.position.y;
    
    int p = self.sprite85.position.x;
    int q = self.sprite85.position.y;
    
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
        [self moveleftSprite85];
    }
    if (rand == 2)
    {
        [self moverightSprite85];
    }
    if (rand == 3)
    {
        [self moveupSprite85];
    }
    if (rand == 4)
    {
        [self movedownSprite85];
    }
    return;
}

-(void) moveleftSprite85
{
    CGPoint sprite85Pos = self.sprite85.position;
    self.sprite85.orientation = 4;
    sprite85Pos.x -= theHKMap.tileSize.width;
    
    CGPoint tileCoord = [self tileCoordForPosition:sprite85Pos];
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
                    CGPoint tileCoord1 = [self tileCoordForPosition:self.sprite85.position];
                    int tileGID1 = [self.bgLayer tileGIDAt:tileCoord1];
                    [self.bgLayer removeTileAt:tileCoord1];
                    [self.bgLayer setTileGID:(tileGID1 - 5) at:tileCoord1];
                    
                    id actionMove = [CCMoveTo actionWithDuration:0.3 position:sprite85Pos];
                    id actionMove2 = [CCAnimate actionWithAnimation:spriteAWalkLeft restoreOriginalFrame:NO];
                    
                    id actionMoveDone = [CCCallFuncN actionWithTarget:self selector:@selector(finishActionSprite85)];
                    
                    [self.sprite85 runAction:[CCSpawn actionOne:[CCSequence actions:actionMove,actionMoveDone,nil] two:actionMove2]];
                    return;
                }
            }
        }
    }
    [self finishActionSprite85];
}
-(void) moverightSprite85
{
    CGPoint sprite85Pos = self.sprite85.position;
    self.sprite85.orientation = 3;
    sprite85Pos.x += theHKMap.tileSize.width;
    
    CGPoint tileCoord = [self tileCoordForPosition:sprite85Pos];
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
                    CGPoint tileCoord1 = [self tileCoordForPosition:self.sprite85.position];
                    int tileGID1 = [self.bgLayer tileGIDAt:tileCoord1];
                    [self.bgLayer removeTileAt:tileCoord1];
                    [self.bgLayer setTileGID:(tileGID1 - 5) at:tileCoord1];
                    
                    id actionMove = [CCMoveTo actionWithDuration:0.3 position:sprite85Pos];
                    id actionMove2 = [CCAnimate actionWithAnimation:spriteAWalkRight restoreOriginalFrame:NO];
                    
                    id actionMoveDone = [CCCallFuncN actionWithTarget:self selector:@selector(finishActionSprite85)];
                    
                    [self.sprite85 runAction:[CCSpawn actionOne:[CCSequence actions:actionMove,actionMoveDone,nil] two:actionMove2]];
                    return;
                }
            }
        }
    }
    [self finishActionSprite85];
}
-(void) moveupSprite85
{
    CGPoint sprite85Pos = self.sprite85.position;
    self.sprite85.orientation = 2;
    sprite85Pos.y += theHKMap.tileSize.height;
    
    CGPoint tileCoord = [self tileCoordForPosition:sprite85Pos];
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
                    CGPoint tileCoord1 = [self tileCoordForPosition:self.sprite85.position];
                    int tileGID1 = [self.bgLayer tileGIDAt:tileCoord1];
                    [self.bgLayer removeTileAt:tileCoord1];
                    [self.bgLayer setTileGID:(tileGID1 - 5) at:tileCoord1];
                    
                    id actionMove = [CCMoveTo actionWithDuration:0.3 position:sprite85Pos];
                    id actionMove2 = [CCAnimate actionWithAnimation:spriteAWalkUp restoreOriginalFrame:NO];
                    
                    id actionMoveDone = [CCCallFuncN actionWithTarget:self selector:@selector(finishActionSprite85)];
                    
                    [self.sprite85 runAction:[CCSpawn actionOne:[CCSequence actions:actionMove,actionMoveDone,nil] two:actionMove2]];
                    return;
                }
            }
        }
    }
    [self finishActionSprite85];
}
-(void) movedownSprite85
{
    CGPoint sprite85Pos = self.sprite85.position;
    self.sprite85.orientation = 1;
    sprite85Pos.y -= theHKMap.tileSize.width;
    
    CGPoint tileCoord = [self tileCoordForPosition:sprite85Pos];
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
                    CGPoint tileCoord1 = [self tileCoordForPosition:self.sprite85.position];
                    int tileGID1 = [self.bgLayer tileGIDAt:tileCoord1];
                    [self.bgLayer removeTileAt:tileCoord1];
                    [self.bgLayer setTileGID:(tileGID1 - 5) at:tileCoord1];
                    
                    id actionMove = [CCMoveTo actionWithDuration:0.3 position:sprite85Pos];
                    id actionMove2 = [CCAnimate actionWithAnimation:spriteAWalkDown restoreOriginalFrame:NO];
                    
                    id actionMoveDone = [CCCallFuncN actionWithTarget:self selector:@selector(finishActionSprite85)];
                    
                    [self.sprite85 runAction:[CCSpawn actionOne:[CCSequence actions:actionMove,actionMoveDone,nil] two:actionMove2]];
                    return;
                }
            }
        }
    }
    [self finishActionSprite85];
}
-(void) finishActionSprite85
{
    if (self.sprite85.orientation == 1)
    {
        [self.sprite85 setDisplayFrame:[[spriteAWalkDown frames] objectAtIndex:0]];
    }
    else if (self.sprite85.orientation == 2)
    {
        [self.sprite85 setDisplayFrame:[[spriteAWalkUp frames] objectAtIndex:0]];
    }
    else if (self.sprite85.orientation == 3)
    {
        [self.sprite85 setDisplayFrame:[[spriteAWalkRight frames] objectAtIndex:0]];
    }
    else
    {
        [self.sprite85 setDisplayFrame:[[spriteAWalkLeft frames] objectAtIndex:0]];
    }
    self.hero.sprite85position = self.sprite85.position;
}
-(void) updateSprite86
{
    CGSize screenSize = [[CCDirector sharedDirector] winSize];
    int x = self.hero.position.x;
    int y = self.hero.position.y;
    
    int p = self.sprite86.position.x;
    int q = self.sprite86.position.y;
    
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
        [self moveleftSprite86];
    }
    if (rand == 2)
    {
        [self moverightSprite86];
    }
    if (rand == 3)
    {
        [self moveupSprite86];
    }
    if (rand == 4)
    {
        [self movedownSprite86];
    }
    return;
}

-(void) moveleftSprite86
{
    CGPoint sprite86Pos = self.sprite86.position;
    self.sprite86.orientation = 4;
    sprite86Pos.x -= theHKMap.tileSize.width;
    
    CGPoint tileCoord = [self tileCoordForPosition:sprite86Pos];
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
                    CGPoint tileCoord1 = [self tileCoordForPosition:self.sprite86.position];
                    int tileGID1 = [self.bgLayer tileGIDAt:tileCoord1];
                    [self.bgLayer removeTileAt:tileCoord1];
                    [self.bgLayer setTileGID:(tileGID1 - 6) at:tileCoord1];
                    
                    id actionMove = [CCMoveTo actionWithDuration:0.3 position:sprite86Pos];
                    id actionMove2 = [CCAnimate actionWithAnimation:spriteGWalkLeft restoreOriginalFrame:NO];
                    
                    id actionMoveDone = [CCCallFuncN actionWithTarget:self selector:@selector(finishActionSprite86)];
                    
                    [self.sprite86 runAction:[CCSpawn actionOne:[CCSequence actions:actionMove,actionMoveDone,nil] two:actionMove2]];
                    return;
                }
            }
        }
    }
    [self finishActionSprite86];
}
-(void) moverightSprite86
{
    CGPoint sprite86Pos = self.sprite86.position;
    self.sprite86.orientation = 3;
    sprite86Pos.x += theHKMap.tileSize.width;
    
    CGPoint tileCoord = [self tileCoordForPosition:sprite86Pos];
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
                    CGPoint tileCoord1 = [self tileCoordForPosition:self.sprite86.position];
                    int tileGID1 = [self.bgLayer tileGIDAt:tileCoord1];
                    [self.bgLayer removeTileAt:tileCoord1];
                    [self.bgLayer setTileGID:(tileGID1 - 6) at:tileCoord1];
                    
                    id actionMove = [CCMoveTo actionWithDuration:0.3 position:sprite86Pos];
                    id actionMove2 = [CCAnimate actionWithAnimation:spriteGWalkRight restoreOriginalFrame:NO];
                    
                    id actionMoveDone = [CCCallFuncN actionWithTarget:self selector:@selector(finishActionSprite86)];
                    
                    [self.sprite86 runAction:[CCSpawn actionOne:[CCSequence actions:actionMove,actionMoveDone,nil] two:actionMove2]];
                    return;
                }
            }
        }
    }
    [self finishActionSprite86];
}
-(void) moveupSprite86
{
    CGPoint sprite86Pos = self.sprite86.position;
    self.sprite86.orientation = 2;
    sprite86Pos.y += theHKMap.tileSize.height;
    
    CGPoint tileCoord = [self tileCoordForPosition:sprite86Pos];
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
                    CGPoint tileCoord1 = [self tileCoordForPosition:self.sprite86.position];
                    int tileGID1 = [self.bgLayer tileGIDAt:tileCoord1];
                    [self.bgLayer removeTileAt:tileCoord1];
                    [self.bgLayer setTileGID:(tileGID1 - 6) at:tileCoord1];
                    
                    id actionMove = [CCMoveTo actionWithDuration:0.3 position:sprite86Pos];
                    id actionMove2 = [CCAnimate actionWithAnimation:spriteGWalkUp restoreOriginalFrame:NO];
                    
                    id actionMoveDone = [CCCallFuncN actionWithTarget:self selector:@selector(finishActionSprite86)];
                    
                    [self.sprite86 runAction:[CCSpawn actionOne:[CCSequence actions:actionMove,actionMoveDone,nil] two:actionMove2]];
                    return;
                }
            }
        }
    }
    [self finishActionSprite86];
}
-(void) movedownSprite86
{
    CGPoint sprite86Pos = self.sprite86.position;
    self.sprite86.orientation = 1;
    sprite86Pos.y -= theHKMap.tileSize.width;
    
    CGPoint tileCoord = [self tileCoordForPosition:sprite86Pos];
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
                    CGPoint tileCoord1 = [self tileCoordForPosition:self.sprite86.position];
                    int tileGID1 = [self.bgLayer tileGIDAt:tileCoord1];
                    [self.bgLayer removeTileAt:tileCoord1];
                    [self.bgLayer setTileGID:(tileGID1 - 6) at:tileCoord1];
                    
                    id actionMove = [CCMoveTo actionWithDuration:0.3 position:sprite86Pos];
                    id actionMove2 = [CCAnimate actionWithAnimation:spriteGWalkDown restoreOriginalFrame:NO];
                    
                    id actionMoveDone = [CCCallFuncN actionWithTarget:self selector:@selector(finishActionSprite86)];
                    
                    [self.sprite86 runAction:[CCSpawn actionOne:[CCSequence actions:actionMove,actionMoveDone,nil] two:actionMove2]];
                    return;
                }
            }
        }
    }
    [self finishActionSprite86];
}
-(void) finishActionSprite86
{
    if (self.sprite86.orientation == 1)
    {
        [self.sprite86 setDisplayFrame:[[spriteGWalkDown frames] objectAtIndex:0]];
    }
    else if (self.sprite86.orientation == 2)
    {
        [self.sprite86 setDisplayFrame:[[spriteGWalkUp frames] objectAtIndex:0]];
    }
    else if (self.sprite86.orientation == 3)
    {
        [self.sprite86 setDisplayFrame:[[spriteGWalkRight frames] objectAtIndex:0]];
    }
    else
    {
        [self.sprite86 setDisplayFrame:[[spriteGWalkLeft frames] objectAtIndex:0]];
    }
    self.hero.sprite86position = self.sprite86.position;
}
-(void) updateSprite87
{
    CGSize screenSize = [[CCDirector sharedDirector] winSize];
    int x = self.hero.position.x;
    int y = self.hero.position.y;
    
    int p = self.sprite87.position.x;
    int q = self.sprite87.position.y;
    
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
        [self moveleftSprite87];
    }
    if (rand == 2)
    {
        [self moverightSprite87];
    }
    if (rand == 3)
    {
        [self moveupSprite87];
    }
    if (rand == 4)
    {
        [self movedownSprite87];
    }
    return;
}

-(void) moveleftSprite87
{
    CGPoint sprite87Pos = self.sprite87.position;
    self.sprite87.orientation = 4;
    sprite87Pos.x -= theHKMap.tileSize.width;
    
    CGPoint tileCoord = [self tileCoordForPosition:sprite87Pos];
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
                    CGPoint tileCoord1 = [self tileCoordForPosition:self.sprite87.position];
                    int tileGID1 = [self.bgLayer tileGIDAt:tileCoord1];
                    [self.bgLayer removeTileAt:tileCoord1];
                    [self.bgLayer setTileGID:(tileGID1 - 7) at:tileCoord1];
                    
                    id actionMove = [CCMoveTo actionWithDuration:0.3 position:sprite87Pos];
                    id actionMove2 = [CCAnimate actionWithAnimation:spriteGWalkLeft restoreOriginalFrame:NO];
                    
                    id actionMoveDone = [CCCallFuncN actionWithTarget:self selector:@selector(finishActionSprite87)];
                    
                    [self.sprite87 runAction:[CCSpawn actionOne:[CCSequence actions:actionMove,actionMoveDone,nil] two:actionMove2]];
                    return;
                }
            }
        }
    }
    [self finishActionSprite87];
}
-(void) moverightSprite87
{
    CGPoint sprite87Pos = self.sprite87.position;
    self.sprite87.orientation = 3;
    sprite87Pos.x += theHKMap.tileSize.width;
    
    CGPoint tileCoord = [self tileCoordForPosition:sprite87Pos];
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
                    CGPoint tileCoord1 = [self tileCoordForPosition:self.sprite87.position];
                    int tileGID1 = [self.bgLayer tileGIDAt:tileCoord1];
                    [self.bgLayer removeTileAt:tileCoord1];
                    [self.bgLayer setTileGID:(tileGID1 - 7) at:tileCoord1];
                    
                    id actionMove = [CCMoveTo actionWithDuration:0.3 position:sprite87Pos];
                    id actionMove2 = [CCAnimate actionWithAnimation:spriteGWalkRight restoreOriginalFrame:NO];
                    
                    id actionMoveDone = [CCCallFuncN actionWithTarget:self selector:@selector(finishActionSprite87)];
                    
                    [self.sprite87 runAction:[CCSpawn actionOne:[CCSequence actions:actionMove,actionMoveDone,nil] two:actionMove2]];
                    return;
                }
            }
        }
    }
    [self finishActionSprite87];
}
-(void) moveupSprite87
{
    CGPoint sprite87Pos = self.sprite87.position;
    self.sprite87.orientation = 2;
    sprite87Pos.y += theHKMap.tileSize.height;
    
    CGPoint tileCoord = [self tileCoordForPosition:sprite87Pos];
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
                    CGPoint tileCoord1 = [self tileCoordForPosition:self.sprite87.position];
                    int tileGID1 = [self.bgLayer tileGIDAt:tileCoord1];
                    [self.bgLayer removeTileAt:tileCoord1];
                    [self.bgLayer setTileGID:(tileGID1 - 7) at:tileCoord1];
                    
                    id actionMove = [CCMoveTo actionWithDuration:0.3 position:sprite87Pos];
                    id actionMove2 = [CCAnimate actionWithAnimation:spriteGWalkUp restoreOriginalFrame:NO];
                    
                    id actionMoveDone = [CCCallFuncN actionWithTarget:self selector:@selector(finishActionSprite87)];
                    
                    [self.sprite87 runAction:[CCSpawn actionOne:[CCSequence actions:actionMove,actionMoveDone,nil] two:actionMove2]];
                    return;
                }
            }
        }
    }
    [self finishActionSprite87];
}
-(void) movedownSprite87
{
    CGPoint sprite87Pos = self.sprite87.position;
    self.sprite87.orientation = 1;
    sprite87Pos.y -= theHKMap.tileSize.width;
    
    CGPoint tileCoord = [self tileCoordForPosition:sprite87Pos];
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
                    CGPoint tileCoord1 = [self tileCoordForPosition:self.sprite87.position];
                    int tileGID1 = [self.bgLayer tileGIDAt:tileCoord1];
                    [self.bgLayer removeTileAt:tileCoord1];
                    [self.bgLayer setTileGID:(tileGID1 - 7) at:tileCoord1];
                    
                    id actionMove = [CCMoveTo actionWithDuration:0.3 position:sprite87Pos];
                    id actionMove2 = [CCAnimate actionWithAnimation:spriteGWalkDown restoreOriginalFrame:NO];
                    
                    id actionMoveDone = [CCCallFuncN actionWithTarget:self selector:@selector(finishActionSprite87)];
                    
                    [self.sprite87 runAction:[CCSpawn actionOne:[CCSequence actions:actionMove,actionMoveDone,nil] two:actionMove2]];
                    return;
                }
            }
        }
    }
    [self finishActionSprite87];
}
-(void) finishActionSprite87
{
    if (self.sprite87.orientation == 1)
    {
        [self.sprite87 setDisplayFrame:[[spriteGWalkDown frames] objectAtIndex:0]];
    }
    else if (self.sprite87.orientation == 2)
    {
        [self.sprite87 setDisplayFrame:[[spriteGWalkUp frames] objectAtIndex:0]];
    }
    else if (self.sprite87.orientation == 3)
    {
        [self.sprite87 setDisplayFrame:[[spriteGWalkRight frames] objectAtIndex:0]];
    }
    else
    {
        [self.sprite87 setDisplayFrame:[[spriteGWalkLeft frames] objectAtIndex:0]];
    }
    self.hero.sprite87position = self.sprite87.position;
}
-(void) updateSprite88
{
    CGSize screenSize = [[CCDirector sharedDirector] winSize];
    int x = self.hero.position.x;
    int y = self.hero.position.y;
    
    int p = self.sprite88.position.x;
    int q = self.sprite88.position.y;
    
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
        [self moveleftSprite88];
    }
    if (rand == 2)
    {
        [self moverightSprite88];
    }
    if (rand == 3)
    {
        [self moveupSprite88];
    }
    if (rand == 4)
    {
        [self movedownSprite88];
    }
    return;
}

-(void) moveleftSprite88
{
    CGPoint sprite88Pos = self.sprite88.position;
    self.sprite88.orientation = 4;
    sprite88Pos.x -= theHKMap.tileSize.width;
    
    CGPoint tileCoord = [self tileCoordForPosition:sprite88Pos];
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
                    CGPoint tileCoord1 = [self tileCoordForPosition:self.sprite88.position];
                    int tileGID1 = [self.bgLayer tileGIDAt:tileCoord1];
                    [self.bgLayer removeTileAt:tileCoord1];
                    [self.bgLayer setTileGID:(tileGID1 - 8) at:tileCoord1];
                    
                    id actionMove = [CCMoveTo actionWithDuration:0.3 position:sprite88Pos];
                    id actionMove2 = [CCAnimate actionWithAnimation:spriteXWalkLeft restoreOriginalFrame:NO];
                    
                    id actionMoveDone = [CCCallFuncN actionWithTarget:self selector:@selector(finishActionSprite88)];
                    
                    [self.sprite88 runAction:[CCSpawn actionOne:[CCSequence actions:actionMove,actionMoveDone,nil] two:actionMove2]];
                    return;
                }
            }
        }
    }
    [self finishActionSprite88];
}
-(void) moverightSprite88
{
    CGPoint sprite88Pos = self.sprite88.position;
    self.sprite88.orientation = 3;
    sprite88Pos.x += theHKMap.tileSize.width;
    
    CGPoint tileCoord = [self tileCoordForPosition:sprite88Pos];
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
                    CGPoint tileCoord1 = [self tileCoordForPosition:self.sprite88.position];
                    int tileGID1 = [self.bgLayer tileGIDAt:tileCoord1];
                    [self.bgLayer removeTileAt:tileCoord1];
                    [self.bgLayer setTileGID:(tileGID1 - 8) at:tileCoord1];
                    
                    id actionMove = [CCMoveTo actionWithDuration:0.3 position:sprite88Pos];
                    id actionMove2 = [CCAnimate actionWithAnimation:spriteXWalkRight restoreOriginalFrame:NO];
                    
                    id actionMoveDone = [CCCallFuncN actionWithTarget:self selector:@selector(finishActionSprite88)];
                    
                    [self.sprite88 runAction:[CCSpawn actionOne:[CCSequence actions:actionMove,actionMoveDone,nil] two:actionMove2]];
                    return;
                }
            }
        }
    }
    [self finishActionSprite88];
}
-(void) moveupSprite88
{
    CGPoint sprite88Pos = self.sprite88.position;
    self.sprite88.orientation = 2;
    sprite88Pos.y += theHKMap.tileSize.height;
    
    CGPoint tileCoord = [self tileCoordForPosition:sprite88Pos];
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
                    CGPoint tileCoord1 = [self tileCoordForPosition:self.sprite88.position];
                    int tileGID1 = [self.bgLayer tileGIDAt:tileCoord1];
                    [self.bgLayer removeTileAt:tileCoord1];
                    [self.bgLayer setTileGID:(tileGID1 - 8) at:tileCoord1];
                    
                    id actionMove = [CCMoveTo actionWithDuration:0.3 position:sprite88Pos];
                    id actionMove2 = [CCAnimate actionWithAnimation:spriteXWalkUp restoreOriginalFrame:NO];
                    
                    id actionMoveDone = [CCCallFuncN actionWithTarget:self selector:@selector(finishActionSprite88)];
                    
                    [self.sprite88 runAction:[CCSpawn actionOne:[CCSequence actions:actionMove,actionMoveDone,nil] two:actionMove2]];
                    return;
                }
            }
        }
    }
    [self finishActionSprite88];
}
-(void) movedownSprite88
{
    CGPoint sprite88Pos = self.sprite88.position;
    self.sprite88.orientation = 1;
    sprite88Pos.y -= theHKMap.tileSize.width;
    
    CGPoint tileCoord = [self tileCoordForPosition:sprite88Pos];
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
                    CGPoint tileCoord1 = [self tileCoordForPosition:self.sprite88.position];
                    int tileGID1 = [self.bgLayer tileGIDAt:tileCoord1];
                    [self.bgLayer removeTileAt:tileCoord1];
                    [self.bgLayer setTileGID:(tileGID1 - 8) at:tileCoord1];
                    
                    id actionMove = [CCMoveTo actionWithDuration:0.3 position:sprite88Pos];
                    id actionMove2 = [CCAnimate actionWithAnimation:spriteXWalkDown restoreOriginalFrame:NO];
                    
                    id actionMoveDone = [CCCallFuncN actionWithTarget:self selector:@selector(finishActionSprite88)];
                    
                    [self.sprite88 runAction:[CCSpawn actionOne:[CCSequence actions:actionMove,actionMoveDone,nil] two:actionMove2]];
                    return;
                }
            }
        }
    }
    [self finishActionSprite88];
}
-(void) finishActionSprite88
{
    if (self.sprite88.orientation == 1)
    {
        [self.sprite88 setDisplayFrame:[[spriteXWalkDown frames] objectAtIndex:0]];
    }
    else if (self.sprite88.orientation == 2)
    {
        [self.sprite88 setDisplayFrame:[[spriteXWalkUp frames] objectAtIndex:0]];
    }
    else if (self.sprite88.orientation == 3)
    {
        [self.sprite88 setDisplayFrame:[[spriteXWalkRight frames] objectAtIndex:0]];
    }
    else
    {
        [self.sprite88 setDisplayFrame:[[spriteXWalkLeft frames] objectAtIndex:0]];
    }
    self.hero.sprite88position = self.sprite88.position;
}
-(void) updateSprite89
{
    CGSize screenSize = [[CCDirector sharedDirector] winSize];
    int x = self.hero.position.x;
    int y = self.hero.position.y;
    
    int p = self.sprite89.position.x;
    int q = self.sprite89.position.y;
    
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
        [self moveleftSprite89];
    }
    if (rand == 2)
    {
        [self moverightSprite89];
    }
    if (rand == 3)
    {
        [self moveupSprite89];
    }
    if (rand == 4)
    {
        [self movedownSprite89];
    }
    return;
}

-(void) moveleftSprite89
{
    CGPoint sprite89Pos = self.sprite89.position;
    self.sprite89.orientation = 4;
    sprite89Pos.x -= theHKMap.tileSize.width;
    
    CGPoint tileCoord = [self tileCoordForPosition:sprite89Pos];
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
                    CGPoint tileCoord1 = [self tileCoordForPosition:self.sprite89.position];
                    int tileGID1 = [self.bgLayer tileGIDAt:tileCoord1];
                    [self.bgLayer removeTileAt:tileCoord1];
                    [self.bgLayer setTileGID:(tileGID1 - 9) at:tileCoord1];
                    
                    id actionMove = [CCMoveTo actionWithDuration:0.3 position:sprite89Pos];
                    id actionMove2 = [CCAnimate actionWithAnimation:spriteLWalkLeft restoreOriginalFrame:NO];
                    
                    id actionMoveDone = [CCCallFuncN actionWithTarget:self selector:@selector(finishActionSprite89)];
                    
                    [self.sprite89 runAction:[CCSpawn actionOne:[CCSequence actions:actionMove,actionMoveDone,nil] two:actionMove2]];
                    return;
                }
            }
        }
    }
    [self finishActionSprite89];
}
-(void) moverightSprite89
{
    CGPoint sprite89Pos = self.sprite89.position;
    self.sprite89.orientation = 3;
    sprite89Pos.x += theHKMap.tileSize.width;
    
    CGPoint tileCoord = [self tileCoordForPosition:sprite89Pos];
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
                    CGPoint tileCoord1 = [self tileCoordForPosition:self.sprite89.position];
                    int tileGID1 = [self.bgLayer tileGIDAt:tileCoord1];
                    [self.bgLayer removeTileAt:tileCoord1];
                    [self.bgLayer setTileGID:(tileGID1 - 9) at:tileCoord1];
                    
                    id actionMove = [CCMoveTo actionWithDuration:0.3 position:sprite89Pos];
                    id actionMove2 = [CCAnimate actionWithAnimation:spriteLWalkRight restoreOriginalFrame:NO];
                    
                    id actionMoveDone = [CCCallFuncN actionWithTarget:self selector:@selector(finishActionSprite89)];
                    
                    [self.sprite89 runAction:[CCSpawn actionOne:[CCSequence actions:actionMove,actionMoveDone,nil] two:actionMove2]];
                    return;
                }
            }
        }
    }
    [self finishActionSprite89];
}
-(void) moveupSprite89
{
    CGPoint sprite89Pos = self.sprite89.position;
    self.sprite89.orientation = 2;
    sprite89Pos.y += theHKMap.tileSize.height;
    
    CGPoint tileCoord = [self tileCoordForPosition:sprite89Pos];
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
                    CGPoint tileCoord1 = [self tileCoordForPosition:self.sprite89.position];
                    int tileGID1 = [self.bgLayer tileGIDAt:tileCoord1];
                    [self.bgLayer removeTileAt:tileCoord1];
                    [self.bgLayer setTileGID:(tileGID1 - 9) at:tileCoord1];
                    
                    id actionMove = [CCMoveTo actionWithDuration:0.3 position:sprite89Pos];
                    id actionMove2 = [CCAnimate actionWithAnimation:spriteLWalkUp restoreOriginalFrame:NO];
                    
                    id actionMoveDone = [CCCallFuncN actionWithTarget:self selector:@selector(finishActionSprite89)];
                    
                    [self.sprite89 runAction:[CCSpawn actionOne:[CCSequence actions:actionMove,actionMoveDone,nil] two:actionMove2]];
                    return;
                }
            }
        }
    }
    [self finishActionSprite89];
}
-(void) movedownSprite89
{
    CGPoint sprite89Pos = self.sprite89.position;
    self.sprite89.orientation = 1;
    sprite89Pos.y -= theHKMap.tileSize.width;
    
    CGPoint tileCoord = [self tileCoordForPosition:sprite89Pos];
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
                    CGPoint tileCoord1 = [self tileCoordForPosition:self.sprite89.position];
                    int tileGID1 = [self.bgLayer tileGIDAt:tileCoord1];
                    [self.bgLayer removeTileAt:tileCoord1];
                    [self.bgLayer setTileGID:(tileGID1 - 9) at:tileCoord1];
                    
                    id actionMove = [CCMoveTo actionWithDuration:0.3 position:sprite89Pos];
                    id actionMove2 = [CCAnimate actionWithAnimation:spriteLWalkDown restoreOriginalFrame:NO];
                    
                    id actionMoveDone = [CCCallFuncN actionWithTarget:self selector:@selector(finishActionSprite89)];
                    
                    [self.sprite89 runAction:[CCSpawn actionOne:[CCSequence actions:actionMove,actionMoveDone,nil] two:actionMove2]];
                    return;
                }
            }
        }
    }
    [self finishActionSprite89];
}
-(void) finishActionSprite89
{
    if (self.sprite89.orientation == 1)
    {
        [self.sprite89 setDisplayFrame:[[spriteLWalkDown frames] objectAtIndex:0]];
    }
    else if (self.sprite89.orientation == 2)
    {
        [self.sprite89 setDisplayFrame:[[spriteLWalkUp frames] objectAtIndex:0]];
    }
    else if (self.sprite89.orientation == 3)
    {
        [self.sprite89 setDisplayFrame:[[spriteLWalkRight frames] objectAtIndex:0]];
    }
    else
    {
        [self.sprite89 setDisplayFrame:[[spriteLWalkLeft frames] objectAtIndex:0]];
    }
    self.hero.sprite89position = self.sprite89.position;
}
-(void) updateSprite90
{
    CGSize screenSize = [[CCDirector sharedDirector] winSize];
    int x = self.hero.position.x;
    int y = self.hero.position.y;
    
    int p = self.sprite90.position.x;
    int q = self.sprite90.position.y;
    
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
        [self moveleftSprite90];
    }
    if (rand == 2)
    {
        [self moverightSprite90];
    }
    if (rand == 3)
    {
        [self moveupSprite90];
    }
    if (rand == 4)
    {
        [self movedownSprite90];
    }
    return;
}

-(void) moveleftSprite90
{
    CGPoint sprite90Pos = self.sprite90.position;
    self.sprite90.orientation = 4;
    sprite90Pos.x -= theHKMap.tileSize.width;
    
    CGPoint tileCoord = [self tileCoordForPosition:sprite90Pos];
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
                    [self.bgLayer setTileGID:(tileGID + 10) at:tileCoord];
                    CGPoint tileCoord1 = [self tileCoordForPosition:self.sprite90.position];
                    int tileGID1 = [self.bgLayer tileGIDAt:tileCoord1];
                    [self.bgLayer removeTileAt:tileCoord1];
                    [self.bgLayer setTileGID:(tileGID1 - 10) at:tileCoord1];
                    
                    id actionMove = [CCMoveTo actionWithDuration:0.3 position:sprite90Pos];
                    id actionMove2 = [CCAnimate actionWithAnimation:spriteRWalkLeft restoreOriginalFrame:NO];
                    
                    id actionMoveDone = [CCCallFuncN actionWithTarget:self selector:@selector(finishActionSprite90)];
                    
                    [self.sprite90 runAction:[CCSpawn actionOne:[CCSequence actions:actionMove,actionMoveDone,nil] two:actionMove2]];
                    return;
                }
            }
        }
    }
    [self finishActionSprite90];
}
-(void) moverightSprite90
{
    CGPoint sprite90Pos = self.sprite90.position;
    self.sprite90.orientation = 3;
    sprite90Pos.x += theHKMap.tileSize.width;
    
    CGPoint tileCoord = [self tileCoordForPosition:sprite90Pos];
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
                    [self.bgLayer setTileGID:(tileGID + 10) at:tileCoord];
                    CGPoint tileCoord1 = [self tileCoordForPosition:self.sprite90.position];
                    int tileGID1 = [self.bgLayer tileGIDAt:tileCoord1];
                    [self.bgLayer removeTileAt:tileCoord1];
                    [self.bgLayer setTileGID:(tileGID1 - 10) at:tileCoord1];
                    
                    id actionMove = [CCMoveTo actionWithDuration:0.3 position:sprite90Pos];
                    id actionMove2 = [CCAnimate actionWithAnimation:spriteRWalkRight restoreOriginalFrame:NO];
                    
                    id actionMoveDone = [CCCallFuncN actionWithTarget:self selector:@selector(finishActionSprite90)];
                    
                    [self.sprite90 runAction:[CCSpawn actionOne:[CCSequence actions:actionMove,actionMoveDone,nil] two:actionMove2]];
                    return;
                }
            }
        }
    }
    [self finishActionSprite90];
}
-(void) moveupSprite90
{
    CGPoint sprite90Pos = self.sprite90.position;
    self.sprite90.orientation = 2;
    sprite90Pos.y += theHKMap.tileSize.height;
    
    CGPoint tileCoord = [self tileCoordForPosition:sprite90Pos];
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
                    [self.bgLayer setTileGID:(tileGID + 10) at:tileCoord];
                    CGPoint tileCoord1 = [self tileCoordForPosition:self.sprite90.position];
                    int tileGID1 = [self.bgLayer tileGIDAt:tileCoord1];
                    [self.bgLayer removeTileAt:tileCoord1];
                    [self.bgLayer setTileGID:(tileGID1 - 10) at:tileCoord1];
                    
                    id actionMove = [CCMoveTo actionWithDuration:0.3 position:sprite90Pos];
                    id actionMove2 = [CCAnimate actionWithAnimation:spriteRWalkUp restoreOriginalFrame:NO];
                    
                    id actionMoveDone = [CCCallFuncN actionWithTarget:self selector:@selector(finishActionSprite90)];
                    
                    [self.sprite90 runAction:[CCSpawn actionOne:[CCSequence actions:actionMove,actionMoveDone,nil] two:actionMove2]];
                    return;
                }
            }
        }
    }
    [self finishActionSprite90];
}
-(void) movedownSprite90
{
    CGPoint sprite90Pos = self.sprite90.position;
    self.sprite90.orientation = 1;
    sprite90Pos.y -= theHKMap.tileSize.width;
    
    CGPoint tileCoord = [self tileCoordForPosition:sprite90Pos];
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
                    [self.bgLayer setTileGID:(tileGID + 10) at:tileCoord];
                    CGPoint tileCoord1 = [self tileCoordForPosition:self.sprite90.position];
                    int tileGID1 = [self.bgLayer tileGIDAt:tileCoord1];
                    [self.bgLayer removeTileAt:tileCoord1];
                    [self.bgLayer setTileGID:(tileGID1 - 10) at:tileCoord1];
                    
                    id actionMove = [CCMoveTo actionWithDuration:0.3 position:sprite90Pos];
                    id actionMove2 = [CCAnimate actionWithAnimation:spriteRWalkDown restoreOriginalFrame:NO];
                    
                    id actionMoveDone = [CCCallFuncN actionWithTarget:self selector:@selector(finishActionSprite90)];
                    
                    [self.sprite90 runAction:[CCSpawn actionOne:[CCSequence actions:actionMove,actionMoveDone,nil] two:actionMove2]];
                    return;
                }
            }
        }
    }
    [self finishActionSprite90];
}
-(void) finishActionSprite90
{
    if (self.sprite90.orientation == 1)
    {
        [self.sprite90 setDisplayFrame:[[spriteRWalkDown frames] objectAtIndex:0]];
    }
    else if (self.sprite90.orientation == 2)
    {
        [self.sprite90 setDisplayFrame:[[spriteRWalkUp frames] objectAtIndex:0]];
    }
    else if (self.sprite90.orientation == 3)
    {
        [self.sprite90 setDisplayFrame:[[spriteRWalkRight frames] objectAtIndex:0]];
    }
    else
    {
        [self.sprite90 setDisplayFrame:[[spriteRWalkLeft frames] objectAtIndex:0]];
    }
    self.hero.sprite90position = self.sprite90.position;
}
-(void) updateSprite91
{
    CGSize screenSize = [[CCDirector sharedDirector] winSize];
    int x = self.hero.position.x;
    int y = self.hero.position.y;
    
    int p = self.sprite91.position.x;
    int q = self.sprite91.position.y;
    
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
    
    int rand = arc4random()%15;
    if (rand == 1)
    {
        [self moveleftSprite91];
    }
    if (rand == 2)
    {
        [self moverightSprite91];
    }
    if (rand == 3)
    {
        [self moveupSprite91];
    }
    if (rand == 4)
    {
        [self movedownSprite91];
    }
    return;
}

-(void) moveleftSprite91
{
    CGPoint sprite91Pos = self.sprite91.position;
    self.sprite91.orientation = 4;
    sprite91Pos.x -= theHKMap.tileSize.width;
    
    CGPoint tileCoord = [self tileCoordForPosition:sprite91Pos];
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
                    [self.bgLayer setTileGID:(tileGID + 11) at:tileCoord];
                    CGPoint tileCoord1 = [self tileCoordForPosition:self.sprite91.position];
                    int tileGID1 = [self.bgLayer tileGIDAt:tileCoord1];
                    [self.bgLayer removeTileAt:tileCoord1];
                    [self.bgLayer setTileGID:(tileGID1 - 11) at:tileCoord1];
                    
                    id actionMove = [CCMoveTo actionWithDuration:0.3 position:sprite91Pos];
                    id actionMove2 = [CCAnimate actionWithAnimation:spriteVWalkLeft restoreOriginalFrame:NO];
                    
                    id actionMoveDone = [CCCallFuncN actionWithTarget:self selector:@selector(finishActionSprite91)];
                    
                    [self.sprite91 runAction:[CCSpawn actionOne:[CCSequence actions:actionMove,actionMoveDone,nil] two:actionMove2]];
                    return;
                }
            }
        }
    }
    [self finishActionSprite91];
}
-(void) moverightSprite91
{
    CGPoint sprite91Pos = self.sprite91.position;
    self.sprite91.orientation = 3;
    sprite91Pos.x += theHKMap.tileSize.width;
    
    CGPoint tileCoord = [self tileCoordForPosition:sprite91Pos];
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
                    [self.bgLayer setTileGID:(tileGID + 11) at:tileCoord];
                    CGPoint tileCoord1 = [self tileCoordForPosition:self.sprite91.position];
                    int tileGID1 = [self.bgLayer tileGIDAt:tileCoord1];
                    [self.bgLayer removeTileAt:tileCoord1];
                    [self.bgLayer setTileGID:(tileGID1 - 11) at:tileCoord1];
                    
                    id actionMove = [CCMoveTo actionWithDuration:0.3 position:sprite91Pos];
                    id actionMove2 = [CCAnimate actionWithAnimation:spriteVWalkRight restoreOriginalFrame:NO];
                    
                    id actionMoveDone = [CCCallFuncN actionWithTarget:self selector:@selector(finishActionSprite91)];
                    
                    [self.sprite91 runAction:[CCSpawn actionOne:[CCSequence actions:actionMove,actionMoveDone,nil] two:actionMove2]];
                    return;
                }
            }
        }
    }
    [self finishActionSprite91];
}
-(void) moveupSprite91
{
    CGPoint sprite91Pos = self.sprite91.position;
    self.sprite91.orientation = 2;
    sprite91Pos.y += theHKMap.tileSize.height;
    
    CGPoint tileCoord = [self tileCoordForPosition:sprite91Pos];
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
                    [self.bgLayer setTileGID:(tileGID + 11) at:tileCoord];
                    CGPoint tileCoord1 = [self tileCoordForPosition:self.sprite91.position];
                    int tileGID1 = [self.bgLayer tileGIDAt:tileCoord1];
                    [self.bgLayer removeTileAt:tileCoord1];
                    [self.bgLayer setTileGID:(tileGID1 - 11) at:tileCoord1];
                    
                    id actionMove = [CCMoveTo actionWithDuration:0.3 position:sprite91Pos];
                    id actionMove2 = [CCAnimate actionWithAnimation:spriteVWalkUp restoreOriginalFrame:NO];
                    
                    id actionMoveDone = [CCCallFuncN actionWithTarget:self selector:@selector(finishActionSprite91)];
                    
                    [self.sprite91 runAction:[CCSpawn actionOne:[CCSequence actions:actionMove,actionMoveDone,nil] two:actionMove2]];
                    return;
                }
            }
        }
    }
    [self finishActionSprite91];
}
-(void) movedownSprite91
{
    CGPoint sprite91Pos = self.sprite91.position;
    self.sprite91.orientation = 1;
    sprite91Pos.y -= theHKMap.tileSize.width;
    
    CGPoint tileCoord = [self tileCoordForPosition:sprite91Pos];
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
                    [self.bgLayer setTileGID:(tileGID + 11) at:tileCoord];
                    CGPoint tileCoord1 = [self tileCoordForPosition:self.sprite91.position];
                    int tileGID1 = [self.bgLayer tileGIDAt:tileCoord1];
                    [self.bgLayer removeTileAt:tileCoord1];
                    [self.bgLayer setTileGID:(tileGID1 - 11) at:tileCoord1];
                    
                    id actionMove = [CCMoveTo actionWithDuration:0.3 position:sprite91Pos];
                    id actionMove2 = [CCAnimate actionWithAnimation:spriteVWalkDown restoreOriginalFrame:NO];
                    
                    id actionMoveDone = [CCCallFuncN actionWithTarget:self selector:@selector(finishActionSprite91)];
                    
                    [self.sprite91 runAction:[CCSpawn actionOne:[CCSequence actions:actionMove,actionMoveDone,nil] two:actionMove2]];
                    return;
                }
            }
        }
    }
    [self finishActionSprite91];
}
-(void) finishActionSprite91
{
    if (self.sprite91.orientation == 1)
    {
        [self.sprite91 setDisplayFrame:[[spriteVWalkDown frames] objectAtIndex:0]];
    }
    else if (self.sprite91.orientation == 2)
    {
        [self.sprite91 setDisplayFrame:[[spriteVWalkUp frames] objectAtIndex:0]];
    }
    else if (self.sprite91.orientation == 3)
    {
        [self.sprite91 setDisplayFrame:[[spriteVWalkRight frames] objectAtIndex:0]];
    }
    else
    {
        [self.sprite91 setDisplayFrame:[[spriteVWalkLeft frames] objectAtIndex:0]];
    }
    self.hero.sprite91position = self.sprite91.position;
}
-(void) updateSprite92
{
    CGSize screenSize = [[CCDirector sharedDirector] winSize];
    int x = self.hero.position.x;
    int y = self.hero.position.y;
    
    int p = self.sprite92.position.x;
    int q = self.sprite92.position.y;
    
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
        [self moveleftSprite92];
    }
    if (rand == 2)
    {
        [self moverightSprite92];
    }
    if (rand == 3)
    {
        [self moveupSprite92];
    }
    if (rand == 4)
    {
        [self movedownSprite92];
    }
    return;
}

-(void) moveleftSprite92
{
    CGPoint sprite92Pos = self.sprite92.position;
    self.sprite92.orientation = 4;
    sprite92Pos.x -= theHKMap.tileSize.width;
    
    CGPoint tileCoord = [self tileCoordForPosition:sprite92Pos];
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
                    [self.bgLayer setTileGID:(tileGID + 12) at:tileCoord];
                    CGPoint tileCoord1 = [self tileCoordForPosition:self.sprite92.position];
                    int tileGID1 = [self.bgLayer tileGIDAt:tileCoord1];
                    [self.bgLayer removeTileAt:tileCoord1];
                    [self.bgLayer setTileGID:(tileGID1 - 12) at:tileCoord1];
                    
                    id actionMove = [CCMoveTo actionWithDuration:0.3 position:sprite92Pos];
                    id actionMove2 = [CCAnimate actionWithAnimation:spriteMWalkLeft restoreOriginalFrame:NO];
                    
                    id actionMoveDone = [CCCallFuncN actionWithTarget:self selector:@selector(finishActionSprite92)];
                    
                    [self.sprite92 runAction:[CCSpawn actionOne:[CCSequence actions:actionMove,actionMoveDone,nil] two:actionMove2]];
                    return;
                }
            }
        }
    }
    [self finishActionSprite92];
}
-(void) moverightSprite92
{
    CGPoint sprite92Pos = self.sprite92.position;
    self.sprite92.orientation = 3;
    sprite92Pos.x += theHKMap.tileSize.width;
    
    CGPoint tileCoord = [self tileCoordForPosition:sprite92Pos];
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
                    [self.bgLayer setTileGID:(tileGID + 12) at:tileCoord];
                    CGPoint tileCoord1 = [self tileCoordForPosition:self.sprite92.position];
                    int tileGID1 = [self.bgLayer tileGIDAt:tileCoord1];
                    [self.bgLayer removeTileAt:tileCoord1];
                    [self.bgLayer setTileGID:(tileGID1 - 12) at:tileCoord1];
                    
                    id actionMove = [CCMoveTo actionWithDuration:0.3 position:sprite92Pos];
                    id actionMove2 = [CCAnimate actionWithAnimation:spriteMWalkRight restoreOriginalFrame:NO];
                    
                    id actionMoveDone = [CCCallFuncN actionWithTarget:self selector:@selector(finishActionSprite92)];
                    
                    [self.sprite92 runAction:[CCSpawn actionOne:[CCSequence actions:actionMove,actionMoveDone,nil] two:actionMove2]];
                    return;
                }
            }
        }
    }
    [self finishActionSprite92];
}
-(void) moveupSprite92
{
    CGPoint sprite92Pos = self.sprite92.position;
    self.sprite92.orientation = 2;
    sprite92Pos.y += theHKMap.tileSize.height;
    
    CGPoint tileCoord = [self tileCoordForPosition:sprite92Pos];
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
                    [self.bgLayer setTileGID:(tileGID + 12) at:tileCoord];
                    CGPoint tileCoord1 = [self tileCoordForPosition:self.sprite92.position];
                    int tileGID1 = [self.bgLayer tileGIDAt:tileCoord1];
                    [self.bgLayer removeTileAt:tileCoord1];
                    [self.bgLayer setTileGID:(tileGID1 - 12) at:tileCoord1];
                    
                    id actionMove = [CCMoveTo actionWithDuration:0.3 position:sprite92Pos];
                    id actionMove2 = [CCAnimate actionWithAnimation:spriteMWalkUp restoreOriginalFrame:NO];
                    
                    id actionMoveDone = [CCCallFuncN actionWithTarget:self selector:@selector(finishActionSprite92)];
                    
                    [self.sprite92 runAction:[CCSpawn actionOne:[CCSequence actions:actionMove,actionMoveDone,nil] two:actionMove2]];
                    return;
                }
            }
        }
    }
    [self finishActionSprite92];
}
-(void) movedownSprite92
{
    CGPoint sprite92Pos = self.sprite92.position;
    self.sprite92.orientation = 1;
    sprite92Pos.y -= theHKMap.tileSize.width;
    
    CGPoint tileCoord = [self tileCoordForPosition:sprite92Pos];
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
                    [self.bgLayer setTileGID:(tileGID + 12) at:tileCoord];
                    CGPoint tileCoord1 = [self tileCoordForPosition:self.sprite92.position];
                    int tileGID1 = [self.bgLayer tileGIDAt:tileCoord1];
                    [self.bgLayer removeTileAt:tileCoord1];
                    [self.bgLayer setTileGID:(tileGID1 - 12) at:tileCoord1];
                    
                    id actionMove = [CCMoveTo actionWithDuration:0.3 position:sprite92Pos];
                    id actionMove2 = [CCAnimate actionWithAnimation:spriteMWalkDown restoreOriginalFrame:NO];
                    
                    id actionMoveDone = [CCCallFuncN actionWithTarget:self selector:@selector(finishActionSprite92)];
                    
                    [self.sprite92 runAction:[CCSpawn actionOne:[CCSequence actions:actionMove,actionMoveDone,nil] two:actionMove2]];
                    return;
                }
            }
        }
    }
    [self finishActionSprite92];
}
-(void) finishActionSprite92
{
    if (self.sprite92.orientation == 1)
    {
        [self.sprite92 setDisplayFrame:[[spriteMWalkDown frames] objectAtIndex:0]];
    }
    else if (self.sprite92.orientation == 2)
    {
        [self.sprite92 setDisplayFrame:[[spriteMWalkUp frames] objectAtIndex:0]];
    }
    else if (self.sprite92.orientation == 3)
    {
        [self.sprite92 setDisplayFrame:[[spriteMWalkRight frames] objectAtIndex:0]];
    }
    else
    {
        [self.sprite92 setDisplayFrame:[[spriteMWalkLeft frames] objectAtIndex:0]];
    }
    self.hero.sprite92position = self.sprite92.position;
}
-(void) updateSprite93
{
    CGSize screenSize = [[CCDirector sharedDirector] winSize];
    int x = self.hero.position.x;
    int y = self.hero.position.y;
    
    int p = self.sprite93.position.x;
    int q = self.sprite93.position.y;
    
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
        [self moveleftSprite93];
    }
    if (rand == 2)
    {
        [self moverightSprite93];
    }
    if (rand == 3)
    {
        [self moveupSprite93];
    }
    if (rand == 4)
    {
        [self movedownSprite93];
    }
    return;
}

-(void) moveleftSprite93
{
    CGPoint sprite93Pos = self.sprite93.position;
    self.sprite93.orientation = 4;
    sprite93Pos.x -= theHKMap.tileSize.width;
    
    CGPoint tileCoord = [self tileCoordForPosition:sprite93Pos];
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
                    [self.bgLayer setTileGID:(tileGID + 13) at:tileCoord];
                    CGPoint tileCoord1 = [self tileCoordForPosition:self.sprite93.position];
                    int tileGID1 = [self.bgLayer tileGIDAt:tileCoord1];
                    [self.bgLayer removeTileAt:tileCoord1];
                    [self.bgLayer setTileGID:(tileGID1 - 13) at:tileCoord1];
                    
                    id actionMove = [CCMoveTo actionWithDuration:0.3 position:sprite93Pos];
                    id actionMove2 = [CCAnimate actionWithAnimation:spritePWalkLeft restoreOriginalFrame:NO];
                    
                    id actionMoveDone = [CCCallFuncN actionWithTarget:self selector:@selector(finishActionSprite93)];
                    
                    [self.sprite93 runAction:[CCSpawn actionOne:[CCSequence actions:actionMove,actionMoveDone,nil] two:actionMove2]];
                    return;
                }
            }
        }
    }
    [self finishActionSprite93];
}
-(void) moverightSprite93
{
    CGPoint sprite93Pos = self.sprite93.position;
    self.sprite93.orientation = 3;
    sprite93Pos.x += theHKMap.tileSize.width;
    
    CGPoint tileCoord = [self tileCoordForPosition:sprite93Pos];
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
                    [self.bgLayer setTileGID:(tileGID + 13) at:tileCoord];
                    CGPoint tileCoord1 = [self tileCoordForPosition:self.sprite93.position];
                    int tileGID1 = [self.bgLayer tileGIDAt:tileCoord1];
                    [self.bgLayer removeTileAt:tileCoord1];
                    [self.bgLayer setTileGID:(tileGID1 - 13) at:tileCoord1];
                    
                    id actionMove = [CCMoveTo actionWithDuration:0.3 position:sprite93Pos];
                    id actionMove2 = [CCAnimate actionWithAnimation:spritePWalkRight restoreOriginalFrame:NO];
                    
                    id actionMoveDone = [CCCallFuncN actionWithTarget:self selector:@selector(finishActionSprite93)];
                    
                    [self.sprite93 runAction:[CCSpawn actionOne:[CCSequence actions:actionMove,actionMoveDone,nil] two:actionMove2]];
                    return;
                }
            }
        }
    }
    [self finishActionSprite93];
}
-(void) moveupSprite93
{
    CGPoint sprite93Pos = self.sprite93.position;
    self.sprite93.orientation = 2;
    sprite93Pos.y += theHKMap.tileSize.height;
    
    CGPoint tileCoord = [self tileCoordForPosition:sprite93Pos];
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
                    [self.bgLayer setTileGID:(tileGID + 13) at:tileCoord];
                    CGPoint tileCoord1 = [self tileCoordForPosition:self.sprite93.position];
                    int tileGID1 = [self.bgLayer tileGIDAt:tileCoord1];
                    [self.bgLayer removeTileAt:tileCoord1];
                    [self.bgLayer setTileGID:(tileGID1 - 13) at:tileCoord1];
                    
                    id actionMove = [CCMoveTo actionWithDuration:0.3 position:sprite93Pos];
                    id actionMove2 = [CCAnimate actionWithAnimation:spritePWalkUp restoreOriginalFrame:NO];
                    
                    id actionMoveDone = [CCCallFuncN actionWithTarget:self selector:@selector(finishActionSprite93)];
                    
                    [self.sprite93 runAction:[CCSpawn actionOne:[CCSequence actions:actionMove,actionMoveDone,nil] two:actionMove2]];
                    return;
                }
            }
        }
    }
    [self finishActionSprite93];
}
-(void) movedownSprite93
{
    CGPoint sprite93Pos = self.sprite93.position;
    self.sprite93.orientation = 1;
    sprite93Pos.y -= theHKMap.tileSize.width;
    
    CGPoint tileCoord = [self tileCoordForPosition:sprite93Pos];
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
                    [self.bgLayer setTileGID:(tileGID + 13) at:tileCoord];
                    CGPoint tileCoord1 = [self tileCoordForPosition:self.sprite93.position];
                    int tileGID1 = [self.bgLayer tileGIDAt:tileCoord1];
                    [self.bgLayer removeTileAt:tileCoord1];
                    [self.bgLayer setTileGID:(tileGID1 - 13) at:tileCoord1];
                    
                    id actionMove = [CCMoveTo actionWithDuration:0.3 position:sprite93Pos];
                    id actionMove2 = [CCAnimate actionWithAnimation:spritePWalkDown restoreOriginalFrame:NO];
                    
                    id actionMoveDone = [CCCallFuncN actionWithTarget:self selector:@selector(finishActionSprite93)];
                    
                    [self.sprite93 runAction:[CCSpawn actionOne:[CCSequence actions:actionMove,actionMoveDone,nil] two:actionMove2]];
                    return;
                }
            }
        }
    }
    [self finishActionSprite93];
}
-(void) finishActionSprite93
{
    if (self.sprite93.orientation == 1)
    {
        [self.sprite93 setDisplayFrame:[[spritePWalkDown frames] objectAtIndex:0]];
    }
    else if (self.sprite93.orientation == 2)
    {
        [self.sprite93 setDisplayFrame:[[spritePWalkUp frames] objectAtIndex:0]];
    }
    else if (self.sprite93.orientation == 3)
    {
        [self.sprite93 setDisplayFrame:[[spritePWalkRight frames] objectAtIndex:0]];
    }
    else
    {
        [self.sprite93 setDisplayFrame:[[spritePWalkLeft frames] objectAtIndex:0]];
    }
    self.hero.sprite93position = self.sprite93.position;
}
-(void) updateSprite94
{
    CGSize screenSize = [[CCDirector sharedDirector] winSize];
    int x = self.hero.position.x;
    int y = self.hero.position.y;
    
    int p = self.sprite94.position.x;
    int q = self.sprite94.position.y;
    
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
        [self moveleftSprite94];
    }
    if (rand == 2)
    {
        [self moverightSprite94];
    }
    if (rand == 3)
    {
        [self moveupSprite94];
    }
    if (rand == 4)
    {
        [self movedownSprite94];
    }
    return;
}

-(void) moveleftSprite94
{
    CGPoint sprite94Pos = self.sprite94.position;
    self.sprite94.orientation = 4;
    sprite94Pos.x -= theHKMap.tileSize.width;
    
    CGPoint tileCoord = [self tileCoordForPosition:sprite94Pos];
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
                    [self.bgLayer setTileGID:(tileGID + 14) at:tileCoord];
                    CGPoint tileCoord1 = [self tileCoordForPosition:self.sprite94.position];
                    int tileGID1 = [self.bgLayer tileGIDAt:tileCoord1];
                    [self.bgLayer removeTileAt:tileCoord1];
                    [self.bgLayer setTileGID:(tileGID1 - 14) at:tileCoord1];
                    
                    id actionMove = [CCMoveTo actionWithDuration:0.3 position:sprite94Pos];
                    id actionMove2 = [CCAnimate actionWithAnimation:spriteSWalkLeft restoreOriginalFrame:NO];
                    
                    id actionMoveDone = [CCCallFuncN actionWithTarget:self selector:@selector(finishActionSprite94)];
                    
                    [self.sprite94 runAction:[CCSpawn actionOne:[CCSequence actions:actionMove,actionMoveDone,nil] two:actionMove2]];
                    return;
                }
            }
        }
    }
    [self finishActionSprite94];
}
-(void) moverightSprite94
{
    CGPoint sprite94Pos = self.sprite94.position;
    self.sprite94.orientation = 3;
    sprite94Pos.x += theHKMap.tileSize.width;
    
    CGPoint tileCoord = [self tileCoordForPosition:sprite94Pos];
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
                    [self.bgLayer setTileGID:(tileGID + 14) at:tileCoord];
                    CGPoint tileCoord1 = [self tileCoordForPosition:self.sprite94.position];
                    int tileGID1 = [self.bgLayer tileGIDAt:tileCoord1];
                    [self.bgLayer removeTileAt:tileCoord1];
                    [self.bgLayer setTileGID:(tileGID1 - 14) at:tileCoord1];
                    
                    id actionMove = [CCMoveTo actionWithDuration:0.3 position:sprite94Pos];
                    id actionMove2 = [CCAnimate actionWithAnimation:spriteSWalkRight restoreOriginalFrame:NO];
                    
                    id actionMoveDone = [CCCallFuncN actionWithTarget:self selector:@selector(finishActionSprite94)];
                    
                    [self.sprite94 runAction:[CCSpawn actionOne:[CCSequence actions:actionMove,actionMoveDone,nil] two:actionMove2]];
                    return;
                }
            }
        }
    }
    [self finishActionSprite94];
}
-(void) moveupSprite94
{
    CGPoint sprite94Pos = self.sprite94.position;
    self.sprite94.orientation = 2;
    sprite94Pos.y += theHKMap.tileSize.height;
    
    CGPoint tileCoord = [self tileCoordForPosition:sprite94Pos];
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
                    [self.bgLayer setTileGID:(tileGID + 14) at:tileCoord];
                    CGPoint tileCoord1 = [self tileCoordForPosition:self.sprite94.position];
                    int tileGID1 = [self.bgLayer tileGIDAt:tileCoord1];
                    [self.bgLayer removeTileAt:tileCoord1];
                    [self.bgLayer setTileGID:(tileGID1 - 14) at:tileCoord1];
                    
                    id actionMove = [CCMoveTo actionWithDuration:0.3 position:sprite94Pos];
                    id actionMove2 = [CCAnimate actionWithAnimation:spriteSWalkUp restoreOriginalFrame:NO];
                    
                    id actionMoveDone = [CCCallFuncN actionWithTarget:self selector:@selector(finishActionSprite94)];
                    
                    [self.sprite94 runAction:[CCSpawn actionOne:[CCSequence actions:actionMove,actionMoveDone,nil] two:actionMove2]];
                    return;
                }
            }
        }
    }
    [self finishActionSprite94];
}
-(void) movedownSprite94
{
    CGPoint sprite94Pos = self.sprite94.position;
    self.sprite94.orientation = 1;
    sprite94Pos.y -= theHKMap.tileSize.width;
    
    CGPoint tileCoord = [self tileCoordForPosition:sprite94Pos];
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
                    [self.bgLayer setTileGID:(tileGID + 14) at:tileCoord];
                    CGPoint tileCoord1 = [self tileCoordForPosition:self.sprite94.position];
                    int tileGID1 = [self.bgLayer tileGIDAt:tileCoord1];
                    [self.bgLayer removeTileAt:tileCoord1];
                    [self.bgLayer setTileGID:(tileGID1 - 14) at:tileCoord1];
                    
                    id actionMove = [CCMoveTo actionWithDuration:0.3 position:sprite94Pos];
                    id actionMove2 = [CCAnimate actionWithAnimation:spriteSWalkDown restoreOriginalFrame:NO];
                    
                    id actionMoveDone = [CCCallFuncN actionWithTarget:self selector:@selector(finishActionSprite94)];
                    
                    [self.sprite94 runAction:[CCSpawn actionOne:[CCSequence actions:actionMove,actionMoveDone,nil] two:actionMove2]];
                    return;
                }
            }
        }
    }
    [self finishActionSprite94];
}
-(void) finishActionSprite94
{
    if (self.sprite94.orientation == 1)
    {
        [self.sprite94 setDisplayFrame:[[spriteSWalkDown frames] objectAtIndex:0]];
    }
    else if (self.sprite94.orientation == 2)
    {
        [self.sprite94 setDisplayFrame:[[spriteSWalkUp frames] objectAtIndex:0]];
    }
    else if (self.sprite94.orientation == 3)
    {
        [self.sprite94 setDisplayFrame:[[spriteSWalkRight frames] objectAtIndex:0]];
    }
    else
    {
        [self.sprite94 setDisplayFrame:[[spriteSWalkLeft frames] objectAtIndex:0]];
    }
    self.hero.sprite94position = self.sprite94.position;
}
-(void) updateSprite95
{
    CGSize screenSize = [[CCDirector sharedDirector] winSize];
    int x = self.hero.position.x;
    int y = self.hero.position.y;
    
    int p = self.sprite95.position.x;
    int q = self.sprite95.position.y;
    
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
        [self moveleftSprite95];
    }
    if (rand == 2)
    {
        [self moverightSprite95];
    }
    if (rand == 3)
    {
        [self moveupSprite95];
    }
    if (rand == 4)
    {
        [self movedownSprite95];
    }
    return;
}

-(void) moveleftSprite95
{
    CGPoint sprite95Pos = self.sprite95.position;
    self.sprite95.orientation = 4;
    sprite95Pos.x -= theHKMap.tileSize.width;
    
    CGPoint tileCoord = [self tileCoordForPosition:sprite95Pos];
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
                    [self.bgLayer setTileGID:(tileGID + 15) at:tileCoord];
                    CGPoint tileCoord1 = [self tileCoordForPosition:self.sprite95.position];
                    int tileGID1 = [self.bgLayer tileGIDAt:tileCoord1];
                    [self.bgLayer removeTileAt:tileCoord1];
                    [self.bgLayer setTileGID:(tileGID1 - 15) at:tileCoord1];
                    
                    id actionMove = [CCMoveTo actionWithDuration:0.3 position:sprite95Pos];
                    id actionMove2 = [CCAnimate actionWithAnimation:spriteIWalkLeft restoreOriginalFrame:NO];
                    
                    id actionMoveDone = [CCCallFuncN actionWithTarget:self selector:@selector(finishActionSprite95)];
                    
                    [self.sprite95 runAction:[CCSpawn actionOne:[CCSequence actions:actionMove,actionMoveDone,nil] two:actionMove2]];
                    return;
                }
            }
        }
    }
    [self finishActionSprite95];
}
-(void) moverightSprite95
{
    CGPoint sprite95Pos = self.sprite95.position;
    self.sprite95.orientation = 3;
    sprite95Pos.x += theHKMap.tileSize.width;
    
    CGPoint tileCoord = [self tileCoordForPosition:sprite95Pos];
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
                    [self.bgLayer setTileGID:(tileGID + 15) at:tileCoord];
                    CGPoint tileCoord1 = [self tileCoordForPosition:self.sprite95.position];
                    int tileGID1 = [self.bgLayer tileGIDAt:tileCoord1];
                    [self.bgLayer removeTileAt:tileCoord1];
                    [self.bgLayer setTileGID:(tileGID1 - 15) at:tileCoord1];
                    
                    id actionMove = [CCMoveTo actionWithDuration:0.3 position:sprite95Pos];
                    id actionMove2 = [CCAnimate actionWithAnimation:spriteIWalkRight restoreOriginalFrame:NO];
                    
                    id actionMoveDone = [CCCallFuncN actionWithTarget:self selector:@selector(finishActionSprite95)];
                    
                    [self.sprite95 runAction:[CCSpawn actionOne:[CCSequence actions:actionMove,actionMoveDone,nil] two:actionMove2]];
                    return;
                }
            }
        }
    }
    [self finishActionSprite95];
}
-(void) moveupSprite95
{
    CGPoint sprite95Pos = self.sprite95.position;
    self.sprite95.orientation = 2;
    sprite95Pos.y += theHKMap.tileSize.height;
    
    CGPoint tileCoord = [self tileCoordForPosition:sprite95Pos];
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
                    [self.bgLayer setTileGID:(tileGID + 15) at:tileCoord];
                    CGPoint tileCoord1 = [self tileCoordForPosition:self.sprite95.position];
                    int tileGID1 = [self.bgLayer tileGIDAt:tileCoord1];
                    [self.bgLayer removeTileAt:tileCoord1];
                    [self.bgLayer setTileGID:(tileGID1 - 15) at:tileCoord1];
                    
                    id actionMove = [CCMoveTo actionWithDuration:0.3 position:sprite95Pos];
                    id actionMove2 = [CCAnimate actionWithAnimation:spriteIWalkUp restoreOriginalFrame:NO];
                    
                    id actionMoveDone = [CCCallFuncN actionWithTarget:self selector:@selector(finishActionSprite95)];
                    
                    [self.sprite95 runAction:[CCSpawn actionOne:[CCSequence actions:actionMove,actionMoveDone,nil] two:actionMove2]];
                    return;
                }
            }
        }
    }
    [self finishActionSprite95];
}
-(void) movedownSprite95
{
    CGPoint sprite95Pos = self.sprite95.position;
    self.sprite95.orientation = 1;
    sprite95Pos.y -= theHKMap.tileSize.width;
    
    CGPoint tileCoord = [self tileCoordForPosition:sprite95Pos];
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
                    [self.bgLayer setTileGID:(tileGID + 15) at:tileCoord];
                    CGPoint tileCoord1 = [self tileCoordForPosition:self.sprite95.position];
                    int tileGID1 = [self.bgLayer tileGIDAt:tileCoord1];
                    [self.bgLayer removeTileAt:tileCoord1];
                    [self.bgLayer setTileGID:(tileGID1 - 15) at:tileCoord1];
                    
                    id actionMove = [CCMoveTo actionWithDuration:0.3 position:sprite95Pos];
                    id actionMove2 = [CCAnimate actionWithAnimation:spriteIWalkDown restoreOriginalFrame:NO];
                    
                    id actionMoveDone = [CCCallFuncN actionWithTarget:self selector:@selector(finishActionSprite95)];
                    
                    [self.sprite95 runAction:[CCSpawn actionOne:[CCSequence actions:actionMove,actionMoveDone,nil] two:actionMove2]];
                    return;
                }
            }
        }
    }
    [self finishActionSprite95];
}
-(void) finishActionSprite95
{
    if (self.sprite95.orientation == 1)
    {
        [self.sprite95 setDisplayFrame:[[spriteIWalkDown frames] objectAtIndex:0]];
    }
    else if (self.sprite95.orientation == 2)
    {
        [self.sprite95 setDisplayFrame:[[spriteIWalkUp frames] objectAtIndex:0]];
    }
    else if (self.sprite95.orientation == 3)
    {
        [self.sprite95 setDisplayFrame:[[spriteIWalkRight frames] objectAtIndex:0]];
    }
    else
    {
        [self.sprite95 setDisplayFrame:[[spriteIWalkLeft frames] objectAtIndex:0]];
    }
    self.hero.sprite95position = self.sprite95.position;
}
-(void) updateSprite96
{
    CGSize screenSize = [[CCDirector sharedDirector] winSize];
    int x = self.hero.position.x;
    int y = self.hero.position.y;
    
    int p = self.sprite96.position.x;
    int q = self.sprite96.position.y;
    
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
        [self moveleftSprite96];
    }
    if (rand == 2)
    {
        [self moverightSprite96];
    }
    if (rand == 3)
    {
        [self moveupSprite96];
    }
    if (rand == 4)
    {
        [self movedownSprite96];
    }
    return;
}

-(void) moveleftSprite96
{
    CGPoint sprite96Pos = self.sprite96.position;
    self.sprite96.orientation = 4;
    sprite96Pos.x -= theHKMap.tileSize.width;
    
    CGPoint tileCoord = [self tileCoordForPosition:sprite96Pos];
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
                    [self.bgLayer setTileGID:(tileGID + 16) at:tileCoord];
                    CGPoint tileCoord1 = [self tileCoordForPosition:self.sprite96.position];
                    int tileGID1 = [self.bgLayer tileGIDAt:tileCoord1];
                    [self.bgLayer removeTileAt:tileCoord1];
                    [self.bgLayer setTileGID:(tileGID1 - 16) at:tileCoord1];
                    
                    id actionMove = [CCMoveTo actionWithDuration:0.3 position:sprite96Pos];
                    id actionMove2 = [CCAnimate actionWithAnimation:spriteCWalkLeft restoreOriginalFrame:NO];
                    
                    id actionMoveDone = [CCCallFuncN actionWithTarget:self selector:@selector(finishActionSprite96)];
                    
                    [self.sprite96 runAction:[CCSpawn actionOne:[CCSequence actions:actionMove,actionMoveDone,nil] two:actionMove2]];
                    return;
                }
            }
        }
    }
    [self finishActionSprite96];
}
-(void) moverightSprite96
{
    CGPoint sprite96Pos = self.sprite96.position;
    self.sprite96.orientation = 3;
    sprite96Pos.x += theHKMap.tileSize.width;
    
    CGPoint tileCoord = [self tileCoordForPosition:sprite96Pos];
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
                    [self.bgLayer setTileGID:(tileGID + 16) at:tileCoord];
                    CGPoint tileCoord1 = [self tileCoordForPosition:self.sprite96.position];
                    int tileGID1 = [self.bgLayer tileGIDAt:tileCoord1];
                    [self.bgLayer removeTileAt:tileCoord1];
                    [self.bgLayer setTileGID:(tileGID1 - 16) at:tileCoord1];
                    
                    id actionMove = [CCMoveTo actionWithDuration:0.3 position:sprite96Pos];
                    id actionMove2 = [CCAnimate actionWithAnimation:spriteCWalkRight restoreOriginalFrame:NO];
                    
                    id actionMoveDone = [CCCallFuncN actionWithTarget:self selector:@selector(finishActionSprite96)];
                    
                    [self.sprite96 runAction:[CCSpawn actionOne:[CCSequence actions:actionMove,actionMoveDone,nil] two:actionMove2]];
                    return;
                }
            }
        }
    }
    [self finishActionSprite96];
}
-(void) moveupSprite96
{
    CGPoint sprite96Pos = self.sprite96.position;
    self.sprite96.orientation = 2;
    sprite96Pos.y += theHKMap.tileSize.height;
    
    CGPoint tileCoord = [self tileCoordForPosition:sprite96Pos];
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
                    [self.bgLayer setTileGID:(tileGID + 16) at:tileCoord];
                    CGPoint tileCoord1 = [self tileCoordForPosition:self.sprite96.position];
                    int tileGID1 = [self.bgLayer tileGIDAt:tileCoord1];
                    [self.bgLayer removeTileAt:tileCoord1];
                    [self.bgLayer setTileGID:(tileGID1 - 16) at:tileCoord1];
                    
                    id actionMove = [CCMoveTo actionWithDuration:0.3 position:sprite96Pos];
                    id actionMove2 = [CCAnimate actionWithAnimation:spriteCWalkUp restoreOriginalFrame:NO];
                    
                    id actionMoveDone = [CCCallFuncN actionWithTarget:self selector:@selector(finishActionSprite96)];
                    
                    [self.sprite96 runAction:[CCSpawn actionOne:[CCSequence actions:actionMove,actionMoveDone,nil] two:actionMove2]];
                    return;
                }
            }
        }
    }
    [self finishActionSprite96];
}
-(void) movedownSprite96
{
    CGPoint sprite96Pos = self.sprite96.position;
    self.sprite96.orientation = 1;
    sprite96Pos.y -= theHKMap.tileSize.width;
    
    CGPoint tileCoord = [self tileCoordForPosition:sprite96Pos];
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
                    [self.bgLayer setTileGID:(tileGID + 16) at:tileCoord];
                    CGPoint tileCoord1 = [self tileCoordForPosition:self.sprite96.position];
                    int tileGID1 = [self.bgLayer tileGIDAt:tileCoord1];
                    [self.bgLayer removeTileAt:tileCoord1];
                    [self.bgLayer setTileGID:(tileGID1 - 16) at:tileCoord1];
                    
                    id actionMove = [CCMoveTo actionWithDuration:0.3 position:sprite96Pos];
                    id actionMove2 = [CCAnimate actionWithAnimation:spriteCWalkDown restoreOriginalFrame:NO];
                    
                    id actionMoveDone = [CCCallFuncN actionWithTarget:self selector:@selector(finishActionSprite96)];
                    
                    [self.sprite96 runAction:[CCSpawn actionOne:[CCSequence actions:actionMove,actionMoveDone,nil] two:actionMove2]];
                    return;
                }
            }
        }
    }
    [self finishActionSprite96];
}
-(void) finishActionSprite96
{
    if (self.sprite96.orientation == 1)
    {
        [self.sprite96 setDisplayFrame:[[spriteCWalkDown frames] objectAtIndex:0]];
    }
    else if (self.sprite96.orientation == 2)
    {
        [self.sprite96 setDisplayFrame:[[spriteCWalkUp frames] objectAtIndex:0]];
    }
    else if (self.sprite96.orientation == 3)
    {
        [self.sprite96 setDisplayFrame:[[spriteCWalkRight frames] objectAtIndex:0]];
    }
    else
    {
        [self.sprite96 setDisplayFrame:[[spriteCWalkLeft frames] objectAtIndex:0]];
    }
    self.hero.sprite96position = self.sprite96.position;
}
-(void) updateSprite97
{
    CGSize screenSize = [[CCDirector sharedDirector] winSize];
    int x = self.hero.position.x;
    int y = self.hero.position.y;
    
    int p = self.sprite97.position.x;
    int q = self.sprite97.position.y;
    
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
        [self moveleftSprite97];
    }
    if (rand == 2)
    {
        [self moverightSprite97];
    }
    if (rand == 3)
    {
        [self moveupSprite97];
    }
    if (rand == 4)
    {
        [self movedownSprite97];
    }
    return;
}

-(void) moveleftSprite97
{
    CGPoint sprite97Pos = self.sprite97.position;
    self.sprite97.orientation = 4;
    sprite97Pos.x -= theHKMap.tileSize.width;
    
    CGPoint tileCoord = [self tileCoordForPosition:sprite97Pos];
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
                    [self.bgLayer setTileGID:(tileGID + 17) at:tileCoord];
                    CGPoint tileCoord1 = [self tileCoordForPosition:self.sprite97.position];
                    int tileGID1 = [self.bgLayer tileGIDAt:tileCoord1];
                    [self.bgLayer removeTileAt:tileCoord1];
                    [self.bgLayer setTileGID:(tileGID1 - 17) at:tileCoord1];
                    
                    id actionMove = [CCMoveTo actionWithDuration:0.3 position:sprite97Pos];
                    id actionMove2 = [CCAnimate actionWithAnimation:spriteNWalkLeft restoreOriginalFrame:NO];
                    
                    id actionMoveDone = [CCCallFuncN actionWithTarget:self selector:@selector(finishActionSprite97)];
                    
                    [self.sprite97 runAction:[CCSpawn actionOne:[CCSequence actions:actionMove,actionMoveDone,nil] two:actionMove2]];
                    return;
                }
            }
        }
    }
    [self finishActionSprite97];
}
-(void) moverightSprite97
{
    CGPoint sprite97Pos = self.sprite97.position;
    self.sprite97.orientation = 3;
    sprite97Pos.x += theHKMap.tileSize.width;
    
    CGPoint tileCoord = [self tileCoordForPosition:sprite97Pos];
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
                    [self.bgLayer setTileGID:(tileGID + 17) at:tileCoord];
                    CGPoint tileCoord1 = [self tileCoordForPosition:self.sprite97.position];
                    int tileGID1 = [self.bgLayer tileGIDAt:tileCoord1];
                    [self.bgLayer removeTileAt:tileCoord1];
                    [self.bgLayer setTileGID:(tileGID1 - 17) at:tileCoord1];
                    
                    id actionMove = [CCMoveTo actionWithDuration:0.3 position:sprite97Pos];
                    id actionMove2 = [CCAnimate actionWithAnimation:spriteNWalkRight restoreOriginalFrame:NO];
                    
                    id actionMoveDone = [CCCallFuncN actionWithTarget:self selector:@selector(finishActionSprite97)];
                    
                    [self.sprite97 runAction:[CCSpawn actionOne:[CCSequence actions:actionMove,actionMoveDone,nil] two:actionMove2]];
                    return;
                }
            }
        }
    }
    [self finishActionSprite97];
}
-(void) moveupSprite97
{
    CGPoint sprite97Pos = self.sprite97.position;
    self.sprite97.orientation = 2;
    sprite97Pos.y += theHKMap.tileSize.height;
    
    CGPoint tileCoord = [self tileCoordForPosition:sprite97Pos];
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
                    [self.bgLayer setTileGID:(tileGID + 17) at:tileCoord];
                    CGPoint tileCoord1 = [self tileCoordForPosition:self.sprite97.position];
                    int tileGID1 = [self.bgLayer tileGIDAt:tileCoord1];
                    [self.bgLayer removeTileAt:tileCoord1];
                    [self.bgLayer setTileGID:(tileGID1 - 17) at:tileCoord1];
                    
                    id actionMove = [CCMoveTo actionWithDuration:0.3 position:sprite97Pos];
                    id actionMove2 = [CCAnimate actionWithAnimation:spriteNWalkUp restoreOriginalFrame:NO];
                    
                    id actionMoveDone = [CCCallFuncN actionWithTarget:self selector:@selector(finishActionSprite97)];
                    
                    [self.sprite97 runAction:[CCSpawn actionOne:[CCSequence actions:actionMove,actionMoveDone,nil] two:actionMove2]];
                    return;
                }
            }
        }
    }
    [self finishActionSprite97];
}
-(void) movedownSprite97
{
    CGPoint sprite97Pos = self.sprite97.position;
    self.sprite97.orientation = 1;
    sprite97Pos.y -= theHKMap.tileSize.width;
    
    CGPoint tileCoord = [self tileCoordForPosition:sprite97Pos];
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
                    [self.bgLayer setTileGID:(tileGID + 17) at:tileCoord];
                    CGPoint tileCoord1 = [self tileCoordForPosition:self.sprite97.position];
                    int tileGID1 = [self.bgLayer tileGIDAt:tileCoord1];
                    [self.bgLayer removeTileAt:tileCoord1];
                    [self.bgLayer setTileGID:(tileGID1 - 17) at:tileCoord1];
                    
                    id actionMove = [CCMoveTo actionWithDuration:0.3 position:sprite97Pos];
                    id actionMove2 = [CCAnimate actionWithAnimation:spriteNWalkDown restoreOriginalFrame:NO];
                    
                    id actionMoveDone = [CCCallFuncN actionWithTarget:self selector:@selector(finishActionSprite97)];
                    
                    [self.sprite97 runAction:[CCSpawn actionOne:[CCSequence actions:actionMove,actionMoveDone,nil] two:actionMove2]];
                    return;
                }
            }
        }
    }
    [self finishActionSprite97];
}
-(void) finishActionSprite97
{
    if (self.sprite97.orientation == 1)
    {
        [self.sprite97 setDisplayFrame:[[spriteNWalkDown frames] objectAtIndex:0]];
    }
    else if (self.sprite97.orientation == 2)
    {
        [self.sprite97 setDisplayFrame:[[spriteNWalkUp frames] objectAtIndex:0]];
    }
    else if (self.sprite97.orientation == 3)
    {
        [self.sprite97 setDisplayFrame:[[spriteNWalkRight frames] objectAtIndex:0]];
    }
    else
    {
        [self.sprite97 setDisplayFrame:[[spriteNWalkLeft frames] objectAtIndex:0]];
    }
    self.hero.sprite97position = self.sprite97.position;
}
-(void) updateSprite98
{
    CGSize screenSize = [[CCDirector sharedDirector] winSize];
    int x = self.hero.position.x;
    int y = self.hero.position.y;
    
    int p = self.sprite98.position.x;
    int q = self.sprite98.position.y;
    
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
        [self moveleftSprite98];
    }
    if (rand == 2)
    {
        [self moverightSprite98];
    }
    if (rand == 3)
    {
        [self moveupSprite98];
    }
    if (rand == 4)
    {
        [self movedownSprite98];
    }
    return;
}

-(void) moveleftSprite98
{
    CGPoint sprite98Pos = self.sprite98.position;
    self.sprite98.orientation = 4;
    sprite98Pos.x -= theHKMap.tileSize.width;
    
    CGPoint tileCoord = [self tileCoordForPosition:sprite98Pos];
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
                    [self.bgLayer setTileGID:(tileGID + 18) at:tileCoord];
                    CGPoint tileCoord1 = [self tileCoordForPosition:self.sprite98.position];
                    int tileGID1 = [self.bgLayer tileGIDAt:tileCoord1];
                    [self.bgLayer removeTileAt:tileCoord1];
                    [self.bgLayer setTileGID:(tileGID1 - 18) at:tileCoord1];
                    
                    id actionMove = [CCMoveTo actionWithDuration:0.3 position:sprite98Pos];
                    id actionMove2 = [CCAnimate actionWithAnimation:spriteZBWalkLeft restoreOriginalFrame:NO];
                    
                    id actionMoveDone = [CCCallFuncN actionWithTarget:self selector:@selector(finishActionSprite98)];
                    
                    [self.sprite98 runAction:[CCSpawn actionOne:[CCSequence actions:actionMove,actionMoveDone,nil] two:actionMove2]];
                    return;
                }
            }
        }
    }
    [self finishActionSprite98];
}
-(void) moverightSprite98
{
    CGPoint sprite98Pos = self.sprite98.position;
    self.sprite98.orientation = 3;
    sprite98Pos.x += theHKMap.tileSize.width;
    
    CGPoint tileCoord = [self tileCoordForPosition:sprite98Pos];
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
                    [self.bgLayer setTileGID:(tileGID + 18) at:tileCoord];
                    CGPoint tileCoord1 = [self tileCoordForPosition:self.sprite98.position];
                    int tileGID1 = [self.bgLayer tileGIDAt:tileCoord1];
                    [self.bgLayer removeTileAt:tileCoord1];
                    [self.bgLayer setTileGID:(tileGID1 - 18) at:tileCoord1];
                    
                    id actionMove = [CCMoveTo actionWithDuration:0.3 position:sprite98Pos];
                    id actionMove2 = [CCAnimate actionWithAnimation:spriteZBWalkRight restoreOriginalFrame:NO];
                    
                    id actionMoveDone = [CCCallFuncN actionWithTarget:self selector:@selector(finishActionSprite98)];
                    
                    [self.sprite98 runAction:[CCSpawn actionOne:[CCSequence actions:actionMove,actionMoveDone,nil] two:actionMove2]];
                    return;
                }
            }
        }
    }
    [self finishActionSprite98];
}
-(void) moveupSprite98
{
    CGPoint sprite98Pos = self.sprite98.position;
    self.sprite98.orientation = 2;
    sprite98Pos.y += theHKMap.tileSize.height;
    
    CGPoint tileCoord = [self tileCoordForPosition:sprite98Pos];
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
                    [self.bgLayer setTileGID:(tileGID + 18) at:tileCoord];
                    CGPoint tileCoord1 = [self tileCoordForPosition:self.sprite98.position];
                    int tileGID1 = [self.bgLayer tileGIDAt:tileCoord1];
                    [self.bgLayer removeTileAt:tileCoord1];
                    [self.bgLayer setTileGID:(tileGID1 - 18) at:tileCoord1];
                    
                    id actionMove = [CCMoveTo actionWithDuration:0.3 position:sprite98Pos];
                    id actionMove2 = [CCAnimate actionWithAnimation:spriteZBWalkUp restoreOriginalFrame:NO];
                    
                    id actionMoveDone = [CCCallFuncN actionWithTarget:self selector:@selector(finishActionSprite98)];
                    
                    [self.sprite98 runAction:[CCSpawn actionOne:[CCSequence actions:actionMove,actionMoveDone,nil] two:actionMove2]];
                    return;
                }
            }
        }
    }
    [self finishActionSprite98];
}
-(void) movedownSprite98
{
    CGPoint sprite98Pos = self.sprite98.position;
    self.sprite98.orientation = 1;
    sprite98Pos.y -= theHKMap.tileSize.width;
    
    CGPoint tileCoord = [self tileCoordForPosition:sprite98Pos];
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
                    [self.bgLayer setTileGID:(tileGID + 18) at:tileCoord];
                    CGPoint tileCoord1 = [self tileCoordForPosition:self.sprite98.position];
                    int tileGID1 = [self.bgLayer tileGIDAt:tileCoord1];
                    [self.bgLayer removeTileAt:tileCoord1];
                    [self.bgLayer setTileGID:(tileGID1 - 18) at:tileCoord1];
                    
                    id actionMove = [CCMoveTo actionWithDuration:0.3 position:sprite98Pos];
                    id actionMove2 = [CCAnimate actionWithAnimation:spriteZBWalkDown restoreOriginalFrame:NO];
                    
                    id actionMoveDone = [CCCallFuncN actionWithTarget:self selector:@selector(finishActionSprite98)];
                    
                    [self.sprite98 runAction:[CCSpawn actionOne:[CCSequence actions:actionMove,actionMoveDone,nil] two:actionMove2]];
                    return;
                }
            }
        }
    }
    [self finishActionSprite98];
}
-(void) finishActionSprite98
{
    if (self.sprite98.orientation == 1)
    {
        [self.sprite98 setDisplayFrame:[[spriteZBWalkDown frames] objectAtIndex:0]];
    }
    else if (self.sprite98.orientation == 2)
    {
        [self.sprite98 setDisplayFrame:[[spriteZBWalkUp frames] objectAtIndex:0]];
    }
    else if (self.sprite98.orientation == 3)
    {
        [self.sprite98 setDisplayFrame:[[spriteZBWalkRight frames] objectAtIndex:0]];
    }
    else
    {
        [self.sprite98 setDisplayFrame:[[spriteZBWalkLeft frames] objectAtIndex:0]];
    }
    self.hero.sprite98position = self.sprite98.position;
}
-(void) updateSprite99
{
    CGSize screenSize = [[CCDirector sharedDirector] winSize];
    int x = self.hero.position.x;
    int y = self.hero.position.y;
    
    int p = self.sprite99.position.x;
    int q = self.sprite99.position.y;
    
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
        [self moveleftSprite99];
    }
    if (rand == 2)
    {
        [self moverightSprite99];
    }
    if (rand == 3)
    {
        [self moveupSprite99];
    }
    if (rand == 4)
    {
        [self movedownSprite99];
    }
    return;
}

-(void) moveleftSprite99
{
    CGPoint sprite99Pos = self.sprite99.position;
    self.sprite99.orientation = 4;
    sprite99Pos.x -= theHKMap.tileSize.width;
    
    CGPoint tileCoord = [self tileCoordForPosition:sprite99Pos];
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
                    [self.bgLayer setTileGID:(tileGID + 19) at:tileCoord];
                    CGPoint tileCoord1 = [self tileCoordForPosition:self.sprite99.position];
                    int tileGID1 = [self.bgLayer tileGIDAt:tileCoord1];
                    [self.bgLayer removeTileAt:tileCoord1];
                    [self.bgLayer setTileGID:(tileGID1 - 19) at:tileCoord1];
                    
                    id actionMove = [CCMoveTo actionWithDuration:0.3 position:sprite99Pos];
                    id actionMove2 = [CCAnimate actionWithAnimation:spriteWWalkLeft restoreOriginalFrame:NO];
                    
                    id actionMoveDone = [CCCallFuncN actionWithTarget:self selector:@selector(finishActionSprite99)];
                    
                    [self.sprite99 runAction:[CCSpawn actionOne:[CCSequence actions:actionMove,actionMoveDone,nil] two:actionMove2]];
                    return;
                }
            }
        }
    }
    [self finishActionSprite99];
}
-(void) moverightSprite99
{
    CGPoint sprite99Pos = self.sprite99.position;
    self.sprite99.orientation = 3;
    sprite99Pos.x += theHKMap.tileSize.width;
    
    CGPoint tileCoord = [self tileCoordForPosition:sprite99Pos];
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
                    [self.bgLayer setTileGID:(tileGID + 19) at:tileCoord];
                    CGPoint tileCoord1 = [self tileCoordForPosition:self.sprite99.position];
                    int tileGID1 = [self.bgLayer tileGIDAt:tileCoord1];
                    [self.bgLayer removeTileAt:tileCoord1];
                    [self.bgLayer setTileGID:(tileGID1 - 19) at:tileCoord1];
                    
                    id actionMove = [CCMoveTo actionWithDuration:0.3 position:sprite99Pos];
                    id actionMove2 = [CCAnimate actionWithAnimation:spriteWWalkRight restoreOriginalFrame:NO];
                    
                    id actionMoveDone = [CCCallFuncN actionWithTarget:self selector:@selector(finishActionSprite99)];
                    
                    [self.sprite99 runAction:[CCSpawn actionOne:[CCSequence actions:actionMove,actionMoveDone,nil] two:actionMove2]];
                    return;
                }
            }
        }
    }
    [self finishActionSprite99];
}
-(void) moveupSprite99
{
    CGPoint sprite99Pos = self.sprite99.position;
    self.sprite99.orientation = 2;
    sprite99Pos.y += theHKMap.tileSize.height;
    
    CGPoint tileCoord = [self tileCoordForPosition:sprite99Pos];
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
                    [self.bgLayer setTileGID:(tileGID + 19) at:tileCoord];
                    CGPoint tileCoord1 = [self tileCoordForPosition:self.sprite99.position];
                    int tileGID1 = [self.bgLayer tileGIDAt:tileCoord1];
                    [self.bgLayer removeTileAt:tileCoord1];
                    [self.bgLayer setTileGID:(tileGID1 - 19) at:tileCoord1];
                    
                    id actionMove = [CCMoveTo actionWithDuration:0.3 position:sprite99Pos];
                    id actionMove2 = [CCAnimate actionWithAnimation:spriteWWalkUp restoreOriginalFrame:NO];
                    
                    id actionMoveDone = [CCCallFuncN actionWithTarget:self selector:@selector(finishActionSprite99)];
                    
                    [self.sprite99 runAction:[CCSpawn actionOne:[CCSequence actions:actionMove,actionMoveDone,nil] two:actionMove2]];
                    return;
                }
            }
        }
    }
    [self finishActionSprite99];
}
-(void) movedownSprite99
{
    CGPoint sprite99Pos = self.sprite99.position;
    self.sprite99.orientation = 1;
    sprite99Pos.y -= theHKMap.tileSize.width;
    
    CGPoint tileCoord = [self tileCoordForPosition:sprite99Pos];
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
                    [self.bgLayer setTileGID:(tileGID + 19) at:tileCoord];
                    CGPoint tileCoord1 = [self tileCoordForPosition:self.sprite99.position];
                    int tileGID1 = [self.bgLayer tileGIDAt:tileCoord1];
                    [self.bgLayer removeTileAt:tileCoord1];
                    [self.bgLayer setTileGID:(tileGID1 - 19) at:tileCoord1];
                    
                    id actionMove = [CCMoveTo actionWithDuration:0.3 position:sprite99Pos];
                    id actionMove2 = [CCAnimate actionWithAnimation:spriteWWalkDown restoreOriginalFrame:NO];
                    
                    id actionMoveDone = [CCCallFuncN actionWithTarget:self selector:@selector(finishActionSprite99)];
                    
                    [self.sprite99 runAction:[CCSpawn actionOne:[CCSequence actions:actionMove,actionMoveDone,nil] two:actionMove2]];
                    return;
                }
            }
        }
    }
    [self finishActionSprite99];
}
-(void) finishActionSprite99
{
    if (self.sprite99.orientation == 1)
    {
        [self.sprite99 setDisplayFrame:[[spriteWWalkDown frames] objectAtIndex:0]];
    }
    else if (self.sprite99.orientation == 2)
    {
        [self.sprite99 setDisplayFrame:[[spriteWWalkUp frames] objectAtIndex:0]];
    }
    else if (self.sprite99.orientation == 3)
    {
        [self.sprite99 setDisplayFrame:[[spriteWWalkRight frames] objectAtIndex:0]];
    }
    else
    {
        [self.sprite99 setDisplayFrame:[[spriteWWalkLeft frames] objectAtIndex:0]];
    }
    self.hero.sprite99position = self.sprite99.position;
}
-(void) updateSprite100
{
    CGSize screenSize = [[CCDirector sharedDirector] winSize];
    int x = self.hero.position.x;
    int y = self.hero.position.y;
    
    int p = self.sprite100.position.x;
    int q = self.sprite100.position.y;
    
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
        [self moveleftSprite100];
    }
    if (rand == 2)
    {
        [self moverightSprite100];
    }
    if (rand == 3)
    {
        [self moveupSprite100];
    }
    if (rand == 4)
    {
        [self movedownSprite100];
    }
    return;
}

-(void) moveleftSprite100
{
    CGPoint sprite100Pos = self.sprite100.position;
    self.sprite100.orientation = 4;
    sprite100Pos.x -= theHKMap.tileSize.width;
    
    CGPoint tileCoord = [self tileCoordForPosition:sprite100Pos];
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
                    [self.bgLayer setTileGID:(tileGID + 20) at:tileCoord];
                    CGPoint tileCoord1 = [self tileCoordForPosition:self.sprite100.position];
                    int tileGID1 = [self.bgLayer tileGIDAt:tileCoord1];
                    [self.bgLayer removeTileAt:tileCoord1];
                    [self.bgLayer setTileGID:(tileGID1 - 20) at:tileCoord1];
                    
                    id actionMove = [CCMoveTo actionWithDuration:0.3 position:sprite100Pos];
                    id actionMove2 = [CCAnimate actionWithAnimation:spriteYWalkLeft restoreOriginalFrame:NO];
                    
                    id actionMoveDone = [CCCallFuncN actionWithTarget:self selector:@selector(finishActionSprite100)];
                    
                    [self.sprite100 runAction:[CCSpawn actionOne:[CCSequence actions:actionMove,actionMoveDone,nil] two:actionMove2]];
                    return;
                }
            }
        }
    }
    [self finishActionSprite100];
}
-(void) moverightSprite100
{
    CGPoint sprite100Pos = self.sprite100.position;
    self.sprite100.orientation = 3;
    sprite100Pos.x += theHKMap.tileSize.width;
    
    CGPoint tileCoord = [self tileCoordForPosition:sprite100Pos];
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
                    [self.bgLayer setTileGID:(tileGID + 20) at:tileCoord];
                    CGPoint tileCoord1 = [self tileCoordForPosition:self.sprite100.position];
                    int tileGID1 = [self.bgLayer tileGIDAt:tileCoord1];
                    [self.bgLayer removeTileAt:tileCoord1];
                    [self.bgLayer setTileGID:(tileGID1 - 20) at:tileCoord1];
                    
                    id actionMove = [CCMoveTo actionWithDuration:0.3 position:sprite100Pos];
                    id actionMove2 = [CCAnimate actionWithAnimation:spriteYWalkRight restoreOriginalFrame:NO];
                    
                    id actionMoveDone = [CCCallFuncN actionWithTarget:self selector:@selector(finishActionSprite100)];
                    
                    [self.sprite100 runAction:[CCSpawn actionOne:[CCSequence actions:actionMove,actionMoveDone,nil] two:actionMove2]];
                    return;
                }
            }
        }
    }
    [self finishActionSprite100];
}
-(void) moveupSprite100
{
    CGPoint sprite100Pos = self.sprite100.position;
    self.sprite100.orientation = 2;
    sprite100Pos.y += theHKMap.tileSize.height;
    
    CGPoint tileCoord = [self tileCoordForPosition:sprite100Pos];
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
                    [self.bgLayer setTileGID:(tileGID + 20) at:tileCoord];
                    CGPoint tileCoord1 = [self tileCoordForPosition:self.sprite100.position];
                    int tileGID1 = [self.bgLayer tileGIDAt:tileCoord1];
                    [self.bgLayer removeTileAt:tileCoord1];
                    [self.bgLayer setTileGID:(tileGID1 - 20) at:tileCoord1];
                    
                    id actionMove = [CCMoveTo actionWithDuration:0.3 position:sprite100Pos];
                    id actionMove2 = [CCAnimate actionWithAnimation:spriteYWalkUp restoreOriginalFrame:NO];
                    
                    id actionMoveDone = [CCCallFuncN actionWithTarget:self selector:@selector(finishActionSprite100)];
                    
                    [self.sprite100 runAction:[CCSpawn actionOne:[CCSequence actions:actionMove,actionMoveDone,nil] two:actionMove2]];
                    return;
                }
            }
        }
    }
    [self finishActionSprite100];
}
-(void) movedownSprite100
{
    CGPoint sprite100Pos = self.sprite100.position;
    self.sprite100.orientation = 1;
    sprite100Pos.y -= theHKMap.tileSize.width;
    
    CGPoint tileCoord = [self tileCoordForPosition:sprite100Pos];
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
                    [self.bgLayer setTileGID:(tileGID + 20) at:tileCoord];
                    CGPoint tileCoord1 = [self tileCoordForPosition:self.sprite100.position];
                    int tileGID1 = [self.bgLayer tileGIDAt:tileCoord1];
                    [self.bgLayer removeTileAt:tileCoord1];
                    [self.bgLayer setTileGID:(tileGID1 - 20) at:tileCoord1];
                    
                    id actionMove = [CCMoveTo actionWithDuration:0.3 position:sprite100Pos];
                    id actionMove2 = [CCAnimate actionWithAnimation:spriteYWalkDown restoreOriginalFrame:NO];
                    
                    id actionMoveDone = [CCCallFuncN actionWithTarget:self selector:@selector(finishActionSprite100)];
                    
                    [self.sprite100 runAction:[CCSpawn actionOne:[CCSequence actions:actionMove,actionMoveDone,nil] two:actionMove2]];
                    return;
                }
            }
        }
    }
    [self finishActionSprite100];
}
-(void) finishActionSprite100
{
    if (self.sprite100.orientation == 1)
    {
        [self.sprite100 setDisplayFrame:[[spriteYWalkDown frames] objectAtIndex:0]];
    }
    else if (self.sprite100.orientation == 2)
    {
        [self.sprite100 setDisplayFrame:[[spriteYWalkUp frames] objectAtIndex:0]];
    }
    else if (self.sprite100.orientation == 3)
    {
        [self.sprite100 setDisplayFrame:[[spriteYWalkRight frames] objectAtIndex:0]];
    }
    else
    {
        [self.sprite100 setDisplayFrame:[[spriteYWalkLeft frames] objectAtIndex:0]];
    }
    self.hero.sprite100position = self.sprite100.position;
}
-(void) updateSprite101
{
    CGSize screenSize = [[CCDirector sharedDirector] winSize];
    int x = self.hero.position.x;
    int y = self.hero.position.y;
    
    int p = self.sprite101.position.x;
    int q = self.sprite101.position.y;
    
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
        [self moveleftSprite101];
    }
    if (rand == 2)
    {
        [self moverightSprite101];
    }
    if (rand == 3)
    {
        [self moveupSprite101];
    }
    if (rand == 4)
    {
        [self movedownSprite101];
    }
    return;
}

-(void) moveleftSprite101
{
    CGPoint sprite101Pos = self.sprite101.position;
    self.sprite101.orientation = 4;
    sprite101Pos.x -= theHKMap.tileSize.width;
    
    CGPoint tileCoord = [self tileCoordForPosition:sprite101Pos];
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
                    [self.bgLayer setTileGID:(tileGID + 21) at:tileCoord];
                    CGPoint tileCoord1 = [self tileCoordForPosition:self.sprite101.position];
                    int tileGID1 = [self.bgLayer tileGIDAt:tileCoord1];
                    [self.bgLayer removeTileAt:tileCoord1];
                    [self.bgLayer setTileGID:(tileGID1 - 21) at:tileCoord1];
                    
                    id actionMove = [CCMoveTo actionWithDuration:0.3 position:sprite101Pos];
                    id actionMove2 = [CCAnimate actionWithAnimation:spriteYWalkLeft restoreOriginalFrame:NO];
                    
                    id actionMoveDone = [CCCallFuncN actionWithTarget:self selector:@selector(finishActionSprite101)];
                    
                    [self.sprite101 runAction:[CCSpawn actionOne:[CCSequence actions:actionMove,actionMoveDone,nil] two:actionMove2]];
                    return;
                }
            }
        }
    }
    [self finishActionSprite101];
}
-(void) moverightSprite101
{
    CGPoint sprite101Pos = self.sprite101.position;
    self.sprite101.orientation = 3;
    sprite101Pos.x += theHKMap.tileSize.width;
    
    CGPoint tileCoord = [self tileCoordForPosition:sprite101Pos];
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
                    [self.bgLayer setTileGID:(tileGID + 21) at:tileCoord];
                    CGPoint tileCoord1 = [self tileCoordForPosition:self.sprite101.position];
                    int tileGID1 = [self.bgLayer tileGIDAt:tileCoord1];
                    [self.bgLayer removeTileAt:tileCoord1];
                    [self.bgLayer setTileGID:(tileGID1 - 21) at:tileCoord1];
                    
                    id actionMove = [CCMoveTo actionWithDuration:0.3 position:sprite101Pos];
                    id actionMove2 = [CCAnimate actionWithAnimation:spriteYWalkRight restoreOriginalFrame:NO];
                    
                    id actionMoveDone = [CCCallFuncN actionWithTarget:self selector:@selector(finishActionSprite101)];
                    
                    [self.sprite101 runAction:[CCSpawn actionOne:[CCSequence actions:actionMove,actionMoveDone,nil] two:actionMove2]];
                    return;
                }
            }
        }
    }
    [self finishActionSprite101];
}
-(void) moveupSprite101
{
    CGPoint sprite101Pos = self.sprite101.position;
    self.sprite101.orientation = 2;
    sprite101Pos.y += theHKMap.tileSize.height;
    
    CGPoint tileCoord = [self tileCoordForPosition:sprite101Pos];
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
                    [self.bgLayer setTileGID:(tileGID + 21) at:tileCoord];
                    CGPoint tileCoord1 = [self tileCoordForPosition:self.sprite101.position];
                    int tileGID1 = [self.bgLayer tileGIDAt:tileCoord1];
                    [self.bgLayer removeTileAt:tileCoord1];
                    [self.bgLayer setTileGID:(tileGID1 - 21) at:tileCoord1];
                    
                    id actionMove = [CCMoveTo actionWithDuration:0.3 position:sprite101Pos];
                    id actionMove2 = [CCAnimate actionWithAnimation:spriteYWalkUp restoreOriginalFrame:NO];
                    
                    id actionMoveDone = [CCCallFuncN actionWithTarget:self selector:@selector(finishActionSprite101)];
                    
                    [self.sprite101 runAction:[CCSpawn actionOne:[CCSequence actions:actionMove,actionMoveDone,nil] two:actionMove2]];
                    return;
                }
            }
        }
    }
    [self finishActionSprite101];
}
-(void) movedownSprite101
{
    CGPoint sprite101Pos = self.sprite101.position;
    self.sprite101.orientation = 1;
    sprite101Pos.y -= theHKMap.tileSize.width;
    
    CGPoint tileCoord = [self tileCoordForPosition:sprite101Pos];
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
                    [self.bgLayer setTileGID:(tileGID + 21) at:tileCoord];
                    CGPoint tileCoord1 = [self tileCoordForPosition:self.sprite101.position];
                    int tileGID1 = [self.bgLayer tileGIDAt:tileCoord1];
                    [self.bgLayer removeTileAt:tileCoord1];
                    [self.bgLayer setTileGID:(tileGID1 - 21) at:tileCoord1];
                    
                    id actionMove = [CCMoveTo actionWithDuration:0.3 position:sprite101Pos];
                    id actionMove2 = [CCAnimate actionWithAnimation:spriteYWalkDown restoreOriginalFrame:NO];
                    
                    id actionMoveDone = [CCCallFuncN actionWithTarget:self selector:@selector(finishActionSprite101)];
                    
                    [self.sprite101 runAction:[CCSpawn actionOne:[CCSequence actions:actionMove,actionMoveDone,nil] two:actionMove2]];
                    return;
                }
            }
        }
    }
    [self finishActionSprite101];
}
-(void) finishActionSprite101
{
    if (self.sprite101.orientation == 1)
    {
        [self.sprite101 setDisplayFrame:[[spriteYWalkDown frames] objectAtIndex:0]];
    }
    else if (self.sprite101.orientation == 2)
    {
        [self.sprite101 setDisplayFrame:[[spriteYWalkUp frames] objectAtIndex:0]];
    }
    else if (self.sprite101.orientation == 3)
    {
        [self.sprite101 setDisplayFrame:[[spriteYWalkRight frames] objectAtIndex:0]];
    }
    else
    {
        [self.sprite101 setDisplayFrame:[[spriteYWalkLeft frames] objectAtIndex:0]];
    }
    self.hero.sprite101position = self.sprite101.position;
}
-(void) updateSprite102
{
    CGSize screenSize = [[CCDirector sharedDirector] winSize];
    int x = self.hero.position.x;
    int y = self.hero.position.y;
    
    int p = self.sprite102.position.x;
    int q = self.sprite102.position.y;
    
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
        [self moveleftSprite102];
    }
    if (rand == 2)
    {
        [self moverightSprite102];
    }
    if (rand == 3)
    {
        [self moveupSprite102];
    }
    if (rand == 4)
    {
        [self movedownSprite102];
    }
    return;
}

-(void) moveleftSprite102
{
    CGPoint sprite102Pos = self.sprite102.position;
    self.sprite102.orientation = 4;
    sprite102Pos.x -= theHKMap.tileSize.width;
    
    CGPoint tileCoord = [self tileCoordForPosition:sprite102Pos];
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
                    [self.bgLayer setTileGID:(tileGID + 22) at:tileCoord];
                    CGPoint tileCoord1 = [self tileCoordForPosition:self.sprite102.position];
                    int tileGID1 = [self.bgLayer tileGIDAt:tileCoord1];
                    [self.bgLayer removeTileAt:tileCoord1];
                    [self.bgLayer setTileGID:(tileGID1 - 22) at:tileCoord1];
                    
                    id actionMove = [CCMoveTo actionWithDuration:0.3 position:sprite102Pos];
                    id actionMove2 = [CCAnimate actionWithAnimation:spriteZAWalkLeft restoreOriginalFrame:NO];
                    
                    id actionMoveDone = [CCCallFuncN actionWithTarget:self selector:@selector(finishActionSprite102)];
                    
                    [self.sprite102 runAction:[CCSpawn actionOne:[CCSequence actions:actionMove,actionMoveDone,nil] two:actionMove2]];
                    return;
                }
            }
        }
    }
    [self finishActionSprite102];
}
-(void) moverightSprite102
{
    CGPoint sprite102Pos = self.sprite102.position;
    self.sprite102.orientation = 3;
    sprite102Pos.x += theHKMap.tileSize.width;
    
    CGPoint tileCoord = [self tileCoordForPosition:sprite102Pos];
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
                    [self.bgLayer setTileGID:(tileGID + 22) at:tileCoord];
                    CGPoint tileCoord1 = [self tileCoordForPosition:self.sprite102.position];
                    int tileGID1 = [self.bgLayer tileGIDAt:tileCoord1];
                    [self.bgLayer removeTileAt:tileCoord1];
                    [self.bgLayer setTileGID:(tileGID1 - 22) at:tileCoord1];
                    
                    id actionMove = [CCMoveTo actionWithDuration:0.3 position:sprite102Pos];
                    id actionMove2 = [CCAnimate actionWithAnimation:spriteZAWalkRight restoreOriginalFrame:NO];
                    
                    id actionMoveDone = [CCCallFuncN actionWithTarget:self selector:@selector(finishActionSprite102)];
                    
                    [self.sprite102 runAction:[CCSpawn actionOne:[CCSequence actions:actionMove,actionMoveDone,nil] two:actionMove2]];
                    return;
                }
            }
        }
    }
    [self finishActionSprite102];
}
-(void) moveupSprite102
{
    CGPoint sprite102Pos = self.sprite102.position;
    self.sprite102.orientation = 2;
    sprite102Pos.y += theHKMap.tileSize.height;
    
    CGPoint tileCoord = [self tileCoordForPosition:sprite102Pos];
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
                    [self.bgLayer setTileGID:(tileGID + 22) at:tileCoord];
                    CGPoint tileCoord1 = [self tileCoordForPosition:self.sprite102.position];
                    int tileGID1 = [self.bgLayer tileGIDAt:tileCoord1];
                    [self.bgLayer removeTileAt:tileCoord1];
                    [self.bgLayer setTileGID:(tileGID1 - 22) at:tileCoord1];
                    
                    id actionMove = [CCMoveTo actionWithDuration:0.3 position:sprite102Pos];
                    id actionMove2 = [CCAnimate actionWithAnimation:spriteZAWalkUp restoreOriginalFrame:NO];
                    
                    id actionMoveDone = [CCCallFuncN actionWithTarget:self selector:@selector(finishActionSprite102)];
                    
                    [self.sprite102 runAction:[CCSpawn actionOne:[CCSequence actions:actionMove,actionMoveDone,nil] two:actionMove2]];
                    return;
                }
            }
        }
    }
    [self finishActionSprite102];
}
-(void) movedownSprite102
{
    CGPoint sprite102Pos = self.sprite102.position;
    self.sprite102.orientation = 1;
    sprite102Pos.y -= theHKMap.tileSize.width;
    
    CGPoint tileCoord = [self tileCoordForPosition:sprite102Pos];
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
                    [self.bgLayer setTileGID:(tileGID + 22) at:tileCoord];
                    CGPoint tileCoord1 = [self tileCoordForPosition:self.sprite102.position];
                    int tileGID1 = [self.bgLayer tileGIDAt:tileCoord1];
                    [self.bgLayer removeTileAt:tileCoord1];
                    [self.bgLayer setTileGID:(tileGID1 - 22) at:tileCoord1];
                    
                    id actionMove = [CCMoveTo actionWithDuration:0.3 position:sprite102Pos];
                    id actionMove2 = [CCAnimate actionWithAnimation:spriteZAWalkDown restoreOriginalFrame:NO];
                    
                    id actionMoveDone = [CCCallFuncN actionWithTarget:self selector:@selector(finishActionSprite102)];
                    
                    [self.sprite102 runAction:[CCSpawn actionOne:[CCSequence actions:actionMove,actionMoveDone,nil] two:actionMove2]];
                    return;
                }
            }
        }
    }
    [self finishActionSprite102];
}
-(void) finishActionSprite102
{
    if (self.sprite102.orientation == 1)
    {
        [self.sprite102 setDisplayFrame:[[spriteZAWalkDown frames] objectAtIndex:0]];
    }
    else if (self.sprite102.orientation == 2)
    {
        [self.sprite102 setDisplayFrame:[[spriteZAWalkUp frames] objectAtIndex:0]];
    }
    else if (self.sprite102.orientation == 3)
    {
        [self.sprite102 setDisplayFrame:[[spriteZAWalkRight frames] objectAtIndex:0]];
    }
    else
    {
        [self.sprite102 setDisplayFrame:[[spriteZAWalkLeft frames] objectAtIndex:0]];
    }
    self.hero.sprite102position = self.sprite102.position;
}
-(void) updateSprite103
{
    CGSize screenSize = [[CCDirector sharedDirector] winSize];
    int x = self.hero.position.x;
    int y = self.hero.position.y;
    
    int p = self.sprite103.position.x;
    int q = self.sprite103.position.y;
    
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
        [self moveleftSprite103];
    }
    if (rand == 2)
    {
        [self moverightSprite103];
    }
    if (rand == 3)
    {
        [self moveupSprite103];
    }
    if (rand == 4)
    {
        [self movedownSprite103];
    }
    return;
}

-(void) moveleftSprite103
{
    CGPoint sprite103Pos = self.sprite103.position;
    self.sprite103.orientation = 4;
    sprite103Pos.x -= theHKMap.tileSize.width;
    
    CGPoint tileCoord = [self tileCoordForPosition:sprite103Pos];
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
                    [self.bgLayer setTileGID:(tileGID + 23) at:tileCoord];
                    CGPoint tileCoord1 = [self tileCoordForPosition:self.sprite103.position];
                    int tileGID1 = [self.bgLayer tileGIDAt:tileCoord1];
                    [self.bgLayer removeTileAt:tileCoord1];
                    [self.bgLayer setTileGID:(tileGID1 - 23) at:tileCoord1];
                    
                    id actionMove = [CCMoveTo actionWithDuration:0.3 position:sprite103Pos];
                    id actionMove2 = [CCAnimate actionWithAnimation:spriteTWalkLeft restoreOriginalFrame:NO];
                    
                    id actionMoveDone = [CCCallFuncN actionWithTarget:self selector:@selector(finishActionSprite103)];
                    
                    [self.sprite103 runAction:[CCSpawn actionOne:[CCSequence actions:actionMove,actionMoveDone,nil] two:actionMove2]];
                    return;
                }
            }
        }
    }
    [self finishActionSprite103];
}
-(void) moverightSprite103
{
    CGPoint sprite103Pos = self.sprite103.position;
    self.sprite103.orientation = 3;
    sprite103Pos.x += theHKMap.tileSize.width;
    
    CGPoint tileCoord = [self tileCoordForPosition:sprite103Pos];
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
                    [self.bgLayer setTileGID:(tileGID + 23) at:tileCoord];
                    CGPoint tileCoord1 = [self tileCoordForPosition:self.sprite103.position];
                    int tileGID1 = [self.bgLayer tileGIDAt:tileCoord1];
                    [self.bgLayer removeTileAt:tileCoord1];
                    [self.bgLayer setTileGID:(tileGID1 - 23) at:tileCoord1];
                    
                    id actionMove = [CCMoveTo actionWithDuration:0.3 position:sprite103Pos];
                    id actionMove2 = [CCAnimate actionWithAnimation:spriteTWalkRight restoreOriginalFrame:NO];
                    
                    id actionMoveDone = [CCCallFuncN actionWithTarget:self selector:@selector(finishActionSprite103)];
                    
                    [self.sprite103 runAction:[CCSpawn actionOne:[CCSequence actions:actionMove,actionMoveDone,nil] two:actionMove2]];
                    return;
                }
            }
        }
    }
    [self finishActionSprite103];
}
-(void) moveupSprite103
{
    CGPoint sprite103Pos = self.sprite103.position;
    self.sprite103.orientation = 2;
    sprite103Pos.y += theHKMap.tileSize.height;
    
    CGPoint tileCoord = [self tileCoordForPosition:sprite103Pos];
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
                    [self.bgLayer setTileGID:(tileGID + 23) at:tileCoord];
                    CGPoint tileCoord1 = [self tileCoordForPosition:self.sprite103.position];
                    int tileGID1 = [self.bgLayer tileGIDAt:tileCoord1];
                    [self.bgLayer removeTileAt:tileCoord1];
                    [self.bgLayer setTileGID:(tileGID1 - 23) at:tileCoord1];
                    
                    id actionMove = [CCMoveTo actionWithDuration:0.3 position:sprite103Pos];
                    id actionMove2 = [CCAnimate actionWithAnimation:spriteTWalkUp restoreOriginalFrame:NO];
                    
                    id actionMoveDone = [CCCallFuncN actionWithTarget:self selector:@selector(finishActionSprite103)];
                    
                    [self.sprite103 runAction:[CCSpawn actionOne:[CCSequence actions:actionMove,actionMoveDone,nil] two:actionMove2]];
                    return;
                }
            }
        }
    }
    [self finishActionSprite103];
}
-(void) movedownSprite103
{
    CGPoint sprite103Pos = self.sprite103.position;
    self.sprite103.orientation = 1;
    sprite103Pos.y -= theHKMap.tileSize.width;
    
    CGPoint tileCoord = [self tileCoordForPosition:sprite103Pos];
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
                    [self.bgLayer setTileGID:(tileGID + 23) at:tileCoord];
                    CGPoint tileCoord1 = [self tileCoordForPosition:self.sprite103.position];
                    int tileGID1 = [self.bgLayer tileGIDAt:tileCoord1];
                    [self.bgLayer removeTileAt:tileCoord1];
                    [self.bgLayer setTileGID:(tileGID1 - 23) at:tileCoord1];
                    
                    id actionMove = [CCMoveTo actionWithDuration:0.3 position:sprite103Pos];
                    id actionMove2 = [CCAnimate actionWithAnimation:spriteTWalkDown restoreOriginalFrame:NO];
                    
                    id actionMoveDone = [CCCallFuncN actionWithTarget:self selector:@selector(finishActionSprite103)];
                    
                    [self.sprite103 runAction:[CCSpawn actionOne:[CCSequence actions:actionMove,actionMoveDone,nil] two:actionMove2]];
                    return;
                }
            }
        }
    }
    [self finishActionSprite103];
}
-(void) finishActionSprite103
{
    if (self.sprite103.orientation == 1)
    {
        [self.sprite103 setDisplayFrame:[[spriteTWalkDown frames] objectAtIndex:0]];
    }
    else if (self.sprite103.orientation == 2)
    {
        [self.sprite103 setDisplayFrame:[[spriteTWalkUp frames] objectAtIndex:0]];
    }
    else if (self.sprite103.orientation == 3)
    {
        [self.sprite103 setDisplayFrame:[[spriteTWalkRight frames] objectAtIndex:0]];
    }
    else
    {
        [self.sprite103 setDisplayFrame:[[spriteTWalkLeft frames] objectAtIndex:0]];
    }
    self.hero.sprite103position = self.sprite103.position;
}
-(void) updateSprite104
{
    CGSize screenSize = [[CCDirector sharedDirector] winSize];
    int x = self.hero.position.x;
    int y = self.hero.position.y;
    
    int p = self.sprite104.position.x;
    int q = self.sprite104.position.y;
    
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
        [self moveleftSprite104];
    }
    if (rand == 2)
    {
        [self moverightSprite104];
    }
    if (rand == 3)
    {
        [self moveupSprite104];
    }
    if (rand == 4)
    {
        [self movedownSprite104];
    }
    return;
}

-(void) moveleftSprite104
{
    CGPoint sprite104Pos = self.sprite104.position;
    self.sprite104.orientation = 4;
    sprite104Pos.x -= theHKMap.tileSize.width;
    
    CGPoint tileCoord = [self tileCoordForPosition:sprite104Pos];
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
                    [self.bgLayer setTileGID:(tileGID + 24) at:tileCoord];
                    CGPoint tileCoord1 = [self tileCoordForPosition:self.sprite104.position];
                    int tileGID1 = [self.bgLayer tileGIDAt:tileCoord1];
                    [self.bgLayer removeTileAt:tileCoord1];
                    [self.bgLayer setTileGID:(tileGID1 - 24) at:tileCoord1];
                    
                    id actionMove = [CCMoveTo actionWithDuration:0.3 position:sprite104Pos];
                    id actionMove2 = [CCAnimate actionWithAnimation:spriteZWalkLeft restoreOriginalFrame:NO];
                    
                    id actionMoveDone = [CCCallFuncN actionWithTarget:self selector:@selector(finishActionSprite104)];
                    
                    [self.sprite104 runAction:[CCSpawn actionOne:[CCSequence actions:actionMove,actionMoveDone,nil] two:actionMove2]];
                    return;
                }
            }
        }
    }
    [self finishActionSprite104];
}
-(void) moverightSprite104
{
    CGPoint sprite104Pos = self.sprite104.position;
    self.sprite104.orientation = 3;
    sprite104Pos.x += theHKMap.tileSize.width;
    
    CGPoint tileCoord = [self tileCoordForPosition:sprite104Pos];
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
                    [self.bgLayer setTileGID:(tileGID + 24) at:tileCoord];
                    CGPoint tileCoord1 = [self tileCoordForPosition:self.sprite104.position];
                    int tileGID1 = [self.bgLayer tileGIDAt:tileCoord1];
                    [self.bgLayer removeTileAt:tileCoord1];
                    [self.bgLayer setTileGID:(tileGID1 - 24) at:tileCoord1];
                    
                    id actionMove = [CCMoveTo actionWithDuration:0.3 position:sprite104Pos];
                    id actionMove2 = [CCAnimate actionWithAnimation:spriteZWalkRight restoreOriginalFrame:NO];
                    
                    id actionMoveDone = [CCCallFuncN actionWithTarget:self selector:@selector(finishActionSprite104)];
                    
                    [self.sprite104 runAction:[CCSpawn actionOne:[CCSequence actions:actionMove,actionMoveDone,nil] two:actionMove2]];
                    return;
                }
            }
        }
    }
    [self finishActionSprite104];
}
-(void) moveupSprite104
{
    CGPoint sprite104Pos = self.sprite104.position;
    self.sprite104.orientation = 2;
    sprite104Pos.y += theHKMap.tileSize.height;
    
    CGPoint tileCoord = [self tileCoordForPosition:sprite104Pos];
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
                    [self.bgLayer setTileGID:(tileGID + 24) at:tileCoord];
                    CGPoint tileCoord1 = [self tileCoordForPosition:self.sprite104.position];
                    int tileGID1 = [self.bgLayer tileGIDAt:tileCoord1];
                    [self.bgLayer removeTileAt:tileCoord1];
                    [self.bgLayer setTileGID:(tileGID1 - 24) at:tileCoord1];
                    
                    id actionMove = [CCMoveTo actionWithDuration:0.3 position:sprite104Pos];
                    id actionMove2 = [CCAnimate actionWithAnimation:spriteZWalkUp restoreOriginalFrame:NO];
                    
                    id actionMoveDone = [CCCallFuncN actionWithTarget:self selector:@selector(finishActionSprite104)];
                    
                    [self.sprite104 runAction:[CCSpawn actionOne:[CCSequence actions:actionMove,actionMoveDone,nil] two:actionMove2]];
                    return;
                }
            }
        }
    }
    [self finishActionSprite104];
}
-(void) movedownSprite104
{
    CGPoint sprite104Pos = self.sprite104.position;
    self.sprite104.orientation = 1;
    sprite104Pos.y -= theHKMap.tileSize.width;
    
    CGPoint tileCoord = [self tileCoordForPosition:sprite104Pos];
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
                    [self.bgLayer setTileGID:(tileGID + 24) at:tileCoord];
                    CGPoint tileCoord1 = [self tileCoordForPosition:self.sprite104.position];
                    int tileGID1 = [self.bgLayer tileGIDAt:tileCoord1];
                    [self.bgLayer removeTileAt:tileCoord1];
                    [self.bgLayer setTileGID:(tileGID1 - 24) at:tileCoord1];
                    
                    id actionMove = [CCMoveTo actionWithDuration:0.3 position:sprite104Pos];
                    id actionMove2 = [CCAnimate actionWithAnimation:spriteZWalkDown restoreOriginalFrame:NO];
                    
                    id actionMoveDone = [CCCallFuncN actionWithTarget:self selector:@selector(finishActionSprite104)];
                    
                    [self.sprite104 runAction:[CCSpawn actionOne:[CCSequence actions:actionMove,actionMoveDone,nil] two:actionMove2]];
                    return;
                }
            }
        }
    }
    [self finishActionSprite104];
}
-(void) finishActionSprite104
{
    if (self.sprite104.orientation == 1)
    {
        [self.sprite104 setDisplayFrame:[[spriteZWalkDown frames] objectAtIndex:0]];
    }
    else if (self.sprite104.orientation == 2)
    {
        [self.sprite104 setDisplayFrame:[[spriteZWalkUp frames] objectAtIndex:0]];
    }
    else if (self.sprite104.orientation == 3)
    {
        [self.sprite104 setDisplayFrame:[[spriteZWalkRight frames] objectAtIndex:0]];
    }
    else
    {
        [self.sprite104 setDisplayFrame:[[spriteZWalkLeft frames] objectAtIndex:0]];
    }
    self.hero.sprite104position = self.sprite104.position;
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
            
            NSString *gate2 = [properties valueForKey:@"gate2"];
            if (gate2 && [gate2 compare:@"true"] == NSOrderedSame)
            {
                [self goGate:2];
                return;
            }
            NSString *gate4 = [properties valueForKey:@"gate4"];
            if (gate4 && [gate4 compare:@"true"] == NSOrderedSame)
            {
                [self goGate:4];
                return;
            }
            NSString *gate7 = [properties valueForKey:@"gate7"];
            if (gate7 && [gate7 compare:@"true"] == NSOrderedSame)
            {
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
            
            
            NSString *mapitem14 = [properties valueForKey:@"item14"];
            if (mapitem14 && [mapitem14 compare:@"true"] == NSOrderedSame)
            {
                if (!self.hero.gotItem14)
                {
                    [self pickedUpItem:14];
                    [self saveHero];
                    [self goText:3314];
                }
            }
            
            NSString *cave1 = [properties valueForKey:@"cave1IsHere"];
            if (cave1 && [cave1 compare:@"true"] == NSOrderedSame)
            {
                
                {
                    [self goGate:101];
                    return;
                }
            }
            NSString *cave2 = [properties valueForKey:@"cave2IsHere"];
            if (cave2 && [cave2 compare:@"true"] == NSOrderedSame)
            {
                
                {
                    [self goGate:102];
                    return;
                }
            }
            
            NSString *swarm1 = [properties valueForKey:@"swarm"];
            if (swarm1 && [swarm1 compare:@"true"] == NSOrderedSame)
            {
                {
                    if (!self.hero.killedBugs)
                    {
                        if (self.canRespondToTouch)
                            self.canRespondToTouch = NO;
                        else
                            self.canRespondToTouch = YES;
                        [self performSelector:@selector(toggleTouchEnabled) withObject:nil afterDelay:0.04];
                        return;
                    }
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
            
            NSString *gate2 = [properties valueForKey:@"gate2"];
            if (gate2 && [gate2 compare:@"true"] == NSOrderedSame)
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
                [self goGate:2];
                return;
            }
            NSString *gate4 = [properties valueForKey:@"gate4"];
            if (gate4 && [gate4 compare:@"true"] == NSOrderedSame)
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
                [self goGate:4];
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
            
            NSString *mapitem14 = [properties valueForKey:@"item14"];
            if (mapitem14 && [mapitem14 compare:@"true"] == NSOrderedSame)
            {
                if (!self.hero.gotItem14)
                {
                    [self pickedUpItem:14];
                    [self saveHero];
                    [self goText:3314];
                }
            }
            
            NSString *cave1 = [properties valueForKey:@"cave1IsHere"];
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
                    [self goGate:101];
                    return;
                }
            }
            NSString *cave2 = [properties valueForKey:@"cave2IsHere"];
            if (cave2 && [cave2 compare:@"true"] == NSOrderedSame)
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
                    [self goGate:102];
                    return;
                }
            }
            
            NSString *bugs = [properties valueForKey:@"swarm"];
            if (bugs && [bugs compare:@"true"] == NSOrderedSame)
            {
                if (!self.hero.killedBugs)
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

-(void)unblockFjordland
{
    CCTMXObjectGroup *objects = [theHKMap objectGroupNamed:@"oj1"];
    
    CGPoint tileCoord = [self tileCoordForPosition:self.sprite82.position];
    int tileGID = [self.bgLayer tileGIDAt:tileCoord];
    [self.bgLayer removeTileAt:tileCoord];
    [self.bgLayer setTileGID:(tileGID - 2) at:tileCoord];
    
    [self.theHKMap removeChild:self.sprite82 cleanup:YES];
    
    self.sprite82 = [InteractiveSprite spriteWithSpriteFrameName:@"herospriteA05.png"];
    self.sprite82.spriteCode = 23;
    self.sprite82.orientation = 4;
    
    NSMutableDictionary *sprite23start = [objects objectNamed:@"spriteStart82"];
    double x1 = [[sprite23start valueForKey:@"x"]floatValue];
    double y1 = [[sprite23start valueForKey:@"y"]floatValue];
    self.sprite82.position = ccp(x1,y1);
    
    [self.theHKMap addChild:self.sprite82 z:self.bgLayer.zOrder];
    
    CGPoint tileCoord1 = [self tileCoordForPosition:self.sprite82.position];
    int tileGID1 = [self.bgLayer tileGIDAt:tileCoord1];
    [self.bgLayer removeTileAt:tileCoord1];
    [self.bgLayer setTileGID:(tileGID1 + 2) at:tileCoord1];
    [self saveHero];
    
}



-(void)pickedUpItem:(int)itemCode
{
    [MusicHandler playButtonClick];
    if (itemCode == 13)
    {
        CGPoint pos = self.item13.position;
        self.hero.gotItem13 = YES;
        [self.theHKMap removeChild:self.item13 cleanup:YES];
        self.item13 = [CCSprite spriteWithFile:@"treasurechestSprite02.png"];
        self.item13.position = pos;
        [self.theHKMap addChild:self.item13 z:self.bgLayer.zOrder];
        
        [self givenItem:94];
    }
    else if (itemCode == 14)
    {
        self.hero.gotItem14 = YES;
        [self.theHKMap removeChild:self.item14 cleanup:YES];
        self.hero.gold += 30;
        
    }
    else if (itemCode == 15)
    {
        CGPoint pos = self.item15.position;
        self.hero.gotItem15 = YES;
        [self.theHKMap removeChild:self.item15 cleanup:YES];
        self.item15 = [CCSprite spriteWithFile:@"treasurechestSprite02.png"];
        self.item15.position = pos;
        [self.theHKMap addChild:self.item15 z:self.bgLayer.zOrder];
        
        [self givenItem:84];
        
    }
    else if (itemCode == 16)
    {
        CGPoint pos = self.item16.position;
        self.hero.gotItem16 = YES;
        [self.theHKMap removeChild:self.item16 cleanup:YES];
        self.item16 = [CCSprite spriteWithFile:@"treasurechestSprite02.png"];
        self.item16.position = pos;
        [self.theHKMap addChild:self.item16 z:self.bgLayer.zOrder];
        
        [self givenItem:116];
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
    [SceneManager goPlay:4];
    return;
}



-(void) goGate:(int)gate
{
    
    self.hero.mapInitMode = 2;
    [self saveHero];
    
    if (gate == 2)
    {
        [SceneManager goPlay:1];
    }
    else if (gate == 4)
    {
        [SceneManager goPlay:5];
    }
    else if (gate == 7)
    {
        [SceneManager goPlay:8];
    }
    else if (gate == 101)
    {
        [SceneManager goPlay:9];
    }
    else if (gate == 102)
    {
        [SceneManager goPlay:20];
    }
    else{
        NSLog(@"gate error");
    }
    return;
}



-(void)saveHero
{
    self.hero.sprite81position = self.sprite81.position;
    self.hero.sprite82position = self.sprite82.position;
    self.hero.sprite83position = self.sprite83.position;
    self.hero.sprite84position = self.sprite84.position;
    self.hero.sprite85position = self.sprite85.position;
    self.hero.sprite86position = self.sprite86.position;
    self.hero.sprite87position = self.sprite87.position;
    self.hero.sprite88position = self.sprite88.position;
    self.hero.sprite89position = self.sprite89.position;
    self.hero.sprite90position = self.sprite90.position;
    self.hero.sprite91position = self.sprite91.position;
    self.hero.sprite92position = self.sprite92.position;
    self.hero.sprite93position = self.sprite93.position;
    self.hero.sprite94position = self.sprite94.position;
    self.hero.sprite95position = self.sprite95.position;
    self.hero.sprite96position = self.sprite96.position;
    self.hero.sprite97position = self.sprite97.position;
    self.hero.sprite98position = self.sprite98.position;
    self.hero.sprite99position = self.sprite99.position;
    self.hero.sprite100position = self.sprite100.position;
    self.hero.sprite101position = self.sprite101.position;
    self.hero.sprite102position = self.sprite102.position;
    self.hero.sprite103position = self.sprite103.position;
    self.hero.sprite104position = self.sprite104.position;
    
    self.hero.heroOrientation = self.spriteOrientation;
    
    self.hero.sprite81_Orientation = self.sprite81.orientation;
    self.hero.sprite82_Orientation = self.sprite82.orientation;
    self.hero.sprite83_Orientation = self.sprite83.orientation;
    self.hero.sprite84_Orientation = self.sprite84.orientation;
    self.hero.sprite85_Orientation = self.sprite85.orientation;
    self.hero.sprite86_Orientation = self.sprite86.orientation;
    self.hero.sprite87_Orientation = self.sprite87.orientation;
    self.hero.sprite88_Orientation = self.sprite88.orientation;
    self.hero.sprite89_Orientation = self.sprite89.orientation;
    self.hero.sprite90_Orientation = self.sprite90.orientation;
    self.hero.sprite91_Orientation = self.sprite91.orientation;
    self.hero.sprite92_Orientation = self.sprite92.orientation;
    self.hero.sprite93_Orientation = self.sprite93.orientation;
    self.hero.sprite94_Orientation = self.sprite94.orientation;
    self.hero.sprite95_Orientation = self.sprite95.orientation;
    self.hero.sprite96_Orientation = self.sprite96.orientation;
    self.hero.sprite97_Orientation = self.sprite97.orientation;
    self.hero.sprite98_Orientation = self.sprite98.orientation;
    self.hero.sprite99_Orientation = self.sprite99.orientation;
    self.hero.sprite100_Orientation = self.sprite100.orientation;
    self.hero.sprite101_Orientation = self.sprite101.orientation;
    self.hero.sprite102_Orientation = self.sprite102.orientation;
    self.hero.sprite103_Orientation = self.sprite103.orientation;
    self.hero.sprite104_Orientation = self.sprite104.orientation;
    
    //[GameSceneManager sharedGameSceneManager].hero = self.hero;
}

-(void) killBugs
{
    [self.theHKMap removeChild:self.swarm cleanup:YES];
    self.hero.killedBugs = YES;
    
    NSMutableArray *array = [self.hero.heroInventory mutableCopy];
    int tempIndex;
    bool foundBugSpray = false;
    for (int i = 0; i < array.count; i++)
    {
        if (((Item*)[array objectAtIndex:i]).itemCode == 26)
        {
            tempIndex = i;
            foundBugSpray = true;
            break;
        }
        if (foundBugSpray)
        {
           [array removeObject:[array objectAtIndex:tempIndex]];
        }
        else {
            NSLog(@"ERROR BUG SPRAY NOT FOUND - ILLEGAL STATE");
        }
    }
    self.hero.heroInventory = array;
    [self saveHero];
    
    [self goText:3600];
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
            
            NSString *sprite81Interact = [properties valueForKey:@"sprite81IsHere"];
            if (sprite81Interact && [sprite81Interact compare:@"true"] == NSOrderedSame)
            {
                self.sprite81.orientation = oppOrientation;
                
                if (self.sprite81.orientation == 1)
                {
                    [self.sprite81 setDisplayFrame:[[spriteAWalkDown frames] objectAtIndex:0]];
                }
                else if (self.sprite81.orientation == 2)
                {
                    [self.sprite81 setDisplayFrame:[[spriteAWalkUp frames] objectAtIndex:0]];
                }
                else if (self.sprite81.orientation == 3)
                {
                    [self.sprite81 setDisplayFrame:[[spriteAWalkRight frames] objectAtIndex:0]];
                }
                else
                {
                    [self.sprite81 setDisplayFrame:[[spriteAWalkLeft frames] objectAtIndex:0]];
                }
                
                if (self.hero.beatIonak)
                {
                    [self goText:3001];
                    return;
                }
                else
                {
                    [self goText:3000];
                    return;
                }
            }
            
            NSString *sprite82Interact = [properties valueForKey:@"sprite82IsHere"];
            if (sprite82Interact && [sprite82Interact compare:@"true"] == NSOrderedSame)
            {
                self.sprite82.orientation = oppOrientation;
                
                if (self.sprite82.orientation == 1)
                {
                    [self.sprite82 setDisplayFrame:[[spriteAWalkDown frames] objectAtIndex:0]];
                }
                else if (self.sprite82.orientation == 2)
                {
                    [self.sprite82 setDisplayFrame:[[spriteAWalkUp frames] objectAtIndex:0]];
                }
                else if (self.sprite82.orientation == 3)
                {
                    [self.sprite82 setDisplayFrame:[[spriteAWalkRight frames] objectAtIndex:0]];
                }
                else
                {
                    [self.sprite82 setDisplayFrame:[[spriteAWalkLeft frames] objectAtIndex:0]];
                }
                
                if (self.hero.savedKing)
                {
                    [self goText:3099];
                    return;
                }
                else if (self.hero.talkedToEilifPostBoss)
                {
                    [self goText:3003];
                    return;
                }
                else
                {
                    [self goText:3002];
                    return;
                }
            }
            
            NSString *sprite83Interact = [properties valueForKey:@"sprite83IsHere"];
            if (sprite83Interact && [sprite83Interact compare:@"true"] == NSOrderedSame)
            {
                self.sprite83.orientation = oppOrientation;
                
                if (self.sprite83.orientation == 1)
                {
                    [self.sprite83 setDisplayFrame:[[spriteGWalkDown frames] objectAtIndex:0]];
                }
                else if (self.sprite83.orientation == 2)
                {
                    [self.sprite83 setDisplayFrame:[[spriteGWalkUp frames] objectAtIndex:0]];
                }
                else if (self.sprite83.orientation == 3)
                {
                    [self.sprite83 setDisplayFrame:[[spriteGWalkRight frames] objectAtIndex:0]];
                }
                else
                {
                    [self.sprite83 setDisplayFrame:[[spriteGWalkLeft frames] objectAtIndex:0]];
                }
                
                if (self.hero.beatIonak)
                {
                    [self goText:3005];
                    return;
                }
                else
                {
                    [self goText:3004];
                    return;
                }
            }
            
            NSString *sprite84Interact = [properties valueForKey:@"sprite84IsHere"];
            if (sprite84Interact && [sprite84Interact compare:@"true"] == NSOrderedSame)
            {
                self.sprite84.orientation = oppOrientation;
                
                if (self.sprite84.orientation == 1)
                {
                    [self.sprite84 setDisplayFrame:[[spriteAWalkDown frames] objectAtIndex:0]];
                }
                else if (self.sprite84.orientation == 2)
                {
                    [self.sprite84 setDisplayFrame:[[spriteAWalkUp frames] objectAtIndex:0]];
                }
                else if (self.sprite84.orientation == 3)
                {
                    [self.sprite84 setDisplayFrame:[[spriteAWalkRight frames] objectAtIndex:0]];
                }
                else
                {
                    [self.sprite84 setDisplayFrame:[[spriteAWalkLeft frames] objectAtIndex:0]];
                }
                
                if (self.hero.savedKing)
                {
                    [self goText:3007];
                    return;
                }
                else
                {
                    [self goText:3006];
                    return;
                }
            }
            
            NSString *sprite85Interact = [properties valueForKey:@"sprite85IsHere"];
            if (sprite85Interact && [sprite85Interact compare:@"true"] == NSOrderedSame)
            {
                self.sprite85.orientation = oppOrientation;
                
                if (self.sprite85.orientation == 1)
                {
                    [self.sprite85 setDisplayFrame:[[spriteAWalkDown frames] objectAtIndex:0]];
                }
                else if (self.sprite85.orientation == 2)
                {
                    [self.sprite85 setDisplayFrame:[[spriteAWalkUp frames] objectAtIndex:0]];
                }
                else if (self.sprite85.orientation == 3)
                {
                    [self.sprite85 setDisplayFrame:[[spriteAWalkRight frames] objectAtIndex:0]];
                }
                else
                {
                    [self.sprite85 setDisplayFrame:[[spriteAWalkLeft frames] objectAtIndex:0]];
                }
                
                if (self.hero.beatIonak)
                {
                    [self goText:3009];
                    return;
                }
                else
                {
                    [self goText:3008];
                    return;
                }
            }
            
            NSString *sprite86Interact = [properties valueForKey:@"sprite86IsHere"];
            if (sprite86Interact && [sprite86Interact compare:@"true"] == NSOrderedSame)
            {
                self.sprite86.orientation = oppOrientation;
                
                if (self.sprite86.orientation == 1)
                {
                    [self.sprite86 setDisplayFrame:[[spriteGWalkDown frames] objectAtIndex:0]];
                }
                else if (self.sprite86.orientation == 2)
                {
                    [self.sprite86 setDisplayFrame:[[spriteGWalkUp frames] objectAtIndex:0]];
                }
                else if (self.sprite86.orientation == 3)
                {
                    [self.sprite86 setDisplayFrame:[[spriteGWalkRight frames] objectAtIndex:0]];
                }
                else
                {
                    [self.sprite86 setDisplayFrame:[[spriteGWalkLeft frames] objectAtIndex:0]];
                }
                
                if (self.hero.savedKing)
                {
                    [self goText:3011];
                    return;
                }
                else
                {
                    [self goText:3010];
                    return;
                }
            }
            
            NSString *sprite87Interact = [properties valueForKey:@"sprite87IsHere"];
            if (sprite87Interact && [sprite87Interact compare:@"true"] == NSOrderedSame)
            {
                self.sprite87.orientation = oppOrientation;
                
                if (self.sprite87.orientation == 1)
                {
                    [self.sprite87 setDisplayFrame:[[spriteGWalkDown frames] objectAtIndex:0]];
                }
                else if (self.sprite87.orientation == 2)
                {
                    [self.sprite87 setDisplayFrame:[[spriteGWalkUp frames] objectAtIndex:0]];
                }
                else if (self.sprite87.orientation == 3)
                {
                    [self.sprite87 setDisplayFrame:[[spriteGWalkRight frames] objectAtIndex:0]];
                }
                else
                {
                    [self.sprite87 setDisplayFrame:[[spriteGWalkLeft frames] objectAtIndex:0]];
                }
                if (self.hero.savedKing)
                {
                    [self goText:3013];
                    return;
                }
                else
                {
                    [self goText:3012];
                    return;
                }
            }
            
            NSString *sprite88Interact = [properties valueForKey:@"sprite88IsHere"];
            if (sprite88Interact && [sprite88Interact compare:@"true"] == NSOrderedSame)
            {
                self.sprite88.orientation = oppOrientation;
                
                if (self.sprite88.orientation == 1)
                {
                    [self.sprite88 setDisplayFrame:[[spriteXWalkDown frames] objectAtIndex:0]];
                }
                else if (self.sprite88.orientation == 2)
                {
                    [self.sprite88 setDisplayFrame:[[spriteXWalkUp frames] objectAtIndex:0]];
                }
                else if (self.sprite88.orientation == 3)
                {
                    [self.sprite88 setDisplayFrame:[[spriteXWalkRight frames] objectAtIndex:0]];
                }
                else
                {
                    [self.sprite88 setDisplayFrame:[[spriteXWalkLeft frames] objectAtIndex:0]];
                }
                
                if (self.hero.savedKing)
                {
                    [self goText:3015];
                    return;
                }
                else
                {
                    [self goText:3014];
                    return;
                }
            }
            
            if (self.hero.savedKing)
            {
                NSString *sprite89Interact = [properties valueForKey:@"sprite89IsHere"];
                if (sprite89Interact && [sprite89Interact compare:@"true"] == NSOrderedSame)
                {
                    self.sprite89.orientation = oppOrientation;
                    
                    if (self.sprite89.orientation == 1)
                    {
                        [self.sprite89 setDisplayFrame:[[spriteLWalkDown frames] objectAtIndex:0]];
                    }
                    else if (self.sprite89.orientation == 2)
                    {
                        [self.sprite89 setDisplayFrame:[[spriteLWalkUp frames] objectAtIndex:0]];
                    }
                    else if (self.sprite89.orientation == 3)
                    {
                        [self.sprite89 setDisplayFrame:[[spriteLWalkRight frames] objectAtIndex:0]];
                    }
                    else
                    {
                        [self.sprite89 setDisplayFrame:[[spriteLWalkLeft frames] objectAtIndex:0]];
                    }
                    
                    if (self.hero.gotLorica)
                    {
                        [self goText:3019];
                        return;
                    }
                    else if (self.hero.beatIonak)
                    {
                        [self goText:3017];
                        return;
                    }
                    else
                    {
                        [self goText:3016];
                        return;
                    }
                }
            }
            
            NSString *sprite90Interact = [properties valueForKey:@"sprite90IsHere"];
            if (sprite90Interact && [sprite90Interact compare:@"true"] == NSOrderedSame)
            {
                self.sprite90.orientation = oppOrientation;
                
                if (self.sprite90.orientation == 1)
                {
                    [self.sprite90 setDisplayFrame:[[spriteRWalkDown frames] objectAtIndex:0]];
                }
                else if (self.sprite90.orientation == 2)
                {
                    [self.sprite90 setDisplayFrame:[[spriteRWalkUp frames] objectAtIndex:0]];
                }
                else if (self.sprite90.orientation == 3)
                {
                    [self.sprite90 setDisplayFrame:[[spriteRWalkRight frames] objectAtIndex:0]];
                }
                else
                {
                    [self.sprite90 setDisplayFrame:[[spriteRWalkLeft frames] objectAtIndex:0]];
                }
                
                
                [self goText:3020];
                return;
            }
            
            NSString *sprite91Interact = [properties valueForKey:@"sprite91IsHere"];
            if (sprite91Interact && [sprite91Interact compare:@"true"] == NSOrderedSame)
            {
                self.sprite91.orientation = oppOrientation;
                
                if (self.sprite91.orientation == 1)
                {
                    [self.sprite91 setDisplayFrame:[[spriteVWalkDown frames] objectAtIndex:0]];
                }
                else if (self.sprite91.orientation == 2)
                {
                    [self.sprite91 setDisplayFrame:[[spriteVWalkUp frames] objectAtIndex:0]];
                }
                else if (self.sprite91.orientation == 3)
                {
                    [self.sprite91 setDisplayFrame:[[spriteVWalkRight frames] objectAtIndex:0]];
                }
                else
                {
                    [self.sprite91 setDisplayFrame:[[spriteVWalkLeft frames] objectAtIndex:0]];
                }
                
                if (self.hero.beatIonak)
                {
                    [self goText:3028];
                    return;
                }
                else if (self.hero.savedKing)
                {
                    [self goText:3027];
                    return;
                }
                else if (self.hero.talkedToEilifPostBoss)
                {
                    [self goText:3026];
                    return;
                }
                else if (self.hero.beatCaveBoss)
                {
                    [self goText:3024];
                    return;
                }
                else if (self.hero.talkedToEilif)
                {
                    [self goText:3023];
                    return;
                }
                else
                {
                    [self goText:3021];
                    return;
                }
                return;
            }
            
            NSString *sprite92Interact = [properties valueForKey:@"sprite92IsHere"];
            if (sprite92Interact && [sprite92Interact compare:@"true"] == NSOrderedSame)
            {
                self.sprite92.orientation = oppOrientation;
                
                if (self.sprite92.orientation == 1)
                {
                    [self.sprite92 setDisplayFrame:[[spriteMWalkDown frames] objectAtIndex:0]];
                }
                else if (self.sprite92.orientation == 2)
                {
                    [self.sprite92 setDisplayFrame:[[spriteMWalkUp frames] objectAtIndex:0]];
                }
                else if (self.sprite92.orientation == 3)
                {
                    [self.sprite92 setDisplayFrame:[[spriteMWalkRight frames] objectAtIndex:0]];
                }
                else
                {
                    [self.sprite92 setDisplayFrame:[[spriteMWalkLeft frames] objectAtIndex:0]];
                }
                [self goText:3029];
                return;
            }
            
            NSString *sprite93Interact = [properties valueForKey:@"sprite93IsHere"];
            if (sprite93Interact && [sprite93Interact compare:@"true"] == NSOrderedSame)
            {
                self.sprite93.orientation = oppOrientation;
                
                if (self.sprite93.orientation == 1)
                {
                    [self.sprite93 setDisplayFrame:[[spritePWalkDown frames] objectAtIndex:0]];
                }
                else if (self.sprite93.orientation == 2)
                {
                    [self.sprite93 setDisplayFrame:[[spritePWalkUp frames] objectAtIndex:0]];
                }
                else if (self.sprite93.orientation == 3)
                {
                    [self.sprite93 setDisplayFrame:[[spritePWalkRight frames] objectAtIndex:0]];
                }
                else
                {
                    [self.sprite93 setDisplayFrame:[[spritePWalkLeft frames] objectAtIndex:0]];
                }
                
                [self goText:3030];
                return;
            }
            
            NSString *sprite94Interact = [properties valueForKey:@"sprite94IsHere"];
            if (sprite94Interact && [sprite94Interact compare:@"true"] == NSOrderedSame)
            {
                self.sprite94.orientation = oppOrientation;
                
                if (self.sprite94.orientation == 1)
                {
                    [self.sprite94 setDisplayFrame:[[spriteSWalkDown frames] objectAtIndex:0]];
                }
                else if (self.sprite94.orientation == 2)
                {
                    [self.sprite94 setDisplayFrame:[[spriteSWalkUp frames] objectAtIndex:0]];
                }
                else if (self.sprite94.orientation == 3)
                {
                    [self.sprite94 setDisplayFrame:[[spriteSWalkRight frames] objectAtIndex:0]];
                }
                else
                {
                    [self.sprite94 setDisplayFrame:[[spriteSWalkLeft frames] objectAtIndex:0]];
                }
                
                [self goText:3031];
                return;
            }
            
            NSString *sprite95Interact = [properties valueForKey:@"sprite95IsHere"];
            if (sprite95Interact && [sprite95Interact compare:@"true"] == NSOrderedSame)
            {
                self.sprite95.orientation = oppOrientation;
                
                if (self.sprite95.orientation == 1)
                {
                    [self.sprite95 setDisplayFrame:[[spriteIWalkDown frames] objectAtIndex:0]];
                }
                else if (self.sprite95.orientation == 2)
                {
                    [self.sprite95 setDisplayFrame:[[spriteIWalkUp frames] objectAtIndex:0]];
                }
                else if (self.sprite95.orientation == 3)
                {
                    [self.sprite95 setDisplayFrame:[[spriteIWalkRight frames] objectAtIndex:0]];
                }
                else
                {
                    [self.sprite95 setDisplayFrame:[[spriteIWalkLeft frames] objectAtIndex:0]];
                }
                
                [self goText:3032];
                return;
            }
            
            NSString *sprite96Interact = [properties valueForKey:@"sprite96IsHere"];
            if (sprite96Interact && [sprite96Interact compare:@"true"] == NSOrderedSame)
            {
                self.sprite96.orientation = oppOrientation;
                
                if (self.sprite96.orientation == 1)
                {
                    [self.sprite96 setDisplayFrame:[[spriteCWalkDown frames] objectAtIndex:0]];
                }
                else if (self.sprite96.orientation == 2)
                {
                    [self.sprite96 setDisplayFrame:[[spriteCWalkUp frames] objectAtIndex:0]];
                }
                else if (self.sprite96.orientation == 3)
                {
                    [self.sprite96 setDisplayFrame:[[spriteCWalkRight frames] objectAtIndex:0]];
                }
                else
                {
                    [self.sprite96 setDisplayFrame:[[spriteCWalkLeft frames] objectAtIndex:0]];
                }
                
                [self goText:3033];
                return;
            }
            NSString *sprite97Interact = [properties valueForKey:@"sprite97IsHere"];
            if (sprite97Interact && [sprite97Interact compare:@"true"] == NSOrderedSame)
            {
                self.sprite97.orientation = oppOrientation;
                
                if (self.sprite97.orientation == 1)
                {
                    [self.sprite97 setDisplayFrame:[[spriteNWalkDown frames] objectAtIndex:0]];
                }
                else if (self.sprite97.orientation == 2)
                {
                    [self.sprite97 setDisplayFrame:[[spriteNWalkUp frames] objectAtIndex:0]];
                }
                else if (self.sprite97.orientation == 3)
                {
                    [self.sprite97 setDisplayFrame:[[spriteNWalkRight frames] objectAtIndex:0]];
                }
                else
                {
                    [self.sprite97 setDisplayFrame:[[spriteNWalkLeft frames] objectAtIndex:0]];
                }
                
                [self goText:3034];
                return;
            }
            NSString *sprite98Interact = [properties valueForKey:@"sprite98IsHere"];
            if (sprite98Interact && [sprite98Interact compare:@"true"] == NSOrderedSame)
            {
                self.sprite98.orientation = oppOrientation;
                
                if (self.sprite98.orientation == 1)
                {
                    [self.sprite98 setDisplayFrame:[[spriteZBWalkDown frames] objectAtIndex:0]];
                }
                else if (self.sprite98.orientation == 2)
                {
                    [self.sprite98 setDisplayFrame:[[spriteZBWalkUp frames] objectAtIndex:0]];
                }
                else if (self.sprite98.orientation == 3)
                {
                    [self.sprite98 setDisplayFrame:[[spriteZBWalkRight frames] objectAtIndex:0]];
                }
                else
                {
                    [self.sprite98 setDisplayFrame:[[spriteZBWalkLeft frames] objectAtIndex:0]];
                }
                
                if (self.hero.beatTraveler)
                {
                    [self goText:3036];
                    return;
                }
                else
                {
                    [self goText:3035];
                    return;
                }
            }
            
            NSString *sprite99Interact = [properties valueForKey:@"sprite99IsHere"];
            if (sprite99Interact && [sprite99Interact compare:@"true"] == NSOrderedSame)
            {
                self.sprite99.orientation = oppOrientation;
                
                if (self.sprite99.orientation == 1)
                {
                    [self.sprite99 setDisplayFrame:[[spriteWWalkDown frames] objectAtIndex:0]];
                }
                else if (self.sprite99.orientation == 2)
                {
                    [self.sprite99 setDisplayFrame:[[spriteWWalkUp frames] objectAtIndex:0]];
                }
                else if (self.sprite99.orientation == 3)
                {
                    [self.sprite99 setDisplayFrame:[[spriteWWalkRight frames] objectAtIndex:0]];
                }
                else
                {
                    [self.sprite99 setDisplayFrame:[[spriteWWalkLeft frames] objectAtIndex:0]];
                }
                
                [self goText:3102];
                return;
            }
            NSString *sprite100Interact = [properties valueForKey:@"sprite100IsHere"];
            if (sprite100Interact && [sprite100Interact compare:@"true"] == NSOrderedSame)
            {
                self.sprite100.orientation = oppOrientation;
                
                if (self.sprite100.orientation == 1)
                {
                    [self.sprite100 setDisplayFrame:[[spriteYWalkDown frames] objectAtIndex:0]];
                }
                else if (self.sprite100.orientation == 2)
                {
                    [self.sprite100 setDisplayFrame:[[spriteYWalkUp frames] objectAtIndex:0]];
                }
                else if (self.sprite100.orientation == 3)
                {
                    [self.sprite100 setDisplayFrame:[[spriteYWalkRight frames] objectAtIndex:0]];
                }
                else
                {
                    [self.sprite100 setDisplayFrame:[[spriteYWalkLeft frames] objectAtIndex:0]];
                }
                
                [self goText:3100];
                return;
            }
            NSString *sprite101Interact = [properties valueForKey:@"sprite101IsHere"];
            if (sprite101Interact && [sprite101Interact compare:@"true"] == NSOrderedSame)
            {
                self.sprite101.orientation = oppOrientation;
                
                if (self.sprite101.orientation == 1)
                {
                    [self.sprite101 setDisplayFrame:[[spriteYWalkDown frames] objectAtIndex:0]];
                }
                else if (self.sprite101.orientation == 2)
                {
                    [self.sprite101 setDisplayFrame:[[spriteYWalkUp frames] objectAtIndex:0]];
                }
                else if (self.sprite101.orientation == 3)
                {
                    [self.sprite101 setDisplayFrame:[[spriteYWalkRight frames] objectAtIndex:0]];
                }
                else
                {
                    [self.sprite101 setDisplayFrame:[[spriteYWalkLeft frames] objectAtIndex:0]];
                }
                
                [self goText:3101];
                return;
            }
            NSString *sprite102Interact = [properties valueForKey:@"sprite102IsHere"];
            if (sprite102Interact && [sprite102Interact compare:@"true"] == NSOrderedSame)
            {
                self.sprite102.orientation = oppOrientation;
                
                if (self.sprite102.orientation == 1)
                {
                    [self.sprite102 setDisplayFrame:[[spriteZAWalkDown frames] objectAtIndex:0]];
                }
                else if (self.sprite102.orientation == 2)
                {
                    [self.sprite102 setDisplayFrame:[[spriteZAWalkUp frames] objectAtIndex:0]];
                }
                else if (self.sprite102.orientation == 3)
                {
                    [self.sprite102 setDisplayFrame:[[spriteZAWalkRight frames] objectAtIndex:0]];
                }
                else
                {
                    [self.sprite102 setDisplayFrame:[[spriteZAWalkLeft frames] objectAtIndex:0]];
                }
                
                [self goText:3105];
                return;
            }
            NSString *sprite103Interact = [properties valueForKey:@"sprite103IsHere"];
            if (sprite103Interact && [sprite103Interact compare:@"true"] == NSOrderedSame)
            {
                self.sprite103.orientation = oppOrientation;
                
                if (self.sprite103.orientation == 1)
                {
                    [self.sprite103 setDisplayFrame:[[spriteTWalkDown frames] objectAtIndex:0]];
                }
                else if (self.sprite103.orientation == 2)
                {
                    [self.sprite103 setDisplayFrame:[[spriteTWalkUp frames] objectAtIndex:0]];
                }
                else if (self.sprite103.orientation == 3)
                {
                    [self.sprite103 setDisplayFrame:[[spriteTWalkRight frames] objectAtIndex:0]];
                }
                else
                {
                    [self.sprite103 setDisplayFrame:[[spriteTWalkLeft frames] objectAtIndex:0]];
                }
                
                [self goText:3106];
                return;
            }
            NSString *sprite104Interact = [properties valueForKey:@"sprite104IsHere"];
            if (sprite104Interact && [sprite104Interact compare:@"true"] == NSOrderedSame)
            {
                self.sprite104.orientation = oppOrientation;
                
                if (self.sprite104.orientation == 1)
                {
                    [self.sprite104 setDisplayFrame:[[spriteZWalkDown frames] objectAtIndex:0]];
                }
                else if (self.sprite104.orientation == 2)
                {
                    [self.sprite104 setDisplayFrame:[[spriteZWalkUp frames] objectAtIndex:0]];
                }
                else if (self.sprite104.orientation == 3)
                {
                    [self.sprite104 setDisplayFrame:[[spriteZWalkRight frames] objectAtIndex:0]];
                }
                else
                {
                    [self.sprite104 setDisplayFrame:[[spriteZWalkLeft frames] objectAtIndex:0]];
                }
                
                [self goText:3040];
                return;
            }
            
            
            NSString *mapItem5 = [properties valueForKey:@"item13"];
            if (mapItem5 && [mapItem5 compare:@"true"] == NSOrderedSame)
            {
                
                if (!self.hero.gotItem13)
                {
                    [self goText:3313];
                    return;
                }
                else
                {
                    [self goText:399];
                    return;
                }
            }
            NSString *mapItem6 = [properties valueForKey:@"item14"];
            if (mapItem6 && [mapItem6 compare:@"true"] == NSOrderedSame)
            {
                
                if (!self.hero.gotItem14)
                {
                    [self goText:3314];
                    return;
                }
                else
                {
                    return;
                }
            }
            NSString *mapItem7 = [properties valueForKey:@"item15"];
            if (mapItem7 && [mapItem7 compare:@"true"] == NSOrderedSame)
            {
                
                if (!self.hero.gotItem15)
                {
                    [self goText:3315];
                    return;
                }
                else
                {
                    [self goText:399];
                    return;
                }
            }
            NSString *mapItem8 = [properties valueForKey:@"item16"];
            if (mapItem8 && [mapItem8 compare:@"true"] == NSOrderedSame)
            {
                
                if (!self.hero.gotItem16)
                {
                    [self goText:3316];
                    return;
                }
                else
                {
                    [self goText:399];
                    return;
                }
            }
            
            NSString *sign62 = [properties valueForKey:@"sign31"];
            if (sign62 && [sign62 compare:@"true"] == NSOrderedSame)
            {
                [self goText:3200];
                return;
            }
            NSString *sign63 = [properties valueForKey:@"sign32"];
            if (sign63 && [sign63 compare:@"true"] == NSOrderedSame)
            {
                [self goText:3201];
                return;
            }
            NSString *sign64 = [properties valueForKey:@"sign33"];
            if (sign64 && [sign64 compare:@"true"] == NSOrderedSame)
            {
                [self goText:3202];
                return;
            }
            NSString *sign65 = [properties valueForKey:@"sign34"];
            if (sign65 && [sign65 compare:@"true"] == NSOrderedSame)
            {
                [self goText:3203];
                return;
            }
            NSString *sign66 = [properties valueForKey:@"sign35"];
            if (sign66 && [sign66 compare:@"true"] == NSOrderedSame)
            {
                [self goText:3204];
                return;
            }
            NSString *sign67 = [properties valueForKey:@"sign36"];
            if (sign67 && [sign67 compare:@"true"] == NSOrderedSame)
            {
                [self goText:3205];
                return;
            }
            NSString *sign68 = [properties valueForKey:@"sign37"];
            if (sign68 && [sign68 compare:@"true"] == NSOrderedSame)
            {
                [self goText:3206];
                return;
            }
            NSString *bugs = [properties valueForKey:@"swarm"];
            if (bugs && [bugs compare:@"true"] == NSOrderedSame)
            {
                if (!self.hero.killedBugs)
                {
                    if (self.hero.talkedToEilif)
                    {
                        [self killBugs];
                        return;
                    }
                    else{
                        [self goText:3601];
                        return;
                    }
                }
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
        if (self.hero.beatIonak)
        {
            [self updateSprite83];
        }
    }
    else if (spriteCycleCount == 2)
    {
        if (self.hero.savedKing)
        {
            [self updateSprite89];
        }
    }
    else if (spriteCycleCount == 3)
    {
        [self updateSprite81];
    }
    else if (spriteCycleCount == 4)
    {
        [self updateSprite82];
        [self updateSprite92];
        [self updateSprite93];
    }
    else if (spriteCycleCount == 5)
    {
        [self updateSprite91];
        [self updateSprite94];
    }
    else if (spriteCycleCount == 6)
    {
        [self updateSprite84];
        [self updateSprite95];
    }
    else if (spriteCycleCount == 7)
    {
        [self updateSprite85];
        [self updateSprite96];
        [self updateSprite97];
        [self updateSprite98];
    }
    else if (spriteCycleCount == 8)
    {
        [self updateSprite86];
        [self updateSprite99];
        [self updateSprite100];
    }
    else if (spriteCycleCount == 9)
    {
        [self updateSprite87];
        [self updateSprite101];
        [self updateSprite102];
    }
    else if (spriteCycleCount == 10)
    {
        [self updateSprite88];
        [self updateSprite103];
    }
    else if (spriteCycleCount == 11)
    {
        [self updateSprite90];
        [self updateSprite104];
    }
    
    
    if (spriteCycleCount > 12)
    {
        spriteCycleCount = 0;
    }
    return;
}











@end






