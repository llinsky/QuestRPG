//
//  PlayLayerEleven.m
//  Quest
//
//  Created by Leo Linsky on 2/17/14.
//
//

#import "PlayLayerEleven.h"

@implementation PlayLayerEleven



@synthesize item59,item60,item61,item62,item63,boss10,boss8,boss9,sprite130;

-(id)init
{
    if (self = [super init])
    {
        
        self.theHKMap = [HKTMXTiledMap tiledMapWithTMXFile:@"playlayer11_FINAL1.tmx"];
        [[CCDirector sharedDirector] setProjection:kCCDirectorProjection2D];
        
        
        self.bgLayer = [theHKMap layerNamed:@"bg1"];
        self.bgLayer.visible = NO;
        
        CCTMXObjectGroup *objects = [theHKMap objectGroupNamed:@"oj1"];
        
        
        [self addChild:theHKMap z:-1];
        
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
        }
        
        //bosses
        
        if (!self.hero.beatSunDragon)
        {
            self.boss8 = [CCSprite spriteWithFile:@"boss8sprite01.png"];
            NSMutableDictionary *boss4pos = [objects objectNamed:@"boss8"];
            double x1 = [[boss4pos valueForKey:@"x"]floatValue];
            double y1 = [[boss4pos valueForKey:@"y"]floatValue];
            self.boss8.position = ccp(x1,y1);
            [self.theHKMap addChild:self.boss8 z:self.bgLayer.zOrder];
        }
        if (!self.hero.beatTitan)
        {
            self.boss9 = [CCSprite spriteWithFile:@"boss9sprite01.png"];
            NSMutableDictionary *boss4pos = [objects objectNamed:@"boss9"];
            double x1 = [[boss4pos valueForKey:@"x"]floatValue];
            double y1 = [[boss4pos valueForKey:@"y"]floatValue];
            self.boss9.position = ccp(x1,y1);
            [self.theHKMap addChild:self.boss9 z:self.bgLayer.zOrder];
        }
        if (!self.hero.beatVodek)
        {
            self.boss10 = [CCSprite spriteWithFile:@"boss10sprite01.png"];
            NSMutableDictionary *boss4pos = [objects objectNamed:@"boss10"];
            double x1 = [[boss4pos valueForKey:@"x"]floatValue];
            double y1 = [[boss4pos valueForKey:@"y"]floatValue];
            self.boss10.position = ccp(x1,y1);
            [self.theHKMap addChild:self.boss10 z:self.bgLayer.zOrder];
        }
        
        //guard
        
        if (self.hero.beatTitan && self.hero.beatSunDragon)
        {
            self.sprite130 = [InteractiveSprite spriteWithSpriteFrameName:@"herospriteG04.png"];
            self.sprite130.spriteCode = 130;
            
            self.sprite130.orientation = 1;
            if (self.hero.sprite130_Orientation)
            {
                self.sprite130.orientation = self.hero.sprite130_Orientation;
            }
            if (self.sprite130.orientation == 1)
            {
                [self.sprite130 setDisplayFrame:[[spriteGWalkDown frames] objectAtIndex:0]];
            }
            else if (self.sprite130.orientation == 2)
            {
                [self.sprite130 setDisplayFrame:[[spriteGWalkUp frames] objectAtIndex:0]];
            }
            else if (self.sprite130.orientation == 3)
            {
                [self.sprite130 setDisplayFrame:[[spriteGWalkRight frames] objectAtIndex:0]];
            }
            else
            {
                [self.sprite130 setDisplayFrame:[[spriteGWalkLeft frames] objectAtIndex:0]];
            }
            
            [self schedule:@selector(updateSprite130) interval:(1.5f)];
            
            
            if ((self.hero.sprite130position.x != 0)&&(!self.hero.justBeatVodek))
            {
                self.sprite130.position = self.hero.sprite130position;
            }
            else
            {
                NSMutableDictionary *sprite130start = [objects objectNamed:@"sprite130Start"];
                double x1 = [[sprite130start valueForKey:@"x"]floatValue];
                double y1 = [[sprite130start valueForKey:@"y"]floatValue];
                self.sprite130.position = ccp(x1,y1);
            }
            
            [self.theHKMap addChild:self.sprite130 z:self.bgLayer.zOrder];
            
            CGPoint tileCoord1 = [self tileCoordForPosition:self.sprite130.position];
            int tileGID1 = [self.bgLayer tileGIDAt:tileCoord1];
            [self.bgLayer removeTileAt:tileCoord1];
            [self.bgLayer setTileGID:(tileGID1 + 1) at:tileCoord1];
            
            if (self.hero.justBeatVodek)
            {
                self.hero.justBeatVodek = FALSE;
            }
        }
        else
        {
            self.sprite130 = [InteractiveSprite spriteWithSpriteFrameName:@"herospriteG04.png"];
            self.sprite130.spriteCode = 130;
            
            self.sprite130.orientation = 1;
            
            if (self.sprite130.orientation == 1)
            {
                [self.sprite130 setDisplayFrame:[[spriteGWalkDown frames] objectAtIndex:0]];
            }
            
            
            NSMutableDictionary *sprite130start = [objects objectNamed:@"guard"];
            double x1 = [[sprite130start valueForKey:@"x"]floatValue];
            double y1 = [[sprite130start valueForKey:@"y"]floatValue];
            self.sprite130.position = ccp(x1,y1);
            
            [self.theHKMap addChild:self.sprite130 z:self.bgLayer.zOrder];
            
            CGPoint tileCoord1 = [self tileCoordForPosition:self.sprite130.position];
            int tileGID1 = [self.bgLayer tileGIDAt:tileCoord1];
            [self.bgLayer removeTileAt:tileCoord1];
            [self.bgLayer setTileGID:(tileGID1 + 1) at:tileCoord1];
        }
        
        
        //
        //items
        //
        
        if (!self.hero.gotItem59)
        {
            self.item59 = [CCSprite spriteWithFile:@"treasurechestSprite01.png"];
            NSMutableDictionary *item = [objects objectNamed:@"item59"];
            double x1 = [[item valueForKey:@"x"]floatValue];
            double y1 = [[item valueForKey:@"y"]floatValue];
            self.item59.position = ccp(x1,y1);
            [self.theHKMap addChild:self.item59 z:self.bgLayer.zOrder];
        }
        else
        {
            self.item59 = [CCSprite spriteWithFile:@"treasurechestSprite02.png"];
            NSMutableDictionary *item = [objects objectNamed:@"item59"];
            double x1 = [[item valueForKey:@"x"]floatValue];
            double y1 = [[item valueForKey:@"y"]floatValue];
            self.item59.position = ccp(x1,y1);
            [self.theHKMap addChild:self.item59 z:self.bgLayer.zOrder];
        }
        if (!self.hero.gotItem60)
        {
            self.item60 = [CCSprite spriteWithFile:@"treasurechestSprite01.png"];
            NSMutableDictionary *item = [objects objectNamed:@"item60"];
            double x1 = [[item valueForKey:@"x"]floatValue];
            double y1 = [[item valueForKey:@"y"]floatValue];
            self.item60.position = ccp(x1,y1);
            [self.theHKMap addChild:self.item60 z:self.bgLayer.zOrder];
        }
        else
        {
            self.item60 = [CCSprite spriteWithFile:@"treasurechestSprite02.png"];
            NSMutableDictionary *item = [objects objectNamed:@"item60"];
            double x1 = [[item valueForKey:@"x"]floatValue];
            double y1 = [[item valueForKey:@"y"]floatValue];
            self.item60.position = ccp(x1,y1);
            [self.theHKMap addChild:self.item60 z:self.bgLayer.zOrder];
        }
        if (!self.hero.gotItem61)
        {
            self.item61 = [CCSprite spriteWithFile:@"treasurechestSprite01.png"];
            NSMutableDictionary *item = [objects objectNamed:@"item61"];
            double x1 = [[item valueForKey:@"x"]floatValue];
            double y1 = [[item valueForKey:@"y"]floatValue];
            self.item61.position = ccp(x1,y1);
            [self.theHKMap addChild:self.item61 z:self.bgLayer.zOrder];
        }
        else
        {
            self.item61 = [CCSprite spriteWithFile:@"treasurechestSprite02.png"];
            NSMutableDictionary *item = [objects objectNamed:@"item61"];
            double x1 = [[item valueForKey:@"x"]floatValue];
            double y1 = [[item valueForKey:@"y"]floatValue];
            self.item61.position = ccp(x1,y1);
            [self.theHKMap addChild:self.item61 z:self.bgLayer.zOrder];
        }
        if (!self.hero.gotItem62)
        {
            self.item62 = [CCSprite spriteWithFile:@"treasurechestSprite01.png"];
            NSMutableDictionary *item = [objects objectNamed:@"item62"];
            double x1 = [[item valueForKey:@"x"]floatValue];
            double y1 = [[item valueForKey:@"y"]floatValue];
            self.item62.position = ccp(x1,y1);
            [self.theHKMap addChild:self.item62 z:self.bgLayer.zOrder];
        }
        else
        {
            self.item62 = [CCSprite spriteWithFile:@"treasurechestSprite02.png"];
            NSMutableDictionary *item = [objects objectNamed:@"item62"];
            double x1 = [[item valueForKey:@"x"]floatValue];
            double y1 = [[item valueForKey:@"y"]floatValue];
            self.item62.position = ccp(x1,y1);
            [self.theHKMap addChild:self.item62 z:self.bgLayer.zOrder];
        }
        if (!self.hero.gotItem63)
        {
            self.item63 = [CCSprite spriteWithFile:@"treasurechestSprite01.png"];
            NSMutableDictionary *item = [objects objectNamed:@"item63"];
            double x1 = [[item valueForKey:@"x"]floatValue];
            double y1 = [[item valueForKey:@"y"]floatValue];
            self.item63.position = ccp(x1,y1);
            [self.theHKMap addChild:self.item63 z:self.bgLayer.zOrder];
        }
        else
        {
            self.item63 = [CCSprite spriteWithFile:@"treasurechestSprite02.png"];
            NSMutableDictionary *item = [objects objectNamed:@"item63"];
            double x1 = [[item valueForKey:@"x"]floatValue];
            double y1 = [[item valueForKey:@"y"]floatValue];
            self.item63.position = ccp(x1,y1);
            [self.theHKMap addChild:self.item63 z:self.bgLayer.zOrder];
        }
        
        double x;
        double y;
        
        prev = self.hero.musicCode;
        
        //1(coming from login),2(gate/cave/stairs/dungeon), 3(teleport), 4(herodied - pl1), 5(start new game), 6(beat ionak - go pl1),7(item shop/menu),8(battle win/flee),121-beatVankurian Orc
        if (self.hero.mapInitMode == 1)
        {
            if (self.hero.musicCode != 8)
            {
                NSLog(@"MusicError1");
                self.hero.musicCode = 8;
            }
            prev = 0;
            
            self.spriteOrientation = 1;
            
            x = self.hero.position.x;
            y = self.hero.position.y;
            
            
        }
        else if (self.hero.mapInitMode == 2)
        {
            prev = 0; //probably don't need this, but might as well
            
            if (self.hero.currentMap == 8)
            {
                NSMutableDictionary *startPoint = [objects objectNamed:@"startPoint1"];
                x = [[startPoint valueForKey:@"x"]floatValue];
                y = [[startPoint valueForKey:@"y"]floatValue];
                self.hero.musicCode = 8;
            }
            else{
                NSLog(@"Location ERROR");
                NSMutableDictionary *startPoint = [objects objectNamed:@"startPoint1"];
                x = [[startPoint valueForKey:@"x"]floatValue];
                y = [[startPoint valueForKey:@"y"]floatValue];
                self.hero.musicCode = 8;
            }
            
            
            self.spriteOrientation = self.hero.heroOrientation;
            
        }
        else if (self.hero.mapInitMode == 3)
        {
            NSLog(@"Error3");
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
        self.hero.currentMap = 11;
        
        
    }
    return self;
}


