//
//  PlayLayerTwentyTwo.m
//  Quest
//
//  Created by Leo Linsky on 2/17/14.
//
//

#import "PlayLayerTwentyTwo.h"

@implementation PlayLayerTwentyTwo

@synthesize item46,item47,item48,item49;



-(id)init
{
    if (self = [super init])
    {
        
        self.theHKMap = [HKTMXTiledMap tiledMapWithTMXFile:@"playlayer22_FINAL1.tmx"];
        [[CCDirector sharedDirector] setProjection:kCCDirectorProjection2D];
        
        
        self.bgLayer = [theHKMap layerNamed:@"bg1"];
        self.bgLayer.visible = NO;
        
        CCTMXObjectGroup *objects = [theHKMap objectGroupNamed:@"oj1"];
        
        
        [self addChild:theHKMap z:-1];
        
        self.hero = [GameSceneManager sharedGameSceneManager].hero;
        
        
        
        
        //
        //items
        //
        
        if (!self.hero.gotItem46)
        {
            self.item46 = [CCSprite spriteWithFile:@"treasurechestSprite01.png"];
            NSMutableDictionary *item = [objects objectNamed:@"item46"];
            double x1 = [[item valueForKey:@"x"]floatValue];
            double y1 = [[item valueForKey:@"y"]floatValue];
            self.item46.position = ccp(x1,y1);
            [self.theHKMap addChild:self.item46 z:self.bgLayer.zOrder];
        }
        else
        {
            self.item46 = [CCSprite spriteWithFile:@"treasurechestSprite02.png"];
            NSMutableDictionary *item = [objects objectNamed:@"item46"];
            double x1 = [[item valueForKey:@"x"]floatValue];
            double y1 = [[item valueForKey:@"y"]floatValue];
            self.item46.position = ccp(x1,y1);
            [self.theHKMap addChild:self.item46 z:self.bgLayer.zOrder];
        }
        if (!self.hero.gotItem47)
        {
            self.item47 = [CCSprite spriteWithFile:@"treasurechestSprite01.png"];
            NSMutableDictionary *item = [objects objectNamed:@"item47"];
            double x1 = [[item valueForKey:@"x"]floatValue];
            double y1 = [[item valueForKey:@"y"]floatValue];
            self.item47.position = ccp(x1,y1);
            [self.theHKMap addChild:self.item47 z:self.bgLayer.zOrder];
        }
        else
        {
            self.item47 = [CCSprite spriteWithFile:@"treasurechestSprite02.png"];
            NSMutableDictionary *item = [objects objectNamed:@"item47"];
            double x1 = [[item valueForKey:@"x"]floatValue];
            double y1 = [[item valueForKey:@"y"]floatValue];
            self.item47.position = ccp(x1,y1);
            [self.theHKMap addChild:self.item47 z:self.bgLayer.zOrder];
        }
        if (!self.hero.gotItem48)
        {
            self.item48 = [CCSprite spriteWithFile:@"treasurechestSprite01.png"];
            NSMutableDictionary *item = [objects objectNamed:@"item48"];
            double x1 = [[item valueForKey:@"x"]floatValue];
            double y1 = [[item valueForKey:@"y"]floatValue];
            self.item48.position = ccp(x1,y1);
            [self.theHKMap addChild:self.item48 z:self.bgLayer.zOrder];
        }
        else
        {
            self.item48 = [CCSprite spriteWithFile:@"treasurechestSprite02.png"];
            NSMutableDictionary *item = [objects objectNamed:@"item48"];
            double x1 = [[item valueForKey:@"x"]floatValue];
            double y1 = [[item valueForKey:@"y"]floatValue];
            self.item48.position = ccp(x1,y1);
            [self.theHKMap addChild:self.item48 z:self.bgLayer.zOrder];
        }
        if (!self.hero.gotItem49)
        {
            self.item49 = [CCSprite spriteWithFile:@"treasurechestSprite01.png"];
            NSMutableDictionary *item = [objects objectNamed:@"item49"];
            double x1 = [[item valueForKey:@"x"]floatValue];
            double y1 = [[item valueForKey:@"y"]floatValue];
            self.item49.position = ccp(x1,y1);
            [self.theHKMap addChild:self.item49 z:self.bgLayer.zOrder];
        }
        else
        {
            self.item49 = [CCSprite spriteWithFile:@"treasurechestSprite02.png"];
            NSMutableDictionary *item = [objects objectNamed:@"item49"];
            double x1 = [[item valueForKey:@"x"]floatValue];
            double y1 = [[item valueForKey:@"y"]floatValue];
            self.item49.position = ccp(x1,y1);
            [self.theHKMap addChild:self.item49 z:self.bgLayer.zOrder];
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
            
            if (self.hero.currentMap == 6)
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
        self.hero.currentMap = 22;
        
        
    }
    return self;
}





-(void)pickedUpItem:(int)itemCode
{
    [MusicHandler playButtonClick];
    if (itemCode == 46)
    {
        CGPoint pos = self.item46.position;
        self.hero.gotItem46 = YES;
        [self.theHKMap removeChild:self.item46 cleanup:YES];
        self.item46 = [CCSprite spriteWithFile:@"treasurechestSprite02.png"];
        self.item46.position = pos;
        [self.theHKMap addChild:self.item46 z:self.bgLayer.zOrder];
        
        self.hero.gold += 30;
    }
    else if (itemCode == 47)
    {
        CGPoint pos = self.item47.position;
        self.hero.gotItem47 = YES;
        [self.theHKMap removeChild:self.item47 cleanup:YES];
        self.item47 = [CCSprite spriteWithFile:@"treasurechestSprite02.png"];
        self.item47.position = pos;
        [self.theHKMap addChild:self.item47 z:self.bgLayer.zOrder];
        
        [self givenItem:35];
    }
    else if (itemCode == 48)
    {
        CGPoint pos = self.item48.position;
        self.hero.gotItem48 = YES;
        [self.theHKMap removeChild:self.item48 cleanup:YES];
        self.item48 = [CCSprite spriteWithFile:@"treasurechestSprite02.png"];
        self.item48.position = pos;
        [self.theHKMap addChild:self.item48 z:self.bgLayer.zOrder];
        
        [self givenItem:37];
    }
    else if (itemCode == 49)
    {
        CGPoint pos = self.item49.position;
        self.hero.gotItem49 = YES;
        [self.theHKMap removeChild:self.item49 cleanup:YES];
        self.item49 = [CCSprite spriteWithFile:@"treasurechestSprite02.png"];
        self.item49.position = pos;
        [self.theHKMap addChild:self.item49 z:self.bgLayer.zOrder];
        
        [self givenItem:35];
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
    
    if (gate == 106)
    {
        [SceneManager goPlay:6];
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
                [self goGate:106];
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
                [self goGate:106];
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
            
            
            NSString *mapItem46 = [properties valueForKey:@"item46"];
            if (mapItem46 && [mapItem46 compare:@"true"] == NSOrderedSame)
            {
                
                if (!self.hero.gotItem46)
                {
                    [self goText:22346];
                    return;
                }
                else
                {
                    [self goText:4399];
                    return;
                }
            }
            NSString *mapItem47 = [properties valueForKey:@"item47"];
            if (mapItem47 && [mapItem47 compare:@"true"] == NSOrderedSame)
            {
                
                if (!self.hero.gotItem47)
                {
                    [self goText:22347];
                    return;
                }
                else
                {
                    [self goText:4399];
                    return;
                }
            }
            NSString *mapItem48 = [properties valueForKey:@"item48"];
            if (mapItem48 && [mapItem48 compare:@"true"] == NSOrderedSame)
            {
                
                if (!self.hero.gotItem48)
                {
                    [self goText:22348];
                    return;
                }
                else
                {
                    [self goText:4399];
                    return;
                }
            }
            NSString *mapItem49 = [properties valueForKey:@"item49"];
            if (mapItem49 && [mapItem49 compare:@"true"] == NSOrderedSame)
            {
                
                if (!self.hero.gotItem49)
                {
                    [self goText:22349];
                    return;
                }
                else
                {
                    [self goText:4399];
                    return;
                }
            }
            
            
        }
    }
}






@end



