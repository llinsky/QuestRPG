//
//  PlayLayerThree.m
//  Quest
//
//  Created by Leo Linsky on 1/3/14.
//
//

#import "PlayLayerThree.h"
#import "SceneManager.h"
#import "HKTMXTiledMap.h"
#import "ItemShopMenu.h"
#import "CCSendMessages.h"

@implementation PlayLayerThree

@synthesize sprite61,sprite62,sprite63,sprite64,sprite65,sprite66,sprite67,sprite68,sprite69,sprite70,sprite71,sprite72,sprite73,sprite74,sprite75,sprite76,item10,item11,item12,item9;


-(id)init
{
    if (self = [super init])
    {
        
        self.theHKMap = [HKTMXTiledMap tiledMapWithTMXFile:@"playlayer3_FINAL1.tmx"];
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
            
            [[CCSpriteFrameCache sharedSpriteFrameCache] addSpriteFramesWithFile:@"herospriteKsheet.plist"];
            spriteKSheet = [CCSpriteBatchNode batchNodeWithFile:@"herospriteKsheet.png"];
            [spriteKSheet retain];
            [self addChild:spriteKSheet];
            
            NSMutableArray *spriteKWalkAnimFramesLeft = [NSMutableArray array];
            NSMutableArray *spriteKWalkAnimFramesRight = [NSMutableArray array];
            NSMutableArray *spriteKAnimFramesUp = [NSMutableArray array];
            NSMutableArray *spriteKAnimFramesDown = [NSMutableArray array];
            NSMutableArray *spriteKAnimFramesUp2 = [NSMutableArray array];
            NSMutableArray *spriteKAnimFramesDown2 = [NSMutableArray array];
            
            [spriteKWalkAnimFramesLeft addObject:[[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:@"herospriteK05.png"]];
            [spriteKWalkAnimFramesLeft addObject:[[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:@"herospriteK06.png"]];
            [spriteKWalkAnimFramesLeft addObject:[[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:@"herospriteK06.png"]];
            [spriteKWalkAnimFramesLeft addObject:[[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:@"herospriteK06.png"]];
            [spriteKWalkAnimFramesLeft addObject:[[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:@"herospriteK05.png"]];
            spriteKWalkLeft = [CCAnimation animationWithFrames:spriteKWalkAnimFramesLeft delay:0.06f];
            [spriteKWalkLeft retain];
            
            [spriteKWalkAnimFramesRight addObject:[[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:@"herospriteK04.png"]];
            [spriteKWalkAnimFramesRight addObject:[[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:@"herospriteK07.png"]];
            [spriteKWalkAnimFramesRight addObject:[[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:@"herospriteK07.png"]];
            [spriteKWalkAnimFramesRight addObject:[[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:@"herospriteK07.png"]];
            [spriteKWalkAnimFramesRight addObject:[[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:@"herospriteK04.png"]];
            spriteKWalkRight = [CCAnimation animationWithFrames:spriteKWalkAnimFramesRight delay:0.06f];
            [spriteKWalkRight retain];
            
            [spriteKAnimFramesUp addObject:[[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:@"herospriteK08.png"]];
            [spriteKAnimFramesUp addObject:[[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:@"herospriteK09.png"]];
            [spriteKAnimFramesUp addObject:[[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:@"herospriteK09.png"]];
            [spriteKAnimFramesUp addObject:[[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:@"herospriteK09.png"]];
            [spriteKAnimFramesUp addObject:[[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:@"herospriteK08.png"]];
            spriteKWalkUp = [CCAnimation animationWithFrames:spriteKAnimFramesUp delay:0.06f];
            [spriteKWalkUp retain];
            
            [spriteKAnimFramesUp2 addObject:[[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:@"herospriteK08.png"]];
            [spriteKAnimFramesUp2 addObject:[[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:@"herospriteK10.png"]];
            [spriteKAnimFramesUp2 addObject:[[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:@"herospriteK10.png"]];
            [spriteKAnimFramesUp2 addObject:[[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:@"herospriteK10.png"]];
            [spriteKAnimFramesUp2 addObject:[[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:@"herospriteK08.png"]];
            spriteKWalkUp2 = [CCAnimation animationWithFrames:spriteKAnimFramesUp2 delay:0.06f];
            [spriteKWalkUp2 retain];
            
            [spriteKAnimFramesDown addObject:[[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:@"herospriteK01.png"]];
            [spriteKAnimFramesDown addObject:[[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:@"herospriteK02.png"]];
            [spriteKAnimFramesDown addObject:[[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:@"herospriteK02.png"]];
            [spriteKAnimFramesDown addObject:[[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:@"herospriteK02.png"]];
            [spriteKAnimFramesDown addObject:[[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:@"herospriteK01.png"]];
            spriteKWalkDown = [CCAnimation animationWithFrames:spriteKAnimFramesDown delay:0.06f];
            [spriteKWalkDown retain];
            
            [spriteKAnimFramesDown2 addObject:[[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:@"herospriteK01.png"]];
            [spriteKAnimFramesDown2 addObject:[[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:@"herospriteK03.png"]];
            [spriteKAnimFramesDown2 addObject:[[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:@"herospriteK03.png"]];
            [spriteKAnimFramesDown2 addObject:[[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:@"herospriteK03.png"]];
            [spriteKAnimFramesDown2 addObject:[[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:@"herospriteK01.png"]];
            spriteKWalkDown2 = [CCAnimation animationWithFrames:spriteKAnimFramesDown2 delay:0.06f];
            [spriteKWalkDown2 retain];
            
            
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
        
        
        self.sprite61 = [InteractiveSprite spriteWithSpriteFrameName:@"herospriteA04.png"];
        self.sprite61.spriteCode = 61;
        
        self.sprite61.orientation = 1;
        if (self.hero.sprite61_Orientation)
        {
            self.sprite61.orientation = self.hero.sprite61_Orientation;
        }
        if (self.sprite61.orientation == 1)
        {
            [self.sprite61 setDisplayFrame:[[spriteAWalkDown frames] objectAtIndex:0]];
        }
        else if (self.sprite61.orientation == 2)
        {
            [self.sprite61 setDisplayFrame:[[spriteAWalkUp frames] objectAtIndex:0]];
        }
        else if (self.sprite61.orientation == 3)
        {
            [self.sprite61 setDisplayFrame:[[spriteAWalkRight frames] objectAtIndex:0]];
        }
        else
        {
            [self.sprite61 setDisplayFrame:[[spriteAWalkLeft frames] objectAtIndex:0]];
        }
        
        //[self schedule:@selector(updateSprite61) interval:(1.5f)];
        
        
        if (self.hero.sprite61position.x != 0)
        {
            self.sprite61.position = self.hero.sprite61position;
        }
        else
        {
            NSMutableDictionary *sprite61start = [objects objectNamed:@"spriteStart61"];
            double x1 = [[sprite61start valueForKey:@"x"]floatValue];
            double y1 = [[sprite61start valueForKey:@"y"]floatValue];
            self.sprite61.position = ccp(x1,y1);
        }
        
        
        [self.theHKMap addChild:self.sprite61 z:self.bgLayer.zOrder];
        
        CGPoint tileCoord1 = [self tileCoordForPosition:self.sprite61.position];
        int tileGID1 = [self.bgLayer tileGIDAt:tileCoord1];
        [self.bgLayer removeTileAt:tileCoord1];
        [self.bgLayer setTileGID:(tileGID1 + 1) at:tileCoord1];
        
        ////////////////////////////////////////////////////////////////////////
    
        self.sprite62 = [InteractiveSprite spriteWithSpriteFrameName:@"herospriteA04.png"];
        self.sprite62.spriteCode = 62;
        
        self.sprite62.orientation = 1;
        if (self.hero.sprite62_Orientation)
        {
            self.sprite62.orientation = self.hero.sprite62_Orientation;
        }
        if (self.sprite62.orientation == 1)
        {
            [self.sprite62 setDisplayFrame:[[spriteAWalkDown frames] objectAtIndex:0]];
        }
        else if (self.sprite62.orientation == 2)
        {
            [self.sprite62 setDisplayFrame:[[spriteAWalkUp frames] objectAtIndex:0]];
        }
        else if (self.sprite62.orientation == 3)
        {
            [self.sprite62 setDisplayFrame:[[spriteAWalkRight frames] objectAtIndex:0]];
        }
        else
        {
            [self.sprite62 setDisplayFrame:[[spriteAWalkLeft frames] objectAtIndex:0]];
        }
        
        //[self schedule:@selector(updateSprite62) interval:(1.75f)];
        
        
        if (self.hero.sprite62position.x != 0)
        {
            self.sprite62.position = self.hero.sprite62position;
        }
        else
        {
            NSMutableDictionary *sprite62start = [objects objectNamed:@"spriteStart62"];
            double x1 = [[sprite62start valueForKey:@"x"]floatValue];
            double y1 = [[sprite62start valueForKey:@"y"]floatValue];
            self.sprite62.position = ccp(x1,y1);
        }
        
        
        [self.theHKMap addChild:self.sprite62 z:self.bgLayer.zOrder];
        
        CGPoint tileCoord2 = [self tileCoordForPosition:self.sprite62.position];
        int tileGID2 = [self.bgLayer tileGIDAt:tileCoord2];
        [self.bgLayer removeTileAt:tileCoord2];
        [self.bgLayer setTileGID:(tileGID2 + 2) at:tileCoord2];
        
        ////////////////////////////////////////////////////////////////////////
        
        self.sprite63 = [InteractiveSprite spriteWithSpriteFrameName:@"herospriteA04.png"];
        self.sprite63.spriteCode = 63;
        
        self.sprite63.orientation = 1;
        if (self.hero.sprite63_Orientation)
        {
            self.sprite63.orientation = self.hero.sprite63_Orientation;
        }
        if (self.sprite63.orientation == 1)
        {
            [self.sprite63 setDisplayFrame:[[spriteAWalkDown frames] objectAtIndex:0]];
        }
        else if (self.sprite63.orientation == 2)
        {
            [self.sprite63 setDisplayFrame:[[spriteAWalkUp frames] objectAtIndex:0]];
        }
        else if (self.sprite63.orientation == 3)
        {
            [self.sprite63 setDisplayFrame:[[spriteAWalkRight frames] objectAtIndex:0]];
        }
        else
        {
            [self.sprite63 setDisplayFrame:[[spriteAWalkLeft frames] objectAtIndex:0]];
        }
        
        //[self schedule:@selector(updateSprite63) interval:(1.875f)];
        
        
        if (self.hero.sprite63position.x != 0)
        {
            self.sprite63.position = self.hero.sprite63position;
        }
        else
        {
            NSMutableDictionary *sprite63start = [objects objectNamed:@"spriteStart63"];
            double x1 = [[sprite63start valueForKey:@"x"]floatValue];
            double y1 = [[sprite63start valueForKey:@"y"]floatValue];
            self.sprite63.position = ccp(x1,y1);
        }
        
        
        [self.theHKMap addChild:self.sprite63 z:self.bgLayer.zOrder];
        
        CGPoint tileCoord3 = [self tileCoordForPosition:self.sprite63.position];
        int tileGID3 = [self.bgLayer tileGIDAt:tileCoord3];
        [self.bgLayer removeTileAt:tileCoord3];
        [self.bgLayer setTileGID:(tileGID3 + 3) at:tileCoord3];
        
        ////////////////////////////////////////////////////////////////////////
        
        self.sprite64 = [InteractiveSprite spriteWithSpriteFrameName:@"herospriteK04.png"];
        self.sprite64.spriteCode = 64;
        
        self.sprite64.orientation = 1;
        if (self.hero.sprite64_Orientation)
        {
            self.sprite64.orientation = self.hero.sprite64_Orientation;
        }
        if (self.sprite64.orientation == 1)
        {
            [self.sprite64 setDisplayFrame:[[spriteKWalkDown frames] objectAtIndex:0]];
        }
        else if (self.sprite64.orientation == 2)
        {
            [self.sprite64 setDisplayFrame:[[spriteKWalkUp frames] objectAtIndex:0]];
        }
        else if (self.sprite64.orientation == 3)
        {
            [self.sprite64 setDisplayFrame:[[spriteKWalkRight frames] objectAtIndex:0]];
        }
        else
        {
            [self.sprite64 setDisplayFrame:[[spriteKWalkLeft frames] objectAtIndex:0]];
        }
        
        //[self schedule:@selector(updateSprite64) interval:(1.25f)];
        
        
        if (self.hero.sprite64position.x != 0)
        {
            self.sprite64.position = self.hero.sprite64position;
        }
        else
        {
            NSMutableDictionary *sprite64start = [objects objectNamed:@"spriteStart64"];
            double x1 = [[sprite64start valueForKey:@"x"]floatValue];
            double y1 = [[sprite64start valueForKey:@"y"]floatValue];
            self.sprite64.position = ccp(x1,y1);
        }
        
        
        [self.theHKMap addChild:self.sprite64 z:self.bgLayer.zOrder];
        
        CGPoint tileCoord4 = [self tileCoordForPosition:self.sprite64.position];
        int tileGID4 = [self.bgLayer tileGIDAt:tileCoord4];
        [self.bgLayer removeTileAt:tileCoord4];
        [self.bgLayer setTileGID:(tileGID4 + 4) at:tileCoord4];
        
        ////////////////////////////////////////////////////////////////////////

        self.sprite65 = [InteractiveSprite spriteWithSpriteFrameName:@"herospriteV04.png"];
        self.sprite65.spriteCode = 65;
        
        self.sprite65.orientation = 1;
        if (self.hero.sprite65_Orientation)
        {
            self.sprite65.orientation = self.hero.sprite65_Orientation;
        }
        if (self.sprite65.orientation == 1)
        {
            [self.sprite65 setDisplayFrame:[[spriteVWalkDown frames] objectAtIndex:0]];
        }
        else if (self.sprite65.orientation == 2)
        {
            [self.sprite65 setDisplayFrame:[[spriteVWalkUp frames] objectAtIndex:0]];
        }
        else if (self.sprite65.orientation == 3)
        {
            [self.sprite65 setDisplayFrame:[[spriteVWalkRight frames] objectAtIndex:0]];
        }
        else
        {
            [self.sprite65 setDisplayFrame:[[spriteVWalkLeft frames] objectAtIndex:0]];
        }
        
        //[self schedule:@selector(updateSprite65) interval:(2.0)];
        
        
        if (self.hero.sprite65position.x != 0)
        {
            self.sprite65.position = self.hero.sprite65position;
        }
        else
        {
            NSMutableDictionary *sprite65start = [objects objectNamed:@"spriteStart65"];
            double x1 = [[sprite65start valueForKey:@"x"]floatValue];
            double y1 = [[sprite65start valueForKey:@"y"]floatValue];
            self.sprite65.position = ccp(x1,y1);
        }
        
        
        [self.theHKMap addChild:self.sprite65 z:self.bgLayer.zOrder];
        
        CGPoint tileCoord5 = [self tileCoordForPosition:self.sprite65.position];
        int tileGID5 = [self.bgLayer tileGIDAt:tileCoord5];
        [self.bgLayer removeTileAt:tileCoord5];
        [self.bgLayer setTileGID:(tileGID5 + 5) at:tileCoord5];
        
        ////////////////////////////////////////////////////////////////////////
        
        self.sprite66 = [InteractiveSprite spriteWithSpriteFrameName:@"herospriteN04.png"];
        self.sprite66.spriteCode = 66;
        
        self.sprite66.orientation = 1;
        if (self.hero.sprite66_Orientation)
        {
            self.sprite66.orientation = self.hero.sprite66_Orientation;
        }
        if (self.sprite66.orientation == 1)
        {
            [self.sprite66 setDisplayFrame:[[spriteNWalkDown frames] objectAtIndex:0]];
        }
        else if (self.sprite66.orientation == 2)
        {
            [self.sprite66 setDisplayFrame:[[spriteNWalkUp frames] objectAtIndex:0]];
        }
        else if (self.sprite66.orientation == 3)
        {
            [self.sprite66 setDisplayFrame:[[spriteNWalkRight frames] objectAtIndex:0]];
        }
        else
        {
            [self.sprite66 setDisplayFrame:[[spriteNWalkLeft frames] objectAtIndex:0]];
        }
        
        //[self schedule:@selector(updateSprite66) interval:(1.625f)];
        
        
        if (self.hero.sprite66position.x != 0)
        {
            self.sprite66.position = self.hero.sprite66position;
        }
        else
        {
            NSMutableDictionary *sprite66start = [objects objectNamed:@"spriteStart66"];
            double x1 = [[sprite66start valueForKey:@"x"]floatValue];
            double y1 = [[sprite66start valueForKey:@"y"]floatValue];
            self.sprite66.position = ccp(x1,y1);
        }
        
        
        [self.theHKMap addChild:self.sprite66 z:self.bgLayer.zOrder];
        
        CGPoint tileCoord6 = [self tileCoordForPosition:self.sprite66.position];
        int tileGID6 = [self.bgLayer tileGIDAt:tileCoord6];
        [self.bgLayer removeTileAt:tileCoord6];
        [self.bgLayer setTileGID:(tileGID6 + 6) at:tileCoord6];
        
        ////////////////////////////////////////////////////////////////////////
        
        self.sprite67 = [InteractiveSprite spriteWithSpriteFrameName:@"herospriteR04.png"];
        self.sprite67.spriteCode = 67;
        
        self.sprite67.orientation = 1;
        if (self.hero.sprite67_Orientation)
        {
            self.sprite67.orientation = self.hero.sprite67_Orientation;
        }
        if (self.sprite67.orientation == 1)
        {
            [self.sprite67 setDisplayFrame:[[spriteRWalkDown frames] objectAtIndex:0]];
        }
        else if (self.sprite67.orientation == 2)
        {
            [self.sprite67 setDisplayFrame:[[spriteRWalkUp frames] objectAtIndex:0]];
        }
        else if (self.sprite67.orientation == 3)
        {
            [self.sprite67 setDisplayFrame:[[spriteRWalkRight frames] objectAtIndex:0]];
        }
        else
        {
            [self.sprite67 setDisplayFrame:[[spriteRWalkLeft frames] objectAtIndex:0]];
        }
        
        //[self schedule:@selector(updateSprite67) interval:(1.5f)];
        
        
        if (self.hero.sprite67position.x != 0)
        {
            self.sprite67.position = self.hero.sprite67position;
        }
        else
        {
            NSMutableDictionary *sprite67start = [objects objectNamed:@"spriteStart67"];
            double x1 = [[sprite67start valueForKey:@"x"]floatValue];
            double y1 = [[sprite67start valueForKey:@"y"]floatValue];
            self.sprite67.position = ccp(x1,y1);
        }
        
        
        [self.theHKMap addChild:self.sprite67 z:self.bgLayer.zOrder];
        
        CGPoint tileCoord7 = [self tileCoordForPosition:self.sprite67.position];
        int tileGID7 = [self.bgLayer tileGIDAt:tileCoord7];
        [self.bgLayer removeTileAt:tileCoord7];
        [self.bgLayer setTileGID:(tileGID7 + 7) at:tileCoord7];
        
        ////////////////////////////////////////////////////////////////////////
        
        self.sprite68 = [InteractiveSprite spriteWithSpriteFrameName:@"herospriteG04.png"];
        self.sprite68.spriteCode = 68;
        
        self.sprite68.orientation = 1;
        if (self.hero.sprite68_Orientation)
        {
            self.sprite68.orientation = self.hero.sprite68_Orientation;
        }
        if (self.sprite68.orientation == 1)
        {
            [self.sprite68 setDisplayFrame:[[spriteGWalkDown frames] objectAtIndex:0]];
        }
        else if (self.sprite68.orientation == 2)
        {
            [self.sprite68 setDisplayFrame:[[spriteGWalkUp frames] objectAtIndex:0]];
        }
        else if (self.sprite68.orientation == 3)
        {
            [self.sprite68 setDisplayFrame:[[spriteGWalkRight frames] objectAtIndex:0]];
        }
        else
        {
            [self.sprite68 setDisplayFrame:[[spriteGWalkLeft frames] objectAtIndex:0]];
        }
        
        //[self schedule:@selector(updateSprite68) interval:(1.25f)];
        
        
        if (self.hero.sprite68position.x != 0)
        {
            self.sprite68.position = self.hero.sprite68position;
        }
        else
        {
            NSMutableDictionary *sprite68start = [objects objectNamed:@"spriteStart68"];
            double x1 = [[sprite68start valueForKey:@"x"]floatValue];
            double y1 = [[sprite68start valueForKey:@"y"]floatValue];
            self.sprite68.position = ccp(x1,y1);
        }
        
        
        [self.theHKMap addChild:self.sprite68 z:self.bgLayer.zOrder];
        
        CGPoint tileCoord8 = [self tileCoordForPosition:self.sprite68.position];
        int tileGID8 = [self.bgLayer tileGIDAt:tileCoord8];
        [self.bgLayer removeTileAt:tileCoord8];
        [self.bgLayer setTileGID:(tileGID8 + 8) at:tileCoord8];
        
        ////////////////////////////////////////////////////////////////////////
        
        self.sprite69 = [InteractiveSprite spriteWithSpriteFrameName:@"herospriteH04.png"];
        self.sprite69.spriteCode = 69;
        
        self.sprite69.orientation = 1;
        if (self.hero.sprite69_Orientation)
        {
            self.sprite69.orientation = self.hero.sprite69_Orientation;
        }
        if (self.sprite69.orientation == 1)
        {
            [self.sprite69 setDisplayFrame:[[spriteHWalkDown frames] objectAtIndex:0]];
        }
        else if (self.sprite69.orientation == 2)
        {
            [self.sprite69 setDisplayFrame:[[spriteHWalkUp frames] objectAtIndex:0]];
        }
        else if (self.sprite69.orientation == 3)
        {
            [self.sprite69 setDisplayFrame:[[spriteHWalkRight frames] objectAtIndex:0]];
        }
        else
        {
            [self.sprite69 setDisplayFrame:[[spriteHWalkLeft frames] objectAtIndex:0]];
        }
        
        //[self schedule:@selector(updateSprite69) interval:(2.25f)];
        
        
        if (self.hero.sprite69position.x != 0)
        {
            self.sprite69.position = self.hero.sprite69position;
        }
        else
        {
            NSMutableDictionary *sprite69start = [objects objectNamed:@"spriteStart69"];
            double x1 = [[sprite69start valueForKey:@"x"]floatValue];
            double y1 = [[sprite69start valueForKey:@"y"]floatValue];
            self.sprite69.position = ccp(x1,y1);
        }
        
        
        [self.theHKMap addChild:self.sprite69 z:self.bgLayer.zOrder];
        
        CGPoint tileCoord9 = [self tileCoordForPosition:self.sprite69.position];
        int tileGID9 = [self.bgLayer tileGIDAt:tileCoord9];
        [self.bgLayer removeTileAt:tileCoord9];
        [self.bgLayer setTileGID:(tileGID9 + 9) at:tileCoord9];
        
        ////////////////////////////////////////////////////////////////////////
        
        self.sprite70 = [InteractiveSprite spriteWithSpriteFrameName:@"herospriteM04.png"];
        self.sprite70.spriteCode = 70;
        
        self.sprite70.orientation = 1;
        if (self.hero.sprite70_Orientation)
        {
            self.sprite70.orientation = self.hero.sprite70_Orientation;
        }
        if (self.sprite70.orientation == 1)
        {
            [self.sprite70 setDisplayFrame:[[spriteMWalkDown frames] objectAtIndex:0]];
        }
        else if (self.sprite70.orientation == 2)
        {
            [self.sprite70 setDisplayFrame:[[spriteMWalkUp frames] objectAtIndex:0]];
        }
        else if (self.sprite70.orientation == 3)
        {
            [self.sprite70 setDisplayFrame:[[spriteMWalkRight frames] objectAtIndex:0]];
        }
        else
        {
            [self.sprite70 setDisplayFrame:[[spriteMWalkLeft frames] objectAtIndex:0]];
        }
        
        //[self schedule:@selector(updateSprite70) interval:(1.75f)];
        
        
        if (!self.hero.talkedToWatchmen)
        {
            NSMutableDictionary *sprite70start = [objects objectNamed:@"caveBlock"];
            double x1 = [[sprite70start valueForKey:@"x"]floatValue];
            double y1 = [[sprite70start valueForKey:@"y"]floatValue];
            self.sprite70.position = ccp(x1,y1);
        }
        else if (self.hero.sprite70position.x != 0)
        {
            self.sprite70.position = self.hero.sprite70position;
        }
        else
        {
            NSMutableDictionary *sprite70start = [objects objectNamed:@"spriteStart70"];
            double x1 = [[sprite70start valueForKey:@"x"]floatValue];
            double y1 = [[sprite70start valueForKey:@"y"]floatValue];
            self.sprite70.position = ccp(x1,y1);
        }
        
        
        [self.theHKMap addChild:self.sprite70 z:self.bgLayer.zOrder];
        
        CGPoint tileCoord10 = [self tileCoordForPosition:self.sprite70.position];
        int tileGID10 = [self.bgLayer tileGIDAt:tileCoord10];
        [self.bgLayer removeTileAt:tileCoord10];
        [self.bgLayer setTileGID:(tileGID10 + 10) at:tileCoord10];
        
        ////////////////////////////////////////////////////////////////////////

        self.sprite71 = [InteractiveSprite spriteWithSpriteFrameName:@"herospriteP04.png"];
        self.sprite71.spriteCode = 71;
        
        self.sprite71.orientation = 1;
        if (self.hero.sprite71_Orientation)
        {
            self.sprite71.orientation = self.hero.sprite71_Orientation;
        }
        if (self.sprite71.orientation == 1)
        {
            [self.sprite71 setDisplayFrame:[[spritePWalkDown frames] objectAtIndex:0]];
        }
        else if (self.sprite71.orientation == 2)
        {
            [self.sprite71 setDisplayFrame:[[spritePWalkUp frames] objectAtIndex:0]];
        }
        else if (self.sprite71.orientation == 3)
        {
            [self.sprite71 setDisplayFrame:[[spritePWalkRight frames] objectAtIndex:0]];
        }
        else
        {
            [self.sprite71 setDisplayFrame:[[spritePWalkLeft frames] objectAtIndex:0]];
        }
        
        //[self schedule:@selector(updateSprite71) interval:(0.75f)];
        
        
        if (self.hero.sprite71position.x != 0)
        {
            self.sprite71.position = self.hero.sprite71position;
        }
        else
        {
            NSMutableDictionary *sprite71start = [objects objectNamed:@"spriteStart71"];
            double x1 = [[sprite71start valueForKey:@"x"]floatValue];
            double y1 = [[sprite71start valueForKey:@"y"]floatValue];
            self.sprite71.position = ccp(x1,y1);
        }
        
        
        [self.theHKMap addChild:self.sprite71 z:self.bgLayer.zOrder];
        
        CGPoint tileCoord11 = [self tileCoordForPosition:self.sprite71.position];
        int tileGID11 = [self.bgLayer tileGIDAt:tileCoord11];
        [self.bgLayer removeTileAt:tileCoord11];
        [self.bgLayer setTileGID:(tileGID11 + 11) at:tileCoord11];
        
        ////////////////////////////////////////////////////////////////////////
        
        self.sprite72 = [InteractiveSprite spriteWithSpriteFrameName:@"herospriteT04.png"];
        self.sprite72.spriteCode = 72;
        
        self.sprite72.orientation = 1;
        if (self.hero.sprite72_Orientation)
        {
            self.sprite72.orientation = self.hero.sprite72_Orientation;
        }
        if (self.sprite72.orientation == 1)
        {
            [self.sprite72 setDisplayFrame:[[spriteTWalkDown frames] objectAtIndex:0]];
        }
        else if (self.sprite72.orientation == 2)
        {
            [self.sprite72 setDisplayFrame:[[spriteTWalkUp frames] objectAtIndex:0]];
        }
        else if (self.sprite72.orientation == 3)
        {
            [self.sprite72 setDisplayFrame:[[spriteTWalkRight frames] objectAtIndex:0]];
        }
        else
        {
            [self.sprite72 setDisplayFrame:[[spriteTWalkLeft frames] objectAtIndex:0]];
        }
        
        //[self schedule:@selector(updateSprite72) interval:(1.5f)];
        
        
        if (self.hero.sprite72position.x != 0)
        {
            self.sprite72.position = self.hero.sprite72position;
        }
        else
        {
            NSMutableDictionary *sprite72start = [objects objectNamed:@"spriteStart72"];
            double x1 = [[sprite72start valueForKey:@"x"]floatValue];
            double y1 = [[sprite72start valueForKey:@"y"]floatValue];
            self.sprite72.position = ccp(x1,y1);
        }
        
        
        [self.theHKMap addChild:self.sprite72 z:self.bgLayer.zOrder];
        
        CGPoint tileCoord12 = [self tileCoordForPosition:self.sprite72.position];
        int tileGID12 = [self.bgLayer tileGIDAt:tileCoord12];
        [self.bgLayer removeTileAt:tileCoord12];
        [self.bgLayer setTileGID:(tileGID12 + 12) at:tileCoord12];
        
        ////////////////////////////////////////////////////////////////////////
        
        self.sprite73 = [InteractiveSprite spriteWithSpriteFrameName:@"herospriteY04.png"];
        self.sprite73.spriteCode = 73;
        
        self.sprite73.orientation = 1;
        if (self.hero.sprite73_Orientation)
        {
            self.sprite73.orientation = self.hero.sprite73_Orientation;
        }
        if (self.sprite73.orientation == 1)
        {
            [self.sprite73 setDisplayFrame:[[spriteYWalkDown frames] objectAtIndex:0]];
        }
        else if (self.sprite73.orientation == 2)
        {
            [self.sprite73 setDisplayFrame:[[spriteYWalkUp frames] objectAtIndex:0]];
        }
        else if (self.sprite73.orientation == 3)
        {
            [self.sprite73 setDisplayFrame:[[spriteYWalkRight frames] objectAtIndex:0]];
        }
        else
        {
            [self.sprite73 setDisplayFrame:[[spriteYWalkLeft frames] objectAtIndex:0]];
        }
        
        //[self schedule:@selector(updateSprite73) interval:(1.375f)];
        
        
        if (self.hero.sprite73position.x != 0)
        {
            self.sprite73.position = self.hero.sprite73position;
        }
        else
        {
            NSMutableDictionary *sprite73start = [objects objectNamed:@"spriteStart73"];
            double x1 = [[sprite73start valueForKey:@"x"]floatValue];
            double y1 = [[sprite73start valueForKey:@"y"]floatValue];
            self.sprite73.position = ccp(x1,y1);
        }
        
        
        [self.theHKMap addChild:self.sprite73 z:self.bgLayer.zOrder];
        
        CGPoint tileCoord13 = [self tileCoordForPosition:self.sprite73.position];
        int tileGID13 = [self.bgLayer tileGIDAt:tileCoord13];
        [self.bgLayer removeTileAt:tileCoord13];
        [self.bgLayer setTileGID:(tileGID13 + 13) at:tileCoord13];
        
        ////////////////////////////////////////////////////////////////////////

        self.sprite74 = [InteractiveSprite spriteWithSpriteFrameName:@"herospriteZB04.png"];
        self.sprite74.spriteCode = 74;
        
        self.sprite74.orientation = 1;
        if (self.hero.sprite74_Orientation)
        {
            self.sprite74.orientation = self.hero.sprite74_Orientation;
        }
        if (self.sprite74.orientation == 1)
        {
            [self.sprite74 setDisplayFrame:[[spriteZBWalkDown frames] objectAtIndex:0]];
        }
        else if (self.sprite74.orientation == 2)
        {
            [self.sprite74 setDisplayFrame:[[spriteZBWalkUp frames] objectAtIndex:0]];
        }
        else if (self.sprite74.orientation == 3)
        {
            [self.sprite74 setDisplayFrame:[[spriteZBWalkRight frames] objectAtIndex:0]];
        }
        else
        {
            [self.sprite74 setDisplayFrame:[[spriteZBWalkLeft frames] objectAtIndex:0]];
        }
        
        //[self schedule:@selector(updateSprite74) interval:(1.75f)];
        
        
        if (self.hero.sprite74position.x != 0)
        {
            self.sprite74.position = self.hero.sprite74position;
        }
        else
        {
            NSMutableDictionary *sprite74start = [objects objectNamed:@"spriteStart74"];
            double x1 = [[sprite74start valueForKey:@"x"]floatValue];
            double y1 = [[sprite74start valueForKey:@"y"]floatValue];
            self.sprite74.position = ccp(x1,y1);
        }
        
        
        [self.theHKMap addChild:self.sprite74 z:self.bgLayer.zOrder];
        
        CGPoint tileCoord14 = [self tileCoordForPosition:self.sprite74.position];
        int tileGID14 = [self.bgLayer tileGIDAt:tileCoord14];
        [self.bgLayer removeTileAt:tileCoord14];
        [self.bgLayer setTileGID:(tileGID14 + 14) at:tileCoord14];
        
        ////////////////////////////////////////////////////////////////////////
        
        self.sprite75 = [InteractiveSprite spriteWithSpriteFrameName:@"herospriteZ04.png"];
        self.sprite75.spriteCode = 75;
        
        self.sprite75.orientation = 1;
        if (self.hero.sprite75_Orientation)
        {
            self.sprite75.orientation = self.hero.sprite75_Orientation;
        }
        if (self.sprite75.orientation == 1)
        {
            [self.sprite75 setDisplayFrame:[[spriteZWalkDown frames] objectAtIndex:0]];
        }
        else if (self.sprite75.orientation == 2)
        {
            [self.sprite75 setDisplayFrame:[[spriteZWalkUp frames] objectAtIndex:0]];
        }
        else if (self.sprite75.orientation == 3)
        {
            [self.sprite75 setDisplayFrame:[[spriteZWalkRight frames] objectAtIndex:0]];
        }
        else
        {
            [self.sprite75 setDisplayFrame:[[spriteZWalkLeft frames] objectAtIndex:0]];
        }
        
        //[self schedule:@selector(updateSprite75) interval:(1.75f)];
        
        
        if (self.hero.sprite75position.x != 0)
        {
            self.sprite75.position = self.hero.sprite75position;
        }
        else
        {
            NSMutableDictionary *sprite75start = [objects objectNamed:@"spriteStart75"];
            double x1 = [[sprite75start valueForKey:@"x"]floatValue];
            double y1 = [[sprite75start valueForKey:@"y"]floatValue];
            self.sprite75.position = ccp(x1,y1);
        }
        
        
        [self.theHKMap addChild:self.sprite75 z:self.bgLayer.zOrder];
        
        CGPoint tileCoord15 = [self tileCoordForPosition:self.sprite75.position];
        int tileGID15 = [self.bgLayer tileGIDAt:tileCoord15];
        [self.bgLayer removeTileAt:tileCoord15];
        [self.bgLayer setTileGID:(tileGID15 + 15) at:tileCoord15];
        
        ////////////////////////////////////////////////////////////////////////

        self.sprite76 = [InteractiveSprite spriteWithSpriteFrameName:@"herospriteU04.png"];
        self.sprite76.spriteCode = 76;
        
        self.sprite76.orientation = 1;
        if (self.hero.sprite76_Orientation)
        {
            self.sprite76.orientation = self.hero.sprite76_Orientation;
        }
        if (self.sprite76.orientation == 1)
        {
            [self.sprite76 setDisplayFrame:[[spriteUWalkDown frames] objectAtIndex:0]];
        }
        else if (self.sprite76.orientation == 2)
        {
            [self.sprite76 setDisplayFrame:[[spriteUWalkUp frames] objectAtIndex:0]];
        }
        else if (self.sprite76.orientation == 3)
        {
            [self.sprite76 setDisplayFrame:[[spriteUWalkRight frames] objectAtIndex:0]];
        }
        else
        {
            [self.sprite76 setDisplayFrame:[[spriteUWalkLeft frames] objectAtIndex:0]];
        }
        
        //[self schedule:@selector(updateSprite76) interval:(1.25f)];
        
        
        if (self.hero.sprite76position.x != 0)
        {
            self.sprite76.position = self.hero.sprite76position;
        }
        else
        {
            NSMutableDictionary *sprite76start = [objects objectNamed:@"spriteStart76"];
            double x1 = [[sprite76start valueForKey:@"x"]floatValue];
            double y1 = [[sprite76start valueForKey:@"y"]floatValue];
            self.sprite76.position = ccp(x1,y1);
        }
        
        
        [self.theHKMap addChild:self.sprite76 z:self.bgLayer.zOrder];
        
        CGPoint tileCoord16 = [self tileCoordForPosition:self.sprite76.position];
        int tileGID16 = [self.bgLayer tileGIDAt:tileCoord16];
        [self.bgLayer removeTileAt:tileCoord16];
        [self.bgLayer setTileGID:(tileGID16 + 16) at:tileCoord16];
        
        ////////////////////////////////////////////////////////////////////////
        
        //items
        
        if (!self.hero.gotItem9)
        {
            self.item9 = [CCSprite spriteWithFile:@"treasurechestSprite01.png"];
            NSMutableDictionary *item = [objects objectNamed:@"item9"];
            double x1 = [[item valueForKey:@"x"]floatValue];
            double y1 = [[item valueForKey:@"y"]floatValue];
            self.item9.position = ccp(x1,y1);
            [self.theHKMap addChild:self.item9 z:self.bgLayer.zOrder];
        }
        else
        {
            self.item9 = [CCSprite spriteWithFile:@"treasurechestSprite02.png"];
            NSMutableDictionary *item = [objects objectNamed:@"item9"];
            double x1 = [[item valueForKey:@"x"]floatValue];
            double y1 = [[item valueForKey:@"y"]floatValue];
            self.item9.position = ccp(x1,y1);
            [self.theHKMap addChild:self.item9 z:self.bgLayer.zOrder];
        }
        if (!self.hero.gotItem11)
        {
            self.item11 = [CCSprite spriteWithFile:@"treasurechestSprite01.png"];
            NSMutableDictionary *item = [objects objectNamed:@"item11"];
            double x1 = [[item valueForKey:@"x"]floatValue];
            double y1 = [[item valueForKey:@"y"]floatValue];
            self.item11.position = ccp(x1,y1);
            [self.theHKMap addChild:self.item11 z:self.bgLayer.zOrder];
        }
        else
        {
            self.item11 = [CCSprite spriteWithFile:@"treasurechestSprite02.png"];
            NSMutableDictionary *item = [objects objectNamed:@"item11"];
            double x1 = [[item valueForKey:@"x"]floatValue];
            double y1 = [[item valueForKey:@"y"]floatValue];
            self.item11.position = ccp(x1,y1);
            [self.theHKMap addChild:self.item11 z:self.bgLayer.zOrder];
        }
        if (!self.hero.gotItem12)
        {
            self.item12 = [CCSprite spriteWithFile:@"treasurechestSprite01.png"];
            NSMutableDictionary *item = [objects objectNamed:@"item12"];
            double x1 = [[item valueForKey:@"x"]floatValue];
            double y1 = [[item valueForKey:@"y"]floatValue];
            self.item12.position = ccp(x1,y1);
            [self.theHKMap addChild:self.item12 z:self.bgLayer.zOrder];
        }
        else
        {
            self.item12 = [CCSprite spriteWithFile:@"treasurechestSprite02.png"];
            NSMutableDictionary *item = [objects objectNamed:@"item12"];
            double x1 = [[item valueForKey:@"x"]floatValue];
            double y1 = [[item valueForKey:@"y"]floatValue];
            self.item12.position = ccp(x1,y1);
            [self.theHKMap addChild:self.item12 z:self.bgLayer.zOrder];
        }
        if (!self.hero.gotItem10)
        {
            self.item10 = [CCSprite spriteWithFile:@"goldpilesprite01.png"];
            NSMutableDictionary *item = [objects objectNamed:@"item10"];
            double x1 = [[item valueForKey:@"x"]floatValue];
            double y1 = [[item valueForKey:@"y"]floatValue];
            self.item10.position = ccp(x1,y1);
            [self.theHKMap addChild:self.item10 z:self.bgLayer.zOrder];
        }
        
        
        
        double x;
        double y;
        
        prev = self.hero.musicCode;
        
        int randWeather = arc4random()%10;
        bool willRain = self.hero.isRainingPL3;
        
        //1(coming from login),2(gate/cave/stairs/dungeon), 3(teleport), 4(herodied - pl1), 5(start new game), 6(beat ionak - go pl1),7(item shop/menu),8(battle win/flee),
        if (self.hero.mapInitMode == 1)
        {
            prev = 0;
            
            self.spriteOrientation = 1;
            
            x = self.hero.position.x;
            y = self.hero.position.y;
            
            willRain = (randWeather != 0);
        }
        else if (self.hero.mapInitMode == 2)
        {
            self.hero.musicCode = 1;
            prev = 0;
            
            if (self.hero.currentMap == 1)
            {
                NSMutableDictionary *startPoint = [objects objectNamed:@"startPoint1"];
                x = [[startPoint valueForKey:@"x"]floatValue];
                y = [[startPoint valueForKey:@"y"]floatValue];
            }
            else if (self.hero.currentMap == 10)
            {
                NSMutableDictionary *startPoint = [objects objectNamed:@"startPoint3"];
                x = [[startPoint valueForKey:@"x"]floatValue];
                y = [[startPoint valueForKey:@"y"]floatValue];
                self.hero.heroOrientation = 1;
                self.hero.musicCode = 3;
            }
            else
            {
                NSLog(@"Error2");
                NSMutableDictionary *startPoint = [objects objectNamed:@"startPoint1"];
                x = [[startPoint valueForKey:@"x"]floatValue];
                y = [[startPoint valueForKey:@"y"]floatValue];
            }
            
            self.spriteOrientation = self.hero.heroOrientation;
            
            willRain = (randWeather != 0);
        }
        else if (self.hero.mapInitMode == 3)
        {
            prev = 0;
            self.hero.musicCode = 4;
            self.spriteOrientation = 1;
            
            NSMutableDictionary *startPoint = [objects objectNamed:@"startPoint2"];
            x = [[startPoint valueForKey:@"x"]floatValue];
            y = [[startPoint valueForKey:@"y"]floatValue];
            
            willRain = (randWeather != 0);
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
        self.hero.currentMap = 3;
        
        spriteCycleCount = 0;
        [self schedule:@selector(spriteCycle) interval:0.125];
        
        
        self.hero.isRainingPL3 = willRain;
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


-(void) updateSprite61
{
    CGSize screenSize = [[CCDirector sharedDirector] winSize];
    int x = self.hero.position.x;
    int y = self.hero.position.y;
    
    int p = self.sprite61.position.x;
    int q = self.sprite61.position.y;
    
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
        [self moveleftSprite61];
    }
    if (rand == 2)
    {
        [self moverightSprite61];
    }
    if (rand == 3)
    {
        [self moveupSprite61];
    }
    if (rand == 4)
    {
        [self movedownSprite61];
    }
    return;
}

-(void) moveleftSprite61
{
    CGPoint sprite61Pos = self.sprite61.position;
    self.sprite61.orientation = 4;
    sprite61Pos.x -= _theHKMap.tileSize.width;
    
    CGPoint tileCoord = [self tileCoordForPosition:sprite61Pos];
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
                    CGPoint tileCoord1 = [self tileCoordForPosition:self.sprite61.position];
                    int tileGID1 = [self.bgLayer tileGIDAt:tileCoord1];
                    [self.bgLayer removeTileAt:tileCoord1];
                    [self.bgLayer setTileGID:(tileGID1 - 1) at:tileCoord1];
                    
                    id actionMove = [CCMoveTo actionWithDuration:0.3 position:sprite61Pos];
                    id actionMove2 = [CCAnimate actionWithAnimation:spriteAWalkLeft restoreOriginalFrame:NO];
                    
                    id actionMoveDone = [CCCallFuncN actionWithTarget:self selector:@selector(finishActionSprite61)];
                    
                    [self.sprite61 runAction:[CCSpawn actionOne:[CCSequence actions:actionMove,actionMoveDone,nil] two:actionMove2]];
                    return;
                }
            }
        }
    }
    [self finishActionSprite61];
}
-(void) moverightSprite61
{
    CGPoint sprite61Pos = self.sprite61.position;
    self.sprite61.orientation = 3;
    sprite61Pos.x += _theHKMap.tileSize.width;
    
    CGPoint tileCoord = [self tileCoordForPosition:sprite61Pos];
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
                    CGPoint tileCoord1 = [self tileCoordForPosition:self.sprite61.position];
                    int tileGID1 = [self.bgLayer tileGIDAt:tileCoord1];
                    [self.bgLayer removeTileAt:tileCoord1];
                    [self.bgLayer setTileGID:(tileGID1 - 1) at:tileCoord1];
                    
                    id actionMove = [CCMoveTo actionWithDuration:0.3 position:sprite61Pos];
                    id actionMove2 = [CCAnimate actionWithAnimation:spriteAWalkRight restoreOriginalFrame:NO];
                    
                    id actionMoveDone = [CCCallFuncN actionWithTarget:self selector:@selector(finishActionSprite61)];
                    
                    [self.sprite61 runAction:[CCSpawn actionOne:[CCSequence actions:actionMove,actionMoveDone,nil] two:actionMove2]];
                    return;
                }
            }
        }
    }
    [self finishActionSprite61];
}
-(void) moveupSprite61
{
    CGPoint sprite61Pos = self.sprite61.position;
    self.sprite61.orientation = 2;
    sprite61Pos.y += _theHKMap.tileSize.height;
    
    CGPoint tileCoord = [self tileCoordForPosition:sprite61Pos];
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
                    CGPoint tileCoord1 = [self tileCoordForPosition:self.sprite61.position];
                    int tileGID1 = [self.bgLayer tileGIDAt:tileCoord1];
                    [self.bgLayer removeTileAt:tileCoord1];
                    [self.bgLayer setTileGID:(tileGID1 - 1) at:tileCoord1];
                    
                    id actionMove = [CCMoveTo actionWithDuration:0.3 position:sprite61Pos];
                    id actionMove2 = [CCAnimate actionWithAnimation:spriteAWalkUp restoreOriginalFrame:NO];
                    
                    id actionMoveDone = [CCCallFuncN actionWithTarget:self selector:@selector(finishActionSprite61)];
                    
                    [self.sprite61 runAction:[CCSpawn actionOne:[CCSequence actions:actionMove,actionMoveDone,nil] two:actionMove2]];
                    return;
                }
            }
        }
    }
    [self finishActionSprite61];
}
-(void) movedownSprite61
{
    CGPoint sprite61Pos = self.sprite61.position;
    self.sprite61.orientation = 1;
    sprite61Pos.y -= _theHKMap.tileSize.width;
    
    CGPoint tileCoord = [self tileCoordForPosition:sprite61Pos];
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
                    CGPoint tileCoord1 = [self tileCoordForPosition:self.sprite61.position];
                    int tileGID1 = [self.bgLayer tileGIDAt:tileCoord1];
                    [self.bgLayer removeTileAt:tileCoord1];
                    [self.bgLayer setTileGID:(tileGID1 - 1) at:tileCoord1];
                    
                    id actionMove = [CCMoveTo actionWithDuration:0.3 position:sprite61Pos];
                    id actionMove2 = [CCAnimate actionWithAnimation:spriteAWalkDown restoreOriginalFrame:NO];
                    
                    id actionMoveDone = [CCCallFuncN actionWithTarget:self selector:@selector(finishActionSprite61)];
                    
                    [self.sprite61 runAction:[CCSpawn actionOne:[CCSequence actions:actionMove,actionMoveDone,nil] two:actionMove2]];
                    return;
                }
            }
        }
    }
    [self finishActionSprite61];
}
-(void) finishActionSprite61
{
    if (self.sprite61.orientation == 1)
    {
        [self.sprite61 setDisplayFrame:[[spriteAWalkDown frames] objectAtIndex:0]];
    }
    else if (self.sprite61.orientation == 2)
    {
        [self.sprite61 setDisplayFrame:[[spriteAWalkUp frames] objectAtIndex:0]];
    }
    else if (self.sprite61.orientation == 3)
    {
        [self.sprite61 setDisplayFrame:[[spriteAWalkRight frames] objectAtIndex:0]];
    }
    else
    {
        [self.sprite61 setDisplayFrame:[[spriteAWalkLeft frames] objectAtIndex:0]];
    }
    self.hero.sprite61position = self.sprite61.position;
}

-(void) updateSprite62
{
    CGSize screenSize = [[CCDirector sharedDirector] winSize];
    int x = self.hero.position.x;
    int y = self.hero.position.y;
    
    int p = self.sprite62.position.x;
    int q = self.sprite62.position.y;
    
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
        [self moveleftSprite62];
    }
    if (rand == 2)
    {
        [self moverightSprite62];
    }
    if (rand == 3)
    {
        [self moveupSprite62];
    }
    if (rand == 4)
    {
        [self movedownSprite62];
    }
    return;
}

-(void) moveleftSprite62
{
    CGPoint sprite62Pos = self.sprite62.position;
    self.sprite62.orientation = 4;
    sprite62Pos.x -= _theHKMap.tileSize.width;
    
    CGPoint tileCoord = [self tileCoordForPosition:sprite62Pos];
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
                    CGPoint tileCoord1 = [self tileCoordForPosition:self.sprite62.position];
                    int tileGID1 = [self.bgLayer tileGIDAt:tileCoord1];
                    [self.bgLayer removeTileAt:tileCoord1];
                    [self.bgLayer setTileGID:(tileGID1 - 2) at:tileCoord1];
                    
                    id actionMove = [CCMoveTo actionWithDuration:0.3 position:sprite62Pos];
                    id actionMove2 = [CCAnimate actionWithAnimation:spriteAWalkLeft restoreOriginalFrame:NO];
                    
                    id actionMoveDone = [CCCallFuncN actionWithTarget:self selector:@selector(finishActionSprite62)];
                    
                    [self.sprite62 runAction:[CCSpawn actionOne:[CCSequence actions:actionMove,actionMoveDone,nil] two:actionMove2]];
                    return;
                }
            }
        }
    }
    [self finishActionSprite62];
}
-(void) moverightSprite62
{
    CGPoint sprite62Pos = self.sprite62.position;
    self.sprite62.orientation = 3;
    sprite62Pos.x += _theHKMap.tileSize.width;
    
    CGPoint tileCoord = [self tileCoordForPosition:sprite62Pos];
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
                    CGPoint tileCoord1 = [self tileCoordForPosition:self.sprite62.position];
                    int tileGID1 = [self.bgLayer tileGIDAt:tileCoord1];
                    [self.bgLayer removeTileAt:tileCoord1];
                    [self.bgLayer setTileGID:(tileGID1 - 2) at:tileCoord1];
                    
                    id actionMove = [CCMoveTo actionWithDuration:0.3 position:sprite62Pos];
                    id actionMove2 = [CCAnimate actionWithAnimation:spriteAWalkRight restoreOriginalFrame:NO];
                    
                    id actionMoveDone = [CCCallFuncN actionWithTarget:self selector:@selector(finishActionSprite62)];
                    
                    [self.sprite62 runAction:[CCSpawn actionOne:[CCSequence actions:actionMove,actionMoveDone,nil] two:actionMove2]];
                    return;
                }
            }
        }
    }
    [self finishActionSprite62];
}
-(void) moveupSprite62
{
    CGPoint sprite62Pos = self.sprite62.position;
    self.sprite62.orientation = 2;
    sprite62Pos.y += _theHKMap.tileSize.height;
    
    CGPoint tileCoord = [self tileCoordForPosition:sprite62Pos];
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
                    CGPoint tileCoord1 = [self tileCoordForPosition:self.sprite62.position];
                    int tileGID1 = [self.bgLayer tileGIDAt:tileCoord1];
                    [self.bgLayer removeTileAt:tileCoord1];
                    [self.bgLayer setTileGID:(tileGID1 - 2) at:tileCoord1];
                    
                    id actionMove = [CCMoveTo actionWithDuration:0.3 position:sprite62Pos];
                    id actionMove2 = [CCAnimate actionWithAnimation:spriteAWalkUp restoreOriginalFrame:NO];
                    
                    id actionMoveDone = [CCCallFuncN actionWithTarget:self selector:@selector(finishActionSprite62)];
                    
                    [self.sprite62 runAction:[CCSpawn actionOne:[CCSequence actions:actionMove,actionMoveDone,nil] two:actionMove2]];
                    return;
                }
            }
        }
    }
    [self finishActionSprite62];
}
-(void) movedownSprite62
{
    CGPoint sprite62Pos = self.sprite62.position;
    self.sprite62.orientation = 1;
    sprite62Pos.y -= _theHKMap.tileSize.width;
    
    CGPoint tileCoord = [self tileCoordForPosition:sprite62Pos];
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
                    CGPoint tileCoord1 = [self tileCoordForPosition:self.sprite62.position];
                    int tileGID1 = [self.bgLayer tileGIDAt:tileCoord1];
                    [self.bgLayer removeTileAt:tileCoord1];
                    [self.bgLayer setTileGID:(tileGID1 - 2) at:tileCoord1];
                    
                    id actionMove = [CCMoveTo actionWithDuration:0.3 position:sprite62Pos];
                    id actionMove2 = [CCAnimate actionWithAnimation:spriteAWalkDown restoreOriginalFrame:NO];
                    
                    id actionMoveDone = [CCCallFuncN actionWithTarget:self selector:@selector(finishActionSprite62)];
                    
                    [self.sprite62 runAction:[CCSpawn actionOne:[CCSequence actions:actionMove,actionMoveDone,nil] two:actionMove2]];
                    return;
                }
            }
        }
    }
    [self finishActionSprite62];
}
-(void) finishActionSprite62
{
    if (self.sprite62.orientation == 1)
    {
        [self.sprite62 setDisplayFrame:[[spriteAWalkDown frames] objectAtIndex:0]];
    }
    else if (self.sprite62.orientation == 2)
    {
        [self.sprite62 setDisplayFrame:[[spriteAWalkUp frames] objectAtIndex:0]];
    }
    else if (self.sprite62.orientation == 3)
    {
        [self.sprite62 setDisplayFrame:[[spriteAWalkRight frames] objectAtIndex:0]];
    }
    else
    {
        [self.sprite62 setDisplayFrame:[[spriteAWalkLeft frames] objectAtIndex:0]];
    }
    self.hero.sprite62position = self.sprite62.position;
}