-(void) updateSprite130
{
    CGSize screenSize = [[CCDirector sharedDirector] winSize];
    int x = self.hero.position.x;
    int y = self.hero.position.y;
    
    int p = self.sprite130.position.x;
    int q = self.sprite130.position.y;
    
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
        [self moveleftSprite130];
    }
    if (rand == 2)
    {
        [self moverightSprite130];
    }
    if (rand == 3)
    {
        [self moveupSprite130];
    }
    if (rand == 4)
    {
        [self movedownSprite130];
    }
    return;
}

-(void) moveleftSprite130
{
    CGPoint sprite130Pos = self.sprite130.position;
    self.sprite130.orientation = 4;
    sprite130Pos.x -= theHKMap.tileSize.width;
    
    CGPoint tileCoord = [self tileCoordForPosition:sprite130Pos];
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
                    CGPoint tileCoord1 = [self tileCoordForPosition:self.sprite130.position];
                    int tileGID1 = [self.bgLayer tileGIDAt:tileCoord1];
                    [self.bgLayer removeTileAt:tileCoord1];
                    [self.bgLayer setTileGID:(tileGID1 - 1) at:tileCoord1];
                    
                    id actionMove = [CCMoveTo actionWithDuration:0.3 position:sprite130Pos];
                    id actionMove2 = [CCAnimate actionWithAnimation:spriteGWalkLeft restoreOriginalFrame:NO];
                    
                    id actionMoveDone = [CCCallFuncN actionWithTarget:self selector:@selector(finishActionSprite130)];
                    
                    [self.sprite130 runAction:[CCSpawn actionOne:[CCSequence actions:actionMove,actionMoveDone,nil] two:actionMove2]];
                    return;
                }
            }
        }
    }
    [self finishActionSprite130];
}
-(void) moverightSprite130
{
    CGPoint sprite130Pos = self.sprite130.position;
    self.sprite130.orientation = 3;
    sprite130Pos.x += theHKMap.tileSize.width;
    
    CGPoint tileCoord = [self tileCoordForPosition:sprite130Pos];
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
                    CGPoint tileCoord1 = [self tileCoordForPosition:self.sprite130.position];
                    int tileGID1 = [self.bgLayer tileGIDAt:tileCoord1];
                    [self.bgLayer removeTileAt:tileCoord1];
                    [self.bgLayer setTileGID:(tileGID1 - 1) at:tileCoord1];
                    
                    id actionMove = [CCMoveTo actionWithDuration:0.3 position:sprite130Pos];
                    id actionMove2 = [CCAnimate actionWithAnimation:spriteGWalkRight restoreOriginalFrame:NO];
                    
                    id actionMoveDone = [CCCallFuncN actionWithTarget:self selector:@selector(finishActionSprite130)];
                    
                    [self.sprite130 runAction:[CCSpawn actionOne:[CCSequence actions:actionMove,actionMoveDone,nil] two:actionMove2]];
                    return;
                }
            }
        }
    }
    [self finishActionSprite130];
}
-(void) moveupSprite130
{
    CGPoint sprite130Pos = self.sprite130.position;
    self.sprite130.orientation = 2;
    sprite130Pos.y += theHKMap.tileSize.height;
    
    CGPoint tileCoord = [self tileCoordForPosition:sprite130Pos];
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
                    CGPoint tileCoord1 = [self tileCoordForPosition:self.sprite130.position];
                    int tileGID1 = [self.bgLayer tileGIDAt:tileCoord1];
                    [self.bgLayer removeTileAt:tileCoord1];
                    [self.bgLayer setTileGID:(tileGID1 - 1) at:tileCoord1];
                    
                    id actionMove = [CCMoveTo actionWithDuration:0.3 position:sprite130Pos];
                    id actionMove2 = [CCAnimate actionWithAnimation:spriteGWalkUp restoreOriginalFrame:NO];
                    
                    id actionMoveDone = [CCCallFuncN actionWithTarget:self selector:@selector(finishActionSprite130)];
                    
                    [self.sprite130 runAction:[CCSpawn actionOne:[CCSequence actions:actionMove,actionMoveDone,nil] two:actionMove2]];
                    return;
                }
            }
        }
    }
    [self finishActionSprite130];
}
-(void) movedownSprite130
{
    CGPoint sprite130Pos = self.sprite130.position;
    self.sprite130.orientation = 1;
    sprite130Pos.y -= theHKMap.tileSize.width;
    
    CGPoint tileCoord = [self tileCoordForPosition:sprite130Pos];
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
                    CGPoint tileCoord1 = [self tileCoordForPosition:self.sprite130.position];
                    int tileGID1 = [self.bgLayer tileGIDAt:tileCoord1];
                    [self.bgLayer removeTileAt:tileCoord1];
                    [self.bgLayer setTileGID:(tileGID1 - 1) at:tileCoord1];
                    
                    id actionMove = [CCMoveTo actionWithDuration:0.3 position:sprite130Pos];
                    id actionMove2 = [CCAnimate actionWithAnimation:spriteGWalkDown restoreOriginalFrame:NO];
                    
                    id actionMoveDone = [CCCallFuncN actionWithTarget:self selector:@selector(finishActionSprite130)];
                    
                    [self.sprite130 runAction:[CCSpawn actionOne:[CCSequence actions:actionMove,actionMoveDone,nil] two:actionMove2]];
                    return;
                }
            }
        }
    }
    [self finishActionSprite130];
}
-(void) finishActionSprite130
{
    if (self.sprite130.orientation == 1)
    {
        [self.sprite130 setDisplayFrame:[[spriteGWalkDown frames] objectAtIndex:0]];
    }
    else if (self.sprite130.orientation == 2)
    {
        [self.sprite130 setDisplayFrame:[[spriteGWalkUp frames] objectAtIndex:0]];
    }
    else if (self.sprite130.orientation == 3)
    {
        [self.sprite130 setDisplayFrame:[[spriteGWalkRight frames] objectAtIndex:0]];
    }
    else
    {
        [self.sprite130 setDisplayFrame:[[spriteGWalkLeft frames] objectAtIndex:0]];
    }
    self.hero.sprite130position = self.sprite130.position;
}



