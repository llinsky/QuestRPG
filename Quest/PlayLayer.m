//
//  PlayLayer.m
//  Quest
//
//  Created by Leo Linsky on 3/17/12.
//  Copyright 2012 __MyCompanyName__. All rights reserved.
//



#import "PlayLayer.h"
#import "SceneManager.h"
#import "HKTMXTiledMap.h"
#import "ItemShopMenu.h"
#import "CCSendMessages.h"




@implementation PlayLayer



@synthesize theHKMap=_theHKMap;


@synthesize isUsingDPad;

@synthesize willBattle;
@synthesize doneMove;


@synthesize sprite1LastRight;


@synthesize textPresent = _textPresent;


@synthesize tempLocation2;

@synthesize lastRight;
@synthesize spriteOrientation;

@synthesize isBeingTouched,canRespondToTouch;
@synthesize tempLocation;

@synthesize tempTouch;

@synthesize myHUD = _myHUD;
@synthesize currentBID;

@synthesize hero = _hero;
@synthesize spriteOddIsTalking;
@synthesize spriteEvenIsTalking;

@synthesize bgLayer, guy, clLayer;

+(CCScene *) scene
{
	// 'scene' is an autorelease object.
	CCScene *scene = [CCScene node];
	
    
	PlayLayer *layer = [PlayLayer node];
   
	[scene addChild: layer z:-1 tag:9];
	
    [layer schedule:@selector(gameLoop:) interval:(1/60.0f)];
    
	return scene;
}


-(void) setCenterOfScreen: (CGPoint) position
{
    
    CGSize screenSize = [[CCDirector sharedDirector] winSize];
    
    int x = MAX(position.x, screenSize.width/2);
    int y = MAX(position.y, screenSize.height/2);
    
    
    x = MIN(x, _theHKMap.mapSize.width * _theHKMap.tileSize.width - screenSize.width/2);
    y = MIN(y, _theHKMap.mapSize.height * _theHKMap.tileSize.height - screenSize.height/2);
    
    CGPoint goodPoint = ccp(x,y);
    CGPoint centerOfScreen = ccp(screenSize.width/2, screenSize.height/2);
    CGPoint difference = ccpSub(centerOfScreen, goodPoint);
    
    //if (!centeredScreen)
    //{
        id actionMove = [CCMoveTo actionWithDuration:0.3 position:difference];
        
        [self runAction:[CCSequence actions:actionMove, nil, nil]];
        centeredScreen = YES;
        self.guy.visible = NO;
    //}
    //else
    //{
    //    tempPos = difference;
    //    self.doneMove = NO;
    //    [self schedule:@selector(moveMap) interval:0.015];
    //}
    
    
}