-(void) updateSprite63
{
    CGSize screenSize = [[CCDirector sharedDirector] winSize];
    int x = self.hero.position.x;
    int y = self.hero.position.y;
    
    int p = self.sprite63.position.x;
    int q = self.sprite63.position.y;
    
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
        [self moveleftSprite63];
    }
    if (rand == 2)
    {
        [self moverightSprite63];
    }
    if (rand == 3)
    {
        [self moveupSprite63];
    }
    if (rand == 4)
    {
        [self movedownSprite63];
    }
    return;
}

-(void) moveleftSprite63
{
    CGPoint sprite63Pos = self.sprite63.position;
    self.sprite63.orientation = 4;
    sprite63Pos.x -= _theHKMap.tileSize.width;
    
    CGPoint tileCoord = [self tileCoordForPosition:sprite63Pos];
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
                    CGPoint tileCoord1 = [self tileCoordForPosition:self.sprite63.position];
                    int tileGID1 = [self.bgLayer tileGIDAt:tileCoord1];
                    [self.bgLayer removeTileAt:tileCoord1];
                    [self.bgLayer setTileGID:(tileGID1 - 3) at:tileCoord1];
                    
                    id actionMove = [CCMoveTo actionWithDuration:0.3 position:sprite63Pos];
                    id actionMove2 = [CCAnimate actionWithAnimation:spriteAWalkLeft restoreOriginalFrame:NO];
                    
                    id actionMoveDone = [CCCallFuncN actionWithTarget:self selector:@selector(finishActionSprite63)];
                    
                    [self.sprite63 runAction:[CCSpawn actionOne:[CCSequence actions:actionMove,actionMoveDone,nil] two:actionMove2]];
                    return;
                }
            }
        }
    }
    [self finishActionSprite63];
}
-(void) moverightSprite63
{
    CGPoint sprite63Pos = self.sprite63.position;
    self.sprite63.orientation = 3;
    sprite63Pos.x += _theHKMap.tileSize.width;
    
    CGPoint tileCoord = [self tileCoordForPosition:sprite63Pos];
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
                    CGPoint tileCoord1 = [self tileCoordForPosition:self.sprite63.position];
                    int tileGID1 = [self.bgLayer tileGIDAt:tileCoord1];
                    [self.bgLayer removeTileAt:tileCoord1];
                    [self.bgLayer setTileGID:(tileGID1 - 3) at:tileCoord1];
                    
                    id actionMove = [CCMoveTo actionWithDuration:0.3 position:sprite63Pos];
                    id actionMove2 = [CCAnimate actionWithAnimation:spriteAWalkRight restoreOriginalFrame:NO];
                    
                    id actionMoveDone = [CCCallFuncN actionWithTarget:self selector:@selector(finishActionSprite63)];
                    
                    [self.sprite63 runAction:[CCSpawn actionOne:[CCSequence actions:actionMove,actionMoveDone,nil] two:actionMove2]];
                    return;
                }
            }
        }
    }
    [self finishActionSprite63];
}
-(void) moveupSprite63
{
    CGPoint sprite63Pos = self.sprite63.position;
    self.sprite63.orientation = 2;
    sprite63Pos.y += _theHKMap.tileSize.height;
    
    CGPoint tileCoord = [self tileCoordForPosition:sprite63Pos];
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
                    CGPoint tileCoord1 = [self tileCoordForPosition:self.sprite63.position];
                    int tileGID1 = [self.bgLayer tileGIDAt:tileCoord1];
                    [self.bgLayer removeTileAt:tileCoord1];
                    [self.bgLayer setTileGID:(tileGID1 - 3) at:tileCoord1];
                    
                    id actionMove = [CCMoveTo actionWithDuration:0.3 position:sprite63Pos];
                    id actionMove2 = [CCAnimate actionWithAnimation:spriteAWalkUp restoreOriginalFrame:NO];
                    
                    id actionMoveDone = [CCCallFuncN actionWithTarget:self selector:@selector(finishActionSprite63)];
                    
                    [self.sprite63 runAction:[CCSpawn actionOne:[CCSequence actions:actionMove,actionMoveDone,nil] two:actionMove2]];
                    return;
                }
            }
        }
    }
    [self finishActionSprite63];
}
-(void) movedownSprite63
{
    CGPoint sprite63Pos = self.sprite63.position;
    self.sprite63.orientation = 1;
    sprite63Pos.y -= _theHKMap.tileSize.width;
    
    CGPoint tileCoord = [self tileCoordForPosition:sprite63Pos];
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
                    CGPoint tileCoord1 = [self tileCoordForPosition:self.sprite63.position];
                    int tileGID1 = [self.bgLayer tileGIDAt:tileCoord1];
                    [self.bgLayer removeTileAt:tileCoord1];
                    [self.bgLayer setTileGID:(tileGID1 - 3) at:tileCoord1];
                    
                    id actionMove = [CCMoveTo actionWithDuration:0.3 position:sprite63Pos];
                    id actionMove2 = [CCAnimate actionWithAnimation:spriteAWalkDown restoreOriginalFrame:NO];
                    
                    id actionMoveDone = [CCCallFuncN actionWithTarget:self selector:@selector(finishActionSprite63)];
                    
                    [self.sprite63 runAction:[CCSpawn actionOne:[CCSequence actions:actionMove,actionMoveDone,nil] two:actionMove2]];
                    return;
                }
            }
        }
    }
    [self finishActionSprite63];
}
-(void) finishActionSprite63
{
    if (self.sprite63.orientation == 1)
    {
        [self.sprite63 setDisplayFrame:[[spriteAWalkDown frames] objectAtIndex:0]];
    }
    else if (self.sprite63.orientation == 2)
    {
        [self.sprite63 setDisplayFrame:[[spriteAWalkUp frames] objectAtIndex:0]];
    }
    else if (self.sprite63.orientation == 3)
    {
        [self.sprite63 setDisplayFrame:[[spriteAWalkRight frames] objectAtIndex:0]];
    }
    else
    {
        [self.sprite63 setDisplayFrame:[[spriteAWalkLeft frames] objectAtIndex:0]];
    }
    self.hero.sprite63position = self.sprite63.position;
}

