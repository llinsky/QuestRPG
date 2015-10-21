//
//  PlayLayerFive.m
//  Quest
//
//  Created by Leo Linsky on 1/13/14.
//
//

#import "PlayLayerFive.h"
#import "SceneManager.h"
#import "HKTMXTiledMap.h"
#import "ItemShopMenu.h"
#import "CCSendMessages.h"

@implementation PlayLayerFive

@synthesize sprite89,item17,item18,item19,item20,item21,item22,item23,item24,boss3_1,boss3_2,boss3_3,boss4;

-(id)init
{
    if (self = [super init])
    {
        
        self.theHKMap = [HKTMXTiledMap tiledMapWithTMXFile:@"playlayer5_FINAL1.tmx"];
        [[CCDirector sharedDirector] setProjection:kCCDirectorProjection2D];
        
        
        self.bgLayer = [theHKMap layerNamed:@"bg1"];
        self.bgLayer.visible = NO;
        
        CCTMXObjectGroup *objects = [theHKMap objectGroupNamed:@"oj1"];
        
        
        [self addChild:theHKMap z:-1];
        
        self.hero = [GameSceneManager sharedGameSceneManager].hero;
        {
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
        }
        
        if (!self.hero.savedKing)
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
            
            
            if (self.hero.sprite89position.x != 0)
            {
                self.sprite89.position = self.hero.sprite89position;
                [self schedule:@selector(updateSprite89) interval:(1.5f)];
            }
            else
            {
                NSMutableDictionary *sprite89start = [objects objectNamed:@"spriteStart89"];
                double x1 = [[sprite89start valueForKey:@"x"]floatValue];
                double y1 = [[sprite89start valueForKey:@"y"]floatValue];
                self.sprite89.position = ccp(x1,y1);
                [self schedule:@selector(updateSprite89) interval:(1.5f)];
            }
            
            
            [self.theHKMap addChild:self.sprite89 z:self.bgLayer.zOrder];
            
            CGPoint tileCoord9 = [self tileCoordForPosition:self.sprite89.position];
            int tileGID9 = [self.bgLayer tileGIDAt:tileCoord9];
            [self.bgLayer removeTileAt:tileCoord9];
            [self.bgLayer setTileGID:(tileGID9 + 9) at:tileCoord9];
        }
        
        
        
        //bosses
        
        if (!self.hero.beatVank)
        {
            self.boss4 = [CCSprite spriteWithFile:@"boss4sprite01.png"];
            NSMutableDictionary *boss4pos = [objects objectNamed:@"boss4"];
            double x1 = [[boss4pos valueForKey:@"x"]floatValue];
            double y1 = [[boss4pos valueForKey:@"y"]floatValue];
            self.boss4.position = ccp(x1,y1);
            [self.theHKMap addChild:self.boss4 z:self.bgLayer.zOrder];
        }
        if (!self.hero.beatIceGolem3)
        {
            self.boss3_3 = [CCSprite spriteWithFile:@"boss3sprite01.png"];
            NSMutableDictionary *boss3pos = [objects objectNamed:@"boss3"];
            double x1 = [[boss3pos valueForKey:@"x"]floatValue];
            double y1 = [[boss3pos valueForKey:@"y"]floatValue];
            self.boss3_3.position = ccp(x1,y1);
            [self.theHKMap addChild:self.boss3_3 z:self.bgLayer.zOrder];
        }
        if (!self.hero.beatIceGolem2)
        {
            self.boss3_2 = [CCSprite spriteWithFile:@"boss3sprite01.png"];
            NSMutableDictionary *boss2pos = [objects objectNamed:@"boss2"];
            double x1 = [[boss2pos valueForKey:@"x"]floatValue];
            double y1 = [[boss2pos valueForKey:@"y"]floatValue];
            self.boss3_2.position = ccp(x1,y1);
            [self.theHKMap addChild:self.boss3_2 z:self.bgLayer.zOrder];
        }
        if (!self.hero.beatIceGolem1)
        {
            self.boss3_1 = [CCSprite spriteWithFile:@"boss3sprite01.png"];
            NSMutableDictionary *boss1pos = [objects objectNamed:@"boss1"];
            double x1 = [[boss1pos valueForKey:@"x"]floatValue];
            double y1 = [[boss1pos valueForKey:@"y"]floatValue];
            self.boss3_1.position = ccp(x1,y1);
            [self.theHKMap addChild:self.boss3_1 z:self.bgLayer.zOrder];
        }
        
        
        
        
        
        //
        //items
        //
        
        if (!self.hero.gotItem17)
        {
            self.item17 = [CCSprite spriteWithFile:@"treasurechestSprite01.png"];
            NSMutableDictionary *item = [objects objectNamed:@"item17"];
            double x1 = [[item valueForKey:@"x"]floatValue];
            double y1 = [[item valueForKey:@"y"]floatValue];
            self.item17.position = ccp(x1,y1);
            [self.theHKMap addChild:self.item17 z:self.bgLayer.zOrder];
        }
        else
        {
            self.item17 = [CCSprite spriteWithFile:@"treasurechestSprite02.png"];
            NSMutableDictionary *item = [objects objectNamed:@"item17"];
            double x1 = [[item valueForKey:@"x"]floatValue];
            double y1 = [[item valueForKey:@"y"]floatValue];
            self.item17.position = ccp(x1,y1);
            [self.theHKMap addChild:self.item17 z:self.bgLayer.zOrder];
        }
        if (!self.hero.gotItem18)
        {
            self.item18 = [CCSprite spriteWithFile:@"goldpilesprite01.png"];
            NSMutableDictionary *item = [objects objectNamed:@"item18"];
            double x1 = [[item valueForKey:@"x"]floatValue];
            double y1 = [[item valueForKey:@"y"]floatValue];
            self.item18.position = ccp(x1,y1);
            [self.theHKMap addChild:self.item18 z:self.bgLayer.zOrder];
        }
        
        if (!self.hero.gotItem19)
        {
            self.item19 = [CCSprite spriteWithFile:@"treasurechestSprite01.png"];
            NSMutableDictionary *item = [objects objectNamed:@"item19"];
            double x1 = [[item valueForKey:@"x"]floatValue];
            double y1 = [[item valueForKey:@"y"]floatValue];
            self.item19.position = ccp(x1,y1);
            [self.theHKMap addChild:self.item19 z:self.bgLayer.zOrder];
        }
        else
        {
            self.item19 = [CCSprite spriteWithFile:@"treasurechestSprite02.png"];
            NSMutableDictionary *item = [objects objectNamed:@"item19"];
            double x1 = [[item valueForKey:@"x"]floatValue];
            double y1 = [[item valueForKey:@"y"]floatValue];
            self.item19.position = ccp(x1,y1);
            [self.theHKMap addChild:self.item19 z:self.bgLayer.zOrder];
        }
        if (!self.hero.gotItem20)
        {
            self.item20 = [CCSprite spriteWithFile:@"treasurechestSprite01.png"];
            NSMutableDictionary *item = [objects objectNamed:@"item20"];
            double x1 = [[item valueForKey:@"x"]floatValue];
            double y1 = [[item valueForKey:@"y"]floatValue];
            self.item20.position = ccp(x1,y1);
            [self.theHKMap addChild:self.item20 z:self.bgLayer.zOrder];
        }
        else
        {
            self.item20 = [CCSprite spriteWithFile:@"treasurechestSprite02.png"];
            NSMutableDictionary *item = [objects objectNamed:@"item20"];
            double x1 = [[item valueForKey:@"x"]floatValue];
            double y1 = [[item valueForKey:@"y"]floatValue];
            self.item20.position = ccp(x1,y1);
            [self.theHKMap addChild:self.item20 z:self.bgLayer.zOrder];
        }
        if (!self.hero.gotItem21)
        {
            self.item21 = [CCSprite spriteWithFile:@"treasurechestSprite01.png"];
            NSMutableDictionary *item = [objects objectNamed:@"item21"];
            double x1 = [[item valueForKey:@"x"]floatValue];
            double y1 = [[item valueForKey:@"y"]floatValue];
            self.item21.position = ccp(x1,y1);
            [self.theHKMap addChild:self.item21 z:self.bgLayer.zOrder];
        }
        else
        {
            self.item21 = [CCSprite spriteWithFile:@"treasurechestSprite02.png"];
            NSMutableDictionary *item = [objects objectNamed:@"item21"];
            double x1 = [[item valueForKey:@"x"]floatValue];
            double y1 = [[item valueForKey:@"y"]floatValue];
            self.item21.position = ccp(x1,y1);
            [self.theHKMap addChild:self.item21 z:self.bgLayer.zOrder];
        }
        if (!self.hero.gotItem22)
        {
            self.item22 = [CCSprite spriteWithFile:@"treasurechestSprite01.png"];
            NSMutableDictionary *item = [objects objectNamed:@"item22"];
            double x1 = [[item valueForKey:@"x"]floatValue];
            double y1 = [[item valueForKey:@"y"]floatValue];
            self.item22.position = ccp(x1,y1);
            [self.theHKMap addChild:self.item22 z:self.bgLayer.zOrder];
        }
        else
        {
            self.item22 = [CCSprite spriteWithFile:@"treasurechestSprite02.png"];
            NSMutableDictionary *item = [objects objectNamed:@"item22"];
            double x1 = [[item valueForKey:@"x"]floatValue];
            double y1 = [[item valueForKey:@"y"]floatValue];
            self.item22.position = ccp(x1,y1);
            [self.theHKMap addChild:self.item22 z:self.bgLayer.zOrder];
        }
        if (!self.hero.gotItem23)
        {
            self.item23 = [CCSprite spriteWithFile:@"treasurechestSprite01.png"];
            NSMutableDictionary *item = [objects objectNamed:@"item23"];
            double x1 = [[item valueForKey:@"x"]floatValue];
            double y1 = [[item valueForKey:@"y"]floatValue];
            self.item23.position = ccp(x1,y1);
            [self.theHKMap addChild:self.item23 z:self.bgLayer.zOrder];
        }
        else
        {
            self.item23 = [CCSprite spriteWithFile:@"treasurechestSprite02.png"];
            NSMutableDictionary *item = [objects objectNamed:@"item23"];
            double x1 = [[item valueForKey:@"x"]floatValue];
            double y1 = [[item valueForKey:@"y"]floatValue];
            self.item23.position = ccp(x1,y1);
            [self.theHKMap addChild:self.item23 z:self.bgLayer.zOrder];
        }
        if (!self.hero.gotItem24)
        {
            self.item24 = [CCSprite spriteWithFile:@"treasurechestSprite01.png"];
            NSMutableDictionary *item = [objects objectNamed:@"item24"];
            double x1 = [[item valueForKey:@"x"]floatValue];
            double y1 = [[item valueForKey:@"y"]floatValue];
            self.item24.position = ccp(x1,y1);
            [self.theHKMap addChild:self.item24 z:self.bgLayer.zOrder];
        }
        else
        {
            self.item24 = [CCSprite spriteWithFile:@"treasurechestSprite02.png"];
            NSMutableDictionary *item = [objects objectNamed:@"item24"];
            double x1 = [[item valueForKey:@"x"]floatValue];
            double y1 = [[item valueForKey:@"y"]floatValue];
            self.item24.position = ccp(x1,y1);
            [self.theHKMap addChild:self.item24 z:self.bgLayer.zOrder];
        }
        
        
        
        double x;
        double y;
        
        prev = self.hero.musicCode;
        
        //1(coming from login),2(gate/cave/stairs/dungeon), 3(teleport), 4(herodied - pl1), 5(start new game), 6(beat ionak - go pl1),7(item shop/menu),8(battle win/flee),121-beatVankurian Orc
        if (self.hero.mapInitMode == 1)
        {
            if (self.hero.musicCode != 6)
            {
                NSLog(@"MusicError1");
                self.hero.musicCode = 6;
            }
            prev = 0;
            
            self.spriteOrientation = 1;
            
            x = self.hero.position.x;
            y = self.hero.position.y;
            
            
        }
        else if (self.hero.mapInitMode == 2)
        {
            prev = 0; //probably don't need this, but might as well
            
            if (self.hero.currentMap == 4)
            {
                NSMutableDictionary *startPoint = [objects objectNamed:@"startPoint1"];
                x = [[startPoint valueForKey:@"x"]floatValue];
                y = [[startPoint valueForKey:@"y"]floatValue];
                self.hero.musicCode = 6;
            }
            else if (self.hero.currentMap == 6)
            {
                NSMutableDictionary *startPoint = [objects objectNamed:@"startPoint2"];
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
                self.hero.musicCode = 6;
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
        else if (self.hero.mapInitMode == 121)
        {
            self.spriteOrientation = self.hero.heroOrientation;
            x = self.hero.position.x;
            y = self.hero.position.y;
            if (self.hero.musicCode != 6)
            {
                NSLog(@"MusicError121");
                self.hero.musicCode = 6;
            }
            prev = 0;
            
            
            [self goText:4405]; //boss says something, then disappears
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
        self.hero.currentMap = 5;
        
        [self performSelector:@selector(startSnow) withObject:nil afterDelay:0.125];
    }
    
    return self;
}

-(void) startSnow
{
    [self.myHUD startSnow];
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

-(void)pickedUpItem:(int)itemCode
{
    [MusicHandler playButtonClick];
    if (itemCode == 17)
    {
        CGPoint pos = self.item17.position;
        self.hero.gotItem17 = YES;
        [self.theHKMap removeChild:self.item17 cleanup:YES];
        self.item17 = [CCSprite spriteWithFile:@"treasurechestSprite02.png"];
        self.item17.position = pos;
        [self.theHKMap addChild:self.item17 z:self.bgLayer.zOrder];
        
        [self givenItem:58];
    }
    else if (itemCode == 18)
    {
        self.hero.gotItem18 = YES;
        [self.theHKMap removeChild:self.item18 cleanup:YES];
        self.hero.gold += 30;
        
    }
    else if (itemCode == 19)
    {
        CGPoint pos = self.item19.position;
        self.hero.gotItem19 = YES;
        [self.theHKMap removeChild:self.item19 cleanup:YES];
        self.item19 = [CCSprite spriteWithFile:@"treasurechestSprite02.png"];
        self.item19.position = pos;
        [self.theHKMap addChild:self.item19 z:self.bgLayer.zOrder];
        
        [self givenItem:135];
    }
    else if (itemCode == 20)
    {
        CGPoint pos = self.item20.position;
        self.hero.gotItem20 = YES;
        [self.theHKMap removeChild:self.item20 cleanup:YES];
        self.item20 = [CCSprite spriteWithFile:@"treasurechestSprite02.png"];
        self.item20.position = pos;
        [self.theHKMap addChild:self.item20 z:self.bgLayer.zOrder];
        
        [self givenItem:183];
    }
    else if (itemCode == 21)
    {
        CGPoint pos = self.item21.position;
        self.hero.gotItem21 = YES;
        [self.theHKMap removeChild:self.item21 cleanup:YES];
        self.item21 = [CCSprite spriteWithFile:@"treasurechestSprite02.png"];
        self.item21.position = pos;
        [self.theHKMap addChild:self.item21 z:self.bgLayer.zOrder];
        
        self.hero.gold += 18;
    }
    else if (itemCode == 22)
    {
        CGPoint pos = self.item22.position;
        self.hero.gotItem22 = YES;
        [self.theHKMap removeChild:self.item22 cleanup:YES];
        self.item22 = [CCSprite spriteWithFile:@"treasurechestSprite02.png"];
        self.item22.position = pos;
        [self.theHKMap addChild:self.item22 z:self.bgLayer.zOrder];
        
        [self givenItem:90];
    }
    else if (itemCode == 23)
    {
        CGPoint pos = self.item23.position;
        self.hero.gotItem23 = YES;
        [self.theHKMap removeChild:self.item23 cleanup:YES];
        self.item23 = [CCSprite spriteWithFile:@"treasurechestSprite02.png"];
        self.item23.position = pos;
        [self.theHKMap addChild:self.item23 z:self.bgLayer.zOrder];
        
        [self givenItem:127];
    }
    else if (itemCode == 24)
    {
        CGPoint pos = self.item24.position;
        self.hero.gotItem24 = YES;
        [self.theHKMap removeChild:self.item24 cleanup:YES];
        self.item24 = [CCSprite spriteWithFile:@"treasurechestSprite02.png"];
        self.item24.position = pos;
        [self.theHKMap addChild:self.item24 z:self.bgLayer.zOrder];
        
        [self givenItem:128];
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
    
    if (gate == 4)
    {
        [SceneManager goPlay:4];
    }
    else if (gate == 5)
    {
        [SceneManager goPlay:6];
    }
    else{
        NSLog(@"gate error");
    }
    return;
}

-(void)removeBoss4
{
    [self.theHKMap removeChild:self.boss4 cleanup:YES]; //add animation later?
    
}

-(void)saveHero
{
    self.hero.heroOrientation = self.spriteOrientation;
    if (!self.hero.savedKing)
    {
        self.hero.sprite89position = self.sprite89.position;
        self.hero.sprite89_Orientation = self.sprite89.orientation;
    }
    
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
            
            NSString *gate4 = [properties valueForKey:@"gate4"];
            if (gate4 && [gate4 compare:@"true"] == NSOrderedSame)
            {
                [self goGate:4];
                return;
            }
            NSString *gate7 = [properties valueForKey:@"gate5"];
            if (gate7 && [gate7 compare:@"true"] == NSOrderedSame)
            {
                [self goGate:5];
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
            
            
            NSString *mapitem18 = [properties valueForKey:@"item18"];
            if (mapitem18 && [mapitem18 compare:@"true"] == NSOrderedSame)
            {
                if (!self.hero.gotItem18)
                {
                    [self pickedUpItem:18];
                    [self saveHero];
                    [self goText:4318];
                }
            }
            
            NSString *boss1 = [properties valueForKey:@"autoBattleID"];
            if (boss1 && [boss1 compare:@"30"] == NSOrderedSame)
            {
                
                {
                    if (!self.hero.beatIceGolem1)
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
            NSString *boss2 = [properties valueForKey:@"autoBattleID"];
            if (boss2 && [boss2 compare:@"31"] == NSOrderedSame)
            {
                
                {
                    if (!self.hero.beatIceGolem2)
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
            NSString *boss3 = [properties valueForKey:@"autoBattleID"];
            if (boss3 && [boss3 compare:@"32"] == NSOrderedSame)
            {
                
                {
                    if (!self.hero.beatIceGolem3)
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
            NSString *bossv4 = [properties valueForKey:@"autoBattleID"];
            if (bossv4 && [bossv4 compare:@"4"] == NSOrderedSame)
            {
                
                {
                    if (!self.hero.beatVank)
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
            NSString *gate7 = [properties valueForKey:@"gate5"];
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
                [self goGate:5];
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
            
            NSString *mapitem18 = [properties valueForKey:@"item18"];
            if (mapitem18 && [mapitem18 compare:@"true"] == NSOrderedSame)
            {
                if (!self.hero.gotItem18)
                {
                    [self pickedUpItem:18];
                    [self saveHero];
                    [self goText:4318];
                }
            }
            
            NSString *boss1 = [properties valueForKey:@"autoBattleID"];
            if (boss1 && [boss1 compare:@"30"] == NSOrderedSame)
            {
                
                {
                    if (!self.hero.beatIceGolem1)
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
            NSString *boss2 = [properties valueForKey:@"autoBattleID"];
            if (boss2 && [boss2 compare:@"31"] == NSOrderedSame)
            {
                
                {
                    if (!self.hero.beatIceGolem2)
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
            NSString *boss3 = [properties valueForKey:@"autoBattleID"];
            if (boss3 && [boss3 compare:@"32"] == NSOrderedSame)
            {
                
                {
                    if (!self.hero.beatIceGolem3)
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
            NSString *bossv4 = [properties valueForKey:@"autoBattleID"];
            if (bossv4 && [bossv4 compare:@"4"] == NSOrderedSame)
            {
                
                {
                    if (!self.hero.beatVank)
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
            if (!self.hero.savedKing)
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
                    
                    [self goText:4000];
                    return;
                }
            }
            
            
            NSString *mapItem17 = [properties valueForKey:@"item17"];
            if (mapItem17 && [mapItem17 compare:@"true"] == NSOrderedSame)
            {
                
                if (!self.hero.gotItem17)
                {
                    [self goText:4317];
                    return;
                }
                else
                {
                    [self goText:4399];
                    return;
                }
            }
            NSString *mapItem18 = [properties valueForKey:@"item18"];
            if (mapItem18 && [mapItem18 compare:@"true"] == NSOrderedSame)
            {
                
                if (!self.hero.gotItem18)
                {
                    [self goText:4318];
                    return;
                }
                else
                {
                    return;
                }
            }
            NSString *mapItem19 = [properties valueForKey:@"item19"];
            if (mapItem19 && [mapItem19 compare:@"true"] == NSOrderedSame)
            {
                
                if (!self.hero.gotItem19)
                {
                    [self goText:4319];
                    return;
                }
                else
                {
                    [self goText:4399];
                    return;
                }
            }
            NSString *mapItem20 = [properties valueForKey:@"item20"];
            if (mapItem20 && [mapItem20 compare:@"true"] == NSOrderedSame)
            {
                
                if (!self.hero.gotItem20)
                {
                    [self goText:4320];
                    return;
                }
                else
                {
                    [self goText:4399];
                    return;
                }
            }
            NSString *mapItem21 = [properties valueForKey:@"item21"];
            if (mapItem21 && [mapItem21 compare:@"true"] == NSOrderedSame)
            {
                
                if (!self.hero.gotItem21)
                {
                    [self goText:4321];
                    return;
                }
                else
                {
                    [self goText:4399];
                    return;
                }
            }
            NSString *mapItem22 = [properties valueForKey:@"item22"];
            if (mapItem22 && [mapItem22 compare:@"true"] == NSOrderedSame)
            {
                
                if (!self.hero.gotItem22)
                {
                    [self goText:4322];
                    return;
                }
                else
                {
                    [self goText:4399];
                    return;
                }
            }
            NSString *mapItem23 = [properties valueForKey:@"item23"];
            if (mapItem23 && [mapItem23 compare:@"true"] == NSOrderedSame)
            {
                
                if (!self.hero.gotItem23)
                {
                    [self goText:4323];
                    return;
                }
                else
                {
                    [self goText:4399];
                    return;
                }
            }
            NSString *mapItem24 = [properties valueForKey:@"item24"];
            if (mapItem24 && [mapItem24 compare:@"true"] == NSOrderedSame)
            {
                
                if (!self.hero.gotItem24)
                {
                    [self goText:4324];
                    return;
                }
                else
                {
                    [self goText:4399];
                    return;
                }
            }

            
            
            NSString *sign62 = [properties valueForKey:@"sign31"];
            if (sign62 && [sign62 compare:@"true"] == NSOrderedSame)
            {
                [self goText:4200];
                return;
            }
            
            
            NSString *boss30Interact = [properties valueForKey:@"autoBattleID"];
            if (boss30Interact && [boss30Interact compare:@"30"] == NSOrderedSame)
            {
                if (!self.hero.beatIceGolem1)
                {
                    currentBID = 130;
                    [self goText:4430];
                    return;
                }
            }
            NSString *boss31Interact = [properties valueForKey:@"autoBattleID"];
            if (boss31Interact && [boss31Interact compare:@"31"] == NSOrderedSame)
            {
                if (!self.hero.beatIceGolem2)
                {
                    currentBID = 131;
                    [self goText:4431];
                    return;
                }
            }
            NSString *boss32Interact = [properties valueForKey:@"autoBattleID"];
            if (boss32Interact && [boss32Interact compare:@"32"] == NSOrderedSame)
            {
                if (!self.hero.beatIceGolem3)
                {
                    currentBID = 132;
                    [self goText:4432];
                    return;
                }
            }
            NSString *boss4Interact = [properties valueForKey:@"autoBattleID"];
            if (boss4Interact && [boss4Interact compare:@"4"] == NSOrderedSame)
            {
                if (!self.hero.beatVank)
                {
                    currentBID = 104;
                    [self goText:4404];
                    return;
                }
            }
            
            
            
            
        }
    }
}





@end