-(id) init
{
	if( (self=[super init])) {
        self.isTouchEnabled = YES;
        self.canRespondToTouch = YES;
        self.lastRight = YES;
        self.sprite1LastRight = NO;
        self.spriteOddIsTalking = NO;
        self.doneMove = YES;
        
        self.isUsingDPad = [GameSceneManager sharedGameSceneManager].usingVirtualControlPad;
        self.textPresent = NO;
        self.willBattle = NO;
        self.currentBID = 0;
        
        
        [[CCSpriteFrameCache sharedSpriteFrameCache] addSpriteFramesWithFile:@"herospriteJsheet.plist"];
        spriteSheet = [CCSpriteBatchNode batchNodeWithFile:@"herospriteJsheet.png"];
        [spriteSheet retain];
        [self addChild:spriteSheet];
        
        NSMutableArray *walkAnimFramesLeft = [NSMutableArray array];
        NSMutableArray *walkAnimFramesRight = [NSMutableArray array];
        NSMutableArray *walkAnimFramesUp = [NSMutableArray array];
        NSMutableArray *walkAnimFramesDown = [NSMutableArray array];
        NSMutableArray *walkAnimFramesUp2 = [NSMutableArray array];
        NSMutableArray *walkAnimFramesDown2 = [NSMutableArray array];
        
        [walkAnimFramesLeft addObject:[[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:@"herospriteJ05.png"]];
        [walkAnimFramesLeft addObject:[[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:@"herospriteJ06.png"]];
        [walkAnimFramesLeft addObject:[[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:@"herospriteJ06.png"]];
        [walkAnimFramesLeft addObject:[[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:@"herospriteJ06.png"]];
        [walkAnimFramesLeft addObject:[[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:@"herospriteJ05.png"]];
        heroWalkLeft = [CCAnimation animationWithFrames:walkAnimFramesLeft delay:0.06f];
        [heroWalkLeft retain];
        
        [walkAnimFramesRight addObject:[[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:@"herospriteJ04.png"]];
        [walkAnimFramesRight addObject:[[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:@"herospriteJ07.png"]];
        [walkAnimFramesRight addObject:[[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:@"herospriteJ07.png"]];
        [walkAnimFramesRight addObject:[[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:@"herospriteJ07.png"]];
        [walkAnimFramesRight addObject:[[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:@"herospriteJ04.png"]];
        heroWalkRight = [CCAnimation animationWithFrames:walkAnimFramesRight delay:0.06f];
        [heroWalkRight retain];
        
        [walkAnimFramesUp addObject:[[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:@"herospriteJ08.png"]];
        [walkAnimFramesUp addObject:[[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:@"herospriteJ09.png"]];
        [walkAnimFramesUp addObject:[[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:@"herospriteJ09.png"]];
        [walkAnimFramesUp addObject:[[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:@"herospriteJ09.png"]];
        [walkAnimFramesUp addObject:[[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:@"herospriteJ08.png"]];
        heroWalkUp = [CCAnimation animationWithFrames:walkAnimFramesUp delay:0.06f];
        [heroWalkUp retain];
        
        [walkAnimFramesUp2 addObject:[[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:@"herospriteJ08.png"]];
        [walkAnimFramesUp2 addObject:[[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:@"herospriteJ10.png"]];
        [walkAnimFramesUp2 addObject:[[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:@"herospriteJ10.png"]];
        [walkAnimFramesUp2 addObject:[[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:@"herospriteJ10.png"]];
        [walkAnimFramesUp2 addObject:[[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:@"herospriteJ08.png"]];
        heroWalkUp2 = [CCAnimation animationWithFrames:walkAnimFramesUp2 delay:0.06f];
        [heroWalkUp2 retain];
        
        [walkAnimFramesDown addObject:[[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:@"herospriteJ01.png"]];
        [walkAnimFramesDown addObject:[[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:@"herospriteJ02.png"]];
        [walkAnimFramesDown addObject:[[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:@"herospriteJ02.png"]];
        [walkAnimFramesDown addObject:[[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:@"herospriteJ02.png"]];
        [walkAnimFramesDown addObject:[[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:@"herospriteJ01.png"]];
        heroWalkDown = [CCAnimation animationWithFrames:walkAnimFramesDown delay:0.06f];
        [heroWalkDown retain];
        
        [walkAnimFramesDown2 addObject:[[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:@"herospriteJ01.png"]];
        [walkAnimFramesDown2 addObject:[[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:@"herospriteJ03.png"]];
        [walkAnimFramesDown2 addObject:[[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:@"herospriteJ03.png"]];
        [walkAnimFramesDown2 addObject:[[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:@"herospriteJ03.png"]];
        [walkAnimFramesDown2 addObject:[[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:@"herospriteJ01.png"]];
        heroWalkDown2 = [CCAnimation animationWithFrames:walkAnimFramesDown2 delay:0.06f];
        [heroWalkDown2 retain];
        
        
                                     
        
        if (self.isUsingDPad)
        {
            self.isTouchEnabled = NO;
        }
        
        [bgLayer setBlendFunc:(ccBlendFunc){GL_ONE,GL_ZERO}];
        [clLayer setBlendFunc:(ccBlendFunc){GL_ONE,GL_ZERO}];
        
    }
	return self;
}

// on "dealloc" you need to release all your retained objects
- (void) dealloc
{
    [GameSceneManager sharedGameSceneManager].hero = self.hero;
    
    self.theHKMap = nil;
    self.bgLayer = nil;
    self.guy = nil;
    self.clLayer = nil;
	[super dealloc];
}

- (void) registerWithTouchDispatcher{
    [[CCTouchDispatcher sharedDispatcher] addTargetedDelegate:self priority:3 swallowsTouches:YES];
}


- (BOOL) ccTouchBegan:(UITouch *)touch withEvent:(UIEvent *)event
{
    if (!canRespondToTouch)
    {
        return YES;
    }
    isBeingTouched = YES;
    
    self.tempTouch = touch;
    
    CGPoint touchLocation = [touch locationInView:[touch view]];
    
    tempLocation = touchLocation;
    
    
    touchLocation = [[CCDirector sharedDirector] convertToGL:touchLocation];
    
    touchLocation = [self convertToNodeSpace:touchLocation];
    
    
    CGPoint playerPos = guy.position;
    CGPoint diff = ccpSub(touchLocation, playerPos);
    
    
    if (abs(diff.x) > abs(diff.y))
    {
        if (diff.x > 0)
        {
            //playerPos.x += theMap.tileSize.width;
            playerPos.x += _theHKMap.tileSize.width;
            
            self.spriteOrientation = 3;
        }
        else {
            //playerPos.x -= theMap.tileSize.width;
            playerPos.x -= _theHKMap.tileSize.width;
            
            self.spriteOrientation = 4;
        }
    }
    else {
        if (diff.y > 0)
        {
            //playerPos.y += theMap.tileSize.width;
            playerPos.y += _theHKMap.tileSize.width;
            
            self.spriteOrientation = 2;
        }
        else {
            self.spriteOrientation = 1;
            //playerPos.y -= theMap.tileSize.width;
            playerPos.y -= _theHKMap.tileSize.width;
        }
    }
    if ((playerPos.x <= (_theHKMap.mapSize.width * _theHKMap.tileSize.width)) && (playerPos.y <= (_theHKMap.mapSize.height * _theHKMap.tileSize.height)) && (playerPos.y >= 0) && (playerPos.x >= 0))
    {
        [self setPlayerPosition: playerPos];
    }
    return YES;
}



- (void) ccTouchEnded:(UITouch *)touch withEvent:(UIEvent *)event
{
    isBeingTouched = NO;
}


- (void) moveSprite:(CGPoint)position
{
    if (self.hero.freeSteps > 0)
    {
        self.hero.freeSteps--;
    }
    
    if (self.hero.attrib19)
    {
        int rand = arc4random()%4;
        if (rand == 2)
        {
            int a = self.hero.heroCurrentHP + 1;
            if (a <= self.hero.heroHP)
            {
                self.hero.heroCurrentHP = a;
                [self.myHUD updateHealth];
            }
        }
    }
    self.hero.position = guy.position;
    self.tempLocation2 = position;
    self.hero.heroOrientation = self.spriteOrientation;
    [self.myHUD animateHero];
    
    if (self.spriteOrientation == 1)
    {
        id actionMove = [CCMoveTo actionWithDuration:0.3 position:position];
        
        id actionMoveDone = [CCCallFuncN actionWithTarget:self selector:@selector(toggleTouchEnabled)];
        
        [guy runAction:[CCSequence actions:actionMove,actionMoveDone,nil]];
        [self setCenterOfScreen:position];
        return;
    }
    
    if (self.spriteOrientation == 2)
    {
        id actionMove = [CCMoveTo actionWithDuration:0.3 position:position];
        
        id actionMoveDone = [CCCallFuncN actionWithTarget:self selector:@selector(toggleTouchEnabled)];
        
        [guy runAction:[CCSequence actions:actionMove,actionMoveDone,nil]];
        [self setCenterOfScreen:position];
        return;
    }
    
    if (self.spriteOrientation == 3)
    {
        id actionMove = [CCMoveTo actionWithDuration:0.3 position:position];
        
        id actionMoveDone = [CCCallFuncN actionWithTarget:self selector:@selector(toggleTouchEnabled)];
        
        [guy runAction:[CCSequence actions:actionMove,actionMoveDone,nil]];
        [self setCenterOfScreen:position];
        return;
    }
    
    if (self.spriteOrientation == 4)
    {
        id actionMove = [CCMoveTo actionWithDuration:0.3 position:position];
        
        id actionMoveDone = [CCCallFuncN actionWithTarget:self selector:@selector(toggleTouchEnabled)];
        
        [guy runAction:[CCSequence actions:actionMove,actionMoveDone,nil]];
        [self setCenterOfScreen:position];
        return;
    }
    NSLog(@"Shouldn't reach here");
    return;
}


- (void) setPlayerPosition: (CGPoint) position
{
    //overridden
}


- (CGPoint) tileCoordForPosition: (CGPoint) point
{
    
    int x = point.x/_theHKMap.tileSize.width;
    int y = ((_theHKMap.mapSize.height* _theHKMap.tileSize.height) - point.y)/_theHKMap.tileSize.height;
    
    return ccp(x,y);
}


- (void) toggleTouchEnabled
{
    if (self.canRespondToTouch)
        self.canRespondToTouch = NO;
    else
        self.canRespondToTouch = YES;
    
    
    
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
    self.hero.position = guy.position;
    self.hero.heroOrientation = self.spriteOrientation;
    [self saveHero];
    
    if (self.willBattle)
    {
        //self.willBattle = NO;
        [MusicHandler playButtonClick];
        [self performSelector:@selector(goBattle) withObject:nil afterDelay:0.4];
         return;
    }
    

    
    
    if (isBeingTouched)
    {
        tempLocation = [tempTouch locationInView:[tempTouch view]];
        tempLocation = [[CCDirector sharedDirector] convertToGL:tempLocation];
        tempLocation = [self convertToNodeSpace:tempLocation];
        CGPoint playerPos = guy.position;
        CGPoint diff = ccpSub(tempLocation, playerPos);
        
        
        if (abs(diff.x) > abs(diff.y))
        {
            if (diff.x > 0)
            {
                playerPos.x += _theHKMap.tileSize.width;
                
                self.spriteOrientation = 3;
            }
            else {
                playerPos.x -= _theHKMap.tileSize.width;
                
                self.spriteOrientation = 4;
            }
        }
        else {
            if (diff.y > 0)
            {
                playerPos.y += _theHKMap.tileSize.width;
                
                self.spriteOrientation = 2;
            }
            else {
                playerPos.y -= _theHKMap.tileSize.width;
                
                self.spriteOrientation = 1;
            }
        }
        
        if ((playerPos.x <= (_theHKMap.mapSize.width * _theHKMap.tileSize.width)) && (playerPos.y <= (_theHKMap.mapSize.height * _theHKMap.tileSize.height)) && (playerPos.y >= 0) && (playerPos.x >= 0))
        {
            [self setPlayerPosition: playerPos];
            
        }
    }
    return;
}




- (void) pressedA
{
    //overridden
}



-(void) goBattle
{
    int enemyCode = currentBID;
    
    //Sound effect is addressed in WILLBATTLE
    
    //[GameSceneManager sharedGameSceneManager].hero = self.hero;
    
    [self saveHero];
    [self.myHUD displayBattleScene:enemyCode];
    
    return;
}

-(void)goText:(int)textCode
{
    
    
    self.isTouchEnabled = NO;
    [self.myHUD showText:textCode];
    
    return;
}

-(void)goText:(int)textCode sprite:(int)spriteCode
{
    self.isTouchEnabled = NO;
    [self.myHUD showText:textCode spriteCode:spriteCode];
    
    return;
    
}

-(void) enableTouch
{
    if (self.isUsingDPad)
        return;
    self.isTouchEnabled = YES;
}
-(void) disableTouch
{
    self.isTouchEnabled = NO;
}




-(void)saveHero
{
    self.hero.heroOrientation = self.spriteOrientation;
    [GameSceneManager sharedGameSceneManager].hero = self.hero;
}






-(void)goShop:(int)shopCode
{
    currentShopCode = shopCode;
    [self saveHero];
    [SceneManager goShop:shopCode];
}


- (void) dsetPlayerPosition: (CGPoint) position
{
    //overridden
}

- (void) dmoveSprite:(CGPoint)position
{
    if (self.hero.freeSteps > 0)
    {
        self.hero.freeSteps--;
    }
    self.hero.position = guy.position;
    self.tempLocation2 = position;
    self.hero.heroOrientation = self.spriteOrientation;
    if (self.hero.attrib19)
    {
        int rand = arc4random()%4;
        if (rand == 2)
        {
            int a = self.hero.heroCurrentHP + 1;
            if (a <= self.hero.heroHP)
            {
                self.hero.heroCurrentHP = a;
                [self.myHUD updateHealth];
            }
        }
    }
    [self.myHUD animateHero];
    if (self.spriteOrientation == 1)
    {
        id actionMove = [CCMoveTo actionWithDuration:0.3 position:position];
        //id actionMove2;
        /*
        if (lastRight)
        {
            lastRight = NO;
            actionMove2 = [CCAnimate actionWithAnimation:heroWalkDown restoreOriginalFrame:NO];
        }
        else
        {
            lastRight = YES;
            actionMove2 = [CCAnimate actionWithAnimation:heroWalkDown2 restoreOriginalFrame:NO];
        }
        */
        id actionMoveDone = [CCCallFuncN actionWithTarget:self selector:@selector(dtoggleTouchEnabled)];
        
        [guy runAction:[CCSequence actions:actionMove,actionMoveDone,nil]];
        [self setCenterOfScreen:position];
        return;
    }
    
    if (self.spriteOrientation == 2)
    {
        id actionMove = [CCMoveTo actionWithDuration:0.3 position:position];
        //id actionMove2;
        /*
        if (lastRight)
        {
            lastRight = NO;
            actionMove2 = [CCAnimate actionWithAnimation:heroWalkUp restoreOriginalFrame:NO];
        }
        else
        {
            lastRight = YES;
            actionMove2 = [CCAnimate actionWithAnimation:heroWalkUp2 restoreOriginalFrame:NO];
        }
        */
        id actionMoveDone = [CCCallFuncN actionWithTarget:self selector:@selector(dtoggleTouchEnabled)];
        
        [guy runAction:[CCSequence actions:actionMove,actionMoveDone,nil]];
        [self setCenterOfScreen:position];
        return;
    }
    
    if (self.spriteOrientation == 3)
    {
        id actionMove = [CCMoveTo actionWithDuration:0.3 position:position];
        
        //id actionMove2 = [CCAnimate actionWithAnimation:heroWalkRight restoreOriginalFrame:NO];
        
        id actionMoveDone = [CCCallFuncN actionWithTarget:self selector:@selector(dtoggleTouchEnabled)];
        
        [guy runAction:[CCSequence actions:actionMove,actionMoveDone,nil]];
        [self setCenterOfScreen:position];
        return;
    }
    
    if (self.spriteOrientation == 4)
    {
        id actionMove = [CCMoveTo actionWithDuration:0.3 position:position];
        
        //id actionMove2 = [CCAnimate actionWithAnimation:heroWalkLeft restoreOriginalFrame:NO];
        
        id actionMoveDone = [CCCallFuncN actionWithTarget:self selector:@selector(dtoggleTouchEnabled)];
        
        [guy runAction:[CCSequence actions:actionMove,actionMoveDone,nil]];
        [self setCenterOfScreen:position];
        return;
    }
    NSLog(@"Shouldn't reach here");
    return;
}

- (void) dtoggleTouchEnabled
{
    if (self.canRespondToTouch)
        self.canRespondToTouch = NO;
    else
        self.canRespondToTouch = YES;
    
    [self saveHero];
    self.myHUD.isInMotion = NO;
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
    self.hero.position = guy.position;
    self.hero.heroOrientation = self.spriteOrientation;
    
    
    if (self.willBattle)
    {
        //self.willBattle = NO;
        [MusicHandler playButtonClick];
        [self performSelector:@selector(goBattle) withObject:nil afterDelay:0.4];
        return;
    }
    
    isBeingTouched = NO;
    
    //
    //[self.myHUD updateDPad]; //experimental; probably not worth it
    //
    
    return;
}


-(void) changeMusic:(int)newCode
{
    if (prev == newCode)
        return;
    if (currentlyPlayingMusic == newCode)
        return;
    if (newCode == self.hero.musicCode)
    {
        currentlyPlayingMusic = newCode;
        [MusicHandler fadeBackgroundMusic:1.5 music:newCode];
        /*if you don't want to fade for 1.5s, like coming out of battle, you forceReset and this is never called*/
    }
}

-(void)removeItem:(int)itemIndex
{
    NSMutableArray *array = [self.hero.heroInventory mutableCopy];
    int tempIndex;
    BOOL shouldDeleteItem = NO;
    
    for (int i = 0; i < array.count; i++)
    {
        if (((Item*)[array objectAtIndex:i]).itemCode == itemIndex)
        {
            ((Item*)[array objectAtIndex:i]).itemCount--;
            tempIndex = i;
            if (((Item*)[array objectAtIndex:i]).itemCount <= 0)
            {
                shouldDeleteItem = YES;
            }
            break;
        }
    }
    if (shouldDeleteItem)
    {
        [array removeObject:[array objectAtIndex:tempIndex]];
    }
    self.hero.heroInventory = array;
    [self saveHero];
}


@end