-(void) updateSprite64
{
    CGSize screenSize = [[CCDirector sharedDirector] winSize];
    int x = self.hero.position.x;
    int y = self.hero.position.y;
    
    int p = self.sprite64.position.x;
    int q = self.sprite64.position.y;
    
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
        [self moveleftSprite64];
    }
    if (rand == 2)
    {
        [self moverightSprite64];
    }
    if (rand == 3)
    {
        [self moveupSprite64];
    }
    if (rand == 4)
    {
        [self movedownSprite64];
    }
    return;
}

-(void) moveleftSprite64
{
    CGPoint sprite64Pos = self.sprite64.position;
    self.sprite64.orientation = 4;
    sprite64Pos.x -= _theHKMap.tileSize.width;
    
    CGPoint tileCoord = [self tileCoordForPosition:sprite64Pos];
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
                    CGPoint tileCoord1 = [self tileCoordForPosition:self.sprite64.position];
                    int tileGID1 = [self.bgLayer tileGIDAt:tileCoord1];
                    [self.bgLayer removeTileAt:tileCoord1];
                    [self.bgLayer setTileGID:(tileGID1 - 4) at:tileCoord1];
                    
                    id actionMove = [CCMoveTo actionWithDuration:0.3 position:sprite64Pos];
                    id actionMove2 = [CCAnimate actionWithAnimation:spriteKWalkLeft restoreOriginalFrame:NO];
                    
                    id actionMoveDone = [CCCallFuncN actionWithTarget:self selector:@selector(finishActionSprite64)];
                    
                    [self.sprite64 runAction:[CCSpawn actionOne:[CCSequence actions:actionMove,actionMoveDone,nil] two:actionMove2]];
                    return;
                }
            }
        }
    }
    [self finishActionSprite64];
}
-(void) moverightSprite64
{
    CGPoint sprite64Pos = self.sprite64.position;
    self.sprite64.orientation = 3;
    sprite64Pos.x += _theHKMap.tileSize.width;
    
    CGPoint tileCoord = [self tileCoordForPosition:sprite64Pos];
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
                    CGPoint tileCoord1 = [self tileCoordForPosition:self.sprite64.position];
                    int tileGID1 = [self.bgLayer tileGIDAt:tileCoord1];
                    [self.bgLayer removeTileAt:tileCoord1];
                    [self.bgLayer setTileGID:(tileGID1 - 4) at:tileCoord1];
                    
                    id actionMove = [CCMoveTo actionWithDuration:0.3 position:sprite64Pos];
                    id actionMove2 = [CCAnimate actionWithAnimation:spriteKWalkRight restoreOriginalFrame:NO];
                    
                    id actionMoveDone = [CCCallFuncN actionWithTarget:self selector:@selector(finishActionSprite64)];
                    
                    [self.sprite64 runAction:[CCSpawn actionOne:[CCSequence actions:actionMove,actionMoveDone,nil] two:actionMove2]];
                    return;
                }
            }
        }
    }
    [self finishActionSprite64];
}
-(void) moveupSprite64
{
    CGPoint sprite64Pos = self.sprite64.position;
    self.sprite64.orientation = 2;
    sprite64Pos.y += _theHKMap.tileSize.height;
    
    CGPoint tileCoord = [self tileCoordForPosition:sprite64Pos];
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
                    CGPoint tileCoord1 = [self tileCoordForPosition:self.sprite64.position];
                    int tileGID1 = [self.bgLayer tileGIDAt:tileCoord1];
                    [self.bgLayer removeTileAt:tileCoord1];
                    [self.bgLayer setTileGID:(tileGID1 - 4) at:tileCoord1];
                    
                    id actionMove = [CCMoveTo actionWithDuration:0.3 position:sprite64Pos];
                    id actionMove2 = [CCAnimate actionWithAnimation:spriteKWalkUp restoreOriginalFrame:NO];
                    
                    id actionMoveDone = [CCCallFuncN actionWithTarget:self selector:@selector(finishActionSprite64)];
                    
                    [self.sprite64 runAction:[CCSpawn actionOne:[CCSequence actions:actionMove,actionMoveDone,nil] two:actionMove2]];
                    return;
                }
            }
        }
    }
    [self finishActionSprite64];
}
-(void) movedownSprite64
{
    CGPoint sprite64Pos = self.sprite64.position;
    self.sprite64.orientation = 1;
    sprite64Pos.y -= _theHKMap.tileSize.width;
    
    CGPoint tileCoord = [self tileCoordForPosition:sprite64Pos];
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
                    CGPoint tileCoord1 = [self tileCoordForPosition:self.sprite64.position];
                    int tileGID1 = [self.bgLayer tileGIDAt:tileCoord1];
                    [self.bgLayer removeTileAt:tileCoord1];
                    [self.bgLayer setTileGID:(tileGID1 - 4) at:tileCoord1];
                    
                    id actionMove = [CCMoveTo actionWithDuration:0.3 position:sprite64Pos];
                    id actionMove2 = [CCAnimate actionWithAnimation:spriteKWalkDown restoreOriginalFrame:NO];
                    
                    id actionMoveDone = [CCCallFuncN actionWithTarget:self selector:@selector(finishActionSprite64)];
                    
                    [self.sprite64 runAction:[CCSpawn actionOne:[CCSequence actions:actionMove,actionMoveDone,nil] two:actionMove2]];
                    return;
                }
            }
        }
    }
    [self finishActionSprite64];
}
-(void) finishActionSprite64
{
    if (self.sprite64.orientation == 1)
    {
        [self.sprite64 setDisplayFrame:[[spriteKWalkDown frames] objectAtIndex:0]];
    }
    else if (self.sprite64.orientation == 2)
    {
        [self.sprite64 setDisplayFrame:[[spriteKWalkUp frames] objectAtIndex:0]];
    }
    else if (self.sprite64.orientation == 3)
    {
        [self.sprite64 setDisplayFrame:[[spriteKWalkRight frames] objectAtIndex:0]];
    }
    else
    {
        [self.sprite64 setDisplayFrame:[[spriteKWalkLeft frames] objectAtIndex:0]];
    }
    self.hero.sprite64position = self.sprite64.position;
}

