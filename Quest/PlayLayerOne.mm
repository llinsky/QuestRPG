
#import "PlaylayerOne.h"
#import "SceneManager.h"
#import "HKTMXTiledMap.h"
#import "ItemShopMenu.h"

@implementation PlayLayerOne

@synthesize sprite1;
@synthesize sprite2;
@synthesize sprite3;
@synthesize boss1,boss2;
@synthesize item1,item2,item3,item4;
@synthesize sprite4,sprite5,sprite6,sprite7,sprite8,sprite9,sprite10,sprite11,sprite12,sprite13,sprite14,sprite15,sprite16,sprite17,sprite18,sprite19,sprite20,sprite21,sprite22,sprite23,sprite24,sprite25,sprite26,sprite27;

-(id)init
{
    if (self = [super init])
    {

        self.theHKMap = [HKTMXTiledMap tiledMapWithTMXFile:@"playlayer1_FINAL.tmx"];
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
            //#####################################
            
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
            
            
            
            [[CCSpriteFrameCache sharedSpriteFrameCache] addSpriteFramesWithFile:@"herospriteDsheet.plist"];
            spriteDSheet = [CCSpriteBatchNode batchNodeWithFile:@"herospriteDsheet.png"];
            [spriteDSheet retain];
            [self addChild:spriteDSheet];
            
            NSMutableArray *spriteDWalkAnimFramesLeft = [NSMutableArray array];
            NSMutableArray *spriteDWalkAnimFramesRight = [NSMutableArray array];
            NSMutableArray *spriteDAnimFramesUp = [NSMutableArray array];
            NSMutableArray *spriteDAnimFramesDown = [NSMutableArray array];
            NSMutableArray *spriteDAnimFramesUp2 = [NSMutableArray array];
            NSMutableArray *spriteDAnimFramesDown2 = [NSMutableArray array];
            
            [spriteDWalkAnimFramesLeft addObject:[[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:@"herospriteD05.png"]];
            [spriteDWalkAnimFramesLeft addObject:[[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:@"herospriteD06.png"]];
            [spriteDWalkAnimFramesLeft addObject:[[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:@"herospriteD06.png"]];
            [spriteDWalkAnimFramesLeft addObject:[[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:@"herospriteD06.png"]];
            [spriteDWalkAnimFramesLeft addObject:[[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:@"herospriteD05.png"]];
            spriteDWalkLeft = [CCAnimation animationWithFrames:spriteDWalkAnimFramesLeft delay:0.06f];
            [spriteDWalkLeft retain];
            
            [spriteDWalkAnimFramesRight addObject:[[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:@"herospriteD04.png"]];
            [spriteDWalkAnimFramesRight addObject:[[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:@"herospriteD07.png"]];
            [spriteDWalkAnimFramesRight addObject:[[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:@"herospriteD07.png"]];
            [spriteDWalkAnimFramesRight addObject:[[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:@"herospriteD07.png"]];
            [spriteDWalkAnimFramesRight addObject:[[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:@"herospriteD04.png"]];
            spriteDWalkRight = [CCAnimation animationWithFrames:spriteDWalkAnimFramesRight delay:0.06f];
            [spriteDWalkRight retain];
            
            [spriteDAnimFramesUp addObject:[[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:@"herospriteD08.png"]];
            [spriteDAnimFramesUp addObject:[[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:@"herospriteD09.png"]];
            [spriteDAnimFramesUp addObject:[[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:@"herospriteD09.png"]];
            [spriteDAnimFramesUp addObject:[[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:@"herospriteD09.png"]];
            [spriteDAnimFramesUp addObject:[[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:@"herospriteD08.png"]];
            spriteDWalkUp = [CCAnimation animationWithFrames:spriteDAnimFramesUp delay:0.06f];
            [spriteDWalkUp retain];
            
            [spriteDAnimFramesUp2 addObject:[[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:@"herospriteD08.png"]];
            [spriteDAnimFramesUp2 addObject:[[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:@"herospriteD10.png"]];
            [spriteDAnimFramesUp2 addObject:[[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:@"herospriteD10.png"]];
            [spriteDAnimFramesUp2 addObject:[[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:@"herospriteD10.png"]];
            [spriteDAnimFramesUp2 addObject:[[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:@"herospriteD08.png"]];
            spriteDWalkUp2 = [CCAnimation animationWithFrames:spriteDAnimFramesUp2 delay:0.06f];
            [spriteDWalkUp2 retain];
            
            [spriteDAnimFramesDown addObject:[[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:@"herospriteD01.png"]];
            [spriteDAnimFramesDown addObject:[[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:@"herospriteD02.png"]];
            [spriteDAnimFramesDown addObject:[[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:@"herospriteD02.png"]];
            [spriteDAnimFramesDown addObject:[[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:@"herospriteD02.png"]];
            [spriteDAnimFramesDown addObject:[[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:@"herospriteD01.png"]];
            spriteDWalkDown = [CCAnimation animationWithFrames:spriteDAnimFramesDown delay:0.06f];
            [spriteDWalkDown retain];
            
            [spriteDAnimFramesDown2 addObject:[[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:@"herospriteD01.png"]];
            [spriteDAnimFramesDown2 addObject:[[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:@"herospriteD03.png"]];
            [spriteDAnimFramesDown2 addObject:[[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:@"herospriteD03.png"]];
            [spriteDAnimFramesDown2 addObject:[[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:@"herospriteD03.png"]];
            [spriteDAnimFramesDown2 addObject:[[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:@"herospriteD01.png"]];
            spriteDWalkDown2 = [CCAnimation animationWithFrames:spriteDAnimFramesDown2 delay:0.06f];
            [spriteDWalkDown2 retain];
            
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
            spriteHWalkLeft = [CCAnimation animationWithFrames:spriteHWalkAnimFramesLeft delay:0.08f];
            [spriteHWalkLeft retain];
            
            [spriteHWalkAnimFramesRight addObject:[[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:@"herospriteH04.png"]];
            [spriteHWalkAnimFramesRight addObject:[[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:@"herospriteH07.png"]];
            [spriteHWalkAnimFramesRight addObject:[[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:@"herospriteH07.png"]];
            [spriteHWalkAnimFramesRight addObject:[[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:@"herospriteH07.png"]];
            [spriteHWalkAnimFramesRight addObject:[[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:@"herospriteH04.png"]];
            spriteHWalkRight = [CCAnimation animationWithFrames:spriteHWalkAnimFramesRight delay:0.08f];
            [spriteHWalkRight retain];
            
            [spriteHAnimFramesUp addObject:[[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:@"herospriteH08.png"]];
            [spriteHAnimFramesUp addObject:[[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:@"herospriteH09.png"]];
            [spriteHAnimFramesUp addObject:[[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:@"herospriteH09.png"]];
            [spriteHAnimFramesUp addObject:[[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:@"herospriteH09.png"]];
            [spriteHAnimFramesUp addObject:[[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:@"herospriteH08.png"]];
            spriteHWalkUp = [CCAnimation animationWithFrames:spriteHAnimFramesUp delay:0.08f];
            [spriteHWalkUp retain];
            
            [spriteHAnimFramesUp2 addObject:[[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:@"herospriteH08.png"]];
            [spriteHAnimFramesUp2 addObject:[[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:@"herospriteH10.png"]];
            [spriteHAnimFramesUp2 addObject:[[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:@"herospriteH10.png"]];
            [spriteHAnimFramesUp2 addObject:[[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:@"herospriteH10.png"]];
            [spriteHAnimFramesUp2 addObject:[[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:@"herospriteH08.png"]];
            spriteHWalkUp2 = [CCAnimation animationWithFrames:spriteHAnimFramesUp2 delay:0.08f];
            [spriteHWalkUp2 retain];
            
            [spriteHAnimFramesDown addObject:[[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:@"herospriteH01.png"]];
            [spriteHAnimFramesDown addObject:[[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:@"herospriteH02.png"]];
            [spriteHAnimFramesDown addObject:[[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:@"herospriteH02.png"]];
            [spriteHAnimFramesDown addObject:[[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:@"herospriteH02.png"]];
            [spriteHAnimFramesDown addObject:[[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:@"herospriteH01.png"]];
            spriteHWalkDown = [CCAnimation animationWithFrames:spriteHAnimFramesDown delay:0.08f];
            [spriteHWalkDown retain];
            
            [spriteHAnimFramesDown2 addObject:[[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:@"herospriteH01.png"]];
            [spriteHAnimFramesDown2 addObject:[[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:@"herospriteH03.png"]];
            [spriteHAnimFramesDown2 addObject:[[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:@"herospriteH03.png"]];
            [spriteHAnimFramesDown2 addObject:[[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:@"herospriteH03.png"]];
            [spriteHAnimFramesDown2 addObject:[[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:@"herospriteH01.png"]];
            spriteHWalkDown2 = [CCAnimation animationWithFrames:spriteHAnimFramesDown2 delay:0.08f];
            [spriteHWalkDown2 retain];
            
            
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
        
        //########################################
        
        
        ////////////////////////////////////////////////////////////////////////
        
        self.sprite1 = [InteractiveSprite spriteWithSpriteFrameName:@"herospriteB04.png"];
        self.sprite1.spriteCode = 1;
        
        self.sprite1.orientation = 3;
        if (self.hero.sprite1_Orientation)
        {
            self.sprite1.orientation = self.hero.sprite1_Orientation;
        }
        if (self.sprite1.orientation == 1)
        {
            [self.sprite1 setDisplayFrame:[[spriteBWalkDown frames] objectAtIndex:0]];
        }
        else if (self.sprite1.orientation == 2)
        {
            [self.sprite1 setDisplayFrame:[[spriteBWalkUp frames] objectAtIndex:0]];
        }
        else if (self.sprite1.orientation == 3)
        {
            [self.sprite1 setDisplayFrame:[[spriteBWalkRight frames] objectAtIndex:0]];
        }
        else
        {
            [self.sprite1 setDisplayFrame:[[spriteBWalkLeft frames] objectAtIndex:0]];
        }
        
        //[self schedule:@selector(updateSprite1) interval:(2.0f)];
        
        if (self.hero.acceptedTaskKingVPostOrb)
        {
            if (self.hero.sprite1position.x != 0)
            {
                self.sprite1.position = self.hero.sprite1position;
            }
            else
            {
                NSMutableDictionary *sprite1start = [objects objectNamed:@"spriteStart1"];
                double x1 = [[sprite1start valueForKey:@"x"]floatValue];
                double y1 = [[sprite1start valueForKey:@"y"]floatValue];
                self.sprite1.position = ccp(x1,y1);
            }
            
        }
        else
        {
            NSMutableDictionary *sprite1start = [objects objectNamed:@"sprite1Block"];
            double x1 = [[sprite1start valueForKey:@"x"]floatValue];
            double y1 = [[sprite1start valueForKey:@"y"]floatValue];
            self.sprite1.position = ccp(x1,y1);
        }
        [self.theHKMap addChild:sprite1 z:self.bgLayer.zOrder];
        
        CGPoint tileCoord1 = [self tileCoordForPosition:sprite1.position];
        int tileGID1 = [self.bgLayer tileGIDAt:tileCoord1];
        [self.bgLayer removeTileAt:tileCoord1];
        [self.bgLayer setTileGID:(tileGID1 + 1) at:tileCoord1];
        
        ////////////////////////////////////////////////////////////////////////
        
        self.sprite2 = [InteractiveSprite spriteWithSpriteFrameName:@"herospriteB01.png"];
        self.sprite2.spriteCode = 2;
        self.sprite2.orientation = 1;
        if (self.hero.sprite2_Orientation)
        {
            self.sprite2.orientation = self.hero.sprite2_Orientation;
        }
        if (self.sprite2.orientation == 1)
        {
            [self.sprite2 setDisplayFrame:[[spriteBWalkDown frames] objectAtIndex:0]];
        }
        else if (self.sprite2.orientation == 2)
        {
            [self.sprite2 setDisplayFrame:[[spriteBWalkUp frames] objectAtIndex:0]];
        }
        else if (self.sprite2.orientation == 3)
        {
            [self.sprite2 setDisplayFrame:[[spriteBWalkRight frames] objectAtIndex:0]];
        }
        else
        {
            [self.sprite2 setDisplayFrame:[[spriteBWalkLeft frames] objectAtIndex:0]];
        }
        //[self schedule:@selector(updateSprite2) interval:(1.8f)];
        
        if (self.hero.acceptedTaskKingVPostOrb)
        {
            if (self.hero.sprite2position.x != 0)
            {
                self.sprite2.position = self.hero.sprite2position;
            }
            else
            {
                NSMutableDictionary *sprite2start = [objects objectNamed:@"spriteStart2"];
                double x1 = [[sprite2start valueForKey:@"x"]floatValue];
                double y1 = [[sprite2start valueForKey:@"y"]floatValue];
                self.sprite2.position = ccp(x1,y1);
            }
            
        }
        else
        {
            NSMutableDictionary *sprite2start = [objects objectNamed:@"sprite2Block"];
            double x1 = [[sprite2start valueForKey:@"x"]floatValue];
            double y1 = [[sprite2start valueForKey:@"y"]floatValue];
            self.sprite2.position = ccp(x1,y1);
        }
        [self.theHKMap addChild:sprite2 z:self.bgLayer.zOrder];
        
        CGPoint tileCoord2 = [self tileCoordForPosition:sprite2.position];
        int tileGID2 = [self.bgLayer tileGIDAt:tileCoord2];
        [self.bgLayer removeTileAt:tileCoord2];
        [self.bgLayer setTileGID:(tileGID2 + 2) at:tileCoord2];
        
        ////////////////////////////////////////////////////////////////////////
        
        
        self.sprite3 = [InteractiveSprite spriteWithSpriteFrameName:@"herospriteB05.png"];
        self.sprite3.spriteCode = 3;
        self.sprite3.orientation = 4;
        if (self.hero.sprite3_Orientation)
        {
            self.sprite3.orientation = self.hero.sprite3_Orientation;
        }
        if (self.sprite3.orientation == 1)
        {
            [self.sprite3 setDisplayFrame:[[spriteBWalkDown frames] objectAtIndex:0]];
        }
        else if (self.sprite3.orientation == 2)
        {
            [self.sprite3 setDisplayFrame:[[spriteBWalkUp frames] objectAtIndex:0]];
        }
        else if (self.sprite3.orientation == 3)
        {
            [self.sprite3 setDisplayFrame:[[spriteBWalkRight frames] objectAtIndex:0]];
        }
        else
        {
            [self.sprite3 setDisplayFrame:[[spriteBWalkLeft frames] objectAtIndex:0]];
        }
        //[self schedule:@selector(updateSprite3) interval:(2.0f)];
        
        if (self.hero.talkedToKingVInitial)
        {
            if (self.hero.sprite3position.x != 0)
            {
                self.sprite3.position = self.hero.sprite3position;
            }
            else
            {
                NSMutableDictionary *sprite3start = [objects objectNamed:@"spriteStart3"];
                double x1 = [[sprite3start valueForKey:@"x"]floatValue];
                double y1 = [[sprite3start valueForKey:@"y"]floatValue];
                self.sprite3.position = ccp(x1,y1);
            }
            
        }
        else
        {
            NSMutableDictionary *sprite3start = [objects objectNamed:@"sprite3Block"];
            double x1 = [[sprite3start valueForKey:@"x"]floatValue];
            double y1 = [[sprite3start valueForKey:@"y"]floatValue];
            self.sprite3.position = ccp(x1,y1);
        }
        [self.theHKMap addChild:sprite3 z:self.bgLayer.zOrder];
        CGPoint tileCoord3 = [self tileCoordForPosition:sprite3.position];
        int tileGID3 = [self.bgLayer tileGIDAt:tileCoord3];
        [self.bgLayer removeTileAt:tileCoord3];
        [self.bgLayer setTileGID:(tileGID3 + 3) at:tileCoord3];
        
        ////////////////////////////////////////////////////////////////////////
        
        self.sprite4 = [InteractiveSprite spriteWithSpriteFrameName:@"herospriteK01.png"];
        self.sprite4.spriteCode = 4;
        self.sprite4.orientation = 1;
        if (self.hero.sprite4_Orientation)
        {
            self.sprite4.orientation = self.hero.sprite4_Orientation;
        }
        if (self.sprite4.orientation == 1)
        {
            [self.sprite4 setDisplayFrame:[[spriteKWalkDown frames] objectAtIndex:0]];
        }
        else if (self.sprite4.orientation == 2)
        {
            [self.sprite4 setDisplayFrame:[[spriteKWalkUp frames] objectAtIndex:0]];
        }
        else if (self.sprite4.orientation == 3)
        {
            [self.sprite4 setDisplayFrame:[[spriteKWalkRight frames] objectAtIndex:0]];
        }
        else
        {
            [self.sprite4 setDisplayFrame:[[spriteKWalkLeft frames] objectAtIndex:0]];
        }
        //[self schedule:@selector(updateSprite4) interval:(1.5f)];
        
        
        if (self.hero.sprite4position.x != 0)
        {
            self.sprite4.position = self.hero.sprite4position;
        }
        else
        {
            NSMutableDictionary *sprite4start = [objects objectNamed:@"spriteStart4"];
            double x1 = [[sprite4start valueForKey:@"x"]floatValue];
            double y1 = [[sprite4start valueForKey:@"y"]floatValue];
            self.sprite4.position = ccp(x1,y1);
        }
        
        [self.theHKMap addChild:sprite4 z:self.bgLayer.zOrder];
        
        CGPoint tileCoord4 = [self tileCoordForPosition:sprite4.position];
        int tileGID4 = [self.bgLayer tileGIDAt:tileCoord4];
        [self.bgLayer removeTileAt:tileCoord4];
        [self.bgLayer setTileGID:(tileGID4 + 4) at:tileCoord4];
        
        
        ////////////////////////////////////////////////////////////////////////
        
        self.sprite5 = [InteractiveSprite spriteWithSpriteFrameName:@"herospriteK01.png"];
        self.sprite5.spriteCode = 5;
        self.sprite5.orientation = 1;
        if (self.hero.sprite5_Orientation)
        {
            self.sprite5.orientation = self.hero.sprite5_Orientation;
        }
        if (self.sprite5.orientation == 1)
        {
            [self.sprite5 setDisplayFrame:[[spriteKWalkDown frames] objectAtIndex:0]];
        }
        else if (self.sprite5.orientation == 2)
        {
            [self.sprite5 setDisplayFrame:[[spriteKWalkUp frames] objectAtIndex:0]];
        }
        else if (self.sprite5.orientation == 3)
        {
            [self.sprite5 setDisplayFrame:[[spriteKWalkRight frames] objectAtIndex:0]];
        }
        else
        {
            [self.sprite5 setDisplayFrame:[[spriteKWalkLeft frames] objectAtIndex:0]];
        }
        //[self schedule:@selector(updateSprite5) interval:(1.1f)];
        
        
        if (self.hero.sprite5position.x != 0)
        {
            self.sprite5.position = self.hero.sprite5position;
        }
        else
        {
            NSMutableDictionary *sprite5start = [objects objectNamed:@"spriteStart5"];
            double x1 = [[sprite5start valueForKey:@"x"]floatValue];
            double y1 = [[sprite5start valueForKey:@"y"]floatValue];
            self.sprite5.position = ccp(x1,y1);
        }
        
        [self.theHKMap addChild:sprite5 z:self.bgLayer.zOrder];
        
        CGPoint tileCoord5 = [self tileCoordForPosition:sprite5.position];
        int tileGID5 = [self.bgLayer tileGIDAt:tileCoord5];
        [self.bgLayer removeTileAt:tileCoord5];
        [self.bgLayer setTileGID:(tileGID5 + 5) at:tileCoord5];
        
        ////////////////////////////////////////////////////////////////////////
        
        self.sprite6 = [InteractiveSprite spriteWithSpriteFrameName:@"herospriteD01.png"];
        self.sprite6.spriteCode = 6;
        self.sprite6.orientation = 1;
        if (self.hero.sprite6_Orientation)
        {
            self.sprite6.orientation = self.hero.sprite6_Orientation;
        }
        if (self.sprite6.orientation == 1)
        {
            [self.sprite6 setDisplayFrame:[[spriteDWalkDown frames] objectAtIndex:0]];
        }
        else if (self.sprite6.orientation == 2)
        {
            [self.sprite6 setDisplayFrame:[[spriteDWalkUp frames] objectAtIndex:0]];
        }
        else if (self.sprite6.orientation == 3)
        {
            [self.sprite6 setDisplayFrame:[[spriteDWalkRight frames] objectAtIndex:0]];
        }
        else
        {
            [self.sprite6 setDisplayFrame:[[spriteDWalkLeft frames] objectAtIndex:0]];
        }
        
        //[self schedule:@selector(updateSprite6) interval:(2.0f)];
        
        
        if (self.hero.sprite6position.x != 0)
        {
            self.sprite6.position = self.hero.sprite6position;
        }
        else
        {
            NSMutableDictionary *sprite6start = [objects objectNamed:@"spriteStart6"];
            double x1 = [[sprite6start valueForKey:@"x"]floatValue];
            double y1 = [[sprite6start valueForKey:@"y"]floatValue];
            self.sprite6.position = ccp(x1,y1);
        }
        
        [self.theHKMap addChild:sprite6 z:self.bgLayer.zOrder];
        
        CGPoint tileCoord6 = [self tileCoordForPosition:sprite6.position];
        int tileGID6 = [self.bgLayer tileGIDAt:tileCoord6];
        [self.bgLayer removeTileAt:tileCoord6];
        [self.bgLayer setTileGID:(tileGID6 + 6) at:tileCoord6];
        
        ////////////////////////////////////////////////////////////////////////
        
        self.sprite7 = [InteractiveSprite spriteWithSpriteFrameName:@"herospriteX01.png"];
        self.sprite7.spriteCode = 7;
        self.sprite7.orientation = 1;
        if (self.hero.sprite7_Orientation)
        {
            self.sprite7.orientation = self.hero.sprite7_Orientation;
        }
        if (self.sprite7.orientation == 1)
        {
            [self.sprite7 setDisplayFrame:[[spriteXWalkDown frames] objectAtIndex:0]];
        }
        else if (self.sprite7.orientation == 2)
        {
            [self.sprite7 setDisplayFrame:[[spriteXWalkUp frames] objectAtIndex:0]];
        }
        else if (self.sprite7.orientation == 3)
        {
            [self.sprite7 setDisplayFrame:[[spriteXWalkRight frames] objectAtIndex:0]];
        }
        else
        {
            [self.sprite7 setDisplayFrame:[[spriteXWalkLeft frames] objectAtIndex:0]];
        }
        //[self schedule:@selector(updateSprite7) interval:(1.0f)];
        
        
        if (self.hero.sprite7position.x != 0)
        {
            self.sprite7.position = self.hero.sprite7position;
        }
        else
        {
            NSMutableDictionary *sprite7start = [objects objectNamed:@"spriteStart7"];
            double x1 = [[sprite7start valueForKey:@"x"]floatValue];
            double y1 = [[sprite7start valueForKey:@"y"]floatValue];
            self.sprite7.position = ccp(x1,y1);
        }
        
        [self.theHKMap addChild:sprite7 z:self.bgLayer.zOrder];
        
        CGPoint tileCoord7 = [self tileCoordForPosition:sprite7.position];
        int tileGID7 = [self.bgLayer tileGIDAt:tileCoord7];
        [self.bgLayer removeTileAt:tileCoord7];
        [self.bgLayer setTileGID:(tileGID7 + 7) at:tileCoord7];
        
        ////////////////////////////////////////////////////////////////////////
        
        self.sprite8 = [InteractiveSprite spriteWithSpriteFrameName:@"herospriteN01.png"];
        self.sprite8.spriteCode = 8;
        self.sprite8.orientation = 1;
        if (self.hero.sprite8_Orientation)
        {
            self.sprite8.orientation = self.hero.sprite8_Orientation;
        }
        if (self.sprite8.orientation == 1)
        {
            [self.sprite8 setDisplayFrame:[[spriteNWalkDown frames] objectAtIndex:0]];
        }
        else if (self.sprite8.orientation == 2)
        {
            [self.sprite8 setDisplayFrame:[[spriteNWalkUp frames] objectAtIndex:0]];
        }
        else if (self.sprite8.orientation == 3)
        {
            [self.sprite8 setDisplayFrame:[[spriteNWalkRight frames] objectAtIndex:0]];
        }
        else
        {
            [self.sprite8 setDisplayFrame:[[spriteNWalkLeft frames] objectAtIndex:0]];
        }
        //[self schedule:@selector(updateSprite8) interval:(0.9f)];
        
        
        if (self.hero.sprite8position.x != 0)
        {
            self.sprite8.position = self.hero.sprite8position;
        }
        else
        {
            NSMutableDictionary *sprite8start = [objects objectNamed:@"spriteStart8"];
            double x1 = [[sprite8start valueForKey:@"x"]floatValue];
            double y1 = [[sprite8start valueForKey:@"y"]floatValue];
            self.sprite8.position = ccp(x1,y1);
        }
        
        [self.theHKMap addChild:sprite8 z:self.bgLayer.zOrder];
        
        CGPoint tileCoord8 = [self tileCoordForPosition:sprite8.position];
        int tileGID8 = [self.bgLayer tileGIDAt:tileCoord8];
        [self.bgLayer removeTileAt:tileCoord8];
        [self.bgLayer setTileGID:(tileGID8 + 8) at:tileCoord8];
        
        ////////////////////////////////////////////////////////////////////////
        
        self.sprite9 = [InteractiveSprite spriteWithSpriteFrameName:@"herospriteZ01.png"];
        self.sprite9.spriteCode = 9;
        self.sprite9.orientation = 1;
        if (self.hero.sprite9_Orientation)
        {
            self.sprite9.orientation = self.hero.sprite9_Orientation;
        }
        if (self.sprite9.orientation == 1)
        {
            [self.sprite9 setDisplayFrame:[[spriteZWalkDown frames] objectAtIndex:0]];
        }
        else if (self.sprite9.orientation == 2)
        {
            [self.sprite9 setDisplayFrame:[[spriteZWalkUp frames] objectAtIndex:0]];
        }
        else if (self.sprite9.orientation == 3)
        {
            [self.sprite9 setDisplayFrame:[[spriteZWalkRight frames] objectAtIndex:0]];
        }
        else
        {
            [self.sprite9 setDisplayFrame:[[spriteZWalkLeft frames] objectAtIndex:0]];
        }
        //[self schedule:@selector(updateSprite9) interval:(0.9f)];
        
        
        if (self.hero.sprite9position.x != 0)
        {
            self.sprite9.position = self.hero.sprite9position;
        }
        else
        {
            NSMutableDictionary *sprite9start = [objects objectNamed:@"spriteStart9"];
            double x1 = [[sprite9start valueForKey:@"x"]floatValue];
            double y1 = [[sprite9start valueForKey:@"y"]floatValue];
            self.sprite9.position = ccp(x1,y1);
        }
        
        [self.theHKMap addChild:sprite9 z:self.bgLayer.zOrder];
        
        CGPoint tileCoord9 = [self tileCoordForPosition:sprite9.position];
        int tileGID9 = [self.bgLayer tileGIDAt:tileCoord9];
        [self.bgLayer removeTileAt:tileCoord9];
        [self.bgLayer setTileGID:(tileGID9 + 9) at:tileCoord9];
        
        ////////////////////////////////////////////////////////////////////////
        
        self.sprite10 = [InteractiveSprite spriteWithSpriteFrameName:@"herospriteQ01.png"];
        self.sprite10.spriteCode = 10;
        self.sprite10.orientation = 1;
        if (self.hero.sprite10_Orientation)
        {
            self.sprite10.orientation = self.hero.sprite10_Orientation;
        }
        if (self.sprite10.orientation == 1)
        {
            [self.sprite10 setDisplayFrame:[[spriteQWalkDown frames] objectAtIndex:0]];
        }
        else if (self.sprite10.orientation == 2)
        {
            [self.sprite10 setDisplayFrame:[[spriteQWalkUp frames] objectAtIndex:0]];
        }
        else if (self.sprite10.orientation == 3)
        {
            [self.sprite10 setDisplayFrame:[[spriteQWalkRight frames] objectAtIndex:0]];
        }
        else
        {
            [self.sprite10 setDisplayFrame:[[spriteQWalkLeft frames] objectAtIndex:0]];
        }
        //[self schedule:@selector(updateSprite10) interval:(1.0f)];
        
        
        if (self.hero.sprite10position.x != 0)
        {
            self.sprite10.position = self.hero.sprite10position;
        }
        else
        {
            NSMutableDictionary *sprite10start = [objects objectNamed:@"spriteStart10"];
            double x1 = [[sprite10start valueForKey:@"x"]floatValue];
            double y1 = [[sprite10start valueForKey:@"y"]floatValue];
            self.sprite10.position = ccp(x1,y1);
        }
        
        [self.theHKMap addChild:sprite10 z:self.bgLayer.zOrder];
        
        CGPoint tileCoord10 = [self tileCoordForPosition:sprite10.position];
        int tileGID10 = [self.bgLayer tileGIDAt:tileCoord10];
        [self.bgLayer removeTileAt:tileCoord10];
        [self.bgLayer setTileGID:(tileGID10 + 10) at:tileCoord10];
        
        ////////////////////////////////////////////////////////////////////////
        
        self.sprite11 = [InteractiveSprite spriteWithSpriteFrameName:@"herospriteP01.png"];
        self.sprite11.spriteCode = 11;
        self.sprite11.orientation = 1;
        if (self.hero.sprite11_Orientation)
        {
            self.sprite11.orientation = self.hero.sprite11_Orientation;
        }
        if (self.sprite11.orientation == 1)
        {
            [self.sprite11 setDisplayFrame:[[spritePWalkDown frames] objectAtIndex:0]];
        }
        else if (self.sprite11.orientation == 2)
        {
            [self.sprite11 setDisplayFrame:[[spritePWalkUp frames] objectAtIndex:0]];
        }
        else if (self.sprite11.orientation == 3)
        {
            [self.sprite11 setDisplayFrame:[[spritePWalkRight frames] objectAtIndex:0]];
        }
        else
        {
            [self.sprite11 setDisplayFrame:[[spritePWalkLeft frames] objectAtIndex:0]];
        }
        //[self schedule:@selector(updateSprite11) interval:(0.6f)];
        
        
        if (self.hero.sprite11position.x != 0)
        {
            self.sprite11.position = self.hero.sprite11position;
        }
        else
        {
            NSMutableDictionary *sprite11start = [objects objectNamed:@"spriteStart11"];
            double x1 = [[sprite11start valueForKey:@"x"]floatValue];
            double y1 = [[sprite11start valueForKey:@"y"]floatValue];
            self.sprite11.position = ccp(x1,y1);
        }
        
        [self.theHKMap addChild:sprite11 z:self.bgLayer.zOrder];
        
        CGPoint tileCoord11 = [self tileCoordForPosition:sprite11.position];
        int tileGID11 = [self.bgLayer tileGIDAt:tileCoord11];
        [self.bgLayer removeTileAt:tileCoord11];
        [self.bgLayer setTileGID:(tileGID11 + 11) at:tileCoord11];
        
        ////////////////////////////////////////////////////////////////////////
        
        self.sprite12 = [InteractiveSprite spriteWithSpriteFrameName:@"herospriteU01.png"];
        self.sprite12.spriteCode = 12;
        self.sprite12.orientation = 1;
        if (self.hero.sprite12_Orientation)
        {
            self.sprite12.orientation = self.hero.sprite12_Orientation;
        }
        if (self.sprite12.orientation == 1)
        {
            [self.sprite12 setDisplayFrame:[[spriteUWalkDown frames] objectAtIndex:0]];
        }
        else if (self.sprite12.orientation == 2)
        {
            [self.sprite12 setDisplayFrame:[[spriteUWalkUp frames] objectAtIndex:0]];
        }
        else if (self.sprite12.orientation == 3)
        {
            [self.sprite12 setDisplayFrame:[[spriteUWalkRight frames] objectAtIndex:0]];
        }
        else
        {
            [self.sprite12 setDisplayFrame:[[spriteUWalkLeft frames] objectAtIndex:0]];
        }
        //[self schedule:@selector(updateSprite12) interval:(1.2f)];
        
        
        if (self.hero.sprite12position.x != 0)
        {
            self.sprite12.position = self.hero.sprite12position;
        }
        else
        {
            NSMutableDictionary *sprite12start = [objects objectNamed:@"spriteStart12"];
            double x1 = [[sprite12start valueForKey:@"x"]floatValue];
            double y1 = [[sprite12start valueForKey:@"y"]floatValue];
            self.sprite12.position = ccp(x1,y1);
        }
        
        [self.theHKMap addChild:sprite12 z:self.bgLayer.zOrder];
        
        CGPoint tileCoord12 = [self tileCoordForPosition:sprite12.position];
        int tileGID12 = [self.bgLayer tileGIDAt:tileCoord12];
        [self.bgLayer removeTileAt:tileCoord12];
        [self.bgLayer setTileGID:(tileGID12 + 12) at:tileCoord12];
        
        ////////////////////////////////////////////////////////////////////////
        
        self.sprite13 = [InteractiveSprite spriteWithSpriteFrameName:@"herospriteM01.png"];
        self.sprite13.spriteCode = 13;
        self.sprite13.orientation = 1;
        if (self.hero.sprite13_Orientation)
        {
            self.sprite13.orientation = self.hero.sprite13_Orientation;
        }
        if (self.sprite13.orientation == 1)
        {
            [self.sprite13 setDisplayFrame:[[spriteMWalkDown frames] objectAtIndex:0]];
        }
        else if (self.sprite13.orientation == 2)
        {
            [self.sprite13 setDisplayFrame:[[spriteMWalkUp frames] objectAtIndex:0]];
        }
        else if (self.sprite13.orientation == 3)
        {
            [self.sprite13 setDisplayFrame:[[spriteMWalkRight frames] objectAtIndex:0]];
        }
        else
        {
            [self.sprite13 setDisplayFrame:[[spriteMWalkLeft frames] objectAtIndex:0]];
        }
        //[self schedule:@selector(updateSprite13) interval:(1.0f)];
        
        
        if (self.hero.sprite13position.x != 0)
        {
            self.sprite13.position = self.hero.sprite13position;
        }
        else
        {
            NSMutableDictionary *sprite13start = [objects objectNamed:@"spriteStart13"];
            double x1 = [[sprite13start valueForKey:@"x"]floatValue];
            double y1 = [[sprite13start valueForKey:@"y"]floatValue];
            self.sprite13.position = ccp(x1,y1);
        }
        
        [self.theHKMap addChild:sprite13 z:self.bgLayer.zOrder];
        
        CGPoint tileCoord13 = [self tileCoordForPosition:sprite13.position];
        int tileGID13 = [self.bgLayer tileGIDAt:tileCoord13];
        [self.bgLayer removeTileAt:tileCoord13];
        [self.bgLayer setTileGID:(tileGID13 + 13) at:tileCoord13];
        
        ////////////////////////////////////////////////////////////////////////
        
        if (self.hero.finishedTaskTraveler)
        {
            //sprite 14 gone
        }
        else
        {
            self.sprite14 = [InteractiveSprite spriteWithSpriteFrameName:@"herospriteI01.png"];
            self.sprite14.spriteCode = 14;
            self.sprite14.orientation = 1;
            if (self.hero.sprite14_Orientation)
            {
                self.sprite14.orientation = self.hero.sprite14_Orientation;
            }
            if (self.sprite14.orientation == 1)
            {
                [self.sprite14 setDisplayFrame:[[spriteIWalkDown frames] objectAtIndex:0]];
            }
            else if (self.sprite14.orientation == 2)
            {
                [self.sprite14 setDisplayFrame:[[spriteIWalkUp frames] objectAtIndex:0]];
            }
            else if (self.sprite14.orientation == 3)
            {
                [self.sprite14 setDisplayFrame:[[spriteIWalkRight frames] objectAtIndex:0]];
            }
            else
            {
                [self.sprite14 setDisplayFrame:[[spriteIWalkLeft frames] objectAtIndex:0]];
            }
            //[self schedule:@selector(updateSprite14) interval:(1.0f)];
            
            
            if (self.hero.sprite14position.x != 0)
            {
                self.sprite14.position = self.hero.sprite14position;
            }
            else
            {
                NSMutableDictionary *sprite14start = [objects objectNamed:@"spriteStart14"];
                double x1 = [[sprite14start valueForKey:@"x"]floatValue];
                double y1 = [[sprite14start valueForKey:@"y"]floatValue];
                self.sprite14.position = ccp(x1,y1);
            }
            
            [self.theHKMap addChild:sprite14 z:self.bgLayer.zOrder];
            
            CGPoint tileCoord14 = [self tileCoordForPosition:sprite14.position];
            int tileGID14 = [self.bgLayer tileGIDAt:tileCoord14];
            [self.bgLayer removeTileAt:tileCoord14];
            [self.bgLayer setTileGID:(tileGID14 + 14) at:tileCoord14];
        }
        ////////////////////////////////////////////////////////////////////////
        
        self.sprite15 = [InteractiveSprite spriteWithSpriteFrameName:@"herospriteW01.png"];
        self.sprite15.spriteCode = 15;
        self.sprite15.orientation = 1;
        if (self.hero.sprite15_Orientation)
        {
            self.sprite15.orientation = self.hero.sprite15_Orientation;
        }
        if (self.sprite15.orientation == 1)
        {
            [self.sprite15 setDisplayFrame:[[spriteWWalkDown frames] objectAtIndex:0]];
        }
        else if (self.sprite15.orientation == 2)
        {
            [self.sprite15 setDisplayFrame:[[spriteWWalkUp frames] objectAtIndex:0]];
        }
        else if (self.sprite15.orientation == 3)
        {
            [self.sprite15 setDisplayFrame:[[spriteWWalkRight frames] objectAtIndex:0]];
        }
        else
        {
            [self.sprite15 setDisplayFrame:[[spriteWWalkLeft frames] objectAtIndex:0]];
        }
        //[self schedule:@selector(updateSprite15) interval:(1.0f)];
        
        
        if (self.hero.sprite15position.x != 0)
        {
            self.sprite15.position = self.hero.sprite15position;
        }
        else
        {
            NSMutableDictionary *sprite15start = [objects objectNamed:@"spriteStart15"];
            double x1 = [[sprite15start valueForKey:@"x"]floatValue];
            double y1 = [[sprite15start valueForKey:@"y"]floatValue];
            self.sprite15.position = ccp(x1,y1);
        }
        
        [self.theHKMap addChild:sprite15 z:self.bgLayer.zOrder];
        
        CGPoint tileCoord15 = [self tileCoordForPosition:sprite15.position];
        int tileGID15 = [self.bgLayer tileGIDAt:tileCoord15];
        [self.bgLayer removeTileAt:tileCoord15];
        [self.bgLayer setTileGID:(tileGID15 + 15) at:tileCoord15];
        
        ////////////////////////////////////////////////////////////////////////
        
        self.sprite16 = [InteractiveSprite spriteWithSpriteFrameName:@"herospriteY01.png"];
        self.sprite16.spriteCode = 16;
        self.sprite16.orientation = 1;
        if (self.hero.sprite16_Orientation)
        {
            self.sprite16.orientation = self.hero.sprite16_Orientation;
        }
        if (self.sprite16.orientation == 1)
        {
            [self.sprite16 setDisplayFrame:[[spriteYWalkDown frames] objectAtIndex:0]];
        }
        else if (self.sprite16.orientation == 2)
        {
            [self.sprite16 setDisplayFrame:[[spriteYWalkUp frames] objectAtIndex:0]];
        }
        else if (self.sprite16.orientation == 3)
        {
            [self.sprite16 setDisplayFrame:[[spriteYWalkRight frames] objectAtIndex:0]];
        }
        else
        {
            [self.sprite16 setDisplayFrame:[[spriteYWalkLeft frames] objectAtIndex:0]];
        }
        //[self schedule:@selector(updateSprite16) interval:(1.0f)];
        
        
        if (self.hero.sprite16position.x != 0)
        {
            self.sprite16.position = self.hero.sprite16position;
        }
        else
        {
            NSMutableDictionary *sprite16start = [objects objectNamed:@"spriteStart16"];
            double x1 = [[sprite16start valueForKey:@"x"]floatValue];
            double y1 = [[sprite16start valueForKey:@"y"]floatValue];
            self.sprite16.position = ccp(x1,y1);
        }
        
        [self.theHKMap addChild:sprite16 z:self.bgLayer.zOrder];
        
        CGPoint tileCoord16 = [self tileCoordForPosition:sprite16.position];
        int tileGID16 = [self.bgLayer tileGIDAt:tileCoord16];
        [self.bgLayer removeTileAt:tileCoord16];
        [self.bgLayer setTileGID:(tileGID16 + 16) at:tileCoord16];
        
        ////////////////////////////////////////////////////////////////////////
        
        self.sprite17 = [InteractiveSprite spriteWithSpriteFrameName:@"herospriteZA01.png"];
        self.sprite17.spriteCode = 17;
        self.sprite17.orientation = 1;
        if (self.hero.sprite17_Orientation)
        {
            self.sprite17.orientation = self.hero.sprite17_Orientation;
        }
        if (self.sprite17.orientation == 1)
        {
            [self.sprite17 setDisplayFrame:[[spriteZAWalkDown frames] objectAtIndex:0]];
        }
        else if (self.sprite17.orientation == 2)
        {
            [self.sprite17 setDisplayFrame:[[spriteZAWalkUp frames] objectAtIndex:0]];
        }
        else if (self.sprite17.orientation == 3)
        {
            [self.sprite17 setDisplayFrame:[[spriteZAWalkRight frames] objectAtIndex:0]];
        }
        else
        {
            [self.sprite17 setDisplayFrame:[[spriteZAWalkLeft frames] objectAtIndex:0]];
        }
        //[self schedule:@selector(updateSprite17) interval:(1.3f)];
        
        
        if (self.hero.sprite17position.x != 0)
        {
            self.sprite17.position = self.hero.sprite17position;
        }
        else
        {
            NSMutableDictionary *sprite17start = [objects objectNamed:@"spriteStart17"];
            double x1 = [[sprite17start valueForKey:@"x"]floatValue];
            double y1 = [[sprite17start valueForKey:@"y"]floatValue];
            self.sprite17.position = ccp(x1,y1);
        }
        
        [self.theHKMap addChild:sprite17 z:self.bgLayer.zOrder];
        
        CGPoint tileCoord17 = [self tileCoordForPosition:sprite17.position];
        int tileGID17 = [self.bgLayer tileGIDAt:tileCoord17];
        [self.bgLayer removeTileAt:tileCoord17];
        [self.bgLayer setTileGID:(tileGID17 + 17) at:tileCoord17];
        
        ////////////////////////////////////////////////////////////////////////
        
        self.sprite18 = [InteractiveSprite spriteWithSpriteFrameName:@"herospriteT01.png"];
        self.sprite18.spriteCode = 18;
        self.sprite18.orientation = 1;
        if (self.hero.sprite18_Orientation)
        {
            self.sprite18.orientation = self.hero.sprite18_Orientation;
        }
        if (self.sprite18.orientation == 1)
        {
            [self.sprite18 setDisplayFrame:[[spriteTWalkDown frames] objectAtIndex:0]];
        }
        else if (self.sprite18.orientation == 2)
        {
            [self.sprite18 setDisplayFrame:[[spriteTWalkUp frames] objectAtIndex:0]];
        }
        else if (self.sprite18.orientation == 3)
        {
            [self.sprite18 setDisplayFrame:[[spriteTWalkRight frames] objectAtIndex:0]];
        }
        else
        {
            [self.sprite18 setDisplayFrame:[[spriteTWalkLeft frames] objectAtIndex:0]];
        }
        //[self schedule:@selector(updateSprite18) interval:(1.2f)];
        
        
        if (self.hero.sprite18position.x != 0)
        {
            self.sprite18.position = self.hero.sprite18position;
        }
        else
        {
            NSMutableDictionary *sprite18start = [objects objectNamed:@"spriteStart18"];
            double x1 = [[sprite18start valueForKey:@"x"]floatValue];
            double y1 = [[sprite18start valueForKey:@"y"]floatValue];
            self.sprite18.position = ccp(x1,y1);
        }
        
        [self.theHKMap addChild:sprite18 z:self.bgLayer.zOrder];
        
        CGPoint tileCoord18 = [self tileCoordForPosition:sprite18.position];
        int tileGID18 = [self.bgLayer tileGIDAt:tileCoord18];
        [self.bgLayer removeTileAt:tileCoord18];
        [self.bgLayer setTileGID:(tileGID18 + 18) at:tileCoord18];
        
        ////////////////////////////////////////////////////////////////////////
        
        self.sprite19 = [InteractiveSprite spriteWithSpriteFrameName:@"herospriteB01.png"];
        self.sprite19.spriteCode = 19;
        self.sprite19.orientation = 1;
        if (self.hero.sprite19_Orientation)
        {
            self.sprite19.orientation = self.hero.sprite19_Orientation;
        }
        if (self.sprite19.orientation == 1)
        {
            [self.sprite19 setDisplayFrame:[[spriteBWalkDown frames] objectAtIndex:0]];
        }
        else if (self.sprite19.orientation == 2)
        {
            [self.sprite19 setDisplayFrame:[[spriteBWalkUp frames] objectAtIndex:0]];
        }
        else if (self.sprite19.orientation == 3)
        {
            [self.sprite19 setDisplayFrame:[[spriteBWalkRight frames] objectAtIndex:0]];
        }
        else
        {
            [self.sprite19 setDisplayFrame:[[spriteBWalkLeft frames] objectAtIndex:0]];
        }
        //[self schedule:@selector(updateSprite19) interval:(1.4f)];
        
        
        if (self.hero.sprite19position.x != 0)
        {
            self.sprite19.position = self.hero.sprite19position;
        }
        else
        {
            NSMutableDictionary *sprite19start = [objects objectNamed:@"spriteStart19"];
            double x1 = [[sprite19start valueForKey:@"x"]floatValue];
            double y1 = [[sprite19start valueForKey:@"y"]floatValue];
            self.sprite19.position = ccp(x1,y1);
        }
        
        [self.theHKMap addChild:sprite19 z:self.bgLayer.zOrder];
        
        CGPoint tileCoord19 = [self tileCoordForPosition:sprite19.position];
        int tileGID19 = [self.bgLayer tileGIDAt:tileCoord19];
        [self.bgLayer removeTileAt:tileCoord19];
        [self.bgLayer setTileGID:(tileGID19 + 19) at:tileCoord19];
        
        ////////////////////////////////////////////////////////////////////////
        
        self.sprite20 = [InteractiveSprite spriteWithSpriteFrameName:@"herospriteK01.png"];
        self.sprite20.spriteCode = 20;
        self.sprite20.orientation = 1;
        if (self.hero.sprite20_Orientation)
        {
            self.sprite20.orientation = self.hero.sprite20_Orientation;
        }
        if (self.sprite20.orientation == 1)
        {
            [self.sprite20 setDisplayFrame:[[spriteKWalkDown frames] objectAtIndex:0]];
        }
        else if (self.sprite20.orientation == 2)
        {
            [self.sprite20 setDisplayFrame:[[spriteKWalkUp frames] objectAtIndex:0]];
        }
        else if (self.sprite20.orientation == 3)
        {
            [self.sprite20 setDisplayFrame:[[spriteKWalkRight frames] objectAtIndex:0]];
        }
        else
        {
            [self.sprite20 setDisplayFrame:[[spriteKWalkLeft frames] objectAtIndex:0]];
        }
        //[self schedule:@selector(updateSprite20) interval:(1.1f)];
        
        
        if (self.hero.sprite20position.x != 0)
        {
            self.sprite20.position = self.hero.sprite20position;
        }
        else
        {
            NSMutableDictionary *sprite20start = [objects objectNamed:@"spriteStart20"];
            double x1 = [[sprite20start valueForKey:@"x"]floatValue];
            double y1 = [[sprite20start valueForKey:@"y"]floatValue];
            self.sprite20.position = ccp(x1,y1);
        }
        
        [self.theHKMap addChild:sprite20 z:self.bgLayer.zOrder];
        
        CGPoint tileCoord20 = [self tileCoordForPosition:sprite20.position];
        int tileGID20 = [self.bgLayer tileGIDAt:tileCoord20];
        [self.bgLayer removeTileAt:tileCoord20];
        [self.bgLayer setTileGID:(tileGID20 + 20) at:tileCoord20];
        
        ////////////////////////////////////////////////////////////////////////
        
        self.sprite21 = [InteractiveSprite spriteWithSpriteFrameName:@"herospriteB01.png"];
        self.sprite21.spriteCode = 21;
        self.sprite21.orientation = 1;
        if (self.hero.sprite21_Orientation)
        {
            self.sprite21.orientation = self.hero.sprite21_Orientation;
        }
        if (self.sprite21.orientation == 1)
        {
            [self.sprite21 setDisplayFrame:[[spriteBWalkDown frames] objectAtIndex:0]];
        }
        else if (self.sprite21.orientation == 2)
        {
            [self.sprite21 setDisplayFrame:[[spriteBWalkUp frames] objectAtIndex:0]];
        }
        else if (self.sprite21.orientation == 3)
        {
            [self.sprite21 setDisplayFrame:[[spriteBWalkRight frames] objectAtIndex:0]];
        }
        else
        {
            [self.sprite21 setDisplayFrame:[[spriteBWalkLeft frames] objectAtIndex:0]];
        }
        //[self schedule:@selector(updateSprite21) interval:(1.1f)];
        
        
        if (self.hero.sprite21position.x != 0)
        {
            self.sprite21.position = self.hero.sprite21position;
        }
        else
        {
            NSMutableDictionary *sprite21start = [objects objectNamed:@"spriteStart21"];
            double x1 = [[sprite21start valueForKey:@"x"]floatValue];
            double y1 = [[sprite21start valueForKey:@"y"]floatValue];
            self.sprite21.position = ccp(x1,y1);
        }
        
        [self.theHKMap addChild:sprite21 z:self.bgLayer.zOrder];
        
        CGPoint tileCoord21 = [self tileCoordForPosition:sprite21.position];
        int tileGID21 = [self.bgLayer tileGIDAt:tileCoord21];
        [self.bgLayer removeTileAt:tileCoord21];
        [self.bgLayer setTileGID:(tileGID21 + 21) at:tileCoord21];
        
        ////////////////////////////////////////////////////////////////////////
        
        self.sprite22 = [InteractiveSprite spriteWithSpriteFrameName:@"herospriteK01.png"];
        self.sprite22.spriteCode = 22;
        self.sprite22.orientation = 1;
        if (self.hero.sprite22_Orientation)
        {
            self.sprite22.orientation = self.hero.sprite22_Orientation;
        }
        if (self.sprite22.orientation == 1)
        {
            [self.sprite22 setDisplayFrame:[[spriteKWalkDown frames] objectAtIndex:0]];
        }
        else if (self.sprite22.orientation == 2)
        {
            [self.sprite22 setDisplayFrame:[[spriteKWalkUp frames] objectAtIndex:0]];
        }
        else if (self.sprite22.orientation == 3)
        {
            [self.sprite22 setDisplayFrame:[[spriteKWalkRight frames] objectAtIndex:0]];
        }
        else
        {
            [self.sprite22 setDisplayFrame:[[spriteKWalkLeft frames] objectAtIndex:0]];
        }
        //[self schedule:@selector(updateSprite22) interval:(1.3f)];
        
        
        if (self.hero.sprite22position.x != 0)
        {
            self.sprite22.position = self.hero.sprite22position;
        }
        else
        {
            NSMutableDictionary *sprite22start = [objects objectNamed:@"spriteStart22"];
            double x1 = [[sprite22start valueForKey:@"x"]floatValue];
            double y1 = [[sprite22start valueForKey:@"y"]floatValue];
            self.sprite22.position = ccp(x1,y1);
        }
        
        [self.theHKMap addChild:sprite22 z:self.bgLayer.zOrder];
        
        CGPoint tileCoord22 = [self tileCoordForPosition:sprite22.position];
        int tileGID22 = [self.bgLayer tileGIDAt:tileCoord22];
        [self.bgLayer removeTileAt:tileCoord22];
        [self.bgLayer setTileGID:(tileGID22 + 22) at:tileCoord22];
        
        ////////////////////////////////////////////////////////////////////////
        
        self.sprite23 = [InteractiveSprite spriteWithSpriteFrameName:@"herospriteB05.png"];
        self.sprite23.spriteCode = 23;
        self.sprite23.orientation = 4;
        if (self.hero.sprite23_Orientation)
        {
            self.sprite23.orientation = self.hero.sprite23_Orientation;
        }
        if (self.sprite23.orientation == 1)
        {
            [self.sprite23 setDisplayFrame:[[spriteBWalkDown frames] objectAtIndex:0]];
        }
        else if (self.sprite23.orientation == 2)
        {
            [self.sprite23 setDisplayFrame:[[spriteBWalkUp frames] objectAtIndex:0]];
        }
        else if (self.sprite23.orientation == 3)
        {
            [self.sprite23 setDisplayFrame:[[spriteBWalkRight frames] objectAtIndex:0]];
        }
        else
        {
            [self.sprite23 setDisplayFrame:[[spriteBWalkLeft frames] objectAtIndex:0]];
        }
        //[self schedule:@selector(updateSprite23) interval:(1.3f)];
        
        if (self.hero.acceptedFindEilifKingV)
        {
            if (self.hero.sprite23position.x != 0)
            {
                self.sprite23.position = self.hero.sprite23position;
            }
            else
            {
                NSMutableDictionary *sprite23start = [objects objectNamed:@"spriteStart23"];
                double x1 = [[sprite23start valueForKey:@"x"]floatValue];
                double y1 = [[sprite23start valueForKey:@"y"]floatValue];
                self.sprite23.position = ccp(x1,y1);
            }
            
        }
        else
        {
            NSMutableDictionary *sprite23start = [objects objectNamed:@"eastBlock"];
            double x1 = [[sprite23start valueForKey:@"x"]floatValue];
            double y1 = [[sprite23start valueForKey:@"y"]floatValue];
            self.sprite23.position = ccp(x1,y1);
        }
        [self.theHKMap addChild:sprite23 z:self.bgLayer.zOrder];
        
        CGPoint tileCoord23 = [self tileCoordForPosition:sprite23.position];
        int tileGID23 = [self.bgLayer tileGIDAt:tileCoord23];
        [self.bgLayer removeTileAt:tileCoord23];
        [self.bgLayer setTileGID:(tileGID23 + 23) at:tileCoord23];
        
        ////////////////////////////////////////////////////////////////////////
        
        self.sprite24 = [InteractiveSprite spriteWithSpriteFrameName:@"herospriteK01.png"];
        self.sprite24.spriteCode = 24;
        self.sprite24.orientation = 1;
        if (self.hero.sprite24_Orientation)
        {
            self.sprite24.orientation = self.hero.sprite24_Orientation;
        }
        if (self.sprite24.orientation == 1)
        {
            [self.sprite24 setDisplayFrame:[[spriteKWalkDown frames] objectAtIndex:0]];
        }
        else if (self.sprite24.orientation == 2)
        {
            [self.sprite24 setDisplayFrame:[[spriteKWalkUp frames] objectAtIndex:0]];
        }
        else if (self.sprite24.orientation == 3)
        {
            [self.sprite24 setDisplayFrame:[[spriteKWalkRight frames] objectAtIndex:0]];
        }
        else
        {
            [self.sprite24 setDisplayFrame:[[spriteKWalkLeft frames] objectAtIndex:0]];
        }
        //[self schedule:@selector(updateSprite24) interval:(1.4f)];
        
        
        if (self.hero.sprite24position.x != 0)
        {
            self.sprite24.position = self.hero.sprite24position;
        }
        else
        {
            NSMutableDictionary *sprite24start = [objects objectNamed:@"spriteStart24"];
            double x1 = [[sprite24start valueForKey:@"x"]floatValue];
            double y1 = [[sprite24start valueForKey:@"y"]floatValue];
            self.sprite24.position = ccp(x1,y1);
        }
        
        [self.theHKMap addChild:sprite24 z:self.bgLayer.zOrder];
        
        CGPoint tileCoord24 = [self tileCoordForPosition:sprite24.position];
        int tileGID24 = [self.bgLayer tileGIDAt:tileCoord24];
        [self.bgLayer removeTileAt:tileCoord24];
        [self.bgLayer setTileGID:(tileGID24 + 24) at:tileCoord24];
        
        ////////////////////////////////////////////////////////////////////////
        
        self.sprite25 = [InteractiveSprite spriteWithSpriteFrameName:@"herospriteK01.png"];
        self.sprite25.spriteCode = 25;
        self.sprite25.orientation = 1;
        if (self.hero.sprite25_Orientation)
        {
            self.sprite25.orientation = self.hero.sprite25_Orientation;
        }
        if (self.sprite25.orientation == 1)
        {
            [self.sprite25 setDisplayFrame:[[spriteKWalkDown frames] objectAtIndex:0]];
        }
        else if (self.sprite25.orientation == 2)
        {
            [self.sprite25 setDisplayFrame:[[spriteKWalkUp frames] objectAtIndex:0]];
        }
        else if (self.sprite25.orientation == 3)
        {
            [self.sprite25 setDisplayFrame:[[spriteKWalkRight frames] objectAtIndex:0]];
        }
        else
        {
            [self.sprite25 setDisplayFrame:[[spriteKWalkLeft frames] objectAtIndex:0]];
        }
        //[self schedule:@selector(updateSprite25) interval:(1.2f)];
        
        if (self.hero.beatCyclops)
        {
            if (self.hero.sprite25position.x != 0)
            {
                self.sprite25.position = self.hero.sprite25position;
            }
            else
            {
                NSMutableDictionary *sprite25start = [objects objectNamed:@"spriteStart25"];
                double x1 = [[sprite25start valueForKey:@"x"]floatValue];
                double y1 = [[sprite25start valueForKey:@"y"]floatValue];
                self.sprite25.position = ccp(x1,y1);
            }
        }
        else
        {
            NSMutableDictionary *sprite25start = [objects objectNamed:@"northBlock"];
            double x1 = [[sprite25start valueForKey:@"x"]floatValue];
            double y1 = [[sprite25start valueForKey:@"y"]floatValue];
            self.sprite25.position = ccp(x1,y1);
        }
        
        [self.theHKMap addChild:sprite25 z:self.bgLayer.zOrder];
        
        CGPoint tileCoord25 = [self tileCoordForPosition:sprite25.position];
        int tileGID25 = [self.bgLayer tileGIDAt:tileCoord25];
        [self.bgLayer removeTileAt:tileCoord25];
        [self.bgLayer setTileGID:(tileGID25 + 25) at:tileCoord25];
        
        ////////////////////////////////////////////////////////////////////////
        
        self.sprite26 = [InteractiveSprite spriteWithSpriteFrameName:@"herospriteH01.png"];
        self.sprite26.spriteCode = 26;
        self.sprite26.orientation = 1;
        if (self.hero.sprite26_Orientation)
        {
            self.sprite26.orientation = self.hero.sprite26_Orientation;
        }
        if (self.sprite26.orientation == 1)
        {
            [self.sprite26 setDisplayFrame:[[spriteHWalkDown frames] objectAtIndex:0]];
        }
        else if (self.sprite26.orientation == 2)
        {
            [self.sprite26 setDisplayFrame:[[spriteHWalkUp frames] objectAtIndex:0]];
        }
        else if (self.sprite26.orientation == 3)
        {
            [self.sprite26 setDisplayFrame:[[spriteHWalkRight frames] objectAtIndex:0]];
        }
        else
        {
            [self.sprite26 setDisplayFrame:[[spriteHWalkLeft frames] objectAtIndex:0]];
        }
        //[self schedule:@selector(updateSprite26) interval:(2.1f)];
        
        
        if (self.hero.sprite26position.x != 0)
        {
            self.sprite26.position = self.hero.sprite26position;
        }
        else
        {
            NSMutableDictionary *sprite26start = [objects objectNamed:@"spriteStart26"];
            double x1 = [[sprite26start valueForKey:@"x"]floatValue];
            double y1 = [[sprite26start valueForKey:@"y"]floatValue];
            self.sprite26.position = ccp(x1,y1);
        }
        
        [self.theHKMap addChild:sprite26 z:self.bgLayer.zOrder];
        
        CGPoint tileCoord26 = [self tileCoordForPosition:sprite26.position];
        int tileGID26 = [self.bgLayer tileGIDAt:tileCoord26];
        [self.bgLayer removeTileAt:tileCoord26];
        [self.bgLayer setTileGID:(tileGID26 + 56) at:tileCoord26];
        
        ////////////////////////////////////////////////////////////////////////
        
        self.sprite27 = [InteractiveSprite spriteWithSpriteFrameName:@"herospriteZB01.png"];
        self.sprite27.spriteCode = 27;
        self.sprite27.orientation = 1;
        if (self.hero.sprite27_Orientation)
        {
            self.sprite27.orientation = self.hero.sprite27_Orientation;
        }
        if (self.sprite27.orientation == 1)
        {
            [self.sprite27 setDisplayFrame:[[spriteZBWalkDown frames] objectAtIndex:0]];
        }
        else if (self.sprite27.orientation == 2)
        {
            [self.sprite27 setDisplayFrame:[[spriteZBWalkUp frames] objectAtIndex:0]];
        }
        else if (self.sprite27.orientation == 3)
        {
            [self.sprite27 setDisplayFrame:[[spriteZBWalkRight frames] objectAtIndex:0]];
        }
        else
        {
            [self.sprite27 setDisplayFrame:[[spriteZBWalkLeft frames] objectAtIndex:0]];
        }
        //[self schedule:@selector(updateSprite27) interval:(2.1f)];
        
        
        if (self.hero.sprite27position.x != 0)
        {
            self.sprite27.position = self.hero.sprite27position;
        }
        else
        {
            NSMutableDictionary *sprite27start = [objects objectNamed:@"spriteStart27"];
            double x1 = [[sprite27start valueForKey:@"x"]floatValue];
            double y1 = [[sprite27start valueForKey:@"y"]floatValue];
            self.sprite27.position = ccp(x1,y1);
        }
        
        [self.theHKMap addChild:sprite27 z:self.bgLayer.zOrder];
        
        CGPoint tileCoord27 = [self tileCoordForPosition:sprite27.position];    
        int tileGID27 = [self.bgLayer tileGIDAt:tileCoord27];
        [self.bgLayer removeTileAt:tileCoord27];
        [self.bgLayer setTileGID:(tileGID27 + 57) at:tileCoord27];
        
        ////////////////////////////////////////////////////////////////////////
        
        //Don't deal with boss1 here, he will be dealt with in lightOrb method
        /*
         if (!self.hero.beatBoss1 && self.hero.hasLitOrb)
         {
         [self lightOrb];
         }
         */
        
        if (!self.hero.beatCyclops)
        {
            self.boss2 = [CCSprite spriteWithFile:@"boss2sprite01.png"];
            NSMutableDictionary *boss2pos = [objects objectNamed:@"boss2"];
            double x1 = [[boss2pos valueForKey:@"x"]floatValue];
            double y1 = [[boss2pos valueForKey:@"y"]floatValue];
            self.boss2.position = ccp(x1,y1);
            [self.theHKMap addChild:boss2 z:self.bgLayer.zOrder];
        }
        
        ////////////////////////////////////////////////////////////////////////
        
        //items
        
        if (!_hero.gotItem1)
        {
            self.item1 = [CCSprite spriteWithFile:@"treasurechestSprite01.png"];
            NSMutableDictionary *item = [objects objectNamed:@"item1"];
            double x1 = [[item valueForKey:@"x"]floatValue];
            double y1 = [[item valueForKey:@"y"]floatValue];
            self.item1.position = ccp(x1,y1);
            [self.theHKMap addChild:item1 z:self.bgLayer.zOrder];
        }
        else
        {
            self.item1 = [CCSprite spriteWithFile:@"treasurechestSprite02.png"];
            NSMutableDictionary *item = [objects objectNamed:@"item1"];
            double x1 = [[item valueForKey:@"x"]floatValue];
            double y1 = [[item valueForKey:@"y"]floatValue];
            self.item1.position = ccp(x1,y1);
            [self.theHKMap addChild:item1 z:self.bgLayer.zOrder];
        }
        if (!_hero.gotItem2)
        {
            self.item2 = [CCSprite spriteWithFile:@"treasurechestSprite01.png"];
            NSMutableDictionary *item = [objects objectNamed:@"item2"];
            double x1 = [[item valueForKey:@"x"]floatValue];
            double y1 = [[item valueForKey:@"y"]floatValue];
            self.item2.position = ccp(x1,y1);
            [self.theHKMap addChild:item2 z:self.bgLayer.zOrder];
        }
        else
        {
            self.item2 = [CCSprite spriteWithFile:@"treasurechestSprite02.png"];
            NSMutableDictionary *item = [objects objectNamed:@"item2"];
            double x1 = [[item valueForKey:@"x"]floatValue];
            double y1 = [[item valueForKey:@"y"]floatValue];
            self.item2.position = ccp(x1,y1);
            [self.theHKMap addChild:item2 z:self.bgLayer.zOrder];
        }
        if (!_hero.gotItem3)
        {
            self.item3 = [CCSprite spriteWithFile:@"treasurechestSprite01.png"];
            NSMutableDictionary *item = [objects objectNamed:@"item3"];
            double x1 = [[item valueForKey:@"x"]floatValue];
            double y1 = [[item valueForKey:@"y"]floatValue];
            self.item3.position = ccp(x1,y1);
            [self.theHKMap addChild:item3 z:self.bgLayer.zOrder];
        }
        else
        {
            self.item3 = [CCSprite spriteWithFile:@"treasurechestSprite02.png"];
            NSMutableDictionary *item = [objects objectNamed:@"item3"];
            double x1 = [[item valueForKey:@"x"]floatValue];
            double y1 = [[item valueForKey:@"y"]floatValue];
            self.item3.position = ccp(x1,y1);
            [self.theHKMap addChild:item3 z:self.bgLayer.zOrder];
        }
        if (!_hero.gotItem4)
        {
            self.item4 = [CCSprite spriteWithFile:@"goldpilesprite01.png"];
            NSMutableDictionary *item = [objects objectNamed:@"item4"];
            double x1 = [[item valueForKey:@"x"]floatValue];
            double y1 = [[item valueForKey:@"y"]floatValue];
            self.item4.position = ccp(x1,y1);
            [self.theHKMap addChild:item4 z:self.bgLayer.zOrder];
        }
        
        ////////////////////////////////////////////////////////////////////////
        
        double x;
        double y;
        
        prev = self.hero.musicCode;
        
        int randWeather = arc4random()%10;
        bool willRain = self.hero.isRainingPL1;
        
        //1(coming from login),2(gate), 3(teleport), 4(herodied - pl1), 5(start new game), 6(beat ionak - go pl1),7(item shop/menu),8(battle win/flee),9(menu background)
        if (self.hero.mapInitMode == 1)
        {
            prev = 0;
            
            self.spriteOrientation = 1;
            
            x = self.hero.position.x;
            y = self.hero.position.y;

            if (randWeather <= 2)
            {
                willRain = YES;
            }
            else{
                willRain = NO;
            }
        }
        else if (self.hero.mapInitMode == 2)
        {
            self.hero.musicCode = 2;
            prev = 0;
            if (self.hero.currentMap == 2)
            {
                self.hero.musicCode = 3;
            }
            
            
            self.spriteOrientation = self.hero.heroOrientation;
            
            if (self.hero.currentMap == 2)
            {
                NSMutableDictionary *startPoint = [objects objectNamed:@"startPoint2"];
                x = [[startPoint valueForKey:@"x"]floatValue];
                y = [[startPoint valueForKey:@"y"]floatValue];
            }
            else if (self.hero.currentMap == 3)
            {
                NSMutableDictionary *startPoint = [objects objectNamed:@"startPoint4"];
                x = [[startPoint valueForKey:@"x"]floatValue];
                y = [[startPoint valueForKey:@"y"]floatValue];
            }
            else if (self.hero.currentMap == 4)
            {
                NSMutableDictionary *startPoint = [objects objectNamed:@"startPoint3"];
                x = [[startPoint valueForKey:@"x"]floatValue];
                y = [[startPoint valueForKey:@"y"]floatValue];
            }
            else
            {
                NSLog(@"Error");
                NSMutableDictionary *startPoint = [objects objectNamed:@"startPoint1"];
                x = [[startPoint valueForKey:@"x"]floatValue];
                y = [[startPoint valueForKey:@"y"]floatValue];
            }
            
            if (randWeather <= 2)
            {
                willRain = YES;
            }
            else{
                willRain = NO;
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

            if (randWeather <= 2)
            {
                willRain = YES;
            }
            else{
                willRain = NO;
            }
        }
        else if (self.hero.mapInitMode == 4)
        {
            self.hero.musicCode = 1;
            
            prev = 0;
            
            self.spriteOrientation = 1;
            
            NSMutableDictionary *startPoint = [objects objectNamed:@"startPoint1"];
            x = [[startPoint valueForKey:@"x"]floatValue];
            y = [[startPoint valueForKey:@"y"]floatValue];

            willRain = (randWeather <= 4); //more likely to be raining if you just died
        }
        else if (self.hero.mapInitMode == 5)
        {
            self.hero.musicCode = 1;
            
            prev = 0;
            
            self.spriteOrientation = 1;
            
            NSMutableDictionary *startPoint = [objects objectNamed:@"startPoint2"];
            x = [[startPoint valueForKey:@"x"]floatValue];
            y = [[startPoint valueForKey:@"y"]floatValue];

            if (randWeather <= 3)
            {
                willRain = YES;
            }
            else{
                willRain = NO;
            }
        }
        else if (self.hero.mapInitMode == 6)
        {
            self.hero.musicCode = 1;
            
            prev = 0;
            self.spriteOrientation = 1;
            
            
            //undecided what else we'll do here for now
            
            //
            
            //[self goText:xx]
            
            //
            
            //
            
            willRain = NO;
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
            
            prev = 0; //means change music no matter what
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
        self.hero.currentMap = 1;

        spriteCycleCount = 0;
        [self schedule:@selector(spriteCycle) interval:0.125];
        
    
        if (self.hero.hasLitOrb && !self.hero.savedKing)
        {
            [[CCSpriteFrameCache sharedSpriteFrameCache] addSpriteFramesWithFile:@"beaconsheet.plist"];
            CCSpriteBatchNode *beaconSheet = [CCSpriteBatchNode batchNodeWithFile:@"beaconsheet.png"];
            [beaconSheet retain];
            [self.theHKMap addChild:beaconSheet];
            CCTMXObjectGroup *objects = [theHKMap objectGroupNamed:@"oj1"];
            
            NSMutableArray *beaconAnimation = [NSMutableArray array];
            
            [beaconAnimation addObject:[[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:@"beaconframe01.png"]];
            [beaconAnimation addObject:[[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:@"beaconframe02.png"]];
            [beaconAnimation addObject:[[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:@"beaconframe03.png"]];
            [beaconAnimation addObject:[[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:@"beaconframe02.png"]];
            [beaconAnimation addObject:[[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:@"beaconframe01.png"]];
            CCAnimation *animateBeacon = [CCAnimation animationWithFrames:beaconAnimation delay:0.1f];
            
            CCSprite *beacon = [CCSprite spriteWithSpriteFrameName:@"beaconframe01.png"];
            NSMutableDictionary *beaconpos = [objects objectNamed:@"orb"];
            double x = [[beaconpos valueForKey:@"x"]floatValue];
            double y = [[beaconpos valueForKey:@"y"]floatValue];
            beacon.position = ccp(x,y);
            CCAction *action = [CCRepeatForever actionWithAction:[CCAnimate actionWithAnimation:animateBeacon restoreOriginalFrame:NO]];
            [beacon runAction:action];
            [self.theHKMap addChild:beacon z:INT_MAX];
            if (!self.hero.beatBoss1 && self.hero.hasLitOrb)
            {
                self.boss1 = [CCSprite spriteWithFile:@"boss1sprite01.png"];
                NSMutableDictionary *boss1pos = [objects objectNamed:@"boss1"];
                double x1 = [[boss1pos valueForKey:@"x"]floatValue];
                double y1 = [[boss1pos valueForKey:@"y"]floatValue];
                self.boss1.position = ccp(x1,y1);
                [self.theHKMap addChild:boss1 z:self.bgLayer.zOrder];
            }
        }
        
        self.hero.isRainingPL1 = willRain;
        if (willRain)
        {
            [self performSelector:@selector(startRain) withObject:nil afterDelay:0.125];
            //[self.myHUD startRain];
        }
        
    }
    return self;
}

-(void) startRain
{
    [self.myHUD startRain];
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



-(void)lightOrb
{
    [[CCSpriteFrameCache sharedSpriteFrameCache] addSpriteFramesWithFile:@"beaconsheet.plist"];
    CCSpriteBatchNode *beaconSheet = [CCSpriteBatchNode batchNodeWithFile:@"beaconsheet.png"];
    [beaconSheet retain];
    [self.theHKMap addChild:beaconSheet];
    CCTMXObjectGroup *objects = [theHKMap objectGroupNamed:@"oj1"];
    
    NSMutableArray *beaconAnimation = [NSMutableArray array];
    
    [beaconAnimation addObject:[[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:@"beaconframe01.png"]];
    [beaconAnimation addObject:[[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:@"beaconframe02.png"]];
    [beaconAnimation addObject:[[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:@"beaconframe03.png"]];
    [beaconAnimation addObject:[[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:@"beaconframe02.png"]];
    [beaconAnimation addObject:[[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:@"beaconframe01.png"]];
    CCAnimation *animateBeacon = [CCAnimation animationWithFrames:beaconAnimation delay:0.1f];
    
    CCSprite *beacon = [CCSprite spriteWithSpriteFrameName:@"beaconframe01.png"];
    NSMutableDictionary *beaconpos = [objects objectNamed:@"orb"];
    double x = [[beaconpos valueForKey:@"x"]floatValue];
    double y = [[beaconpos valueForKey:@"y"]floatValue];
    beacon.position = ccp(x,y);
    CCAction *action = [CCRepeatForever actionWithAction:[CCAnimate actionWithAnimation:animateBeacon restoreOriginalFrame:NO]];
    [beacon runAction:action];
    [self.theHKMap addChild:beacon z:INT_MAX];
    self.hero.hasLitOrb = YES;
    
    if (!self.hero.beatBoss1)
    {
        self.boss1 = [CCSprite spriteWithFile:@"boss1sprite01.png"];
        NSMutableDictionary *boss1pos = [objects objectNamed:@"boss1"];
        double x1 = [[boss1pos valueForKey:@"x"]floatValue];
        double y1 = [[boss1pos valueForKey:@"y"]floatValue];
        self.boss1.position = ccp(x1,y1);
        [self.theHKMap addChild:boss1 z:self.bgLayer.zOrder];
    }
    [self removeItem:25];
    return;
}
-(void)pickedUpItem:(int)itemCode
{
    [MusicHandler playButtonClick];
    if (itemCode == 1)
    {
        CGPoint pos = self.item1.position;
        self.hero.gotItem1 = YES;
        [self.theHKMap removeChild:item1 cleanup:YES];
        self.item1 = [CCSprite spriteWithFile:@"treasurechestSprite02.png"];
        self.item1.position = pos;
        [self.theHKMap addChild:item1 z:self.bgLayer.zOrder];
        
        //add item to inv
        self.hero.gold += 20;
    }
    else if (itemCode == 2)
    {
        CGPoint pos = self.item2.position;
        self.hero.gotItem2 = YES;
        [self.theHKMap removeChild:item2 cleanup:YES];
        self.item2 = [CCSprite spriteWithFile:@"treasurechestSprite02.png"];
        self.item2.position = pos;
        [self.theHKMap addChild:item2 z:self.bgLayer.zOrder];
        
        [self givenItem:181];
        
    }
    else if (itemCode == 3)
    {
        CGPoint pos = self.item3.position;
        self.hero.gotItem3 = YES;
        [self.theHKMap removeChild:item3 cleanup:YES];
        self.item3 = [CCSprite spriteWithFile:@"treasurechestSprite02.png"];
        self.item3.position = pos;
        [self.theHKMap addChild:item3 z:self.bgLayer.zOrder];
        self.hero.gold += 8;
        
    }
    else if (itemCode == 4)
    {
        self.hero.gotItem4 = YES;
        [self.theHKMap removeChild:item2 cleanup:YES];
        self.hero.gold += 30;
    }
    else{
        NSLog(@"ErrorPICKEDUPITEM");
    }
    return;
}





-(void)updateSprite1
{
    CGSize screenSize = [[CCDirector sharedDirector] winSize];
    int x = self.hero.position.x;
    int y = self.hero.position.y;
    
    int p = self.sprite1.position.x;
    int q = self.sprite1.position.y;
    
    int diffx = abs(x-p);
    int diffy = abs(y-q);
    
    if ((diffx > screenSize.width/1.5) || (diffy > screenSize.height/1.5))
    {
        return;
    }
    
    if (!self.hero.beatBoss1)
    {
        self.sprite1.orientation = 3;
        [self.sprite1 setDisplayFrame:[[spriteBWalkRight frames] objectAtIndex:0]];
        return;
    }
    
    int rand = arc4random()%14;
    
    if (self.spriteOddIsTalking)
    {
        return;
    }
    if (rand == 1)
    {
        [self moveleftSprite1];
    }
    if (rand == 2)
    {
        [self moverightSprite1];
    }
    if (rand == 3)
    {
        [self moveupSprite1];
    }
    if (rand == 4)
    {
        [self movedownSprite1];
    }
    return;
}

-(void) moveleftSprite1
{
    CGPoint sprite1Pos = self.sprite1.position;
    self.sprite1.orientation = 4;
    sprite1Pos.x -= theHKMap.tileSize.width;
    
    CGPoint tileCoord = [self tileCoordForPosition:sprite1Pos];
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
                    CGPoint tileCoord1 = [self tileCoordForPosition:sprite1.position];
                    int tileGID1 = [self.bgLayer tileGIDAt:tileCoord1];
                    [self.bgLayer removeTileAt:tileCoord1];
                    [self.bgLayer setTileGID:(tileGID1 - 1) at:tileCoord1];
                    
                    
                    if (self.sprite1.orientation == 4)
                    {
                        id actionMove = [CCMoveTo actionWithDuration:0.3 position:sprite1Pos];
                        id actionMove2 = [CCAnimate actionWithAnimation:spriteBWalkLeft restoreOriginalFrame:NO];
                        
                        id actionMoveDone = [CCCallFuncN actionWithTarget:self selector:@selector(finishActionSprite1)];
                        
                        [self.sprite1 runAction:[CCSpawn actionOne:[CCSequence actions:actionMove,actionMoveDone,nil] two:actionMove2]];
                        return;
                    }
                }
            }
        }
    }
    if (self.sprite1.orientation == 1)
    {
        [self.sprite1 setDisplayFrame:[[spriteBWalkDown frames] objectAtIndex:0]];
    }
    
    if (self.sprite1.orientation == 2)
    {
        [self.sprite1 setDisplayFrame:[[spriteBWalkUp frames] objectAtIndex:0]];
    }
    
    if (self.sprite1.orientation == 3)
    {
        [self.sprite1 setDisplayFrame:[[spriteBWalkRight frames] objectAtIndex:0]];
    }
    
    if (self.sprite1.orientation == 4)
    {
        [self.sprite1 setDisplayFrame:[[spriteBWalkLeft frames] objectAtIndex:0]];
    }
}
-(void) moverightSprite1
{
    CGPoint sprite1Pos = self.sprite1.position;
    self.sprite1.orientation = 3;
    sprite1Pos.x += theHKMap.tileSize.width;
    
    CGPoint tileCoord = [self tileCoordForPosition:sprite1Pos];
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
                    CGPoint tileCoord1 = [self tileCoordForPosition:sprite1.position];
                    int tileGID1 = [self.bgLayer tileGIDAt:tileCoord1];
                    [self.bgLayer removeTileAt:tileCoord1];
                    [self.bgLayer setTileGID:(tileGID1 - 1) at:tileCoord1];
                    
                    
                    if (self.sprite1.orientation == 3)
                    {
                        id actionMove = [CCMoveTo actionWithDuration:0.3 position:sprite1Pos];
                        id actionMove2 = [CCAnimate actionWithAnimation:spriteBWalkRight restoreOriginalFrame:NO];
                        
                        id actionMoveDone = [CCCallFuncN actionWithTarget:self selector:@selector(finishActionSprite1)];
                        
                        [self.sprite1 runAction:[CCSpawn actionOne:[CCSequence actions:actionMove,actionMoveDone,nil] two:actionMove2]];
                        return;
                    }
                }
            }
        }
    }
    if (self.sprite1.orientation == 1)
    {
        [self.sprite1 setDisplayFrame:[[spriteBWalkDown frames] objectAtIndex:0]];
    }
    
    if (self.sprite1.orientation == 2)
    {
        [self.sprite1 setDisplayFrame:[[spriteBWalkUp frames] objectAtIndex:0]];
    }
    
    if (self.sprite1.orientation == 3)
    {
        [self.sprite1 setDisplayFrame:[[spriteBWalkRight frames] objectAtIndex:0]];
    }
    
    if (self.sprite1.orientation == 4)
    {
        [self.sprite1 setDisplayFrame:[[spriteBWalkLeft frames] objectAtIndex:0]];
    }
}
-(void) moveupSprite1
{
    CGPoint sprite1Pos = self.sprite1.position;
    self.sprite1.orientation = 2;
    sprite1Pos.y += theHKMap.tileSize.height;
    
    CGPoint tileCoord = [self tileCoordForPosition:sprite1Pos];
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
                    CGPoint tileCoord1 = [self tileCoordForPosition:sprite1.position];
                    int tileGID1 = [self.bgLayer tileGIDAt:tileCoord1];
                    [self.bgLayer removeTileAt:tileCoord1];
                    [self.bgLayer setTileGID:(tileGID1 - 1) at:tileCoord1];
                    
                    
                    if (self.sprite1.orientation == 2)
                    {
                        id actionMove = [CCMoveTo actionWithDuration:0.3 position:sprite1Pos];
                        id actionMove2;
                        if (self.sprite1LastRight)
                        {
                            actionMove2 = [CCAnimate actionWithAnimation:spriteBWalkUp restoreOriginalFrame:NO];
                        }
                        else
                        {
                            actionMove2 = [CCAnimate actionWithAnimation:spriteBWalkUp2 restoreOriginalFrame:NO];
                        }
                        id actionMoveDone = [CCCallFuncN actionWithTarget:self selector:@selector(finishActionSprite1)];
                        
                        [self.sprite1 runAction:[CCSpawn actionOne:[CCSequence actions:actionMove,actionMoveDone,nil] two:actionMove2]];
                        return;
                    }
                }
            }
        }
    }
    if (self.sprite1.orientation == 1)
    {
        [self.sprite1 setDisplayFrame:[[spriteBWalkDown frames] objectAtIndex:0]];
    }
    
    if (self.sprite1.orientation == 2)
    {
        [self.sprite1 setDisplayFrame:[[spriteBWalkUp frames] objectAtIndex:0]];
    }
    
    if (self.sprite1.orientation == 3)
    {
        [self.sprite1 setDisplayFrame:[[spriteBWalkRight frames] objectAtIndex:0]];
    }
    
    if (self.sprite1.orientation == 4)
    {
        [self.sprite1 setDisplayFrame:[[spriteBWalkLeft frames] objectAtIndex:0]];
    }
}
-(void) movedownSprite1
{
    CGPoint sprite1Pos = self.sprite1.position;
    self.sprite1.orientation = 1;
    sprite1Pos.y -= theHKMap.tileSize.height;
    
    CGPoint tileCoord = [self tileCoordForPosition:sprite1Pos];
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
                    CGPoint tileCoord1 = [self tileCoordForPosition:sprite1.position];
                    int tileGID1 = [self.bgLayer tileGIDAt:tileCoord1];
                    [self.bgLayer removeTileAt:tileCoord1];
                    [self.bgLayer setTileGID:(tileGID1 - 1) at:tileCoord1];
                    
                    
                    if (self.sprite1.orientation == 1)
                    {
                        id actionMove = [CCMoveTo actionWithDuration:0.3 position:sprite1Pos];
                        id actionMove2;
                        if (self.sprite1LastRight)
                        {
                            actionMove2 = [CCAnimate actionWithAnimation:spriteBWalkDown restoreOriginalFrame:NO];
                        }
                        else
                        {
                            actionMove2 = [CCAnimate actionWithAnimation:spriteBWalkDown2 restoreOriginalFrame:NO];
                        }
                        id actionMoveDone = [CCCallFuncN actionWithTarget:self selector:@selector(finishActionSprite1)];
                        
                        [self.sprite1 runAction:[CCSpawn actionOne:[CCSequence actions:actionMove,actionMoveDone,nil] two:actionMove2]];
                        return;
                    }
                }
            }
        }
    }
    if (self.sprite1.orientation == 1)
    {
        [self.sprite1 setDisplayFrame:[[spriteBWalkDown frames] objectAtIndex:0]];
    }
    
    if (self.sprite1.orientation == 2)
    {
        [self.sprite1 setDisplayFrame:[[spriteBWalkUp frames] objectAtIndex:0]];
    }
    
    if (self.sprite1.orientation == 3)
    {
        [self.sprite1 setDisplayFrame:[[spriteBWalkRight frames] objectAtIndex:0]];
    }
    
    if (self.sprite1.orientation == 4)
    {
        [self.sprite1 setDisplayFrame:[[spriteBWalkLeft frames] objectAtIndex:0]];
    }
}

-(void) finishActionSprite1
{
    if (self.sprite1.orientation == 1)
    {
        [self.sprite1 setDisplayFrame:[[spriteBWalkDown frames] objectAtIndex:0]];
    }
    
    if (self.sprite1.orientation == 2)
    {
        [self.sprite1 setDisplayFrame:[[spriteBWalkUp frames] objectAtIndex:0]];
    }
    
    if (self.sprite1.orientation == 3)
    {
        [self.sprite1 setDisplayFrame:[[spriteBWalkRight frames] objectAtIndex:0]];
    }
    
    if (self.sprite1.orientation == 4)
    {
        [self.sprite1 setDisplayFrame:[[spriteBWalkLeft frames] objectAtIndex:0]];
    }
    self.hero.sprite1position = self.sprite1.position;
}



-(void)updateSprite2
{
    CGSize screenSize = [[CCDirector sharedDirector] winSize];
    int x = self.hero.position.x;
    int y = self.hero.position.y;
    
    int p = self.sprite2.position.x;
    int q = self.sprite2.position.y;
    
    int diffx = abs(x-p);
    int diffy = abs(y-q);
    
    if ((diffx > screenSize.width/1.5) || (diffy > screenSize.height/1.5))
    {
        return;
    }
    
    if (!self.hero.beatBoss1)
    {
        self.sprite2.orientation = 1;
        [self.sprite2 setDisplayFrame:[[spriteBWalkDown frames] objectAtIndex:0]];
        return;
    }
    
    int rand = arc4random()%14;
    if (self.spriteEvenIsTalking)
    {
        return;
    }
    if (rand == 1)
    {
        [self moveleftSprite2];
    }
    if (rand == 2)
    {
        [self moverightSprite2];
    }
    if (rand == 3)
    {
        [self moveupSprite2];
    }
    if (rand == 4)
    {
        [self movedownSprite2];
    }
    return;
}

-(void) moveleftSprite2
{
    CGPoint sprite2Pos = self.sprite2.position;
    self.sprite2.orientation = 4;
    sprite2Pos.x -= theHKMap.tileSize.width;
    
    CGPoint tileCoord = [self tileCoordForPosition:sprite2Pos];
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
                    CGPoint tileCoord1 = [self tileCoordForPosition:sprite2.position];
                    int tileGID1 = [self.bgLayer tileGIDAt:tileCoord1];
                    [self.bgLayer removeTileAt:tileCoord1];
                    [self.bgLayer setTileGID:(tileGID1 - 2) at:tileCoord1];
                    
                    
                    if (self.sprite2.orientation == 4)
                    {
                        id actionMove = [CCMoveTo actionWithDuration:0.3 position:sprite2Pos];
                        id actionMove2 = [CCAnimate actionWithAnimation:spriteBWalkLeft restoreOriginalFrame:NO];
                        
                        id actionMoveDone = [CCCallFuncN actionWithTarget:self selector:@selector(finishActionSprite2)];
                        
                        [self.sprite2 runAction:[CCSpawn actionOne:[CCSequence actions:actionMove,actionMoveDone,nil] two:actionMove2]];
                        return;
                    }
                }
            }
        }
    }
    if (self.sprite2.orientation == 1)
    {
        [self.sprite2 setDisplayFrame:[[spriteBWalkDown frames] objectAtIndex:0]];
    }
    
    if (self.sprite2.orientation == 2)
    {
        [self.sprite2 setDisplayFrame:[[spriteBWalkUp frames] objectAtIndex:0]];
    }
    
    if (self.sprite2.orientation == 3)
    {
        [self.sprite2 setDisplayFrame:[[spriteBWalkRight frames] objectAtIndex:0]];
    }
    
    if (self.sprite2.orientation == 4)
    {
        [self.sprite2 setDisplayFrame:[[spriteBWalkLeft frames] objectAtIndex:0]];
    }
}
-(void) moverightSprite2
{
    CGPoint sprite2Pos = self.sprite2.position;
    self.sprite2.orientation = 3;
    sprite2Pos.x += theHKMap.tileSize.width;
    
    CGPoint tileCoord = [self tileCoordForPosition:sprite2Pos];
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
                    CGPoint tileCoord1 = [self tileCoordForPosition:sprite2.position];
                    int tileGID1 = [self.bgLayer tileGIDAt:tileCoord1];
                    [self.bgLayer removeTileAt:tileCoord1];
                    [self.bgLayer setTileGID:(tileGID1 - 2) at:tileCoord1];
                    
                    
                    if (self.sprite2.orientation == 3)
                    {
                        id actionMove = [CCMoveTo actionWithDuration:0.3 position:sprite2Pos];
                        id actionMove2 = [CCAnimate actionWithAnimation:spriteBWalkRight restoreOriginalFrame:NO];
                        
                        id actionMoveDone = [CCCallFuncN actionWithTarget:self selector:@selector(finishActionSprite2)];
                        
                        [self.sprite2 runAction:[CCSpawn actionOne:[CCSequence actions:actionMove,actionMoveDone,nil] two:actionMove2]];
                        return;
                    }
                }
            }
        }
    }
    if (self.sprite2.orientation == 1)
    {
        [self.sprite2 setDisplayFrame:[[spriteBWalkDown frames] objectAtIndex:0]];
    }
    
    if (self.sprite2.orientation == 2)
    {
        [self.sprite2 setDisplayFrame:[[spriteBWalkUp frames] objectAtIndex:0]];
    }
    
    if (self.sprite2.orientation == 3)
    {
        [self.sprite2 setDisplayFrame:[[spriteBWalkRight frames] objectAtIndex:0]];
    }
    
    if (self.sprite2.orientation == 4)
    {
        [self.sprite2 setDisplayFrame:[[spriteBWalkLeft frames] objectAtIndex:0]];
    }
}
-(void) moveupSprite2
{
    CGPoint sprite2Pos = self.sprite2.position;
    self.sprite2.orientation = 2;
    sprite2Pos.y += theHKMap.tileSize.height;
    
    CGPoint tileCoord = [self tileCoordForPosition:sprite2Pos];
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
                    CGPoint tileCoord1 = [self tileCoordForPosition:sprite2.position];
                    int tileGID1 = [self.bgLayer tileGIDAt:tileCoord1];
                    [self.bgLayer removeTileAt:tileCoord1];
                    [self.bgLayer setTileGID:(tileGID1 - 2) at:tileCoord1];
                    
                    
                    if (self.sprite2.orientation == 2)
                    {
                        id actionMove = [CCMoveTo actionWithDuration:0.3 position:sprite2Pos];
                        id actionMove2;
                        if (self.sprite1LastRight)
                        {
                            actionMove2 = [CCAnimate actionWithAnimation:spriteBWalkUp restoreOriginalFrame:NO];
                        }
                        else
                        {
                            actionMove2 = [CCAnimate actionWithAnimation:spriteBWalkUp2 restoreOriginalFrame:NO];
                        }
                        id actionMoveDone = [CCCallFuncN actionWithTarget:self selector:@selector(finishActionSprite2)];
                        
                        [self.sprite2 runAction:[CCSpawn actionOne:[CCSequence actions:actionMove,actionMoveDone,nil] two:actionMove2]];
                        return;
                    }
                }
            }
        }
    }
    if (self.sprite2.orientation == 1)
    {
        [self.sprite2 setDisplayFrame:[[spriteBWalkDown frames] objectAtIndex:0]];
    }
    
    if (self.sprite2.orientation == 2)
    {
        [self.sprite2 setDisplayFrame:[[spriteBWalkUp frames] objectAtIndex:0]];
    }
    
    if (self.sprite2.orientation == 3)
    {
        [self.sprite2 setDisplayFrame:[[spriteBWalkRight frames] objectAtIndex:0]];
    }
    
    if (self.sprite2.orientation == 4)
    {
        [self.sprite2 setDisplayFrame:[[spriteBWalkLeft frames] objectAtIndex:0]];
    }
}
-(void) movedownSprite2
{
    CGPoint sprite2Pos = self.sprite2.position;
    self.sprite2.orientation = 1;
    sprite2Pos.y -= theHKMap.tileSize.height;
    
    CGPoint tileCoord = [self tileCoordForPosition:sprite2Pos];
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
                    CGPoint tileCoord1 = [self tileCoordForPosition:sprite2.position];
                    int tileGID1 = [self.bgLayer tileGIDAt:tileCoord1];
                    [self.bgLayer removeTileAt:tileCoord1];
                    [self.bgLayer setTileGID:(tileGID1 - 2) at:tileCoord1];
                    
                    
                    if (self.sprite2.orientation == 1)
                    {
                        id actionMove = [CCMoveTo actionWithDuration:0.3 position:sprite2Pos];
                        id actionMove2;
                        if (self.sprite1LastRight)
                        {
                            actionMove2 = [CCAnimate actionWithAnimation:spriteBWalkDown restoreOriginalFrame:NO];
                        }
                        else
                        {
                            actionMove2 = [CCAnimate actionWithAnimation:spriteBWalkDown2 restoreOriginalFrame:NO];
                        }
                        id actionMoveDone = [CCCallFuncN actionWithTarget:self selector:@selector(finishActionSprite2)];
                        
                        [self.sprite2 runAction:[CCSpawn actionOne:[CCSequence actions:actionMove,actionMoveDone,nil] two:actionMove2]];
                        return;
                    }
                }
            }
        }
    }
    if (self.sprite2.orientation == 1)
    {
        [self.sprite2 setDisplayFrame:[[spriteBWalkDown frames] objectAtIndex:0]];
    }
    
    if (self.sprite2.orientation == 2)
    {
        [self.sprite2 setDisplayFrame:[[spriteBWalkUp frames] objectAtIndex:0]];
    }
    
    if (self.sprite2.orientation == 3)
    {
        [self.sprite2 setDisplayFrame:[[spriteBWalkRight frames] objectAtIndex:0]];
    }
    
    if (self.sprite2.orientation == 4)
    {
        [self.sprite2 setDisplayFrame:[[spriteBWalkLeft frames] objectAtIndex:0]];
    }
}

-(void) finishActionSprite2
{
    if (self.sprite2.orientation == 1)
    {
        [self.sprite2 setDisplayFrame:[[spriteBWalkDown frames] objectAtIndex:0]];
    }
    
    if (self.sprite2.orientation == 2)
    {
        [self.sprite2 setDisplayFrame:[[spriteBWalkUp frames] objectAtIndex:0]];
    }
    
    if (self.sprite2.orientation == 3)
    {
        [self.sprite2 setDisplayFrame:[[spriteBWalkRight frames] objectAtIndex:0]];
    }
    
    if (self.sprite2.orientation == 4)
    {
        [self.sprite2 setDisplayFrame:[[spriteBWalkLeft frames] objectAtIndex:0]];
    }
    self.hero.sprite2position = self.sprite2.position;
}


-(void)updateSprite3
{
    CGSize screenSize = [[CCDirector sharedDirector] winSize];
    int x = self.hero.position.x;
    int y = self.hero.position.y;
    
    int p = self.sprite3.position.x;
    int q = self.sprite3.position.y;
    
    int diffx = abs(x-p);
    int diffy = abs(y-q);
    
    if ((diffx > screenSize.width/1.5) || (diffy > screenSize.height/1.5))
    {
        return;
    }
    
    if (!self.hero.talkedToKingVInitial)
    {
        self.sprite2.orientation = 4;
        [self.sprite2 setDisplayFrame:[[spriteBWalkLeft frames] objectAtIndex:0]];
        return;
    }
    
    
    int rand = arc4random()%14;
    if (self.spriteOddIsTalking)
    {
        return;
    }
    if (rand == 1)
    {
        [self moveleftSprite3];
    }
    if (rand == 2)
    {
        [self moverightSprite3];
    }
    if (rand == 3)
    {
        [self moveupSprite3];
    }
    if (rand == 4)
    {
        [self movedownSprite3];
    }
    return;
}

-(void) moveleftSprite3
{
    CGPoint sprite3Pos = self.sprite3.position;
    self.sprite3.orientation = 4;
    sprite3Pos.x -= theHKMap.tileSize.width;
    
    CGPoint tileCoord = [self tileCoordForPosition:sprite3Pos];
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
                    CGPoint tileCoord1 = [self tileCoordForPosition:sprite3.position];
                    int tileGID1 = [self.bgLayer tileGIDAt:tileCoord1];
                    [self.bgLayer removeTileAt:tileCoord1];
                    [self.bgLayer setTileGID:(tileGID1 - 3) at:tileCoord1];
                    
                    
                    if (self.sprite3.orientation == 4)
                    {
                        id actionMove = [CCMoveTo actionWithDuration:0.3 position:sprite3Pos];
                        id actionMove2 = [CCAnimate actionWithAnimation:spriteBWalkLeft restoreOriginalFrame:NO];
                        
                        id actionMoveDone = [CCCallFuncN actionWithTarget:self selector:@selector(finishActionSprite3)];
                        
                        [self.sprite3 runAction:[CCSpawn actionOne:[CCSequence actions:actionMove,actionMoveDone,nil] two:actionMove2]];
                        return;
                    }
                }
            }
        }
    }
    if (self.sprite3.orientation == 1)
    {
        [self.sprite3 setDisplayFrame:[[spriteBWalkDown frames] objectAtIndex:0]];
    }
    
    if (self.sprite3.orientation == 2)
    {
        [self.sprite3 setDisplayFrame:[[spriteBWalkUp frames] objectAtIndex:0]];
    }
    
    if (self.sprite3.orientation == 3)
    {
        [self.sprite3 setDisplayFrame:[[spriteBWalkRight frames] objectAtIndex:0]];
    }
    
    if (self.sprite3.orientation == 4)
    {
        [self.sprite3 setDisplayFrame:[[spriteBWalkLeft frames] objectAtIndex:0]];
    }
}
-(void) moverightSprite3
{
    CGPoint sprite3Pos = self.sprite3.position;
    self.sprite3.orientation = 3;
    sprite3Pos.x += theHKMap.tileSize.width;
    
    CGPoint tileCoord = [self tileCoordForPosition:sprite3Pos];
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
                    CGPoint tileCoord1 = [self tileCoordForPosition:sprite3.position];
                    int tileGID1 = [self.bgLayer tileGIDAt:tileCoord1];
                    [self.bgLayer removeTileAt:tileCoord1];
                    [self.bgLayer setTileGID:(tileGID1 - 3) at:tileCoord1];
                    
                    
                    if (self.sprite3.orientation == 3)
                    {
                        id actionMove = [CCMoveTo actionWithDuration:0.3 position:sprite3Pos];
                        id actionMove2 = [CCAnimate actionWithAnimation:spriteBWalkRight restoreOriginalFrame:NO];
                        
                        id actionMoveDone = [CCCallFuncN actionWithTarget:self selector:@selector(finishActionSprite3)];
                        
                        [self.sprite3 runAction:[CCSpawn actionOne:[CCSequence actions:actionMove,actionMoveDone,nil] two:actionMove2]];
                        return;
                    }
                }
            }
        }
    }
    if (self.sprite3.orientation == 1)
    {
        [self.sprite3 setDisplayFrame:[[spriteBWalkDown frames] objectAtIndex:0]];
    }
    
    if (self.sprite3.orientation == 2)
    {
        [self.sprite3 setDisplayFrame:[[spriteBWalkUp frames] objectAtIndex:0]];
    }
    
    if (self.sprite3.orientation == 3)
    {
        [self.sprite3 setDisplayFrame:[[spriteBWalkRight frames] objectAtIndex:0]];
    }
    
    if (self.sprite3.orientation == 4)
    {
        [self.sprite3 setDisplayFrame:[[spriteBWalkLeft frames] objectAtIndex:0]];
    }
}
-(void) moveupSprite3
{
    CGPoint sprite3Pos = self.sprite3.position;
    self.sprite3.orientation = 2;
    sprite3Pos.y += theHKMap.tileSize.height;
    
    CGPoint tileCoord = [self tileCoordForPosition:sprite3Pos];
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
                    CGPoint tileCoord1 = [self tileCoordForPosition:sprite3.position];
                    int tileGID1 = [self.bgLayer tileGIDAt:tileCoord1];
                    [self.bgLayer removeTileAt:tileCoord1];
                    [self.bgLayer setTileGID:(tileGID1 - 3) at:tileCoord1];
                    
                    
                    if (self.sprite3.orientation == 2)
                    {
                        id actionMove = [CCMoveTo actionWithDuration:0.3 position:sprite3Pos];
                        id actionMove2;
                        if (self.sprite1LastRight)
                        {
                            actionMove2 = [CCAnimate actionWithAnimation:spriteBWalkUp restoreOriginalFrame:NO];
                        }
                        else
                        {
                            actionMove2 = [CCAnimate actionWithAnimation:spriteBWalkUp2 restoreOriginalFrame:NO];
                        }
                        id actionMoveDone = [CCCallFuncN actionWithTarget:self selector:@selector(finishActionSprite3)];
                        
                        [self.sprite3 runAction:[CCSpawn actionOne:[CCSequence actions:actionMove,actionMoveDone,nil] two:actionMove2]];
                        return;
                    }
                }
            }
        }
    }
    if (self.sprite3.orientation == 1)
    {
        [self.sprite3 setDisplayFrame:[[spriteBWalkDown frames] objectAtIndex:0]];
    }
    
    if (self.sprite3.orientation == 2)
    {
        [self.sprite3 setDisplayFrame:[[spriteBWalkUp frames] objectAtIndex:0]];
    }
    
    if (self.sprite3.orientation == 3)
    {
        [self.sprite3 setDisplayFrame:[[spriteBWalkRight frames] objectAtIndex:0]];
    }
    
    if (self.sprite3.orientation == 4)
    {
        [self.sprite3 setDisplayFrame:[[spriteBWalkLeft frames] objectAtIndex:0]];
    }
}
-(void) movedownSprite3
{
    CGPoint sprite3Pos = self.sprite3.position;
    self.sprite3.orientation = 1;
    sprite3Pos.y -= theHKMap.tileSize.height;
    
    CGPoint tileCoord = [self tileCoordForPosition:sprite3Pos];
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
                    CGPoint tileCoord1 = [self tileCoordForPosition:sprite3.position];
                    int tileGID1 = [self.bgLayer tileGIDAt:tileCoord1];
                    [self.bgLayer removeTileAt:tileCoord1];
                    [self.bgLayer setTileGID:(tileGID1 - 3) at:tileCoord1];
                    
                    
                    if (self.sprite3.orientation == 1)
                    {
                        id actionMove = [CCMoveTo actionWithDuration:0.3 position:sprite3Pos];
                        id actionMove2;
                        if (self.sprite1LastRight)
                        {
                            actionMove2 = [CCAnimate actionWithAnimation:spriteBWalkDown restoreOriginalFrame:NO];
                        }
                        else
                        {
                            actionMove2 = [CCAnimate actionWithAnimation:spriteBWalkDown2 restoreOriginalFrame:NO];
                        }
                        id actionMoveDone = [CCCallFuncN actionWithTarget:self selector:@selector(finishActionSprite3)];
                        
                        [self.sprite3 runAction:[CCSpawn actionOne:[CCSequence actions:actionMove,actionMoveDone,nil] two:actionMove2]];
                        return;
                    }
                }
            }
        }
    }
    if (self.sprite3.orientation == 1)
    {
        [self.sprite3 setDisplayFrame:[[spriteBWalkDown frames] objectAtIndex:0]];
    }
    
    if (self.sprite3.orientation == 2)
    {
        [self.sprite3 setDisplayFrame:[[spriteBWalkUp frames] objectAtIndex:0]];
    }
    
    if (self.sprite3.orientation == 3)
    {
        [self.sprite3 setDisplayFrame:[[spriteBWalkRight frames] objectAtIndex:0]];
    }
    
    if (self.sprite3.orientation == 4)
    {
        [self.sprite3 setDisplayFrame:[[spriteBWalkLeft frames] objectAtIndex:0]];
    }
}

-(void) finishActionSprite3
{
    if (self.sprite3.orientation == 1)
    {
        [self.sprite3 setDisplayFrame:[[spriteBWalkDown frames] objectAtIndex:0]];
    }
    
    if (self.sprite3.orientation == 2)
    {
        [self.sprite3 setDisplayFrame:[[spriteBWalkUp frames] objectAtIndex:0]];
    }
    
    if (self.sprite3.orientation == 3)
    {
        [self.sprite3 setDisplayFrame:[[spriteBWalkRight frames] objectAtIndex:0]];
    }
    
    if (self.sprite3.orientation == 4)
    {
        [self.sprite3 setDisplayFrame:[[spriteBWalkLeft frames] objectAtIndex:0]];
    }
    self.hero.sprite3position = self.sprite3.position;
}


-(void)updateSprite4
{
    CGSize screenSize = [[CCDirector sharedDirector] winSize];
    int x = self.hero.position.x;
    int y = self.hero.position.y;
    
    int p = self.sprite4.position.x;
    int q = self.sprite4.position.y;
    
    int diffx = abs(x-p);
    int diffy = abs(y-q);
    
    if ((diffx > screenSize.width/1.5) || (diffy > screenSize.height/1.5))
    {
        return;
    }
    
    
    int rand = arc4random()%14;
    if (self.spriteEvenIsTalking)
    {
        return;
    }
    if (rand == 1)
    {
        [self moveleftSprite4];
    }
    if (rand == 2)
    {
        [self moverightSprite4];
    }
    if (rand == 3)
    {
        [self moveupSprite4];
    }
    if (rand == 4)
    {
        [self movedownSprite4];
    }
    return;
}

-(void) moveleftSprite4
{
    CGPoint sprite4Pos = self.sprite4.position;
    self.sprite4.orientation = 4;
    sprite4Pos.x -= theHKMap.tileSize.width;
    
    CGPoint tileCoord = [self tileCoordForPosition:sprite4Pos];
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
                    CGPoint tileCoord1 = [self tileCoordForPosition:sprite4.position];
                    int tileGID1 = [self.bgLayer tileGIDAt:tileCoord1];
                    [self.bgLayer removeTileAt:tileCoord1];
                    [self.bgLayer setTileGID:(tileGID1 - 4) at:tileCoord1];
                    
                    
                    if (self.sprite4.orientation == 4)
                    {
                        id actionMove = [CCMoveTo actionWithDuration:0.3 position:sprite4Pos];
                        id actionMove2 = [CCAnimate actionWithAnimation:spriteKWalkLeft restoreOriginalFrame:NO];
                        
                        id actionMoveDone = [CCCallFuncN actionWithTarget:self selector:@selector(finishActionSprite4)];
                        
                        [self.sprite4 runAction:[CCSpawn actionOne:[CCSequence actions:actionMove,actionMoveDone,nil] two:actionMove2]];
                        return;
                    }
                }
            }
        }
    }
    if (self.sprite4.orientation == 1)
    {
        [self.sprite4 setDisplayFrame:[[spriteKWalkDown frames] objectAtIndex:0]];
    }
    
    if (self.sprite4.orientation == 2)
    {
        [self.sprite4 setDisplayFrame:[[spriteKWalkUp frames] objectAtIndex:0]];
    }
    
    if (self.sprite4.orientation == 3)
    {
        [self.sprite4 setDisplayFrame:[[spriteKWalkRight frames] objectAtIndex:0]];
    }
    
    if (self.sprite4.orientation == 4)
    {
        [self.sprite4 setDisplayFrame:[[spriteKWalkLeft frames] objectAtIndex:0]];
    }
}
-(void) moverightSprite4
{
    CGPoint sprite4Pos = self.sprite4.position;
    self.sprite4.orientation = 3;
    sprite4Pos.x += theHKMap.tileSize.width;
    
    CGPoint tileCoord = [self tileCoordForPosition:sprite4Pos];
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
                    CGPoint tileCoord1 = [self tileCoordForPosition:sprite4.position];
                    int tileGID1 = [self.bgLayer tileGIDAt:tileCoord1];
                    [self.bgLayer removeTileAt:tileCoord1];
                    [self.bgLayer setTileGID:(tileGID1 - 4) at:tileCoord1];
                    
                    
                    if (self.sprite4.orientation == 3)
                    {
                        id actionMove = [CCMoveTo actionWithDuration:0.3 position:sprite4Pos];
                        id actionMove2 = [CCAnimate actionWithAnimation:spriteKWalkRight restoreOriginalFrame:NO];
                        
                        id actionMoveDone = [CCCallFuncN actionWithTarget:self selector:@selector(finishActionSprite4)];
                        
                        [self.sprite4 runAction:[CCSpawn actionOne:[CCSequence actions:actionMove,actionMoveDone,nil] two:actionMove2]];
                        return;
                    }
                }
            }
        }
    }
    if (self.sprite4.orientation == 1)
    {
        [self.sprite4 setDisplayFrame:[[spriteKWalkDown frames] objectAtIndex:0]];
    }
    
    if (self.sprite4.orientation == 2)
    {
        [self.sprite4 setDisplayFrame:[[spriteKWalkUp frames] objectAtIndex:0]];
    }
    
    if (self.sprite4.orientation == 3)
    {
        [self.sprite4 setDisplayFrame:[[spriteKWalkRight frames] objectAtIndex:0]];
    }
    
    if (self.sprite4.orientation == 4)
    {
        [self.sprite4 setDisplayFrame:[[spriteKWalkLeft frames] objectAtIndex:0]];
    }
}
-(void) moveupSprite4
{
    CGPoint sprite4Pos = self.sprite4.position;
    self.sprite4.orientation = 2;
    sprite4Pos.y += theHKMap.tileSize.height;
    
    CGPoint tileCoord = [self tileCoordForPosition:sprite4Pos];
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
                    CGPoint tileCoord1 = [self tileCoordForPosition:sprite4.position];
                    int tileGID1 = [self.bgLayer tileGIDAt:tileCoord1];
                    [self.bgLayer removeTileAt:tileCoord1];
                    [self.bgLayer setTileGID:(tileGID1 - 4) at:tileCoord1];
                    
                    
                    if (self.sprite4.orientation == 2)
                    {
                        id actionMove = [CCMoveTo actionWithDuration:0.3 position:sprite4Pos];
                        id actionMove2;
                        if (self.sprite1LastRight)
                        {
                            actionMove2 = [CCAnimate actionWithAnimation:spriteKWalkUp restoreOriginalFrame:NO];
                        }
                        else
                        {
                            actionMove2 = [CCAnimate actionWithAnimation:spriteKWalkUp2 restoreOriginalFrame:NO];
                        }
                        id actionMoveDone = [CCCallFuncN actionWithTarget:self selector:@selector(finishActionSprite4)];
                        
                        [self.sprite4 runAction:[CCSpawn actionOne:[CCSequence actions:actionMove,actionMoveDone,nil] two:actionMove2]];
                        return;
                    }
                }
            }
        }
    }
    if (self.sprite4.orientation == 1)
    {
        [self.sprite4 setDisplayFrame:[[spriteKWalkDown frames] objectAtIndex:0]];
    }
    
    if (self.sprite4.orientation == 2)
    {
        [self.sprite4 setDisplayFrame:[[spriteKWalkUp frames] objectAtIndex:0]];
    }
    
    if (self.sprite4.orientation == 3)
    {
        [self.sprite4 setDisplayFrame:[[spriteKWalkRight frames] objectAtIndex:0]];
    }
    
    if (self.sprite4.orientation == 4)
    {
        [self.sprite4 setDisplayFrame:[[spriteKWalkLeft frames] objectAtIndex:0]];
    }
}
-(void) movedownSprite4
{
    CGPoint sprite4Pos = self.sprite4.position;
    self.sprite4.orientation = 1;
    sprite4Pos.y -= theHKMap.tileSize.height;
    
    CGPoint tileCoord = [self tileCoordForPosition:sprite4Pos];
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
                    CGPoint tileCoord1 = [self tileCoordForPosition:sprite4.position];
                    int tileGID1 = [self.bgLayer tileGIDAt:tileCoord1];
                    [self.bgLayer removeTileAt:tileCoord1];
                    [self.bgLayer setTileGID:(tileGID1 - 4) at:tileCoord1];
                    
                    
                    if (self.sprite4.orientation == 1)
                    {
                        id actionMove = [CCMoveTo actionWithDuration:0.3 position:sprite4Pos];
                        id actionMove2;
                        if (self.sprite1LastRight)
                        {
                            actionMove2 = [CCAnimate actionWithAnimation:spriteKWalkDown restoreOriginalFrame:NO];
                        }
                        else
                        {
                            actionMove2 = [CCAnimate actionWithAnimation:spriteKWalkDown2 restoreOriginalFrame:NO];
                        }
                        id actionMoveDone = [CCCallFuncN actionWithTarget:self selector:@selector(finishActionSprite4)];
                        
                        [self.sprite4 runAction:[CCSpawn actionOne:[CCSequence actions:actionMove,actionMoveDone,nil] two:actionMove2]];
                        return;
                    }
                }
            }
        }
    }
    if (self.sprite4.orientation == 1)
    {
        [self.sprite4 setDisplayFrame:[[spriteKWalkDown frames] objectAtIndex:0]];
    }
    
    if (self.sprite4.orientation == 2)
    {
        [self.sprite4 setDisplayFrame:[[spriteKWalkUp frames] objectAtIndex:0]];
    }
    
    if (self.sprite4.orientation == 3)
    {
        [self.sprite4 setDisplayFrame:[[spriteKWalkRight frames] objectAtIndex:0]];
    }
    
    if (self.sprite4.orientation == 4)
    {
        [self.sprite4 setDisplayFrame:[[spriteKWalkLeft frames] objectAtIndex:0]];
    }
}

-(void) finishActionSprite4
{
    if (self.sprite4.orientation == 1)
    {
        [self.sprite4 setDisplayFrame:[[spriteKWalkDown frames] objectAtIndex:0]];
    }
    
    if (self.sprite4.orientation == 2)
    {
        [self.sprite4 setDisplayFrame:[[spriteKWalkUp frames] objectAtIndex:0]];
    }
    
    if (self.sprite4.orientation == 3)
    {
        [self.sprite4 setDisplayFrame:[[spriteKWalkRight frames] objectAtIndex:0]];
    }
    
    if (self.sprite4.orientation == 4)
    {
        [self.sprite4 setDisplayFrame:[[spriteKWalkLeft frames] objectAtIndex:0]];
    }
    self.hero.sprite4position = self.sprite4.position;
}


-(void)updateSprite5
{
    CGSize screenSize = [[CCDirector sharedDirector] winSize];
    int x = self.hero.position.x;
    int y = self.hero.position.y;
    
    int p = self.sprite5.position.x;
    int q = self.sprite5.position.y;
    
    int diffx = abs(x-p);
    int diffy = abs(y-q);
    
    if ((diffx > screenSize.width/1.5) || (diffy > screenSize.height/1.5))
    {
        return;
    }
    
    
    int rand = arc4random()%14;
    if (self.spriteOddIsTalking)
    {
        return;
    }
    if (rand == 1)
    {
        [self moveleftSprite5];
    }
    if (rand == 2)
    {
        [self moverightSprite5];
    }
    if (rand == 3)
    {
        [self moveupSprite5];
    }
    if (rand == 4)
    {
        [self movedownSprite5];
    }
    return;
}

-(void) moveleftSprite5
{
    CGPoint sprite5Pos = self.sprite5.position;
    self.sprite5.orientation = 4;
    sprite5Pos.x -= theHKMap.tileSize.width;
    
    CGPoint tileCoord = [self tileCoordForPosition:sprite5Pos];
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
                    CGPoint tileCoord1 = [self tileCoordForPosition:sprite5.position];
                    int tileGID1 = [self.bgLayer tileGIDAt:tileCoord1];
                    [self.bgLayer removeTileAt:tileCoord1];
                    [self.bgLayer setTileGID:(tileGID1 - 5) at:tileCoord1];
                    
                    
                    if (self.sprite5.orientation == 4)
                    {
                        id actionMove = [CCMoveTo actionWithDuration:0.3 position:sprite5Pos];
                        id actionMove2 = [CCAnimate actionWithAnimation:spriteKWalkLeft restoreOriginalFrame:NO];
                        
                        id actionMoveDone = [CCCallFuncN actionWithTarget:self selector:@selector(finishActionSprite5)];
                        
                        [self.sprite5 runAction:[CCSpawn actionOne:[CCSequence actions:actionMove,actionMoveDone,nil] two:actionMove2]];
                        return;
                    }
                }
            }
        }
    }
    if (self.sprite5.orientation == 1)
    {
        [self.sprite5 setDisplayFrame:[[spriteKWalkDown frames] objectAtIndex:0]];
    }
    
    if (self.sprite5.orientation == 2)
    {
        [self.sprite5 setDisplayFrame:[[spriteKWalkUp frames] objectAtIndex:0]];
    }
    
    if (self.sprite5.orientation == 3)
    {
        [self.sprite5 setDisplayFrame:[[spriteKWalkRight frames] objectAtIndex:0]];
    }
    
    if (self.sprite5.orientation == 4)
    {
        [self.sprite5 setDisplayFrame:[[spriteKWalkLeft frames] objectAtIndex:0]];
    }
}
-(void) moverightSprite5
{
    CGPoint sprite5Pos = self.sprite5.position;
    self.sprite5.orientation = 3;
    sprite5Pos.x += theHKMap.tileSize.width;
    
    CGPoint tileCoord = [self tileCoordForPosition:sprite5Pos];
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
                    CGPoint tileCoord1 = [self tileCoordForPosition:sprite5.position];
                    int tileGID1 = [self.bgLayer tileGIDAt:tileCoord1];
                    [self.bgLayer removeTileAt:tileCoord1];
                    [self.bgLayer setTileGID:(tileGID1 - 5) at:tileCoord1];
                    
                    
                    if (self.sprite5.orientation == 3)
                    {
                        id actionMove = [CCMoveTo actionWithDuration:0.3 position:sprite5Pos];
                        id actionMove2 = [CCAnimate actionWithAnimation:spriteKWalkRight restoreOriginalFrame:NO];
                        
                        id actionMoveDone = [CCCallFuncN actionWithTarget:self selector:@selector(finishActionSprite5)];
                        
                        [self.sprite5 runAction:[CCSpawn actionOne:[CCSequence actions:actionMove,actionMoveDone,nil] two:actionMove2]];
                        return;
                    }
                }
            }
        }
    }
    if (self.sprite5.orientation == 1)
    {
        [self.sprite5 setDisplayFrame:[[spriteKWalkDown frames] objectAtIndex:0]];
    }
    
    if (self.sprite5.orientation == 2)
    {
        [self.sprite5 setDisplayFrame:[[spriteKWalkUp frames] objectAtIndex:0]];
    }
    
    if (self.sprite5.orientation == 3)
    {
        [self.sprite5 setDisplayFrame:[[spriteKWalkRight frames] objectAtIndex:0]];
    }
    
    if (self.sprite5.orientation == 4)
    {
        [self.sprite5 setDisplayFrame:[[spriteKWalkLeft frames] objectAtIndex:0]];
    }
}
-(void) moveupSprite5
{
    CGPoint sprite5Pos = self.sprite5.position;
    self.sprite5.orientation = 2;
    sprite5Pos.y += theHKMap.tileSize.height;
    
    CGPoint tileCoord = [self tileCoordForPosition:sprite5Pos];
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
                    CGPoint tileCoord1 = [self tileCoordForPosition:sprite5.position];
                    int tileGID1 = [self.bgLayer tileGIDAt:tileCoord1];
                    [self.bgLayer removeTileAt:tileCoord1];
                    [self.bgLayer setTileGID:(tileGID1 - 5) at:tileCoord1];
                    
                    
                    if (self.sprite5.orientation == 2)
                    {
                        id actionMove = [CCMoveTo actionWithDuration:0.3 position:sprite5Pos];
                        id actionMove2;
                        if (self.sprite1LastRight)
                        {
                            actionMove2 = [CCAnimate actionWithAnimation:spriteKWalkUp restoreOriginalFrame:NO];
                        }
                        else
                        {
                            actionMove2 = [CCAnimate actionWithAnimation:spriteKWalkUp2 restoreOriginalFrame:NO];
                        }
                        id actionMoveDone = [CCCallFuncN actionWithTarget:self selector:@selector(finishActionSprite5)];
                        
                        [self.sprite5 runAction:[CCSpawn actionOne:[CCSequence actions:actionMove,actionMoveDone,nil] two:actionMove2]];
                        return;
                    }
                }
            }
        }
    }
    if (self.sprite5.orientation == 1)
    {
        [self.sprite5 setDisplayFrame:[[spriteKWalkDown frames] objectAtIndex:0]];
    }
    
    if (self.sprite5.orientation == 2)
    {
        [self.sprite5 setDisplayFrame:[[spriteKWalkUp frames] objectAtIndex:0]];
    }
    
    if (self.sprite5.orientation == 3)
    {
        [self.sprite5 setDisplayFrame:[[spriteKWalkRight frames] objectAtIndex:0]];
    }
    
    if (self.sprite5.orientation == 4)
    {
        [self.sprite5 setDisplayFrame:[[spriteKWalkLeft frames] objectAtIndex:0]];
    }
}
-(void) movedownSprite5
{
    CGPoint sprite5Pos = self.sprite5.position;
    self.sprite5.orientation = 1;
    sprite5Pos.y -= theHKMap.tileSize.height;
    
    CGPoint tileCoord = [self tileCoordForPosition:sprite5Pos];
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
                    CGPoint tileCoord1 = [self tileCoordForPosition:sprite5.position];
                    int tileGID1 = [self.bgLayer tileGIDAt:tileCoord1];
                    [self.bgLayer removeTileAt:tileCoord1];
                    [self.bgLayer setTileGID:(tileGID1 - 5) at:tileCoord1];
                    
                    
                    if (self.sprite5.orientation == 1)
                    {
                        id actionMove = [CCMoveTo actionWithDuration:0.3 position:sprite5Pos];
                        id actionMove2;
                        if (self.sprite1LastRight)
                        {
                            actionMove2 = [CCAnimate actionWithAnimation:spriteKWalkDown restoreOriginalFrame:NO];
                        }
                        else
                        {
                            actionMove2 = [CCAnimate actionWithAnimation:spriteKWalkDown2 restoreOriginalFrame:NO];
                        }
                        id actionMoveDone = [CCCallFuncN actionWithTarget:self selector:@selector(finishActionSprite5)];
                        
                        [self.sprite5 runAction:[CCSpawn actionOne:[CCSequence actions:actionMove,actionMoveDone,nil] two:actionMove2]];
                        return;
                    }
                }
            }
        }
    }
    if (self.sprite5.orientation == 1)
    {
        [self.sprite5 setDisplayFrame:[[spriteKWalkDown frames] objectAtIndex:0]];
    }
    
    if (self.sprite5.orientation == 2)
    {
        [self.sprite5 setDisplayFrame:[[spriteKWalkUp frames] objectAtIndex:0]];
    }
    
    if (self.sprite5.orientation == 3)
    {
        [self.sprite5 setDisplayFrame:[[spriteKWalkRight frames] objectAtIndex:0]];
    }
    
    if (self.sprite5.orientation == 4)
    {
        [self.sprite5 setDisplayFrame:[[spriteKWalkLeft frames] objectAtIndex:0]];
    }
}

-(void) finishActionSprite5
{
    if (self.sprite5.orientation == 1)
    {
        [self.sprite5 setDisplayFrame:[[spriteKWalkDown frames] objectAtIndex:0]];
    }
    
    if (self.sprite5.orientation == 2)
    {
        [self.sprite5 setDisplayFrame:[[spriteKWalkUp frames] objectAtIndex:0]];
    }
    
    if (self.sprite5.orientation == 3)
    {
        [self.sprite5 setDisplayFrame:[[spriteKWalkRight frames] objectAtIndex:0]];
    }
    
    if (self.sprite5.orientation == 4)
    {
        [self.sprite5 setDisplayFrame:[[spriteKWalkLeft frames] objectAtIndex:0]];
    }
    self.hero.sprite5position = self.sprite5.position;
}


-(void)updateSprite6
{
    CGSize screenSize = [[CCDirector sharedDirector] winSize];
    int x = self.hero.position.x;
    int y = self.hero.position.y;
    
    int p = self.sprite6.position.x;
    int q = self.sprite6.position.y;
    
    int diffx = abs(x-p);
    int diffy = abs(y-q);
    
    if ((diffx > screenSize.width/1.5) || (diffy > screenSize.height/1.5))
    {
        return;
    }
    
    
    int rand = arc4random()%14;
    if (self.spriteEvenIsTalking)
    {
        return;
    }
    if (rand == 1)
    {
        [self moveleftSprite6];
    }
    if (rand == 2)
    {
        [self moverightSprite6];
    }
    if (rand == 3)
    {
        [self moveupSprite6];
    }
    if (rand == 4)
    {
        [self movedownSprite6];
    }
    return;
}

-(void) moveleftSprite6
{
    CGPoint sprite6Pos = self.sprite6.position;
    self.sprite6.orientation = 4;
    sprite6Pos.x -= theHKMap.tileSize.width;
    
    CGPoint tileCoord = [self tileCoordForPosition:sprite6Pos];
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
                    CGPoint tileCoord1 = [self tileCoordForPosition:sprite6.position];
                    int tileGID1 = [self.bgLayer tileGIDAt:tileCoord1];
                    [self.bgLayer removeTileAt:tileCoord1];
                    [self.bgLayer setTileGID:(tileGID1 - 6) at:tileCoord1];
                    
                    
                    if (self.sprite6.orientation == 4)
                    {
                        id actionMove = [CCMoveTo actionWithDuration:0.3 position:sprite6Pos];
                        id actionMove2 = [CCAnimate actionWithAnimation:spriteDWalkLeft restoreOriginalFrame:NO];
                        
                        id actionMoveDone = [CCCallFuncN actionWithTarget:self selector:@selector(finishActionSprite6)];
                        
                        [self.sprite6 runAction:[CCSpawn actionOne:[CCSequence actions:actionMove,actionMoveDone,nil] two:actionMove2]];
                        return;
                    }
                }
            }
        }
    }
    if (self.sprite6.orientation == 1)
    {
        [self.sprite6 setDisplayFrame:[[spriteDWalkDown frames] objectAtIndex:0]];
    }
    
    if (self.sprite6.orientation == 2)
    {
        [self.sprite6 setDisplayFrame:[[spriteDWalkUp frames] objectAtIndex:0]];
    }
    
    if (self.sprite6.orientation == 3)
    {
        [self.sprite6 setDisplayFrame:[[spriteDWalkRight frames] objectAtIndex:0]];
    }
    
    if (self.sprite6.orientation == 4)
    {
        [self.sprite6 setDisplayFrame:[[spriteDWalkLeft frames] objectAtIndex:0]];
    }
}
-(void) moverightSprite6
{
    CGPoint sprite6Pos = self.sprite6.position;
    self.sprite6.orientation = 3;
    sprite6Pos.x += theHKMap.tileSize.width;
    
    CGPoint tileCoord = [self tileCoordForPosition:sprite6Pos];
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
                    CGPoint tileCoord1 = [self tileCoordForPosition:sprite6.position];
                    int tileGID1 = [self.bgLayer tileGIDAt:tileCoord1];
                    [self.bgLayer removeTileAt:tileCoord1];
                    [self.bgLayer setTileGID:(tileGID1 - 6) at:tileCoord1];
                    
                    
                    if (self.sprite6.orientation == 3)
                    {
                        id actionMove = [CCMoveTo actionWithDuration:0.3 position:sprite6Pos];
                        id actionMove2 = [CCAnimate actionWithAnimation:spriteDWalkRight restoreOriginalFrame:NO];
                        
                        id actionMoveDone = [CCCallFuncN actionWithTarget:self selector:@selector(finishActionSprite6)];
                        
                        [self.sprite6 runAction:[CCSpawn actionOne:[CCSequence actions:actionMove,actionMoveDone,nil] two:actionMove2]];
                        return;
                    }
                }
            }
        }
    }
    if (self.sprite6.orientation == 1)
    {
        [self.sprite6 setDisplayFrame:[[spriteDWalkDown frames] objectAtIndex:0]];
    }
    
    if (self.sprite6.orientation == 2)
    {
        [self.sprite6 setDisplayFrame:[[spriteDWalkUp frames] objectAtIndex:0]];
    }
    
    if (self.sprite6.orientation == 3)
    {
        [self.sprite6 setDisplayFrame:[[spriteDWalkRight frames] objectAtIndex:0]];
    }
    
    if (self.sprite6.orientation == 4)
    {
        [self.sprite6 setDisplayFrame:[[spriteDWalkLeft frames] objectAtIndex:0]];
    }
}
-(void) moveupSprite6
{
    CGPoint sprite6Pos = self.sprite6.position;
    self.sprite6.orientation = 2;
    sprite6Pos.y += theHKMap.tileSize.height;
    
    CGPoint tileCoord = [self tileCoordForPosition:sprite6Pos];
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
                    CGPoint tileCoord1 = [self tileCoordForPosition:sprite6.position];
                    int tileGID1 = [self.bgLayer tileGIDAt:tileCoord1];
                    [self.bgLayer removeTileAt:tileCoord1];
                    [self.bgLayer setTileGID:(tileGID1 - 6) at:tileCoord1];
                    
                    
                    if (self.sprite6.orientation == 2)
                    {
                        id actionMove = [CCMoveTo actionWithDuration:0.3 position:sprite6Pos];
                        id actionMove2;
                        if (self.sprite1LastRight)
                        {
                            actionMove2 = [CCAnimate actionWithAnimation:spriteDWalkUp restoreOriginalFrame:NO];
                        }
                        else
                        {
                            actionMove2 = [CCAnimate actionWithAnimation:spriteDWalkUp2 restoreOriginalFrame:NO];
                        }
                        id actionMoveDone = [CCCallFuncN actionWithTarget:self selector:@selector(finishActionSprite6)];
                        
                        [self.sprite6 runAction:[CCSpawn actionOne:[CCSequence actions:actionMove,actionMoveDone,nil] two:actionMove2]];
                        return;
                    }
                }
            }
        }
    }
    if (self.sprite6.orientation == 1)
    {
        [self.sprite6 setDisplayFrame:[[spriteDWalkDown frames] objectAtIndex:0]];
    }
    
    if (self.sprite6.orientation == 2)
    {
        [self.sprite6 setDisplayFrame:[[spriteDWalkUp frames] objectAtIndex:0]];
    }
    
    if (self.sprite6.orientation == 3)
    {
        [self.sprite6 setDisplayFrame:[[spriteDWalkRight frames] objectAtIndex:0]];
    }
    
    if (self.sprite6.orientation == 4)
    {
        [self.sprite6 setDisplayFrame:[[spriteDWalkLeft frames] objectAtIndex:0]];
    }
}
-(void) movedownSprite6
{
    CGPoint sprite6Pos = self.sprite6.position;
    self.sprite6.orientation = 1;
    sprite6Pos.y -= theHKMap.tileSize.height;
    
    CGPoint tileCoord = [self tileCoordForPosition:sprite6Pos];
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
                    CGPoint tileCoord1 = [self tileCoordForPosition:sprite6.position];
                    int tileGID1 = [self.bgLayer tileGIDAt:tileCoord1];
                    [self.bgLayer removeTileAt:tileCoord1];
                    [self.bgLayer setTileGID:(tileGID1 - 6) at:tileCoord1];
                    
                    
                    if (self.sprite6.orientation == 1)
                    {
                        id actionMove = [CCMoveTo actionWithDuration:0.3 position:sprite6Pos];
                        id actionMove2;
                        if (self.sprite1LastRight)
                        {
                            actionMove2 = [CCAnimate actionWithAnimation:spriteDWalkDown restoreOriginalFrame:NO];
                        }
                        else
                        {
                            actionMove2 = [CCAnimate actionWithAnimation:spriteDWalkDown2 restoreOriginalFrame:NO];
                        }
                        id actionMoveDone = [CCCallFuncN actionWithTarget:self selector:@selector(finishActionSprite6)];
                        
                        [self.sprite6 runAction:[CCSpawn actionOne:[CCSequence actions:actionMove,actionMoveDone,nil] two:actionMove2]];
                        return;
                    }
                }
            }
        }
    }
    if (self.sprite6.orientation == 1)
    {
        [self.sprite6 setDisplayFrame:[[spriteDWalkDown frames] objectAtIndex:0]];
    }
    
    if (self.sprite6.orientation == 2)
    {
        [self.sprite6 setDisplayFrame:[[spriteDWalkUp frames] objectAtIndex:0]];
    }
    
    if (self.sprite6.orientation == 3)
    {
        [self.sprite6 setDisplayFrame:[[spriteDWalkRight frames] objectAtIndex:0]];
    }
    
    if (self.sprite6.orientation == 4)
    {
        [self.sprite6 setDisplayFrame:[[spriteDWalkLeft frames] objectAtIndex:0]];
    }
}

-(void) finishActionSprite6
{
    if (self.sprite6.orientation == 1)
    {
        [self.sprite6 setDisplayFrame:[[spriteDWalkDown frames] objectAtIndex:0]];
    }
    
    if (self.sprite6.orientation == 2)
    {
        [self.sprite6 setDisplayFrame:[[spriteDWalkUp frames] objectAtIndex:0]];
    }
    
    if (self.sprite6.orientation == 3)
    {
        [self.sprite6 setDisplayFrame:[[spriteDWalkRight frames] objectAtIndex:0]];
    }
    
    if (self.sprite6.orientation == 4)
    {
        [self.sprite6 setDisplayFrame:[[spriteDWalkLeft frames] objectAtIndex:0]];
    }
    self.hero.sprite6position = self.sprite6.position;
}


-(void)updateSprite7
{
    CGSize screenSize = [[CCDirector sharedDirector] winSize];
    int x = self.hero.position.x;
    int y = self.hero.position.y;
    
    int p = self.sprite7.position.x;
    int q = self.sprite7.position.y;
    
    int diffx = abs(x-p);
    int diffy = abs(y-q);
    
    if ((diffx > screenSize.width/1.5) || (diffy > screenSize.height/1.5))
    {
        return;
    }
    
    
    int rand = arc4random()%14;
    if (self.spriteOddIsTalking)
    {
        return;
    }
    if (rand == 1)
    {
        [self moveleftSprite7];
    }
    if (rand == 2)
    {
        [self moverightSprite7];
    }
    if (rand == 3)
    {
        [self moveupSprite7];
    }
    if (rand == 4)
    {
        [self movedownSprite7];
    }
    return;
}

-(void) moveleftSprite7
{
    CGPoint sprite7Pos = self.sprite7.position;
    self.sprite7.orientation = 4;
    sprite7Pos.x -= theHKMap.tileSize.width;
    
    CGPoint tileCoord = [self tileCoordForPosition:sprite7Pos];
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
                    CGPoint tileCoord1 = [self tileCoordForPosition:sprite7.position];
                    int tileGID1 = [self.bgLayer tileGIDAt:tileCoord1];
                    [self.bgLayer removeTileAt:tileCoord1];
                    [self.bgLayer setTileGID:(tileGID1 - 7) at:tileCoord1];
                    
                    
                    if (self.sprite7.orientation == 4)
                    {
                        id actionMove = [CCMoveTo actionWithDuration:0.3 position:sprite7Pos];
                        id actionMove2 = [CCAnimate actionWithAnimation:spriteXWalkLeft restoreOriginalFrame:NO];
                        
                        id actionMoveDone = [CCCallFuncN actionWithTarget:self selector:@selector(finishActionSprite7)];
                        
                        [self.sprite7 runAction:[CCSpawn actionOne:[CCSequence actions:actionMove,actionMoveDone,nil] two:actionMove2]];
                        return;
                    }
                }
            }
        }
    }
    if (self.sprite7.orientation == 1)
    {
        [self.sprite7 setDisplayFrame:[[spriteXWalkDown frames] objectAtIndex:0]];
    }
    
    if (self.sprite7.orientation == 2)
    {
        [self.sprite7 setDisplayFrame:[[spriteXWalkUp frames] objectAtIndex:0]];
    }
    
    if (self.sprite7.orientation == 3)
    {
        [self.sprite7 setDisplayFrame:[[spriteXWalkRight frames] objectAtIndex:0]];
    }
    
    if (self.sprite7.orientation == 4)
    {
        [self.sprite7 setDisplayFrame:[[spriteXWalkLeft frames] objectAtIndex:0]];
    }
}
-(void) moverightSprite7
{
    CGPoint sprite7Pos = self.sprite7.position;
    self.sprite7.orientation = 3;
    sprite7Pos.x += theHKMap.tileSize.width;
    
    CGPoint tileCoord = [self tileCoordForPosition:sprite7Pos];
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
                    CGPoint tileCoord1 = [self tileCoordForPosition:sprite7.position];
                    int tileGID1 = [self.bgLayer tileGIDAt:tileCoord1];
                    [self.bgLayer removeTileAt:tileCoord1];
                    [self.bgLayer setTileGID:(tileGID1 - 7) at:tileCoord1];
                    
                    
                    if (self.sprite7.orientation == 3)
                    {
                        id actionMove = [CCMoveTo actionWithDuration:0.3 position:sprite7Pos];
                        id actionMove2 = [CCAnimate actionWithAnimation:spriteXWalkRight restoreOriginalFrame:NO];
                        
                        id actionMoveDone = [CCCallFuncN actionWithTarget:self selector:@selector(finishActionSprite7)];
                        
                        [self.sprite7 runAction:[CCSpawn actionOne:[CCSequence actions:actionMove,actionMoveDone,nil] two:actionMove2]];
                        return;
                    }
                }
            }
        }
    }
    if (self.sprite7.orientation == 1)
    {
        [self.sprite7 setDisplayFrame:[[spriteXWalkDown frames] objectAtIndex:0]];
    }
    
    if (self.sprite7.orientation == 2)
    {
        [self.sprite7 setDisplayFrame:[[spriteXWalkUp frames] objectAtIndex:0]];
    }
    
    if (self.sprite7.orientation == 3)
    {
        [self.sprite7 setDisplayFrame:[[spriteXWalkRight frames] objectAtIndex:0]];
    }
    
    if (self.sprite7.orientation == 4)
    {
        [self.sprite7 setDisplayFrame:[[spriteXWalkLeft frames] objectAtIndex:0]];
    }
}
-(void) moveupSprite7
{
    CGPoint sprite7Pos = self.sprite7.position;
    self.sprite7.orientation = 2;
    sprite7Pos.y += theHKMap.tileSize.height;
    
    CGPoint tileCoord = [self tileCoordForPosition:sprite7Pos];
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
                    CGPoint tileCoord1 = [self tileCoordForPosition:sprite7.position];
                    int tileGID1 = [self.bgLayer tileGIDAt:tileCoord1];
                    [self.bgLayer removeTileAt:tileCoord1];
                    [self.bgLayer setTileGID:(tileGID1 - 7) at:tileCoord1];
                    
                    
                    if (self.sprite7.orientation == 2)
                    {
                        id actionMove = [CCMoveTo actionWithDuration:0.3 position:sprite7Pos];
                        id actionMove2;
                        if (self.sprite1LastRight)
                        {
                            actionMove2 = [CCAnimate actionWithAnimation:spriteXWalkUp restoreOriginalFrame:NO];
                        }
                        else
                        {
                            actionMove2 = [CCAnimate actionWithAnimation:spriteXWalkUp2 restoreOriginalFrame:NO];
                        }
                        id actionMoveDone = [CCCallFuncN actionWithTarget:self selector:@selector(finishActionSprite7)];
                        
                        [self.sprite7 runAction:[CCSpawn actionOne:[CCSequence actions:actionMove,actionMoveDone,nil] two:actionMove2]];
                        return;
                    }
                }
            }
        }
    }
    if (self.sprite7.orientation == 1)
    {
        [self.sprite7 setDisplayFrame:[[spriteXWalkDown frames] objectAtIndex:0]];
    }
    
    if (self.sprite7.orientation == 2)
    {
        [self.sprite7 setDisplayFrame:[[spriteXWalkUp frames] objectAtIndex:0]];
    }
    
    if (self.sprite7.orientation == 3)
    {
        [self.sprite7 setDisplayFrame:[[spriteXWalkRight frames] objectAtIndex:0]];
    }
    
    if (self.sprite7.orientation == 4)
    {
        [self.sprite7 setDisplayFrame:[[spriteXWalkLeft frames] objectAtIndex:0]];
    }
}
-(void) movedownSprite7
{
    CGPoint sprite7Pos = self.sprite7.position;
    self.sprite7.orientation = 1;
    sprite7Pos.y -= theHKMap.tileSize.height;
    
    CGPoint tileCoord = [self tileCoordForPosition:sprite7Pos];
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
                    CGPoint tileCoord1 = [self tileCoordForPosition:sprite7.position];
                    int tileGID1 = [self.bgLayer tileGIDAt:tileCoord1];
                    [self.bgLayer removeTileAt:tileCoord1];
                    [self.bgLayer setTileGID:(tileGID1 - 7) at:tileCoord1];
                    
                    
                    if (self.sprite7.orientation == 1)
                    {
                        id actionMove = [CCMoveTo actionWithDuration:0.3 position:sprite7Pos];
                        id actionMove2;
                        if (self.sprite1LastRight)
                        {
                            actionMove2 = [CCAnimate actionWithAnimation:spriteXWalkDown restoreOriginalFrame:NO];
                        }
                        else
                        {
                            actionMove2 = [CCAnimate actionWithAnimation:spriteXWalkDown2 restoreOriginalFrame:NO];
                        }
                        id actionMoveDone = [CCCallFuncN actionWithTarget:self selector:@selector(finishActionSprite7)];
                        
                        [self.sprite7 runAction:[CCSpawn actionOne:[CCSequence actions:actionMove,actionMoveDone,nil] two:actionMove2]];
                        return;
                    }
                }
            }
        }
    }
    if (self.sprite7.orientation == 1)
    {
        [self.sprite7 setDisplayFrame:[[spriteXWalkDown frames] objectAtIndex:0]];
    }
    
    if (self.sprite7.orientation == 2)
    {
        [self.sprite7 setDisplayFrame:[[spriteXWalkUp frames] objectAtIndex:0]];
    }
    
    if (self.sprite7.orientation == 3)
    {
        [self.sprite7 setDisplayFrame:[[spriteXWalkRight frames] objectAtIndex:0]];
    }
    
    if (self.sprite7.orientation == 4)
    {
        [self.sprite7 setDisplayFrame:[[spriteXWalkLeft frames] objectAtIndex:0]];
    }
}

-(void) finishActionSprite7
{
    if (self.sprite7.orientation == 1)
    {
        [self.sprite7 setDisplayFrame:[[spriteKWalkDown frames] objectAtIndex:0]];
    }
    
    if (self.sprite7.orientation == 2)
    {
        [self.sprite7 setDisplayFrame:[[spriteKWalkUp frames] objectAtIndex:0]];
    }
    
    if (self.sprite7.orientation == 3)
    {
        [self.sprite7 setDisplayFrame:[[spriteKWalkRight frames] objectAtIndex:0]];
    }
    
    if (self.sprite7.orientation == 4)
    {
        [self.sprite7 setDisplayFrame:[[spriteKWalkLeft frames] objectAtIndex:0]];
    }
    self.hero.sprite7position = self.sprite7.position;
}


-(void)updateSprite8
{
    CGSize screenSize = [[CCDirector sharedDirector] winSize];
    int x = self.hero.position.x;
    int y = self.hero.position.y;
    
    int p = self.sprite8.position.x;
    int q = self.sprite8.position.y;
    
    int diffx = abs(x-p);
    int diffy = abs(y-q);
    
    if ((diffx > screenSize.width/1.5) || (diffy > screenSize.height/1.5))
    {
        return;
    }
    
    
    int rand = arc4random()%14;
    if (self.spriteEvenIsTalking)
    {
        return;
    }
    if (rand == 1)
    {
        [self moveleftSprite8];
    }
    if (rand == 2)
    {
        [self moverightSprite8];
    }
    if (rand == 3)
    {
        [self moveupSprite8];
    }
    if (rand == 4)
    {
        [self movedownSprite8];
    }
    return;
}

-(void) moveleftSprite8
{
    CGPoint sprite8Pos = self.sprite8.position;
    self.sprite8.orientation = 4;
    sprite8Pos.x -= theHKMap.tileSize.width;
    
    CGPoint tileCoord = [self tileCoordForPosition:sprite8Pos];
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
                    CGPoint tileCoord1 = [self tileCoordForPosition:sprite8.position];
                    int tileGID1 = [self.bgLayer tileGIDAt:tileCoord1];
                    [self.bgLayer removeTileAt:tileCoord1];
                    [self.bgLayer setTileGID:(tileGID1 - 8) at:tileCoord1];
                    
                    
                    if (self.sprite8.orientation == 4)
                    {
                        id actionMove = [CCMoveTo actionWithDuration:0.3 position:sprite8Pos];
                        id actionMove2 = [CCAnimate actionWithAnimation:spriteNWalkLeft restoreOriginalFrame:NO];
                        
                        id actionMoveDone = [CCCallFuncN actionWithTarget:self selector:@selector(finishActionSprite8)];
                        
                        [self.sprite8 runAction:[CCSpawn actionOne:[CCSequence actions:actionMove,actionMoveDone,nil] two:actionMove2]];
                        return;
                    }
                }
            }
        }
    }
    if (self.sprite8.orientation == 1)
    {
        [self.sprite8 setDisplayFrame:[[spriteNWalkDown frames] objectAtIndex:0]];
    }
    
    if (self.sprite8.orientation == 2)
    {
        [self.sprite8 setDisplayFrame:[[spriteNWalkUp frames] objectAtIndex:0]];
    }
    
    if (self.sprite8.orientation == 3)
    {
        [self.sprite8 setDisplayFrame:[[spriteNWalkRight frames] objectAtIndex:0]];
    }
    
    if (self.sprite8.orientation == 4)
    {
        [self.sprite8 setDisplayFrame:[[spriteNWalkLeft frames] objectAtIndex:0]];
    }
}
-(void) moverightSprite8
{
    CGPoint sprite8Pos = self.sprite8.position;
    self.sprite8.orientation = 3;
    sprite8Pos.x += theHKMap.tileSize.width;
    
    CGPoint tileCoord = [self tileCoordForPosition:sprite8Pos];
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
                    CGPoint tileCoord1 = [self tileCoordForPosition:sprite8.position];
                    int tileGID1 = [self.bgLayer tileGIDAt:tileCoord1];
                    [self.bgLayer removeTileAt:tileCoord1];
                    [self.bgLayer setTileGID:(tileGID1 - 8) at:tileCoord1];
                    
                    
                    if (self.sprite8.orientation == 3)
                    {
                        id actionMove = [CCMoveTo actionWithDuration:0.3 position:sprite8Pos];
                        id actionMove2 = [CCAnimate actionWithAnimation:spriteNWalkRight restoreOriginalFrame:NO];
                        
                        id actionMoveDone = [CCCallFuncN actionWithTarget:self selector:@selector(finishActionSprite8)];
                        
                        [self.sprite8 runAction:[CCSpawn actionOne:[CCSequence actions:actionMove,actionMoveDone,nil] two:actionMove2]];
                        return;
                    }
                }
            }
        }
    }
    if (self.sprite8.orientation == 1)
    {
        [self.sprite8 setDisplayFrame:[[spriteNWalkDown frames] objectAtIndex:0]];
    }
    
    if (self.sprite8.orientation == 2)
    {
        [self.sprite8 setDisplayFrame:[[spriteNWalkUp frames] objectAtIndex:0]];
    }
    
    if (self.sprite8.orientation == 3)
    {
        [self.sprite8 setDisplayFrame:[[spriteNWalkRight frames] objectAtIndex:0]];
    }
    
    if (self.sprite8.orientation == 4)
    {
        [self.sprite8 setDisplayFrame:[[spriteNWalkLeft frames] objectAtIndex:0]];
    }
}
-(void) moveupSprite8
{
    CGPoint sprite8Pos = self.sprite8.position;
    self.sprite8.orientation = 2;
    sprite8Pos.y += theHKMap.tileSize.height;
    
    CGPoint tileCoord = [self tileCoordForPosition:sprite8Pos];
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
                    CGPoint tileCoord1 = [self tileCoordForPosition:sprite8.position];
                    int tileGID1 = [self.bgLayer tileGIDAt:tileCoord1];
                    [self.bgLayer removeTileAt:tileCoord1];
                    [self.bgLayer setTileGID:(tileGID1 - 8) at:tileCoord1];
                    
                    
                    if (self.sprite8.orientation == 2)
                    {
                        id actionMove = [CCMoveTo actionWithDuration:0.3 position:sprite8Pos];
                        id actionMove2;
                        if (self.sprite1LastRight)
                        {
                            actionMove2 = [CCAnimate actionWithAnimation:spriteNWalkUp restoreOriginalFrame:NO];
                        }
                        else
                        {
                            actionMove2 = [CCAnimate actionWithAnimation:spriteNWalkUp2 restoreOriginalFrame:NO];
                        }
                        id actionMoveDone = [CCCallFuncN actionWithTarget:self selector:@selector(finishActionSprite8)];
                        
                        [self.sprite8 runAction:[CCSpawn actionOne:[CCSequence actions:actionMove,actionMoveDone,nil] two:actionMove2]];
                        return;
                    }
                }
            }
        }
    }
    if (self.sprite8.orientation == 1)
    {
        [self.sprite8 setDisplayFrame:[[spriteNWalkDown frames] objectAtIndex:0]];
    }
    
    if (self.sprite8.orientation == 2)
    {
        [self.sprite8 setDisplayFrame:[[spriteNWalkUp frames] objectAtIndex:0]];
    }
    
    if (self.sprite8.orientation == 3)
    {
        [self.sprite8 setDisplayFrame:[[spriteNWalkRight frames] objectAtIndex:0]];
    }
    
    if (self.sprite8.orientation == 4)
    {
        [self.sprite8 setDisplayFrame:[[spriteNWalkLeft frames] objectAtIndex:0]];
    }
}
-(void) movedownSprite8
{
    CGPoint sprite8Pos = self.sprite8.position;
    self.sprite8.orientation = 1;
    sprite8Pos.y -= theHKMap.tileSize.height;
    
    CGPoint tileCoord = [self tileCoordForPosition:sprite8Pos];
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
                    CGPoint tileCoord1 = [self tileCoordForPosition:sprite8.position];
                    int tileGID1 = [self.bgLayer tileGIDAt:tileCoord1];
                    [self.bgLayer removeTileAt:tileCoord1];
                    [self.bgLayer setTileGID:(tileGID1 - 8) at:tileCoord1];
                    
                    
                    if (self.sprite8.orientation == 1)
                    {
                        id actionMove = [CCMoveTo actionWithDuration:0.3 position:sprite8Pos];
                        id actionMove2;
                        if (self.sprite1LastRight)
                        {
                            actionMove2 = [CCAnimate actionWithAnimation:spriteNWalkDown restoreOriginalFrame:NO];
                        }
                        else
                        {
                            actionMove2 = [CCAnimate actionWithAnimation:spriteNWalkDown2 restoreOriginalFrame:NO];
                        }
                        id actionMoveDone = [CCCallFuncN actionWithTarget:self selector:@selector(finishActionSprite8)];
                        
                        [self.sprite8 runAction:[CCSpawn actionOne:[CCSequence actions:actionMove,actionMoveDone,nil] two:actionMove2]];
                        return;
                    }
                }
            }
        }
    }
    if (self.sprite8.orientation == 1)
    {
        [self.sprite8 setDisplayFrame:[[spriteNWalkDown frames] objectAtIndex:0]];
    }
    
    if (self.sprite8.orientation == 2)
    {
        [self.sprite8 setDisplayFrame:[[spriteNWalkUp frames] objectAtIndex:0]];
    }
    
    if (self.sprite8.orientation == 3)
    {
        [self.sprite8 setDisplayFrame:[[spriteNWalkRight frames] objectAtIndex:0]];
    }
    
    if (self.sprite8.orientation == 4)
    {
        [self.sprite8 setDisplayFrame:[[spriteNWalkLeft frames] objectAtIndex:0]];
    }
}

-(void) finishActionSprite8
{
    if (self.sprite8.orientation == 1)
    {
        [self.sprite8 setDisplayFrame:[[spriteNWalkDown frames] objectAtIndex:0]];
    }
    
    if (self.sprite8.orientation == 2)
    {
        [self.sprite8 setDisplayFrame:[[spriteNWalkUp frames] objectAtIndex:0]];
    }
    
    if (self.sprite8.orientation == 3)
    {
        [self.sprite8 setDisplayFrame:[[spriteNWalkRight frames] objectAtIndex:0]];
    }
    
    if (self.sprite8.orientation == 4)
    {
        [self.sprite8 setDisplayFrame:[[spriteNWalkLeft frames] objectAtIndex:0]];
    }
    self.hero.sprite8position = self.sprite8.position;
}


-(void)updateSprite9
{
    CGSize screenSize = [[CCDirector sharedDirector] winSize];
    int x = self.hero.position.x;
    int y = self.hero.position.y;
    
    int p = self.sprite9.position.x;
    int q = self.sprite9.position.y;
    
    int diffx = abs(x-p);
    int diffy = abs(y-q);
    
    if ((diffx > screenSize.width/1.5) || (diffy > screenSize.height/1.5))
    {
        return;
    }
    
    
    int rand = arc4random()%14;
    if (self.spriteOddIsTalking)
    {
        return;
    }
    if (rand == 1)
    {
        [self moveleftSprite9];
    }
    if (rand == 2)
    {
        [self moverightSprite9];
    }
    if (rand == 3)
    {
        [self moveupSprite9];
    }
    if (rand == 4)
    {
        [self movedownSprite9];
    }
    return;
}

-(void) moveleftSprite9
{
    CGPoint sprite9Pos = self.sprite9.position;
    self.sprite9.orientation = 4;
    sprite9Pos.x -= theHKMap.tileSize.width;
    
    CGPoint tileCoord = [self tileCoordForPosition:sprite9Pos];
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
                    CGPoint tileCoord1 = [self tileCoordForPosition:sprite9.position];
                    int tileGID1 = [self.bgLayer tileGIDAt:tileCoord1];
                    [self.bgLayer removeTileAt:tileCoord1];
                    [self.bgLayer setTileGID:(tileGID1 - 9) at:tileCoord1];
                    
                    
                    if (self.sprite9.orientation == 4)
                    {
                        id actionMove = [CCMoveTo actionWithDuration:0.3 position:sprite9Pos];
                        id actionMove2 = [CCAnimate actionWithAnimation:spriteZWalkLeft restoreOriginalFrame:NO];
                        
                        id actionMoveDone = [CCCallFuncN actionWithTarget:self selector:@selector(finishActionSprite9)];
                        
                        [self.sprite9 runAction:[CCSpawn actionOne:[CCSequence actions:actionMove,actionMoveDone,nil] two:actionMove2]];
                        return;
                    }
                }
            }
        }
    }
    if (self.sprite9.orientation == 1)
    {
        [self.sprite9 setDisplayFrame:[[spriteZWalkDown frames] objectAtIndex:0]];
    }
    
    if (self.sprite9.orientation == 2)
    {
        [self.sprite9 setDisplayFrame:[[spriteZWalkUp frames] objectAtIndex:0]];
    }
    
    if (self.sprite9.orientation == 3)
    {
        [self.sprite9 setDisplayFrame:[[spriteZWalkRight frames] objectAtIndex:0]];
    }
    
    if (self.sprite9.orientation == 4)
    {
        [self.sprite9 setDisplayFrame:[[spriteZWalkLeft frames] objectAtIndex:0]];
    }
}
-(void) moverightSprite9
{
    CGPoint sprite9Pos = self.sprite9.position;
    self.sprite9.orientation = 3;
    sprite9Pos.x += theHKMap.tileSize.width;
    
    CGPoint tileCoord = [self tileCoordForPosition:sprite9Pos];
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
                    CGPoint tileCoord1 = [self tileCoordForPosition:sprite9.position];
                    int tileGID1 = [self.bgLayer tileGIDAt:tileCoord1];
                    [self.bgLayer removeTileAt:tileCoord1];
                    [self.bgLayer setTileGID:(tileGID1 - 9) at:tileCoord1];
                    
                    
                    if (self.sprite9.orientation == 3)
                    {
                        id actionMove = [CCMoveTo actionWithDuration:0.3 position:sprite9Pos];
                        id actionMove2 = [CCAnimate actionWithAnimation:spriteZWalkRight restoreOriginalFrame:NO];
                        
                        id actionMoveDone = [CCCallFuncN actionWithTarget:self selector:@selector(finishActionSprite9)];
                        
                        [self.sprite9 runAction:[CCSpawn actionOne:[CCSequence actions:actionMove,actionMoveDone,nil] two:actionMove2]];
                        return;
                    }
                }
            }
        }
    }
    if (self.sprite9.orientation == 1)
    {
        [self.sprite9 setDisplayFrame:[[spriteZWalkDown frames] objectAtIndex:0]];
    }
    
    if (self.sprite9.orientation == 2)
    {
        [self.sprite9 setDisplayFrame:[[spriteZWalkUp frames] objectAtIndex:0]];
    }
    
    if (self.sprite9.orientation == 3)
    {
        [self.sprite9 setDisplayFrame:[[spriteZWalkRight frames] objectAtIndex:0]];
    }
    
    if (self.sprite9.orientation == 4)
    {
        [self.sprite9 setDisplayFrame:[[spriteZWalkLeft frames] objectAtIndex:0]];
    }
}
-(void) moveupSprite9
{
    CGPoint sprite9Pos = self.sprite9.position;
    self.sprite9.orientation = 2;
    sprite9Pos.y += theHKMap.tileSize.height;
    
    CGPoint tileCoord = [self tileCoordForPosition:sprite9Pos];
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
                    CGPoint tileCoord1 = [self tileCoordForPosition:sprite9.position];
                    int tileGID1 = [self.bgLayer tileGIDAt:tileCoord1];
                    [self.bgLayer removeTileAt:tileCoord1];
                    [self.bgLayer setTileGID:(tileGID1 - 9) at:tileCoord1];
                    
                    
                    if (self.sprite9.orientation == 2)
                    {
                        id actionMove = [CCMoveTo actionWithDuration:0.3 position:sprite9Pos];
                        id actionMove2;
                        if (self.sprite1LastRight)
                        {
                            actionMove2 = [CCAnimate actionWithAnimation:spriteZWalkUp restoreOriginalFrame:NO];
                        }
                        else
                        {
                            actionMove2 = [CCAnimate actionWithAnimation:spriteZWalkUp2 restoreOriginalFrame:NO];
                        }
                        id actionMoveDone = [CCCallFuncN actionWithTarget:self selector:@selector(finishActionSprite9)];
                        
                        [self.sprite9 runAction:[CCSpawn actionOne:[CCSequence actions:actionMove,actionMoveDone,nil] two:actionMove2]];
                        return;
                    }
                }
            }
        }
    }
    if (self.sprite9.orientation == 1)
    {
        [self.sprite9 setDisplayFrame:[[spriteZWalkDown frames] objectAtIndex:0]];
    }
    
    if (self.sprite9.orientation == 2)
    {
        [self.sprite9 setDisplayFrame:[[spriteZWalkUp frames] objectAtIndex:0]];
    }
    
    if (self.sprite9.orientation == 3)
    {
        [self.sprite9 setDisplayFrame:[[spriteZWalkRight frames] objectAtIndex:0]];
    }
    
    if (self.sprite9.orientation == 4)
    {
        [self.sprite9 setDisplayFrame:[[spriteZWalkLeft frames] objectAtIndex:0]];
    }
}
-(void) movedownSprite9
{
    CGPoint sprite9Pos = self.sprite9.position;
    self.sprite9.orientation = 1;
    sprite9Pos.y -= theHKMap.tileSize.height;
    
    CGPoint tileCoord = [self tileCoordForPosition:sprite9Pos];
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
                    CGPoint tileCoord1 = [self tileCoordForPosition:sprite9.position];
                    int tileGID1 = [self.bgLayer tileGIDAt:tileCoord1];
                    [self.bgLayer removeTileAt:tileCoord1];
                    [self.bgLayer setTileGID:(tileGID1 - 9) at:tileCoord1];
                    
                    
                    if (self.sprite9.orientation == 1)
                    {
                        id actionMove = [CCMoveTo actionWithDuration:0.3 position:sprite9Pos];
                        id actionMove2;
                        if (self.sprite1LastRight)
                        {
                            actionMove2 = [CCAnimate actionWithAnimation:spriteZWalkDown restoreOriginalFrame:NO];
                        }
                        else
                        {
                            actionMove2 = [CCAnimate actionWithAnimation:spriteZWalkDown2 restoreOriginalFrame:NO];
                        }
                        id actionMoveDone = [CCCallFuncN actionWithTarget:self selector:@selector(finishActionSprite9)];
                        
                        [self.sprite9 runAction:[CCSpawn actionOne:[CCSequence actions:actionMove,actionMoveDone,nil] two:actionMove2]];
                        return;
                    }
                }
            }
        }
    }
    if (self.sprite9.orientation == 1)
    {
        [self.sprite9 setDisplayFrame:[[spriteZWalkDown frames] objectAtIndex:0]];
    }
    
    if (self.sprite9.orientation == 2)
    {
        [self.sprite9 setDisplayFrame:[[spriteZWalkUp frames] objectAtIndex:0]];
    }
    
    if (self.sprite9.orientation == 3)
    {
        [self.sprite9 setDisplayFrame:[[spriteZWalkRight frames] objectAtIndex:0]];
    }
    
    if (self.sprite9.orientation == 4)
    {
        [self.sprite9 setDisplayFrame:[[spriteZWalkLeft frames] objectAtIndex:0]];
    }
}

-(void) finishActionSprite9
{
    if (self.sprite9.orientation == 1)
    {
        [self.sprite9 setDisplayFrame:[[spriteZWalkDown frames] objectAtIndex:0]];
    }
    
    if (self.sprite9.orientation == 2)
    {
        [self.sprite9 setDisplayFrame:[[spriteZWalkUp frames] objectAtIndex:0]];
    }
    
    if (self.sprite9.orientation == 3)
    {
        [self.sprite9 setDisplayFrame:[[spriteZWalkRight frames] objectAtIndex:0]];
    }
    
    if (self.sprite9.orientation == 4)
    {
        [self.sprite9 setDisplayFrame:[[spriteZWalkLeft frames] objectAtIndex:0]];
    }
    self.hero.sprite9position = self.sprite9.position;
}


-(void)updateSprite10
{
    CGSize screenSize = [[CCDirector sharedDirector] winSize];
    int x = self.hero.position.x;
    int y = self.hero.position.y;
    
    int p = self.sprite10.position.x;
    int q = self.sprite10.position.y;
    
    int diffx = abs(x-p);
    int diffy = abs(y-q);
    
    if ((diffx > screenSize.width/1.5) || (diffy > screenSize.height/1.5))
    {
        return;
    }
    
    
    int rand = arc4random()%14;
    if (self.spriteEvenIsTalking)
    {
        return;
    }
    if (rand == 1)
    {
        [self moveleftSprite10];
    }
    if (rand == 2)
    {
        [self moverightSprite10];
    }
    if (rand == 3)
    {
        [self moveupSprite10];
    }
    if (rand == 4)
    {
        [self movedownSprite10];
    }
    return;
}

-(void) moveleftSprite10
{
    CGPoint sprite10Pos = self.sprite10.position;
    self.sprite10.orientation = 4;
    sprite10Pos.x -= theHKMap.tileSize.width;
    
    CGPoint tileCoord = [self tileCoordForPosition:sprite10Pos];
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
                    CGPoint tileCoord1 = [self tileCoordForPosition:sprite10.position];
                    int tileGID1 = [self.bgLayer tileGIDAt:tileCoord1];
                    [self.bgLayer removeTileAt:tileCoord1];
                    [self.bgLayer setTileGID:(tileGID1 - 10) at:tileCoord1];
                    
                    
                    if (self.sprite10.orientation == 4)
                    {
                        id actionMove = [CCMoveTo actionWithDuration:0.3 position:sprite10Pos];
                        id actionMove2 = [CCAnimate actionWithAnimation:spriteQWalkLeft restoreOriginalFrame:NO];
                        
                        id actionMoveDone = [CCCallFuncN actionWithTarget:self selector:@selector(finishActionSprite10)];
                        
                        [self.sprite10 runAction:[CCSpawn actionOne:[CCSequence actions:actionMove,actionMoveDone,nil] two:actionMove2]];
                        return;
                    }
                }
            }
        }
    }
    if (self.sprite10.orientation == 1)
    {
        [self.sprite10 setDisplayFrame:[[spriteQWalkDown frames] objectAtIndex:0]];
    }
    
    if (self.sprite10.orientation == 2)
    {
        [self.sprite10 setDisplayFrame:[[spriteQWalkUp frames] objectAtIndex:0]];
    }
    
    if (self.sprite10.orientation == 3)
    {
        [self.sprite10 setDisplayFrame:[[spriteQWalkRight frames] objectAtIndex:0]];
    }
    
    if (self.sprite10.orientation == 4)
    {
        [self.sprite10 setDisplayFrame:[[spriteQWalkLeft frames] objectAtIndex:0]];
    }
}
-(void) moverightSprite10
{
    CGPoint sprite10Pos = self.sprite10.position;
    self.sprite10.orientation = 3;
    sprite10Pos.x += theHKMap.tileSize.width;
    
    CGPoint tileCoord = [self tileCoordForPosition:sprite10Pos];
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
                    CGPoint tileCoord1 = [self tileCoordForPosition:sprite10.position];
                    int tileGID1 = [self.bgLayer tileGIDAt:tileCoord1];
                    [self.bgLayer removeTileAt:tileCoord1];
                    [self.bgLayer setTileGID:(tileGID1 - 10) at:tileCoord1];
                    
                    
                    if (self.sprite10.orientation == 3)
                    {
                        id actionMove = [CCMoveTo actionWithDuration:0.3 position:sprite10Pos];
                        id actionMove2 = [CCAnimate actionWithAnimation:spriteQWalkRight restoreOriginalFrame:NO];
                        
                        id actionMoveDone = [CCCallFuncN actionWithTarget:self selector:@selector(finishActionSprite10)];
                        
                        [self.sprite10 runAction:[CCSpawn actionOne:[CCSequence actions:actionMove,actionMoveDone,nil] two:actionMove2]];
                        return;
                    }
                }
            }
        }
    }
    if (self.sprite10.orientation == 1)
    {
        [self.sprite10 setDisplayFrame:[[spriteQWalkDown frames] objectAtIndex:0]];
    }
    
    if (self.sprite10.orientation == 2)
    {
        [self.sprite10 setDisplayFrame:[[spriteQWalkUp frames] objectAtIndex:0]];
    }
    
    if (self.sprite10.orientation == 3)
    {
        [self.sprite10 setDisplayFrame:[[spriteQWalkRight frames] objectAtIndex:0]];
    }
    
    if (self.sprite10.orientation == 4)
    {
        [self.sprite10 setDisplayFrame:[[spriteQWalkLeft frames] objectAtIndex:0]];
    }
}
-(void) moveupSprite10
{
    CGPoint sprite10Pos = self.sprite10.position;
    self.sprite10.orientation = 2;
    sprite10Pos.y += theHKMap.tileSize.height;
    
    CGPoint tileCoord = [self tileCoordForPosition:sprite10Pos];
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
                    CGPoint tileCoord1 = [self tileCoordForPosition:sprite10.position];
                    int tileGID1 = [self.bgLayer tileGIDAt:tileCoord1];
                    [self.bgLayer removeTileAt:tileCoord1];
                    [self.bgLayer setTileGID:(tileGID1 - 10) at:tileCoord1];
                    
                    
                    if (self.sprite10.orientation == 2)
                    {
                        id actionMove = [CCMoveTo actionWithDuration:0.3 position:sprite10Pos];
                        id actionMove2;
                        if (self.sprite1LastRight)
                        {
                            actionMove2 = [CCAnimate actionWithAnimation:spriteQWalkUp restoreOriginalFrame:NO];
                        }
                        else
                        {
                            actionMove2 = [CCAnimate actionWithAnimation:spriteQWalkUp2 restoreOriginalFrame:NO];
                        }
                        id actionMoveDone = [CCCallFuncN actionWithTarget:self selector:@selector(finishActionSprite10)];
                        
                        [self.sprite10 runAction:[CCSpawn actionOne:[CCSequence actions:actionMove,actionMoveDone,nil] two:actionMove2]];
                        return;
                    }
                }
            }
        }
    }
    if (self.sprite10.orientation == 1)
    {
        [self.sprite10 setDisplayFrame:[[spriteQWalkDown frames] objectAtIndex:0]];
    }
    
    if (self.sprite10.orientation == 2)
    {
        [self.sprite10 setDisplayFrame:[[spriteQWalkUp frames] objectAtIndex:0]];
    }
    
    if (self.sprite10.orientation == 3)
    {
        [self.sprite10 setDisplayFrame:[[spriteQWalkRight frames] objectAtIndex:0]];
    }
    
    if (self.sprite10.orientation == 4)
    {
        [self.sprite10 setDisplayFrame:[[spriteQWalkLeft frames] objectAtIndex:0]];
    }
}
-(void) movedownSprite10
{
    CGPoint sprite10Pos = self.sprite10.position;
    self.sprite10.orientation = 1;
    sprite10Pos.y -= theHKMap.tileSize.height;
    
    CGPoint tileCoord = [self tileCoordForPosition:sprite10Pos];
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
                    CGPoint tileCoord1 = [self tileCoordForPosition:sprite10.position];
                    int tileGID1 = [self.bgLayer tileGIDAt:tileCoord1];
                    [self.bgLayer removeTileAt:tileCoord1];
                    [self.bgLayer setTileGID:(tileGID1 - 10) at:tileCoord1];
                    
                    
                    if (self.sprite10.orientation == 1)
                    {
                        id actionMove = [CCMoveTo actionWithDuration:0.3 position:sprite10Pos];
                        id actionMove2;
                        if (self.sprite1LastRight)
                        {
                            actionMove2 = [CCAnimate actionWithAnimation:spriteQWalkDown restoreOriginalFrame:NO];
                        }
                        else
                        {
                            actionMove2 = [CCAnimate actionWithAnimation:spriteQWalkDown2 restoreOriginalFrame:NO];
                        }
                        id actionMoveDone = [CCCallFuncN actionWithTarget:self selector:@selector(finishActionSprite10)];
                        
                        [self.sprite10 runAction:[CCSpawn actionOne:[CCSequence actions:actionMove,actionMoveDone,nil] two:actionMove2]];
                        return;
                    }
                }
            }
        }
    }
    if (self.sprite10.orientation == 1)
    {
        [self.sprite10 setDisplayFrame:[[spriteQWalkDown frames] objectAtIndex:0]];
    }
    
    if (self.sprite10.orientation == 2)
    {
        [self.sprite10 setDisplayFrame:[[spriteQWalkUp frames] objectAtIndex:0]];
    }
    
    if (self.sprite10.orientation == 3)
    {
        [self.sprite10 setDisplayFrame:[[spriteQWalkRight frames] objectAtIndex:0]];
    }
    
    if (self.sprite10.orientation == 4)
    {
        [self.sprite10 setDisplayFrame:[[spriteQWalkLeft frames] objectAtIndex:0]];
    }
}

-(void) finishActionSprite10
{
    if (self.sprite10.orientation == 1)
    {
        [self.sprite10 setDisplayFrame:[[spriteQWalkDown frames] objectAtIndex:0]];
    }
    
    if (self.sprite10.orientation == 2)
    {
        [self.sprite10 setDisplayFrame:[[spriteQWalkUp frames] objectAtIndex:0]];
    }
    
    if (self.sprite10.orientation == 3)
    {
        [self.sprite10 setDisplayFrame:[[spriteQWalkRight frames] objectAtIndex:0]];
    }
    
    if (self.sprite10.orientation == 4)
    {
        [self.sprite10 setDisplayFrame:[[spriteQWalkLeft frames] objectAtIndex:0]];
    }
    self.hero.sprite10position = self.sprite10.position;
}


-(void)updateSprite11
{
    CGSize screenSize = [[CCDirector sharedDirector] winSize];
    int x = self.hero.position.x;
    int y = self.hero.position.y;
    
    int p = self.sprite11.position.x;
    int q = self.sprite11.position.y;
    
    int diffx = abs(x-p);
    int diffy = abs(y-q);
    
    if ((diffx > screenSize.width/1.5) || (diffy > screenSize.height/1.5))
    {
        return;
    }
    
    
    int rand = arc4random()%14;
    if (self.spriteOddIsTalking)
    {
        return;
    }
    if (rand == 1)
    {
        [self moveleftSprite11];
    }
    if (rand == 2)
    {
        [self moverightSprite11];
    }
    if (rand == 3)
    {
        [self moveupSprite11];
    }
    if (rand == 4)
    {
        [self movedownSprite11];
    }
    return;
}

-(void) moveleftSprite11
{
    CGPoint sprite11Pos = self.sprite11.position;
    self.sprite11.orientation = 4;
    sprite11Pos.x -= theHKMap.tileSize.width;
    
    CGPoint tileCoord = [self tileCoordForPosition:sprite11Pos];
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
                    CGPoint tileCoord1 = [self tileCoordForPosition:sprite11.position];
                    int tileGID1 = [self.bgLayer tileGIDAt:tileCoord1];
                    [self.bgLayer removeTileAt:tileCoord1];
                    [self.bgLayer setTileGID:(tileGID1 - 11) at:tileCoord1];
                    
                    
                    if (self.sprite11.orientation == 4)
                    {
                        id actionMove = [CCMoveTo actionWithDuration:0.3 position:sprite11Pos];
                        id actionMove2 = [CCAnimate actionWithAnimation:spritePWalkLeft restoreOriginalFrame:NO];
                        
                        id actionMoveDone = [CCCallFuncN actionWithTarget:self selector:@selector(finishActionSprite11)];
                        
                        [self.sprite11 runAction:[CCSpawn actionOne:[CCSequence actions:actionMove,actionMoveDone,nil] two:actionMove2]];
                        return;
                    }
                }
            }
        }
    }
    if (self.sprite11.orientation == 1)
    {
        [self.sprite11 setDisplayFrame:[[spritePWalkDown frames] objectAtIndex:0]];
    }
    
    if (self.sprite11.orientation == 2)
    {
        [self.sprite11 setDisplayFrame:[[spritePWalkUp frames] objectAtIndex:0]];
    }
    
    if (self.sprite11.orientation == 3)
    {
        [self.sprite11 setDisplayFrame:[[spritePWalkRight frames] objectAtIndex:0]];
    }
    
    if (self.sprite11.orientation == 4)
    {
        [self.sprite11 setDisplayFrame:[[spritePWalkLeft frames] objectAtIndex:0]];
    }
}
-(void) moverightSprite11
{
    CGPoint sprite11Pos = self.sprite11.position;
    self.sprite11.orientation = 3;
    sprite11Pos.x += theHKMap.tileSize.width;
    
    CGPoint tileCoord = [self tileCoordForPosition:sprite11Pos];
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
                    CGPoint tileCoord1 = [self tileCoordForPosition:sprite11.position];
                    int tileGID1 = [self.bgLayer tileGIDAt:tileCoord1];
                    [self.bgLayer removeTileAt:tileCoord1];
                    [self.bgLayer setTileGID:(tileGID1 - 11) at:tileCoord1];
                    
                    
                    if (self.sprite11.orientation == 3)
                    {
                        id actionMove = [CCMoveTo actionWithDuration:0.3 position:sprite11Pos];
                        id actionMove2 = [CCAnimate actionWithAnimation:spritePWalkRight restoreOriginalFrame:NO];
                        
                        id actionMoveDone = [CCCallFuncN actionWithTarget:self selector:@selector(finishActionSprite11)];
                        
                        [self.sprite11 runAction:[CCSpawn actionOne:[CCSequence actions:actionMove,actionMoveDone,nil] two:actionMove2]];
                        return;
                    }
                }
            }
        }
    }
    if (self.sprite11.orientation == 1)
    {
        [self.sprite11 setDisplayFrame:[[spritePWalkDown frames] objectAtIndex:0]];
    }
    
    if (self.sprite11.orientation == 2)
    {
        [self.sprite11 setDisplayFrame:[[spritePWalkUp frames] objectAtIndex:0]];
    }
    
    if (self.sprite11.orientation == 3)
    {
        [self.sprite11 setDisplayFrame:[[spritePWalkRight frames] objectAtIndex:0]];
    }
    
    if (self.sprite11.orientation == 4)
    {
        [self.sprite11 setDisplayFrame:[[spritePWalkLeft frames] objectAtIndex:0]];
    }
}
-(void) moveupSprite11
{
    CGPoint sprite11Pos = self.sprite11.position;
    self.sprite11.orientation = 2;
    sprite11Pos.y += theHKMap.tileSize.height;
    
    CGPoint tileCoord = [self tileCoordForPosition:sprite11Pos];
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
                    CGPoint tileCoord1 = [self tileCoordForPosition:sprite11.position];
                    int tileGID1 = [self.bgLayer tileGIDAt:tileCoord1];
                    [self.bgLayer removeTileAt:tileCoord1];
                    [self.bgLayer setTileGID:(tileGID1 - 11) at:tileCoord1];
                    
                    
                    if (self.sprite11.orientation == 2)
                    {
                        id actionMove = [CCMoveTo actionWithDuration:0.3 position:sprite11Pos];
                        id actionMove2;
                        if (self.sprite1LastRight)
                        {
                            actionMove2 = [CCAnimate actionWithAnimation:spritePWalkUp restoreOriginalFrame:NO];
                        }
                        else
                        {
                            actionMove2 = [CCAnimate actionWithAnimation:spritePWalkUp2 restoreOriginalFrame:NO];
                        }
                        id actionMoveDone = [CCCallFuncN actionWithTarget:self selector:@selector(finishActionSprite11)];
                        
                        [self.sprite11 runAction:[CCSpawn actionOne:[CCSequence actions:actionMove,actionMoveDone,nil] two:actionMove2]];
                        return;
                    }
                }
            }
        }
    }
    if (self.sprite11.orientation == 1)
    {
        [self.sprite11 setDisplayFrame:[[spritePWalkDown frames] objectAtIndex:0]];
    }
    
    if (self.sprite11.orientation == 2)
    {
        [self.sprite11 setDisplayFrame:[[spritePWalkUp frames] objectAtIndex:0]];
    }
    
    if (self.sprite11.orientation == 3)
    {
        [self.sprite11 setDisplayFrame:[[spritePWalkRight frames] objectAtIndex:0]];
    }
    
    if (self.sprite11.orientation == 4)
    {
        [self.sprite11 setDisplayFrame:[[spritePWalkLeft frames] objectAtIndex:0]];
    }
}
-(void) movedownSprite11
{
    CGPoint sprite11Pos = self.sprite11.position;
    self.sprite11.orientation = 1;
    sprite11Pos.y -= theHKMap.tileSize.height;
    
    CGPoint tileCoord = [self tileCoordForPosition:sprite11Pos];
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
                    CGPoint tileCoord1 = [self tileCoordForPosition:sprite11.position];
                    int tileGID1 = [self.bgLayer tileGIDAt:tileCoord1];
                    [self.bgLayer removeTileAt:tileCoord1];
                    [self.bgLayer setTileGID:(tileGID1 - 11) at:tileCoord1];
                    
                    
                    if (self.sprite11.orientation == 1)
                    {
                        id actionMove = [CCMoveTo actionWithDuration:0.3 position:sprite11Pos];
                        id actionMove2;
                        if (self.sprite1LastRight)
                        {
                            actionMove2 = [CCAnimate actionWithAnimation:spritePWalkDown restoreOriginalFrame:NO];
                        }
                        else
                        {
                            actionMove2 = [CCAnimate actionWithAnimation:spritePWalkDown2 restoreOriginalFrame:NO];
                        }
                        id actionMoveDone = [CCCallFuncN actionWithTarget:self selector:@selector(finishActionSprite11)];
                        
                        [self.sprite11 runAction:[CCSpawn actionOne:[CCSequence actions:actionMove,actionMoveDone,nil] two:actionMove2]];
                        return;
                    }
                }
            }
        }
    }
    if (self.sprite11.orientation == 1)
    {
        [self.sprite11 setDisplayFrame:[[spritePWalkDown frames] objectAtIndex:0]];
    }
    
    if (self.sprite11.orientation == 2)
    {
        [self.sprite11 setDisplayFrame:[[spritePWalkUp frames] objectAtIndex:0]];
    }
    
    if (self.sprite11.orientation == 3)
    {
        [self.sprite11 setDisplayFrame:[[spritePWalkRight frames] objectAtIndex:0]];
    }
    
    if (self.sprite11.orientation == 4)
    {
        [self.sprite11 setDisplayFrame:[[spritePWalkLeft frames] objectAtIndex:0]];
    }
}

-(void) finishActionSprite11
{
    if (self.sprite11.orientation == 1)
    {
        [self.sprite11 setDisplayFrame:[[spritePWalkDown frames] objectAtIndex:0]];
    }
    
    if (self.sprite11.orientation == 2)
    {
        [self.sprite11 setDisplayFrame:[[spritePWalkUp frames] objectAtIndex:0]];
    }
    
    if (self.sprite11.orientation == 3)
    {
        [self.sprite11 setDisplayFrame:[[spritePWalkRight frames] objectAtIndex:0]];
    }
    
    if (self.sprite11.orientation == 4)
    {
        [self.sprite11 setDisplayFrame:[[spritePWalkLeft frames] objectAtIndex:0]];
    }
    self.hero.sprite11position = self.sprite11.position;
}


-(void)updateSprite12
{
    CGSize screenSize = [[CCDirector sharedDirector] winSize];
    int x = self.hero.position.x;
    int y = self.hero.position.y;
    
    int p = self.sprite12.position.x;
    int q = self.sprite12.position.y;
    
    int diffx = abs(x-p);
    int diffy = abs(y-q);
    
    if ((diffx > screenSize.width/1.5) || (diffy > screenSize.height/1.5))
    {
        return;
    }
    
    
    int rand = arc4random()%14;
    if (self.spriteEvenIsTalking)
    {
        return;
    }
    if (rand == 1)
    {
        [self moveleftSprite12];
    }
    if (rand == 2)
    {
        [self moverightSprite12];
    }
    if (rand == 3)
    {
        [self moveupSprite12];
    }
    if (rand == 4)
    {
        [self movedownSprite12];
    }
    return;
}

-(void) moveleftSprite12
{
    CGPoint sprite12Pos = self.sprite12.position;
    self.sprite12.orientation = 4;
    sprite12Pos.x -= theHKMap.tileSize.width;
    
    CGPoint tileCoord = [self tileCoordForPosition:sprite12Pos];
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
                    CGPoint tileCoord1 = [self tileCoordForPosition:sprite12.position];
                    int tileGID1 = [self.bgLayer tileGIDAt:tileCoord1];
                    [self.bgLayer removeTileAt:tileCoord1];
                    [self.bgLayer setTileGID:(tileGID1 - 12) at:tileCoord1];
                    
                    
                    if (self.sprite12.orientation == 4)
                    {
                        id actionMove = [CCMoveTo actionWithDuration:0.3 position:sprite12Pos];
                        id actionMove2 = [CCAnimate actionWithAnimation:spriteUWalkLeft restoreOriginalFrame:NO];
                        
                        id actionMoveDone = [CCCallFuncN actionWithTarget:self selector:@selector(finishActionSprite12)];
                        
                        [self.sprite12 runAction:[CCSpawn actionOne:[CCSequence actions:actionMove,actionMoveDone,nil] two:actionMove2]];
                        return;
                    }
                }
            }
        }
    }
    if (self.sprite12.orientation == 1)
    {
        [self.sprite12 setDisplayFrame:[[spriteUWalkDown frames] objectAtIndex:0]];
    }
    
    if (self.sprite12.orientation == 2)
    {
        [self.sprite12 setDisplayFrame:[[spriteUWalkUp frames] objectAtIndex:0]];
    }
    
    if (self.sprite12.orientation == 3)
    {
        [self.sprite12 setDisplayFrame:[[spriteUWalkRight frames] objectAtIndex:0]];
    }
    
    if (self.sprite12.orientation == 4)
    {
        [self.sprite12 setDisplayFrame:[[spriteUWalkLeft frames] objectAtIndex:0]];
    }
}
-(void) moverightSprite12
{
    CGPoint sprite12Pos = self.sprite12.position;
    self.sprite12.orientation = 3;
    sprite12Pos.x += theHKMap.tileSize.width;
    
    CGPoint tileCoord = [self tileCoordForPosition:sprite12Pos];
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
                    CGPoint tileCoord1 = [self tileCoordForPosition:sprite12.position];
                    int tileGID1 = [self.bgLayer tileGIDAt:tileCoord1];
                    [self.bgLayer removeTileAt:tileCoord1];
                    [self.bgLayer setTileGID:(tileGID1 - 12) at:tileCoord1];
                    
                    
                    if (self.sprite12.orientation == 3)
                    {
                        id actionMove = [CCMoveTo actionWithDuration:0.3 position:sprite12Pos];
                        id actionMove2 = [CCAnimate actionWithAnimation:spriteUWalkRight restoreOriginalFrame:NO];
                        
                        id actionMoveDone = [CCCallFuncN actionWithTarget:self selector:@selector(finishActionSprite12)];
                        
                        [self.sprite12 runAction:[CCSpawn actionOne:[CCSequence actions:actionMove,actionMoveDone,nil] two:actionMove2]];
                        return;
                    }
                }
            }
        }
    }
    if (self.sprite12.orientation == 1)
    {
        [self.sprite12 setDisplayFrame:[[spriteUWalkDown frames] objectAtIndex:0]];
    }
    
    if (self.sprite12.orientation == 2)
    {
        [self.sprite12 setDisplayFrame:[[spriteUWalkUp frames] objectAtIndex:0]];
    }
    
    if (self.sprite12.orientation == 3)
    {
        [self.sprite12 setDisplayFrame:[[spriteUWalkRight frames] objectAtIndex:0]];
    }
    
    if (self.sprite12.orientation == 4)
    {
        [self.sprite12 setDisplayFrame:[[spriteUWalkLeft frames] objectAtIndex:0]];
    }
}
-(void) moveupSprite12
{
    CGPoint sprite12Pos = self.sprite12.position;
    self.sprite12.orientation = 2;
    sprite12Pos.y += theHKMap.tileSize.height;
    
    CGPoint tileCoord = [self tileCoordForPosition:sprite12Pos];
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
                    CGPoint tileCoord1 = [self tileCoordForPosition:sprite12.position];
                    int tileGID1 = [self.bgLayer tileGIDAt:tileCoord1];
                    [self.bgLayer removeTileAt:tileCoord1];
                    [self.bgLayer setTileGID:(tileGID1 - 12) at:tileCoord1];
                    
                    
                    if (self.sprite12.orientation == 2)
                    {
                        id actionMove = [CCMoveTo actionWithDuration:0.3 position:sprite12Pos];
                        id actionMove2;
                        if (self.sprite1LastRight)
                        {
                            actionMove2 = [CCAnimate actionWithAnimation:spriteUWalkUp restoreOriginalFrame:NO];
                        }
                        else
                        {
                            actionMove2 = [CCAnimate actionWithAnimation:spriteUWalkUp2 restoreOriginalFrame:NO];
                        }
                        id actionMoveDone = [CCCallFuncN actionWithTarget:self selector:@selector(finishActionSprite12)];
                        
                        [self.sprite12 runAction:[CCSpawn actionOne:[CCSequence actions:actionMove,actionMoveDone,nil] two:actionMove2]];
                        return;
                    }
                }
            }
        }
    }
    if (self.sprite12.orientation == 1)
    {
        [self.sprite12 setDisplayFrame:[[spriteUWalkDown frames] objectAtIndex:0]];
    }
    
    if (self.sprite12.orientation == 2)
    {
        [self.sprite12 setDisplayFrame:[[spriteUWalkUp frames] objectAtIndex:0]];
    }
    
    if (self.sprite12.orientation == 3)
    {
        [self.sprite12 setDisplayFrame:[[spriteUWalkRight frames] objectAtIndex:0]];
    }
    
    if (self.sprite12.orientation == 4)
    {
        [self.sprite12 setDisplayFrame:[[spriteUWalkLeft frames] objectAtIndex:0]];
    }
}
-(void) movedownSprite12
{
    CGPoint sprite12Pos = self.sprite12.position;
    self.sprite12.orientation = 1;
    sprite12Pos.y -= theHKMap.tileSize.height;
    
    CGPoint tileCoord = [self tileCoordForPosition:sprite12Pos];
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
                    CGPoint tileCoord1 = [self tileCoordForPosition:sprite12.position];
                    int tileGID1 = [self.bgLayer tileGIDAt:tileCoord1];
                    [self.bgLayer removeTileAt:tileCoord1];
                    [self.bgLayer setTileGID:(tileGID1 - 12) at:tileCoord1];
                    
                    
                    if (self.sprite12.orientation == 1)
                    {
                        id actionMove = [CCMoveTo actionWithDuration:0.3 position:sprite12Pos];
                        id actionMove2;
                        if (self.sprite1LastRight)
                        {
                            actionMove2 = [CCAnimate actionWithAnimation:spriteUWalkDown restoreOriginalFrame:NO];
                        }
                        else
                        {
                            actionMove2 = [CCAnimate actionWithAnimation:spriteUWalkDown2 restoreOriginalFrame:NO];
                        }
                        id actionMoveDone = [CCCallFuncN actionWithTarget:self selector:@selector(finishActionSprite12)];
                        
                        [self.sprite12 runAction:[CCSpawn actionOne:[CCSequence actions:actionMove,actionMoveDone,nil] two:actionMove2]];
                        return;
                    }
                }
            }
        }
    }
    if (self.sprite12.orientation == 1)
    {
        [self.sprite12 setDisplayFrame:[[spriteUWalkDown frames] objectAtIndex:0]];
    }
    
    if (self.sprite12.orientation == 2)
    {
        [self.sprite12 setDisplayFrame:[[spriteUWalkUp frames] objectAtIndex:0]];
    }
    
    if (self.sprite12.orientation == 3)
    {
        [self.sprite12 setDisplayFrame:[[spriteUWalkRight frames] objectAtIndex:0]];
    }
    
    if (self.sprite12.orientation == 4)
    {
        [self.sprite12 setDisplayFrame:[[spriteUWalkLeft frames] objectAtIndex:0]];
    }
}

-(void) finishActionSprite12
{
    if (self.sprite12.orientation == 1)
    {
        [self.sprite12 setDisplayFrame:[[spriteUWalkDown frames] objectAtIndex:0]];
    }
    
    if (self.sprite12.orientation == 2)
    {
        [self.sprite12 setDisplayFrame:[[spriteUWalkUp frames] objectAtIndex:0]];
    }
    
    if (self.sprite12.orientation == 3)
    {
        [self.sprite12 setDisplayFrame:[[spriteUWalkRight frames] objectAtIndex:0]];
    }
    
    if (self.sprite12.orientation == 4)
    {
        [self.sprite12 setDisplayFrame:[[spriteUWalkLeft frames] objectAtIndex:0]];
    }
    self.hero.sprite12position = self.sprite12.position;
}


-(void)updateSprite13
{
    CGSize screenSize = [[CCDirector sharedDirector] winSize];
    int x = self.hero.position.x;
    int y = self.hero.position.y;
    
    int p = self.sprite13.position.x;
    int q = self.sprite13.position.y;
    
    int diffx = abs(x-p);
    int diffy = abs(y-q);
    
    if ((diffx > screenSize.width/1.5) || (diffy > screenSize.height/1.5))
    {
        return;
    }
    
    
    int rand = arc4random()%14;
    if (self.spriteOddIsTalking)
    {
        return;
    }
    if (rand == 1)
    {
        [self moveleftSprite13];
    }
    if (rand == 2)
    {
        [self moverightSprite13];
    }
    if (rand == 3)
    {
        [self moveupSprite13];
    }
    if (rand == 4)
    {
        [self movedownSprite13];
    }
    return;
}

-(void) moveleftSprite13
{
    CGPoint sprite13Pos = self.sprite13.position;
    self.sprite13.orientation = 4;
    sprite13Pos.x -= theHKMap.tileSize.width;
    
    CGPoint tileCoord = [self tileCoordForPosition:sprite13Pos];
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
                    CGPoint tileCoord1 = [self tileCoordForPosition:sprite13.position];
                    int tileGID1 = [self.bgLayer tileGIDAt:tileCoord1];
                    [self.bgLayer removeTileAt:tileCoord1];
                    [self.bgLayer setTileGID:(tileGID1 - 13) at:tileCoord1];
                    
                    
                    if (self.sprite13.orientation == 4)
                    {
                        id actionMove = [CCMoveTo actionWithDuration:0.3 position:sprite13Pos];
                        id actionMove2 = [CCAnimate actionWithAnimation:spriteMWalkLeft restoreOriginalFrame:NO];
                        
                        id actionMoveDone = [CCCallFuncN actionWithTarget:self selector:@selector(finishActionSprite13)];
                        
                        [self.sprite13 runAction:[CCSpawn actionOne:[CCSequence actions:actionMove,actionMoveDone,nil] two:actionMove2]];
                        return;
                    }
                }
            }
        }
    }
    if (self.sprite13.orientation == 1)
    {
        [self.sprite13 setDisplayFrame:[[spriteMWalkDown frames] objectAtIndex:0]];
    }
    
    if (self.sprite13.orientation == 2)
    {
        [self.sprite13 setDisplayFrame:[[spriteMWalkUp frames] objectAtIndex:0]];
    }
    
    if (self.sprite13.orientation == 3)
    {
        [self.sprite13 setDisplayFrame:[[spriteMWalkRight frames] objectAtIndex:0]];
    }
    
    if (self.sprite13.orientation == 4)
    {
        [self.sprite13 setDisplayFrame:[[spriteMWalkLeft frames] objectAtIndex:0]];
    }
}
-(void) moverightSprite13
{
    CGPoint sprite13Pos = self.sprite13.position;
    self.sprite13.orientation = 3;
    sprite13Pos.x += theHKMap.tileSize.width;
    
    CGPoint tileCoord = [self tileCoordForPosition:sprite13Pos];
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
                    CGPoint tileCoord1 = [self tileCoordForPosition:sprite13.position];
                    int tileGID1 = [self.bgLayer tileGIDAt:tileCoord1];
                    [self.bgLayer removeTileAt:tileCoord1];
                    [self.bgLayer setTileGID:(tileGID1 - 13) at:tileCoord1];
                    
                    
                    if (self.sprite13.orientation == 3)
                    {
                        id actionMove = [CCMoveTo actionWithDuration:0.3 position:sprite13Pos];
                        id actionMove2 = [CCAnimate actionWithAnimation:spriteMWalkRight restoreOriginalFrame:NO];
                        
                        id actionMoveDone = [CCCallFuncN actionWithTarget:self selector:@selector(finishActionSprite13)];
                        
                        [self.sprite13 runAction:[CCSpawn actionOne:[CCSequence actions:actionMove,actionMoveDone,nil] two:actionMove2]];
                        return;
                    }
                }
            }
        }
    }
    if (self.sprite13.orientation == 1)
    {
        [self.sprite13 setDisplayFrame:[[spriteMWalkDown frames] objectAtIndex:0]];
    }
    
    if (self.sprite13.orientation == 2)
    {
        [self.sprite13 setDisplayFrame:[[spriteMWalkUp frames] objectAtIndex:0]];
    }
    
    if (self.sprite13.orientation == 3)
    {
        [self.sprite13 setDisplayFrame:[[spriteMWalkRight frames] objectAtIndex:0]];
    }
    
    if (self.sprite13.orientation == 4)
    {
        [self.sprite13 setDisplayFrame:[[spriteMWalkLeft frames] objectAtIndex:0]];
    }
}
-(void) moveupSprite13
{
    CGPoint sprite13Pos = self.sprite13.position;
    self.sprite13.orientation = 2;
    sprite13Pos.y += theHKMap.tileSize.height;
    
    CGPoint tileCoord = [self tileCoordForPosition:sprite13Pos];
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
                    CGPoint tileCoord1 = [self tileCoordForPosition:sprite13.position];
                    int tileGID1 = [self.bgLayer tileGIDAt:tileCoord1];
                    [self.bgLayer removeTileAt:tileCoord1];
                    [self.bgLayer setTileGID:(tileGID1 - 13) at:tileCoord1];
                    
                    
                    if (self.sprite13.orientation == 2)
                    {
                        id actionMove = [CCMoveTo actionWithDuration:0.3 position:sprite13Pos];
                        id actionMove2;
                        if (self.sprite1LastRight)
                        {
                            actionMove2 = [CCAnimate actionWithAnimation:spriteMWalkUp restoreOriginalFrame:NO];
                        }
                        else
                        {
                            actionMove2 = [CCAnimate actionWithAnimation:spriteMWalkUp2 restoreOriginalFrame:NO];
                        }
                        id actionMoveDone = [CCCallFuncN actionWithTarget:self selector:@selector(finishActionSprite13)];
                        
                        [self.sprite13 runAction:[CCSpawn actionOne:[CCSequence actions:actionMove,actionMoveDone,nil] two:actionMove2]];
                        return;
                    }
                }
            }
        }
    }
    if (self.sprite13.orientation == 1)
    {
        [self.sprite13 setDisplayFrame:[[spriteMWalkDown frames] objectAtIndex:0]];
    }
    
    if (self.sprite13.orientation == 2)
    {
        [self.sprite13 setDisplayFrame:[[spriteMWalkUp frames] objectAtIndex:0]];
    }
    
    if (self.sprite13.orientation == 3)
    {
        [self.sprite13 setDisplayFrame:[[spriteMWalkRight frames] objectAtIndex:0]];
    }
    
    if (self.sprite13.orientation == 4)
    {
        [self.sprite13 setDisplayFrame:[[spriteMWalkLeft frames] objectAtIndex:0]];
    }
}
-(void) movedownSprite13
{
    CGPoint sprite13Pos = self.sprite13.position;
    self.sprite13.orientation = 1;
    sprite13Pos.y -= theHKMap.tileSize.height;
    
    CGPoint tileCoord = [self tileCoordForPosition:sprite13Pos];
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
                    CGPoint tileCoord1 = [self tileCoordForPosition:sprite13.position];
                    int tileGID1 = [self.bgLayer tileGIDAt:tileCoord1];
                    [self.bgLayer removeTileAt:tileCoord1];
                    [self.bgLayer setTileGID:(tileGID1 - 13) at:tileCoord1];
                    
                    
                    if (self.sprite13.orientation == 1)
                    {
                        id actionMove = [CCMoveTo actionWithDuration:0.3 position:sprite13Pos];
                        id actionMove2;
                        if (self.sprite1LastRight)
                        {
                            actionMove2 = [CCAnimate actionWithAnimation:spriteMWalkDown restoreOriginalFrame:NO];
                        }
                        else
                        {
                            actionMove2 = [CCAnimate actionWithAnimation:spriteMWalkDown2 restoreOriginalFrame:NO];
                        }
                        id actionMoveDone = [CCCallFuncN actionWithTarget:self selector:@selector(finishActionSprite13)];
                        
                        [self.sprite13 runAction:[CCSpawn actionOne:[CCSequence actions:actionMove,actionMoveDone,nil] two:actionMove2]];
                        return;
                    }
                }
            }
        }
    }
    if (self.sprite13.orientation == 1)
    {
        [self.sprite13 setDisplayFrame:[[spriteMWalkDown frames] objectAtIndex:0]];
    }
    
    if (self.sprite13.orientation == 2)
    {
        [self.sprite13 setDisplayFrame:[[spriteMWalkUp frames] objectAtIndex:0]];
    }
    
    if (self.sprite13.orientation == 3)
    {
        [self.sprite13 setDisplayFrame:[[spriteMWalkRight frames] objectAtIndex:0]];
    }
    
    if (self.sprite13.orientation == 4)
    {
        [self.sprite13 setDisplayFrame:[[spriteMWalkLeft frames] objectAtIndex:0]];
    }
}

-(void) finishActionSprite13
{
    if (self.sprite13.orientation == 1)
    {
        [self.sprite13 setDisplayFrame:[[spriteMWalkDown frames] objectAtIndex:0]];
    }
    
    if (self.sprite13.orientation == 2)
    {
        [self.sprite13 setDisplayFrame:[[spriteMWalkUp frames] objectAtIndex:0]];
    }
    
    if (self.sprite13.orientation == 3)
    {
        [self.sprite13 setDisplayFrame:[[spriteMWalkRight frames] objectAtIndex:0]];
    }
    
    if (self.sprite13.orientation == 4)
    {
        [self.sprite13 setDisplayFrame:[[spriteMWalkLeft frames] objectAtIndex:0]];
    }
    self.hero.sprite13position = self.sprite13.position;
}


-(void)updateSprite14
{
    CGSize screenSize = [[CCDirector sharedDirector] winSize];
    int x = self.hero.position.x;
    int y = self.hero.position.y;
    
    int p = self.sprite14.position.x;
    int q = self.sprite14.position.y;
    
    int diffx = abs(x-p);
    int diffy = abs(y-q);
    
    if ((diffx > screenSize.width/1.5) || (diffy > screenSize.height/1.5))
    {
        return;
    }
    
    
    int rand = arc4random()%14;
    if (self.spriteEvenIsTalking)
    {
        return;
    }
    if (rand == 1)
    {
        [self moveleftSprite14];
    }
    if (rand == 2)
    {
        [self moverightSprite14];
    }
    if (rand == 3)
    {
        [self moveupSprite14];
    }
    if (rand == 4)
    {
        [self movedownSprite14];
    }
    return;
}

-(void) moveleftSprite14
{
    CGPoint sprite14Pos = self.sprite14.position;
    self.sprite14.orientation = 4;
    sprite14Pos.x -= theHKMap.tileSize.width;
    
    CGPoint tileCoord = [self tileCoordForPosition:sprite14Pos];
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
                    CGPoint tileCoord1 = [self tileCoordForPosition:sprite14.position];
                    int tileGID1 = [self.bgLayer tileGIDAt:tileCoord1];
                    [self.bgLayer removeTileAt:tileCoord1];
                    [self.bgLayer setTileGID:(tileGID1 - 14) at:tileCoord1];
                    
                    
                    if (self.sprite14.orientation == 4)
                    {
                        id actionMove = [CCMoveTo actionWithDuration:0.3 position:sprite14Pos];
                        id actionMove2 = [CCAnimate actionWithAnimation:spriteIWalkLeft restoreOriginalFrame:NO];
                        
                        id actionMoveDone = [CCCallFuncN actionWithTarget:self selector:@selector(finishActionSprite14)];
                        
                        [self.sprite14 runAction:[CCSpawn actionOne:[CCSequence actions:actionMove,actionMoveDone,nil] two:actionMove2]];
                        return;
                    }
                }
            }
        }
    }
    if (self.sprite14.orientation == 1)
    {
        [self.sprite14 setDisplayFrame:[[spriteIWalkDown frames] objectAtIndex:0]];
    }
    
    if (self.sprite14.orientation == 2)
    {
        [self.sprite14 setDisplayFrame:[[spriteIWalkUp frames] objectAtIndex:0]];
    }
    
    if (self.sprite14.orientation == 3)
    {
        [self.sprite14 setDisplayFrame:[[spriteIWalkRight frames] objectAtIndex:0]];
    }
    
    if (self.sprite14.orientation == 4)
    {
        [self.sprite14 setDisplayFrame:[[spriteIWalkLeft frames] objectAtIndex:0]];
    }
}
-(void) moverightSprite14
{
    CGPoint sprite14Pos = self.sprite14.position;
    self.sprite14.orientation = 3;
    sprite14Pos.x += theHKMap.tileSize.width;
    
    CGPoint tileCoord = [self tileCoordForPosition:sprite14Pos];
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
                    CGPoint tileCoord1 = [self tileCoordForPosition:sprite14.position];
                    int tileGID1 = [self.bgLayer tileGIDAt:tileCoord1];
                    [self.bgLayer removeTileAt:tileCoord1];
                    [self.bgLayer setTileGID:(tileGID1 - 14) at:tileCoord1];
                    
                    
                    if (self.sprite14.orientation == 3)
                    {
                        id actionMove = [CCMoveTo actionWithDuration:0.3 position:sprite14Pos];
                        id actionMove2 = [CCAnimate actionWithAnimation:spriteIWalkRight restoreOriginalFrame:NO];
                        
                        id actionMoveDone = [CCCallFuncN actionWithTarget:self selector:@selector(finishActionSprite14)];
                        
                        [self.sprite14 runAction:[CCSpawn actionOne:[CCSequence actions:actionMove,actionMoveDone,nil] two:actionMove2]];
                        return;
                    }
                }
            }
        }
    }
    if (self.sprite14.orientation == 1)
    {
        [self.sprite14 setDisplayFrame:[[spriteIWalkDown frames] objectAtIndex:0]];
    }
    
    if (self.sprite14.orientation == 2)
    {
        [self.sprite14 setDisplayFrame:[[spriteIWalkUp frames] objectAtIndex:0]];
    }
    
    if (self.sprite14.orientation == 3)
    {
        [self.sprite14 setDisplayFrame:[[spriteIWalkRight frames] objectAtIndex:0]];
    }
    
    if (self.sprite14.orientation == 4)
    {
        [self.sprite14 setDisplayFrame:[[spriteIWalkLeft frames] objectAtIndex:0]];
    }
}
-(void) moveupSprite14
{
    CGPoint sprite14Pos = self.sprite14.position;
    self.sprite14.orientation = 2;
    sprite14Pos.y += theHKMap.tileSize.height;
    
    CGPoint tileCoord = [self tileCoordForPosition:sprite14Pos];
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
                    CGPoint tileCoord1 = [self tileCoordForPosition:sprite14.position];
                    int tileGID1 = [self.bgLayer tileGIDAt:tileCoord1];
                    [self.bgLayer removeTileAt:tileCoord1];
                    [self.bgLayer setTileGID:(tileGID1 - 14) at:tileCoord1];
                    
                    
                    if (self.sprite14.orientation == 2)
                    {
                        id actionMove = [CCMoveTo actionWithDuration:0.3 position:sprite14Pos];
                        id actionMove2;
                        if (self.sprite1LastRight)
                        {
                            actionMove2 = [CCAnimate actionWithAnimation:spriteIWalkUp restoreOriginalFrame:NO];
                        }
                        else
                        {
                            actionMove2 = [CCAnimate actionWithAnimation:spriteIWalkUp2 restoreOriginalFrame:NO];
                        }
                        id actionMoveDone = [CCCallFuncN actionWithTarget:self selector:@selector(finishActionSprite14)];
                        
                        [self.sprite14 runAction:[CCSpawn actionOne:[CCSequence actions:actionMove,actionMoveDone,nil] two:actionMove2]];
                        return;
                    }
                }
            }
        }
    }
    if (self.sprite14.orientation == 1)
    {
        [self.sprite14 setDisplayFrame:[[spriteIWalkDown frames] objectAtIndex:0]];
    }
    
    if (self.sprite14.orientation == 2)
    {
        [self.sprite14 setDisplayFrame:[[spriteIWalkUp frames] objectAtIndex:0]];
    }
    
    if (self.sprite14.orientation == 3)
    {
        [self.sprite14 setDisplayFrame:[[spriteIWalkRight frames] objectAtIndex:0]];
    }
    
    if (self.sprite14.orientation == 4)
    {
        [self.sprite14 setDisplayFrame:[[spriteIWalkLeft frames] objectAtIndex:0]];
    }
}
-(void) movedownSprite14
{
    CGPoint sprite14Pos = self.sprite14.position;
    self.sprite14.orientation = 1;
    sprite14Pos.y -= theHKMap.tileSize.height;
    
    CGPoint tileCoord = [self tileCoordForPosition:sprite14Pos];
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
                    CGPoint tileCoord1 = [self tileCoordForPosition:sprite14.position];
                    int tileGID1 = [self.bgLayer tileGIDAt:tileCoord1];
                    [self.bgLayer removeTileAt:tileCoord1];
                    [self.bgLayer setTileGID:(tileGID1 - 14) at:tileCoord1];
                    
                    
                    if (self.sprite14.orientation == 1)
                    {
                        id actionMove = [CCMoveTo actionWithDuration:0.3 position:sprite14Pos];
                        id actionMove2;
                        if (self.sprite1LastRight)
                        {
                            actionMove2 = [CCAnimate actionWithAnimation:spriteIWalkDown restoreOriginalFrame:NO];
                        }
                        else
                        {
                            actionMove2 = [CCAnimate actionWithAnimation:spriteIWalkDown2 restoreOriginalFrame:NO];
                        }
                        id actionMoveDone = [CCCallFuncN actionWithTarget:self selector:@selector(finishActionSprite14)];
                        
                        [self.sprite14 runAction:[CCSpawn actionOne:[CCSequence actions:actionMove,actionMoveDone,nil] two:actionMove2]];
                        return;
                    }
                }
            }
        }
    }
    if (self.sprite14.orientation == 1)
    {
        [self.sprite14 setDisplayFrame:[[spriteIWalkDown frames] objectAtIndex:0]];
    }
    
    if (self.sprite14.orientation == 2)
    {
        [self.sprite14 setDisplayFrame:[[spriteIWalkUp frames] objectAtIndex:0]];
    }
    
    if (self.sprite14.orientation == 3)
    {
        [self.sprite14 setDisplayFrame:[[spriteIWalkRight frames] objectAtIndex:0]];
    }
    
    if (self.sprite14.orientation == 4)
    {
        [self.sprite14 setDisplayFrame:[[spriteIWalkLeft frames] objectAtIndex:0]];
    }
}

-(void) finishActionSprite14
{
    if (self.sprite14.orientation == 1)
    {
        [self.sprite14 setDisplayFrame:[[spriteIWalkDown frames] objectAtIndex:0]];
    }
    
    if (self.sprite14.orientation == 2)
    {
        [self.sprite14 setDisplayFrame:[[spriteIWalkUp frames] objectAtIndex:0]];
    }
    
    if (self.sprite14.orientation == 3)
    {
        [self.sprite14 setDisplayFrame:[[spriteIWalkRight frames] objectAtIndex:0]];
    }
    
    if (self.sprite14.orientation == 4)
    {
        [self.sprite14 setDisplayFrame:[[spriteIWalkLeft frames] objectAtIndex:0]];
    }
    self.hero.sprite14position = self.sprite14.position;
}


-(void)updateSprite15
{
    CGSize screenSize = [[CCDirector sharedDirector] winSize];
    int x = self.hero.position.x;
    int y = self.hero.position.y;
    
    int p = self.sprite15.position.x;
    int q = self.sprite15.position.y;
    
    int diffx = abs(x-p);
    int diffy = abs(y-q);
    
    if ((diffx > screenSize.width/1.5) || (diffy > screenSize.height/1.5))
    {
        return;
    }
    
    
    int rand = arc4random()%14;
    if (self.spriteOddIsTalking)
    {
        return;
    }
    if (rand == 1)
    {
        [self moveleftSprite15];
    }
    if (rand == 2)
    {
        [self moverightSprite15];
    }
    if (rand == 3)
    {
        [self moveupSprite15];
    }
    if (rand == 4)
    {
        [self movedownSprite15];
    }
    return;
}

-(void) moveleftSprite15
{
    CGPoint sprite15Pos = self.sprite15.position;
    self.sprite15.orientation = 4;
    sprite15Pos.x -= theHKMap.tileSize.width;
    
    CGPoint tileCoord = [self tileCoordForPosition:sprite15Pos];
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
                    CGPoint tileCoord1 = [self tileCoordForPosition:sprite15.position];
                    int tileGID1 = [self.bgLayer tileGIDAt:tileCoord1];
                    [self.bgLayer removeTileAt:tileCoord1];
                    [self.bgLayer setTileGID:(tileGID1 - 15) at:tileCoord1];
                    
                    
                    if (self.sprite15.orientation == 4)
                    {
                        id actionMove = [CCMoveTo actionWithDuration:0.3 position:sprite15Pos];
                        id actionMove2 = [CCAnimate actionWithAnimation:spriteWWalkLeft restoreOriginalFrame:NO];
                        
                        id actionMoveDone = [CCCallFuncN actionWithTarget:self selector:@selector(finishActionSprite15)];
                        
                        [self.sprite15 runAction:[CCSpawn actionOne:[CCSequence actions:actionMove,actionMoveDone,nil] two:actionMove2]];
                        return;
                    }
                }
            }
        }
    }
    if (self.sprite15.orientation == 1)
    {
        [self.sprite15 setDisplayFrame:[[spriteWWalkDown frames] objectAtIndex:0]];
    }
    
    if (self.sprite15.orientation == 2)
    {
        [self.sprite15 setDisplayFrame:[[spriteWWalkUp frames] objectAtIndex:0]];
    }
    
    if (self.sprite15.orientation == 3)
    {
        [self.sprite15 setDisplayFrame:[[spriteWWalkRight frames] objectAtIndex:0]];
    }
    
    if (self.sprite15.orientation == 4)
    {
        [self.sprite15 setDisplayFrame:[[spriteWWalkLeft frames] objectAtIndex:0]];
    }
}
-(void) moverightSprite15
{
    CGPoint sprite15Pos = self.sprite15.position;
    self.sprite15.orientation = 3;
    sprite15Pos.x += theHKMap.tileSize.width;
    
    CGPoint tileCoord = [self tileCoordForPosition:sprite15Pos];
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
                    CGPoint tileCoord1 = [self tileCoordForPosition:sprite15.position];
                    int tileGID1 = [self.bgLayer tileGIDAt:tileCoord1];
                    [self.bgLayer removeTileAt:tileCoord1];
                    [self.bgLayer setTileGID:(tileGID1 - 15) at:tileCoord1];
                    
                    
                    if (self.sprite15.orientation == 3)
                    {
                        id actionMove = [CCMoveTo actionWithDuration:0.3 position:sprite15Pos];
                        id actionMove2 = [CCAnimate actionWithAnimation:spriteWWalkRight restoreOriginalFrame:NO];
                        
                        id actionMoveDone = [CCCallFuncN actionWithTarget:self selector:@selector(finishActionSprite15)];
                        
                        [self.sprite15 runAction:[CCSpawn actionOne:[CCSequence actions:actionMove,actionMoveDone,nil] two:actionMove2]];
                        return;
                    }
                }
            }
        }
    }
    if (self.sprite15.orientation == 1)
    {
        [self.sprite15 setDisplayFrame:[[spriteWWalkDown frames] objectAtIndex:0]];
    }
    
    if (self.sprite15.orientation == 2)
    {
        [self.sprite15 setDisplayFrame:[[spriteWWalkUp frames] objectAtIndex:0]];
    }
    
    if (self.sprite15.orientation == 3)
    {
        [self.sprite15 setDisplayFrame:[[spriteWWalkRight frames] objectAtIndex:0]];
    }
    
    if (self.sprite15.orientation == 4)
    {
        [self.sprite15 setDisplayFrame:[[spriteWWalkLeft frames] objectAtIndex:0]];
    }
}
-(void) moveupSprite15
{
    CGPoint sprite15Pos = self.sprite15.position;
    self.sprite15.orientation = 2;
    sprite15Pos.y += theHKMap.tileSize.height;
    
    CGPoint tileCoord = [self tileCoordForPosition:sprite15Pos];
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
                    CGPoint tileCoord1 = [self tileCoordForPosition:sprite15.position];
                    int tileGID1 = [self.bgLayer tileGIDAt:tileCoord1];
                    [self.bgLayer removeTileAt:tileCoord1];
                    [self.bgLayer setTileGID:(tileGID1 - 15) at:tileCoord1];
                    
                    
                    if (self.sprite15.orientation == 2)
                    {
                        id actionMove = [CCMoveTo actionWithDuration:0.3 position:sprite15Pos];
                        id actionMove2;
                        if (self.sprite1LastRight)
                        {
                            actionMove2 = [CCAnimate actionWithAnimation:spriteWWalkUp restoreOriginalFrame:NO];
                        }
                        else
                        {
                            actionMove2 = [CCAnimate actionWithAnimation:spriteWWalkUp2 restoreOriginalFrame:NO];
                        }
                        id actionMoveDone = [CCCallFuncN actionWithTarget:self selector:@selector(finishActionSprite15)];
                        
                        [self.sprite15 runAction:[CCSpawn actionOne:[CCSequence actions:actionMove,actionMoveDone,nil] two:actionMove2]];
                        return;
                    }
                }
            }
        }
    }
    if (self.sprite15.orientation == 1)
    {
        [self.sprite15 setDisplayFrame:[[spriteWWalkDown frames] objectAtIndex:0]];
    }
    
    if (self.sprite15.orientation == 2)
    {
        [self.sprite15 setDisplayFrame:[[spriteWWalkUp frames] objectAtIndex:0]];
    }
    
    if (self.sprite15.orientation == 3)
    {
        [self.sprite15 setDisplayFrame:[[spriteWWalkRight frames] objectAtIndex:0]];
    }
    
    if (self.sprite15.orientation == 4)
    {
        [self.sprite15 setDisplayFrame:[[spriteWWalkLeft frames] objectAtIndex:0]];
    }
}
-(void) movedownSprite15
{
    CGPoint sprite15Pos = self.sprite15.position;
    self.sprite15.orientation = 1;
    sprite15Pos.y -= theHKMap.tileSize.height;
    
    CGPoint tileCoord = [self tileCoordForPosition:sprite15Pos];
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
                    CGPoint tileCoord1 = [self tileCoordForPosition:sprite15.position];
                    int tileGID1 = [self.bgLayer tileGIDAt:tileCoord1];
                    [self.bgLayer removeTileAt:tileCoord1];
                    [self.bgLayer setTileGID:(tileGID1 - 15) at:tileCoord1];
                    
                    
                    if (self.sprite15.orientation == 1)
                    {
                        id actionMove = [CCMoveTo actionWithDuration:0.3 position:sprite15Pos];
                        id actionMove2;
                        if (self.sprite1LastRight)
                        {
                            actionMove2 = [CCAnimate actionWithAnimation:spriteWWalkDown restoreOriginalFrame:NO];
                        }
                        else
                        {
                            actionMove2 = [CCAnimate actionWithAnimation:spriteWWalkDown2 restoreOriginalFrame:NO];
                        }
                        id actionMoveDone = [CCCallFuncN actionWithTarget:self selector:@selector(finishActionSprite15)];
                        
                        [self.sprite15 runAction:[CCSpawn actionOne:[CCSequence actions:actionMove,actionMoveDone,nil] two:actionMove2]];
                        return;
                    }
                }
            }
        }
    }
    if (self.sprite15.orientation == 1)
    {
        [self.sprite15 setDisplayFrame:[[spriteWWalkDown frames] objectAtIndex:0]];
    }
    
    if (self.sprite15.orientation == 2)
    {
        [self.sprite15 setDisplayFrame:[[spriteWWalkUp frames] objectAtIndex:0]];
    }
    
    if (self.sprite15.orientation == 3)
    {
        [self.sprite15 setDisplayFrame:[[spriteWWalkRight frames] objectAtIndex:0]];
    }
    
    if (self.sprite15.orientation == 4)
    {
        [self.sprite15 setDisplayFrame:[[spriteWWalkLeft frames] objectAtIndex:0]];
    }
}

-(void) finishActionSprite15
{
    if (self.sprite15.orientation == 1)
    {
        [self.sprite15 setDisplayFrame:[[spriteWWalkDown frames] objectAtIndex:0]];
    }
    
    if (self.sprite15.orientation == 2)
    {
        [self.sprite15 setDisplayFrame:[[spriteWWalkUp frames] objectAtIndex:0]];
    }
    
    if (self.sprite15.orientation == 3)
    {
        [self.sprite15 setDisplayFrame:[[spriteWWalkRight frames] objectAtIndex:0]];
    }
    
    if (self.sprite15.orientation == 4)
    {
        [self.sprite15 setDisplayFrame:[[spriteWWalkLeft frames] objectAtIndex:0]];
    }
    self.hero.sprite15position = self.sprite15.position;
}


-(void)updateSprite16
{
    CGSize screenSize = [[CCDirector sharedDirector] winSize];
    int x = self.hero.position.x;
    int y = self.hero.position.y;
    
    int p = self.sprite16.position.x;
    int q = self.sprite16.position.y;
    
    int diffx = abs(x-p);
    int diffy = abs(y-q);
    
    if ((diffx > screenSize.width/1.5) || (diffy > screenSize.height/1.5))
    {
        return;
    }
    
    
    int rand = arc4random()%14;
    if (self.spriteEvenIsTalking)
    {
        return;
    }
    if (rand == 1)
    {
        [self moveleftSprite16];
    }
    if (rand == 2)
    {
        [self moverightSprite16];
    }
    if (rand == 3)
    {
        [self moveupSprite16];
    }
    if (rand == 4)
    {
        [self movedownSprite16];
    }
    return;
}

-(void) moveleftSprite16
{
    CGPoint sprite16Pos = self.sprite16.position;
    self.sprite16.orientation = 4;
    sprite16Pos.x -= theHKMap.tileSize.width;
    
    CGPoint tileCoord = [self tileCoordForPosition:sprite16Pos];
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
                    CGPoint tileCoord1 = [self tileCoordForPosition:sprite16.position];
                    int tileGID1 = [self.bgLayer tileGIDAt:tileCoord1];
                    [self.bgLayer removeTileAt:tileCoord1];
                    [self.bgLayer setTileGID:(tileGID1 - 16) at:tileCoord1];
                    
                    
                    if (self.sprite16.orientation == 4)
                    {
                        id actionMove = [CCMoveTo actionWithDuration:0.3 position:sprite16Pos];
                        id actionMove2 = [CCAnimate actionWithAnimation:spriteYWalkLeft restoreOriginalFrame:NO];
                        
                        id actionMoveDone = [CCCallFuncN actionWithTarget:self selector:@selector(finishActionSprite16)];
                        
                        [self.sprite16 runAction:[CCSpawn actionOne:[CCSequence actions:actionMove,actionMoveDone,nil] two:actionMove2]];
                        return;
                    }
                }
            }
        }
    }
    if (self.sprite16.orientation == 1)
    {
        [self.sprite16 setDisplayFrame:[[spriteYWalkDown frames] objectAtIndex:0]];
    }
    
    if (self.sprite16.orientation == 2)
    {
        [self.sprite16 setDisplayFrame:[[spriteYWalkUp frames] objectAtIndex:0]];
    }
    
    if (self.sprite16.orientation == 3)
    {
        [self.sprite16 setDisplayFrame:[[spriteYWalkRight frames] objectAtIndex:0]];
    }
    
    if (self.sprite16.orientation == 4)
    {
        [self.sprite16 setDisplayFrame:[[spriteYWalkLeft frames] objectAtIndex:0]];
    }
}
-(void) moverightSprite16
{
    CGPoint sprite16Pos = self.sprite16.position;
    self.sprite16.orientation = 3;
    sprite16Pos.x += theHKMap.tileSize.width;
    
    CGPoint tileCoord = [self tileCoordForPosition:sprite16Pos];
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
                    CGPoint tileCoord1 = [self tileCoordForPosition:sprite16.position];
                    int tileGID1 = [self.bgLayer tileGIDAt:tileCoord1];
                    [self.bgLayer removeTileAt:tileCoord1];
                    [self.bgLayer setTileGID:(tileGID1 - 16) at:tileCoord1];
                    
                    
                    if (self.sprite16.orientation == 3)
                    {
                        id actionMove = [CCMoveTo actionWithDuration:0.3 position:sprite16Pos];
                        id actionMove2 = [CCAnimate actionWithAnimation:spriteYWalkRight restoreOriginalFrame:NO];
                        
                        id actionMoveDone = [CCCallFuncN actionWithTarget:self selector:@selector(finishActionSprite16)];
                        
                        [self.sprite16 runAction:[CCSpawn actionOne:[CCSequence actions:actionMove,actionMoveDone,nil] two:actionMove2]];
                        return;
                    }
                }
            }
        }
    }
    if (self.sprite16.orientation == 1)
    {
        [self.sprite16 setDisplayFrame:[[spriteYWalkDown frames] objectAtIndex:0]];
    }
    
    if (self.sprite16.orientation == 2)
    {
        [self.sprite16 setDisplayFrame:[[spriteYWalkUp frames] objectAtIndex:0]];
    }
    
    if (self.sprite16.orientation == 3)
    {
        [self.sprite16 setDisplayFrame:[[spriteYWalkRight frames] objectAtIndex:0]];
    }
    
    if (self.sprite16.orientation == 4)
    {
        [self.sprite16 setDisplayFrame:[[spriteYWalkLeft frames] objectAtIndex:0]];
    }
}
-(void) moveupSprite16
{
    CGPoint sprite16Pos = self.sprite16.position;
    self.sprite16.orientation = 2;
    sprite16Pos.y += theHKMap.tileSize.height;
    
    CGPoint tileCoord = [self tileCoordForPosition:sprite16Pos];
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
                    CGPoint tileCoord1 = [self tileCoordForPosition:sprite16.position];
                    int tileGID1 = [self.bgLayer tileGIDAt:tileCoord1];
                    [self.bgLayer removeTileAt:tileCoord1];
                    [self.bgLayer setTileGID:(tileGID1 - 16) at:tileCoord1];
                    
                    
                    if (self.sprite16.orientation == 2)
                    {
                        id actionMove = [CCMoveTo actionWithDuration:0.3 position:sprite16Pos];
                        id actionMove2;
                        if (self.sprite1LastRight)
                        {
                            actionMove2 = [CCAnimate actionWithAnimation:spriteYWalkUp restoreOriginalFrame:NO];
                        }
                        else
                        {
                            actionMove2 = [CCAnimate actionWithAnimation:spriteYWalkUp2 restoreOriginalFrame:NO];
                        }
                        id actionMoveDone = [CCCallFuncN actionWithTarget:self selector:@selector(finishActionSprite16)];
                        
                        [self.sprite16 runAction:[CCSpawn actionOne:[CCSequence actions:actionMove,actionMoveDone,nil] two:actionMove2]];
                        return;
                    }
                }
            }
        }
    }
    if (self.sprite16.orientation == 1)
    {
        [self.sprite16 setDisplayFrame:[[spriteYWalkDown frames] objectAtIndex:0]];
    }
    
    if (self.sprite16.orientation == 2)
    {
        [self.sprite16 setDisplayFrame:[[spriteYWalkUp frames] objectAtIndex:0]];
    }
    
    if (self.sprite16.orientation == 3)
    {
        [self.sprite16 setDisplayFrame:[[spriteYWalkRight frames] objectAtIndex:0]];
    }
    
    if (self.sprite16.orientation == 4)
    {
        [self.sprite16 setDisplayFrame:[[spriteYWalkLeft frames] objectAtIndex:0]];
    }
}
-(void) movedownSprite16
{
    CGPoint sprite16Pos = self.sprite16.position;
    self.sprite16.orientation = 1;
    sprite16Pos.y -= theHKMap.tileSize.height;
    
    CGPoint tileCoord = [self tileCoordForPosition:sprite16Pos];
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
                    CGPoint tileCoord1 = [self tileCoordForPosition:sprite16.position];
                    int tileGID1 = [self.bgLayer tileGIDAt:tileCoord1];
                    [self.bgLayer removeTileAt:tileCoord1];
                    [self.bgLayer setTileGID:(tileGID1 - 16) at:tileCoord1];
                    
                    
                    if (self.sprite16.orientation == 1)
                    {
                        id actionMove = [CCMoveTo actionWithDuration:0.3 position:sprite16Pos];
                        id actionMove2;
                        if (self.sprite1LastRight)
                        {
                            actionMove2 = [CCAnimate actionWithAnimation:spriteYWalkDown restoreOriginalFrame:NO];
                        }
                        else
                        {
                            actionMove2 = [CCAnimate actionWithAnimation:spriteYWalkDown2 restoreOriginalFrame:NO];
                        }
                        id actionMoveDone = [CCCallFuncN actionWithTarget:self selector:@selector(finishActionSprite16)];
                        
                        [self.sprite16 runAction:[CCSpawn actionOne:[CCSequence actions:actionMove,actionMoveDone,nil] two:actionMove2]];
                        return;
                    }
                }
            }
        }
    }
    if (self.sprite16.orientation == 1)
    {
        [self.sprite16 setDisplayFrame:[[spriteYWalkDown frames] objectAtIndex:0]];
    }
    
    if (self.sprite16.orientation == 2)
    {
        [self.sprite16 setDisplayFrame:[[spriteYWalkUp frames] objectAtIndex:0]];
    }
    
    if (self.sprite16.orientation == 3)
    {
        [self.sprite16 setDisplayFrame:[[spriteYWalkRight frames] objectAtIndex:0]];
    }
    
    if (self.sprite16.orientation == 4)
    {
        [self.sprite16 setDisplayFrame:[[spriteYWalkLeft frames] objectAtIndex:0]];
    }
}

-(void) finishActionSprite16
{
    if (self.sprite16.orientation == 1)
    {
        [self.sprite16 setDisplayFrame:[[spriteYWalkDown frames] objectAtIndex:0]];
    }
    
    if (self.sprite16.orientation == 2)
    {
        [self.sprite16 setDisplayFrame:[[spriteYWalkUp frames] objectAtIndex:0]];
    }
    
    if (self.sprite16.orientation == 3)
    {
        [self.sprite16 setDisplayFrame:[[spriteYWalkRight frames] objectAtIndex:0]];
    }
    
    if (self.sprite16.orientation == 4)
    {
        [self.sprite16 setDisplayFrame:[[spriteYWalkLeft frames] objectAtIndex:0]];
    }
    self.hero.sprite16position = self.sprite16.position;
}


-(void)updateSprite17
{
    CGSize screenSize = [[CCDirector sharedDirector] winSize];
    int x = self.hero.position.x;
    int y = self.hero.position.y;
    
    int p = self.sprite17.position.x;
    int q = self.sprite17.position.y;
    
    int diffx = abs(x-p);
    int diffy = abs(y-q);
    
    if ((diffx > screenSize.width/1.5) || (diffy > screenSize.height/1.5))
    {
        return;
    }
    
    
    int rand = arc4random()%14;
    if (self.spriteOddIsTalking)
    {
        return;
    }
    if (rand == 1)
    {
        [self moveleftSprite17];
    }
    if (rand == 2)
    {
        [self moverightSprite17];
    }
    if (rand == 3)
    {
        [self moveupSprite17];
    }
    if (rand == 4)
    {
        [self movedownSprite17];
    }
    return;
}

-(void) moveleftSprite17
{
    CGPoint sprite17Pos = self.sprite17.position;
    self.sprite17.orientation = 4;
    sprite17Pos.x -= theHKMap.tileSize.width;
    
    CGPoint tileCoord = [self tileCoordForPosition:sprite17Pos];
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
                    CGPoint tileCoord1 = [self tileCoordForPosition:sprite17.position];
                    int tileGID1 = [self.bgLayer tileGIDAt:tileCoord1];
                    [self.bgLayer removeTileAt:tileCoord1];
                    [self.bgLayer setTileGID:(tileGID1 - 17) at:tileCoord1];
                    
                    
                    if (self.sprite17.orientation == 4)
                    {
                        id actionMove = [CCMoveTo actionWithDuration:0.3 position:sprite17Pos];
                        id actionMove2 = [CCAnimate actionWithAnimation:spriteZAWalkLeft restoreOriginalFrame:NO];
                        
                        id actionMoveDone = [CCCallFuncN actionWithTarget:self selector:@selector(finishActionSprite17)];
                        
                        [self.sprite17 runAction:[CCSpawn actionOne:[CCSequence actions:actionMove,actionMoveDone,nil] two:actionMove2]];
                        return;
                    }
                }
            }
        }
    }
    if (self.sprite17.orientation == 1)
    {
        [self.sprite17 setDisplayFrame:[[spriteZAWalkDown frames] objectAtIndex:0]];
    }
    
    if (self.sprite17.orientation == 2)
    {
        [self.sprite17 setDisplayFrame:[[spriteZAWalkUp frames] objectAtIndex:0]];
    }
    
    if (self.sprite17.orientation == 3)
    {
        [self.sprite17 setDisplayFrame:[[spriteZAWalkRight frames] objectAtIndex:0]];
    }
    
    if (self.sprite17.orientation == 4)
    {
        [self.sprite17 setDisplayFrame:[[spriteZAWalkLeft frames] objectAtIndex:0]];
    }
}
-(void) moverightSprite17
{
    CGPoint sprite17Pos = self.sprite17.position;
    self.sprite17.orientation = 3;
    sprite17Pos.x += theHKMap.tileSize.width;
    
    CGPoint tileCoord = [self tileCoordForPosition:sprite17Pos];
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
                    CGPoint tileCoord1 = [self tileCoordForPosition:sprite17.position];
                    int tileGID1 = [self.bgLayer tileGIDAt:tileCoord1];
                    [self.bgLayer removeTileAt:tileCoord1];
                    [self.bgLayer setTileGID:(tileGID1 - 17) at:tileCoord1];
                    
                    
                    if (self.sprite17.orientation == 3)
                    {
                        id actionMove = [CCMoveTo actionWithDuration:0.3 position:sprite17Pos];
                        id actionMove2 = [CCAnimate actionWithAnimation:spriteZAWalkRight restoreOriginalFrame:NO];
                        
                        id actionMoveDone = [CCCallFuncN actionWithTarget:self selector:@selector(finishActionSprite17)];
                        
                        [self.sprite17 runAction:[CCSpawn actionOne:[CCSequence actions:actionMove,actionMoveDone,nil] two:actionMove2]];
                        return;
                    }
                }
            }
        }
    }
    if (self.sprite17.orientation == 1)
    {
        [self.sprite17 setDisplayFrame:[[spriteZAWalkDown frames] objectAtIndex:0]];
    }
    
    if (self.sprite17.orientation == 2)
    {
        [self.sprite17 setDisplayFrame:[[spriteZAWalkUp frames] objectAtIndex:0]];
    }
    
    if (self.sprite17.orientation == 3)
    {
        [self.sprite17 setDisplayFrame:[[spriteZAWalkRight frames] objectAtIndex:0]];
    }
    
    if (self.sprite17.orientation == 4)
    {
        [self.sprite17 setDisplayFrame:[[spriteZAWalkLeft frames] objectAtIndex:0]];
    }
}
-(void) moveupSprite17
{
    CGPoint sprite17Pos = self.sprite17.position;
    self.sprite17.orientation = 2;
    sprite17Pos.y += theHKMap.tileSize.height;
    
    CGPoint tileCoord = [self tileCoordForPosition:sprite17Pos];
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
                    CGPoint tileCoord1 = [self tileCoordForPosition:sprite17.position];
                    int tileGID1 = [self.bgLayer tileGIDAt:tileCoord1];
                    [self.bgLayer removeTileAt:tileCoord1];
                    [self.bgLayer setTileGID:(tileGID1 - 17) at:tileCoord1];
                    
                    
                    if (self.sprite17.orientation == 2)
                    {
                        id actionMove = [CCMoveTo actionWithDuration:0.3 position:sprite17Pos];
                        id actionMove2;
                        if (self.sprite1LastRight)
                        {
                            actionMove2 = [CCAnimate actionWithAnimation:spriteZAWalkUp restoreOriginalFrame:NO];
                        }
                        else
                        {
                            actionMove2 = [CCAnimate actionWithAnimation:spriteZAWalkUp2 restoreOriginalFrame:NO];
                        }
                        id actionMoveDone = [CCCallFuncN actionWithTarget:self selector:@selector(finishActionSprite17)];
                        
                        [self.sprite17 runAction:[CCSpawn actionOne:[CCSequence actions:actionMove,actionMoveDone,nil] two:actionMove2]];
                        return;
                    }
                }
            }
        }
    }
    if (self.sprite17.orientation == 1)
    {
        [self.sprite17 setDisplayFrame:[[spriteZAWalkDown frames] objectAtIndex:0]];
    }
    
    if (self.sprite17.orientation == 2)
    {
        [self.sprite17 setDisplayFrame:[[spriteZAWalkUp frames] objectAtIndex:0]];
    }
    
    if (self.sprite17.orientation == 3)
    {
        [self.sprite17 setDisplayFrame:[[spriteZAWalkRight frames] objectAtIndex:0]];
    }
    
    if (self.sprite17.orientation == 4)
    {
        [self.sprite17 setDisplayFrame:[[spriteZAWalkLeft frames] objectAtIndex:0]];
    }
}
-(void) movedownSprite17
{
    CGPoint sprite17Pos = self.sprite17.position;
    self.sprite17.orientation = 1;
    sprite17Pos.y -= theHKMap.tileSize.height;
    
    CGPoint tileCoord = [self tileCoordForPosition:sprite17Pos];
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
                    CGPoint tileCoord1 = [self tileCoordForPosition:sprite17.position];
                    int tileGID1 = [self.bgLayer tileGIDAt:tileCoord1];
                    [self.bgLayer removeTileAt:tileCoord1];
                    [self.bgLayer setTileGID:(tileGID1 - 17) at:tileCoord1];
                    
                    
                    if (self.sprite17.orientation == 1)
                    {
                        id actionMove = [CCMoveTo actionWithDuration:0.3 position:sprite17Pos];
                        id actionMove2;
                        if (self.sprite1LastRight)
                        {
                            actionMove2 = [CCAnimate actionWithAnimation:spriteZAWalkDown restoreOriginalFrame:NO];
                        }
                        else
                        {
                            actionMove2 = [CCAnimate actionWithAnimation:spriteZAWalkDown2 restoreOriginalFrame:NO];
                        }
                        id actionMoveDone = [CCCallFuncN actionWithTarget:self selector:@selector(finishActionSprite17)];
                        
                        [self.sprite17 runAction:[CCSpawn actionOne:[CCSequence actions:actionMove,actionMoveDone,nil] two:actionMove2]];
                        return;
                    }
                }
            }
        }
    }
    if (self.sprite17.orientation == 1)
    {
        [self.sprite17 setDisplayFrame:[[spriteZAWalkDown frames] objectAtIndex:0]];
    }
    
    if (self.sprite17.orientation == 2)
    {
        [self.sprite17 setDisplayFrame:[[spriteZAWalkUp frames] objectAtIndex:0]];
    }
    
    if (self.sprite17.orientation == 3)
    {
        [self.sprite17 setDisplayFrame:[[spriteZAWalkRight frames] objectAtIndex:0]];
    }
    
    if (self.sprite17.orientation == 4)
    {
        [self.sprite17 setDisplayFrame:[[spriteZAWalkLeft frames] objectAtIndex:0]];
    }
}

-(void) finishActionSprite17
{
    if (self.sprite17.orientation == 1)
    {
        [self.sprite17 setDisplayFrame:[[spriteZAWalkDown frames] objectAtIndex:0]];
    }
    
    if (self.sprite17.orientation == 2)
    {
        [self.sprite17 setDisplayFrame:[[spriteZAWalkUp frames] objectAtIndex:0]];
    }
    
    if (self.sprite17.orientation == 3)
    {
        [self.sprite17 setDisplayFrame:[[spriteZAWalkRight frames] objectAtIndex:0]];
    }
    
    if (self.sprite17.orientation == 4)
    {
        [self.sprite17 setDisplayFrame:[[spriteZAWalkLeft frames] objectAtIndex:0]];
    }
    self.hero.sprite17position = self.sprite17.position;
}


-(void)updateSprite18
{
    CGSize screenSize = [[CCDirector sharedDirector] winSize];
    int x = self.hero.position.x;
    int y = self.hero.position.y;
    
    int p = self.sprite18.position.x;
    int q = self.sprite18.position.y;
    
    int diffx = abs(x-p);
    int diffy = abs(y-q);
    
    if ((diffx > screenSize.width/1.5) || (diffy > screenSize.height/1.5))
    {
        return;
    }
    
    
    int rand = arc4random()%14;
    if (self.spriteEvenIsTalking)
    {
        return;
    }
    if (rand == 1)
    {
        [self moveleftSprite18];
    }
    if (rand == 2)
    {
        [self moverightSprite18];
    }
    if (rand == 3)
    {
        [self moveupSprite18];
    }
    if (rand == 4)
    {
        [self movedownSprite18];
    }
    return;
}

-(void) moveleftSprite18
{
    CGPoint sprite18Pos = self.sprite18.position;
    self.sprite18.orientation = 4;
    sprite18Pos.x -= theHKMap.tileSize.width;
    
    CGPoint tileCoord = [self tileCoordForPosition:sprite18Pos];
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
                    CGPoint tileCoord1 = [self tileCoordForPosition:sprite18.position];
                    int tileGID1 = [self.bgLayer tileGIDAt:tileCoord1];
                    [self.bgLayer removeTileAt:tileCoord1];
                    [self.bgLayer setTileGID:(tileGID1 - 18) at:tileCoord1];
                    
                    
                    if (self.sprite18.orientation == 4)
                    {
                        id actionMove = [CCMoveTo actionWithDuration:0.3 position:sprite18Pos];
                        id actionMove2 = [CCAnimate actionWithAnimation:spriteTWalkLeft restoreOriginalFrame:NO];
                        
                        id actionMoveDone = [CCCallFuncN actionWithTarget:self selector:@selector(finishActionSprite18)];
                        
                        [self.sprite18 runAction:[CCSpawn actionOne:[CCSequence actions:actionMove,actionMoveDone,nil] two:actionMove2]];
                        return;
                    }
                }
            }
        }
    }
    if (self.sprite18.orientation == 1)
    {
        [self.sprite18 setDisplayFrame:[[spriteTWalkDown frames] objectAtIndex:0]];
    }
    
    if (self.sprite18.orientation == 2)
    {
        [self.sprite18 setDisplayFrame:[[spriteTWalkUp frames] objectAtIndex:0]];
    }
    
    if (self.sprite18.orientation == 3)
    {
        [self.sprite18 setDisplayFrame:[[spriteTWalkRight frames] objectAtIndex:0]];
    }
    
    if (self.sprite18.orientation == 4)
    {
        [self.sprite18 setDisplayFrame:[[spriteTWalkLeft frames] objectAtIndex:0]];
    }
}
-(void) moverightSprite18
{
    CGPoint sprite18Pos = self.sprite18.position;
    self.sprite18.orientation = 3;
    sprite18Pos.x += theHKMap.tileSize.width;
    
    CGPoint tileCoord = [self tileCoordForPosition:sprite18Pos];
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
                    CGPoint tileCoord1 = [self tileCoordForPosition:sprite18.position];
                    int tileGID1 = [self.bgLayer tileGIDAt:tileCoord1];
                    [self.bgLayer removeTileAt:tileCoord1];
                    [self.bgLayer setTileGID:(tileGID1 - 18) at:tileCoord1];
                    
                    
                    if (self.sprite18.orientation == 3)
                    {
                        id actionMove = [CCMoveTo actionWithDuration:0.3 position:sprite18Pos];
                        id actionMove2 = [CCAnimate actionWithAnimation:spriteTWalkRight restoreOriginalFrame:NO];
                        
                        id actionMoveDone = [CCCallFuncN actionWithTarget:self selector:@selector(finishActionSprite18)];
                        
                        [self.sprite18 runAction:[CCSpawn actionOne:[CCSequence actions:actionMove,actionMoveDone,nil] two:actionMove2]];
                        return;
                    }
                }
            }
        }
    }
    if (self.sprite18.orientation == 1)
    {
        [self.sprite18 setDisplayFrame:[[spriteTWalkDown frames] objectAtIndex:0]];
    }
    
    if (self.sprite18.orientation == 2)
    {
        [self.sprite18 setDisplayFrame:[[spriteTWalkUp frames] objectAtIndex:0]];
    }
    
    if (self.sprite18.orientation == 3)
    {
        [self.sprite18 setDisplayFrame:[[spriteTWalkRight frames] objectAtIndex:0]];
    }
    
    if (self.sprite18.orientation == 4)
    {
        [self.sprite18 setDisplayFrame:[[spriteTWalkLeft frames] objectAtIndex:0]];
    }
}
-(void) moveupSprite18
{
    CGPoint sprite18Pos = self.sprite18.position;
    self.sprite18.orientation = 2;
    sprite18Pos.y += theHKMap.tileSize.height;
    
    CGPoint tileCoord = [self tileCoordForPosition:sprite18Pos];
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
                    CGPoint tileCoord1 = [self tileCoordForPosition:sprite18.position];
                    int tileGID1 = [self.bgLayer tileGIDAt:tileCoord1];
                    [self.bgLayer removeTileAt:tileCoord1];
                    [self.bgLayer setTileGID:(tileGID1 - 18) at:tileCoord1];
                    
                    
                    if (self.sprite18.orientation == 2)
                    {
                        id actionMove = [CCMoveTo actionWithDuration:0.3 position:sprite18Pos];
                        id actionMove2;
                        if (self.sprite1LastRight)
                        {
                            actionMove2 = [CCAnimate actionWithAnimation:spriteTWalkUp restoreOriginalFrame:NO];
                        }
                        else
                        {
                            actionMove2 = [CCAnimate actionWithAnimation:spriteTWalkUp2 restoreOriginalFrame:NO];
                        }
                        id actionMoveDone = [CCCallFuncN actionWithTarget:self selector:@selector(finishActionSprite18)];
                        
                        [self.sprite18 runAction:[CCSpawn actionOne:[CCSequence actions:actionMove,actionMoveDone,nil] two:actionMove2]];
                        return;
                    }
                }
            }
        }
    }
    if (self.sprite18.orientation == 1)
    {
        [self.sprite18 setDisplayFrame:[[spriteTWalkDown frames] objectAtIndex:0]];
    }
    
    if (self.sprite18.orientation == 2)
    {
        [self.sprite18 setDisplayFrame:[[spriteTWalkUp frames] objectAtIndex:0]];
    }
    
    if (self.sprite18.orientation == 3)
    {
        [self.sprite18 setDisplayFrame:[[spriteTWalkRight frames] objectAtIndex:0]];
    }
    
    if (self.sprite18.orientation == 4)
    {
        [self.sprite18 setDisplayFrame:[[spriteTWalkLeft frames] objectAtIndex:0]];
    }
}
-(void) movedownSprite18
{
    CGPoint sprite18Pos = self.sprite18.position;
    self.sprite18.orientation = 1;
    sprite18Pos.y -= theHKMap.tileSize.height;
    
    CGPoint tileCoord = [self tileCoordForPosition:sprite18Pos];
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
                    CGPoint tileCoord1 = [self tileCoordForPosition:sprite18.position];
                    int tileGID1 = [self.bgLayer tileGIDAt:tileCoord1];
                    [self.bgLayer removeTileAt:tileCoord1];
                    [self.bgLayer setTileGID:(tileGID1 - 18) at:tileCoord1];
                    
                    
                    if (self.sprite18.orientation == 1)
                    {
                        id actionMove = [CCMoveTo actionWithDuration:0.3 position:sprite18Pos];
                        id actionMove2;
                        if (self.sprite1LastRight)
                        {
                            actionMove2 = [CCAnimate actionWithAnimation:spriteTWalkDown restoreOriginalFrame:NO];
                        }
                        else
                        {
                            actionMove2 = [CCAnimate actionWithAnimation:spriteTWalkDown2 restoreOriginalFrame:NO];
                        }
                        id actionMoveDone = [CCCallFuncN actionWithTarget:self selector:@selector(finishActionSprite18)];
                        
                        [self.sprite18 runAction:[CCSpawn actionOne:[CCSequence actions:actionMove,actionMoveDone,nil] two:actionMove2]];
                        return;
                    }
                }
            }
        }
    }
    if (self.sprite18.orientation == 1)
    {
        [self.sprite18 setDisplayFrame:[[spriteTWalkDown frames] objectAtIndex:0]];
    }
    
    if (self.sprite18.orientation == 2)
    {
        [self.sprite18 setDisplayFrame:[[spriteTWalkUp frames] objectAtIndex:0]];
    }
    
    if (self.sprite18.orientation == 3)
    {
        [self.sprite18 setDisplayFrame:[[spriteTWalkRight frames] objectAtIndex:0]];
    }
    
    if (self.sprite18.orientation == 4)
    {
        [self.sprite18 setDisplayFrame:[[spriteTWalkLeft frames] objectAtIndex:0]];
    }
}

-(void) finishActionSprite18
{
    if (self.sprite18.orientation == 1)
    {
        [self.sprite18 setDisplayFrame:[[spriteTWalkDown frames] objectAtIndex:0]];
    }
    
    if (self.sprite18.orientation == 2)
    {
        [self.sprite18 setDisplayFrame:[[spriteTWalkUp frames] objectAtIndex:0]];
    }
    
    if (self.sprite18.orientation == 3)
    {
        [self.sprite18 setDisplayFrame:[[spriteTWalkRight frames] objectAtIndex:0]];
    }
    
    if (self.sprite18.orientation == 4)
    {
        [self.sprite18 setDisplayFrame:[[spriteTWalkLeft frames] objectAtIndex:0]];
    }
    self.hero.sprite18position = self.sprite18.position;
}


-(void)updateSprite19
{
    CGSize screenSize = [[CCDirector sharedDirector] winSize];
    int x = self.hero.position.x;
    int y = self.hero.position.y;
    
    int p = self.sprite19.position.x;
    int q = self.sprite19.position.y;
    
    int diffx = abs(x-p);
    int diffy = abs(y-q);
    
    if ((diffx > screenSize.width/1.5) || (diffy > screenSize.height/1.5))
    {
        return;
    }
    
    
    int rand = arc4random()%14;
    if (self.spriteOddIsTalking)
    {
        return;
    }
    if (rand == 1)
    {
        [self moveleftSprite19];
    }
    if (rand == 2)
    {
        [self moverightSprite19];
    }
    if (rand == 3)
    {
        [self moveupSprite19];
    }
    if (rand == 4)
    {
        [self movedownSprite19];
    }
    return;
}

-(void) moveleftSprite19
{
    CGPoint sprite19Pos = self.sprite19.position;
    self.sprite19.orientation = 4;
    sprite19Pos.x -= theHKMap.tileSize.width;
    
    CGPoint tileCoord = [self tileCoordForPosition:sprite19Pos];
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
                    CGPoint tileCoord1 = [self tileCoordForPosition:sprite19.position];
                    int tileGID1 = [self.bgLayer tileGIDAt:tileCoord1];
                    [self.bgLayer removeTileAt:tileCoord1];
                    [self.bgLayer setTileGID:(tileGID1 - 19) at:tileCoord1];
                    
                    
                    if (self.sprite19.orientation == 4)
                    {
                        id actionMove = [CCMoveTo actionWithDuration:0.3 position:sprite19Pos];
                        id actionMove2 = [CCAnimate actionWithAnimation:spriteBWalkLeft restoreOriginalFrame:NO];
                        
                        id actionMoveDone = [CCCallFuncN actionWithTarget:self selector:@selector(finishActionSprite19)];
                        
                        [self.sprite19 runAction:[CCSpawn actionOne:[CCSequence actions:actionMove,actionMoveDone,nil] two:actionMove2]];
                        return;
                    }
                }
            }
        }
    }
    if (self.sprite19.orientation == 1)
    {
        [self.sprite19 setDisplayFrame:[[spriteBWalkDown frames] objectAtIndex:0]];
    }
    
    if (self.sprite19.orientation == 2)
    {
        [self.sprite19 setDisplayFrame:[[spriteBWalkUp frames] objectAtIndex:0]];
    }
    
    if (self.sprite19.orientation == 3)
    {
        [self.sprite19 setDisplayFrame:[[spriteBWalkRight frames] objectAtIndex:0]];
    }
    
    if (self.sprite19.orientation == 4)
    {
        [self.sprite19 setDisplayFrame:[[spriteBWalkLeft frames] objectAtIndex:0]];
    }
}
-(void) moverightSprite19
{
    CGPoint sprite19Pos = self.sprite19.position;
    self.sprite19.orientation = 3;
    sprite19Pos.x += theHKMap.tileSize.width;
    
    CGPoint tileCoord = [self tileCoordForPosition:sprite19Pos];
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
                    CGPoint tileCoord1 = [self tileCoordForPosition:sprite19.position];
                    int tileGID1 = [self.bgLayer tileGIDAt:tileCoord1];
                    [self.bgLayer removeTileAt:tileCoord1];
                    [self.bgLayer setTileGID:(tileGID1 - 19) at:tileCoord1];
                    
                    
                    if (self.sprite19.orientation == 3)
                    {
                        id actionMove = [CCMoveTo actionWithDuration:0.3 position:sprite19Pos];
                        id actionMove2 = [CCAnimate actionWithAnimation:spriteBWalkRight restoreOriginalFrame:NO];
                        
                        id actionMoveDone = [CCCallFuncN actionWithTarget:self selector:@selector(finishActionSprite19)];
                        
                        [self.sprite19 runAction:[CCSpawn actionOne:[CCSequence actions:actionMove,actionMoveDone,nil] two:actionMove2]];
                        return;
                    }
                }
            }
        }
    }
    if (self.sprite19.orientation == 1)
    {
        [self.sprite19 setDisplayFrame:[[spriteBWalkDown frames] objectAtIndex:0]];
    }
    
    if (self.sprite19.orientation == 2)
    {
        [self.sprite19 setDisplayFrame:[[spriteBWalkUp frames] objectAtIndex:0]];
    }
    
    if (self.sprite19.orientation == 3)
    {
        [self.sprite19 setDisplayFrame:[[spriteBWalkRight frames] objectAtIndex:0]];
    }
    
    if (self.sprite19.orientation == 4)
    {
        [self.sprite19 setDisplayFrame:[[spriteBWalkLeft frames] objectAtIndex:0]];
    }
}
-(void) moveupSprite19
{
    CGPoint sprite19Pos = self.sprite19.position;
    self.sprite19.orientation = 2;
    sprite19Pos.y += theHKMap.tileSize.height;
    
    CGPoint tileCoord = [self tileCoordForPosition:sprite19Pos];
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
                    CGPoint tileCoord1 = [self tileCoordForPosition:sprite19.position];
                    int tileGID1 = [self.bgLayer tileGIDAt:tileCoord1];
                    [self.bgLayer removeTileAt:tileCoord1];
                    [self.bgLayer setTileGID:(tileGID1 - 19) at:tileCoord1];
                    
                    
                    if (self.sprite19.orientation == 2)
                    {
                        id actionMove = [CCMoveTo actionWithDuration:0.3 position:sprite19Pos];
                        id actionMove2;
                        if (self.sprite1LastRight)
                        {
                            actionMove2 = [CCAnimate actionWithAnimation:spriteBWalkUp restoreOriginalFrame:NO];
                        }
                        else
                        {
                            actionMove2 = [CCAnimate actionWithAnimation:spriteBWalkUp2 restoreOriginalFrame:NO];
                        }
                        id actionMoveDone = [CCCallFuncN actionWithTarget:self selector:@selector(finishActionSprite19)];
                        
                        [self.sprite19 runAction:[CCSpawn actionOne:[CCSequence actions:actionMove,actionMoveDone,nil] two:actionMove2]];
                        return;
                    }
                }
            }
        }
    }
    if (self.sprite19.orientation == 1)
    {
        [self.sprite19 setDisplayFrame:[[spriteBWalkDown frames] objectAtIndex:0]];
    }
    
    if (self.sprite19.orientation == 2)
    {
        [self.sprite19 setDisplayFrame:[[spriteBWalkUp frames] objectAtIndex:0]];
    }
    
    if (self.sprite19.orientation == 3)
    {
        [self.sprite19 setDisplayFrame:[[spriteBWalkRight frames] objectAtIndex:0]];
    }
    
    if (self.sprite19.orientation == 4)
    {
        [self.sprite19 setDisplayFrame:[[spriteBWalkLeft frames] objectAtIndex:0]];
    }
}
-(void) movedownSprite19
{
    CGPoint sprite19Pos = self.sprite19.position;
    self.sprite19.orientation = 1;
    sprite19Pos.y -= theHKMap.tileSize.height;
    
    CGPoint tileCoord = [self tileCoordForPosition:sprite19Pos];
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
                    CGPoint tileCoord1 = [self tileCoordForPosition:sprite19.position];
                    int tileGID1 = [self.bgLayer tileGIDAt:tileCoord1];
                    [self.bgLayer removeTileAt:tileCoord1];
                    [self.bgLayer setTileGID:(tileGID1 - 19) at:tileCoord1];
                    
                    
                    if (self.sprite19.orientation == 1)
                    {
                        id actionMove = [CCMoveTo actionWithDuration:0.3 position:sprite19Pos];
                        id actionMove2;
                        if (self.sprite1LastRight)
                        {
                            actionMove2 = [CCAnimate actionWithAnimation:spriteBWalkDown restoreOriginalFrame:NO];
                        }
                        else
                        {
                            actionMove2 = [CCAnimate actionWithAnimation:spriteBWalkDown2 restoreOriginalFrame:NO];
                        }
                        id actionMoveDone = [CCCallFuncN actionWithTarget:self selector:@selector(finishActionSprite19)];
                        
                        [self.sprite19 runAction:[CCSpawn actionOne:[CCSequence actions:actionMove,actionMoveDone,nil] two:actionMove2]];
                        return;
                    }
                }
            }
        }
    }
    if (self.sprite19.orientation == 1)
    {
        [self.sprite19 setDisplayFrame:[[spriteBWalkDown frames] objectAtIndex:0]];
    }
    
    if (self.sprite19.orientation == 2)
    {
        [self.sprite19 setDisplayFrame:[[spriteBWalkUp frames] objectAtIndex:0]];
    }
    
    if (self.sprite19.orientation == 3)
    {
        [self.sprite19 setDisplayFrame:[[spriteBWalkRight frames] objectAtIndex:0]];
    }
    
    if (self.sprite19.orientation == 4)
    {
        [self.sprite19 setDisplayFrame:[[spriteBWalkLeft frames] objectAtIndex:0]];
    }
}

-(void) finishActionSprite19
{
    if (self.sprite19.orientation == 1)
    {
        [self.sprite19 setDisplayFrame:[[spriteBWalkDown frames] objectAtIndex:0]];
    }
    
    if (self.sprite19.orientation == 2)
    {
        [self.sprite19 setDisplayFrame:[[spriteBWalkUp frames] objectAtIndex:0]];
    }
    
    if (self.sprite19.orientation == 3)
    {
        [self.sprite19 setDisplayFrame:[[spriteBWalkRight frames] objectAtIndex:0]];
    }
    
    if (self.sprite19.orientation == 4)
    {
        [self.sprite19 setDisplayFrame:[[spriteBWalkLeft frames] objectAtIndex:0]];
    }
    self.hero.sprite19position = self.sprite19.position;
}


-(void)updateSprite20
{
    CGSize screenSize = [[CCDirector sharedDirector] winSize];
    int x = self.hero.position.x;
    int y = self.hero.position.y;
    
    int p = self.sprite20.position.x;
    int q = self.sprite20.position.y;
    
    int diffx = abs(x-p);
    int diffy = abs(y-q);
    
    if ((diffx > screenSize.width/1.5) || (diffy > screenSize.height/1.5))
    {
        return;
    }
    
    
    int rand = arc4random()%14;
    if (self.spriteEvenIsTalking)
    {
        return;
    }
    if (rand == 1)
    {
        [self moveleftSprite20];
    }
    if (rand == 2)
    {
        [self moverightSprite20];
    }
    if (rand == 3)
    {
        [self moveupSprite20];
    }
    if (rand == 4)
    {
        [self movedownSprite20];
    }
    return;
}

-(void) moveleftSprite20
{
    CGPoint sprite20Pos = self.sprite20.position;
    self.sprite20.orientation = 4;
    sprite20Pos.x -= theHKMap.tileSize.width;
    
    CGPoint tileCoord = [self tileCoordForPosition:sprite20Pos];
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
                    CGPoint tileCoord1 = [self tileCoordForPosition:sprite20.position];
                    int tileGID1 = [self.bgLayer tileGIDAt:tileCoord1];
                    [self.bgLayer removeTileAt:tileCoord1];
                    [self.bgLayer setTileGID:(tileGID1 - 20) at:tileCoord1];
                    
                    
                    if (self.sprite20.orientation == 4)
                    {
                        id actionMove = [CCMoveTo actionWithDuration:0.3 position:sprite20Pos];
                        id actionMove2 = [CCAnimate actionWithAnimation:spriteKWalkLeft restoreOriginalFrame:NO];
                        
                        id actionMoveDone = [CCCallFuncN actionWithTarget:self selector:@selector(finishActionSprite20)];
                        
                        [self.sprite20 runAction:[CCSpawn actionOne:[CCSequence actions:actionMove,actionMoveDone,nil] two:actionMove2]];
                        return;
                    }
                }
            }
        }
    }
    if (self.sprite20.orientation == 1)
    {
        [self.sprite20 setDisplayFrame:[[spriteKWalkDown frames] objectAtIndex:0]];
    }
    
    if (self.sprite20.orientation == 2)
    {
        [self.sprite20 setDisplayFrame:[[spriteKWalkUp frames] objectAtIndex:0]];
    }
    
    if (self.sprite20.orientation == 3)
    {
        [self.sprite20 setDisplayFrame:[[spriteKWalkRight frames] objectAtIndex:0]];
    }
    
    if (self.sprite20.orientation == 4)
    {
        [self.sprite20 setDisplayFrame:[[spriteKWalkLeft frames] objectAtIndex:0]];
    }
}
-(void) moverightSprite20
{
    CGPoint sprite20Pos = self.sprite20.position;
    self.sprite20.orientation = 3;
    sprite20Pos.x += theHKMap.tileSize.width;
    
    CGPoint tileCoord = [self tileCoordForPosition:sprite20Pos];
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
                    CGPoint tileCoord1 = [self tileCoordForPosition:sprite20.position];
                    int tileGID1 = [self.bgLayer tileGIDAt:tileCoord1];
                    [self.bgLayer removeTileAt:tileCoord1];
                    [self.bgLayer setTileGID:(tileGID1 - 20) at:tileCoord1];
                    
                    
                    if (self.sprite20.orientation == 3)
                    {
                        id actionMove = [CCMoveTo actionWithDuration:0.3 position:sprite20Pos];
                        id actionMove2 = [CCAnimate actionWithAnimation:spriteKWalkRight restoreOriginalFrame:NO];
                        
                        id actionMoveDone = [CCCallFuncN actionWithTarget:self selector:@selector(finishActionSprite20)];
                        
                        [self.sprite20 runAction:[CCSpawn actionOne:[CCSequence actions:actionMove,actionMoveDone,nil] two:actionMove2]];
                        return;
                    }
                }
            }
        }
    }
    if (self.sprite20.orientation == 1)
    {
        [self.sprite20 setDisplayFrame:[[spriteKWalkDown frames] objectAtIndex:0]];
    }
    
    if (self.sprite20.orientation == 2)
    {
        [self.sprite20 setDisplayFrame:[[spriteKWalkUp frames] objectAtIndex:0]];
    }
    
    if (self.sprite20.orientation == 3)
    {
        [self.sprite20 setDisplayFrame:[[spriteKWalkRight frames] objectAtIndex:0]];
    }
    
    if (self.sprite20.orientation == 4)
    {
        [self.sprite20 setDisplayFrame:[[spriteKWalkLeft frames] objectAtIndex:0]];
    }
}
-(void) moveupSprite20
{
    CGPoint sprite20Pos = self.sprite20.position;
    self.sprite20.orientation = 2;
    sprite20Pos.y += theHKMap.tileSize.height;
    
    CGPoint tileCoord = [self tileCoordForPosition:sprite20Pos];
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
                    CGPoint tileCoord1 = [self tileCoordForPosition:sprite20.position];
                    int tileGID1 = [self.bgLayer tileGIDAt:tileCoord1];
                    [self.bgLayer removeTileAt:tileCoord1];
                    [self.bgLayer setTileGID:(tileGID1 - 20) at:tileCoord1];
                    
                    
                    if (self.sprite20.orientation == 2)
                    {
                        id actionMove = [CCMoveTo actionWithDuration:0.3 position:sprite20Pos];
                        id actionMove2;
                        if (self.sprite1LastRight)
                        {
                            actionMove2 = [CCAnimate actionWithAnimation:spriteKWalkUp restoreOriginalFrame:NO];
                        }
                        else
                        {
                            actionMove2 = [CCAnimate actionWithAnimation:spriteKWalkUp2 restoreOriginalFrame:NO];
                        }
                        id actionMoveDone = [CCCallFuncN actionWithTarget:self selector:@selector(finishActionSprite20)];
                        
                        [self.sprite20 runAction:[CCSpawn actionOne:[CCSequence actions:actionMove,actionMoveDone,nil] two:actionMove2]];
                        return;
                    }
                }
            }
        }
    }
    if (self.sprite20.orientation == 1)
    {
        [self.sprite20 setDisplayFrame:[[spriteKWalkDown frames] objectAtIndex:0]];
    }
    
    if (self.sprite20.orientation == 2)
    {
        [self.sprite20 setDisplayFrame:[[spriteKWalkUp frames] objectAtIndex:0]];
    }
    
    if (self.sprite20.orientation == 3)
    {
        [self.sprite20 setDisplayFrame:[[spriteKWalkRight frames] objectAtIndex:0]];
    }
    
    if (self.sprite20.orientation == 4)
    {
        [self.sprite20 setDisplayFrame:[[spriteKWalkLeft frames] objectAtIndex:0]];
    }
}
-(void) movedownSprite20
{
    CGPoint sprite20Pos = self.sprite20.position;
    self.sprite20.orientation = 1;
    sprite20Pos.y -= theHKMap.tileSize.height;
    
    CGPoint tileCoord = [self tileCoordForPosition:sprite20Pos];
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
                    CGPoint tileCoord1 = [self tileCoordForPosition:sprite20.position];
                    int tileGID1 = [self.bgLayer tileGIDAt:tileCoord1];
                    [self.bgLayer removeTileAt:tileCoord1];
                    [self.bgLayer setTileGID:(tileGID1 - 20) at:tileCoord1];
                    
                    
                    if (self.sprite20.orientation == 1)
                    {
                        id actionMove = [CCMoveTo actionWithDuration:0.3 position:sprite20Pos];
                        id actionMove2;
                        if (self.sprite1LastRight)
                        {
                            actionMove2 = [CCAnimate actionWithAnimation:spriteKWalkDown restoreOriginalFrame:NO];
                        }
                        else
                        {
                            actionMove2 = [CCAnimate actionWithAnimation:spriteKWalkDown2 restoreOriginalFrame:NO];
                        }
                        id actionMoveDone = [CCCallFuncN actionWithTarget:self selector:@selector(finishActionSprite20)];
                        
                        [self.sprite20 runAction:[CCSpawn actionOne:[CCSequence actions:actionMove,actionMoveDone,nil] two:actionMove2]];
                        return;
                    }
                }
            }
        }
    }
    if (self.sprite20.orientation == 1)
    {
        [self.sprite20 setDisplayFrame:[[spriteKWalkDown frames] objectAtIndex:0]];
    }
    
    if (self.sprite20.orientation == 2)
    {
        [self.sprite20 setDisplayFrame:[[spriteKWalkUp frames] objectAtIndex:0]];
    }
    
    if (self.sprite20.orientation == 3)
    {
        [self.sprite20 setDisplayFrame:[[spriteKWalkRight frames] objectAtIndex:0]];
    }
    
    if (self.sprite20.orientation == 4)
    {
        [self.sprite20 setDisplayFrame:[[spriteKWalkLeft frames] objectAtIndex:0]];
    }
}

-(void) finishActionSprite20
{
    if (self.sprite20.orientation == 1)
    {
        [self.sprite20 setDisplayFrame:[[spriteKWalkDown frames] objectAtIndex:0]];
    }
    
    if (self.sprite20.orientation == 2)
    {
        [self.sprite20 setDisplayFrame:[[spriteKWalkUp frames] objectAtIndex:0]];
    }
    
    if (self.sprite20.orientation == 3)
    {
        [self.sprite20 setDisplayFrame:[[spriteKWalkRight frames] objectAtIndex:0]];
    }
    
    if (self.sprite20.orientation == 4)
    {
        [self.sprite20 setDisplayFrame:[[spriteKWalkLeft frames] objectAtIndex:0]];
    }
    self.hero.sprite20position = self.sprite20.position;
}


-(void)updateSprite21
{
    CGSize screenSize = [[CCDirector sharedDirector] winSize];
    int x = self.hero.position.x;
    int y = self.hero.position.y;
    
    int p = self.sprite21.position.x;
    int q = self.sprite21.position.y;
    
    int diffx = abs(x-p);
    int diffy = abs(y-q);
    
    if ((diffx > screenSize.width/1.5) || (diffy > screenSize.height/1.5))
    {
        return;
    }
    
    
    int rand = arc4random()%14;
    if (self.spriteOddIsTalking)
    {
        return;
    }
    if (rand == 1)
    {
        [self moveleftSprite21];
    }
    if (rand == 2)
    {
        [self moverightSprite21];
    }
    if (rand == 3)
    {
        [self moveupSprite21];
    }
    if (rand == 4)
    {
        [self movedownSprite21];
    }
    return;
}

-(void) moveleftSprite21
{
    CGPoint sprite21Pos = self.sprite21.position;
    self.sprite21.orientation = 4;
    sprite21Pos.x -= theHKMap.tileSize.width;
    
    CGPoint tileCoord = [self tileCoordForPosition:sprite21Pos];
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
                    CGPoint tileCoord1 = [self tileCoordForPosition:sprite21.position];
                    int tileGID1 = [self.bgLayer tileGIDAt:tileCoord1];
                    [self.bgLayer removeTileAt:tileCoord1];
                    [self.bgLayer setTileGID:(tileGID1 - 21) at:tileCoord1];
                    
                    
                    if (self.sprite21.orientation == 4)
                    {
                        id actionMove = [CCMoveTo actionWithDuration:0.3 position:sprite21Pos];
                        id actionMove2 = [CCAnimate actionWithAnimation:spriteBWalkLeft restoreOriginalFrame:NO];
                        
                        id actionMoveDone = [CCCallFuncN actionWithTarget:self selector:@selector(finishActionSprite21)];
                        
                        [self.sprite21 runAction:[CCSpawn actionOne:[CCSequence actions:actionMove,actionMoveDone,nil] two:actionMove2]];
                        return;
                    }
                }
            }
        }
    }
    if (self.sprite21.orientation == 1)
    {
        [self.sprite21 setDisplayFrame:[[spriteBWalkDown frames] objectAtIndex:0]];
    }
    
    if (self.sprite21.orientation == 2)
    {
        [self.sprite21 setDisplayFrame:[[spriteBWalkUp frames] objectAtIndex:0]];
    }
    
    if (self.sprite21.orientation == 3)
    {
        [self.sprite21 setDisplayFrame:[[spriteBWalkRight frames] objectAtIndex:0]];
    }
    
    if (self.sprite21.orientation == 4)
    {
        [self.sprite21 setDisplayFrame:[[spriteBWalkLeft frames] objectAtIndex:0]];
    }
}
-(void) moverightSprite21
{
    CGPoint sprite21Pos = self.sprite21.position;
    self.sprite21.orientation = 3;
    sprite21Pos.x += theHKMap.tileSize.width;
    
    CGPoint tileCoord = [self tileCoordForPosition:sprite21Pos];
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
                    CGPoint tileCoord1 = [self tileCoordForPosition:sprite21.position];
                    int tileGID1 = [self.bgLayer tileGIDAt:tileCoord1];
                    [self.bgLayer removeTileAt:tileCoord1];
                    [self.bgLayer setTileGID:(tileGID1 - 21) at:tileCoord1];
                    
                    
                    if (self.sprite21.orientation == 3)
                    {
                        id actionMove = [CCMoveTo actionWithDuration:0.3 position:sprite21Pos];
                        id actionMove2 = [CCAnimate actionWithAnimation:spriteBWalkRight restoreOriginalFrame:NO];
                        
                        id actionMoveDone = [CCCallFuncN actionWithTarget:self selector:@selector(finishActionSprite21)];
                        
                        [self.sprite21 runAction:[CCSpawn actionOne:[CCSequence actions:actionMove,actionMoveDone,nil] two:actionMove2]];
                        return;
                    }
                }
            }
        }
    }
    if (self.sprite21.orientation == 1)
    {
        [self.sprite21 setDisplayFrame:[[spriteBWalkDown frames] objectAtIndex:0]];
    }
    
    if (self.sprite21.orientation == 2)
    {
        [self.sprite21 setDisplayFrame:[[spriteBWalkUp frames] objectAtIndex:0]];
    }
    
    if (self.sprite21.orientation == 3)
    {
        [self.sprite21 setDisplayFrame:[[spriteBWalkRight frames] objectAtIndex:0]];
    }
    
    if (self.sprite21.orientation == 4)
    {
        [self.sprite21 setDisplayFrame:[[spriteBWalkLeft frames] objectAtIndex:0]];
    }
}
-(void) moveupSprite21
{
    CGPoint sprite21Pos = self.sprite21.position;
    self.sprite21.orientation = 2;
    sprite21Pos.y += theHKMap.tileSize.height;
    
    CGPoint tileCoord = [self tileCoordForPosition:sprite21Pos];
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
                    CGPoint tileCoord1 = [self tileCoordForPosition:sprite21.position];
                    int tileGID1 = [self.bgLayer tileGIDAt:tileCoord1];
                    [self.bgLayer removeTileAt:tileCoord1];
                    [self.bgLayer setTileGID:(tileGID1 - 21) at:tileCoord1];
                    
                    
                    if (self.sprite21.orientation == 2)
                    {
                        id actionMove = [CCMoveTo actionWithDuration:0.3 position:sprite21Pos];
                        id actionMove2;
                        if (self.sprite1LastRight)
                        {
                            actionMove2 = [CCAnimate actionWithAnimation:spriteBWalkUp restoreOriginalFrame:NO];
                        }
                        else
                        {
                            actionMove2 = [CCAnimate actionWithAnimation:spriteBWalkUp2 restoreOriginalFrame:NO];
                        }
                        id actionMoveDone = [CCCallFuncN actionWithTarget:self selector:@selector(finishActionSprite21)];
                        
                        [self.sprite21 runAction:[CCSpawn actionOne:[CCSequence actions:actionMove,actionMoveDone,nil] two:actionMove2]];
                        return;
                    }
                }
            }
        }
    }
    if (self.sprite21.orientation == 1)
    {
        [self.sprite21 setDisplayFrame:[[spriteBWalkDown frames] objectAtIndex:0]];
    }
    
    if (self.sprite21.orientation == 2)
    {
        [self.sprite21 setDisplayFrame:[[spriteBWalkUp frames] objectAtIndex:0]];
    }
    
    if (self.sprite21.orientation == 3)
    {
        [self.sprite21 setDisplayFrame:[[spriteBWalkRight frames] objectAtIndex:0]];
    }
    
    if (self.sprite21.orientation == 4)
    {
        [self.sprite21 setDisplayFrame:[[spriteBWalkLeft frames] objectAtIndex:0]];
    }
}
-(void) movedownSprite21
{
    CGPoint sprite21Pos = self.sprite21.position;
    self.sprite21.orientation = 1;
    sprite21Pos.y -= theHKMap.tileSize.height;
    
    CGPoint tileCoord = [self tileCoordForPosition:sprite21Pos];
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
                    CGPoint tileCoord1 = [self tileCoordForPosition:sprite21.position];
                    int tileGID1 = [self.bgLayer tileGIDAt:tileCoord1];
                    [self.bgLayer removeTileAt:tileCoord1];
                    [self.bgLayer setTileGID:(tileGID1 - 21) at:tileCoord1];
                    
                    
                    if (self.sprite21.orientation == 1)
                    {
                        id actionMove = [CCMoveTo actionWithDuration:0.3 position:sprite21Pos];
                        id actionMove2;
                        if (self.sprite1LastRight)
                        {
                            actionMove2 = [CCAnimate actionWithAnimation:spriteBWalkDown restoreOriginalFrame:NO];
                        }
                        else
                        {
                            actionMove2 = [CCAnimate actionWithAnimation:spriteBWalkDown2 restoreOriginalFrame:NO];
                        }
                        id actionMoveDone = [CCCallFuncN actionWithTarget:self selector:@selector(finishActionSprite21)];
                        
                        [self.sprite21 runAction:[CCSpawn actionOne:[CCSequence actions:actionMove,actionMoveDone,nil] two:actionMove2]];
                        return;
                    }
                }
            }
        }
    }
    if (self.sprite21.orientation == 1)
    {
        [self.sprite21 setDisplayFrame:[[spriteBWalkDown frames] objectAtIndex:0]];
    }
    
    if (self.sprite21.orientation == 2)
    {
        [self.sprite21 setDisplayFrame:[[spriteBWalkUp frames] objectAtIndex:0]];
    }
    
    if (self.sprite21.orientation == 3)
    {
        [self.sprite21 setDisplayFrame:[[spriteBWalkRight frames] objectAtIndex:0]];
    }
    
    if (self.sprite21.orientation == 4)
    {
        [self.sprite21 setDisplayFrame:[[spriteBWalkLeft frames] objectAtIndex:0]];
    }
}

-(void) finishActionSprite21
{
    if (self.sprite21.orientation == 1)
    {
        [self.sprite21 setDisplayFrame:[[spriteBWalkDown frames] objectAtIndex:0]];
    }
    
    if (self.sprite21.orientation == 2)
    {
        [self.sprite21 setDisplayFrame:[[spriteBWalkUp frames] objectAtIndex:0]];
    }
    
    if (self.sprite21.orientation == 3)
    {
        [self.sprite21 setDisplayFrame:[[spriteBWalkRight frames] objectAtIndex:0]];
    }
    
    if (self.sprite21.orientation == 4)
    {
        [self.sprite21 setDisplayFrame:[[spriteBWalkLeft frames] objectAtIndex:0]];
    }
    self.hero.sprite21position = self.sprite21.position;
}


-(void)updateSprite22
{
    CGSize screenSize = [[CCDirector sharedDirector] winSize];
    int x = self.hero.position.x;
    int y = self.hero.position.y;
    
    int p = self.sprite22.position.x;
    int q = self.sprite22.position.y;
    
    int diffx = abs(x-p);
    int diffy = abs(y-q);
    
    if ((diffx > screenSize.width/1.5) || (diffy > screenSize.height/1.5))
    {
        return;
    }
    
    
    int rand = arc4random()%14;
    if (self.spriteEvenIsTalking)
    {
        return;
    }
    if (rand == 1)
    {
        [self moveleftSprite22];
    }
    if (rand == 2)
    {
        [self moverightSprite22];
    }
    if (rand == 3)
    {
        [self moveupSprite22];
    }
    if (rand == 4)
    {
        [self movedownSprite22];
    }
    return;
}

-(void) moveleftSprite22
{
    CGPoint sprite22Pos = self.sprite22.position;
    self.sprite22.orientation = 4;
    sprite22Pos.x -= theHKMap.tileSize.width;
    
    CGPoint tileCoord = [self tileCoordForPosition:sprite22Pos];
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
                    CGPoint tileCoord1 = [self tileCoordForPosition:sprite22.position];
                    int tileGID1 = [self.bgLayer tileGIDAt:tileCoord1];
                    [self.bgLayer removeTileAt:tileCoord1];
                    [self.bgLayer setTileGID:(tileGID1 - 22) at:tileCoord1];
                    
                    
                    if (self.sprite22.orientation == 4)
                    {
                        id actionMove = [CCMoveTo actionWithDuration:0.3 position:sprite22Pos];
                        id actionMove2 = [CCAnimate actionWithAnimation:spriteKWalkLeft restoreOriginalFrame:NO];
                        
                        id actionMoveDone = [CCCallFuncN actionWithTarget:self selector:@selector(finishActionSprite22)];
                        
                        [self.sprite22 runAction:[CCSpawn actionOne:[CCSequence actions:actionMove,actionMoveDone,nil] two:actionMove2]];
                        return;
                    }
                }
            }
        }
    }
    if (self.sprite22.orientation == 1)
    {
        [self.sprite22 setDisplayFrame:[[spriteKWalkDown frames] objectAtIndex:0]];
    }
    
    if (self.sprite22.orientation == 2)
    {
        [self.sprite22 setDisplayFrame:[[spriteKWalkUp frames] objectAtIndex:0]];
    }
    
    if (self.sprite22.orientation == 3)
    {
        [self.sprite22 setDisplayFrame:[[spriteKWalkRight frames] objectAtIndex:0]];
    }
    
    if (self.sprite22.orientation == 4)
    {
        [self.sprite22 setDisplayFrame:[[spriteKWalkLeft frames] objectAtIndex:0]];
    }
}
-(void) moverightSprite22
{
    CGPoint sprite22Pos = self.sprite22.position;
    self.sprite22.orientation = 3;
    sprite22Pos.x += theHKMap.tileSize.width;
    
    CGPoint tileCoord = [self tileCoordForPosition:sprite22Pos];
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
                    CGPoint tileCoord1 = [self tileCoordForPosition:sprite22.position];
                    int tileGID1 = [self.bgLayer tileGIDAt:tileCoord1];
                    [self.bgLayer removeTileAt:tileCoord1];
                    [self.bgLayer setTileGID:(tileGID1 - 22) at:tileCoord1];
                    
                    
                    if (self.sprite22.orientation == 3)
                    {
                        id actionMove = [CCMoveTo actionWithDuration:0.3 position:sprite22Pos];
                        id actionMove2 = [CCAnimate actionWithAnimation:spriteKWalkRight restoreOriginalFrame:NO];
                        
                        id actionMoveDone = [CCCallFuncN actionWithTarget:self selector:@selector(finishActionSprite22)];
                        
                        [self.sprite22 runAction:[CCSpawn actionOne:[CCSequence actions:actionMove,actionMoveDone,nil] two:actionMove2]];
                        return;
                    }
                }
            }
        }
    }
    if (self.sprite22.orientation == 1)
    {
        [self.sprite22 setDisplayFrame:[[spriteKWalkDown frames] objectAtIndex:0]];
    }
    
    if (self.sprite22.orientation == 2)
    {
        [self.sprite22 setDisplayFrame:[[spriteKWalkUp frames] objectAtIndex:0]];
    }
    
    if (self.sprite22.orientation == 3)
    {
        [self.sprite22 setDisplayFrame:[[spriteKWalkRight frames] objectAtIndex:0]];
    }
    
    if (self.sprite22.orientation == 4)
    {
        [self.sprite22 setDisplayFrame:[[spriteKWalkLeft frames] objectAtIndex:0]];
    }
}
-(void) moveupSprite22
{
    CGPoint sprite22Pos = self.sprite22.position;
    self.sprite22.orientation = 2;
    sprite22Pos.y += theHKMap.tileSize.height;
    
    CGPoint tileCoord = [self tileCoordForPosition:sprite22Pos];
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
                    CGPoint tileCoord1 = [self tileCoordForPosition:sprite22.position];
                    int tileGID1 = [self.bgLayer tileGIDAt:tileCoord1];
                    [self.bgLayer removeTileAt:tileCoord1];
                    [self.bgLayer setTileGID:(tileGID1 - 22) at:tileCoord1];
                    
                    
                    if (self.sprite22.orientation == 2)
                    {
                        id actionMove = [CCMoveTo actionWithDuration:0.3 position:sprite22Pos];
                        id actionMove2;
                        if (self.sprite1LastRight)
                        {
                            actionMove2 = [CCAnimate actionWithAnimation:spriteKWalkUp restoreOriginalFrame:NO];
                        }
                        else
                        {
                            actionMove2 = [CCAnimate actionWithAnimation:spriteKWalkUp2 restoreOriginalFrame:NO];
                        }
                        id actionMoveDone = [CCCallFuncN actionWithTarget:self selector:@selector(finishActionSprite22)];
                        
                        [self.sprite22 runAction:[CCSpawn actionOne:[CCSequence actions:actionMove,actionMoveDone,nil] two:actionMove2]];
                        return;
                    }
                }
            }
        }
    }
    if (self.sprite22.orientation == 1)
    {
        [self.sprite22 setDisplayFrame:[[spriteKWalkDown frames] objectAtIndex:0]];
    }
    
    if (self.sprite22.orientation == 2)
    {
        [self.sprite22 setDisplayFrame:[[spriteKWalkUp frames] objectAtIndex:0]];
    }
    
    if (self.sprite22.orientation == 3)
    {
        [self.sprite22 setDisplayFrame:[[spriteKWalkRight frames] objectAtIndex:0]];
    }
    
    if (self.sprite22.orientation == 4)
    {
        [self.sprite22 setDisplayFrame:[[spriteKWalkLeft frames] objectAtIndex:0]];
    }
}
-(void) movedownSprite22
{
    CGPoint sprite22Pos = self.sprite22.position;
    self.sprite22.orientation = 1;
    sprite22Pos.y -= theHKMap.tileSize.height;
    
    CGPoint tileCoord = [self tileCoordForPosition:sprite22Pos];
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
                    CGPoint tileCoord1 = [self tileCoordForPosition:sprite22.position];
                    int tileGID1 = [self.bgLayer tileGIDAt:tileCoord1];
                    [self.bgLayer removeTileAt:tileCoord1];
                    [self.bgLayer setTileGID:(tileGID1 - 22) at:tileCoord1];
                    
                    
                    if (self.sprite22.orientation == 1)
                    {
                        id actionMove = [CCMoveTo actionWithDuration:0.3 position:sprite22Pos];
                        id actionMove2;
                        if (self.sprite1LastRight)
                        {
                            actionMove2 = [CCAnimate actionWithAnimation:spriteKWalkDown restoreOriginalFrame:NO];
                        }
                        else
                        {
                            actionMove2 = [CCAnimate actionWithAnimation:spriteKWalkDown2 restoreOriginalFrame:NO];
                        }
                        id actionMoveDone = [CCCallFuncN actionWithTarget:self selector:@selector(finishActionSprite22)];
                        
                        [self.sprite22 runAction:[CCSpawn actionOne:[CCSequence actions:actionMove,actionMoveDone,nil] two:actionMove2]];
                        return;
                    }
                }
            }
        }
    }
    if (self.sprite22.orientation == 1)
    {
        [self.sprite22 setDisplayFrame:[[spriteKWalkDown frames] objectAtIndex:0]];
    }
    
    if (self.sprite22.orientation == 2)
    {
        [self.sprite22 setDisplayFrame:[[spriteKWalkUp frames] objectAtIndex:0]];
    }
    
    if (self.sprite22.orientation == 3)
    {
        [self.sprite22 setDisplayFrame:[[spriteKWalkRight frames] objectAtIndex:0]];
    }
    
    if (self.sprite22.orientation == 4)
    {
        [self.sprite22 setDisplayFrame:[[spriteKWalkLeft frames] objectAtIndex:0]];
    }
}

-(void) finishActionSprite22
{
    if (self.sprite22.orientation == 1)
    {
        [self.sprite22 setDisplayFrame:[[spriteKWalkDown frames] objectAtIndex:0]];
    }
    
    if (self.sprite22.orientation == 2)
    {
        [self.sprite22 setDisplayFrame:[[spriteKWalkUp frames] objectAtIndex:0]];
    }
    
    if (self.sprite22.orientation == 3)
    {
        [self.sprite22 setDisplayFrame:[[spriteKWalkRight frames] objectAtIndex:0]];
    }
    
    if (self.sprite22.orientation == 4)
    {
        [self.sprite22 setDisplayFrame:[[spriteKWalkLeft frames] objectAtIndex:0]];
    }
    self.hero.sprite22position = self.sprite22.position;
}


-(void)updateSprite23
{
    CGSize screenSize = [[CCDirector sharedDirector] winSize];
    int x = self.hero.position.x;
    int y = self.hero.position.y;
    
    int p = self.sprite23.position.x;
    int q = self.sprite23.position.y;
    
    int diffx = abs(x-p);
    int diffy = abs(y-q);
    
    if ((diffx > screenSize.width/1.5) || (diffy > screenSize.height/1.5))
    {
        return;
    }
    
    if (!self.hero.acceptedMessageKingK)
    {
        self.sprite23.orientation = 5;
        [self.sprite23 setDisplayFrame:[[spriteBWalkLeft frames] objectAtIndex:0]];
        return;
    }
    
    
    int rand = arc4random()%14;
    if (self.spriteOddIsTalking)
    {
        return;
    }
    if (rand == 1)
    {
        [self moveleftSprite23];
    }
    if (rand == 2)
    {
        [self moverightSprite23];
    }
    if (rand == 3)
    {
        [self moveupSprite23];
    }
    if (rand == 4)
    {
        [self movedownSprite23];
    }
    return;
}

-(void) moveleftSprite23
{
    CGPoint sprite23Pos = self.sprite23.position;
    self.sprite23.orientation = 4;
    sprite23Pos.x -= theHKMap.tileSize.width;
    
    CGPoint tileCoord = [self tileCoordForPosition:sprite23Pos];
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
                    CGPoint tileCoord1 = [self tileCoordForPosition:sprite23.position];
                    int tileGID1 = [self.bgLayer tileGIDAt:tileCoord1];
                    [self.bgLayer removeTileAt:tileCoord1];
                    [self.bgLayer setTileGID:(tileGID1 - 23) at:tileCoord1];
                    
                    
                    if (self.sprite23.orientation == 4)
                    {
                        id actionMove = [CCMoveTo actionWithDuration:0.3 position:sprite23Pos];
                        id actionMove2 = [CCAnimate actionWithAnimation:spriteBWalkLeft restoreOriginalFrame:NO];
                        
                        id actionMoveDone = [CCCallFuncN actionWithTarget:self selector:@selector(finishActionSprite23)];
                        
                        [self.sprite23 runAction:[CCSpawn actionOne:[CCSequence actions:actionMove,actionMoveDone,nil] two:actionMove2]];
                        return;
                    }
                }
            }
        }
    }
    if (self.sprite23.orientation == 1)
    {
        [self.sprite23 setDisplayFrame:[[spriteBWalkDown frames] objectAtIndex:0]];
    }
    
    if (self.sprite23.orientation == 2)
    {
        [self.sprite23 setDisplayFrame:[[spriteBWalkUp frames] objectAtIndex:0]];
    }
    
    if (self.sprite23.orientation == 3)
    {
        [self.sprite23 setDisplayFrame:[[spriteBWalkRight frames] objectAtIndex:0]];
    }
    
    if (self.sprite23.orientation == 4)
    {
        [self.sprite23 setDisplayFrame:[[spriteBWalkLeft frames] objectAtIndex:0]];
    }
}
-(void) moverightSprite23
{
    CGPoint sprite23Pos = self.sprite23.position;
    self.sprite23.orientation = 3;
    sprite23Pos.x += theHKMap.tileSize.width;
    
    CGPoint tileCoord = [self tileCoordForPosition:sprite23Pos];
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
                    CGPoint tileCoord1 = [self tileCoordForPosition:sprite23.position];
                    int tileGID1 = [self.bgLayer tileGIDAt:tileCoord1];
                    [self.bgLayer removeTileAt:tileCoord1];
                    [self.bgLayer setTileGID:(tileGID1 - 23) at:tileCoord1];
                    
                    
                    if (self.sprite23.orientation == 3)
                    {
                        id actionMove = [CCMoveTo actionWithDuration:0.3 position:sprite23Pos];
                        id actionMove2 = [CCAnimate actionWithAnimation:spriteBWalkRight restoreOriginalFrame:NO];
                        
                        id actionMoveDone = [CCCallFuncN actionWithTarget:self selector:@selector(finishActionSprite23)];
                        
                        [self.sprite23 runAction:[CCSpawn actionOne:[CCSequence actions:actionMove,actionMoveDone,nil] two:actionMove2]];
                        return;
                    }
                }
            }
        }
    }
    if (self.sprite23.orientation == 1)
    {
        [self.sprite23 setDisplayFrame:[[spriteBWalkDown frames] objectAtIndex:0]];
    }
    
    if (self.sprite23.orientation == 2)
    {
        [self.sprite23 setDisplayFrame:[[spriteBWalkUp frames] objectAtIndex:0]];
    }
    
    if (self.sprite23.orientation == 3)
    {
        [self.sprite23 setDisplayFrame:[[spriteBWalkRight frames] objectAtIndex:0]];
    }
    
    if (self.sprite23.orientation == 4)
    {
        [self.sprite23 setDisplayFrame:[[spriteBWalkLeft frames] objectAtIndex:0]];
    }
}
-(void) moveupSprite23
{
    CGPoint sprite23Pos = self.sprite23.position;
    self.sprite23.orientation = 2;
    sprite23Pos.y += theHKMap.tileSize.height;
    
    CGPoint tileCoord = [self tileCoordForPosition:sprite23Pos];
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
                    CGPoint tileCoord1 = [self tileCoordForPosition:sprite23.position];
                    int tileGID1 = [self.bgLayer tileGIDAt:tileCoord1];
                    [self.bgLayer removeTileAt:tileCoord1];
                    [self.bgLayer setTileGID:(tileGID1 - 23) at:tileCoord1];
                    
                    
                    if (self.sprite23.orientation == 2)
                    {
                        id actionMove = [CCMoveTo actionWithDuration:0.3 position:sprite23Pos];
                        id actionMove2;
                        if (self.sprite1LastRight)
                        {
                            actionMove2 = [CCAnimate actionWithAnimation:spriteBWalkUp restoreOriginalFrame:NO];
                        }
                        else
                        {
                            actionMove2 = [CCAnimate actionWithAnimation:spriteBWalkUp2 restoreOriginalFrame:NO];
                        }
                        id actionMoveDone = [CCCallFuncN actionWithTarget:self selector:@selector(finishActionSprite23)];
                        
                        [self.sprite23 runAction:[CCSpawn actionOne:[CCSequence actions:actionMove,actionMoveDone,nil] two:actionMove2]];
                        return;
                    }
                }
            }
        }
    }
    if (self.sprite23.orientation == 1)
    {
        [self.sprite23 setDisplayFrame:[[spriteBWalkDown frames] objectAtIndex:0]];
    }
    
    if (self.sprite23.orientation == 2)
    {
        [self.sprite23 setDisplayFrame:[[spriteBWalkUp frames] objectAtIndex:0]];
    }
    
    if (self.sprite23.orientation == 3)
    {
        [self.sprite23 setDisplayFrame:[[spriteBWalkRight frames] objectAtIndex:0]];
    }
    
    if (self.sprite23.orientation == 4)
    {
        [self.sprite23 setDisplayFrame:[[spriteBWalkLeft frames] objectAtIndex:0]];
    }
}
-(void) movedownSprite23
{
    CGPoint sprite23Pos = self.sprite23.position;
    self.sprite23.orientation = 1;
    sprite23Pos.y -= theHKMap.tileSize.height;
    
    CGPoint tileCoord = [self tileCoordForPosition:sprite23Pos];
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
                    CGPoint tileCoord1 = [self tileCoordForPosition:sprite23.position];
                    int tileGID1 = [self.bgLayer tileGIDAt:tileCoord1];
                    [self.bgLayer removeTileAt:tileCoord1];
                    [self.bgLayer setTileGID:(tileGID1 - 23) at:tileCoord1];
                    
                    
                    if (self.sprite23.orientation == 1)
                    {
                        id actionMove = [CCMoveTo actionWithDuration:0.3 position:sprite23Pos];
                        id actionMove2;
                        if (self.sprite1LastRight)
                        {
                            actionMove2 = [CCAnimate actionWithAnimation:spriteBWalkDown restoreOriginalFrame:NO];
                        }
                        else
                        {
                            actionMove2 = [CCAnimate actionWithAnimation:spriteBWalkDown2 restoreOriginalFrame:NO];
                        }
                        id actionMoveDone = [CCCallFuncN actionWithTarget:self selector:@selector(finishActionSprite23)];
                        
                        [self.sprite23 runAction:[CCSpawn actionOne:[CCSequence actions:actionMove,actionMoveDone,nil] two:actionMove2]];
                        return;
                    }
                }
            }
        }
    }
    if (self.sprite23.orientation == 1)
    {
        [self.sprite23 setDisplayFrame:[[spriteBWalkDown frames] objectAtIndex:0]];
    }
    
    if (self.sprite23.orientation == 2)
    {
        [self.sprite23 setDisplayFrame:[[spriteBWalkUp frames] objectAtIndex:0]];
    }
    
    if (self.sprite23.orientation == 3)
    {
        [self.sprite23 setDisplayFrame:[[spriteBWalkRight frames] objectAtIndex:0]];
    }
    
    if (self.sprite23.orientation == 4)
    {
        [self.sprite23 setDisplayFrame:[[spriteBWalkLeft frames] objectAtIndex:0]];
    }
}

-(void) finishActionSprite23
{
    if (self.sprite23.orientation == 1)
    {
        [self.sprite23 setDisplayFrame:[[spriteBWalkDown frames] objectAtIndex:0]];
    }
    
    if (self.sprite23.orientation == 2)
    {
        [self.sprite23 setDisplayFrame:[[spriteBWalkUp frames] objectAtIndex:0]];
    }
    
    if (self.sprite23.orientation == 3)
    {
        [self.sprite23 setDisplayFrame:[[spriteBWalkRight frames] objectAtIndex:0]];
    }
    
    if (self.sprite23.orientation == 4)
    {
        [self.sprite23 setDisplayFrame:[[spriteBWalkLeft frames] objectAtIndex:0]];
    }
    self.hero.sprite23position = self.sprite23.position;
}


-(void)updateSprite24
{
    CGSize screenSize = [[CCDirector sharedDirector] winSize];
    int x = self.hero.position.x;
    int y = self.hero.position.y;
    
    int p = self.sprite24.position.x;
    int q = self.sprite24.position.y;
    
    int diffx = abs(x-p);
    int diffy = abs(y-q);
    
    if ((diffx > screenSize.width/1.5) || (diffy > screenSize.height/1.5))
    {
        return;
    }
    
    
    int rand = arc4random()%14;
    if (self.spriteEvenIsTalking)
    {
        return;
    }
    if (rand == 1)
    {
        [self moveleftSprite24];
    }
    if (rand == 2)
    {
        [self moverightSprite24];
    }
    if (rand == 3)
    {
        [self moveupSprite24];
    }
    if (rand == 4)
    {
        [self movedownSprite24];
    }
    return;
}

-(void) moveleftSprite24
{
    CGPoint sprite24Pos = self.sprite24.position;
    self.sprite24.orientation = 4;
    sprite24Pos.x -= theHKMap.tileSize.width;
    
    CGPoint tileCoord = [self tileCoordForPosition:sprite24Pos];
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
                    CGPoint tileCoord1 = [self tileCoordForPosition:sprite24.position];
                    int tileGID1 = [self.bgLayer tileGIDAt:tileCoord1];
                    [self.bgLayer removeTileAt:tileCoord1];
                    [self.bgLayer setTileGID:(tileGID1 - 24) at:tileCoord1];
                    
                    
                    if (self.sprite24.orientation == 4)
                    {
                        id actionMove = [CCMoveTo actionWithDuration:0.3 position:sprite24Pos];
                        id actionMove2 = [CCAnimate actionWithAnimation:spriteKWalkLeft restoreOriginalFrame:NO];
                        
                        id actionMoveDone = [CCCallFuncN actionWithTarget:self selector:@selector(finishActionSprite24)];
                        
                        [self.sprite24 runAction:[CCSpawn actionOne:[CCSequence actions:actionMove,actionMoveDone,nil] two:actionMove2]];
                        return;
                    }
                }
            }
        }
    }
    if (self.sprite24.orientation == 1)
    {
        [self.sprite24 setDisplayFrame:[[spriteKWalkDown frames] objectAtIndex:0]];
    }
    
    if (self.sprite24.orientation == 2)
    {
        [self.sprite24 setDisplayFrame:[[spriteKWalkUp frames] objectAtIndex:0]];
    }
    
    if (self.sprite24.orientation == 3)
    {
        [self.sprite24 setDisplayFrame:[[spriteKWalkRight frames] objectAtIndex:0]];
    }
    
    if (self.sprite24.orientation == 4)
    {
        [self.sprite24 setDisplayFrame:[[spriteKWalkLeft frames] objectAtIndex:0]];
    }
}
-(void) moverightSprite24
{
    CGPoint sprite24Pos = self.sprite24.position;
    self.sprite24.orientation = 3;
    sprite24Pos.x += theHKMap.tileSize.width;
    
    CGPoint tileCoord = [self tileCoordForPosition:sprite24Pos];
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
                    CGPoint tileCoord1 = [self tileCoordForPosition:sprite24.position];
                    int tileGID1 = [self.bgLayer tileGIDAt:tileCoord1];
                    [self.bgLayer removeTileAt:tileCoord1];
                    [self.bgLayer setTileGID:(tileGID1 - 24) at:tileCoord1];
                    
                    
                    if (self.sprite24.orientation == 3)
                    {
                        id actionMove = [CCMoveTo actionWithDuration:0.3 position:sprite24Pos];
                        id actionMove2 = [CCAnimate actionWithAnimation:spriteKWalkRight restoreOriginalFrame:NO];
                        
                        id actionMoveDone = [CCCallFuncN actionWithTarget:self selector:@selector(finishActionSprite24)];
                        
                        [self.sprite24 runAction:[CCSpawn actionOne:[CCSequence actions:actionMove,actionMoveDone,nil] two:actionMove2]];
                        return;
                    }
                }
            }
        }
    }
    if (self.sprite24.orientation == 1)
    {
        [self.sprite24 setDisplayFrame:[[spriteKWalkDown frames] objectAtIndex:0]];
    }
    
    if (self.sprite24.orientation == 2)
    {
        [self.sprite24 setDisplayFrame:[[spriteKWalkUp frames] objectAtIndex:0]];
    }
    
    if (self.sprite24.orientation == 3)
    {
        [self.sprite24 setDisplayFrame:[[spriteKWalkRight frames] objectAtIndex:0]];
    }
    
    if (self.sprite24.orientation == 4)
    {
        [self.sprite24 setDisplayFrame:[[spriteKWalkLeft frames] objectAtIndex:0]];
    }
}
-(void) moveupSprite24
{
    CGPoint sprite24Pos = self.sprite24.position;
    self.sprite24.orientation = 2;
    sprite24Pos.y += theHKMap.tileSize.height;
    
    CGPoint tileCoord = [self tileCoordForPosition:sprite24Pos];
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
                    CGPoint tileCoord1 = [self tileCoordForPosition:sprite24.position];
                    int tileGID1 = [self.bgLayer tileGIDAt:tileCoord1];
                    [self.bgLayer removeTileAt:tileCoord1];
                    [self.bgLayer setTileGID:(tileGID1 - 24) at:tileCoord1];
                    
                    
                    if (self.sprite24.orientation == 2)
                    {
                        id actionMove = [CCMoveTo actionWithDuration:0.3 position:sprite24Pos];
                        id actionMove2;
                        if (self.sprite1LastRight)
                        {
                            actionMove2 = [CCAnimate actionWithAnimation:spriteKWalkUp restoreOriginalFrame:NO];
                        }
                        else
                        {
                            actionMove2 = [CCAnimate actionWithAnimation:spriteKWalkUp2 restoreOriginalFrame:NO];
                        }
                        id actionMoveDone = [CCCallFuncN actionWithTarget:self selector:@selector(finishActionSprite24)];
                        
                        [self.sprite24 runAction:[CCSpawn actionOne:[CCSequence actions:actionMove,actionMoveDone,nil] two:actionMove2]];
                        return;
                    }
                }
            }
        }
    }
    if (self.sprite24.orientation == 1)
    {
        [self.sprite24 setDisplayFrame:[[spriteKWalkDown frames] objectAtIndex:0]];
    }
    
    if (self.sprite24.orientation == 2)
    {
        [self.sprite24 setDisplayFrame:[[spriteKWalkUp frames] objectAtIndex:0]];
    }
    
    if (self.sprite24.orientation == 3)
    {
        [self.sprite24 setDisplayFrame:[[spriteKWalkRight frames] objectAtIndex:0]];
    }
    
    if (self.sprite24.orientation == 4)
    {
        [self.sprite24 setDisplayFrame:[[spriteKWalkLeft frames] objectAtIndex:0]];
    }
}
-(void) movedownSprite24
{
    CGPoint sprite24Pos = self.sprite24.position;
    self.sprite24.orientation = 1;
    sprite24Pos.y -= theHKMap.tileSize.height;
    
    CGPoint tileCoord = [self tileCoordForPosition:sprite24Pos];
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
                    CGPoint tileCoord1 = [self tileCoordForPosition:sprite24.position];
                    int tileGID1 = [self.bgLayer tileGIDAt:tileCoord1];
                    [self.bgLayer removeTileAt:tileCoord1];
                    [self.bgLayer setTileGID:(tileGID1 - 24) at:tileCoord1];
                    
                    
                    if (self.sprite24.orientation == 1)
                    {
                        id actionMove = [CCMoveTo actionWithDuration:0.3 position:sprite24Pos];
                        id actionMove2;
                        if (self.sprite1LastRight)
                        {
                            actionMove2 = [CCAnimate actionWithAnimation:spriteKWalkDown restoreOriginalFrame:NO];
                        }
                        else
                        {
                            actionMove2 = [CCAnimate actionWithAnimation:spriteKWalkDown2 restoreOriginalFrame:NO];
                        }
                        id actionMoveDone = [CCCallFuncN actionWithTarget:self selector:@selector(finishActionSprite24)];
                        
                        [self.sprite24 runAction:[CCSpawn actionOne:[CCSequence actions:actionMove,actionMoveDone,nil] two:actionMove2]];
                        return;
                    }
                }
            }
        }
    }
    if (self.sprite24.orientation == 1)
    {
        [self.sprite24 setDisplayFrame:[[spriteKWalkDown frames] objectAtIndex:0]];
    }
    
    if (self.sprite24.orientation == 2)
    {
        [self.sprite24 setDisplayFrame:[[spriteKWalkUp frames] objectAtIndex:0]];
    }
    
    if (self.sprite24.orientation == 3)
    {
        [self.sprite24 setDisplayFrame:[[spriteKWalkRight frames] objectAtIndex:0]];
    }
    
    if (self.sprite24.orientation == 4)
    {
        [self.sprite24 setDisplayFrame:[[spriteKWalkLeft frames] objectAtIndex:0]];
    }
}

-(void) finishActionSprite24
{
    if (self.sprite24.orientation == 1)
    {
        [self.sprite24 setDisplayFrame:[[spriteKWalkDown frames] objectAtIndex:0]];
    }
    
    if (self.sprite24.orientation == 2)
    {
        [self.sprite24 setDisplayFrame:[[spriteKWalkUp frames] objectAtIndex:0]];
    }
    
    if (self.sprite24.orientation == 3)
    {
        [self.sprite24 setDisplayFrame:[[spriteKWalkRight frames] objectAtIndex:0]];
    }
    
    if (self.sprite24.orientation == 4)
    {
        [self.sprite24 setDisplayFrame:[[spriteKWalkLeft frames] objectAtIndex:0]];
    }
    self.hero.sprite24position = self.sprite24.position;
}


-(void)updateSprite25
{
    CGSize screenSize = [[CCDirector sharedDirector] winSize];
    int x = self.hero.position.x;
    int y = self.hero.position.y;
    
    int p = self.sprite25.position.x;
    int q = self.sprite25.position.y;
    
    int diffx = abs(x-p);
    int diffy = abs(y-q);
    
    if ((diffx > screenSize.width/1.5) || (diffy > screenSize.height/1.5))
    {
        return;
    }
    
    
    int rand = arc4random()%14;
    if (self.spriteOddIsTalking)
    {
        return;
    }
    if (rand == 1)
    {
        [self moveleftSprite25];
    }
    if (rand == 2)
    {
        [self moverightSprite25];
    }
    if (rand == 3)
    {
        [self moveupSprite25];
    }
    if (rand == 4)
    {
        [self movedownSprite25];
    }
    return;
}

-(void) moveleftSprite25
{
    CGPoint sprite25Pos = self.sprite25.position;
    self.sprite25.orientation = 4;
    sprite25Pos.x -= theHKMap.tileSize.width;
    
    CGPoint tileCoord = [self tileCoordForPosition:sprite25Pos];
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
                    [self.bgLayer setTileGID:(tileGID + 25) at:tileCoord];
                    CGPoint tileCoord1 = [self tileCoordForPosition:sprite25.position];
                    int tileGID1 = [self.bgLayer tileGIDAt:tileCoord1];
                    [self.bgLayer removeTileAt:tileCoord1];
                    [self.bgLayer setTileGID:(tileGID1 - 25) at:tileCoord1];
                    
                    
                    if (self.sprite25.orientation == 4)
                    {
                        id actionMove = [CCMoveTo actionWithDuration:0.3 position:sprite25Pos];
                        id actionMove2 = [CCAnimate actionWithAnimation:spriteKWalkLeft restoreOriginalFrame:NO];
                        
                        id actionMoveDone = [CCCallFuncN actionWithTarget:self selector:@selector(finishActionSprite25)];
                        
                        [self.sprite25 runAction:[CCSpawn actionOne:[CCSequence actions:actionMove,actionMoveDone,nil] two:actionMove2]];
                        return;
                    }
                }
            }
        }
    }
    if (self.sprite25.orientation == 1)
    {
        [self.sprite25 setDisplayFrame:[[spriteKWalkDown frames] objectAtIndex:0]];
    }
    
    if (self.sprite25.orientation == 2)
    {
        [self.sprite25 setDisplayFrame:[[spriteKWalkUp frames] objectAtIndex:0]];
    }
    
    if (self.sprite25.orientation == 3)
    {
        [self.sprite25 setDisplayFrame:[[spriteKWalkRight frames] objectAtIndex:0]];
    }
    
    if (self.sprite25.orientation == 4)
    {
        [self.sprite25 setDisplayFrame:[[spriteKWalkLeft frames] objectAtIndex:0]];
    }
}
-(void) moverightSprite25
{
    CGPoint sprite25Pos = self.sprite25.position;
    self.sprite25.orientation = 3;
    sprite25Pos.x += theHKMap.tileSize.width;
    
    CGPoint tileCoord = [self tileCoordForPosition:sprite25Pos];
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
                    [self.bgLayer setTileGID:(tileGID + 25) at:tileCoord];
                    CGPoint tileCoord1 = [self tileCoordForPosition:sprite25.position];
                    int tileGID1 = [self.bgLayer tileGIDAt:tileCoord1];
                    [self.bgLayer removeTileAt:tileCoord1];
                    [self.bgLayer setTileGID:(tileGID1 - 25) at:tileCoord1];
                    
                    
                    if (self.sprite25.orientation == 3)
                    {
                        id actionMove = [CCMoveTo actionWithDuration:0.3 position:sprite25Pos];
                        id actionMove2 = [CCAnimate actionWithAnimation:spriteKWalkRight restoreOriginalFrame:NO];
                        
                        id actionMoveDone = [CCCallFuncN actionWithTarget:self selector:@selector(finishActionSprite25)];
                        
                        [self.sprite25 runAction:[CCSpawn actionOne:[CCSequence actions:actionMove,actionMoveDone,nil] two:actionMove2]];
                        return;
                    }
                }
            }
        }
    }
    if (self.sprite25.orientation == 1)
    {
        [self.sprite25 setDisplayFrame:[[spriteKWalkDown frames] objectAtIndex:0]];
    }
    
    if (self.sprite25.orientation == 2)
    {
        [self.sprite25 setDisplayFrame:[[spriteKWalkUp frames] objectAtIndex:0]];
    }
    
    if (self.sprite25.orientation == 3)
    {
        [self.sprite25 setDisplayFrame:[[spriteKWalkRight frames] objectAtIndex:0]];
    }
    
    if (self.sprite25.orientation == 4)
    {
        [self.sprite25 setDisplayFrame:[[spriteKWalkLeft frames] objectAtIndex:0]];
    }
}
-(void) moveupSprite25
{
    CGPoint sprite25Pos = self.sprite25.position;
    self.sprite25.orientation = 2;
    sprite25Pos.y += theHKMap.tileSize.height;
    
    CGPoint tileCoord = [self tileCoordForPosition:sprite25Pos];
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
                    [self.bgLayer setTileGID:(tileGID + 25) at:tileCoord];
                    CGPoint tileCoord1 = [self tileCoordForPosition:sprite25.position];
                    int tileGID1 = [self.bgLayer tileGIDAt:tileCoord1];
                    [self.bgLayer removeTileAt:tileCoord1];
                    [self.bgLayer setTileGID:(tileGID1 - 25) at:tileCoord1];
                    
                    
                    if (self.sprite25.orientation == 2)
                    {
                        id actionMove = [CCMoveTo actionWithDuration:0.3 position:sprite25Pos];
                        id actionMove2;
                        if (self.sprite1LastRight)
                        {
                            actionMove2 = [CCAnimate actionWithAnimation:spriteKWalkUp restoreOriginalFrame:NO];
                        }
                        else
                        {
                            actionMove2 = [CCAnimate actionWithAnimation:spriteKWalkUp2 restoreOriginalFrame:NO];
                        }
                        id actionMoveDone = [CCCallFuncN actionWithTarget:self selector:@selector(finishActionSprite25)];
                        
                        [self.sprite25 runAction:[CCSpawn actionOne:[CCSequence actions:actionMove,actionMoveDone,nil] two:actionMove2]];
                        return;
                    }
                }
            }
        }
    }
    if (self.sprite25.orientation == 1)
    {
        [self.sprite25 setDisplayFrame:[[spriteKWalkDown frames] objectAtIndex:0]];
    }
    
    if (self.sprite25.orientation == 2)
    {
        [self.sprite25 setDisplayFrame:[[spriteKWalkUp frames] objectAtIndex:0]];
    }
    
    if (self.sprite25.orientation == 3)
    {
        [self.sprite25 setDisplayFrame:[[spriteKWalkRight frames] objectAtIndex:0]];
    }
    
    if (self.sprite25.orientation == 4)
    {
        [self.sprite25 setDisplayFrame:[[spriteKWalkLeft frames] objectAtIndex:0]];
    }
}
-(void) movedownSprite25
{
    CGPoint sprite25Pos = self.sprite25.position;
    self.sprite25.orientation = 1;
    sprite25Pos.y -= theHKMap.tileSize.height;
    
    CGPoint tileCoord = [self tileCoordForPosition:sprite25Pos];
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
                    [self.bgLayer setTileGID:(tileGID + 25) at:tileCoord];
                    CGPoint tileCoord1 = [self tileCoordForPosition:sprite25.position];
                    int tileGID1 = [self.bgLayer tileGIDAt:tileCoord1];
                    [self.bgLayer removeTileAt:tileCoord1];
                    [self.bgLayer setTileGID:(tileGID1 - 25) at:tileCoord1];
                    
                    
                    if (self.sprite25.orientation == 1)
                    {
                        id actionMove = [CCMoveTo actionWithDuration:0.3 position:sprite25Pos];
                        id actionMove2;
                        if (self.sprite1LastRight)
                        {
                            actionMove2 = [CCAnimate actionWithAnimation:spriteKWalkDown restoreOriginalFrame:NO];
                        }
                        else
                        {
                            actionMove2 = [CCAnimate actionWithAnimation:spriteKWalkDown2 restoreOriginalFrame:NO];
                        }
                        id actionMoveDone = [CCCallFuncN actionWithTarget:self selector:@selector(finishActionSprite25)];
                        
                        [self.sprite25 runAction:[CCSpawn actionOne:[CCSequence actions:actionMove,actionMoveDone,nil] two:actionMove2]];
                        return;
                    }
                }
            }
        }
    }
    if (self.sprite25.orientation == 1)
    {
        [self.sprite25 setDisplayFrame:[[spriteKWalkDown frames] objectAtIndex:0]];
    }
    
    if (self.sprite25.orientation == 2)
    {
        [self.sprite25 setDisplayFrame:[[spriteKWalkUp frames] objectAtIndex:0]];
    }
    
    if (self.sprite25.orientation == 3)
    {
        [self.sprite25 setDisplayFrame:[[spriteKWalkRight frames] objectAtIndex:0]];
    }
    
    if (self.sprite25.orientation == 4)
    {
        [self.sprite25 setDisplayFrame:[[spriteKWalkLeft frames] objectAtIndex:0]];
    }
}

-(void) finishActionSprite25
{
    if (self.sprite25.orientation == 1)
    {
        [self.sprite25 setDisplayFrame:[[spriteKWalkDown frames] objectAtIndex:0]];
    }
    
    if (self.sprite25.orientation == 2)
    {
        [self.sprite25 setDisplayFrame:[[spriteKWalkUp frames] objectAtIndex:0]];
    }
    
    if (self.sprite25.orientation == 3)
    {
        [self.sprite25 setDisplayFrame:[[spriteKWalkRight frames] objectAtIndex:0]];
    }
    
    if (self.sprite25.orientation == 4)
    {
        [self.sprite25 setDisplayFrame:[[spriteKWalkLeft frames] objectAtIndex:0]];
    }
    self.hero.sprite25position = self.sprite25.position;
}


-(void)updateSprite26
{
    CGSize screenSize = [[CCDirector sharedDirector] winSize];
    int x = self.hero.position.x;
    int y = self.hero.position.y;
    
    int p = self.sprite26.position.x;
    int q = self.sprite26.position.y;
    
    int diffx = abs(x-p);
    int diffy = abs(y-q);
    
    if ((diffx > screenSize.width/1.5) || (diffy > screenSize.height/1.5))
    {
        return;
    }
    
    
    int rand = arc4random()%18;
    if (self.spriteEvenIsTalking)
    {
        return;
    }
    if (rand == 1)
    {
        [self moveleftSprite26];
    }
    if (rand == 2)
    {
        [self moverightSprite26];
    }
    if (rand == 3)
    {
        [self moveupSprite26];
    }
    if (rand == 4)
    {
        [self movedownSprite26];
    }
    return;
}

-(void) moveleftSprite26
{
    CGPoint sprite26Pos = self.sprite26.position;
    self.sprite26.orientation = 4;
    sprite26Pos.x -= theHKMap.tileSize.width;
    
    CGPoint tileCoord = [self tileCoordForPosition:sprite26Pos];
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
                    [self.bgLayer setTileGID:(tileGID + 56) at:tileCoord];
                    CGPoint tileCoord1 = [self tileCoordForPosition:sprite26.position];
                    int tileGID1 = [self.bgLayer tileGIDAt:tileCoord1];
                    [self.bgLayer removeTileAt:tileCoord1];
                    [self.bgLayer setTileGID:(tileGID1 - 56) at:tileCoord1];
                    
                    
                    if (self.sprite26.orientation == 4)
                    {
                        id actionMove = [CCMoveTo actionWithDuration:0.4 position:sprite26Pos];
                        id actionMove2 = [CCAnimate actionWithAnimation:spriteHWalkLeft restoreOriginalFrame:NO];
                        
                        id actionMoveDone = [CCCallFuncN actionWithTarget:self selector:@selector(finishActionSprite26)];
                        
                        [self.sprite26 runAction:[CCSpawn actionOne:[CCSequence actions:actionMove,actionMoveDone,nil] two:actionMove2]];
                        return;
                    }
                }
            }
        }
    }
    if (self.sprite26.orientation == 1)
    {
        [self.sprite26 setDisplayFrame:[[spriteHWalkDown frames] objectAtIndex:0]];
    }
    
    if (self.sprite26.orientation == 2)
    {
        [self.sprite26 setDisplayFrame:[[spriteHWalkUp frames] objectAtIndex:0]];
    }
    
    if (self.sprite26.orientation == 3)
    {
        [self.sprite26 setDisplayFrame:[[spriteHWalkRight frames] objectAtIndex:0]];
    }
    
    if (self.sprite26.orientation == 4)
    {
        [self.sprite26 setDisplayFrame:[[spriteHWalkLeft frames] objectAtIndex:0]];
    }
}
-(void) moverightSprite26
{
    CGPoint sprite26Pos = self.sprite26.position;
    self.sprite26.orientation = 3;
    sprite26Pos.x += theHKMap.tileSize.width;
    
    CGPoint tileCoord = [self tileCoordForPosition:sprite26Pos];
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
                    [self.bgLayer setTileGID:(tileGID + 56) at:tileCoord];
                    CGPoint tileCoord1 = [self tileCoordForPosition:sprite26.position];
                    int tileGID1 = [self.bgLayer tileGIDAt:tileCoord1];
                    [self.bgLayer removeTileAt:tileCoord1];
                    [self.bgLayer setTileGID:(tileGID1 - 56) at:tileCoord1];
                    
                    
                    if (self.sprite26.orientation == 3)
                    {
                        id actionMove = [CCMoveTo actionWithDuration:0.4 position:sprite26Pos];
                        id actionMove2 = [CCAnimate actionWithAnimation:spriteHWalkRight restoreOriginalFrame:NO];
                        
                        id actionMoveDone = [CCCallFuncN actionWithTarget:self selector:@selector(finishActionSprite26)];
                        
                        [self.sprite26 runAction:[CCSpawn actionOne:[CCSequence actions:actionMove,actionMoveDone,nil] two:actionMove2]];
                        return;
                    }
                }
            }
        }
    }
    if (self.sprite26.orientation == 1)
    {
        [self.sprite26 setDisplayFrame:[[spriteHWalkDown frames] objectAtIndex:0]];
    }
    
    if (self.sprite26.orientation == 2)
    {
        [self.sprite26 setDisplayFrame:[[spriteHWalkUp frames] objectAtIndex:0]];
    }
    
    if (self.sprite26.orientation == 3)
    {
        [self.sprite26 setDisplayFrame:[[spriteHWalkRight frames] objectAtIndex:0]];
    }
    
    if (self.sprite26.orientation == 4)
    {
        [self.sprite26 setDisplayFrame:[[spriteHWalkLeft frames] objectAtIndex:0]];
    }
}
-(void) moveupSprite26
{
    CGPoint sprite26Pos = self.sprite26.position;
    self.sprite26.orientation = 2;
    sprite26Pos.y += theHKMap.tileSize.height;
    
    CGPoint tileCoord = [self tileCoordForPosition:sprite26Pos];
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
                    [self.bgLayer setTileGID:(tileGID + 56) at:tileCoord];
                    CGPoint tileCoord1 = [self tileCoordForPosition:sprite26.position];
                    int tileGID1 = [self.bgLayer tileGIDAt:tileCoord1];
                    [self.bgLayer removeTileAt:tileCoord1];
                    [self.bgLayer setTileGID:(tileGID1 - 56) at:tileCoord1];
                    
                    
                    if (self.sprite26.orientation == 2)
                    {
                        id actionMove = [CCMoveTo actionWithDuration:0.4 position:sprite26Pos];
                        id actionMove2;
                        if (self.sprite1LastRight)
                        {
                            actionMove2 = [CCAnimate actionWithAnimation:spriteHWalkUp restoreOriginalFrame:NO];
                        }
                        else
                        {
                            actionMove2 = [CCAnimate actionWithAnimation:spriteHWalkUp2 restoreOriginalFrame:NO];
                        }
                        id actionMoveDone = [CCCallFuncN actionWithTarget:self selector:@selector(finishActionSprite26)];
                        
                        [self.sprite26 runAction:[CCSpawn actionOne:[CCSequence actions:actionMove,actionMoveDone,nil] two:actionMove2]];
                        return;
                    }
                }
            }
        }
    }
    if (self.sprite26.orientation == 1)
    {
        [self.sprite26 setDisplayFrame:[[spriteHWalkDown frames] objectAtIndex:0]];
    }
    
    if (self.sprite26.orientation == 2)
    {
        [self.sprite26 setDisplayFrame:[[spriteHWalkUp frames] objectAtIndex:0]];
    }
    
    if (self.sprite26.orientation == 3)
    {
        [self.sprite26 setDisplayFrame:[[spriteHWalkRight frames] objectAtIndex:0]];
    }
    
    if (self.sprite26.orientation == 4)
    {
        [self.sprite26 setDisplayFrame:[[spriteHWalkLeft frames] objectAtIndex:0]];
    }
}
-(void) movedownSprite26
{
    CGPoint sprite26Pos = self.sprite26.position;
    self.sprite26.orientation = 1;
    sprite26Pos.y -= theHKMap.tileSize.height;
    
    CGPoint tileCoord = [self tileCoordForPosition:sprite26Pos];
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
                    [self.bgLayer setTileGID:(tileGID + 56) at:tileCoord];
                    CGPoint tileCoord1 = [self tileCoordForPosition:sprite26.position];
                    int tileGID1 = [self.bgLayer tileGIDAt:tileCoord1];
                    [self.bgLayer removeTileAt:tileCoord1];
                    [self.bgLayer setTileGID:(tileGID1 - 56) at:tileCoord1];
                    
                    
                    if (self.sprite26.orientation == 1)
                    {
                        id actionMove = [CCMoveTo actionWithDuration:0.4 position:sprite26Pos];
                        id actionMove2;
                        if (self.sprite1LastRight)
                        {
                            actionMove2 = [CCAnimate actionWithAnimation:spriteHWalkDown restoreOriginalFrame:NO];
                        }
                        else
                        {
                            actionMove2 = [CCAnimate actionWithAnimation:spriteHWalkDown2 restoreOriginalFrame:NO];
                        }
                        id actionMoveDone = [CCCallFuncN actionWithTarget:self selector:@selector(finishActionSprite26)];
                        
                        [self.sprite26 runAction:[CCSpawn actionOne:[CCSequence actions:actionMove,actionMoveDone,nil] two:actionMove2]];
                        return;
                    }
                }
            }
        }
    }
    if (self.sprite26.orientation == 1)
    {
        [self.sprite26 setDisplayFrame:[[spriteHWalkDown frames] objectAtIndex:0]];
    }
    
    if (self.sprite26.orientation == 2)
    {
        [self.sprite26 setDisplayFrame:[[spriteHWalkUp frames] objectAtIndex:0]];
    }
    
    if (self.sprite26.orientation == 3)
    {
        [self.sprite26 setDisplayFrame:[[spriteHWalkRight frames] objectAtIndex:0]];
    }
    
    if (self.sprite26.orientation == 4)
    {
        [self.sprite26 setDisplayFrame:[[spriteHWalkLeft frames] objectAtIndex:0]];
    }
}

-(void) finishActionSprite26
{
    if (self.sprite26.orientation == 1)
    {
        [self.sprite26 setDisplayFrame:[[spriteHWalkDown frames] objectAtIndex:0]];
    }
    
    if (self.sprite26.orientation == 2)
    {
        [self.sprite26 setDisplayFrame:[[spriteHWalkUp frames] objectAtIndex:0]];
    }
    
    if (self.sprite26.orientation == 3)
    {
        [self.sprite26 setDisplayFrame:[[spriteHWalkRight frames] objectAtIndex:0]];
    }
    
    if (self.sprite26.orientation == 4)
    {
        [self.sprite26 setDisplayFrame:[[spriteHWalkLeft frames] objectAtIndex:0]];
    }
    self.hero.sprite26position = self.sprite26.position;
}


-(void)updateSprite27
{
    CGSize screenSize = [[CCDirector sharedDirector] winSize];
    int x = self.hero.position.x;
    int y = self.hero.position.y;
    
    int p = self.sprite27.position.x;
    int q = self.sprite27.position.y;
    
    int diffx = abs(x-p);
    int diffy = abs(y-q);
    
    if ((diffx > screenSize.width/1.5) || (diffy > screenSize.height/1.5))
    {
        return;
    }
    
    
    int rand = arc4random()%14;
    if (self.spriteOddIsTalking)
    {
        return;
    }
    if (rand == 1)
    {
        [self moveleftSprite27];
    }
    if (rand == 2)
    {
        [self moverightSprite27];
    }
    if (rand == 3)
    {
        [self moveupSprite27];
    }
    if (rand == 4)
    {
        [self movedownSprite27];
    }
    return;
}

-(void) moveleftSprite27
{
    CGPoint sprite27Pos = self.sprite27.position;
    self.sprite27.orientation = 4;
    sprite27Pos.x -= theHKMap.tileSize.width;
    
    CGPoint tileCoord = [self tileCoordForPosition:sprite27Pos];
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
                    [self.bgLayer setTileGID:(tileGID + 57) at:tileCoord];
                    CGPoint tileCoord1 = [self tileCoordForPosition:sprite27.position];
                    int tileGID1 = [self.bgLayer tileGIDAt:tileCoord1];
                    [self.bgLayer removeTileAt:tileCoord1];
                    [self.bgLayer setTileGID:(tileGID1 - 57) at:tileCoord1];
                    
                    
                    if (self.sprite27.orientation == 4)
                    {
                        id actionMove = [CCMoveTo actionWithDuration:0.3 position:sprite27Pos];
                        id actionMove2 = [CCAnimate actionWithAnimation:spriteZBWalkLeft restoreOriginalFrame:NO];
                        
                        id actionMoveDone = [CCCallFuncN actionWithTarget:self selector:@selector(finishActionSprite27)];
                        
                        [self.sprite27 runAction:[CCSpawn actionOne:[CCSequence actions:actionMove,actionMoveDone,nil] two:actionMove2]];
                        return;
                    }
                }
            }
        }
    }
    if (self.sprite27.orientation == 1)
    {
        [self.sprite27 setDisplayFrame:[[spriteZBWalkDown frames] objectAtIndex:0]];
    }
    
    if (self.sprite27.orientation == 2)
    {
        [self.sprite27 setDisplayFrame:[[spriteZBWalkUp frames] objectAtIndex:0]];
    }
    
    if (self.sprite27.orientation == 3)
    {
        [self.sprite27 setDisplayFrame:[[spriteZBWalkRight frames] objectAtIndex:0]];
    }
    
    if (self.sprite27.orientation == 4)
    {
        [self.sprite27 setDisplayFrame:[[spriteZBWalkLeft frames] objectAtIndex:0]];
    }
}
-(void) moverightSprite27
{
    CGPoint sprite27Pos = self.sprite27.position;
    self.sprite27.orientation = 3;
    sprite27Pos.x += theHKMap.tileSize.width;
    
    CGPoint tileCoord = [self tileCoordForPosition:sprite27Pos];
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
                    [self.bgLayer setTileGID:(tileGID + 57) at:tileCoord];
                    CGPoint tileCoord1 = [self tileCoordForPosition:sprite27.position];
                    int tileGID1 = [self.bgLayer tileGIDAt:tileCoord1];
                    [self.bgLayer removeTileAt:tileCoord1];
                    [self.bgLayer setTileGID:(tileGID1 - 57) at:tileCoord1];
                    
                    
                    if (self.sprite27.orientation == 3)
                    {
                        id actionMove = [CCMoveTo actionWithDuration:0.3 position:sprite27Pos];
                        id actionMove2 = [CCAnimate actionWithAnimation:spriteZBWalkRight restoreOriginalFrame:NO];
                        
                        id actionMoveDone = [CCCallFuncN actionWithTarget:self selector:@selector(finishActionSprite27)];
                        
                        [self.sprite27 runAction:[CCSpawn actionOne:[CCSequence actions:actionMove,actionMoveDone,nil] two:actionMove2]];
                        return;
                    }
                }
            }
        }
    }
    if (self.sprite27.orientation == 1)
    {
        [self.sprite27 setDisplayFrame:[[spriteZBWalkDown frames] objectAtIndex:0]];
    }
    
    if (self.sprite27.orientation == 2)
    {
        [self.sprite27 setDisplayFrame:[[spriteZBWalkUp frames] objectAtIndex:0]];
    }
    
    if (self.sprite27.orientation == 3)
    {
        [self.sprite27 setDisplayFrame:[[spriteZBWalkRight frames] objectAtIndex:0]];
    }
    
    if (self.sprite27.orientation == 4)
    {
        [self.sprite27 setDisplayFrame:[[spriteZBWalkLeft frames] objectAtIndex:0]];
    }
}
-(void) moveupSprite27
{
    CGPoint sprite27Pos = self.sprite27.position;
    self.sprite27.orientation = 2;
    sprite27Pos.y += theHKMap.tileSize.height;
    
    CGPoint tileCoord = [self tileCoordForPosition:sprite27Pos];
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
                    [self.bgLayer setTileGID:(tileGID + 57) at:tileCoord];
                    CGPoint tileCoord1 = [self tileCoordForPosition:sprite27.position];
                    int tileGID1 = [self.bgLayer tileGIDAt:tileCoord1];
                    [self.bgLayer removeTileAt:tileCoord1];
                    [self.bgLayer setTileGID:(tileGID1 - 57) at:tileCoord1];
                    
                    
                    if (self.sprite27.orientation == 2)
                    {
                        id actionMove = [CCMoveTo actionWithDuration:0.3 position:sprite27Pos];
                        id actionMove2;
                        if (self.sprite1LastRight)
                        {
                            actionMove2 = [CCAnimate actionWithAnimation:spriteZBWalkUp restoreOriginalFrame:NO];
                        }
                        else
                        {
                            actionMove2 = [CCAnimate actionWithAnimation:spriteZBWalkUp2 restoreOriginalFrame:NO];
                        }
                        id actionMoveDone = [CCCallFuncN actionWithTarget:self selector:@selector(finishActionSprite27)];
                        
                        [self.sprite27 runAction:[CCSpawn actionOne:[CCSequence actions:actionMove,actionMoveDone,nil] two:actionMove2]];
                        return;
                    }
                }
            }
        }
    }
    if (self.sprite27.orientation == 1)
    {
        [self.sprite27 setDisplayFrame:[[spriteZBWalkDown frames] objectAtIndex:0]];
    }
    
    if (self.sprite27.orientation == 2)
    {
        [self.sprite27 setDisplayFrame:[[spriteZBWalkUp frames] objectAtIndex:0]];
    }
    
    if (self.sprite27.orientation == 3)
    {
        [self.sprite27 setDisplayFrame:[[spriteZBWalkRight frames] objectAtIndex:0]];
    }
    
    if (self.sprite27.orientation == 4)
    {
        [self.sprite27 setDisplayFrame:[[spriteZBWalkLeft frames] objectAtIndex:0]];
    }
}
-(void) movedownSprite27
{
    CGPoint sprite27Pos = self.sprite27.position;
    self.sprite27.orientation = 1;
    sprite27Pos.y -= theHKMap.tileSize.height;
    
    CGPoint tileCoord = [self tileCoordForPosition:sprite27Pos];
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
                    [self.bgLayer setTileGID:(tileGID + 57) at:tileCoord];
                    CGPoint tileCoord1 = [self tileCoordForPosition:sprite27.position];
                    int tileGID1 = [self.bgLayer tileGIDAt:tileCoord1];
                    [self.bgLayer removeTileAt:tileCoord1];
                    [self.bgLayer setTileGID:(tileGID1 - 57) at:tileCoord1];
                    
                    
                    if (self.sprite27.orientation == 1)
                    {
                        id actionMove = [CCMoveTo actionWithDuration:0.3 position:sprite27Pos];
                        id actionMove2;
                        if (self.sprite1LastRight)
                        {
                            actionMove2 = [CCAnimate actionWithAnimation:spriteZBWalkDown restoreOriginalFrame:NO];
                        }
                        else
                        {
                            actionMove2 = [CCAnimate actionWithAnimation:spriteZBWalkDown2 restoreOriginalFrame:NO];
                        }
                        id actionMoveDone = [CCCallFuncN actionWithTarget:self selector:@selector(finishActionSprite27)];
                        
                        [self.sprite27 runAction:[CCSpawn actionOne:[CCSequence actions:actionMove,actionMoveDone,nil] two:actionMove2]];
                        return;
                    }
                }
            }
        }
    }
    if (self.sprite27.orientation == 1)
    {
        [self.sprite27 setDisplayFrame:[[spriteZBWalkDown frames] objectAtIndex:0]];
    }
    
    if (self.sprite27.orientation == 2)
    {
        [self.sprite27 setDisplayFrame:[[spriteZBWalkUp frames] objectAtIndex:0]];
    }
    
    if (self.sprite27.orientation == 3)
    {
        [self.sprite27 setDisplayFrame:[[spriteZBWalkRight frames] objectAtIndex:0]];
    }
    
    if (self.sprite27.orientation == 4)
    {
        [self.sprite27 setDisplayFrame:[[spriteZBWalkLeft frames] objectAtIndex:0]];
    }
}

-(void) finishActionSprite27
{
    if (self.sprite27.orientation == 1)
    {
        [self.sprite27 setDisplayFrame:[[spriteZBWalkDown frames] objectAtIndex:0]];
    }
    
    if (self.sprite27.orientation == 2)
    {
        [self.sprite27 setDisplayFrame:[[spriteZBWalkUp frames] objectAtIndex:0]];
    }
    
    if (self.sprite27.orientation == 3)
    {
        [self.sprite27 setDisplayFrame:[[spriteZBWalkRight frames] objectAtIndex:0]];
    }
    
    if (self.sprite27.orientation == 4)
    {
        [self.sprite27 setDisplayFrame:[[spriteZBWalkLeft frames] objectAtIndex:0]];
    }
    self.hero.sprite27position = self.sprite27.position;
}



-(void) unblockTower
{
    CGPoint tileCoord = [self tileCoordForPosition:sprite3.position];
    int tileGID = [self.bgLayer tileGIDAt:tileCoord];
    [self.bgLayer removeTileAt:tileCoord];
    [self.bgLayer setTileGID:(tileGID - 3) at:tileCoord];
    
    [self.theHKMap removeChild:sprite3 cleanup:YES];
    sprite3 = [InteractiveSprite spriteWithSpriteFrameName:@"herospriteB05.png"];
    self.sprite3.spriteCode = 3;
    self.sprite3.orientation = 4;
    
    CCTMXObjectGroup *objects = [theHKMap objectGroupNamed:@"oj1"];
    NSMutableDictionary *sprite3start = [objects objectNamed:@"spriteStart3"];
    double x1 = [[sprite3start valueForKey:@"x"]floatValue];
    double y1 = [[sprite3start valueForKey:@"y"]floatValue];
    self.sprite3.position = ccp(x1,y1);
    
    [self.theHKMap addChild:sprite3 z:self.bgLayer.zOrder];
    
    CGPoint tileCoord3 = [self tileCoordForPosition:sprite3.position];
    int tileGID3 = [self.bgLayer tileGIDAt:tileCoord3];
    [self.bgLayer removeTileAt:tileCoord3];
    [self.bgLayer setTileGID:(tileGID3 + 3) at:tileCoord3];
    [self saveHero];
}
-(void) unblockCity
{
    CGPoint tileCoord = [self tileCoordForPosition:sprite1.position];
    int tileGID = [self.bgLayer tileGIDAt:tileCoord];
    [self.bgLayer removeTileAt:tileCoord];
    [self.bgLayer setTileGID:(tileGID - 1) at:tileCoord];
    
    [self.theHKMap removeChild:sprite1 cleanup:YES];
    sprite1 = [InteractiveSprite spriteWithSpriteFrameName:@"herospriteB05.png"];
    self.sprite1.spriteCode = 1;
    self.sprite1.orientation = 4;
    
    CCTMXObjectGroup *objects = [theHKMap objectGroupNamed:@"oj1"];
    NSMutableDictionary *sprite1start = [objects objectNamed:@"spriteStart1"];
    double x1 = [[sprite1start valueForKey:@"x"]floatValue];
    double y1 = [[sprite1start valueForKey:@"y"]floatValue];
    self.sprite1.position = ccp(x1,y1);
    
    [self.theHKMap addChild:sprite1 z:self.bgLayer.zOrder];
    
    CGPoint tileCoord3 = [self tileCoordForPosition:sprite1.position];
    int tileGID3 = [self.bgLayer tileGIDAt:tileCoord3];
    [self.bgLayer removeTileAt:tileCoord3];
    [self.bgLayer setTileGID:(tileGID3 + 1) at:tileCoord3];
    
    ///
    
    CGPoint tileCoord1 = [self tileCoordForPosition:sprite2.position];
    int tileGID1 = [self.bgLayer tileGIDAt:tileCoord1];
    [self.bgLayer removeTileAt:tileCoord1];
    [self.bgLayer setTileGID:(tileGID1 - 2) at:tileCoord1];
    
    [self.theHKMap removeChild:sprite2 cleanup:YES];
    sprite2 = [InteractiveSprite spriteWithSpriteFrameName:@"herospriteB05.png"];
    self.sprite2.spriteCode = 2;
    self.sprite2.orientation = 4;
    
    NSMutableDictionary *sprite2start = [objects objectNamed:@"spriteStart2"];
    double x2 = [[sprite2start valueForKey:@"x"]floatValue];
    double y2 = [[sprite2start valueForKey:@"y"]floatValue];
    self.sprite2.position = ccp(x2,y2);
    
    [self.theHKMap addChild:sprite2 z:self.bgLayer.zOrder];
    
    CGPoint tileCoord2 = [self tileCoordForPosition:sprite2.position];
    int tileGID2 = [self.bgLayer tileGIDAt:tileCoord2];
    [self.bgLayer removeTileAt:tileCoord2];
    [self.bgLayer setTileGID:(tileGID2 + 2) at:tileCoord2];
    [self saveHero];
    
}
-(void) unblockEast
{
    CCTMXObjectGroup *objects = [theHKMap objectGroupNamed:@"oj1"];
    
    CGPoint tileCoord23 = [self tileCoordForPosition:sprite23.position];
    int tileGID23 = [self.bgLayer tileGIDAt:tileCoord23];
    [self.bgLayer removeTileAt:tileCoord23];
    [self.bgLayer setTileGID:(tileGID23 - 23) at:tileCoord23];
    
    [self.theHKMap removeChild:sprite23 cleanup:YES];
    
    self.sprite23 = [InteractiveSprite spriteWithSpriteFrameName:@"herospriteK05.png"];
    self.sprite23.spriteCode = 23;
    self.sprite23.orientation = 4;
    //[self schedule:@selector(updateSprite23) interval:(1.3f)];
    
    
    NSMutableDictionary *sprite23start = [objects objectNamed:@"spriteStart23"];
    double x1 = [[sprite23start valueForKey:@"x"]floatValue];
    double y1 = [[sprite23start valueForKey:@"y"]floatValue];
    self.sprite23.position = ccp(x1,y1);
    
    [self.theHKMap addChild:sprite23 z:self.bgLayer.zOrder];
    
    CGPoint tileCoord = [self tileCoordForPosition:sprite23.position];
    int tileGID = [self.bgLayer tileGIDAt:tileCoord];
    [self.bgLayer removeTileAt:tileCoord];
    [self.bgLayer setTileGID:(tileGID + 23) at:tileCoord];
    [self saveHero];
}

-(void) givenItem:(int)itemCode
{
    if (itemCode == 999)
    {
        self.hero.gold += 10;
        [self saveHero];
        return;
    }
    if (itemCode == 1000)
    {
        self.hero.gold += 20;
        [self saveHero];
        return;
    }
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
    [SceneManager goPlay:1];
    return;
}



-(void) goGate:(int)gate
{
    
    //if (condition) { //later: Cool animation
    //    statements
    //}
    self.hero.mapInitMode = 2;
    [self saveHero];
    if (gate == 1)
    {
        [SceneManager goPlay:2];
    }
    else if (gate == 2)
    {
        [SceneManager goPlay:4];
    }
    else if (gate == 3)
    {
        [SceneManager goPlay:3];
    }
    return;
}



-(void)saveHero
{
    self.hero.sprite1position = self.sprite1.position;
    self.hero.sprite2position = self.sprite2.position;
    self.hero.sprite3position = self.sprite3.position;
    self.hero.sprite4position = self.sprite4.position;
    self.hero.sprite5position = self.sprite5.position;
    self.hero.sprite6position = self.sprite6.position;
    self.hero.sprite7position = self.sprite7.position;
    self.hero.sprite8position = self.sprite8.position;
    self.hero.sprite9position = self.sprite9.position;
    self.hero.sprite10position = self.sprite10.position;
    self.hero.sprite11position = self.sprite11.position;
    self.hero.sprite12position = self.sprite12.position;
    self.hero.sprite13position = self.sprite13.position;
    self.hero.sprite14position = self.sprite14.position;
    self.hero.sprite15position = self.sprite15.position;
    self.hero.sprite16position = self.sprite16.position;
    self.hero.sprite17position = self.sprite17.position;
    self.hero.sprite18position = self.sprite18.position;
    self.hero.sprite19position = self.sprite19.position;
    self.hero.sprite20position = self.sprite20.position;
    self.hero.sprite21position = self.sprite21.position;
    self.hero.sprite22position = self.sprite22.position;
    self.hero.sprite23position = self.sprite23.position;
    self.hero.sprite24position = self.sprite24.position;
    self.hero.sprite25position = self.sprite25.position;
    self.hero.sprite26position = self.sprite26.position;
    self.hero.sprite27position = self.sprite27.position;
    
    self.hero.heroOrientation = self.spriteOrientation;
    
    self.hero.sprite1_Orientation = self.sprite1.orientation;
    self.hero.sprite2_Orientation = self.sprite2.orientation;
    self.hero.sprite3_Orientation = self.sprite3.orientation;
    self.hero.sprite4_Orientation = self.sprite4.orientation;
    self.hero.sprite5_Orientation = self.sprite5.orientation;
    self.hero.sprite6_Orientation = self.sprite6.orientation;
    self.hero.sprite7_Orientation = self.sprite7.orientation;
    self.hero.sprite8_Orientation = self.sprite8.orientation;
    self.hero.sprite9_Orientation = self.sprite9.orientation;
    self.hero.sprite10_Orientation = self.sprite10.orientation;
    self.hero.sprite11_Orientation = self.sprite11.orientation;
    self.hero.sprite12_Orientation = self.sprite12.orientation;
    self.hero.sprite13_Orientation = self.sprite13.orientation;
    self.hero.sprite14_Orientation = self.sprite14.orientation;
    self.hero.sprite15_Orientation = self.sprite15.orientation;
    self.hero.sprite16_Orientation = self.sprite16.orientation;
    self.hero.sprite17_Orientation = self.sprite17.orientation;
    self.hero.sprite18_Orientation = self.sprite18.orientation;
    self.hero.sprite19_Orientation = self.sprite19.orientation;
    self.hero.sprite20_Orientation = self.sprite20.orientation;
    self.hero.sprite21_Orientation = self.sprite21.orientation;
    self.hero.sprite22_Orientation = self.sprite22.orientation;
    self.hero.sprite23_Orientation = self.sprite23.orientation;
    self.hero.sprite24_Orientation = self.sprite24.orientation;
    self.hero.sprite25_Orientation = self.sprite25.orientation;
    self.hero.sprite26_Orientation = self.sprite26.orientation;
    self.hero.sprite27_Orientation = self.sprite27.orientation;
    
    //[GameSceneManager sharedGameSceneManager].hero = self.hero;
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
            NSString *gate2 = [properties valueForKey:@"gate2"];
            if (gate2 && [gate2 compare:@"true"] == NSOrderedSame)
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
                    [self goGate:2];
                    return;
                }
            }
            NSString *gate3 = [properties valueForKey:@"gate3"];
            if (gate3 && [gate3 compare:@"true"] == NSOrderedSame)
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
                    [self goGate:3];
                    return;
                }
            }
            
            NSString *boss1Interact = [properties valueForKey:@"autoBattleID"];
            if (boss1Interact && [boss1Interact compare:@"1"] == NSOrderedSame)
            {
                if (!self.hero.beatBoss1 && self.hero.hasLitOrb)
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
            NSString *boss2Interact = [properties valueForKey:@"autoBattleID"];
            if (boss2Interact && [boss2Interact compare:@"2"] == NSOrderedSame)
            {
                if (!self.hero.beatCyclops)
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
            
            NSString *mapitem4 = [properties valueForKey:@"item4"];
            if (mapitem4 && [mapitem4 compare:@"true"] == NSOrderedSame)
            {
                if (!self.hero.gotItem4)
                {
                    [self pickedUpItem:4];
                    [self saveHero];
                    [self goText:304];
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
            
            NSString *gate1 = [properties valueForKey:@"gate1"];
            if (gate1 && [gate1 compare:@"true"] == NSOrderedSame)
            {
                
                [self goGate:1];
                return;
                
            }
            NSString *gate2 = [properties valueForKey:@"gate2"];
            if (gate2 && [gate2 compare:@"true"] == NSOrderedSame)
            {
                [self goGate:2];
                return;
                
            }
            NSString *gate3 = [properties valueForKey:@"gate3"];
            if (gate3 && [gate3 compare:@"true"] == NSOrderedSame)
            {
                [self goGate:3];
                return;
            }
            
            NSString *boss1Interact = [properties valueForKey:@"autoBattleID"];
            if (boss1Interact && [boss1Interact compare:@"1"] == NSOrderedSame)
            {
                if (!self.hero.beatBoss1 && self.hero.hasLitOrb)
                {
                    
                    if (self.canRespondToTouch)
                        self.canRespondToTouch = NO;
                    else
                        self.canRespondToTouch = YES;
                    [self performSelector:@selector(toggleTouchEnabled) withObject:nil afterDelay:0.04];
                    return;
                }
            }
            NSString *boss2Interact = [properties valueForKey:@"autoBattleID"];
            if (boss2Interact && [boss2Interact compare:@"2"] == NSOrderedSame)
            {
                if (!self.hero.beatCyclops)
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
            
            NSString *mapitem4 = [properties valueForKey:@"item4"];
            if (mapitem4 && [mapitem4 compare:@"true"] == NSOrderedSame)
            {
                if (!self.hero.gotItem4)
                {
                    [self pickedUpItem:4];
                    [self saveHero];
                    [self goText:304];
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
    //[self toggleTouchEnabled];
    [self moveSprite:position];
    //guy.position = position;
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
            
            NSString *sprite1Interact = [properties valueForKey:@"sprite1IsHere"];
            if (sprite1Interact && [sprite1Interact compare:@"true"] == NSOrderedSame)
            {
                self.sprite1.orientation = oppOrientation;
                
                if (self.sprite1.orientation == 1)
                {
                    [self.sprite1 setDisplayFrame:[[spriteBWalkDown frames] objectAtIndex:0]];
                }
                else if (self.sprite1.orientation == 2)
                {
                    [self.sprite1 setDisplayFrame:[[spriteBWalkUp frames] objectAtIndex:0]];
                }
                else if (self.sprite1.orientation == 3)
                {
                    [self.sprite1 setDisplayFrame:[[spriteBWalkRight frames] objectAtIndex:0]];
                }
                else
                {
                    [self.sprite1 setDisplayFrame:[[spriteBWalkLeft frames] objectAtIndex:0]];
                }
                
                if (self.hero.beatIonak)
                {
                    [self goText:3 sprite:1];
                    return;
                }
                else if (self.hero.acceptedTaskKingVPostOrb)
                {
                    [self goText:2 sprite:1];
                    return;
                }
                else if (self.hero.beatBoss1)
                {
                    [self goText:1 sprite:1];
                    return;
                }
                else if (self.hero.talkedToKingVInitial)
                {
                    [self goText:973 sprite:1];
                    return;
                }
                else
                {
                    [self goText:0 sprite:1];
                }
            }
            
            NSString *sprite2Interact = [properties valueForKey:@"sprite2IsHere"];
            if (sprite2Interact && [sprite2Interact compare:@"true"] == NSOrderedSame)
            {
                self.sprite2.orientation = oppOrientation;
                
                if (self.sprite2.orientation == 1)
                {
                    [self.sprite2 setDisplayFrame:[[spriteBWalkDown frames] objectAtIndex:0]];
                }
                else if (self.sprite2.orientation == 2)
                {
                    [self.sprite2 setDisplayFrame:[[spriteBWalkUp frames] objectAtIndex:0]];
                }
                else if (self.sprite2.orientation == 3)
                {
                    [self.sprite2 setDisplayFrame:[[spriteBWalkRight frames] objectAtIndex:0]];
                }
                else
                {
                    [self.sprite2 setDisplayFrame:[[spriteBWalkLeft frames] objectAtIndex:0]];
                }
                
                if (self.hero.beatIonak)
                {
                    [self goText:3 sprite:2];
                    return;
                }
                else if (self.hero.acceptedTaskKingVPostOrb)
                {
                    [self goText:2 sprite:2];
                    return;
                }
                else if (self.hero.beatBoss1)
                {
                    [self goText:1 sprite:2];
                    return;
                }
                else if (self.hero.talkedToKingVInitial)
                {
                    [self goText:973 sprite:2];
                    return;
                }
                else
                {
                    [self goText:0 sprite:2];
                }
            }
            
            NSString *sprite3Interact = [properties valueForKey:@"sprite3IsHere"];
            if (sprite3Interact && [sprite3Interact compare:@"true"] == NSOrderedSame)
            {
                self.sprite3.orientation = oppOrientation;
                
                if (self.sprite3.orientation == 1)
                {
                    [self.sprite3 setDisplayFrame:[[spriteBWalkDown frames] objectAtIndex:0]];
                }
                else if (self.sprite3.orientation == 2)
                {
                    [self.sprite3 setDisplayFrame:[[spriteBWalkUp frames] objectAtIndex:0]];
                }
                else if (self.sprite3.orientation == 3)
                {
                    [self.sprite3 setDisplayFrame:[[spriteBWalkRight frames] objectAtIndex:0]];
                }
                else
                {
                    [self.sprite3 setDisplayFrame:[[spriteBWalkLeft frames] objectAtIndex:0]];
                }
                
                if (self.hero.beatIonak)
                {
                    [self goText:3 sprite:3];
                    return;
                }
                else if (self.hero.acceptedTaskKingVPostOrb)
                {
                    [self goText:2 sprite:3];
                    return;
                }
                else if (self.hero.beatBoss1)
                {
                    [self goText:1 sprite:3];
                    return;
                }
                else if (self.hero.talkedToKingVInitial)
                {
                    [self goText:973 sprite:3];
                    return;
                }
                else
                {
                    [self goText:0 sprite:3];
                }
            }
            
            NSString *sprite4Interact = [properties valueForKey:@"sprite4IsHere"];
            if (sprite4Interact && [sprite4Interact compare:@"true"] == NSOrderedSame)
            {
                self.sprite4.orientation = oppOrientation;
                
                if (self.sprite4.orientation == 1)
                {
                    [self.sprite4 setDisplayFrame:[[spriteKWalkDown frames] objectAtIndex:0]];
                }
                else if (self.sprite4.orientation == 2)
                {
                    [self.sprite4 setDisplayFrame:[[spriteKWalkUp frames] objectAtIndex:0]];
                }
                else if (self.sprite4.orientation == 3)
                {
                    [self.sprite4 setDisplayFrame:[[spriteKWalkRight frames] objectAtIndex:0]];
                }
                else
                {
                    [self.sprite4 setDisplayFrame:[[spriteKWalkLeft frames] objectAtIndex:0]];
                }
                
                if (self.hero.beatIonak)
                {
                    [self goText:6];
                    return;
                }
                else if (self.hero.acceptedTaskKingVPostOrb)
                {
                    [self goText:5];
                    return;
                }
                else
                {
                    [self goText:4];
                }
            }
            
            NSString *sprite5Interact = [properties valueForKey:@"sprite5IsHere"];
            if (sprite5Interact && [sprite5Interact compare:@"true"] == NSOrderedSame)
            {
                self.sprite5.orientation = oppOrientation;
                
                if (self.sprite5.orientation == 1)
                {
                    [self.sprite5 setDisplayFrame:[[spriteKWalkDown frames] objectAtIndex:0]];
                }
                else if (self.sprite5.orientation == 2)
                {
                    [self.sprite5 setDisplayFrame:[[spriteKWalkUp frames] objectAtIndex:0]];
                }
                else if (self.sprite5.orientation == 3)
                {
                    [self.sprite5 setDisplayFrame:[[spriteKWalkRight frames] objectAtIndex:0]];
                }
                else
                {
                    [self.sprite5 setDisplayFrame:[[spriteKWalkLeft frames] objectAtIndex:0]];
                }
                
                if (self.hero.beatIonak)
                {
                    [self goText:9 sprite:5];
                    return;
                }
                else if (self.hero.acceptedTaskKingVPostOrb)
                {
                    [self goText:8 sprite:5];
                    return;
                }
                else
                {
                    [self goText:7 sprite:5];
                }
            }
            
            NSString *sprite6Interact = [properties valueForKey:@"sprite6IsHere"];
            if (sprite6Interact && [sprite6Interact compare:@"true"] == NSOrderedSame)
            {
                self.sprite6.orientation = oppOrientation;
                
                if (self.sprite6.orientation == 1)
                {
                    [self.sprite6 setDisplayFrame:[[spriteDWalkDown frames] objectAtIndex:0]];
                }
                else if (self.sprite6.orientation == 2)
                {
                    [self.sprite6 setDisplayFrame:[[spriteDWalkUp frames] objectAtIndex:0]];
                }
                else if (self.sprite6.orientation == 3)
                {
                    [self.sprite6 setDisplayFrame:[[spriteDWalkRight frames] objectAtIndex:0]];
                }
                else
                {
                    [self.sprite6 setDisplayFrame:[[spriteDWalkLeft frames] objectAtIndex:0]];
                }
                
                if (self.hero.gotPrizeFromKingV)
                {
                    [self goText:30];
                    return;
                }
                else if (self.hero.beatIonak)
                {
                    [self goText:27];
                    return;
                }
                else if (self.hero.acceptedFindEilifKingV)
                {
                    [self goText:23];
                    return;
                }
                else if (self.hero.toldNewsKingV)
                {
                    [self goText:21];
                    return;
                }
                else if (self.hero.acceptedMessageKingK)
                {
                    [self goText:19];
                    return;
                }
                else if (self.hero.talkedToKingVPostOrb)
                {
                    [self goText:17];
                    return;
                }
                else if (self.hero.beatBoss1)
                {
                    [self goText:15];
                    return;
                }
                else if (self.hero.gotOrb)
                {
                    [self goText:13];
                    return;
                }
                else if (self.hero.talkedToKingVInitial)
                {
                    [self goText:10];
                    return;
                }
                else
                {
                    [self goText:10];
                }
            }
            
            NSString *sprite7Interact = [properties valueForKey:@"sprite7IsHere"];
            if (sprite7Interact && [sprite7Interact compare:@"true"] == NSOrderedSame)
            {
                self.sprite7.orientation = oppOrientation;
                
                if (self.sprite7.orientation == 1)
                {
                    [self.sprite7 setDisplayFrame:[[spriteXWalkDown frames] objectAtIndex:0]];
                }
                else if (self.sprite7.orientation == 2)
                {
                    [self.sprite7 setDisplayFrame:[[spriteXWalkUp frames] objectAtIndex:0]];
                }
                else if (self.sprite7.orientation == 3)
                {
                    [self.sprite7 setDisplayFrame:[[spriteXWalkRight frames] objectAtIndex:0]];
                }
                else
                {
                    [self.sprite7 setDisplayFrame:[[spriteXWalkLeft frames] objectAtIndex:0]];
                }
                [self goText:31 sprite:7];
                return;
            }
            
            NSString *sprite8Interact = [properties valueForKey:@"sprite8IsHere"];
            if (sprite8Interact && [sprite8Interact compare:@"true"] == NSOrderedSame)
            {
                self.sprite8.orientation = oppOrientation;
                
                if (self.sprite8.orientation == 1)
                {
                    [self.sprite8 setDisplayFrame:[[spriteNWalkDown frames] objectAtIndex:0]];
                }
                else if (self.sprite8.orientation == 2)
                {
                    [self.sprite8 setDisplayFrame:[[spriteNWalkUp frames] objectAtIndex:0]];
                }
                else if (self.sprite8.orientation == 3)
                {
                    [self.sprite8 setDisplayFrame:[[spriteNWalkRight frames] objectAtIndex:0]];
                }
                else
                {
                    [self.sprite8 setDisplayFrame:[[spriteNWalkLeft frames] objectAtIndex:0]];
                }
                
                if (self.hero.beatIonak)
                {
                    [self goText:35];
                    return;
                }
                else if (self.hero.deliveredLetterToKingK)
                {
                    [self goText:34];
                    return;
                }
                else if (self.hero.beatBoss1)
                {
                    [self goText:33];
                    return;
                }
                else
                {
                    [self goText:32];
                    return;
                }
            }
            
            NSString *sprite9Interact = [properties valueForKey:@"sprite9IsHere"];
            if (sprite9Interact && [sprite9Interact compare:@"true"] == NSOrderedSame)
            {
                self.sprite9.orientation = oppOrientation;
                
                if (self.sprite9.orientation == 1)
                {
                    [self.sprite9 setDisplayFrame:[[spriteZWalkDown frames] objectAtIndex:0]];
                }
                else if (self.sprite9.orientation == 2)
                {
                    [self.sprite9 setDisplayFrame:[[spriteZWalkUp frames] objectAtIndex:0]];
                }
                else if (self.sprite9.orientation == 3)
                {
                    [self.sprite9 setDisplayFrame:[[spriteZWalkRight frames] objectAtIndex:0]];
                }
                else
                {
                    [self.sprite9 setDisplayFrame:[[spriteZWalkLeft frames] objectAtIndex:0]];
                }
                
                [self goText:36 sprite:9];
                return;
            }
            
            NSString *sprite10Interact = [properties valueForKey:@"sprite10IsHere"];
            if (sprite10Interact && [sprite10Interact compare:@"true"] == NSOrderedSame)
            {
                self.sprite10.orientation = oppOrientation;
                
                if (self.sprite10.orientation == 1)
                {
                    [self.sprite10 setDisplayFrame:[[spriteQWalkDown frames] objectAtIndex:0]];
                }
                else if (self.sprite10.orientation == 2)
                {
                    [self.sprite10 setDisplayFrame:[[spriteQWalkUp frames] objectAtIndex:0]];
                }
                else if (self.sprite10.orientation == 3)
                {
                    [self.sprite10 setDisplayFrame:[[spriteQWalkRight frames] objectAtIndex:0]];
                }
                else
                {
                    [self.sprite10 setDisplayFrame:[[spriteQWalkLeft frames] objectAtIndex:0]];
                }
                
                if (self.hero.acceptedFindEilifKingV)
                {
                    [self goText:40];
                    return;
                }
                else
                {
                    [self goText:39];
                    return;
                }
            }
            
            NSString *sprite11Interact = [properties valueForKey:@"sprite11IsHere"];
            if (sprite11Interact && [sprite11Interact compare:@"true"] == NSOrderedSame)
            {
                self.sprite11.orientation = oppOrientation;
                
                if (self.sprite11.orientation == 1)
                {
                    [self.sprite11 setDisplayFrame:[[spritePWalkDown frames] objectAtIndex:0]];
                }
                else if (self.sprite11.orientation == 2)
                {
                    [self.sprite11 setDisplayFrame:[[spritePWalkUp frames] objectAtIndex:0]];
                }
                else if (self.sprite11.orientation == 3)
                {
                    [self.sprite11 setDisplayFrame:[[spritePWalkRight frames] objectAtIndex:0]];
                }
                else
                {
                    [self.sprite11 setDisplayFrame:[[spritePWalkLeft frames] objectAtIndex:0]];
                }
                
                [self goText:41 sprite:11];
                return;
            }
            
            NSString *sprite12Interact = [properties valueForKey:@"sprite12IsHere"];
            if (sprite12Interact && [sprite12Interact compare:@"true"] == NSOrderedSame)
            {
                self.sprite12.orientation = oppOrientation;
                
                if (self.sprite12.orientation == 1)
                {
                    [self.sprite12 setDisplayFrame:[[spriteUWalkDown frames] objectAtIndex:0]];
                }
                else if (self.sprite12.orientation == 2)
                {
                    [self.sprite12 setDisplayFrame:[[spriteUWalkUp frames] objectAtIndex:0]];
                }
                else if (self.sprite12.orientation == 3)
                {
                    [self.sprite12 setDisplayFrame:[[spriteUWalkRight frames] objectAtIndex:0]];
                }
                else
                {
                    [self.sprite12 setDisplayFrame:[[spriteUWalkLeft frames] objectAtIndex:0]];
                }
                
                if (self.hero.beatIonak)
                {
                    [self goText:43];
                    return;
                }
                else
                {
                    [self goText:42];
                    return;
                }
            }
            
            NSString *sprite13Interact = [properties valueForKey:@"sprite13IsHere"];
            if (sprite13Interact && [sprite13Interact compare:@"true"] == NSOrderedSame)
            {
                self.sprite13.orientation = oppOrientation;
                
                if (self.sprite13.orientation == 1)
                {
                    [self.sprite13 setDisplayFrame:[[spriteMWalkDown frames] objectAtIndex:0]];
                }
                else if (self.sprite13.orientation == 2)
                {
                    [self.sprite13 setDisplayFrame:[[spriteMWalkUp frames] objectAtIndex:0]];
                }
                else if (self.sprite13.orientation == 3)
                {
                    [self.sprite13 setDisplayFrame:[[spriteMWalkRight frames] objectAtIndex:0]];
                }
                else
                {
                    [self.sprite13 setDisplayFrame:[[spriteMWalkLeft frames] objectAtIndex:0]];
                }
                
                [self goText:44 sprite:13];
                return;
            }
            
            NSString *sprite14Interact = [properties valueForKey:@"sprite14IsHere"];
            if (sprite14Interact && [sprite14Interact compare:@"true"] == NSOrderedSame)
            {
                self.sprite14.orientation = oppOrientation;
                
                if (self.sprite14.orientation == 1)
                {
                    [self.sprite14 setDisplayFrame:[[spriteIWalkDown frames] objectAtIndex:0]];
                }
                else if (self.sprite14.orientation == 2)
                {
                    [self.sprite14 setDisplayFrame:[[spriteIWalkUp frames] objectAtIndex:0]];
                }
                else if (self.sprite14.orientation == 3)
                {
                    [self.sprite14 setDisplayFrame:[[spriteIWalkRight frames] objectAtIndex:0]];
                }
                else
                {
                    [self.sprite14 setDisplayFrame:[[spriteIWalkLeft frames] objectAtIndex:0]];
                }
                
                if (self.hero.finishedTaskTraveler)
                {
                    [self goText:54];
                    return;
                }
                else if (self.hero.beatCaveTroll)
                {
                    [self goText:50];
                    return;
                }
                else if (self.hero.acceptedTaskTraveler)
                {
                    [self goText:49];
                    return;
                }
                else if (self.hero.acceptedFindEilifKingV)
                {
                    [self goText:46];
                    return;
                }
                else
                {
                    [self goText:45];
                    return;
                }
            }
            
            NSString *sprite15Interact = [properties valueForKey:@"sprite15IsHere"];
            if (sprite15Interact && [sprite15Interact compare:@"true"] == NSOrderedSame)
            {
                self.sprite15.orientation = oppOrientation;
                
                if (self.sprite15.orientation == 1)
                {
                    [self.sprite15 setDisplayFrame:[[spriteWWalkDown frames] objectAtIndex:0]];
                }
                else if (self.sprite15.orientation == 2)
                {
                    [self.sprite15 setDisplayFrame:[[spriteWWalkUp frames] objectAtIndex:0]];
                }
                else if (self.sprite15.orientation == 3)
                {
                    [self.sprite15 setDisplayFrame:[[spriteWWalkRight frames] objectAtIndex:0]];
                }
                else
                {
                    [self.sprite15 setDisplayFrame:[[spriteWWalkLeft frames] objectAtIndex:0]];
                }
                
                [self goText:102 sprite:15];
                return;
            }
            
            NSString *sprite16Interact = [properties valueForKey:@"sprite16IsHere"];
            if (sprite16Interact && [sprite16Interact compare:@"true"] == NSOrderedSame)
            {
                self.sprite16.orientation = oppOrientation;
                
                if (self.sprite16.orientation == 1)
                {
                    [self.sprite16 setDisplayFrame:[[spriteYWalkDown frames] objectAtIndex:0]];
                }
                else if (self.sprite16.orientation == 2)
                {
                    [self.sprite16 setDisplayFrame:[[spriteYWalkUp frames] objectAtIndex:0]];
                }
                else if (self.sprite16.orientation == 3)
                {
                    [self.sprite16 setDisplayFrame:[[spriteYWalkRight frames] objectAtIndex:0]];
                }
                else
                {
                    [self.sprite16 setDisplayFrame:[[spriteYWalkLeft frames] objectAtIndex:0]];
                }
                
                [self goText:101];
                return;
            }
            
            NSString *sprite17Interact = [properties valueForKey:@"sprite17IsHere"];
            if (sprite17Interact && [sprite17Interact compare:@"true"] == NSOrderedSame)
            {
                self.sprite17.orientation = oppOrientation;
                
                if (self.sprite17.orientation == 1)
                {
                    [self.sprite17 setDisplayFrame:[[spriteZAWalkDown frames] objectAtIndex:0]];
                }
                else if (self.sprite17.orientation == 2)
                {
                    [self.sprite17 setDisplayFrame:[[spriteZAWalkUp frames] objectAtIndex:0]];
                }
                else if (self.sprite17.orientation == 3)
                {
                    [self.sprite17 setDisplayFrame:[[spriteZAWalkRight frames] objectAtIndex:0]];
                }
                else
                {
                    [self.sprite17 setDisplayFrame:[[spriteZAWalkLeft frames] objectAtIndex:0]];
                }
                
                [self goText:105 sprite:17];
                return;
            }
            
            NSString *sprite18Interact = [properties valueForKey:@"sprite18IsHere"];
            if (sprite18Interact && [sprite18Interact compare:@"true"] == NSOrderedSame)
            {
                self.sprite18.orientation = oppOrientation;
                
                if (self.sprite18.orientation == 1)
                {
                    [self.sprite18 setDisplayFrame:[[spriteTWalkDown frames] objectAtIndex:0]];
                }
                else if (self.sprite18.orientation == 2)
                {
                    [self.sprite18 setDisplayFrame:[[spriteTWalkUp frames] objectAtIndex:0]];
                }
                else if (self.sprite18.orientation == 3)
                {
                    [self.sprite18 setDisplayFrame:[[spriteTWalkRight frames] objectAtIndex:0]];
                }
                else
                {
                    [self.sprite18 setDisplayFrame:[[spriteTWalkLeft frames] objectAtIndex:0]];
                }
                
                [self goText:106 sprite:18];
                return;
            }
            
            NSString *sprite19Interact = [properties valueForKey:@"sprite19IsHere"];
            if (sprite19Interact && [sprite19Interact compare:@"true"] == NSOrderedSame)
            {
                self.sprite19.orientation = oppOrientation;
                
                if (self.sprite19.orientation == 1)
                {
                    [self.sprite19 setDisplayFrame:[[spriteBWalkDown frames] objectAtIndex:0]];
                }
                else if (self.sprite19.orientation == 2)
                {
                    [self.sprite19 setDisplayFrame:[[spriteBWalkUp frames] objectAtIndex:0]];
                }
                else if (self.sprite19.orientation == 3)
                {
                    [self.sprite19 setDisplayFrame:[[spriteBWalkRight frames] objectAtIndex:0]];
                }
                else
                {
                    [self.sprite19 setDisplayFrame:[[spriteBWalkLeft frames] objectAtIndex:0]];
                }
                
                [self goText:55 sprite:19];
                return;
            }
            
            NSString *sprite20Interact = [properties valueForKey:@"sprite20IsHere"];
            if (sprite20Interact && [sprite20Interact compare:@"true"] == NSOrderedSame)
            {
                self.sprite20.orientation = oppOrientation;
                
                if (self.sprite20.orientation == 1)
                {
                    [self.sprite20 setDisplayFrame:[[spriteKWalkDown frames] objectAtIndex:0]];
                }
                else if (self.sprite20.orientation == 2)
                {
                    [self.sprite20 setDisplayFrame:[[spriteKWalkUp frames] objectAtIndex:0]];
                }
                else if (self.sprite20.orientation == 3)
                {
                    [self.sprite20 setDisplayFrame:[[spriteKWalkRight frames] objectAtIndex:0]];
                }
                else
                {
                    [self.sprite20 setDisplayFrame:[[spriteKWalkLeft frames] objectAtIndex:0]];
                }
                
                [self goText:56];
                return;
            }
            
            NSString *sprite21Interact = [properties valueForKey:@"sprite21IsHere"];
            if (sprite21Interact && [sprite21Interact compare:@"true"] == NSOrderedSame)
            {
                self.sprite21.orientation = oppOrientation;
                
                if (self.sprite21.orientation == 1)
                {
                    [self.sprite21 setDisplayFrame:[[spriteBWalkDown frames] objectAtIndex:0]];
                }
                else if (self.sprite21.orientation == 2)
                {
                    [self.sprite21 setDisplayFrame:[[spriteBWalkUp frames] objectAtIndex:0]];
                }
                else if (self.sprite21.orientation == 3)
                {
                    [self.sprite21 setDisplayFrame:[[spriteBWalkRight frames] objectAtIndex:0]];
                }
                else
                {
                    [self.sprite21 setDisplayFrame:[[spriteBWalkLeft frames] objectAtIndex:0]];
                }
                
                [self goText:57 sprite:21];
                return;
            }
            
            NSString *sprite22Interact = [properties valueForKey:@"sprite22IsHere"];
            if (sprite22Interact && [sprite22Interact compare:@"true"] == NSOrderedSame)
            {
                self.sprite22.orientation = oppOrientation;
                
                if (self.sprite22.orientation == 1)
                {
                    [self.sprite22 setDisplayFrame:[[spriteKWalkDown frames] objectAtIndex:0]];
                }
                else if (self.sprite22.orientation == 2)
                {
                    [self.sprite22 setDisplayFrame:[[spriteKWalkUp frames] objectAtIndex:0]];
                }
                else if (self.sprite22.orientation == 3)
                {
                    [self.sprite22 setDisplayFrame:[[spriteKWalkRight frames] objectAtIndex:0]];
                }
                else
                {
                    [self.sprite22 setDisplayFrame:[[spriteKWalkLeft frames] objectAtIndex:0]];
                }
                
                [self goText:58];
                return;
            }
            
            NSString *sprite23Interact = [properties valueForKey:@"sprite23IsHere"];
            if (sprite23Interact && [sprite23Interact compare:@"true"] == NSOrderedSame)
            {
                self.sprite23.orientation = oppOrientation;
                
                if (self.sprite23.orientation == 1)
                {
                    [self.sprite23 setDisplayFrame:[[spriteBWalkDown frames] objectAtIndex:0]];
                }
                else if (self.sprite23.orientation == 2)
                {
                    [self.sprite23 setDisplayFrame:[[spriteBWalkUp frames] objectAtIndex:0]];
                }
                else if (self.sprite23.orientation == 3)
                {
                    [self.sprite23 setDisplayFrame:[[spriteBWalkRight frames] objectAtIndex:0]];
                }
                else
                {
                    [self.sprite23 setDisplayFrame:[[spriteBWalkLeft frames] objectAtIndex:0]];
                }
                
                if (self.hero.toldNewsKingV)
                {
                    [self goText:60 sprite:23];
                    return;
                }
                else
                {
                    [self goText:59 sprite:23];
                    return;
                }
            }
            
            NSString *sprite24Interact = [properties valueForKey:@"sprite24IsHere"];
            if (sprite24Interact && [sprite24Interact compare:@"true"] == NSOrderedSame)
            {
                self.sprite24.orientation = oppOrientation;
                
                if (self.sprite24.orientation == 1)
                {
                    [self.sprite24 setDisplayFrame:[[spriteKWalkDown frames] objectAtIndex:0]];
                }
                else if (self.sprite24.orientation == 2)
                {
                    [self.sprite24 setDisplayFrame:[[spriteKWalkUp frames] objectAtIndex:0]];
                }
                else if (self.sprite24.orientation == 3)
                {
                    [self.sprite24 setDisplayFrame:[[spriteKWalkRight frames] objectAtIndex:0]];
                }
                else
                {
                    [self.sprite24 setDisplayFrame:[[spriteKWalkLeft frames] objectAtIndex:0]];
                }
                
                [self goText:61];
                return;
            }
            
            NSString *sprite25Interact = [properties valueForKey:@"sprite25IsHere"];
            if (sprite25Interact && [sprite25Interact compare:@"true"] == NSOrderedSame)
            {
                self.sprite25.orientation = oppOrientation;
                
                if (self.sprite25.orientation == 1)
                {
                    [self.sprite25 setDisplayFrame:[[spriteKWalkDown frames] objectAtIndex:0]];
                }
                else if (self.sprite25.orientation == 2)
                {
                    [self.sprite25 setDisplayFrame:[[spriteKWalkUp frames] objectAtIndex:0]];
                }
                else if (self.sprite25.orientation == 3)
                {
                    [self.sprite25 setDisplayFrame:[[spriteKWalkRight frames] objectAtIndex:0]];
                }
                else
                {
                    [self.sprite25 setDisplayFrame:[[spriteKWalkLeft frames] objectAtIndex:0]];
                }
                
                if (self.hero.beatCyclops)
                {
                    [self goText:63 sprite:25];
                    return;
                }
                else
                {
                    [self goText:62 sprite:25];
                    return;
                }
            }
            
            NSString *sprite26Interact = [properties valueForKey:@"sprite26IsHere"];
            if (sprite26Interact && [sprite26Interact compare:@"true"] == NSOrderedSame)
            {
                self.sprite26.orientation = oppOrientation;
                
                if (self.sprite26.orientation == 1)
                {
                    [self.sprite26 setDisplayFrame:[[spriteHWalkDown frames] objectAtIndex:0]];
                }
                else if (self.sprite26.orientation == 2)
                {
                    [self.sprite26 setDisplayFrame:[[spriteHWalkUp frames] objectAtIndex:0]];
                }
                else if (self.sprite26.orientation == 3)
                {
                    [self.sprite26 setDisplayFrame:[[spriteHWalkRight frames] objectAtIndex:0]];
                }
                else
                {
                    [self.sprite26 setDisplayFrame:[[spriteHWalkLeft frames] objectAtIndex:0]];
                }
                
                if (self.hero.beatIonak)
                {
                    [self goText:65];
                    return;
                }
                else
                {
                    [self goText:64];
                    return;
                }
            }
            
            NSString *sprite27Interact = [properties valueForKey:@"sprite27IsHere"];
            if (sprite27Interact && [sprite27Interact compare:@"true"] == NSOrderedSame)
            {
                self.sprite27.orientation = oppOrientation;
                
                if (self.sprite27.orientation == 1)
                {
                    [self.sprite27 setDisplayFrame:[[spriteZBWalkDown frames] objectAtIndex:0]];
                }
                else if (self.sprite27.orientation == 2)
                {
                    [self.sprite27 setDisplayFrame:[[spriteZBWalkUp frames] objectAtIndex:0]];
                }
                else if (self.sprite27.orientation == 3)
                {
                    [self.sprite27 setDisplayFrame:[[spriteZBWalkRight frames] objectAtIndex:0]];
                }
                else
                {
                    [self.sprite27 setDisplayFrame:[[spriteZBWalkLeft frames] objectAtIndex:0]];
                }
                
                [self goText:66 sprite:27];
                return;
            }
            
            
            
            NSString *boss1Interact = [properties valueForKey:@"autoBattleID"];
            if (boss1Interact && [boss1Interact compare:@"1"] == NSOrderedSame)
            {
                
                if (!self.hero.beatBoss1 && self.hero.hasLitOrb)
                {
                    currentBID = 101;
                    [self goText:400];
                    return;
                }
            }
            NSString *boss2Interact = [properties valueForKey:@"autoBattleID"];
            if (boss2Interact && [boss2Interact compare:@"2"] == NSOrderedSame)
            {
                
                if (!self.hero.beatCyclops)
                {
                    currentBID = 102;
                    [self goText:401];
                    return;
                }
            }
            
            NSString *pedestal = [properties valueForKey:@"pedestal"];
            if (pedestal && [pedestal compare:@"true"] == NSOrderedSame)
            {
                
                if (!self.hero.hasLitOrb)
                {
                    [self goText:451];
                    [self lightOrb];
                    return;
                }
                else
                {
                    [self goText:452];
                    return;
                }
            }
            NSString *mapItem1 = [properties valueForKey:@"item1"];
            if (mapItem1 && [mapItem1 compare:@"true"] == NSOrderedSame)
            {
                
                if (!self.hero.gotItem1)
                {
                    [self goText:301];
                    return;
                }
                else
                {
                    [self goText:399];
                    return;
                }
            }
            NSString *mapItem2 = [properties valueForKey:@"item2"];
            if (mapItem2 && [mapItem2 compare:@"true"] == NSOrderedSame)
            {
                
                if (!self.hero.gotItem2)
                {
                    [self goText:302];
                    return;
                }
                else
                {
                    [self goText:399];
                    return;
                }
            }
            NSString *mapItem3 = [properties valueForKey:@"item3"];
            if (mapItem3 && [mapItem3 compare:@"true"] == NSOrderedSame)
            {
                
                if (!self.hero.gotItem3)
                {
                    [self goText:303];
                    return;
                }
                else
                {
                    [self goText:399];
                    return;
                }
            }
            NSString *mapItem4 = [properties valueForKey:@"item4"];
            if (mapItem4 && [mapItem4 compare:@"true"] == NSOrderedSame)
            {
                
                if (!self.hero.gotItem4)
                {
                    [self goText:304];
                    return;
                }
                else
                {
                    return;
                }
            }
            
            NSString *sign31 = [properties valueForKey:@"sign31"];
            if (sign31 && [sign31 compare:@"true"] == NSOrderedSame)
            {
                [self goText:200];
                return;
            }
            NSString *sign32 = [properties valueForKey:@"sign32"];
            if (sign32 && [sign32 compare:@"true"] == NSOrderedSame)
            {
                [self goText:201];
                return;
            }
            NSString *sign33 = [properties valueForKey:@"sign33"];
            if (sign33 && [sign33 compare:@"true"] == NSOrderedSame)
            {
                [self goText:202];
                return;
            }
            NSString *sign34 = [properties valueForKey:@"sign34"];
            if (sign34 && [sign34 compare:@"true"] == NSOrderedSame)
            {
                [self goText:203];
                return;
            }
            NSString *sign35 = [properties valueForKey:@"sign35"];
            if (sign35 && [sign35 compare:@"true"] == NSOrderedSame)
            {
                [self goText:204];
                return;
            }
            NSString *sign36 = [properties valueForKey:@"sign36"];
            if (sign36 && [sign36 compare:@"true"] == NSOrderedSame)
            {
                [self goText:205];
                return;
            }
            NSString *sign37 = [properties valueForKey:@"sign37"];
            if (sign37 && [sign37 compare:@"true"] == NSOrderedSame)
            {
                [self goText:206];
                return;
            }
            NSString *sign38 = [properties valueForKey:@"sign38"];
            if (sign38 && [sign38 compare:@"true"] == NSOrderedSame)
            {
                [self goText:207];
                return;
            }
            NSString *sign39 = [properties valueForKey:@"sign39"];
            if (sign39 && [sign39 compare:@"true"] == NSOrderedSame)
            {
                [self goText:208];
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
        if (!self.hero.finishedTaskTraveler)
        {
            [self updateSprite14];
        }
    }
    else if (spriteCycleCount == 2)
    {
        [self updateSprite1];
        [self updateSprite3];
        [self updateSprite21];
    }
    else if (spriteCycleCount == 3)
    {
        [self updateSprite2];
        [self updateSprite4];
        [self updateSprite22];
    }
    else if (spriteCycleCount == 4)
    {
        [self updateSprite5];
        [self updateSprite8];
        [self updateSprite23];
    }
    else if (spriteCycleCount == 5)
    {
        [self updateSprite12];
        [self updateSprite6];
        [self updateSprite9];
        [self updateSprite20];
    }
    else if (spriteCycleCount == 6)
    {
        [self updateSprite10];
        [self updateSprite13];
        [self updateSprite25];
    }
    else if (spriteCycleCount == 7)
    {
        [self updateSprite7];
        [self updateSprite11];
        [self updateSprite14];
        [self updateSprite26];
    }
    else if (spriteCycleCount == 8)
    {
        [self updateSprite15];
        [self updateSprite18];
        [self updateSprite27];
    }
    else if (spriteCycleCount == 9)
    {
        [self updateSprite17];
        [self updateSprite16];
    }
    else if (spriteCycleCount == 10)
    {
        [self updateSprite19];
        [self updateSprite24];
    }
    
    
    if (spriteCycleCount > 11)
    {
        spriteCycleCount = 0;
    }
    return;
}



@end