//
//  PlayLayerNine.m
//  Quest
//
//  Created by Leo Linsky on 2/17/14.
//
//

#import "PlayLayerNine.h"
#import "SceneManager.h"
#import "HKTMXTiledMap.h"

@implementation PlayLayerNine

@synthesize item32,item33,item34,item35,boss6;

-(id)init
{
    if (self = [super init])
    {
        
        self.theHKMap = [HKTMXTiledMap tiledMapWithTMXFile:@"playlayer9_FINAL1.tmx"];
        [[CCDirector sharedDirector] setProjection:kCCDirectorProjection2D];
        
        
        self.bgLayer = [_theHKMap layerNamed:@"bg1"];
        self.bgLayer.visible = NO;
        
        CCTMXObjectGroup *objects = [_theHKMap objectGroupNamed:@"oj1"];
        
        
        [self addChild:_theHKMap z:-1];
        
        self.hero = [GameSceneManager sharedGameSceneManager].hero;
        
        
        
        
        //bosses
        
        if (!self.hero.beatCaveBoss)
        {
            self.boss6 = [CCSprite spriteWithFile:@"boss6sprite01.png"];
            NSMutableDictionary *boss4pos = [objects objectNamed:@"boss6"];
            double x1 = [[boss4pos valueForKey:@"x"]floatValue];
            double y1 = [[boss4pos valueForKey:@"y"]floatValue];
            self.boss6.position = ccp(x1,y1);
            [self.theHKMap addChild:self.boss6 z:self.bgLayer.zOrder];
        }
        else{
            self.boss6 = [CCSprite spriteWithFile:@"boss6sprite01.png"];
            NSMutableDictionary *boss4pos = [objects objectNamed:@"boss6_2"];
            double x1 = [[boss4pos valueForKey:@"x"]floatValue];
            double y1 = [[boss4pos valueForKey:@"y"]floatValue];
            self.boss6.position = ccp(x1,y1);
            [self.theHKMap addChild:self.boss6 z:self.bgLayer.zOrder];
        }
        
        
        
        
        
        //
        //items
        //
        
        if (!self.hero.gotItem32)
        {
            self.item32 = [CCSprite spriteWithFile:@"treasurechestSprite01.png"];
            NSMutableDictionary *item = [objects objectNamed:@"item32"];
            double x1 = [[item valueForKey:@"x"]floatValue];
            double y1 = [[item valueForKey:@"y"]floatValue];
            self.item32.position = ccp(x1,y1);
            [self.theHKMap addChild:self.item32 z:self.bgLayer.zOrder];
        }
        else
        {
            self.item32 = [CCSprite spriteWithFile:@"treasurechestSprite02.png"];
            NSMutableDictionary *item = [objects objectNamed:@"item32"];
            double x1 = [[item valueForKey:@"x"]floatValue];
            double y1 = [[item valueForKey:@"y"]floatValue];
            self.item32.position = ccp(x1,y1);
            [self.theHKMap addChild:self.item32 z:self.bgLayer.zOrder];
        }
        if (!self.hero.gotItem33)
        {
            self.item33 = [CCSprite spriteWithFile:@"treasurechestSprite01.png"];
            NSMutableDictionary *item = [objects objectNamed:@"item33"];
            double x1 = [[item valueForKey:@"x"]floatValue];
            double y1 = [[item valueForKey:@"y"]floatValue];
            self.item33.position = ccp(x1,y1);
            [self.theHKMap addChild:self.item33 z:self.bgLayer.zOrder];
        }
        else
        {
            self.item33 = [CCSprite spriteWithFile:@"treasurechestSprite02.png"];
            NSMutableDictionary *item = [objects objectNamed:@"item33"];
            double x1 = [[item valueForKey:@"x"]floatValue];
            double y1 = [[item valueForKey:@"y"]floatValue];
            self.item33.position = ccp(x1,y1);
            [self.theHKMap addChild:self.item33 z:self.bgLayer.zOrder];
        }
        if (!self.hero.gotItem34)
        {
            self.item34 = [CCSprite spriteWithFile:@"treasurechestSprite01.png"];
            NSMutableDictionary *item = [objects objectNamed:@"item34"];
            double x1 = [[item valueForKey:@"x"]floatValue];
            double y1 = [[item valueForKey:@"y"]floatValue];
            self.item34.position = ccp(x1,y1);
            [self.theHKMap addChild:self.item34 z:self.bgLayer.zOrder];
        }
        else
        {
            self.item34 = [CCSprite spriteWithFile:@"treasurechestSprite02.png"];
            NSMutableDictionary *item = [objects objectNamed:@"item34"];
            double x1 = [[item valueForKey:@"x"]floatValue];
            double y1 = [[item valueForKey:@"y"]floatValue];
            self.item34.position = ccp(x1,y1);
            [self.theHKMap addChild:self.item34 z:self.bgLayer.zOrder];
        }
        if (!self.hero.gotItem35)
        {
            self.item35 = [CCSprite spriteWithFile:@"treasurechestSprite01.png"];
            NSMutableDictionary *item = [objects objectNamed:@"item35"];
            double x1 = [[item valueForKey:@"x"]floatValue];
            double y1 = [[item valueForKey:@"y"]floatValue];
            self.item35.position = ccp(x1,y1);
            [self.theHKMap addChild:self.item35 z:self.bgLayer.zOrder];
        }
        else
        {
            self.item35 = [CCSprite spriteWithFile:@"treasurechestSprite02.png"];
            NSMutableDictionary *item = [objects objectNamed:@"item35"];
            double x1 = [[item valueForKey:@"x"]floatValue];
            double y1 = [[item valueForKey:@"y"]floatValue];
            self.item35.position = ccp(x1,y1);
            [self.theHKMap addChild:self.item35 z:self.bgLayer.zOrder];
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
            
            if (self.hero.currentMap == 4)
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
        self.hero.currentMap = 9;
        
        
    }
    return self;
}





-(void)pickedUpItem:(int)itemCode
{
    [MusicHandler playButtonClick];
    if (itemCode == 32)
    {
        CGPoint pos = self.item32.position;
        self.hero.gotItem32 = YES;
        [self.theHKMap removeChild:self.item32 cleanup:YES];
        self.item32 = [CCSprite spriteWithFile:@"treasurechestSprite02.png"];
        self.item32.position = pos;
        [self.theHKMap addChild:self.item32 z:self.bgLayer.zOrder];
        
        self.hero.gold += 10;
    }
    else if (itemCode == 33)
    {
        CGPoint pos = self.item33.position;
        self.hero.gotItem33 = YES;
        [self.theHKMap removeChild:self.item33 cleanup:YES];
        self.item33 = [CCSprite spriteWithFile:@"treasurechestSprite02.png"];
        self.item33.position = pos;
        [self.theHKMap addChild:self.item33 z:self.bgLayer.zOrder];
        
        [self givenItem:62];
    }
    else if (itemCode == 34)
    {
        CGPoint pos = self.item34.position;
        self.hero.gotItem34 = YES;
        [self.theHKMap removeChild:self.item34 cleanup:YES];
        self.item34 = [CCSprite spriteWithFile:@"treasurechestSprite02.png"];
        self.item34.position = pos;
        [self.theHKMap addChild:self.item34 z:self.bgLayer.zOrder];
        
        self.hero.gold += 15;
    }
    else if (itemCode == 35)
    {
        CGPoint pos = self.item35.position;
        self.hero.gotItem35 = YES;
        [self.theHKMap removeChild:self.item35 cleanup:YES];
        self.item35 = [CCSprite spriteWithFile:@"treasurechestSprite02.png"];
        self.item35.position = pos;
        [self.theHKMap addChild:self.item35 z:self.bgLayer.zOrder];
        
        [self givenItem:119];
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
    
    if (gate == 104)
    {
        [SceneManager goPlay:4];
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
            
            NSString *gate7 = [properties valueForKey:@"exitIsHere"];
            if (gate7 && [gate7 compare:@"true"] == NSOrderedSame)
            {
                [self goGate:104];
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
            
            NSString *bosss = [properties valueForKey:@"boss6IsHere"];
            if (bosss && [bosss compare:@"true"] == NSOrderedSame)
            {
                
                {
                    if (self.hero.beatCaveBoss)
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
            if (boss && [boss compare:@"6"] == NSOrderedSame)
            {
                
                {
                    if (!self.hero.beatCaveBoss)
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
                [self goGate:104];
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
            
            NSString *boss = [properties valueForKey:@"boss6IsHere"];
            if (boss && [boss compare:@"true"] == NSOrderedSame)
            {
                
                {
                    if (self.hero.beatCaveBoss)
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
            
            NSString *boss1 = [properties valueForKey:@"autoBattleID"];
            if (boss1 && [boss1 compare:@"6"] == NSOrderedSame)
            {
                
                {
                    if (!self.hero.beatCaveBoss)
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
            
            
            NSString *mapItem32 = [properties valueForKey:@"item32"];
            if (mapItem32 && [mapItem32 compare:@"true"] == NSOrderedSame)
            {
                
                if (!self.hero.gotItem32)
                {
                    [self goText:8332];
                    return;
                }
                else
                {
                    [self goText:4399];
                    return;
                }
            }
            NSString *mapItem33 = [properties valueForKey:@"item33"];
            if (mapItem33 && [mapItem33 compare:@"true"] == NSOrderedSame)
            {
                
                if (!self.hero.gotItem33)
                {
                    [self goText:8333];
                    return;
                }
                else
                {
                    [self goText:4399];
                    return;
                }
            }
            NSString *mapItem34 = [properties valueForKey:@"item34"];
            if (mapItem34 && [mapItem34 compare:@"true"] == NSOrderedSame)
            {
                
                if (!self.hero.gotItem34)
                {
                    [self goText:8334];
                    return;
                }
                else
                {
                    [self goText:4399];
                    return;
                }
            }
            NSString *mapItem35 = [properties valueForKey:@"item35"];
            if (mapItem35 && [mapItem35 compare:@"true"] == NSOrderedSame)
            {
                
                if (!self.hero.gotItem35)
                {
                    [self goText:8335];
                    return;
                }
                else
                {
                    [self goText:4399];
                    return;
                }
            }
            
            
            
            NSString *boss6Interact = [properties valueForKey:@"autoBattleID"];
            if (boss6Interact && [boss6Interact compare:@"6"] == NSOrderedSame)
            {
                if (!self.hero.beatCaveBoss)
                {
                    currentBID = 106;
                    [self goText:8406];
                    return;
                }
            }
            
            NSString *boss = [properties valueForKey:@"boss6IsHere"];
            if (boss && [boss compare:@"true"] == NSOrderedSame)
            {
                if (self.hero.beatCaveBoss)
                {
                    [self goText:8410];
                    return;
                }
            }
            
            
            
        }
    }
}












@end
