-(void) updateSprite65
{
    CGSize screenSize = [[CCDirector sharedDirector] winSize];
    int x = self.hero.position.x;
    int y = self.hero.position.y;
    
    int p = self.sprite65.position.x;
    int q = self.sprite65.position.y;
    
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
        [self moveleftSprite65];
    }
    if (rand == 2)
    {
        [self moverightSprite65];
    }
    if (rand == 3)
    {
        [self moveupSprite65];
    }
    if (rand == 4)
    {
        [self movedownSprite65];
    }
    return;
}

-(void) moveleftSprite65
{
    CGPoint sprite65Pos = self.sprite65.position;
    self.sprite65.orientation = 4;
    sprite65Pos.x -= _theHKMap.tileSize.width;
    
    CGPoint tileCoord = [self tileCoordForPosition:sprite65Pos];
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
                    CGPoint tileCoord1 = [self tileCoordForPosition:self.sprite65.position];
                    int tileGID1 = [self.bgLayer tileGIDAt:tileCoord1];
                    [self.bgLayer removeTileAt:tileCoord1];
                    [self.bgLayer setTileGID:(tileGID1 - 5) at:tileCoord1];
                    
                    id actionMove = [CCMoveTo actionWithDuration:0.3 position:sprite65Pos];
                    id actionMove2 = [CCAnimate actionWithAnimation:spriteVWalkLeft restoreOriginalFrame:NO];
                    
                    id actionMoveDone = [CCCallFuncN actionWithTarget:self selector:@selector(finishActionSprite65)];
                    
                    [self.sprite65 runAction:[CCSpawn actionOne:[CCSequence actions:actionMove,actionMoveDone,nil] two:actionMove2]];
                    return;
                }
            }
        }
    }
    [self finishActionSprite65];
}
-(void) moverightSprite65
{
    CGPoint sprite65Pos = self.sprite65.position;
    self.sprite65.orientation = 3;
    sprite65Pos.x += _theHKMap.tileSize.width;
    
    CGPoint tileCoord = [self tileCoordForPosition:sprite65Pos];
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
                    CGPoint tileCoord1 = [self tileCoordForPosition:self.sprite65.position];
                    int tileGID1 = [self.bgLayer tileGIDAt:tileCoord1];
                    [self.bgLayer removeTileAt:tileCoord1];
                    [self.bgLayer setTileGID:(tileGID1 - 5) at:tileCoord1];
                    
                    id actionMove = [CCMoveTo actionWithDuration:0.3 position:sprite65Pos];
                    id actionMove2 = [CCAnimate actionWithAnimation:spriteVWalkRight restoreOriginalFrame:NO];
                    
                    id actionMoveDone = [CCCallFuncN actionWithTarget:self selector:@selector(finishActionSprite65)];
                    
                    [self.sprite65 runAction:[CCSpawn actionOne:[CCSequence actions:actionMove,actionMoveDone,nil] two:actionMove2]];
                    return;
                }
            }
        }
    }
    [self finishActionSprite65];
}
-(void) moveupSprite65
{
    CGPoint sprite65Pos = self.sprite65.position;
    self.sprite65.orientation = 2;
    sprite65Pos.y += _theHKMap.tileSize.height;
    
    CGPoint tileCoord = [self tileCoordForPosition:sprite65Pos];
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
                    CGPoint tileCoord1 = [self tileCoordForPosition:self.sprite65.position];
                    int tileGID1 = [self.bgLayer tileGIDAt:tileCoord1];
                    [self.bgLayer removeTileAt:tileCoord1];
                    [self.bgLayer setTileGID:(tileGID1 - 5) at:tileCoord1];
                    
                    id actionMove = [CCMoveTo actionWithDuration:0.3 position:sprite65Pos];
                    id actionMove2 = [CCAnimate actionWithAnimation:spriteVWalkUp restoreOriginalFrame:NO];
                    
                    id actionMoveDone = [CCCallFuncN actionWithTarget:self selector:@selector(finishActionSprite65)];
                    
                    [self.sprite65 runAction:[CCSpawn actionOne:[CCSequence actions:actionMove,actionMoveDone,nil] two:actionMove2]];
                    return;
                }
            }
        }
    }
    [self finishActionSprite65];
}
-(void) movedownSprite65
{
    CGPoint sprite65Pos = self.sprite65.position;
    self.sprite65.orientation = 1;
    sprite65Pos.y -= _theHKMap.tileSize.width;
    
    CGPoint tileCoord = [self tileCoordForPosition:sprite65Pos];
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
                    CGPoint tileCoord1 = [self tileCoordForPosition:self.sprite65.position];
                    int tileGID1 = [self.bgLayer tileGIDAt:tileCoord1];
                    [self.bgLayer removeTileAt:tileCoord1];
                    [self.bgLayer setTileGID:(tileGID1 - 5) at:tileCoord1];
                    
                    id actionMove = [CCMoveTo actionWithDuration:0.3 position:sprite65Pos];
                    id actionMove2 = [CCAnimate actionWithAnimation:spriteVWalkDown restoreOriginalFrame:NO];
                    
                    id actionMoveDone = [CCCallFuncN actionWithTarget:self selector:@selector(finishActionSprite65)];
                    
                    [self.sprite65 runAction:[CCSpawn actionOne:[CCSequence actions:actionMove,actionMoveDone,nil] two:actionMove2]];
                    return;
                }
            }
        }
    }
    [self finishActionSprite65];
}
-(void) finishActionSprite65
{
    if (self.sprite65.orientation == 1)
    {
        [self.sprite65 setDisplayFrame:[[spriteVWalkDown frames] objectAtIndex:0]];
    }
    else if (self.sprite65.orientation == 2)
    {
        [self.sprite65 setDisplayFrame:[[spriteVWalkUp frames] objectAtIndex:0]];
    }
    else if (self.sprite65.orientation == 3)
    {
        [self.sprite65 setDisplayFrame:[[spriteVWalkRight frames] objectAtIndex:0]];
    }
    else
    {
        [self.sprite65 setDisplayFrame:[[spriteVWalkLeft frames] objectAtIndex:0]];
    }
    self.hero.sprite65position = self.sprite65.position;
}

-(void) updateSprite66
{
    CGSize screenSize = [[CCDirector sharedDirector] winSize];
    int x = self.hero.position.x;
    int y = self.hero.position.y;
    
    int p = self.sprite66.position.x;
    int q = self.sprite66.position.y;
    
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
        [self moveleftSprite66];
    }
    if (rand == 2)
    {
        [self moverightSprite66];
    }
    if (rand == 3)
    {
        [self moveupSprite66];
    }
    if (rand == 4)
    {
        [self movedownSprite66];
    }
    return;
}

-(void) moveleftSprite66
{
    CGPoint sprite66Pos = self.sprite66.position;
    self.sprite66.orientation = 4;
    sprite66Pos.x -= _theHKMap.tileSize.width;
    
    CGPoint tileCoord = [self tileCoordForPosition:sprite66Pos];
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
                    CGPoint tileCoord1 = [self tileCoordForPosition:self.sprite66.position];
                    int tileGID1 = [self.bgLayer tileGIDAt:tileCoord1];
                    [self.bgLayer removeTileAt:tileCoord1];
                    [self.bgLayer setTileGID:(tileGID1 - 6) at:tileCoord1];
                    
                    id actionMove = [CCMoveTo actionWithDuration:0.3 position:sprite66Pos];
                    id actionMove2 = [CCAnimate actionWithAnimation:spriteNWalkLeft restoreOriginalFrame:NO];
                    
                    id actionMoveDone = [CCCallFuncN actionWithTarget:self selector:@selector(finishActionSprite66)];
                    
                    [self.sprite66 runAction:[CCSpawn actionOne:[CCSequence actions:actionMove,actionMoveDone,nil] two:actionMove2]];
                    return;
                }
            }
        }
    }
    [self finishActionSprite66];
}
-(void) moverightSprite66
{
    CGPoint sprite66Pos = self.sprite66.position;
    self.sprite66.orientation = 3;
    sprite66Pos.x += _theHKMap.tileSize.width;
    
    CGPoint tileCoord = [self tileCoordForPosition:sprite66Pos];
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
                    CGPoint tileCoord1 = [self tileCoordForPosition:self.sprite66.position];
                    int tileGID1 = [self.bgLayer tileGIDAt:tileCoord1];
                    [self.bgLayer removeTileAt:tileCoord1];
                    [self.bgLayer setTileGID:(tileGID1 - 6) at:tileCoord1];
                    
                    id actionMove = [CCMoveTo actionWithDuration:0.3 position:sprite66Pos];
                    id actionMove2 = [CCAnimate actionWithAnimation:spriteNWalkRight restoreOriginalFrame:NO];
                    
                    id actionMoveDone = [CCCallFuncN actionWithTarget:self selector:@selector(finishActionSprite66)];
                    
                    [self.sprite66 runAction:[CCSpawn actionOne:[CCSequence actions:actionMove,actionMoveDone,nil] two:actionMove2]];
                    return;
                }
            }
        }
    }
    [self finishActionSprite66];
}
-(void) moveupSprite66
{
    CGPoint sprite66Pos = self.sprite66.position;
    self.sprite66.orientation = 2;
    sprite66Pos.y += _theHKMap.tileSize.height;
    
    CGPoint tileCoord = [self tileCoordForPosition:sprite66Pos];
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
                    CGPoint tileCoord1 = [self tileCoordForPosition:self.sprite66.position];
                    int tileGID1 = [self.bgLayer tileGIDAt:tileCoord1];
                    [self.bgLayer removeTileAt:tileCoord1];
                    [self.bgLayer setTileGID:(tileGID1 - 6) at:tileCoord1];
                    
                    id actionMove = [CCMoveTo actionWithDuration:0.3 position:sprite66Pos];
                    id actionMove2 = [CCAnimate actionWithAnimation:spriteNWalkUp restoreOriginalFrame:NO];
                    
                    id actionMoveDone = [CCCallFuncN actionWithTarget:self selector:@selector(finishActionSprite66)];
                    
                    [self.sprite66 runAction:[CCSpawn actionOne:[CCSequence actions:actionMove,actionMoveDone,nil] two:actionMove2]];
                    return;
                }
            }
        }
    }
    [self finishActionSprite66];
}
-(void) movedownSprite66
{
    CGPoint sprite66Pos = self.sprite66.position;
    self.sprite66.orientation = 1;
    sprite66Pos.y -= _theHKMap.tileSize.width;
    
    CGPoint tileCoord = [self tileCoordForPosition:sprite66Pos];
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
                    CGPoint tileCoord1 = [self tileCoordForPosition:self.sprite66.position];
                    int tileGID1 = [self.bgLayer tileGIDAt:tileCoord1];
                    [self.bgLayer removeTileAt:tileCoord1];
                    [self.bgLayer setTileGID:(tileGID1 - 6) at:tileCoord1];
                    
                    id actionMove = [CCMoveTo actionWithDuration:0.3 position:sprite66Pos];
                    id actionMove2 = [CCAnimate actionWithAnimation:spriteNWalkDown restoreOriginalFrame:NO];
                    
                    id actionMoveDone = [CCCallFuncN actionWithTarget:self selector:@selector(finishActionSprite66)];
                    
                    [self.sprite66 runAction:[CCSpawn actionOne:[CCSequence actions:actionMove,actionMoveDone,nil] two:actionMove2]];
                    return;
                }
            }
        }
    }
    [self finishActionSprite66];
}
-(void) finishActionSprite66
{
    if (self.sprite66.orientation == 1)
    {
        [self.sprite66 setDisplayFrame:[[spriteNWalkDown frames] objectAtIndex:0]];
    }
    else if (self.sprite66.orientation == 2)
    {
        [self.sprite66 setDisplayFrame:[[spriteNWalkUp frames] objectAtIndex:0]];
    }
    else if (self.sprite66.orientation == 3)
    {
        [self.sprite66 setDisplayFrame:[[spriteNWalkRight frames] objectAtIndex:0]];
    }
    else
    {
        [self.sprite66 setDisplayFrame:[[spriteNWalkLeft frames] objectAtIndex:0]];
    }
    self.hero.sprite66position = self.sprite66.position;
}

-(void) updateSprite67
{
    CGSize screenSize = [[CCDirector sharedDirector] winSize];
    int x = self.hero.position.x;
    int y = self.hero.position.y;
    
    int p = self.sprite67.position.x;
    int q = self.sprite67.position.y;
    
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
        [self moveleftSprite67];
    }
    if (rand == 2)
    {
        [self moverightSprite67];
    }
    if (rand == 3)
    {
        [self moveupSprite67];
    }
    if (rand == 4)
    {
        [self movedownSprite67];
    }
    return;
}

-(void) moveleftSprite67
{
    CGPoint sprite67Pos = self.sprite67.position;
    self.sprite67.orientation = 4;
    sprite67Pos.x -= _theHKMap.tileSize.width;
    
    CGPoint tileCoord = [self tileCoordForPosition:sprite67Pos];
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
                    CGPoint tileCoord1 = [self tileCoordForPosition:self.sprite67.position];
                    int tileGID1 = [self.bgLayer tileGIDAt:tileCoord1];
                    [self.bgLayer removeTileAt:tileCoord1];
                    [self.bgLayer setTileGID:(tileGID1 - 7) at:tileCoord1];
                    
                    id actionMove = [CCMoveTo actionWithDuration:0.3 position:sprite67Pos];
                    id actionMove2 = [CCAnimate actionWithAnimation:spriteRWalkLeft restoreOriginalFrame:NO];
                    
                    id actionMoveDone = [CCCallFuncN actionWithTarget:self selector:@selector(finishActionSprite67)];
                    
                    [self.sprite67 runAction:[CCSpawn actionOne:[CCSequence actions:actionMove,actionMoveDone,nil] two:actionMove2]];
                    return;
                }
            }
        }
    }
    [self finishActionSprite67];
}
-(void) moverightSprite67
{
    CGPoint sprite67Pos = self.sprite67.position;
    self.sprite67.orientation = 3;
    sprite67Pos.x += _theHKMap.tileSize.width;
    
    CGPoint tileCoord = [self tileCoordForPosition:sprite67Pos];
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
                    CGPoint tileCoord1 = [self tileCoordForPosition:self.sprite67.position];
                    int tileGID1 = [self.bgLayer tileGIDAt:tileCoord1];
                    [self.bgLayer removeTileAt:tileCoord1];
                    [self.bgLayer setTileGID:(tileGID1 - 7) at:tileCoord1];
                    
                    id actionMove = [CCMoveTo actionWithDuration:0.3 position:sprite67Pos];
                    id actionMove2 = [CCAnimate actionWithAnimation:spriteRWalkRight restoreOriginalFrame:NO];
                    
                    id actionMoveDone = [CCCallFuncN actionWithTarget:self selector:@selector(finishActionSprite67)];
                    
                    [self.sprite67 runAction:[CCSpawn actionOne:[CCSequence actions:actionMove,actionMoveDone,nil] two:actionMove2]];
                    return;
                }
            }
        }
    }
    [self finishActionSprite67];
}
-(void) moveupSprite67
{
    CGPoint sprite67Pos = self.sprite67.position;
    self.sprite67.orientation = 2;
    sprite67Pos.y += _theHKMap.tileSize.height;
    
    CGPoint tileCoord = [self tileCoordForPosition:sprite67Pos];
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
                    CGPoint tileCoord1 = [self tileCoordForPosition:self.sprite67.position];
                    int tileGID1 = [self.bgLayer tileGIDAt:tileCoord1];
                    [self.bgLayer removeTileAt:tileCoord1];
                    [self.bgLayer setTileGID:(tileGID1 - 7) at:tileCoord1];
                    
                    id actionMove = [CCMoveTo actionWithDuration:0.3 position:sprite67Pos];
                    id actionMove2 = [CCAnimate actionWithAnimation:spriteRWalkUp restoreOriginalFrame:NO];
                    
                    id actionMoveDone = [CCCallFuncN actionWithTarget:self selector:@selector(finishActionSprite67)];
                    
                    [self.sprite67 runAction:[CCSpawn actionOne:[CCSequence actions:actionMove,actionMoveDone,nil] two:actionMove2]];
                    return;
                }
            }
        }
    }
    [self finishActionSprite67];
}
-(void) movedownSprite67
{
    CGPoint sprite67Pos = self.sprite67.position;
    self.sprite67.orientation = 1;
    sprite67Pos.y -= _theHKMap.tileSize.width;
    
    CGPoint tileCoord = [self tileCoordForPosition:sprite67Pos];
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
                    CGPoint tileCoord1 = [self tileCoordForPosition:self.sprite67.position];
                    int tileGID1 = [self.bgLayer tileGIDAt:tileCoord1];
                    [self.bgLayer removeTileAt:tileCoord1];
                    [self.bgLayer setTileGID:(tileGID1 - 7) at:tileCoord1];
                    
                    id actionMove = [CCMoveTo actionWithDuration:0.3 position:sprite67Pos];
                    id actionMove2 = [CCAnimate actionWithAnimation:spriteRWalkDown restoreOriginalFrame:NO];
                    
                    id actionMoveDone = [CCCallFuncN actionWithTarget:self selector:@selector(finishActionSprite67)];
                    
                    [self.sprite67 runAction:[CCSpawn actionOne:[CCSequence actions:actionMove,actionMoveDone,nil] two:actionMove2]];
                    return;
                }
            }
        }
    }
    [self finishActionSprite67];
}
-(void) finishActionSprite67
{
    if (self.sprite67.orientation == 1)
    {
        [self.sprite67 setDisplayFrame:[[spriteRWalkDown frames] objectAtIndex:0]];
    }
    else if (self.sprite67.orientation == 2)
    {
        [self.sprite67 setDisplayFrame:[[spriteRWalkUp frames] objectAtIndex:0]];
    }
    else if (self.sprite67.orientation == 3)
    {
        [self.sprite67 setDisplayFrame:[[spriteRWalkRight frames] objectAtIndex:0]];
    }
    else
    {
        [self.sprite67 setDisplayFrame:[[spriteRWalkLeft frames] objectAtIndex:0]];
    }
    self.hero.sprite67position = self.sprite67.position;
}