-(void)pickedUpItem:(int)itemCode
{
    [MusicHandler playButtonClick];
    if (itemCode == 59)
    {
        CGPoint pos = self.item59.position;
        self.hero.gotItem59 = YES;
        [self.theHKMap removeChild:self.item59 cleanup:YES];
        self.item59 = [CCSprite spriteWithFile:@"treasurechestSprite02.png"];
        self.item59.position = pos;
        [self.theHKMap addChild:self.item59 z:self.bgLayer.zOrder];
        
        [self givenItem:125];
    }
    if (itemCode == 60)
    {
        CGPoint pos = self.item60.position;
        self.hero.gotItem60 = YES;
        [self.theHKMap removeChild:self.item60 cleanup:YES];
        self.item60 = [CCSprite spriteWithFile:@"treasurechestSprite02.png"];
        self.item60.position = pos;
        [self.theHKMap addChild:self.item60 z:self.bgLayer.zOrder];
        
        [self givenItem:30];
    }
    if (itemCode == 61)
    {
        CGPoint pos = self.item61.position;
        self.hero.gotItem61 = YES;
        [self.theHKMap removeChild:self.item61 cleanup:YES];
        self.item61 = [CCSprite spriteWithFile:@"treasurechestSprite02.png"];
        self.item61.position = pos;
        [self.theHKMap addChild:self.item61 z:self.bgLayer.zOrder];
        
        [self givenItem:137];
    }
    if (itemCode == 62)
    {
        CGPoint pos = self.item62.position;
        self.hero.gotItem62 = YES;
        [self.theHKMap removeChild:self.item62 cleanup:YES];
        self.item62 = [CCSprite spriteWithFile:@"treasurechestSprite02.png"];
        self.item62.position = pos;
        [self.theHKMap addChild:self.item62 z:self.bgLayer.zOrder];
        
        [self givenItem:29];
    }
    if (itemCode == 63)
    {
        CGPoint pos = self.item63.position;
        self.hero.gotItem63 = YES;
        [self.theHKMap removeChild:self.item63 cleanup:YES];
        self.item63 = [CCSprite spriteWithFile:@"treasurechestSprite02.png"];
        self.item63.position = pos;
        [self.theHKMap addChild:self.item63 z:self.bgLayer.zOrder];
        
        self.hero.gold += 20000;
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
    
    if (gate == 108)
    {
        [SceneManager goPlay:8];
    }
    else{
        NSLog(@"gate error"); //cave
    }
    return;
}


-(void)saveHero
{
    self.hero.heroOrientation = self.spriteOrientation;
    
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
            
            NSString *gate7 = [properties valueForKey:@"exitIsHere"];
            if (gate7 && [gate7 compare:@"true"] == NSOrderedSame)
            {
                [self goGate:108];
                return;
            }
            
            
            NSString *battleID = [properties valueForKey:@"battleID"];
            if (battleID)
            {
                if (self.hero.freeSteps <= 0)
                {
                    currentBID = [battleID intValue];
                    double rando = arc4random()%18;
                    if (rando == 0)
                    {
                        [self saveHero];
                        self.willBattle = YES;
                        
                    }
                }
            }
            
            NSString *boss_8 = [properties valueForKey:@"autoBattleID"];
            if (boss_8 && [boss_8 compare:@"8"] == NSOrderedSame)
            {
                
                {
                    if (!self.hero.beatSunDragon)
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
            
            NSString *boss_9 = [properties valueForKey:@"autoBattleID"];
            if (boss_9 && [boss_9 compare:@"9"] == NSOrderedSame)
            {
                
                {
                    if (!self.hero.beatTitan)
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
            NSString *boss = [properties valueForKey:@"autoBattleID"];
            if (boss && [boss compare:@"10"] == NSOrderedSame)
            {
                
                {
                    if (!self.hero.beatVodek)
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
            
            NSString *gate4 = [properties valueForKey:@"exitIsHere"];
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
                [self goGate:108];
                return;
            }
            NSString *battleID = [properties valueForKey:@"battleID"];
            if (battleID)
            {
                currentBID = [battleID intValue];
                double rando = arc4random()%18;
                if (rando == 0)
                {
                    [self saveHero];
                    self.willBattle = YES;
                    
                }
            }
            
            
            
            NSString *boss_8 = [properties valueForKey:@"autoBattleID"];
            if (boss_8 && [boss_8 compare:@"8"] == NSOrderedSame)
            {
                
                {
                    if (!self.hero.beatSunDragon)
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
            }
            
            NSString *boss_9 = [properties valueForKey:@"autoBattleID"];
            if (boss_9 && [boss_9 compare:@"9"] == NSOrderedSame)
            {
                
                {
                    if (!self.hero.beatTitan)
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
            }
            NSString *boss = [properties valueForKey:@"autoBattleID"];
            if (boss && [boss compare:@"10"] == NSOrderedSame)
            {
                
                {
                    if (!self.hero.beatVodek)
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
            
            
            NSString *mapItem59 = [properties valueForKey:@"item59"];
            if (mapItem59 && [mapItem59 compare:@"true"] == NSOrderedSame)
            {
                
                if (!self.hero.gotItem59)
                {
                    [self goText:11359];
                    return;
                }
                else
                {
                    [self goText:4399];
                    return;
                }
            }
            NSString *mapItem60 = [properties valueForKey:@"item60"];
            if (mapItem60 && [mapItem60 compare:@"true"] == NSOrderedSame)
            {
                
                if (!self.hero.gotItem60)
                {
                    [self goText:11360];
                    return;
                }
                else
                {
                    [self goText:4399];
                    return;
                }
            }
            NSString *mapItem61 = [properties valueForKey:@"item61"];
            if (mapItem61 && [mapItem61 compare:@"true"] == NSOrderedSame)
            {
                
                if (!self.hero.gotItem61)
                {
                    [self goText:11361];
                    return;
                }
                else
                {
                    [self goText:4399];
                    return;
                }
            }
            NSString *mapItem62 = [properties valueForKey:@"item62"];
            if (mapItem62 && [mapItem62 compare:@"true"] == NSOrderedSame)
            {
                
                if (!self.hero.gotItem62)
                {
                    [self goText:11362];
                    return;
                }
                else
                {
                    [self goText:4399];
                    return;
                }
            }
            NSString *mapItem63 = [properties valueForKey:@"item63"];
            if (mapItem63 && [mapItem63 compare:@"true"] == NSOrderedSame)
            {
                
                if (!self.hero.gotItem63)
                {
                    [self goText:11363];
                    return;
                }
                else
                {
                    [self goText:4399];
                    return;
                }
            }
            
            
            NSString *boss8Interact = [properties valueForKey:@"autoBattleID"];
            if (boss8Interact && [boss8Interact compare:@"8"] == NSOrderedSame)
            {
                if (!self.hero.beatSunDragon)
                {
                    currentBID = 108;
                    [self goText:11408];
                    return;
                }
            }
            NSString *boss9Interact = [properties valueForKey:@"autoBattleID"];
            if (boss9Interact && [boss9Interact compare:@"9"] == NSOrderedSame)
            {
                if (!self.hero.beatTitan)
                {
                    currentBID = 109;
                    [self goText:11409];
                    return;
                }
            }
            NSString *boss10Interact = [properties valueForKey:@"autoBattleID"];
            if (boss10Interact && [boss10Interact compare:@"10"] == NSOrderedSame)
            {
                if (!self.hero.beatVodek)
                {
                    currentBID = 110;
                    [self goText:11410];
                    return;
                }
            }
            
            
            NSString *sprite130Interact = [properties valueForKey:@"sprite130IsHere"];
            if (sprite130Interact && [sprite130Interact compare:@"true"] == NSOrderedSame)
            {
                self.sprite130.orientation = oppOrientation;
                
                if (self.sprite130.orientation == 1)
                {
                    [self.sprite130 setDisplayFrame:[[spriteGWalkDown frames] objectAtIndex:0]];
                }
                else if (self.sprite130.orientation == 2)
                {
                    [self.sprite130 setDisplayFrame:[[spriteGWalkUp frames] objectAtIndex:0]];
                }
                else if (self.sprite130.orientation == 3)
                {
                    [self.sprite130 setDisplayFrame:[[spriteGWalkRight frames] objectAtIndex:0]];
                }
                else
                {
                    [self.sprite130 setDisplayFrame:[[spriteGWalkLeft frames] objectAtIndex:0]];
                }
                
                if (!self.hero.beatVodek)
                {
                    [self goText:11000];
                }
                else
                {
                    [self goText:11001];
                }
                
                return;
            }
            
        }
    }
}


@end