-(void) updateSprite68
{
    CGSize screenSize = [[CCDirector sharedDirector] winSize];
    int x = self.hero.position.x;
    int y = self.hero.position.y;
    
    int p = self.sprite68.position.x;
    int q = self.sprite68.position.y;
    
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
        [self moveleftSprite68];
    }
    if (rand == 2)
    {
        [self moverightSprite68];
    }
    if (rand == 3)
    {
        [self moveupSprite68];
    }
    if (rand == 4)
    {
        [self movedownSprite68];
    }
    return;
}

-(void) moveleftSprite68
{
    CGPoint sprite68Pos = self.sprite68.position;
    self.sprite68.orientation = 4;
    sprite68Pos.x -= _theHKMap.tileSize.width;
    
    CGPoint tileCoord = [self tileCoordForPosition:sprite68Pos];
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
                    CGPoint tileCoord1 = [self tileCoordForPosition:self.sprite68.position];
                    int tileGID1 = [self.bgLayer tileGIDAt:tileCoord1];
                    [self.bgLayer removeTileAt:tileCoord1];
                    [self.bgLayer setTileGID:(tileGID1 - 8) at:tileCoord1];
                    
                    id actionMove = [CCMoveTo actionWithDuration:0.3 position:sprite68Pos];
                    id actionMove2 = [CCAnimate actionWithAnimation:spriteGWalkLeft restoreOriginalFrame:NO];
                    
                    id actionMoveDone = [CCCallFuncN actionWithTarget:self selector:@selector(finishActionSprite68)];
                    
                    [self.sprite68 runAction:[CCSpawn actionOne:[CCSequence actions:actionMove,actionMoveDone,nil] two:actionMove2]];
                    return;
                }
            }
        }
    }
    [self finishActionSprite68];
}
-(void) moverightSprite68
{
    CGPoint sprite68Pos = self.sprite68.position;
    self.sprite68.orientation = 3;
    sprite68Pos.x += _theHKMap.tileSize.width;
    
    CGPoint tileCoord = [self tileCoordForPosition:sprite68Pos];
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
                    CGPoint tileCoord1 = [self tileCoordForPosition:self.sprite68.position];
                    int tileGID1 = [self.bgLayer tileGIDAt:tileCoord1];
                    [self.bgLayer removeTileAt:tileCoord1];
                    [self.bgLayer setTileGID:(tileGID1 - 8) at:tileCoord1];
                    
                    id actionMove = [CCMoveTo actionWithDuration:0.3 position:sprite68Pos];
                    id actionMove2 = [CCAnimate actionWithAnimation:spriteGWalkRight restoreOriginalFrame:NO];
                    
                    id actionMoveDone = [CCCallFuncN actionWithTarget:self selector:@selector(finishActionSprite68)];
                    
                    [self.sprite68 runAction:[CCSpawn actionOne:[CCSequence actions:actionMove,actionMoveDone,nil] two:actionMove2]];
                    return;
                }
            }
        }
    }
    [self finishActionSprite68];
}
-(void) moveupSprite68
{
    CGPoint sprite68Pos = self.sprite68.position;
    self.sprite68.orientation = 2;
    sprite68Pos.y += _theHKMap.tileSize.height;
    
    CGPoint tileCoord = [self tileCoordForPosition:sprite68Pos];
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
                    CGPoint tileCoord1 = [self tileCoordForPosition:self.sprite68.position];
                    int tileGID1 = [self.bgLayer tileGIDAt:tileCoord1];
                    [self.bgLayer removeTileAt:tileCoord1];
                    [self.bgLayer setTileGID:(tileGID1 - 8) at:tileCoord1];
                    
                    id actionMove = [CCMoveTo actionWithDuration:0.3 position:sprite68Pos];
                    id actionMove2 = [CCAnimate actionWithAnimation:spriteGWalkUp restoreOriginalFrame:NO];
                    
                    id actionMoveDone = [CCCallFuncN actionWithTarget:self selector:@selector(finishActionSprite68)];
                    
                    [self.sprite68 runAction:[CCSpawn actionOne:[CCSequence actions:actionMove,actionMoveDone,nil] two:actionMove2]];
                    return;
                }
            }
        }
    }
    [self finishActionSprite68];
}
-(void) movedownSprite68
{
    CGPoint sprite68Pos = self.sprite68.position;
    self.sprite68.orientation = 1;
    sprite68Pos.y -= _theHKMap.tileSize.width;
    
    CGPoint tileCoord = [self tileCoordForPosition:sprite68Pos];
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
                    CGPoint tileCoord1 = [self tileCoordForPosition:self.sprite68.position];
                    int tileGID1 = [self.bgLayer tileGIDAt:tileCoord1];
                    [self.bgLayer removeTileAt:tileCoord1];
                    [self.bgLayer setTileGID:(tileGID1 - 8) at:tileCoord1];
                    
                    id actionMove = [CCMoveTo actionWithDuration:0.3 position:sprite68Pos];
                    id actionMove2 = [CCAnimate actionWithAnimation:spriteGWalkDown restoreOriginalFrame:NO];
                    
                    id actionMoveDone = [CCCallFuncN actionWithTarget:self selector:@selector(finishActionSprite68)];
                    
                    [self.sprite68 runAction:[CCSpawn actionOne:[CCSequence actions:actionMove,actionMoveDone,nil] two:actionMove2]];
                    return;
                }
            }
        }
    }
    [self finishActionSprite68];
}
-(void) finishActionSprite68
{
    if (self.sprite68.orientation == 1)
    {
        [self.sprite68 setDisplayFrame:[[spriteGWalkDown frames] objectAtIndex:0]];
    }
    else if (self.sprite68.orientation == 2)
    {
        [self.sprite68 setDisplayFrame:[[spriteGWalkUp frames] objectAtIndex:0]];
    }
    else if (self.sprite68.orientation == 3)
    {
        [self.sprite68 setDisplayFrame:[[spriteGWalkRight frames] objectAtIndex:0]];
    }
    else
    {
        [self.sprite68 setDisplayFrame:[[spriteGWalkLeft frames] objectAtIndex:0]];
    }
    self.hero.sprite68position = self.sprite68.position;
}
-(void) updateSprite69
{
    CGSize screenSize = [[CCDirector sharedDirector] winSize];
    int x = self.hero.position.x;
    int y = self.hero.position.y;
    
    int p = self.sprite69.position.x;
    int q = self.sprite69.position.y;
    
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
        [self moveleftSprite69];
    }
    if (rand == 2)
    {
        [self moverightSprite69];
    }
    if (rand == 3)
    {
        [self moveupSprite69];
    }
    if (rand == 4)
    {
        [self movedownSprite69];
    }
    return;
}

-(void) moveleftSprite69
{
    CGPoint sprite69Pos = self.sprite69.position;
    self.sprite69.orientation = 4;
    sprite69Pos.x -= _theHKMap.tileSize.width;
    
    CGPoint tileCoord = [self tileCoordForPosition:sprite69Pos];
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
                    CGPoint tileCoord1 = [self tileCoordForPosition:self.sprite69.position];
                    int tileGID1 = [self.bgLayer tileGIDAt:tileCoord1];
                    [self.bgLayer removeTileAt:tileCoord1];
                    [self.bgLayer setTileGID:(tileGID1 - 9) at:tileCoord1];
                    
                    id actionMove = [CCMoveTo actionWithDuration:0.3 position:sprite69Pos];
                    id actionMove2 = [CCAnimate actionWithAnimation:spriteHWalkLeft restoreOriginalFrame:NO];
                    
                    id actionMoveDone = [CCCallFuncN actionWithTarget:self selector:@selector(finishActionSprite69)];
                    
                    [self.sprite69 runAction:[CCSpawn actionOne:[CCSequence actions:actionMove,actionMoveDone,nil] two:actionMove2]];
                    return;
                }
            }
        }
    }
    [self finishActionSprite69];
}
-(void) moverightSprite69
{
    CGPoint sprite69Pos = self.sprite69.position;
    self.sprite69.orientation = 3;
    sprite69Pos.x += _theHKMap.tileSize.width;
    
    CGPoint tileCoord = [self tileCoordForPosition:sprite69Pos];
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
                    CGPoint tileCoord1 = [self tileCoordForPosition:self.sprite69.position];
                    int tileGID1 = [self.bgLayer tileGIDAt:tileCoord1];
                    [self.bgLayer removeTileAt:tileCoord1];
                    [self.bgLayer setTileGID:(tileGID1 - 9) at:tileCoord1];
                    
                    id actionMove = [CCMoveTo actionWithDuration:0.3 position:sprite69Pos];
                    id actionMove2 = [CCAnimate actionWithAnimation:spriteHWalkRight restoreOriginalFrame:NO];
                    
                    id actionMoveDone = [CCCallFuncN actionWithTarget:self selector:@selector(finishActionSprite69)];
                    
                    [self.sprite69 runAction:[CCSpawn actionOne:[CCSequence actions:actionMove,actionMoveDone,nil] two:actionMove2]];
                    return;
                }
            }
        }
    }
    [self finishActionSprite69];
}
-(void) moveupSprite69
{
    CGPoint sprite69Pos = self.sprite69.position;
    self.sprite69.orientation = 2;
    sprite69Pos.y += _theHKMap.tileSize.height;
    
    CGPoint tileCoord = [self tileCoordForPosition:sprite69Pos];
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
                    CGPoint tileCoord1 = [self tileCoordForPosition:self.sprite69.position];
                    int tileGID1 = [self.bgLayer tileGIDAt:tileCoord1];
                    [self.bgLayer removeTileAt:tileCoord1];
                    [self.bgLayer setTileGID:(tileGID1 - 9) at:tileCoord1];
                    
                    id actionMove = [CCMoveTo actionWithDuration:0.3 position:sprite69Pos];
                    id actionMove2 = [CCAnimate actionWithAnimation:spriteHWalkUp restoreOriginalFrame:NO];
                    
                    id actionMoveDone = [CCCallFuncN actionWithTarget:self selector:@selector(finishActionSprite69)];
                    
                    [self.sprite69 runAction:[CCSpawn actionOne:[CCSequence actions:actionMove,actionMoveDone,nil] two:actionMove2]];
                    return;
                }
            }
        }
    }
    [self finishActionSprite69];
}
-(void) movedownSprite69
{
    CGPoint sprite69Pos = self.sprite69.position;
    self.sprite69.orientation = 1;
    sprite69Pos.y -= _theHKMap.tileSize.width;
    
    CGPoint tileCoord = [self tileCoordForPosition:sprite69Pos];
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
                    CGPoint tileCoord1 = [self tileCoordForPosition:self.sprite69.position];
                    int tileGID1 = [self.bgLayer tileGIDAt:tileCoord1];
                    [self.bgLayer removeTileAt:tileCoord1];
                    [self.bgLayer setTileGID:(tileGID1 - 9) at:tileCoord1];
                    
                    id actionMove = [CCMoveTo actionWithDuration:0.3 position:sprite69Pos];
                    id actionMove2 = [CCAnimate actionWithAnimation:spriteHWalkDown restoreOriginalFrame:NO];
                    
                    id actionMoveDone = [CCCallFuncN actionWithTarget:self selector:@selector(finishActionSprite69)];
                    
                    [self.sprite69 runAction:[CCSpawn actionOne:[CCSequence actions:actionMove,actionMoveDone,nil] two:actionMove2]];
                    return;
                }
            }
        }
    }
    [self finishActionSprite69];
}
-(void) finishActionSprite69
{
    if (self.sprite69.orientation == 1)
    {
        [self.sprite69 setDisplayFrame:[[spriteHWalkDown frames] objectAtIndex:0]];
    }
    else if (self.sprite69.orientation == 2)
    {
        [self.sprite69 setDisplayFrame:[[spriteHWalkUp frames] objectAtIndex:0]];
    }
    else if (self.sprite69.orientation == 3)
    {
        [self.sprite69 setDisplayFrame:[[spriteHWalkRight frames] objectAtIndex:0]];
    }
    else
    {
        [self.sprite69 setDisplayFrame:[[spriteHWalkLeft frames] objectAtIndex:0]];
    }
    self.hero.sprite69position = self.sprite69.position;
}

-(void) updateSprite70
{
    CGSize screenSize = [[CCDirector sharedDirector] winSize];
    int x = self.hero.position.x;
    int y = self.hero.position.y;
    
    int p = self.sprite70.position.x;
    int q = self.sprite70.position.y;
    
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
        [self moveleftSprite70];
    }
    if (rand == 2)
    {
        [self moverightSprite70];
    }
    if (rand == 3)
    {
        [self moveupSprite70];
    }
    if (rand == 4)
    {
        [self movedownSprite70];
    }
    return;
}

-(void) moveleftSprite70
{
    CGPoint sprite70Pos = self.sprite70.position;
    self.sprite70.orientation = 4;
    sprite70Pos.x -= _theHKMap.tileSize.width;
    
    CGPoint tileCoord = [self tileCoordForPosition:sprite70Pos];
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
                    CGPoint tileCoord1 = [self tileCoordForPosition:self.sprite70.position];
                    int tileGID1 = [self.bgLayer tileGIDAt:tileCoord1];
                    [self.bgLayer removeTileAt:tileCoord1];
                    [self.bgLayer setTileGID:(tileGID1 - 10) at:tileCoord1];
                    
                    id actionMove = [CCMoveTo actionWithDuration:0.3 position:sprite70Pos];
                    id actionMove2 = [CCAnimate actionWithAnimation:spriteMWalkLeft restoreOriginalFrame:NO];
                    
                    id actionMoveDone = [CCCallFuncN actionWithTarget:self selector:@selector(finishActionSprite70)];
                    
                    [self.sprite70 runAction:[CCSpawn actionOne:[CCSequence actions:actionMove,actionMoveDone,nil] two:actionMove2]];
                    return;
                }
            }
        }
    }
    [self finishActionSprite70];
}
-(void) moverightSprite70
{
    CGPoint sprite70Pos = self.sprite70.position;
    self.sprite70.orientation = 3;
    sprite70Pos.x += _theHKMap.tileSize.width;
    
    CGPoint tileCoord = [self tileCoordForPosition:sprite70Pos];
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
                    CGPoint tileCoord1 = [self tileCoordForPosition:self.sprite70.position];
                    int tileGID1 = [self.bgLayer tileGIDAt:tileCoord1];
                    [self.bgLayer removeTileAt:tileCoord1];
                    [self.bgLayer setTileGID:(tileGID1 - 10) at:tileCoord1];
                    
                    id actionMove = [CCMoveTo actionWithDuration:0.3 position:sprite70Pos];
                    id actionMove2 = [CCAnimate actionWithAnimation:spriteMWalkRight restoreOriginalFrame:NO];
                    
                    id actionMoveDone = [CCCallFuncN actionWithTarget:self selector:@selector(finishActionSprite70)];
                    
                    [self.sprite70 runAction:[CCSpawn actionOne:[CCSequence actions:actionMove,actionMoveDone,nil] two:actionMove2]];
                    return;
                }
            }
        }
    }
    [self finishActionSprite70];
}
-(void) moveupSprite70
{
    CGPoint sprite70Pos = self.sprite70.position;
    self.sprite70.orientation = 2;
    sprite70Pos.y += _theHKMap.tileSize.height;
    
    CGPoint tileCoord = [self tileCoordForPosition:sprite70Pos];
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
                    CGPoint tileCoord1 = [self tileCoordForPosition:self.sprite70.position];
                    int tileGID1 = [self.bgLayer tileGIDAt:tileCoord1];
                    [self.bgLayer removeTileAt:tileCoord1];
                    [self.bgLayer setTileGID:(tileGID1 - 10) at:tileCoord1];
                    
                    id actionMove = [CCMoveTo actionWithDuration:0.3 position:sprite70Pos];
                    id actionMove2 = [CCAnimate actionWithAnimation:spriteMWalkUp restoreOriginalFrame:NO];
                    
                    id actionMoveDone = [CCCallFuncN actionWithTarget:self selector:@selector(finishActionSprite70)];
                    
                    [self.sprite70 runAction:[CCSpawn actionOne:[CCSequence actions:actionMove,actionMoveDone,nil] two:actionMove2]];
                    return;
                }
            }
        }
    }
    [self finishActionSprite70];
}
-(void) movedownSprite70
{
    CGPoint sprite70Pos = self.sprite70.position;
    self.sprite70.orientation = 1;
    sprite70Pos.y -= _theHKMap.tileSize.width;
    
    CGPoint tileCoord = [self tileCoordForPosition:sprite70Pos];
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
                    CGPoint tileCoord1 = [self tileCoordForPosition:self.sprite70.position];
                    int tileGID1 = [self.bgLayer tileGIDAt:tileCoord1];
                    [self.bgLayer removeTileAt:tileCoord1];
                    [self.bgLayer setTileGID:(tileGID1 - 10) at:tileCoord1];
                    
                    id actionMove = [CCMoveTo actionWithDuration:0.3 position:sprite70Pos];
                    id actionMove2 = [CCAnimate actionWithAnimation:spriteMWalkDown restoreOriginalFrame:NO];
                    
                    id actionMoveDone = [CCCallFuncN actionWithTarget:self selector:@selector(finishActionSprite70)];
                    
                    [self.sprite70 runAction:[CCSpawn actionOne:[CCSequence actions:actionMove,actionMoveDone,nil] two:actionMove2]];
                    return;
                }
            }
        }
    }
    [self finishActionSprite70];
}
-(void) finishActionSprite70
{
    if (self.sprite70.orientation == 1)
    {
        [self.sprite70 setDisplayFrame:[[spriteMWalkDown frames] objectAtIndex:0]];
    }
    else if (self.sprite70.orientation == 2)
    {
        [self.sprite70 setDisplayFrame:[[spriteMWalkUp frames] objectAtIndex:0]];
    }
    else if (self.sprite70.orientation == 3)
    {
        [self.sprite70 setDisplayFrame:[[spriteMWalkRight frames] objectAtIndex:0]];
    }
    else
    {
        [self.sprite70 setDisplayFrame:[[spriteMWalkLeft frames] objectAtIndex:0]];
    }
    self.hero.sprite70position = self.sprite70.position;
}

-(void) updateSprite71
{
    CGSize screenSize = [[CCDirector sharedDirector] winSize];
    int x = self.hero.position.x;
    int y = self.hero.position.y;
    
    int p = self.sprite71.position.x;
    int q = self.sprite71.position.y;
    
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
    
    int rand = arc4random()%8;
    if (rand == 1)
    {
        [self moveleftSprite71];
    }
    if (rand == 2)
    {
        [self moverightSprite71];
    }
    if (rand == 3)
    {
        [self moveupSprite71];
    }
    if (rand == 4)
    {
        [self movedownSprite71];
    }
    return;
}

-(void) moveleftSprite71
{
    CGPoint sprite71Pos = self.sprite71.position;
    self.sprite71.orientation = 4;
    sprite71Pos.x -= _theHKMap.tileSize.width;
    
    CGPoint tileCoord = [self tileCoordForPosition:sprite71Pos];
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
                    CGPoint tileCoord1 = [self tileCoordForPosition:self.sprite71.position];
                    int tileGID1 = [self.bgLayer tileGIDAt:tileCoord1];
                    [self.bgLayer removeTileAt:tileCoord1];
                    [self.bgLayer setTileGID:(tileGID1 - 11) at:tileCoord1];
                    
                    id actionMove = [CCMoveTo actionWithDuration:0.3 position:sprite71Pos];
                    id actionMove2 = [CCAnimate actionWithAnimation:spritePWalkLeft restoreOriginalFrame:NO];
                    
                    id actionMoveDone = [CCCallFuncN actionWithTarget:self selector:@selector(finishActionSprite71)];
                    
                    [self.sprite71 runAction:[CCSpawn actionOne:[CCSequence actions:actionMove,actionMoveDone,nil] two:actionMove2]];
                    return;
                }
            }
        }
    }
    [self finishActionSprite71];
}
-(void) moverightSprite71
{
    CGPoint sprite71Pos = self.sprite71.position;
    self.sprite71.orientation = 3;
    sprite71Pos.x += _theHKMap.tileSize.width;
    
    CGPoint tileCoord = [self tileCoordForPosition:sprite71Pos];
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
                    CGPoint tileCoord1 = [self tileCoordForPosition:self.sprite71.position];
                    int tileGID1 = [self.bgLayer tileGIDAt:tileCoord1];
                    [self.bgLayer removeTileAt:tileCoord1];
                    [self.bgLayer setTileGID:(tileGID1 - 11) at:tileCoord1];
                    
                    id actionMove = [CCMoveTo actionWithDuration:0.3 position:sprite71Pos];
                    id actionMove2 = [CCAnimate actionWithAnimation:spritePWalkRight restoreOriginalFrame:NO];
                    
                    id actionMoveDone = [CCCallFuncN actionWithTarget:self selector:@selector(finishActionSprite71)];
                    
                    [self.sprite71 runAction:[CCSpawn actionOne:[CCSequence actions:actionMove,actionMoveDone,nil] two:actionMove2]];
                    return;
                }
            }
        }
    }
    [self finishActionSprite71];
}
-(void) moveupSprite71
{
    CGPoint sprite71Pos = self.sprite71.position;
    self.sprite71.orientation = 2;
    sprite71Pos.y += _theHKMap.tileSize.height;
    
    CGPoint tileCoord = [self tileCoordForPosition:sprite71Pos];
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
                    CGPoint tileCoord1 = [self tileCoordForPosition:self.sprite71.position];
                    int tileGID1 = [self.bgLayer tileGIDAt:tileCoord1];
                    [self.bgLayer removeTileAt:tileCoord1];
                    [self.bgLayer setTileGID:(tileGID1 - 11) at:tileCoord1];
                    
                    id actionMove = [CCMoveTo actionWithDuration:0.3 position:sprite71Pos];
                    id actionMove2 = [CCAnimate actionWithAnimation:spritePWalkUp restoreOriginalFrame:NO];
                    
                    id actionMoveDone = [CCCallFuncN actionWithTarget:self selector:@selector(finishActionSprite71)];
                    
                    [self.sprite71 runAction:[CCSpawn actionOne:[CCSequence actions:actionMove,actionMoveDone,nil] two:actionMove2]];
                    return;
                }
            }
        }
    }
    [self finishActionSprite71];
}
-(void) movedownSprite71
{
    CGPoint sprite71Pos = self.sprite71.position;
    self.sprite71.orientation = 1;
    sprite71Pos.y -= _theHKMap.tileSize.width;
    
    CGPoint tileCoord = [self tileCoordForPosition:sprite71Pos];
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
                    CGPoint tileCoord1 = [self tileCoordForPosition:self.sprite71.position];
                    int tileGID1 = [self.bgLayer tileGIDAt:tileCoord1];
                    [self.bgLayer removeTileAt:tileCoord1];
                    [self.bgLayer setTileGID:(tileGID1 - 11) at:tileCoord1];
                    
                    id actionMove = [CCMoveTo actionWithDuration:0.3 position:sprite71Pos];
                    id actionMove2 = [CCAnimate actionWithAnimation:spritePWalkDown restoreOriginalFrame:NO];
                    
                    id actionMoveDone = [CCCallFuncN actionWithTarget:self selector:@selector(finishActionSprite71)];
                    
                    [self.sprite71 runAction:[CCSpawn actionOne:[CCSequence actions:actionMove,actionMoveDone,nil] two:actionMove2]];
                    return;
                }
            }
        }
    }
    [self finishActionSprite71];
}
-(void) finishActionSprite71
{
    if (self.sprite71.orientation == 1)
    {
        [self.sprite71 setDisplayFrame:[[spritePWalkDown frames] objectAtIndex:0]];
    }
    else if (self.sprite71.orientation == 2)
    {
        [self.sprite71 setDisplayFrame:[[spritePWalkUp frames] objectAtIndex:0]];
    }
    else if (self.sprite71.orientation == 3)
    {
        [self.sprite71 setDisplayFrame:[[spritePWalkRight frames] objectAtIndex:0]];
    }
    else
    {
        [self.sprite71 setDisplayFrame:[[spritePWalkLeft frames] objectAtIndex:0]];
    }
    self.hero.sprite71position = self.sprite71.position;
}


-(void) updateSprite72
{
    CGSize screenSize = [[CCDirector sharedDirector] winSize];
    int x = self.hero.position.x;
    int y = self.hero.position.y;
    
    int p = self.sprite72.position.x;
    int q = self.sprite72.position.y;
    
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
        [self moveleftSprite72];
    }
    if (rand == 2)
    {
        [self moverightSprite72];
    }
    if (rand == 3)
    {
        [self moveupSprite72];
    }
    if (rand == 4)
    {
        [self movedownSprite72];
    }
    return;
}

-(void) moveleftSprite72
{
    CGPoint sprite72Pos = self.sprite72.position;
    self.sprite72.orientation = 4;
    sprite72Pos.x -= _theHKMap.tileSize.width;
    
    CGPoint tileCoord = [self tileCoordForPosition:sprite72Pos];
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
                    CGPoint tileCoord1 = [self tileCoordForPosition:self.sprite72.position];
                    int tileGID1 = [self.bgLayer tileGIDAt:tileCoord1];
                    [self.bgLayer removeTileAt:tileCoord1];
                    [self.bgLayer setTileGID:(tileGID1 - 12) at:tileCoord1];
                    
                    id actionMove = [CCMoveTo actionWithDuration:0.3 position:sprite72Pos];
                    id actionMove2 = [CCAnimate actionWithAnimation:spriteTWalkLeft restoreOriginalFrame:NO];
                    
                    id actionMoveDone = [CCCallFuncN actionWithTarget:self selector:@selector(finishActionSprite72)];
                    
                    [self.sprite72 runAction:[CCSpawn actionOne:[CCSequence actions:actionMove,actionMoveDone,nil] two:actionMove2]];
                    return;
                }
            }
        }
    }
    [self finishActionSprite72];
}
-(void) moverightSprite72
{
    CGPoint sprite72Pos = self.sprite72.position;
    self.sprite72.orientation = 3;
    sprite72Pos.x += _theHKMap.tileSize.width;
    
    CGPoint tileCoord = [self tileCoordForPosition:sprite72Pos];
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
                    CGPoint tileCoord1 = [self tileCoordForPosition:self.sprite72.position];
                    int tileGID1 = [self.bgLayer tileGIDAt:tileCoord1];
                    [self.bgLayer removeTileAt:tileCoord1];
                    [self.bgLayer setTileGID:(tileGID1 - 12) at:tileCoord1];
                    
                    id actionMove = [CCMoveTo actionWithDuration:0.3 position:sprite72Pos];
                    id actionMove2 = [CCAnimate actionWithAnimation:spriteTWalkRight restoreOriginalFrame:NO];
                    
                    id actionMoveDone = [CCCallFuncN actionWithTarget:self selector:@selector(finishActionSprite72)];
                    
                    [self.sprite72 runAction:[CCSpawn actionOne:[CCSequence actions:actionMove,actionMoveDone,nil] two:actionMove2]];
                    return;
                }
            }
        }
    }
    [self finishActionSprite72];
}
-(void) moveupSprite72
{
    CGPoint sprite72Pos = self.sprite72.position;
    self.sprite72.orientation = 2;
    sprite72Pos.y += _theHKMap.tileSize.height;
    
    CGPoint tileCoord = [self tileCoordForPosition:sprite72Pos];
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
                    CGPoint tileCoord1 = [self tileCoordForPosition:self.sprite72.position];
                    int tileGID1 = [self.bgLayer tileGIDAt:tileCoord1];
                    [self.bgLayer removeTileAt:tileCoord1];
                    [self.bgLayer setTileGID:(tileGID1 - 12) at:tileCoord1];
                    
                    id actionMove = [CCMoveTo actionWithDuration:0.3 position:sprite72Pos];
                    id actionMove2 = [CCAnimate actionWithAnimation:spriteTWalkUp restoreOriginalFrame:NO];
                    
                    id actionMoveDone = [CCCallFuncN actionWithTarget:self selector:@selector(finishActionSprite72)];
                    
                    [self.sprite72 runAction:[CCSpawn actionOne:[CCSequence actions:actionMove,actionMoveDone,nil] two:actionMove2]];
                    return;
                }
            }
        }
    }
    [self finishActionSprite72];
}
-(void) movedownSprite72
{
    CGPoint sprite72Pos = self.sprite72.position;
    self.sprite72.orientation = 1;
    sprite72Pos.y -= _theHKMap.tileSize.width;
    
    CGPoint tileCoord = [self tileCoordForPosition:sprite72Pos];
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
                    CGPoint tileCoord1 = [self tileCoordForPosition:self.sprite72.position];
                    int tileGID1 = [self.bgLayer tileGIDAt:tileCoord1];
                    [self.bgLayer removeTileAt:tileCoord1];
                    [self.bgLayer setTileGID:(tileGID1 - 12) at:tileCoord1];
                    
                    id actionMove = [CCMoveTo actionWithDuration:0.3 position:sprite72Pos];
                    id actionMove2 = [CCAnimate actionWithAnimation:spriteTWalkDown restoreOriginalFrame:NO];
                    
                    id actionMoveDone = [CCCallFuncN actionWithTarget:self selector:@selector(finishActionSprite72)];
                    
                    [self.sprite72 runAction:[CCSpawn actionOne:[CCSequence actions:actionMove,actionMoveDone,nil] two:actionMove2]];
                    return;
                }
            }
        }
    }
    [self finishActionSprite72];
}
-(void) finishActionSprite72
{
    if (self.sprite72.orientation == 1)
    {
        [self.sprite72 setDisplayFrame:[[spriteTWalkDown frames] objectAtIndex:0]];
    }
    else if (self.sprite72.orientation == 2)
    {
        [self.sprite72 setDisplayFrame:[[spriteTWalkUp frames] objectAtIndex:0]];
    }
    else if (self.sprite72.orientation == 3)
    {
        [self.sprite72 setDisplayFrame:[[spriteTWalkRight frames] objectAtIndex:0]];
    }
    else
    {
        [self.sprite72 setDisplayFrame:[[spriteTWalkLeft frames] objectAtIndex:0]];
    }
    self.hero.sprite72position = self.sprite72.position;
}

-(void) updateSprite73
{
    CGSize screenSize = [[CCDirector sharedDirector] winSize];
    int x = self.hero.position.x;
    int y = self.hero.position.y;
    
    int p = self.sprite73.position.x;
    int q = self.sprite73.position.y;
    
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
        [self moveleftSprite73];
    }
    if (rand == 2)
    {
        [self moverightSprite73];
    }
    if (rand == 3)
    {
        [self moveupSprite73];
    }
    if (rand == 4)
    {
        [self movedownSprite73];
    }
    return;
}

-(void) moveleftSprite73
{
    CGPoint sprite73Pos = self.sprite73.position;
    self.sprite73.orientation = 4;
    sprite73Pos.x -= _theHKMap.tileSize.width;
    
    CGPoint tileCoord = [self tileCoordForPosition:sprite73Pos];
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
                    CGPoint tileCoord1 = [self tileCoordForPosition:self.sprite73.position];
                    int tileGID1 = [self.bgLayer tileGIDAt:tileCoord1];
                    [self.bgLayer removeTileAt:tileCoord1];
                    [self.bgLayer setTileGID:(tileGID1 - 13) at:tileCoord1];
                    
                    id actionMove = [CCMoveTo actionWithDuration:0.3 position:sprite73Pos];
                    id actionMove2 = [CCAnimate actionWithAnimation:spriteYWalkLeft restoreOriginalFrame:NO];
                    
                    id actionMoveDone = [CCCallFuncN actionWithTarget:self selector:@selector(finishActionSprite73)];
                    
                    [self.sprite73 runAction:[CCSpawn actionOne:[CCSequence actions:actionMove,actionMoveDone,nil] two:actionMove2]];
                    return;
                }
            }
        }
    }
    [self finishActionSprite73];
}
-(void) moverightSprite73
{
    CGPoint sprite73Pos = self.sprite73.position;
    self.sprite73.orientation = 3;
    sprite73Pos.x += _theHKMap.tileSize.width;
    
    CGPoint tileCoord = [self tileCoordForPosition:sprite73Pos];
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
                    CGPoint tileCoord1 = [self tileCoordForPosition:self.sprite73.position];
                    int tileGID1 = [self.bgLayer tileGIDAt:tileCoord1];
                    [self.bgLayer removeTileAt:tileCoord1];
                    [self.bgLayer setTileGID:(tileGID1 - 13) at:tileCoord1];
                    
                    id actionMove = [CCMoveTo actionWithDuration:0.3 position:sprite73Pos];
                    id actionMove2 = [CCAnimate actionWithAnimation:spriteYWalkRight restoreOriginalFrame:NO];
                    
                    id actionMoveDone = [CCCallFuncN actionWithTarget:self selector:@selector(finishActionSprite73)];
                    
                    [self.sprite73 runAction:[CCSpawn actionOne:[CCSequence actions:actionMove,actionMoveDone,nil] two:actionMove2]];
                    return;
                }
            }
        }
    }
    [self finishActionSprite73];
}
-(void) moveupSprite73
{
    CGPoint sprite73Pos = self.sprite73.position;
    self.sprite73.orientation = 2;
    sprite73Pos.y += _theHKMap.tileSize.height;
    
    CGPoint tileCoord = [self tileCoordForPosition:sprite73Pos];
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
                    CGPoint tileCoord1 = [self tileCoordForPosition:self.sprite73.position];
                    int tileGID1 = [self.bgLayer tileGIDAt:tileCoord1];
                    [self.bgLayer removeTileAt:tileCoord1];
                    [self.bgLayer setTileGID:(tileGID1 - 13) at:tileCoord1];
                    
                    id actionMove = [CCMoveTo actionWithDuration:0.3 position:sprite73Pos];
                    id actionMove2 = [CCAnimate actionWithAnimation:spriteYWalkUp restoreOriginalFrame:NO];
                    
                    id actionMoveDone = [CCCallFuncN actionWithTarget:self selector:@selector(finishActionSprite73)];
                    
                    [self.sprite73 runAction:[CCSpawn actionOne:[CCSequence actions:actionMove,actionMoveDone,nil] two:actionMove2]];
                    return;
                }
            }
        }
    }
    [self finishActionSprite73];
}
-(void) movedownSprite73
{
    CGPoint sprite73Pos = self.sprite73.position;
    self.sprite73.orientation = 1;
    sprite73Pos.y -= _theHKMap.tileSize.width;
    
    CGPoint tileCoord = [self tileCoordForPosition:sprite73Pos];
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
                    CGPoint tileCoord1 = [self tileCoordForPosition:self.sprite73.position];
                    int tileGID1 = [self.bgLayer tileGIDAt:tileCoord1];
                    [self.bgLayer removeTileAt:tileCoord1];
                    [self.bgLayer setTileGID:(tileGID1 - 13) at:tileCoord1];
                    
                    id actionMove = [CCMoveTo actionWithDuration:0.3 position:sprite73Pos];
                    id actionMove2 = [CCAnimate actionWithAnimation:spriteYWalkDown restoreOriginalFrame:NO];
                    
                    id actionMoveDone = [CCCallFuncN actionWithTarget:self selector:@selector(finishActionSprite73)];
                    
                    [self.sprite73 runAction:[CCSpawn actionOne:[CCSequence actions:actionMove,actionMoveDone,nil] two:actionMove2]];
                    return;
                }
            }
        }
    }
    [self finishActionSprite73];
}
-(void) finishActionSprite73
{
    if (self.sprite73.orientation == 1)
    {
        [self.sprite73 setDisplayFrame:[[spriteYWalkDown frames] objectAtIndex:0]];
    }
    else if (self.sprite73.orientation == 2)
    {
        [self.sprite73 setDisplayFrame:[[spriteYWalkUp frames] objectAtIndex:0]];
    }
    else if (self.sprite73.orientation == 3)
    {
        [self.sprite73 setDisplayFrame:[[spriteYWalkRight frames] objectAtIndex:0]];
    }
    else
    {
        [self.sprite73 setDisplayFrame:[[spriteYWalkLeft frames] objectAtIndex:0]];
    }
    self.hero.sprite73position = self.sprite73.position;
}

-(void) updateSprite74
{
    CGSize screenSize = [[CCDirector sharedDirector] winSize];
    int x = self.hero.position.x;
    int y = self.hero.position.y;
    
    int p = self.sprite74.position.x;
    int q = self.sprite74.position.y;
    
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
        [self moveleftSprite74];
    }
    if (rand == 2)
    {
        [self moverightSprite74];
    }
    if (rand == 3)
    {
        [self moveupSprite74];
    }
    if (rand == 4)
    {
        [self movedownSprite74];
    }
    return;
}

-(void) moveleftSprite74
{
    CGPoint sprite74Pos = self.sprite74.position;
    self.sprite74.orientation = 4;
    sprite74Pos.x -= _theHKMap.tileSize.width;
    
    CGPoint tileCoord = [self tileCoordForPosition:sprite74Pos];
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
                    CGPoint tileCoord1 = [self tileCoordForPosition:self.sprite74.position];
                    int tileGID1 = [self.bgLayer tileGIDAt:tileCoord1];
                    [self.bgLayer removeTileAt:tileCoord1];
                    [self.bgLayer setTileGID:(tileGID1 - 14) at:tileCoord1];
                    
                    id actionMove = [CCMoveTo actionWithDuration:0.3 position:sprite74Pos];
                    id actionMove2 = [CCAnimate actionWithAnimation:spriteZBWalkLeft restoreOriginalFrame:NO];
                    
                    id actionMoveDone = [CCCallFuncN actionWithTarget:self selector:@selector(finishActionSprite74)];
                    
                    [self.sprite74 runAction:[CCSpawn actionOne:[CCSequence actions:actionMove,actionMoveDone,nil] two:actionMove2]];
                    return;
                }
            }
        }
    }
    [self finishActionSprite74];
}
-(void) moverightSprite74
{
    CGPoint sprite74Pos = self.sprite74.position;
    self.sprite74.orientation = 3;
    sprite74Pos.x += _theHKMap.tileSize.width;
    
    CGPoint tileCoord = [self tileCoordForPosition:sprite74Pos];
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
                    CGPoint tileCoord1 = [self tileCoordForPosition:self.sprite74.position];
                    int tileGID1 = [self.bgLayer tileGIDAt:tileCoord1];
                    [self.bgLayer removeTileAt:tileCoord1];
                    [self.bgLayer setTileGID:(tileGID1 - 14) at:tileCoord1];
                    
                    id actionMove = [CCMoveTo actionWithDuration:0.3 position:sprite74Pos];
                    id actionMove2 = [CCAnimate actionWithAnimation:spriteZBWalkRight restoreOriginalFrame:NO];
                    
                    id actionMoveDone = [CCCallFuncN actionWithTarget:self selector:@selector(finishActionSprite74)];
                    
                    [self.sprite74 runAction:[CCSpawn actionOne:[CCSequence actions:actionMove,actionMoveDone,nil] two:actionMove2]];
                    return;
                }
            }
        }
    }
    [self finishActionSprite74];
}
-(void) moveupSprite74
{
    CGPoint sprite74Pos = self.sprite74.position;
    self.sprite74.orientation = 2;
    sprite74Pos.y += _theHKMap.tileSize.height;
    
    CGPoint tileCoord = [self tileCoordForPosition:sprite74Pos];
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
                    CGPoint tileCoord1 = [self tileCoordForPosition:self.sprite74.position];
                    int tileGID1 = [self.bgLayer tileGIDAt:tileCoord1];
                    [self.bgLayer removeTileAt:tileCoord1];
                    [self.bgLayer setTileGID:(tileGID1 - 14) at:tileCoord1];
                    
                    id actionMove = [CCMoveTo actionWithDuration:0.3 position:sprite74Pos];
                    id actionMove2 = [CCAnimate actionWithAnimation:spriteZBWalkUp restoreOriginalFrame:NO];
                    
                    id actionMoveDone = [CCCallFuncN actionWithTarget:self selector:@selector(finishActionSprite74)];
                    
                    [self.sprite74 runAction:[CCSpawn actionOne:[CCSequence actions:actionMove,actionMoveDone,nil] two:actionMove2]];
                    return;
                }
            }
        }
    }
    [self finishActionSprite74];
}
-(void) movedownSprite74
{
    CGPoint sprite74Pos = self.sprite74.position;
    self.sprite74.orientation = 1;
    sprite74Pos.y -= _theHKMap.tileSize.width;
    
    CGPoint tileCoord = [self tileCoordForPosition:sprite74Pos];
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
                    CGPoint tileCoord1 = [self tileCoordForPosition:self.sprite74.position];
                    int tileGID1 = [self.bgLayer tileGIDAt:tileCoord1];
                    [self.bgLayer removeTileAt:tileCoord1];
                    [self.bgLayer setTileGID:(tileGID1 - 14) at:tileCoord1];
                    
                    id actionMove = [CCMoveTo actionWithDuration:0.3 position:sprite74Pos];
                    id actionMove2 = [CCAnimate actionWithAnimation:spriteZBWalkDown restoreOriginalFrame:NO];
                    
                    id actionMoveDone = [CCCallFuncN actionWithTarget:self selector:@selector(finishActionSprite74)];
                    
                    [self.sprite74 runAction:[CCSpawn actionOne:[CCSequence actions:actionMove,actionMoveDone,nil] two:actionMove2]];
                    return;
                }
            }
        }
    }
    [self finishActionSprite74];
}
-(void) finishActionSprite74
{
    if (self.sprite74.orientation == 1)
    {
        [self.sprite74 setDisplayFrame:[[spriteZBWalkDown frames] objectAtIndex:0]];
    }
    else if (self.sprite74.orientation == 2)
    {
        [self.sprite74 setDisplayFrame:[[spriteZBWalkUp frames] objectAtIndex:0]];
    }
    else if (self.sprite74.orientation == 3)
    {
        [self.sprite74 setDisplayFrame:[[spriteZBWalkRight frames] objectAtIndex:0]];
    }
    else
    {
        [self.sprite74 setDisplayFrame:[[spriteZBWalkLeft frames] objectAtIndex:0]];
    }
    self.hero.sprite74position = self.sprite74.position;
}

-(void) updateSprite75
{
    CGSize screenSize = [[CCDirector sharedDirector] winSize];
    int x = self.hero.position.x;
    int y = self.hero.position.y;
    
    int p = self.sprite75.position.x;
    int q = self.sprite75.position.y;
    
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
        [self moveleftSprite75];
    }
    if (rand == 2)
    {
        [self moverightSprite75];
    }
    if (rand == 3)
    {
        [self moveupSprite75];
    }
    if (rand == 4)
    {
        [self movedownSprite75];
    }
    return;
}

-(void) moveleftSprite75
{
    CGPoint sprite75Pos = self.sprite75.position;
    self.sprite75.orientation = 4;
    sprite75Pos.x -= _theHKMap.tileSize.width;
    
    CGPoint tileCoord = [self tileCoordForPosition:sprite75Pos];
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
                    CGPoint tileCoord1 = [self tileCoordForPosition:self.sprite75.position];
                    int tileGID1 = [self.bgLayer tileGIDAt:tileCoord1];
                    [self.bgLayer removeTileAt:tileCoord1];
                    [self.bgLayer setTileGID:(tileGID1 - 15) at:tileCoord1];
                    
                    id actionMove = [CCMoveTo actionWithDuration:0.3 position:sprite75Pos];
                    id actionMove2 = [CCAnimate actionWithAnimation:spriteZWalkLeft restoreOriginalFrame:NO];
                    
                    id actionMoveDone = [CCCallFuncN actionWithTarget:self selector:@selector(finishActionSprite75)];
                    
                    [self.sprite75 runAction:[CCSpawn actionOne:[CCSequence actions:actionMove,actionMoveDone,nil] two:actionMove2]];
                    return;
                }
            }
        }
    }
    [self finishActionSprite75];
}
-(void) moverightSprite75
{
    CGPoint sprite75Pos = self.sprite75.position;
    self.sprite75.orientation = 3;
    sprite75Pos.x += _theHKMap.tileSize.width;
    
    CGPoint tileCoord = [self tileCoordForPosition:sprite75Pos];
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
                    CGPoint tileCoord1 = [self tileCoordForPosition:self.sprite75.position];
                    int tileGID1 = [self.bgLayer tileGIDAt:tileCoord1];
                    [self.bgLayer removeTileAt:tileCoord1];
                    [self.bgLayer setTileGID:(tileGID1 - 15) at:tileCoord1];
                    
                    id actionMove = [CCMoveTo actionWithDuration:0.3 position:sprite75Pos];
                    id actionMove2 = [CCAnimate actionWithAnimation:spriteZWalkRight restoreOriginalFrame:NO];
                    
                    id actionMoveDone = [CCCallFuncN actionWithTarget:self selector:@selector(finishActionSprite75)];
                    
                    [self.sprite75 runAction:[CCSpawn actionOne:[CCSequence actions:actionMove,actionMoveDone,nil] two:actionMove2]];
                    return;
                }
            }
        }
    }
    [self finishActionSprite75];
}
-(void) moveupSprite75
{
    CGPoint sprite75Pos = self.sprite75.position;
    self.sprite75.orientation = 2;
    sprite75Pos.y += _theHKMap.tileSize.height;
    
    CGPoint tileCoord = [self tileCoordForPosition:sprite75Pos];
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
                    CGPoint tileCoord1 = [self tileCoordForPosition:self.sprite75.position];
                    int tileGID1 = [self.bgLayer tileGIDAt:tileCoord1];
                    [self.bgLayer removeTileAt:tileCoord1];
                    [self.bgLayer setTileGID:(tileGID1 - 15) at:tileCoord1];
                    
                    id actionMove = [CCMoveTo actionWithDuration:0.3 position:sprite75Pos];
                    id actionMove2 = [CCAnimate actionWithAnimation:spriteZWalkUp restoreOriginalFrame:NO];
                    
                    id actionMoveDone = [CCCallFuncN actionWithTarget:self selector:@selector(finishActionSprite75)];
                    
                    [self.sprite75 runAction:[CCSpawn actionOne:[CCSequence actions:actionMove,actionMoveDone,nil] two:actionMove2]];
                    return;
                }
            }
        }
    }
    [self finishActionSprite75];
}
-(void) movedownSprite75
{
    CGPoint sprite75Pos = self.sprite75.position;
    self.sprite75.orientation = 1;
    sprite75Pos.y -= _theHKMap.tileSize.width;
    
    CGPoint tileCoord = [self tileCoordForPosition:sprite75Pos];
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
                    CGPoint tileCoord1 = [self tileCoordForPosition:self.sprite75.position];
                    int tileGID1 = [self.bgLayer tileGIDAt:tileCoord1];
                    [self.bgLayer removeTileAt:tileCoord1];
                    [self.bgLayer setTileGID:(tileGID1 - 15) at:tileCoord1];
                    
                    id actionMove = [CCMoveTo actionWithDuration:0.3 position:sprite75Pos];
                    id actionMove2 = [CCAnimate actionWithAnimation:spriteZWalkDown restoreOriginalFrame:NO];
                    
                    id actionMoveDone = [CCCallFuncN actionWithTarget:self selector:@selector(finishActionSprite75)];
                    
                    [self.sprite75 runAction:[CCSpawn actionOne:[CCSequence actions:actionMove,actionMoveDone,nil] two:actionMove2]];
                    return;
                }
            }
        }
    }
    [self finishActionSprite75];
}
-(void) finishActionSprite75
{
    if (self.sprite75.orientation == 1)
    {
        [self.sprite75 setDisplayFrame:[[spriteZWalkDown frames] objectAtIndex:0]];
    }
    else if (self.sprite75.orientation == 2)
    {
        [self.sprite75 setDisplayFrame:[[spriteZWalkUp frames] objectAtIndex:0]];
    }
    else if (self.sprite75.orientation == 3)
    {
        [self.sprite75 setDisplayFrame:[[spriteZWalkRight frames] objectAtIndex:0]];
    }
    else
    {
        [self.sprite75 setDisplayFrame:[[spriteZWalkLeft frames] objectAtIndex:0]];
    }
    self.hero.sprite75position = self.sprite75.position;
}

-(void) updateSprite76
{
    CGSize screenSize = [[CCDirector sharedDirector] winSize];
    int x = self.hero.position.x;
    int y = self.hero.position.y;
    
    int p = self.sprite76.position.x;
    int q = self.sprite76.position.y;
    
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
        [self moveleftSprite76];
    }
    if (rand == 2)
    {
        [self moverightSprite76];
    }
    if (rand == 3)
    {
        [self moveupSprite76];
    }
    if (rand == 4)
    {
        [self movedownSprite76];
    }
    return;
}

-(void) moveleftSprite76
{
    CGPoint sprite76Pos = self.sprite76.position;
    self.sprite76.orientation = 4;
    sprite76Pos.x -= _theHKMap.tileSize.width;
    
    CGPoint tileCoord = [self tileCoordForPosition:sprite76Pos];
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
                    CGPoint tileCoord1 = [self tileCoordForPosition:self.sprite76.position];
                    int tileGID1 = [self.bgLayer tileGIDAt:tileCoord1];
                    [self.bgLayer removeTileAt:tileCoord1];
                    [self.bgLayer setTileGID:(tileGID1 - 16) at:tileCoord1];
                    
                    id actionMove = [CCMoveTo actionWithDuration:0.3 position:sprite76Pos];
                    id actionMove2 = [CCAnimate actionWithAnimation:spriteUWalkLeft restoreOriginalFrame:NO];
                    
                    id actionMoveDone = [CCCallFuncN actionWithTarget:self selector:@selector(finishActionSprite76)];
                    
                    [self.sprite76 runAction:[CCSpawn actionOne:[CCSequence actions:actionMove,actionMoveDone,nil] two:actionMove2]];
                    return;
                }
            }
        }
    }
    [self finishActionSprite76];
}
-(void) moverightSprite76
{
    CGPoint sprite76Pos = self.sprite76.position;
    self.sprite76.orientation = 3;
    sprite76Pos.x += _theHKMap.tileSize.width;
    
    CGPoint tileCoord = [self tileCoordForPosition:sprite76Pos];
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
                    CGPoint tileCoord1 = [self tileCoordForPosition:self.sprite76.position];
                    int tileGID1 = [self.bgLayer tileGIDAt:tileCoord1];
                    [self.bgLayer removeTileAt:tileCoord1];
                    [self.bgLayer setTileGID:(tileGID1 - 16) at:tileCoord1];
                    
                    id actionMove = [CCMoveTo actionWithDuration:0.3 position:sprite76Pos];
                    id actionMove2 = [CCAnimate actionWithAnimation:spriteUWalkRight restoreOriginalFrame:NO];
                    
                    id actionMoveDone = [CCCallFuncN actionWithTarget:self selector:@selector(finishActionSprite76)];
                    
                    [self.sprite76 runAction:[CCSpawn actionOne:[CCSequence actions:actionMove,actionMoveDone,nil] two:actionMove2]];
                    return;
                }
            }
        }
    }
    [self finishActionSprite76];
}
-(void) moveupSprite76
{
    CGPoint sprite76Pos = self.sprite76.position;
    self.sprite76.orientation = 2;
    sprite76Pos.y += _theHKMap.tileSize.height;
    
    CGPoint tileCoord = [self tileCoordForPosition:sprite76Pos];
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
                    CGPoint tileCoord1 = [self tileCoordForPosition:self.sprite76.position];
                    int tileGID1 = [self.bgLayer tileGIDAt:tileCoord1];
                    [self.bgLayer removeTileAt:tileCoord1];
                    [self.bgLayer setTileGID:(tileGID1 - 16) at:tileCoord1];
                    
                    id actionMove = [CCMoveTo actionWithDuration:0.3 position:sprite76Pos];
                    id actionMove2 = [CCAnimate actionWithAnimation:spriteUWalkUp restoreOriginalFrame:NO];
                    
                    id actionMoveDone = [CCCallFuncN actionWithTarget:self selector:@selector(finishActionSprite76)];
                    
                    [self.sprite76 runAction:[CCSpawn actionOne:[CCSequence actions:actionMove,actionMoveDone,nil] two:actionMove2]];
                    return;
                }
            }
        }
    }
    [self finishActionSprite76];
}
-(void) movedownSprite76
{
    CGPoint sprite76Pos = self.sprite76.position;
    self.sprite76.orientation = 1;
    sprite76Pos.y -= _theHKMap.tileSize.width;
    
    CGPoint tileCoord = [self tileCoordForPosition:sprite76Pos];
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
                    CGPoint tileCoord1 = [self tileCoordForPosition:self.sprite76.position];
                    int tileGID1 = [self.bgLayer tileGIDAt:tileCoord1];
                    [self.bgLayer removeTileAt:tileCoord1];
                    [self.bgLayer setTileGID:(tileGID1 - 16) at:tileCoord1];
                    
                    id actionMove = [CCMoveTo actionWithDuration:0.3 position:sprite76Pos];
                    id actionMove2 = [CCAnimate actionWithAnimation:spriteUWalkDown restoreOriginalFrame:NO];
                    
                    id actionMoveDone = [CCCallFuncN actionWithTarget:self selector:@selector(finishActionSprite76)];
                    
                    [self.sprite76 runAction:[CCSpawn actionOne:[CCSequence actions:actionMove,actionMoveDone,nil] two:actionMove2]];
                    return;
                }
            }
        }
    }
    [self finishActionSprite76];
}
-(void) finishActionSprite76
{
    if (self.sprite76.orientation == 1)
    {
        [self.sprite76 setDisplayFrame:[[spriteUWalkDown frames] objectAtIndex:0]];
    }
    else if (self.sprite76.orientation == 2)
    {
        [self.sprite76 setDisplayFrame:[[spriteUWalkUp frames] objectAtIndex:0]];
    }
    else if (self.sprite76.orientation == 3)
    {
        [self.sprite76 setDisplayFrame:[[spriteUWalkRight frames] objectAtIndex:0]];
    }
    else
    {
        [self.sprite76 setDisplayFrame:[[spriteUWalkLeft frames] objectAtIndex:0]];
    }
    self.hero.sprite76position = self.sprite76.position;
}

-(void)pickedUpItem:(int)itemCode
{
    [MusicHandler playButtonClick];
    if (itemCode == 9)
    {
        CGPoint pos = self.item9.position;
        self.hero.gotItem9 = YES;
        [self.theHKMap removeChild:self.item9 cleanup:YES];
        self.item9 = [CCSprite spriteWithFile:@"treasurechestSprite02.png"];
        self.item9.position = pos;
        [self.theHKMap addChild:self.item9 z:self.bgLayer.zOrder];
        
        [self givenItem:59];
    }
    else if (itemCode == 10)
    {
        self.hero.gotItem10 = YES;
        [self.theHKMap removeChild:self.item10 cleanup:YES];
        self.hero.gold += 30;
        
    }
    else if (itemCode == 11)
    {
        CGPoint pos = self.item11.position;
        self.hero.gotItem11 = YES;
        [self.theHKMap removeChild:self.item11 cleanup:YES];
        self.item11 = [CCSprite spriteWithFile:@"treasurechestSprite02.png"];
        self.item11.position = pos;
        [self.theHKMap addChild:self.item11 z:self.bgLayer.zOrder];
        
        [self givenItem:184];
        
    }
    else if (itemCode == 12)
    {
        CGPoint pos = self.item12.position;
        self.hero.gotItem12 = YES;
        [self.theHKMap removeChild:self.item12 cleanup:YES];
        self.item12 = [CCSprite spriteWithFile:@"treasurechestSprite02.png"];
        self.item12.position = pos;
        [self.theHKMap addChild:self.item12 z:self.bgLayer.zOrder];
        
        [self givenItem:3];
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
    [SceneManager goPlay:3];
    return;
}



-(void) goGate:(int)gate
{
    
    //if (condition) { //later: Cool animation
    //    statements
    //}
    self.hero.mapInitMode = 2;
    [self saveHero];
    [SceneManager goPlay:1];
    return;
}



-(void)saveHero
{
    self.hero.sprite61position = self.sprite61.position;
    self.hero.sprite62position = self.sprite62.position;
    self.hero.sprite63position = self.sprite63.position;
    self.hero.sprite64position = self.sprite64.position;
    self.hero.sprite65position = self.sprite65.position;
    self.hero.sprite66position = self.sprite66.position;
    self.hero.sprite67position = self.sprite67.position;
    self.hero.sprite68position = self.sprite68.position;
    self.hero.sprite69position = self.sprite69.position;
    self.hero.sprite70position = self.sprite70.position;
    self.hero.sprite71position = self.sprite71.position;
    self.hero.sprite72position = self.sprite72.position;
    self.hero.sprite73position = self.sprite73.position;
    self.hero.sprite74position = self.sprite74.position;
    self.hero.sprite75position = self.sprite75.position;
    self.hero.sprite76position = self.sprite76.position;
    
    self.hero.heroOrientation = self.spriteOrientation;
    
    self.hero.sprite61_Orientation = self.sprite61.orientation;
    self.hero.sprite62_Orientation = self.sprite62.orientation;
    self.hero.sprite63_Orientation = self.sprite63.orientation;
    self.hero.sprite64_Orientation = self.sprite64.orientation;
    self.hero.sprite65_Orientation = self.sprite65.orientation;
    self.hero.sprite66_Orientation = self.sprite66.orientation;
    self.hero.sprite67_Orientation = self.sprite67.orientation;
    self.hero.sprite68_Orientation = self.sprite68.orientation;
    self.hero.sprite69_Orientation = self.sprite69.orientation;
    self.hero.sprite70_Orientation = self.sprite70.orientation;
    self.hero.sprite71_Orientation = self.sprite71.orientation;
    self.hero.sprite72_Orientation = self.sprite72.orientation;
    self.hero.sprite73_Orientation = self.sprite73.orientation;
    self.hero.sprite74_Orientation = self.sprite74.orientation;
    self.hero.sprite75_Orientation = self.sprite75.orientation;
    self.hero.sprite76_Orientation = self.sprite76.orientation;
    
    //[GameSceneManager sharedGameSceneManager].hero = self.hero;
}

-(void) unblockCave
{
    CGPoint tileCoord = [self tileCoordForPosition:sprite70.position];
    int tileGID = [self.bgLayer tileGIDAt:tileCoord];
    [self.bgLayer removeTileAt:tileCoord];
    [self.bgLayer setTileGID:(tileGID - 10) at:tileCoord];
    
    [self.theHKMap removeChild:sprite70 cleanup:YES];
    self.sprite70 = [InteractiveSprite spriteWithSpriteFrameName:@"herospriteM04.png"];
    self.sprite70.spriteCode = 70;
    self.sprite70.orientation = 1;
    
    CCTMXObjectGroup *objects = [_theHKMap objectGroupNamed:@"oj1"];
    NSMutableDictionary *sprite70start = [objects objectNamed:@"spriteStart70"];
    double x1 = [[sprite70start valueForKey:@"x"]floatValue];
    double y1 = [[sprite70start valueForKey:@"y"]floatValue];
    self.sprite70.position = ccp(x1,y1);
    
    [self.theHKMap addChild:self.sprite70 z:self.bgLayer.zOrder];
    
    CGPoint tileCoord3 = [self tileCoordForPosition:self.sprite70.position];
    int tileGID3 = [self.bgLayer tileGIDAt:tileCoord3];
    [self.bgLayer removeTileAt:tileCoord3];
    [self.bgLayer setTileGID:(tileGID3 + 10) at:tileCoord3];
    [self saveHero];
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
            
            NSString *gate3 = [properties valueForKey:@"gate3"];
            if (gate3 && [gate3 compare:@"true"] == NSOrderedSame)
            {
                
                [self goGate:3];
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
            
            NSString *mapitem6 = [properties valueForKey:@"item10"];
            if (mapitem6 && [mapitem6 compare:@"true"] == NSOrderedSame)
            {
                if (!self.hero.gotItem10)
                {
                    [self pickedUpItem:10];
                    [self saveHero];
                    [self goText:2310];
                }
            }
            
            NSString *cave1 = [properties valueForKey:@"caveIsHere"];
            if (cave1 && [cave1 compare:@"true"] == NSOrderedSame)
            {
                {
                    [self goCave];
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
            
            NSString *gate1 = [properties valueForKey:@"gate2"];
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
            
            NSString *mapitem10 = [properties valueForKey:@"item10"];
            if (mapitem10 && [mapitem10 compare:@"true"] == NSOrderedSame)
            {
                if (!self.hero.gotItem10)
                {
                    [self pickedUpItem:10];
                    [self saveHero];
                    [self goText:2310];
                }
            }
            
            NSString *cave1 = [properties valueForKey:@"caveIsHere"];
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
                    [self goCave];
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
            
            NSString *sprite61Interact = [properties valueForKey:@"sprite61IsHere"];
            if (sprite61Interact && [sprite61Interact compare:@"true"] == NSOrderedSame)
            {
                self.sprite61.orientation = oppOrientation;
                
                if (self.sprite61.orientation == 1)
                {
                    [self.sprite61 setDisplayFrame:[[spriteAWalkDown frames] objectAtIndex:0]];
                }
                else if (self.sprite61.orientation == 2)
                {
                    [self.sprite61 setDisplayFrame:[[spriteAWalkUp frames] objectAtIndex:0]];
                }
                else if (self.sprite61.orientation == 3)
                {
                    [self.sprite61 setDisplayFrame:[[spriteAWalkRight frames] objectAtIndex:0]];
                }
                else
                {
                    [self.sprite61 setDisplayFrame:[[spriteAWalkLeft frames] objectAtIndex:0]];
                }
                
                if (self.hero.beatCaveTroll)
                {
                    [self goText:2001];
                    return;
                }
                else
                {
                    [self goText:2000];
                    return;
                }
            }
            
            NSString *sprite62Interact = [properties valueForKey:@"sprite62IsHere"];
            if (sprite62Interact && [sprite62Interact compare:@"true"] == NSOrderedSame)
            {
                self.sprite62.orientation = oppOrientation;
                
                if (self.sprite62.orientation == 1)
                {
                    [self.sprite62 setDisplayFrame:[[spriteAWalkDown frames] objectAtIndex:0]];
                }
                else if (self.sprite62.orientation == 2)
                {
                    [self.sprite62 setDisplayFrame:[[spriteAWalkUp frames] objectAtIndex:0]];
                }
                else if (self.sprite62.orientation == 3)
                {
                    [self.sprite62 setDisplayFrame:[[spriteAWalkRight frames] objectAtIndex:0]];
                }
                else
                {
                    [self.sprite62 setDisplayFrame:[[spriteAWalkLeft frames] objectAtIndex:0]];
                }
                
                [self goText:2002];
                return;
            }
            
            NSString *sprite63Interact = [properties valueForKey:@"sprite63IsHere"];
            if (sprite63Interact && [sprite63Interact compare:@"true"] == NSOrderedSame)
            {
                self.sprite63.orientation = oppOrientation;
                
                if (self.sprite63.orientation == 1)
                {
                    [self.sprite63 setDisplayFrame:[[spriteAWalkDown frames] objectAtIndex:0]];
                }
                else if (self.sprite63.orientation == 2)
                {
                    [self.sprite63 setDisplayFrame:[[spriteAWalkUp frames] objectAtIndex:0]];
                }
                else if (self.sprite63.orientation == 3)
                {
                    [self.sprite63 setDisplayFrame:[[spriteAWalkRight frames] objectAtIndex:0]];
                }
                else
                {
                    [self.sprite63 setDisplayFrame:[[spriteAWalkLeft frames] objectAtIndex:0]];
                }
                
                [self goText:2003];
                return;
            }
            
            NSString *sprite64Interact = [properties valueForKey:@"sprite64IsHere"];
            if (sprite64Interact && [sprite64Interact compare:@"true"] == NSOrderedSame)
            {
                self.sprite64.orientation = oppOrientation;
                
                if (self.sprite64.orientation == 1)
                {
                    [self.sprite64 setDisplayFrame:[[spriteKWalkDown frames] objectAtIndex:0]];
                }
                else if (self.sprite64.orientation == 2)
                {
                    [self.sprite64 setDisplayFrame:[[spriteKWalkUp frames] objectAtIndex:0]];
                }
                else if (self.sprite64.orientation == 3)
                {
                    [self.sprite64 setDisplayFrame:[[spriteKWalkRight frames] objectAtIndex:0]];
                }
                else
                {
                    [self.sprite64 setDisplayFrame:[[spriteKWalkLeft frames] objectAtIndex:0]];
                }
                
                if (self.hero.beatCaveTroll)
                {
                    [self goText:2007];
                    return;
                }
                else if (self.hero.talkedToWatchmen)
                {
                    [self goText:2006];
                    return;
                }
                else if (self.hero.acceptedTaskTraveler)
                {
                    [self goText:2005];
                    return;
                }
                else
                {
                    [self goText:2004];
                    return;
                }
            }
            
            NSString *sprite65Interact = [properties valueForKey:@"sprite65IsHere"];
            if (sprite65Interact && [sprite65Interact compare:@"true"] == NSOrderedSame)
            {
                self.sprite65.orientation = oppOrientation;
                
                if (self.sprite65.orientation == 1)
                {
                    [self.sprite65 setDisplayFrame:[[spriteVWalkDown frames] objectAtIndex:0]];
                }
                else if (self.sprite65.orientation == 2)
                {
                    [self.sprite65 setDisplayFrame:[[spriteVWalkUp frames] objectAtIndex:0]];
                }
                else if (self.sprite65.orientation == 3)
                {
                    [self.sprite65 setDisplayFrame:[[spriteVWalkRight frames] objectAtIndex:0]];
                }
                else
                {
                    [self.sprite65 setDisplayFrame:[[spriteVWalkLeft frames] objectAtIndex:0]];
                }
                
                if (self.hero.gotFireRoot)
                {
                    [self goText:2010];
                    return;
                }
                else
                {
                    [self goText:2008]; //gives you fireflower root
                    return;
                }
            }
            
            NSString *sprite66Interact = [properties valueForKey:@"sprite66IsHere"];
            if (sprite66Interact && [sprite66Interact compare:@"true"] == NSOrderedSame)
            {
                self.sprite66.orientation = oppOrientation;
                
                if (self.sprite66.orientation == 1)
                {
                    [self.sprite66 setDisplayFrame:[[spriteNWalkDown frames] objectAtIndex:0]];
                }
                else if (self.sprite66.orientation == 2)
                {
                    [self.sprite66 setDisplayFrame:[[spriteNWalkUp frames] objectAtIndex:0]];
                }
                else if (self.sprite66.orientation == 3)
                {
                    [self.sprite66 setDisplayFrame:[[spriteNWalkRight frames] objectAtIndex:0]];
                }
                else
                {
                    [self.sprite66 setDisplayFrame:[[spriteNWalkLeft frames] objectAtIndex:0]];
                }
                
                [self goText:2011];
                return;
            }
            
            NSString *sprite67Interact = [properties valueForKey:@"sprite67IsHere"];
            if (sprite67Interact && [sprite67Interact compare:@"true"] == NSOrderedSame)
            {
                self.sprite67.orientation = oppOrientation;
                
                if (self.sprite67.orientation == 1)
                {
                    [self.sprite67 setDisplayFrame:[[spriteRWalkDown frames] objectAtIndex:0]];
                }
                else if (self.sprite67.orientation == 2)
                {
                    [self.sprite67 setDisplayFrame:[[spriteRWalkUp frames] objectAtIndex:0]];
                }
                else if (self.sprite67.orientation == 3)
                {
                    [self.sprite67 setDisplayFrame:[[spriteRWalkRight frames] objectAtIndex:0]];
                }
                else
                {
                    [self.sprite67 setDisplayFrame:[[spriteRWalkLeft frames] objectAtIndex:0]];
                }
                [self goText:2012];
                return;
            }
            
            NSString *sprite68Interact = [properties valueForKey:@"sprite68IsHere"];
            if (sprite68Interact && [sprite68Interact compare:@"true"] == NSOrderedSame)
            {
                self.sprite68.orientation = oppOrientation;
                
                if (self.sprite68.orientation == 1)
                {
                    [self.sprite68 setDisplayFrame:[[spriteGWalkDown frames] objectAtIndex:0]];
                }
                else if (self.sprite68.orientation == 2)
                {
                    [self.sprite68 setDisplayFrame:[[spriteGWalkUp frames] objectAtIndex:0]];
                }
                else if (self.sprite68.orientation == 3)
                {
                    [self.sprite68 setDisplayFrame:[[spriteGWalkRight frames] objectAtIndex:0]];
                }
                else
                {
                    [self.sprite68 setDisplayFrame:[[spriteGWalkLeft frames] objectAtIndex:0]];
                }
                
                if (self.hero.beatIonak)
                {
                    [self goText:2014];
                    return;
                }
                else
                {
                    [self goText:2013];
                    return;
                }
            }
            
            NSString *sprite69Interact = [properties valueForKey:@"sprite69IsHere"];
            if (sprite69Interact && [sprite69Interact compare:@"true"] == NSOrderedSame)
            {
                self.sprite69.orientation = oppOrientation;
                
                if (self.sprite69.orientation == 1)
                {
                    [self.sprite69 setDisplayFrame:[[spriteHWalkDown frames] objectAtIndex:0]];
                }
                else if (self.sprite69.orientation == 2)
                {
                    [self.sprite69 setDisplayFrame:[[spriteHWalkUp frames] objectAtIndex:0]];
                }
                else if (self.sprite69.orientation == 3)
                {
                    [self.sprite69 setDisplayFrame:[[spriteHWalkRight frames] objectAtIndex:0]];
                }
                else
                {
                    [self.sprite69 setDisplayFrame:[[spriteHWalkLeft frames] objectAtIndex:0]];
                }
                
                [self goText:2015];
                return;
                
                return;
            }
            
            NSString *sprite70Interact = [properties valueForKey:@"sprite70IsHere"];
            if (sprite70Interact && [sprite70Interact compare:@"true"] == NSOrderedSame)
            {
                self.sprite70.orientation = oppOrientation;
                
                if (self.sprite70.orientation == 1)
                {
                    [self.sprite70 setDisplayFrame:[[spriteMWalkDown frames] objectAtIndex:0]];
                }
                else if (self.sprite70.orientation == 2)
                {
                    [self.sprite70 setDisplayFrame:[[spriteMWalkUp frames] objectAtIndex:0]];
                }
                else if (self.sprite70.orientation == 3)
                {
                    [self.sprite70 setDisplayFrame:[[spriteMWalkRight frames] objectAtIndex:0]];
                }
                else
                {
                    [self.sprite70 setDisplayFrame:[[spriteMWalkLeft frames] objectAtIndex:0]];
                }
                
                if (self.hero.talkedToWatchmen)
                {
                    [self goText:2017]; // You can handle yourself out there
                    return;
                }
                else
                {
                    [self goText:2016];
                    return;
                }
            }
            
            NSString *sprite71Interact = [properties valueForKey:@"sprite71IsHere"];
            if (sprite71Interact && [sprite71Interact compare:@"true"] == NSOrderedSame)
            {
                self.sprite71.orientation = oppOrientation;
                
                if (self.sprite71.orientation == 1)
                {
                    [self.sprite71 setDisplayFrame:[[spritePWalkDown frames] objectAtIndex:0]];
                }
                else if (self.sprite71.orientation == 2)
                {
                    [self.sprite71 setDisplayFrame:[[spritePWalkUp frames] objectAtIndex:0]];
                }
                else if (self.sprite71.orientation == 3)
                {
                    [self.sprite71 setDisplayFrame:[[spritePWalkRight frames] objectAtIndex:0]];
                }
                else
                {
                    [self.sprite71 setDisplayFrame:[[spritePWalkLeft frames] objectAtIndex:0]];
                }
                
                [self goText:2018];
                return;
            }
            
            NSString *sprite72Interact = [properties valueForKey:@"sprite72IsHere"];
            if (sprite72Interact && [sprite72Interact compare:@"true"] == NSOrderedSame)
            {
                self.sprite72.orientation = oppOrientation;
                
                if (self.sprite72.orientation == 1)
                {
                    [self.sprite72 setDisplayFrame:[[spriteTWalkDown frames] objectAtIndex:0]];
                }
                else if (self.sprite72.orientation == 2)
                {
                    [self.sprite72 setDisplayFrame:[[spriteTWalkUp frames] objectAtIndex:0]];
                }
                else if (self.sprite72.orientation == 3)
                {
                    [self.sprite72 setDisplayFrame:[[spriteTWalkRight frames] objectAtIndex:0]];
                }
                else
                {
                    [self.sprite72 setDisplayFrame:[[spriteTWalkLeft frames] objectAtIndex:0]];
                }
                [self goText:2100];
                return;
            }
            
            NSString *sprite73Interact = [properties valueForKey:@"sprite73IsHere"];
            if (sprite73Interact && [sprite73Interact compare:@"true"] == NSOrderedSame)
            {
                self.sprite73.orientation = oppOrientation;
                
                if (self.sprite73.orientation == 1)
                {
                    [self.sprite73 setDisplayFrame:[[spriteYWalkDown frames] objectAtIndex:0]];
                }
                else if (self.sprite73.orientation == 2)
                {
                    [self.sprite73 setDisplayFrame:[[spriteYWalkUp frames] objectAtIndex:0]];
                }
                else if (self.sprite73.orientation == 3)
                {
                    [self.sprite73 setDisplayFrame:[[spriteYWalkRight frames] objectAtIndex:0]];
                }
                else
                {
                    [self.sprite73 setDisplayFrame:[[spriteYWalkLeft frames] objectAtIndex:0]];
                }
                
                [self goText:2101];
                return;
            }
            
            NSString *sprite74Interact = [properties valueForKey:@"sprite74IsHere"];
            if (sprite74Interact && [sprite74Interact compare:@"true"] == NSOrderedSame)
            {
                self.sprite74.orientation = oppOrientation;
                
                if (self.sprite74.orientation == 1)
                {
                    [self.sprite74 setDisplayFrame:[[spriteZBWalkDown frames] objectAtIndex:0]];
                }
                else if (self.sprite74.orientation == 2)
                {
                    [self.sprite74 setDisplayFrame:[[spriteZBWalkUp frames] objectAtIndex:0]];
                }
                else if (self.sprite74.orientation == 3)
                {
                    [self.sprite74 setDisplayFrame:[[spriteZBWalkRight frames] objectAtIndex:0]];
                }
                else
                {
                    [self.sprite74 setDisplayFrame:[[spriteZBWalkLeft frames] objectAtIndex:0]];
                }
                
                [self goText:2019];
                return;
            }
            
            NSString *sprite75Interact = [properties valueForKey:@"sprite75IsHere"];
            if (sprite75Interact && [sprite75Interact compare:@"true"] == NSOrderedSame)
            {
                self.sprite75.orientation = oppOrientation;
                
                if (self.sprite75.orientation == 1)
                {
                    [self.sprite75 setDisplayFrame:[[spriteZWalkDown frames] objectAtIndex:0]];
                }
                else if (self.sprite75.orientation == 2)
                {
                    [self.sprite75 setDisplayFrame:[[spriteZWalkUp frames] objectAtIndex:0]];
                }
                else if (self.sprite75.orientation == 3)
                {
                    [self.sprite75 setDisplayFrame:[[spriteZWalkRight frames] objectAtIndex:0]];
                }
                else
                {
                    [self.sprite75 setDisplayFrame:[[spriteZWalkLeft frames] objectAtIndex:0]];
                }
                
                [self goText:2020];
                return;
            }
            
            NSString *sprite76Interact = [properties valueForKey:@"sprite76IsHere"];
            if (sprite76Interact && [sprite76Interact compare:@"true"] == NSOrderedSame)
            {
                self.sprite76.orientation = oppOrientation;
                
                if (self.sprite76.orientation == 1)
                {
                    [self.sprite76 setDisplayFrame:[[spriteUWalkDown frames] objectAtIndex:0]];
                }
                else if (self.sprite76.orientation == 2)
                {
                    [self.sprite76 setDisplayFrame:[[spriteUWalkUp frames] objectAtIndex:0]];
                }
                else if (self.sprite76.orientation == 3)
                {
                    [self.sprite76 setDisplayFrame:[[spriteUWalkRight frames] objectAtIndex:0]];
                }
                else
                {
                    [self.sprite76 setDisplayFrame:[[spriteUWalkLeft frames] objectAtIndex:0]];
                }
                
                [self goText:2102];
                return;
            }
            
            
            NSString *mapItem5 = [properties valueForKey:@"item9"];
            if (mapItem5 && [mapItem5 compare:@"true"] == NSOrderedSame)
            {
                
                if (!self.hero.gotItem9)
                {
                    [self goText:2309];
                    return;
                }
                else
                {
                    [self goText:2399];
                    return;
                }
            }
            NSString *mapItem6 = [properties valueForKey:@"item10"];
            if (mapItem6 && [mapItem6 compare:@"true"] == NSOrderedSame)
            {
                
                if (!self.hero.gotItem10)
                {
                    [self goText:2310];
                    return;
                }
                else
                {
                    return;
                }
            }
            NSString *mapItem7 = [properties valueForKey:@"item11"];
            if (mapItem7 && [mapItem7 compare:@"true"] == NSOrderedSame)
            {
                
                if (!self.hero.gotItem11)
                {
                    [self goText:2311];
                    return;
                }
                else
                {
                    [self goText:2399];
                    return;
                }
            }
            NSString *mapItem8 = [properties valueForKey:@"item12"];
            if (mapItem8 && [mapItem8 compare:@"true"] == NSOrderedSame)
            {
                
                if (!self.hero.gotItem12)
                {
                    [self goText:2312];
                    return;
                }
                else
                {
                    [self goText:2399];
                    return;
                }
            }
            
            NSString *sign62 = [properties valueForKey:@"sign31"];
            if (sign62 && [sign62 compare:@"true"] == NSOrderedSame)
            {
                [self goText:2200];
                return;
            }
            NSString *sign63 = [properties valueForKey:@"sign32"];
            if (sign63 && [sign63 compare:@"true"] == NSOrderedSame)
            {
                [self goText:2201];
                return;
            }
            NSString *sign64 = [properties valueForKey:@"sign33"];
            if (sign64 && [sign64 compare:@"true"] == NSOrderedSame)
            {
                [self goText:2202];
                return;
            }
            NSString *sign65 = [properties valueForKey:@"sign34"];
            if (sign65 && [sign65 compare:@"true"] == NSOrderedSame)
            {
                [self goText:2203];
                return;
            }
            
        }
    }
}



-(void) goCave
{
    self.hero.mapInitMode = 2;
    [self saveHero];
    [SceneManager goPlay:10];
    return;
}




-(void) spriteCycle //should be scheduled for .125 seconds
{
    spriteCycleCount++;
    
    if (spriteCycleCount == 1)
    {
        [self updateSprite61];
    }
    else if (spriteCycleCount == 2)
    {
        [self updateSprite62];
    }
    else if (spriteCycleCount == 3)
    {
        [self updateSprite63];
    }
    else if (spriteCycleCount == 4)
    {
        [self updateSprite64];
        [self updateSprite65];
    }
    else if (spriteCycleCount == 5)
    {
        [self updateSprite66];
        [self updateSprite67];
    }
    else if (spriteCycleCount == 6)
    {
        [self updateSprite68];
        [self updateSprite70];
    }
    else if (spriteCycleCount == 7)
    {
        [self updateSprite69];
        [self updateSprite71];
        [self updateSprite72];
    }
    else if (spriteCycleCount == 8)
    {
        [self updateSprite73];
        [self updateSprite74];
    }
    else if (spriteCycleCount == 9)
    {
        [self updateSprite75];
    }
    else if (spriteCycleCount == 10)
    {
        [self updateSprite76];
    }
    
    
    if (spriteCycleCount > 11)
    {
        spriteCycleCount = 0;
    }
    return;
}






@end













