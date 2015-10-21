//
//  InGameMenu.m
//  Quest
//
//  Created by Leo Linsky on 3/17/12.
//  Copyright 2012 __MyCompanyName__. All rights reserved.
//

#import "InGameMenu.h"
#import "BattleEngineLayer.h"
#import "TextSceneLayer.h"
#import "MyHero.h"
#import "CCSendMessages.h"


@implementation InGameMenu

@synthesize layer;
@synthesize textPresent;
@synthesize isInMotion;
@synthesize spriteHero;

@synthesize bear = _bear;
@synthesize moveAction = _moveAction;
@synthesize walkAction = _walkAction;

- (id)init {
    self = [super init];
    if (self) {
        _isBackground = false;
        
        CGSize winSize = [[CCDirector sharedDirector] winSize];
        
        //[CCTexture2D setDefaultAlphaPixelFormat:kCCTexture2DPixelFormat_RGBA4444];
        
        CCMenuItemImage *backToGame = [CCMenuItemImage itemFromNormalImage:@"gomenugame2.png" selectedImage:@"gomenugame2_pressed.png" target:self selector:@selector(onBackClick:)];
        
        CCMenu *menu2 = [CCMenu menuWithItems:backToGame, nil];
		menu2.position = ccp(winSize.width - 46, winSize.height - 18);
		[menu2 alignItemsVerticallyWithPadding: 6.0f];
		[self addChild:menu2 z:10];
        
        
        //
        [[CCSpriteFrameCache sharedSpriteFrameCache] addSpriteFramesWithFile:@"herospriteJsheet.plist"];        
        spriteSheet1 = [CCSpriteBatchNode batchNodeWithFile:@"herospriteJsheet.png"];
        [spriteSheet1 retain];
        [self addChild:spriteSheet1];
        
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
        self.spriteHero = [CCSprite spriteWithSpriteFrame:[[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:
                                                    [NSString stringWithFormat:@"herospriteJ01.png"]]];
        if (self.layer.spriteOrientation == 1)
        {
            [self.spriteHero setDisplayFrame:[[heroWalkDown frames] objectAtIndex:0]];
        }
        
        if (self.layer.spriteOrientation == 2)
        {
            [self.spriteHero setDisplayFrame:[[heroWalkUp frames] objectAtIndex:0]];
        }
        
        if (self.layer.spriteOrientation == 3)
        {
            [self.spriteHero setDisplayFrame:[[heroWalkRight frames] objectAtIndex:0]];    
        }
        
        if (self.layer.spriteOrientation == 4)
        {
            [self.spriteHero setDisplayFrame:[[heroWalkLeft frames] objectAtIndex:0]];
        }
        self.spriteHero.position = ccp(winSize.width/2,winSize.height/2);
        [self addChild:self.spriteHero z:INT_MAX];
        //
        
        CCMenuItemImage *buttonA = [CCMenuItemImage itemFromNormalImage:@"buttona03.png" selectedImage:@"buttona03_pressed.png" target:self selector:@selector(clickButtonA:)];
		buttonA.position = ccp(winSize.width - 40, 50);
        buttonA.opacity = 210;
		
        CCMenu *Amenu = [CCMenu menuWithItems:buttonA, nil];
		Amenu.position = ccp(0,0);
        
        [self addChild:Amenu z:10];
        
        /*
        CCMenuItemImage *buttonB = [CCMenuItemImage itemFromNormalImage:@"whiteButton2.png" selectedImage:@"whiteButton3.png" target:self selector:@selector(clickButtonB:)];
        buttonB.position = ccp(winSize.width - 20, 25);
        
		CCMenu *Bmenu = [CCMenu menuWithItems:buttonB, nil];
		Bmenu.position = ccp(0,0);
        
        [self addChild:Bmenu z:10];
         */
        
        [self schedule:@selector(gameLoop:) interval:(1/60.0f)];
        
        MyHero *hero1 = [GameSceneManager sharedGameSceneManager].hero;
        
        
        CCLabelTTF *label3 = [CCLabelTTF labelWithString:[NSString stringWithFormat:@"%d/%d", hero1.heroCurrentHP, hero1.heroHP] dimensions: CGSizeMake(160, 32) alignment:UITextAlignmentLeft fontName:@"Optima-Bold" fontSize:22.0];
        label3.position = ccp(winSize.width/2 - 124, winSize.height - 22);
        label3.color = ccc3(255, 255, 255);
        [self addChild: label3 z:15 tag:24];
        
        
        
        
        
        
        
        
        
        
        [[CCSpriteFrameCache sharedSpriteFrameCache] addSpriteFramesWithFile:@"heartframes2.plist"];        
        
        // Create a sprite sheet with the Happy Bear images
        CCSpriteBatchNode *spriteSheet = [CCSpriteBatchNode batchNodeWithFile:@"heartframes2.png"];
        [self addChild:spriteSheet];
        
        // Load up the frames of our animation
        NSMutableArray *walkAnimFrames = [NSMutableArray array];
        
        [walkAnimFrames addObject:[[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:@"heartframe03.png"]];
        [walkAnimFrames addObject:[[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:@"heartframe03.png"]];
        [walkAnimFrames addObject:[[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:@"practiceheart05.png"]];
        [walkAnimFrames addObject:[[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:@"heartframe01.png"]];
        [walkAnimFrames addObject:[[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:@"practiceheart07.png"]];
        [walkAnimFrames addObject:[[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:@"heartframe02.png"]];
        [walkAnimFrames addObject:[[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:@"practiceheart07.png"]];
        [walkAnimFrames addObject:[[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:@"heartframe01.png"]];
        [walkAnimFrames addObject:[[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:@"practiceheart05.png"]];
        [walkAnimFrames addObject:[[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:@"heartframe03.png"]];
        
        CCAnimation *walkAnim = [CCAnimation animationWithFrames:walkAnimFrames delay:0.1f];
        
        self.bear = [CCSprite spriteWithSpriteFrameName:@"heartframe03.png"];
        _bear.position = ccp(winSize.width/2 - 220, winSize.height - 22);
        self.walkAction = [CCRepeatForever actionWithAction:[CCAnimate actionWithAnimation:walkAnim restoreOriginalFrame:NO]];
        [_bear runAction:_walkAction];
        [spriteSheet addChild:_bear];
        
        
        
        
        
        if ([GameSceneManager sharedGameSceneManager].usingVirtualControlPad)
        {
            dPad = [[DPad alloc]initWithBase:@"base04.png" buttonImage:@"button03.png" pressedButtonImage:@"button03_pressed.png" 
                                                 position:ccp(200,200)];
            [dPad setCorner:3];
            [self addChild:dPad z:20];
            [self schedule:@selector(updateDPad) interval:0.005];
        }
        
        
        
        bModalIsShowing = NO;
        self.textPresent = NO;
        self.isInMotion = NO;
        
        
        
    }
    return self;
}


-(id)initAsBackground {
    self = [super init];
    if (self) {
        
        _isBackground = true;
        
        
        CGSize winSize = [[CCDirector sharedDirector] winSize];
        
        //[CCTexture2D setDefaultAlphaPixelFormat:kCCTexture2DPixelFormat_RGBA4444];
        
        //
        [[CCSpriteFrameCache sharedSpriteFrameCache] addSpriteFramesWithFile:@"herospriteJsheet.plist"];
        spriteSheet1 = [CCSpriteBatchNode batchNodeWithFile:@"herospriteJsheet.png"];
        [spriteSheet1 retain];
        [self addChild:spriteSheet1];
        
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
        self.spriteHero = [CCSprite spriteWithSpriteFrame:[[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:
                                                           [NSString stringWithFormat:@"herospriteJ01.png"]]];
        if (self.layer.spriteOrientation == 1)
        {
            [self.spriteHero setDisplayFrame:[[heroWalkDown frames] objectAtIndex:0]];
        }
        
        if (self.layer.spriteOrientation == 2)
        {
            [self.spriteHero setDisplayFrame:[[heroWalkUp frames] objectAtIndex:0]];
        }
        
        if (self.layer.spriteOrientation == 3)
        {
            [self.spriteHero setDisplayFrame:[[heroWalkRight frames] objectAtIndex:0]];
        }
        
        if (self.layer.spriteOrientation == 4)
        {
            [self.spriteHero setDisplayFrame:[[heroWalkLeft frames] objectAtIndex:0]];
        }
        self.spriteHero.position = ccp(winSize.width/2,winSize.height/2);
        [self addChild:self.spriteHero z:INT_MAX];
        //
    
        [self performSelector:@selector(updateSprite) withObject:nil afterDelay:0.05];
        
        bModalIsShowing = NO;
        self.textPresent = NO;
        self.isInMotion = NO;
        
        
        
    }
    return self;
}
+(id) nodeAsBackground
{
    return [[[self alloc] initAsBackground] autorelease];
}




- (void) registerWithTouchDispatcher{
    [[CCTouchDispatcher sharedDispatcher] addTargetedDelegate:self priority:1 swallowsTouches:YES];
}

-(void) onBackClick: (id) sender
{
    if (_isBackground)
    {
        return;
    }
    
    if (layer.willBattle)
        return;
    
    [MusicHandler playButtonClick];
    [GameSceneManager sharedGameSceneManager].hero = self.layer.hero;

    [self.layer saveHero];
    [SceneManager goRealInGameMenu];
    
}

-(void)startRain
{
    CCParticleSystem *snowParticleSystem = [CCParticleRain node];
    if (self.layer.hero.currentMap == 3)
    {
        snowParticleSystem.emissionRate += 10;
    }
    [self addChild:snowParticleSystem z:INT_MAX];
}

-(void)startSnow
{
    CCParticleSystem *snowParticleSystem = [CCParticleSnow node];
    [self addChild:snowParticleSystem z:INT_MAX];
}


-(void) clickButtonA: (id) sender
{
    if (_isBackground)
    {
        return;
    }
    [self.layer pressedA];

    return;
}



-(void) displayModal:(int)modalID
{
    if (_isBackground)
    {
        return;
    }
    [TextSceneLayer Tell:@"This is what text would look like" onLayer:self okBlock:nil];
    return;
}


-(void) displayBattleScene:(int)battleSceneID
{
    if (_isBackground)
    {
        return;
    }
    [SceneManager goBattle:battleSceneID];
    return;
}


-(void)showText:(int)textCode
{
    if (_isBackground)
    {
        return;
    }
    [self showText:textCode spriteCode:0];
}

-(void)showText:(int)textCode spriteCode:(int)code
{
    if (_isBackground)
    {
        return;
    }
    
    if (self.textPresent == YES)
        return;
    [self.layer disableTouch];
    currentTextCode = textCode;
    int a = code%2;
    CGSize size = [[CCDirector sharedDirector] winSize];
    NSString *txt;
    if (textCode == 0) //sprites 1,2,3
    {
        if (a==0)
        {
            self.layer.spriteEvenIsTalking = TRUE;
        }
        else
        {
            self.layer.spriteOddIsTalking = TRUE;
        }
        txt = [NSString stringWithFormat:@"The King is expecting you, %@. He's in the palace. You'd better hurry up. ",layer.hero.heroName];
    }
    else if (textCode == 973) //sprites 1,2,3
    {
        if (a==0)
        {
            self.layer.spriteEvenIsTalking = TRUE;
        }
        else
        {
            self.layer.spriteOddIsTalking = TRUE;
        }
        txt = @"The watchtower is to the East of the town - be wary of danger.";
    }
    else if (textCode == 1)
    {
        if (a==0)
        {
            self.layer.spriteEvenIsTalking = TRUE;
        }
        else
        {
            self.layer.spriteOddIsTalking = TRUE;
        }
        txt = @"You saw what?... You should report this to the King right away.";
        
    }
    else if (textCode == 2)
    {
        if (a==0)
        {
            self.layer.spriteEvenIsTalking = TRUE;
        }
        else
        {
            self.layer.spriteOddIsTalking = TRUE;
        }
        txt = @"These are troubling times... Good luck to you, young hero.";
    }
    
    else if (textCode == 3)
    {
        if (a==0)
        {
            self.layer.spriteEvenIsTalking = TRUE;
        }
        else
        {
            self.layer.spriteOddIsTalking = TRUE;
        }
        txt = @"Pleasant day, isn't it? I suppose we have you to thank for that.";
    }
    
    
    
    else if (textCode == 4) //sprite 4
    {
        self.layer.spriteEvenIsTalking = TRUE;
        txt = @"Being one of the King's palace guards isn't as cool as it sounds. He never does anything exciting and this armor gets so hot...";
    }
    else if (textCode == 5)
    {
        self.layer.spriteEvenIsTalking = TRUE;
        txt = @"I'm glad I get to be one of the King's castle guards. It's too dangerous outside the palace walls nowadays.";
        
    }
    else if (textCode == 6)
    {
        self.layer.spriteEvenIsTalking = YES;
        txt = @"Isn't it funny how our last great hero, Ionak, turned out to be a villian?... I've got my eye on you.";
        
    }
    
    else if (textCode == 7) //sprite 5
    {
        self.layer.spriteOddIsTalking = TRUE;
        txt = @"The King never seems to leave the palace. He sends messenger boys when something needs to get done, instead.";
    }
    else if (textCode == 8)
    {
        self.layer.spriteOddIsTalking = TRUE;
        txt = @"I wonder why the King has been so worked up lately...";
    }
    else if (textCode == 9)
    {
        self.layer.spriteOddIsTalking = TRUE;
        txt = @"The King has been out and about lately. We've even got a diplomatic mission of sorts planned.";
    }
    
    else if (textCode == 10) //sprite 6
    {
        self.layer.spriteEvenIsTalking = TRUE;
        if (!self.layer.hero.introducedToKingV)
        {
            txt = [NSString stringWithFormat: @"Hello young %@, I am the King of Volland. I need your help with a small task. Will you do this for your King?",layer.hero.heroName];
        }
        else
        {
            txt = [NSString stringWithFormat: @"Hello young %@. I require your help with a small task. Will you do this service for your King?",layer.hero.heroName]; 
        }
        [self performSelector:@selector(showBModal) withObject:nil afterDelay:0.3];
        
        self.layer.hero.introducedToKingV = TRUE;
    }
    else if (textCode == 11)
    {
        self.layer.spriteEvenIsTalking = TRUE;
        txt = @"It is unwise to disobey your King...";
    }
    else if (textCode == 12)
    {
        self.layer.spriteEvenIsTalking = TRUE;
        txt = @"Excellent, the Kingdom appreciates your service.";
    }
    else if (textCode == 13)
    {
        self.layer.spriteEvenIsTalking = TRUE;
        txt = @"My finest warriors have been disappearing, and monsters have been spotted near the city walls. I need you to take this Signal Orb to the watchtower east of the city walls. You just have to place it on the pedestal to alert the other Provinces of these ill tidings. Good luck!";
        
    }
    else if (textCode == 14)
    {
        [MusicHandler playButtonClick];
        self.layer.spriteEvenIsTalking = TRUE;
        txt = @"You received the Light Beacon.";
    }
    else if (textCode == 15)
    {
        self.layer.spriteEvenIsTalking = TRUE;
        txt = @"Ah, so I take it you lit the beacon?... What? Attacked?!";
    }
    else if (textCode == 16)
    {
        self.layer.spriteEvenIsTalking = TRUE;
        txt = @".....";
    }
    else if (textCode == 17)
    {
        self.layer.spriteEvenIsTalking = TRUE;
        txt = @"This situation is far more dangerous than I originally thought. I need you to bring these dark tidings to our ally in the West, the King of Karamut. I know I have asked so much of you already, but please deliver this message to the Western Kingdom.";
    }
    else if (textCode == 18)
    {
        self.layer.spriteEvenIsTalking = TRUE;
        txt = @"The road is dangerous - use this gift to improve your weapons and armor. You received 10G.";
        [MusicHandler playButtonClick];
    }
    else if (textCode == 19)
    {
        self.layer.spriteEvenIsTalking = TRUE;
        txt = @"What news from Karamut? ";
    }
    else if (textCode == 20)
    {
        self.layer.spriteEvenIsTalking = TRUE;
        txt = @".....";
    }
    else if (textCode == 21)
    {
        self.layer.spriteEvenIsTalking = TRUE;
        txt = @"So we're on our own then. While you were gone, I sent for every warrior in Volland, and none were found. Even our celebrated hero Ionak, who was just an old man, has gone missing. These evil beasts could soon take over our lands and we will be helpless. What can be done? Hmm...";
    }
    else if (textCode == 22)
    {
        self.layer.spriteEvenIsTalking = TRUE;
        txt = @".....";
    }
    else if (textCode == 23)
    {
        self.layer.spriteEvenIsTalking = TRUE;
        txt = [NSString stringWithFormat:@"Perhaps Eilif, Ionak's brother, will know what to do. He lives in Ellemak, to the north of here. You are the only person I can call upon, %@. Please, go consult Eilif about what we can do in these dark times. Will you accept this task?", self.layer.hero.heroName];
    }
    else if (textCode == 24)
    {
        self.layer.spriteEvenIsTalking = TRUE;
        txt = @"Thank you brave warrior. The road is treacherous. Dangerous monsters live in the north. Take this gift as my thanks.";
    }
    else if (textCode == 25)
    {
        self.layer.spriteEvenIsTalking = TRUE;
        txt = @"You received 20G.";
        [MusicHandler playButtonClick];
    }
    else if (textCode == 26)
    {
        self.layer.spriteEvenIsTalking = TRUE;
        txt = @"Time is short. Good luck, brave hero.";
    }
    else if (textCode == 27)
    {
        self.layer.spriteEvenIsTalking = TRUE;
        txt = [NSString stringWithFormat:@"Brave %@, you are truly the Hero of Kolamar. Such an incredible series of events have transpired, and without you, we would have fallen into darkness from Ionak's treachery. We will forever mourn the heroes lost during these times, but we witnessed the rise of a new hero. As reward for your heroics, you now have access to the Hero's Country, to the east of Ellemak.",self.layer.hero.heroName];
    }
    else if (textCode == 28)
    {
        self.layer.spriteEvenIsTalking = TRUE;
        txt = @"I have an additional prize for you as well as a personal thank you.";
    }
    else if (textCode == 29)
    {
        self.layer.spriteEvenIsTalking = TRUE;
        txt = @"You received a Moonsword.";
        [MusicHandler playButtonClick];
    }
    else if (textCode == 30)
    {
        self.layer.spriteEvenIsTalking = TRUE;
        txt = @"Hello young Hero. Good luck in your adventures to the East. Powerful adversaries and glorious riches are said to be found there.";
    }
    else if (textCode == 31) //sprite 7
    {
        self.layer.spriteOddIsTalking = YES;
        int rand = arc4random()%6;
        
        switch (rand)
        {
            case 0:
                txt = @"How many Norsemen does it take to set fire to a lantern? Why bother with a lantern--there's a monastery just over the hill!";
            case 1:
                txt = @"Why did the king go to the dentist? ... To get his teeth crowned.";
            case 2:
                txt = @"When a knight in armour was killed in battle, what sign did they put on his grave? ... Rust in peace!";
            case 3:
                txt = @"What was Camelot famous for? ... Its knight life!";
            case 4:
                txt = @"What do you call it when all the knights trade places at the round table? ... The knight shift!";
            case 5:
                txt = @"How does the King power the castle? ... With his dungeon-erator!";
            default:
                txt = @"How does the King power the castle? ... With his dungeon-erator!";
        }
        
    }
    else if (textCode == 32) //sprite 8
    {
        self.layer.spriteEvenIsTalking = TRUE;
        txt = @"Sometimes the King forgets to put away his treasure.";
    }
    else if (textCode == 33) //sprite 8
    {
        self.layer.spriteEvenIsTalking = TRUE;
        txt = @"The King has been so flustered lately. I wonder if something's wrong.";
    }
    else if (textCode == 34) //sprite 8
    {
        self.layer.spriteEvenIsTalking = TRUE;
        txt = @"Is there any place that's safe anymore? I'm afraid to leave the castle. Sigh...";
    }
    else if (textCode == 35) //sprite 8
    {
        self.layer.spriteEvenIsTalking = TRUE;
        txt = @"The King hasn't grown up one bit throughout this whole ordeal. 50 years old, and he still can't make his bed.";
    }
    
    else if (textCode == 36) //sprite 9
    {
        self.layer.spriteOddIsTalking = TRUE;
        txt = @"Welcome to Volland. Did you know?";
        [self performSelector:@selector(showBModal) withObject:nil afterDelay:0.3];
    }
    else if (textCode == 37) //sprite 9
    {
        self.layer.spriteOddIsTalking = TRUE;
        txt = @"Volland was the first city of men founded in Kolamar. Our founder was Thyrus the Great, an explorer from across the Southern Sea -- he was the first King, ruling about 1000 years ago. Our current King is a direct descendant of Thyrus.";
    }
    else if (textCode == 38) //sprite 9
    {
        self.layer.spriteOddIsTalking = TRUE;
        txt = @"Oh, OK...";
    }
    else if (textCode == 39) //sprite 10
    {
        self.layer.spriteEvenIsTalking = TRUE;
        txt = @"This market always has the best deals. It's because most of the herbal products are homegrown.";
    }
    else if (textCode == 40) //sprite 10
    {
        self.layer.spriteEvenIsTalking = TRUE;
        txt = @"Some rare natural remedies can have permanent strengthening effects. They aren't sold at shops like these, though.";
    }
    else if (textCode == 41) //sprite 11
    {
        self.layer.spriteOddIsTalking = TRUE;
        txt = @"My mom doesn't let me leave the city gates alone. I'm tough enough to be a warrior!";
    }
    else if (textCode == 42) //sprite 12
    {
        self.layer.spriteEvenIsTalking = TRUE;
        txt = @"Ionak was the Hero who defeated the Monster King years ago. He's just an old man now like me, although nobody has seen him in years. Rumor is that he's been abducted by the same foul beasts who got rid of all our best heroes.";
    }
    else if (textCode == 43) //sprite 12
    {
        self.layer.spriteEvenIsTalking = TRUE;
        txt = @"I'm glad someone brought Ionak's treachery to light. I need to get me one of those anti-aging necklaces, though. ";
    }
    else if (textCode == 44) //sprite 13
    {
        self.layer.spriteOddIsTalking = TRUE;
        int rand = arc4random()%5;
        
        switch (rand)
        {
            case 0:
                txt = @"Sometimes you find great treasures in the wilderness. The risk is worth the reward to some travelers...";
            case 1:
                txt = @"There's a rare beast in the North-Eastern rock fields that carries valuable treasures.";
            case 2:
                txt = @"There's an abandoned lighthouse near Karamut, to the west. No one has dared ventured in for centuries... I've always wondered what treasures abound there.";
            case 3:
                txt = @"The Great Gates that separate all the Provinces of Kolamar were created hundreds of years ago to maintain order and balance between the five kingdoms.";
            case 4:
                txt = @"There's a cave in the mountain range up north. It is a foul cave -- the stench and bugs are enough to keep out the bravest explorers.";
            default:
                txt = @"There's an abandoned lighthouse near Karamut, to the west. No one has dared ventured in for centuries... I've always wondered what treasures abound there.";
        }
    }
    
    else if (textCode == 45) //sprite 14
    {
        self.layer.spriteEvenIsTalking = TRUE;
        txt = @"Er.. You can't help me, child...";
    }
    else if (textCode == 46) //sprite 14
    {
        self.layer.spriteEvenIsTalking = TRUE;
        txt = @"Hey, I know you! I heard tales about your battles with the monsters. Now, er, listen, I lost something very important to me, and I need a hero like yerself to get it back. Will you help me out?";
    }
    else if (textCode == 47) //sprite 14
    {
        self.layer.spriteEvenIsTalking = TRUE;
        txt = @"Well great! You'll get a hefty reward if you can do this for me. ";
    }
    else if (textCode == 48) //sprite 14
    {
        self.layer.spriteEvenIsTalking = TRUE;
        txt = @"I'm an explorer, and I have this, er, Compass. It's not just any Compass, though. Anywho, I was travelling just north of Agaro, and I was ambushed by monsters. They took me Compass, and I want it back. There was a watchman feller who saw everything -- he lives in Agaro, to the East of here. You should go talk to him for more information...";
    }
    else if (textCode == 49) //sprite 14
    {
        self.layer.spriteEvenIsTalking = TRUE;
        txt = @"Er, go to Agaro, to the East, and talk to the watchman. He might know where to find my Compass.";
    }
    else if (textCode == 50) //sprite 14
    {
        self.layer.spriteEvenIsTalking = TRUE;
        txt = @"How'd it go?";
    }
    else if (textCode == 51) //sprite 14
    {
        self.layer.spriteEvenIsTalking = TRUE;
        txt = @".....";
    }
    else if (textCode == 52) //sprite 14
    {
        self.layer.spriteEvenIsTalking = TRUE;
        txt = @"My Compass! Thanks a lot. Oh yeah, er... reward. Well, as promised, hero you go. You might have some use for this here book. I don't read too good, so it doesn't do me any good!";
        //Take back compass
    }
    else if (textCode == 53) //sprite 14
    {
        self.layer.spriteEvenIsTalking = TRUE;
        txt = @"You received The Art of War.";
    }
    else if (textCode == 54) //sprite 14
    {
        self.layer.spriteEvenIsTalking = TRUE;
        txt = @"Now that I've got my Compass, I can get on with my travels. Maybe I'll explore the forbidden lands in the Hero's Country, East of Ellemak.";
    }
    
    else if (textCode == 55) //sprite 19
    {
        self.layer.spriteOddIsTalking = TRUE;
        txt = @"This gate leads to the Kingdom of Karamut. The merchants there have the rarest items from all the lands because of their great Sea Port.";
    }
    else if (textCode == 56) //sprite 20
    {
        self.layer.spriteEvenIsTalking = TRUE;
        txt = @"The Kings of Volland and Karamut have been allies for centuries.";
    }
    else if (textCode == 57) //sprite 21
    {
        self.layer.spriteOddIsTalking = TRUE;
        txt = @"This gate leads to Ellemak, the most magnificent of all the Provinces.";
    }
    else if (textCode == 58) //sprite 22
    {
        self.layer.spriteEvenIsTalking = TRUE;
        txt = @"It is safer to stay on the roads than to venture out into the wilderness.";
    }
    else if (textCode == 59) //sprite 23
    {
        self.layer.spriteOddIsTalking = TRUE;
        txt = @"The King has closed off the Eastern roads until further notice.";
    }
    else if (textCode == 60) //sprite 23
    {
        self.layer.spriteOddIsTalking = TRUE;
        txt = @"This gate leads to Agaro. It is a small country bordering the mountains. It's known for its year-long rainy season.";
    }
    else if (textCode == 61) //sprite 24
    {
        self.layer.spriteEvenIsTalking = TRUE;
        txt = @"There is a cave to the north of Agaro. It is rumored to be home to the largest monster alive.";
    }
    else if (textCode == 62) //sprite 25
    {
        self.layer.spriteOddIsTalking = TRUE;
        txt = @"The King has closed off this Northern road. There is another way through, but no one has heard from the guard who is stationed there in a while...";
    }
    else if (textCode == 63) //sprite 25
    {
        self.layer.spriteOddIsTalking = TRUE;
        txt = @"When you are defeated in battle, you lose some of your money.";
    }
    
    else if (textCode == 64) //sprite 26
    {
        self.layer.spriteEvenIsTalking = TRUE;
        txt = @"I was friends with Ionak when we were young... Even after his heroic feats, he never seemed content. I don't know what happened, but on the one year anniversary of his defeat of Holgrath, he became a recluse. Decades passed without anyone talking to him face to face.";
    }
    else if (textCode == 65) //sprite 26
    {
        self.layer.spriteEvenIsTalking = TRUE;
        txt = @"I've pondered Ionak's treachery for a long time now. He never talked about the battle after he got back, and I found it strange because he was rarely humble about his accomplishments. Now I know he wanted to keep it secret that he stole Vodek's Crystal, so that he could learn to harness it and become as powerful as he did. I wonder if the Crystal has been destroyed for good, this time...";
    }
    
    else if (textCode == 66) //sprite 27
    {
        self.layer.spriteOddIsTalking = TRUE;
        txt = @"My grandparents came to Volland from across the Southern Ocean. Someday I want to make the voyage to the faraway lands on the other side of the sea...";
    }
    
    
    
    
    
    
    
    
    else if (textCode == 101) //sprite 16, shop0
    {
        self.layer.spriteEvenIsTalking = TRUE;
        txt = @"Welcome to the general store, do you want to view my wares?";
        [self performSelector:@selector(showBModal) withObject:nil afterDelay:0.4];
    }
    else if (textCode == 102) //sprite 15
    {
        self.layer.spriteOddIsTalking = TRUE;
        txt = @"Hello, would you like to stay at the Inn tonight?";
        [self performSelector:@selector(showBModal) withObject:nil afterDelay:0.4];
    }
    else if (textCode == 103) //sprite 15
    {
        self.layer.spriteOddIsTalking = TRUE;
        txt = @"That will be 1 gold coin. Please come again!";
    }
    else if (textCode == 104) //sprite 15
    {
        self.layer.spriteOddIsTalking = TRUE;
        txt = @"I'm afraid you don't have enough money. Sorry!";
    }
    else if (textCode == 105) //sprite 17, shop1
    {
        self.layer.spriteOddIsTalking = TRUE;
        txt = @"Welcome to my weapons shop. Would you like to see my inventory?";
        [self performSelector:@selector(showBModal) withObject:nil afterDelay:0.4];
    }
    else if (textCode == 106) //sprite 18, shop2
    {
        self.layer.spriteEvenIsTalking = TRUE;
        txt = @"Welcome to my armor shop. Would you care to see my inventory?";
        [self performSelector:@selector(showBModal) withObject:nil afterDelay:0.4];
    }
    
    
    
    
    
    
    
    else if (textCode == 200) //sign31
    {
        txt = @"West: Karamut\n South-East: Volland\n North-East: Ellemak";
    }
    else if (textCode == 201) //sign32
    {
        txt = @"West: Karamut\n South-East: Volland\n North-East: Ellemak";
    }
    else if (textCode == 202) //sign33
    {
        txt = @"North: Ellemak South: Volland South-East: Agaro South-West: Karamut";
    }
    else if (textCode == 203) //sign34
    {
        txt = @"Uncharted country to the North-West. Stay on the main roads.";
    }
    else if (textCode == 204) //sign35
    {
        txt = @"East: Agaro\n South-West: Volland\n North-West: Ellemak";
    }
    else if (textCode == 205) //sign36
    {
        txt = @"Walking on the roads is the safest way to travel - monsters generally avoid them.";
    }
    else if (textCode == 206) //sign37
    {
        txt = @"Stronger enemies tend to carry more treasures with them.";
    }
    else if (textCode == 207) //sign38
    {
        txt = @"The wilderness between Volland and Agaro is one of the largest and least explored in all of Kolamar.";
    }
    else if (textCode == 208) //sign39
    {
        txt = @"Welcome to Volland, the City of Heroes.";
    }
    
    
    
    
    
    
    
    else if (textCode == 301) //item1
    {
        [MusicHandler playButtonClick];
        [self.layer pickedUpItem:1];
        self.layer.hero.gotItem1 = YES;
        txt = @"You open the chest. You found 20G.";
    }
    else if (textCode == 302) //item22
    {
        [MusicHandler playButtonClick];
        [self.layer pickedUpItem:2];
        self.layer.hero.gotItem2 = YES;
        txt = @"You open the chest. You found an Iron Roundshield.";
    }
    else if (textCode == 303) //item3
    {
        [MusicHandler playButtonClick];
        [self.layer pickedUpItem:3];
        self.layer.hero.gotItem3 = YES;
        txt = @"You open the chest. You found 8G.";
    }
    else if (textCode == 304) //item4
    {
        [MusicHandler playButtonClick];
        [self.layer pickedUpItem:4];
        self.layer.hero.gotItem4 = YES;
        txt = @"You found 30G.";
    }
    
    
    else if (textCode == 399) //chest
    {
        txt = @"The treasure chest is empty.";
    }
    
    
    
    //quest/ special text/ bosses
    else if (textCode == 400) //boss1
    {
        txt = @"This world belongs to us now, puny child...";
    }
    else if (textCode == 401) //boss2 (cyclops)
    {
        txt = @"Grahhh... One-Eye hungry!";
    }
    
    
    else if (textCode == 451) //pedestal
    {
        txt = @"The beacon begins glowing and sending a signal for help.";
    }
    else if (textCode == 452) //pedestal
    {
        txt = @"The pedestal has an ancient feeling about it...";
    }
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    if (textCode == 1000) //playlayer 2 (+ 1000 on spriteCode per playlayer)
    {
        self.layer.spriteEvenIsTalking = YES;
        txt = @"Many of the city's trade caravans have gone missing lately - these are dark times indeed.";
    }
    else if (textCode == 1001)
    {
        self.layer.spriteEvenIsTalking = YES;
        txt = @"A lot of people have been talking... it looks like the Provinces may need to abandon Kolamar soon.";
    }
    else if (textCode == 1002)
    {
        self.layer.spriteEvenIsTalking = YES;
        txt = @"I'm a big fan of your work.. Will you sign my helmet?";
    }
    else if (textCode == 1004)
    {
        txt = @"The Kingdom of Karamut is the wealthiest in all the land. No visitors aloud in the royal chamber.";
    }
    else if (textCode == 1005)
    {
        txt = @"Our Kingdom's treasure reserves are back to normal levels, thanks to you.";
    }
    else if (textCode == 1006)
    {
        self.layer.spriteEvenIsTalking = YES;
        txt = @"Even before the recent attacks, the forest by the Northern Lake was notoriously mysterious and dangerous.";
    }
    else if (textCode == 1007)
    {
        self.layer.spriteEvenIsTalking = YES;
        txt = @"Rumor has it that the Far East Kingdom has even greater treasures than we do here.";
    }
    else if (textCode == 1008)
    {
        self.layer.spriteOddIsTalking = YES;
        txt = @"Move along child - it's dangerous out here.";
    }
    else if (textCode == 1009)
    {
        self.layer.spriteOddIsTalking = YES;
        txt = @"Alas, my job has been a lot less stressful lately.";
    }
    else if (textCode == 1948)
    {
        self.layer.spriteEvenIsTalking = YES;
        txt = @"I took this job because of my great action stunts and the nice room I get in the castle.";
    }
    else if (textCode == 1949)
    {
        self.layer.spriteEvenIsTalking = YES;
        txt = @"I'm privy to the King's top secret evacuation plan... I guess he can't live without his entertainment.";
    }
    else if (textCode == 1950)
    {
        self.layer.spriteEvenIsTalking = YES;
        txt = @"Ah, once again I am able to do my performances outside the city gates!";
    }
    else if (textCode == 1010)
    {
        self.layer.spriteOddIsTalking = YES;
        txt = @"Hello young traveler, what news from Volland?...";
    }
    else if (textCode == 1011)
    {
        self.layer.spriteOddIsTalking = YES;
        txt = @"... ...";
    }
    else if (textCode == 1012)
    {
        self.layer.spriteOddIsTalking = YES;
        txt = @"This is indeed horrible news. We have been attacked as well, and most of our bravest heroes have also gone... missing. Our economy is suffering as a result - Tell your King that I cannot spare any resources to aid Volland. We need to find a hero to resolve this soon, or we could all be in danger...";
    }
    else if (textCode == 1013)
    {
        self.layer.spriteOddIsTalking = YES;
        txt = @"Tell your King that I cannot spare any resources to aid Volland. We need to find a hero to resolve this soon, or we could all be in danger...";
    }
    else if (textCode == 1014)
    {
        self.layer.spriteOddIsTalking = YES;
        txt = @"It seems strange that the greatest heroes were targetted first, and so quickly. It would take a great amount of stealth and cleverness to pull that off, which you wouldn't expect of the monsters...";
    }
    else if (textCode == 1015)
    {
        self.layer.spriteOddIsTalking = YES;
        txt = @"Our economy is bustling, thanks to you. We have even opened up new trade caravans to the far north. ";
    }
    else if (textCode == 1016)
    {
        self.layer.spriteOddIsTalking = YES;
        txt = @"As a token of my appreciation for your service...";
    }
    else if (textCode == 1967)
    {
        self.layer.spriteOddIsTalking = YES;
        txt = @"You received an Earthen Sword";
    }
    
    else if (textCode == 1017)
    {
        self.layer.spriteEvenIsTalking = YES;
        txt = @"Every day, ships from all over the world stop in our sea port.";
    }
    else if (textCode == 1018)
    {
        self.layer.spriteOddIsTalking = YES;
        txt = @"There are said to be treasures along the lake. Few venture into that forest, though.";
    }
    else if (textCode == 1019)
    {
        self.layer.spriteOddIsTalking = YES;
        txt = @"I've heard of a cave, in the Far East. The beasts that reside there are of an unknown terror, and the treasures are equally wonderous...";
    }
    else if (textCode == 1020)
    {
        self.layer.spriteEvenIsTalking = YES;
        txt = @"I don't know why they don't let me outside. I could take on an Imp anyday!";
    }
    else if (textCode == 1021)
    {
        self.layer.spriteEvenIsTalking = YES;
        txt = @"I'm gonna be even stronger than you someday!";
    }
    else if (textCode == 1022)
    {
        self.layer.spriteEvenIsTalking = YES;
        txt = @"You received repellent.";
    }
    else if (textCode == 1023)
    {
        self.layer.spriteOddIsTalking = YES;
        txt = @"Repellent keeps most beasts away - temporarily, at least. You'll need it if you do a lot of traveling, especially nowadays.";
    }
    else if (textCode == 1025)
    {
        self.layer.spriteEvenIsTalking = YES;
        txt = @"It never rains in Karamut. There's always a bright side!";
    }
    else if (textCode == 1026)
    {
        self.layer.spriteEvenIsTalking = YES;
        txt = @"This bar used to be known for its great drinks. Now that our trade with Agaro has been disrupted, there's no quality rum...";
    }
    else if (textCode == 1027)
    {
        self.layer.spriteEvenIsTalking = YES;
        txt = @"Busy... d-drinking. Great rum...";
    }
    else if (textCode == 1028)
    {
        self.layer.spriteOddIsTalking = YES;
        txt = @"Do you want to hear a story, sonny?";
        [self performSelector:@selector(showBModal) withObject:nil afterDelay:0.4];
    }
    else if (textCode == 1029)
    {
        self.layer.spriteOddIsTalking = YES;
        txt = @"Ionak was a villain after all. I knew there was something off about him, even as a lad...";
    }
    else if (textCode == 1955)
    {
        self.layer.spriteOddIsTalking = YES;
        txt = @"Well then. When I was a lad, even younger than yerself, I always snooped around the weapons shops. The great Ionak used to come to Karamut every fortnight or so back then, and we would always see him buying some fancy equipment. One day, I noticed a faint purple glow coming out of a necklace around his neck. The shop owner asked what it was, and he simply said 'not for sale' and left. I always wondered about that necklace...";
    }
    else if (textCode == 1956)
    {
        self.layer.spriteOddIsTalking = YES;
        txt = @"Kids have no respect for their elders nowadays.";
    }
    
    else if (textCode == 1030)
    {
        self.layer.spriteEvenIsTalking = YES;
        txt = @"You can buy anyyything you need in these shops - I love it!";
    }
    else if (textCode == 1031)
    {
        self.layer.spriteOddIsTalking = YES;
        txt = @"Some items can make you stronger temporarily while in battle. Others can be used to make you stronger permanently.";
    }
    else if (textCode == 1032)
    {
        self.layer.spriteEvenIsTalking = YES;
        txt = @"The citizens of Karamut don't pay taxes - the Kingdom makes all its money from tariffs and docking fees.";
    }
    else if (textCode == 1033)
    {
        self.layer.spriteEvenIsTalking = YES;
        txt = @"Sailors speak of a powerful compass that can lead you to great treasures.. I would never give away something like that if I got my hands on it.";
    }
    else if (textCode == 1034)
    {
        self.layer.spriteOddIsTalking = YES;
        txt = @"Follow the Eastern road to Karamut. The southern road leads to the abandoned lighthouse, which isn't safe for inexperienced travelers like yourself.";
    }
    else if (textCode == 1035)
    {
        self.layer.spriteOddIsTalking = YES;
        txt = @"There are rumored to be giant beasts that live in the rocky far north of Volland. These beasts always hold large amounts of treasure.";
    }
    else if (textCode == 1036)
    {
        self.layer.spriteOddIsTalking = YES;
        txt = @"Eilif is Ionak's younger brother.. he was very young when Ionak defeated Holgrath, but he still said he noticed something different about Ionak after his return.";
    }
    else if (textCode == 1037)
    {
        self.layer.spriteOddIsTalking = YES;
        txt = @"Good day, hero. You are always welcome here.";
    }
    
    
    
    
    
    
    
    
    else if (textCode == 1101) //sprite 46, shop3
    {
        self.layer.spriteEvenIsTalking = TRUE;
        txt = @"Welcome to the general items store, would you like to view my wares?";
        [self performSelector:@selector(showBModal) withObject:nil afterDelay:0.4];
    }
    else if (textCode == 1102) //sprite 47, shop4
    {
        self.layer.spriteOddIsTalking = TRUE;
        txt = @"Welcome to my general market, would you like to view my wares?";
        [self performSelector:@selector(showBModal) withObject:nil afterDelay:0.4];
    }
    else if (textCode == 1103) //sprite 48
    {
        self.layer.spriteEvenIsTalking = TRUE;
        txt = @"Hello, would you like to stay at the Inn tonight?";
        [self performSelector:@selector(showBModal) withObject:nil afterDelay:0.5];
    }
    else if (textCode == 1104) //sprite 48
    {
        self.layer.spriteEvenIsTalking = TRUE;
        txt = @"That will be 1 gold coin. Please come again!";
    }
    else if (textCode == 1105) //sprite 48
    {
        self.layer.spriteEvenIsTalking = TRUE;
        txt = @"I'm afraid you don't have enough money. Sorry!";
    }
    else if (textCode == 1106) //sprite 49, shop5
    {
        self.layer.spriteOddIsTalking = TRUE;
        txt = @"Welcome to my weapons store, do you want to look around?";
        [self performSelector:@selector(showBModal) withObject:nil afterDelay:0.5];
    }
    else if (textCode == 1107) //sprite 50, shop6
    {
        self.layer.spriteEvenIsTalking = TRUE;
        txt = @"Welcome to my armor store, do you want to look around?";
        [self performSelector:@selector(showBModal) withObject:nil afterDelay:0.5];
    }
    else if (textCode == 1108) //sprite 51, shop7
    {
        self.layer.spriteOddIsTalking = TRUE;
        txt = @"Welcome to my advanced combat store, care to see my inventory?";
        [self performSelector:@selector(showBModal) withObject:nil afterDelay:0.5];
    }
    
    else if (textCode == 1200) //sign g1
    {
        txt = @"The Kingdom of Karamut lies to the East. Avoid the abandoned lighthouse to the South.";
    }
    else if (textCode == 1201) //sign
    {
        txt = @"Danger - the old lighthouse has been overrun.";
    }
    else if (textCode == 1202) //sign
    {
        txt = @"Welcome to the Great Trade Kingdom of Karamut.";
    }
    else if (textCode == 1203) //sign
    {
        txt = @"Welcome to Karamut, the City of Prosperity.";
    }
    
    else if (textCode == 1305) //item5
    {
        [MusicHandler playButtonClick];
        [self.layer pickedUpItem:5];
        self.layer.hero.gotItem5 = YES;
        txt = @"You open the chest. You found a Defense Amulet.";
    }
    else if (textCode == 1306) //item6
    {
        [MusicHandler playButtonClick];
        [self.layer pickedUpItem:6];
        self.layer.hero.gotItem6 = YES;
        txt = @"You found 10G.";
    }
    else if (textCode == 1307) //item7
    {
        [MusicHandler playButtonClick];
        [self.layer pickedUpItem:7];
        self.layer.hero.gotItem7 = YES;
        txt = @"You open the chest. You found 25G.";
    }
    else if (textCode == 1308) //item8
    {
        [MusicHandler playButtonClick];
        [self.layer pickedUpItem:8];
        self.layer.hero.gotItem8 = YES;
        txt = @"You found a Wolfhide Cap.";
    }
    
    
    else if (textCode == 1399) //chest
    {
        txt = @"The treasure chest is empty.";
    }
    
    
    else if (textCode == 1412) //boss12 (lighthouse)
    {
        txt = @"What is a human doing in my lair?";
    }
    
    
    
    else if (textCode == 2000)
    {
        self.layer.spriteOddIsTalking = YES;
        txt = @"Agaro is to the East of here. It is a small town, somewhat isolated from the rest of Kolamar.";
    }
    else if (textCode == 2001)
    {
        self.layer.spriteOddIsTalking = YES;
        txt = @"I heard a single warrior beat the largest cave troll ever seen in the cave north of Agaro...";
    }
    else if (textCode == 2002)
    {
        self.layer.spriteEvenIsTalking = YES;
        txt = @"There's a lot of uncharted territory around Agaro because of its isolation.";
    }
    else if (textCode == 2003)
    {
        self.layer.spriteOddIsTalking = YES;
        txt = @"You get used to the rain after a while...";
    }
    else if (textCode == 2004)
    {
        self.layer.spriteEvenIsTalking = YES;
        txt = @"I saw a giant, I tell you! Ah, nevermind...";
    }
    else if (textCode == 2005)
    {
        self.layer.spriteEvenIsTalking = YES;
        txt = @"The sailor fellow? Ah, yes, he was resting just north of here, when a giant menace like nothing I've ever seen came out of the mountains and attacked him! I was on watch duty, and I used my Fire Staff to scare off the beast. He headed into the mountain caves, North of here.";
    }
    else if (textCode == 2006)
    {
        self.layer.spriteEvenIsTalking = YES;
        txt = @"I think the giant lives in the caves to the North of here.";
    }
    else if (textCode == 2007)
    {
        self.layer.spriteEvenIsTalking = YES;
        txt = @"You beat the cave troll? Now that's a remarkable feat.";
    }
    else if (textCode == 2008)
    {
        self.layer.spriteOddIsTalking = YES;
        txt = @"You're an aspiring hero! This might come in handy..";
    }
    else if (textCode == 2009)
    {
        [MusicHandler playButtonClick];
        self.layer.spriteOddIsTalking = YES;
        txt = @"You received a FireFlower Root.";
    }
    else if (textCode == 2010)
    {
        self.layer.spriteOddIsTalking = YES;
        txt = @"There are certain rare items that you cannot buy in stores. Some have permanent stat bonuses.";
    }
    else if (textCode == 2011)
    {
        self.layer.spriteEvenIsTalking = YES;
        txt = @"I used to go exploring in the countryside when things were safer..";
    }
    else if (textCode == 2012)
    {
        self.layer.spriteOddIsTalking = YES;
        txt = @"It's very rare to see an outsider. We haven't had a visitor here in months.";
    }
    else if (textCode == 2013)
    {
        self.layer.spriteEvenIsTalking = YES;
        txt = @"No, I'm not the King. He travels a lot, so I'm the replacement.";
    }
    else if (textCode == 2014)
    {
        self.layer.spriteEvenIsTalking = YES;
        txt = @"The King is gone on official business.";
    }
    else if (textCode == 2015)
    {
        self.layer.spriteOddIsTalking = YES;
        txt = @"There was once a goblin city in the rocky territory North-West of the city. It's rumored that some of their treasure is still there.";
    }
    else if (textCode == 2017)
    {
        self.layer.spriteEvenIsTalking = YES;
        txt = @"You know what you're dealing with -- I'm sure you can handle yourself out there.";
    }
    else if (textCode == 2016)
    {
        self.layer.spriteEvenIsTalking = YES;
        txt = @"You don't know the dangers that lie beyond. I'm not letting you pass for your own good.";
    }
    else if (textCode == 2018)
    {
        self.layer.spriteOddIsTalking = YES;
        txt = @"I found something hidden on the eastern edge of the city. It didn't look cool so I put it back.";
    }
    else if (textCode == 2019)
    {
        self.layer.spriteEvenIsTalking = YES;
        txt = @"I've heard there's treasures in these parts. No luck, so far, though...";
    }
    else if (textCode == 2020)
    {
        self.layer.spriteOddIsTalking = YES;
        txt = @"Agaro is the most peaceful province. We have only been in one war since colonizing - the war against Holgrath.";
    }
    
    
    
    
    else if (textCode == 2100) //sprite 72, shop8
    {
        self.layer.spriteEvenIsTalking = TRUE;
        txt = @"Welcome to my weapons shop, would you like to view my wares?";
        [self performSelector:@selector(showBModal) withObject:nil afterDelay:0.4];
    }
    else if (textCode == 2101) //sprite 73, shop9
    {
        self.layer.spriteOddIsTalking = TRUE;
        txt = @"Welcome to my general market, would you like to view my wares?";
        [self performSelector:@selector(showBModal) withObject:nil afterDelay:0.4];
    }
    else if (textCode == 2102) //sprite 76
    {
        self.layer.spriteEvenIsTalking = TRUE;
        txt = @"Hello, would you like to stay at the Inn tonight?";
        [self performSelector:@selector(showBModal) withObject:nil afterDelay:0.5];
    }
    else if (textCode == 2103) //sprite 76
    {
        self.layer.spriteEvenIsTalking = TRUE;
        txt = @"That will be 1 gold coin. Please come again!";
    }
    else if (textCode == 2104) //sprite 76
    {
        self.layer.spriteEvenIsTalking = TRUE;
        txt = @"I'm afraid you don't have enough money. Sorry!";
    }
     
     
    else if (textCode == 2200) //sign g1
    {
        txt = @"East: Agaro. West: Volland.";
    }
    else if (textCode == 2201) //sign
    {
        txt = @"Stay on road! Uncharted territory to the North.";
    }
    else if (textCode == 2202) //sign
    {
        txt = @"Wildlife unpredictable -- no hunting aloud.";
    }
    else if (textCode == 2203) //sign
    {
        txt = @"Welcome to Agaro, the City of Peace.";
    }
    
    else if (textCode == 2309) //item9
    {
        [MusicHandler playButtonClick];
        [self.layer pickedUpItem:9];
        self.layer.hero.gotItem9 = YES;
        txt = @"You open the chest. You found a Pearl Scimitar.";
    }
    else if (textCode == 2310) //item10
    {
        [MusicHandler playButtonClick];
        [self.layer pickedUpItem:10];
        self.layer.hero.gotItem10 = YES;
        txt = @"You found 30G.";
    }
    else if (textCode == 2311) //item11
    {
        [MusicHandler playButtonClick];
        [self.layer pickedUpItem:11];
        self.layer.hero.gotItem11 = YES;
        txt = @"You open the chest. You found a Mithril Roundshield.";
    }
    else if (textCode == 2312) //item12
    {
        [MusicHandler playButtonClick];
        [self.layer pickedUpItem:12];
        self.layer.hero.gotItem12 = YES;
        txt = @"You open the chest. You found Sisensis Roots.";
    }
    else if (textCode == 2399) //chest
    {
        txt = @"The treasure chest is empty.";
    }
    

    else if (textCode == 3000)
    {
        self.layer.spriteOddIsTalking = YES;
        txt = @"The Royal Conifers will lead your way to the great city of Ellemak.";
    }
    else if (textCode == 3001)
    {
        self.layer.spriteOddIsTalking = YES;
        txt = @"What brings a hero like yourself through these parts? Surely you can afford teleportation charms.";
    }
    else if (textCode == 3002)
    {
        self.layer.spriteEvenIsTalking = YES;
        txt = @"The Council of Ellemak has restricted usage of this pass until the King is found.";
    }
    else if (textCode == 3003)
    {
        self.layer.spriteEvenIsTalking = YES;
        txt = @"There was a host of beasts that took the King into the blizzard. All I could do was hide...";
    }
    else if (textCode == 3099)
    {
        self.layer.spriteEvenIsTalking = YES;
        txt = @"Beyond is the treacherous Fjordland Pass. Only take this route if you are truly desperate.";
    }
    else if (textCode == 3004)
    {
        self.layer.spriteOddIsTalking = YES;
        txt = @"Only proven heroes may pass into our land.";
    }
    else if (textCode == 3005)
    {
        self.layer.spriteOddIsTalking = YES;
        txt = [NSString stringWithFormat:@"Welcome, %@.",self.layer.hero.heroName];
    }
    else if (textCode == 3006)
    {
        self.layer.spriteEvenIsTalking = YES;
        txt = @"Ellemak is known for its great Kings. However, our King's whereabouts are currently unknown.";
    }
    else if (textCode == 3007)
    {
        self.layer.spriteEvenIsTalking = YES;
        txt = @"Our King has retaken his rightful place upon the throne.";
    }
    else if (textCode == 3008)
    {
        self.layer.spriteOddIsTalking = YES;
        txt = @"Dark times...";
    }
    else if (textCode == 3009)
    {
        self.layer.spriteOddIsTalking = YES;
        txt = @"Good times...";
    }
    else if (textCode == 3010)
    {
        self.layer.spriteEvenIsTalking = YES;
        txt = @"Our King went for an evening walk a couple days ago, and hasn't returned. It's very unlike him.";
    }
    else if (textCode == 3011)
    {
        self.layer.spriteEvenIsTalking = YES;
        txt = @"Thankfully, justice has been brought down upon the foul beasts responsible for our King's abduction.";
    }
    else if (textCode == 3012)
    {
        self.layer.spriteOddIsTalking = YES;
        txt = @"First our heroes disappear, and now our King has gone missing.";
    }
    else if (textCode == 3013)
    {
        self.layer.spriteOddIsTalking = YES;
        txt = @"Long will we mourn the loss of our city's heroes... Although, now I am one of the best fighters in town.";
    }
    else if (textCode == 3014)
    {
        self.layer.spriteEvenIsTalking = YES;
        txt = @"The King doesn't appreciate my jokes. I almost hope he doesn't come back...";
    }
    else if (textCode == 3015)
    {
        self.layer.spriteEvenIsTalking = YES;
        txt = @"The old court jester got fired. I'm still training for the job.";
    }
    else if (textCode == 3016)
    {
        self.layer.spriteOddIsTalking = YES;
        txt = @"You have done so much, young hero. However, your work is not yet finished... you must find a way. Go North to Halden.";
    }
    else if (textCode == 3017)
    {
        self.layer.spriteOddIsTalking = YES;
        txt = [NSString stringWithFormat:@"Alas, the Great %@! Take this gift as a token of my appreciation.",self.layer.hero.heroName];
    }
    else if (textCode == 3018)
    {
        [MusicHandler playButtonClick];
        self.layer.spriteOddIsTalking = YES;
        txt = @"You received an Elven Lorica.";
    }
    else if (textCode == 3019)
    {
        self.layer.spriteOddIsTalking = YES;
        txt = @"There are still adventures that await you in the East.";
    }
    else if (textCode == 3020)
    {
        self.layer.spriteEvenIsTalking = YES;
        txt = @"What are you doing in the Queen's quarters?";
    }
    
    else if (textCode == 3021)
    {
        self.layer.spriteOddIsTalking = YES;
        txt = @"Hello young traveler, I am Eilif... Sent by your King? I am Ionak's younger brother, but I never became a warrior. I do not know who is stirring up evil in the North, but whoever it is has control over all the monsters in the land, just like Holgrath once did.... All but one, that is. I know of a wise, but dangerous creature named Veran, who lives in the cave South of here. You probably passed it on your way to the city. Go to him, and ask what he knows of the evil stirring in Vankur. You'll need this.";
    }
    else if (textCode == 3022)
    {
        self.layer.spriteOddIsTalking = YES;
        txt = @"You received Bug Repellent.";
    }
    else if (textCode == 3023)
    {
        self.layer.spriteOddIsTalking = YES;
        txt = @"The bug repellent will clear the swarm blocking the foul caves. Go now, go to the Southern Cave in the mountains and find Veran. He may have the answers we need.";
    }
    else if (textCode == 3024)
    {
        self.layer.spriteOddIsTalking = YES;
        txt = @"Attacked you? Ah, yes, I figured he might do that. You brushed it off though. Anyway, what news?";
    }
    else if (textCode == 3025)
    {
        self.layer.spriteOddIsTalking = YES;
        txt = @"... .. ....";
    }
    else if (textCode == 3026)
    {
        self.layer.spriteOddIsTalking = YES;
        txt = @"A human is causing this war?? I don't know what this means, young adventurer, but our time is short. Monsters have attacked again, and they have left tracks identical to the ones seen when the King disappeared. They lead North, to Fjordland. You must go stop them, before it's too late!";
    }
    else if (textCode == 3027)
    {
        self.layer.spriteOddIsTalking = YES;
        txt = @"You have already done a great service to our Kingdom. But I have a bad feeling about the human responsible for all of this. You must confront him, before it's too late...";
    }
    else if (textCode == 3028)
    {
        self.layer.spriteOddIsTalking = YES;
        txt = @"I should have known my own brother was responsible for this... Go be free, hero. There is a cave full of my old treasures by the lake.";
    }
    else if (textCode == 3029)
    {
        self.layer.spriteEvenIsTalking = YES;
        txt = @"I inherited a great many items which I simply do not need...";
    }
    else if (textCode == 3030)
    {
        self.layer.spriteOddIsTalking = YES;
        txt = @"My Dad used to have a set of Ichorean armor. It was so light that even I could use it!";
    }
    else if (textCode == 3031)
    {
        self.layer.spriteEvenIsTalking = YES;
        txt = @"Cheap armor reduces your mobility and slows you down, but there are some high-end armors that make you feel stronger and more flexible, without reducing defense bonuses.";
    }
    else if (textCode == 3032)
    {
        self.layer.spriteOddIsTalking = YES;
        txt = @"My docking business specializes in fine sword imports from overseas. With all the threats to the city, business has been good!";
    }
    else if (textCode == 3033)
    {
        self.layer.spriteEvenIsTalking = YES;
        txt = @"The Red Royal Conifer is Ellemak's official tree. It's indigenous to our forests around the lake.";
    }
    else if (textCode == 3034)
    {
        self.layer.spriteOddIsTalking = YES;
        txt = @"When the volcano erupts in Vankur, you can feel the shaking from here.";
    }
    else if (textCode == 3035)
    {
        self.layer.spriteEvenIsTalking = YES;
        txt = @"I am the greatest warrior North of Volland. I challenge you to a battle, for stakes. Care to take your chances?";
        [self performSelector:@selector(showBModal) withObject:nil afterDelay:0.5];
    }
    else if (textCode == 3036)
    {
        self.layer.spriteEvenIsTalking = YES;
        txt = @"So the rumors are true...";
    }
    else if (textCode == 3040)
    {
        self.layer.spriteEvenIsTalking = YES;
        txt = @"There is a cave to the South of here, close to the Southern gate. It smells terrible, and is too infested with bugs to even get to the entrance...";
    }

    
    
    else if (textCode == 3100) //sprite 100, shop 10
    {
        self.layer.spriteEvenIsTalking = TRUE;
        txt = @"Welcome to the general items store, would you like to view my wares?";
        [self performSelector:@selector(showBModal) withObject:nil afterDelay:0.4];
    }
    else if (textCode == 3101) //sprite 101, shop 11
    {
        self.layer.spriteOddIsTalking = TRUE;
        txt = @"Welcome to my general market, would you like to view my wares?";
        [self performSelector:@selector(showBModal) withObject:nil afterDelay:0.4];
    }
    else if (textCode == 3102) //sprite 99
    {
        self.layer.spriteOddIsTalking = TRUE;
        txt = @"Hello, would you like to stay at the Inn tonight?";
        [self performSelector:@selector(showBModal) withObject:nil afterDelay:0.5];
    }
    else if (textCode == 3103) //sprite 99 
    {
        self.layer.spriteOddIsTalking = TRUE;
        txt = @"That will be 1 gold coin. Please come again!";
    }
    else if (textCode == 3104) //sprite 99
    {
        self.layer.spriteOddIsTalking = TRUE;
        txt = @"I'm afraid you don't have enough money. Sorry!";
    }
    else if (textCode == 3105) //sprite 102 shop 12
    {
        self.layer.spriteEvenIsTalking = TRUE;
        txt = @"Welcome to my armor shop, would you like to view my wares?";
        [self performSelector:@selector(showBModal) withObject:nil afterDelay:0.4];
    }
    else if (textCode == 3106) //sprite 103 shop 13
    {
        self.layer.spriteOddIsTalking = TRUE;
        txt = @"Welcome to my blacksmith, would you like to look around?";
        [self performSelector:@selector(showBModal) withObject:nil afterDelay:0.4];
    }
    
    
    else if (textCode == 3200) //sign 
    {
        txt = @"North: Ellemak. South: Volland.";
    }
    else if (textCode == 3201) //sign
    {
        txt = @"Now entering The Forgotten Cave.";
    }
    else if (textCode == 3202) //sign
    {
        txt = @"Welcome to Ellemak, the City of Kings.";
    }
    else if (textCode == 3203) //sign
    {
        txt = @"Eilif's Home.";
    }
    else if (textCode == 3204) //sign
    {
        txt = @"Fjordland is to the North. It is in a perpetual state of blizzard and ice.";
    }
    else if (textCode == 3205) //sign
    {
        txt = @"Beware of Yetis.";
    }
    else if (textCode == 3206) //sign
    {
        txt = @"The Country of Heroes lies beyond.";
    }
    
    
    else if (textCode == 3313) //item13
    {
        [MusicHandler playButtonClick];
        [self.layer pickedUpItem:13];
        self.layer.hero.gotItem13 = YES;
        txt = @"You open the chest. You found an Amulet of Balok.";
    }
    else if (textCode == 3314) //item14
    {
        [MusicHandler playButtonClick];
        [self.layer pickedUpItem:14];
        self.layer.hero.gotItem14 = YES;
        txt = @"You found 30G.";
    }
    else if (textCode == 3315) //item15
    {
        [MusicHandler playButtonClick];
        [self.layer pickedUpItem:15];
        self.layer.hero.gotItem15 = YES;
        txt = @"You open the chest. You found a Jade Spear.";
    }
    else if (textCode == 3316) //item16
    {
        [MusicHandler playButtonClick];
        [self.layer pickedUpItem:16];
        self.layer.hero.gotItem16 = YES;
        txt = @"You open the chest. You found Mithril Chainmail.";
    }
    
    
    
    
    else if (textCode == 3600)
    {
        self.layer.spriteOddIsTalking = YES;
        txt = @"You spray the bug repellent. The swarm disperses.";
    }
    else if (textCode == 3601)
    {
        self.layer.spriteOddIsTalking = YES;
        txt = @"The insect swarm is too thick to get through...";
    }
    
    
    
    
    else if (textCode == 4000)
    {
        self.layer.spriteOddIsTalking = YES;
        txt = @"Thank you for coming to my rescue, brave hero! I'll make it back on my own -- our time is short. The enemy is more dangerous than anyone thought, you need to go North to Halden and find the Hero's Guild. You MUST rally the Hero's Guild to face this threat!";
    }
    else if (textCode == 4200)
    {
        self.layer.spriteOddIsTalking = YES;
        txt = @"Only experienced travelers should attempt to cross Fjordland.";
    }
    
    else if (textCode == 4317) //item17
    {
        [MusicHandler playButtonClick];
        [self.layer pickedUpItem:17];
        self.layer.hero.gotItem17 = YES;
        txt = @"You open the chest. You found a Pearl Dagger.";
    }
    else if (textCode == 4318) //item18
    {
        [MusicHandler playButtonClick];
        [self.layer pickedUpItem:18];
        self.layer.hero.gotItem18 = YES;
        txt = @"You found 30G.";
    }
    else if (textCode == 4319) //item19
    {
        [MusicHandler playButtonClick];
        [self.layer pickedUpItem:19];
        self.layer.hero.gotItem19 = YES;
        txt = @"You open the chest. You found Mithril Legplates.";
    }
    else if (textCode == 4320) //item20
    {
        [MusicHandler playButtonClick];
        [self.layer pickedUpItem:20];
        self.layer.hero.gotItem20 = YES;
        txt = @"You open the chest. You found a Steel Kiteshield.";
    }
    else if (textCode == 4321) //item21
    {
        [MusicHandler playButtonClick];
        [self.layer pickedUpItem:21];
        self.layer.hero.gotItem21 = YES;
        txt = @"You open the chest. You found 18G.";
    }
    else if (textCode == 4322) //item22
    {
        [MusicHandler playButtonClick];
        [self.layer pickedUpItem:22];
        self.layer.hero.gotItem22 = YES;
        txt = @"You open the chest. You found a Strength Amulet.";
    }
    else if (textCode == 4323) //item23
    {
        [MusicHandler playButtonClick];
        [self.layer pickedUpItem:23];
        self.layer.hero.gotItem23 = YES;
        txt = @"You open the chest. You found Dwarven Ringmail.";
    }
    else if (textCode == 4324) //item24
    {
        [MusicHandler playButtonClick];
        [self.layer pickedUpItem:24];
        self.layer.hero.gotItem24 = YES;
        txt = @"You open the chest. You found a Hunter's Jacket.";
    }
    else if (textCode == 4399)
    {
        [MusicHandler playButtonClick];
        txt = @"The treasure chest is empty.";
    }
    
    else if (textCode == 4404)
    {
        txt = @"Your journey ends here child..";
    }
    else if (textCode == 4405)
    {
        txt = @"Your tiny victory here doesn't matter, child. You will never stand a chance against the Master......";
    }
    
    else if (textCode == 4430)
    {
        txt = @"Me no like humans...";
    }
    else if (textCode == 4431)
    {
        txt = @"Master angry about you...";
    }
    else if (textCode == 4432)
    {
        txt = @"Graaaaa.. I eat puny humans!";
    }
    
    
    
    else if (textCode == 5000)
    {
        self.layer.spriteOddIsTalking = YES;
        txt = @"Hello traveler, who are you looking for?";
    }
    else if (textCode == 5001)
    {
        self.layer.spriteOddIsTalking = YES;
        txt = @"... ...";
    }
    else if (textCode == 5022)
    {
        self.layer.spriteOddIsTalking = YES;
        txt = @"I see. Well, I am Arnuk. I have disguised myself as an old man because all of our heroes have been captured by monsters. The enemy is too strong for me... I cannot help you. You have come so far... You are our only hope.";
    }
    else if (textCode == 5023)
    {
        self.layer.spriteOddIsTalking = YES;
        txt = @"Here, take this gift to help you with your quest.";
    }
    else if (textCode == 5024)
    {
        self.layer.spriteOddIsTalking = YES;
        txt = @"You received 100G.";
    }
    else if (textCode == 5002)
    {
        self.layer.spriteOddIsTalking = YES;
        txt = @"I have unlocked the Gate to Vankur. You must face this evil. Good luck!";
    }
    
    else if (textCode == 5004)
    {
        self.layer.spriteEvenIsTalking = YES;
        txt = @"Even with the demise of Vankur, the Northern lands are always dangerous.";
    }
    else if (textCode == 5003)
    {
        self.layer.spriteEvenIsTalking = YES;
        txt = @"Follow the path North-East to Halden.";
    }
    else if (textCode == 5006)
    {
        self.layer.spriteOddIsTalking = YES;
        txt = @"Not very many people ever lived in Halden, due to its proximity to Vankur.";
    }
    else if (textCode == 5005)
    {
        self.layer.spriteOddIsTalking = YES;
        txt = @"The quiet before the storm...";
    }
    
    
    else if (textCode == 5100) //sprite 115, shop 14
    {
        self.layer.spriteOddIsTalking = TRUE;
        txt = @"Welcome to my general market, would you like to view my wares?";
        [self performSelector:@selector(showBModal) withObject:nil afterDelay:0.4];
    }
    else if (textCode == 5101) //sprite 114
    {
        self.layer.spriteEvenIsTalking = TRUE;
        txt = @"Hello, would you like to stay at the Inn tonight?";
        [self performSelector:@selector(showBModal) withObject:nil afterDelay:0.5];
    }
    else if (textCode == 5102) //sprite 114
    {
        self.layer.spriteEvenIsTalking = TRUE;
        txt = @"That will be 1 gold coin. Please come again!";
    }
    else if (textCode == 5103) //sprite 114
    {
        self.layer.spriteEvenIsTalking = TRUE;
        txt = @"I'm afraid you don't have enough money. Sorry!";
    }
    else if (textCode == 5104) //sprite 116, shop 15
    {
        self.layer.spriteEvenIsTalking = TRUE;
        txt = @"Welcome to my weapons shop; would you care to look around?";
        [self performSelector:@selector(showBModal) withObject:nil afterDelay:0.4];
    }
    
    else if (textCode == 5010)
    {
        self.layer.spriteOddIsTalking = YES;
        txt = @"I locked my treasure chest when I left, but now I realize I have no need for weapons...";
    }
    else if (textCode == 5011)
    {
        self.layer.spriteEvenIsTalking = YES;
        txt = @"I'm training to be the greatest heroin in all of Kolamar. Perhaps we will meet on the battlefield, someday.";
    }
    else if (textCode == 5012)
    {
        self.layer.spriteOddIsTalking = YES;
        txt = @"You have earned your place amongst us at the Hero's Guild. However, there is an even greater land for heroes, to the SouthEast of here.";
    }
    
    else if (textCode == 5200)
    {
        txt = @"Contrary to popular belief, Fire Ants thrive in cold environments.";
    }
    else if (textCode == 5201)
    {
        txt = @"Do not travel the woods alone.";
    }
    else if (textCode == 5202)
    {
        txt = @"Welcome to Halden, the City of Resilience.";
    }
    else if (textCode == 5203)
    {
        txt = @"West: Vankur. Go at your own risk.";
    }
    else if (textCode == 5204)
    {
        txt = @"Turn back to go to Halden.";
    }
    
    else if (textCode == 5240)
    {
        txt = @"The Gate is locked.";
    }
    
    
    else if (textCode == 5325) //item25
    {
        [MusicHandler playButtonClick];
        [self.layer pickedUpItem:25];
        self.layer.hero.gotItem25 = YES;
        txt = @"You open the chest. You found a Black Serpent's Blade.";
    }
    else if (textCode == 5326) //item26
    {
        [MusicHandler playButtonClick];
        [self.layer pickedUpItem:26];
        self.layer.hero.gotItem26 = YES;
        txt = @"You open the chest. You found Ichorean Chainmail.";
    }
    else if (textCode == 5327) //item27
    {
        [MusicHandler playButtonClick];
        [self.layer pickedUpItem:27];
        self.layer.hero.gotItem27 = YES;
        txt = @"You open the chest. You found Ichorean Legplates.";
    }
    
    else if (textCode == 6200)
    {
        txt = @"This is the door to the Tower. It's too dark to see inside...";
    }
    else if (textCode == 6328)
    {
        [MusicHandler playButtonClick];
        [self.layer pickedUpItem:28];
        self.layer.hero.gotItem28 = YES;
        txt = @"You open the chest. You found an Ivory Battle Helm.";
    }
    else if (textCode == 6405)
    {
        txt = @"... ...";
    }
    
    
    
    
    
    
    
    else if (textCode == 7001)
    {
        self.layer.spriteEvenIsTalking = YES;
        txt = @"The rare Gold Golem is said to live in the part of Kolamar closest to the sunrise. That happens to be just North of here...";
    }
    else if (textCode == 7002)
    {
        self.layer.spriteOddIsTalking = YES;
        txt = @"Many of the great legends of Kolamar originated here, in Gaul.";
    }
    else if (textCode == 7004)
    {
        self.layer.spriteOddIsTalking = YES;
        txt = @"There will always be another Quest for a great Hero.";
    }
    else if (textCode == 7005)
    {
        self.layer.spriteEvenIsTalking = YES;
        txt = @"I've lived in Gaul ever since I was proven as a hero. There's very little contact with the outside world here.";
    }
    else if (textCode == 7006)
    {
        self.layer.spriteOddIsTalking = YES;
        txt = @"Almost all of the rarest and most powerful known items can be found at the shops here.";
    }
    
    
    else if (textCode == 7103) //sprite 122, shop 16
    {
        self.layer.spriteEvenIsTalking = TRUE;
        txt = @"Welcome to my general market, would you like to view my wares?";
        [self performSelector:@selector(showBModal) withObject:nil afterDelay:0.4];
    }
    else if (textCode == 7105) //sprite 127
    {
        self.layer.spriteOddIsTalking = TRUE;
        txt = @"Hello, would you like to stay at the Inn tonight?";
        [self performSelector:@selector(showBModal) withObject:nil afterDelay:0.5];
    }
    else if (textCode == 7105)
    {
        self.layer.spriteOddIsTalking = TRUE;
        txt = @"That will be 1 gold coin. Please come again!";
    }
    else if (textCode == 7105)
    {
        self.layer.spriteOddIsTalking = TRUE;
        txt = @"I'm afraid you don't have enough money. Sorry!";
    }
    
    else if (textCode == 7100) //sprite 123, shop 17
    {
        self.layer.spriteOddIsTalking = TRUE;
        txt = @"Welcome to my weapons shop; would you care to look around?";
        [self performSelector:@selector(showBModal) withObject:nil afterDelay:0.4];
    }
    else if (textCode == 7101) //sprite 124, shop 18
    {
        self.layer.spriteEvenIsTalking = TRUE;
        txt = @"Welcome to my blacksmith; can I help you?";
        [self performSelector:@selector(showBModal) withObject:nil afterDelay:0.4];
    }
    else if (textCode == 7102) //sprite 125, shop 19
    {
        self.layer.spriteOddIsTalking = TRUE;
        txt = @"Welcome to my smith; would you like to view my wares?";
        [self performSelector:@selector(showBModal) withObject:nil afterDelay:0.4];
    }
    
    
    
    else if (textCode == 7329) //item29
    {
        [MusicHandler playButtonClick];
        [self.layer pickedUpItem:29];
        self.layer.hero.gotItem29 = YES;
        txt = @"You open the chest. You found Dragon Chausses.";
    }
    else if (textCode == 7330) //item30
    {
        [MusicHandler playButtonClick];
        [self.layer pickedUpItem:30];
        self.layer.hero.gotItem30 = YES;
        txt = @"You open the chest. You found an Elven Lorica.";
    }
    else if (textCode == 7331) //item31
    {
        [MusicHandler playButtonClick];
        [self.layer pickedUpItem:31];
        self.layer.hero.gotItem31 = YES;
        txt = @"You open the chest. You found a Black Serpent's Blade.";
    }
    
    else if (textCode == 7200)
    {
        txt = @"This path was forged by the first King of Volland, and has since been walked by only proven heroes.";
    }
    else if (textCode == 7201)
    {
        txt = @"The Cave of Challenges awaits to the North. Enter at your own peril.";
    }
    else if (textCode == 7202)
    {
        txt = @"Gaul was once a small fishing village, but the settlement was destroyed in the First Great War.";
    }
    else if (textCode == 7203)
    {
        txt = @"Welcome to Gaul, the City of the Enlightened.";
    }
    
    
    else if (textCode == 8332) //item 32
    {
        [MusicHandler playButtonClick];
        [self.layer pickedUpItem:32];
        self.layer.hero.gotItem32 = YES;
        txt = @"You open the chest. You found 10G.";
    }
    else if (textCode == 8333) //item 33
    {
        [MusicHandler playButtonClick];
        [self.layer pickedUpItem:33];
        self.layer.hero.gotItem33 = YES;
        txt = @"You open the chest. You found a Mithril Longsword.";
    }
    else if (textCode == 8334) //item 34
    {
        [MusicHandler playButtonClick];
        [self.layer pickedUpItem:34];
        self.layer.hero.gotItem34 = YES;
        txt = @"You open the chest. You found 15G.";
    }
    else if (textCode == 8335) //item 35
    {
        [MusicHandler playButtonClick];
        [self.layer pickedUpItem:35];
        self.layer.hero.gotItem35 = YES;
        txt = @"You open the chest. You found an Ichorean Platebody.";
    }
    else if (textCode == 8406)
    {
        txt = @"I am Veran. Who dares to enter my lair?";
    }
    else if (textCode == 8407)
    {
        txt = @"... You come on Eilif's behalf with questions? ...";
    }
    else if (textCode == 8408)
    {
        txt = @"I do not know what evil stirs in Vankur, for I am not aligned with those wretched souls. Vankur's power only extends to the weak of mind and the corrupt.";
    }
    else if (textCode == 8409)
    {
        txt = @"...However, I do know that whoever has taken control of Vankur is a foreigner to the country. From where, I do not know, but it is a human who is bringing forth this evil, not a beast. Now, you have out-stayed your welcome. Friend of Eilif or not, no trespasser leaves my cave unscathed! ";
    }
    else if (textCode == 8410)
    {
        txt = @"You are a worthy adversary, for a human. Good luck to you.";
    }
    
    else if (textCode == 9336) //item 36
    {
        [MusicHandler playButtonClick];
        [self.layer pickedUpItem:36];
        self.layer.hero.gotItem36 = YES;
        txt = @"You open the chest. You found 20G.";
    }
    else if (textCode == 9337) //item 37
    {
        [MusicHandler playButtonClick];
        [self.layer pickedUpItem:37];
        self.layer.hero.gotItem37 = YES;
        txt = @"You open the chest. You found a Super Strength Potion.";
    }
    else if (textCode == 9338) //item 38
    {
        [MusicHandler playButtonClick];
        [self.layer pickedUpItem:38];
        self.layer.hero.gotItem38 = YES;
        txt = @"You open the chest. You found an Elixir.";
    }
    else if (textCode == 9339) //item 39
    {
        [MusicHandler playButtonClick];
        [self.layer pickedUpItem:39];
        self.layer.hero.gotItem39 = YES;
        txt = @"You open the chest. You found a Fireflower Root.";
    }
    else if (textCode == 9407)
    {
        txt = @"Tiny human... tasty...";
    }
    
    else if (textCode == 20343) //item 43
    {
        [MusicHandler playButtonClick];
        [self.layer pickedUpItem:43];
        self.layer.hero.gotItem39 = YES;
        txt = @"You open the chest. You found Kayu-Skin Soup.";
    }
    else if (textCode == 20344) //item 44
    {
        [MusicHandler playButtonClick];
        [self.layer pickedUpItem:44];
        self.layer.hero.gotItem39 = YES;
        txt = @"You open the chest. You found 10G.";
    }
    else if (textCode == 20345) //item 45
    {
        [MusicHandler playButtonClick];
        [self.layer pickedUpItem:45];
        self.layer.hero.gotItem39 = YES;
        txt = @"You open the chest. You found a Jade Elixir.";
    }
    
    
    
    
    else if (textCode == 21340) //item 40
    {
        [MusicHandler playButtonClick];
        [self.layer pickedUpItem:40];
        self.layer.hero.gotItem40 = YES;
        txt = @"You open the chest. You found 15G.";
    }
    else if (textCode == 21341) //item 41
    {
        [MusicHandler playButtonClick];
        [self.layer pickedUpItem:41];
        self.layer.hero.gotItem41 = YES;
        txt = @"You open the chest. You found Ent Bark.";
    }
    else if (textCode == 21342) //item 42
    {
        [MusicHandler playButtonClick];
        [self.layer pickedUpItem:42];
        self.layer.hero.gotItem42 = YES;
        txt = @"You open the chest. You found 25G.";
    }
    
    
    else if (textCode == 22346) //item 46
    {
        [MusicHandler playButtonClick];
        [self.layer pickedUpItem:46];
        self.layer.hero.gotItem46 = YES;
        txt = @"You open the chest. You found 30G.";
    }
    else if (textCode == 22347) //item 47
    {
        [MusicHandler playButtonClick];
        [self.layer pickedUpItem:47];
        self.layer.hero.gotItem47 = YES;
        txt = @"You open the chest. You found a Fireflower Root.";
    }
    else if (textCode == 22348) //item 48
    {
        [MusicHandler playButtonClick];
        [self.layer pickedUpItem:48];
        self.layer.hero.gotItem48 = YES;
        txt = @"You open the chest. You found Kayu-Skin Soup.";
    }
    else if (textCode == 22349) //item 49
    {
        [MusicHandler playButtonClick];
        [self.layer pickedUpItem:49];
        self.layer.hero.gotItem49 = YES;
        txt = @"You open the chest. You found a Fireflower Root.";
    }
    
    
    else if (textCode == 30350)
    {
        [MusicHandler playButtonClick];
        [self.layer pickedUpItem:50];
        self.layer.hero.gotItem50 = YES;
        txt = @"You open the chest. You found 65G.";
    }
    else if (textCode == 30351)
    {
        [MusicHandler playButtonClick];
        [self.layer pickedUpItem:51];
        self.layer.hero.gotItem51 = YES;
        txt = @"You open the chest. You found a Fireflower Root.";
    }
    
    else if (textCode == 31352)
    {
        [MusicHandler playButtonClick];
        [self.layer pickedUpItem:52];
        self.layer.hero.gotItem52 = YES;
        txt = @"You open the chest. You found an Ichorean Avenger.";
    }
    
    else if (textCode == 32353)
    {
        [MusicHandler playButtonClick];
        [self.layer pickedUpItem:53];
        self.layer.hero.gotItem53 = YES;
        txt = @"You open the chest. You found Elven Chaps.";
    }
    else if (textCode == 32354)
    {
        [MusicHandler playButtonClick];
        [self.layer pickedUpItem:54];
        self.layer.hero.gotItem54 = YES;
        txt = @"You open the chest. You found an Ichorean Helm.";
    }
    
    else if (textCode == 33355)
    {
        [MusicHandler playButtonClick];
        [self.layer pickedUpItem:55];
        self.layer.hero.gotItem55 = YES;
        txt = @"You open the chest. You found a Jade Elixir.";
    }
    
    
    else if (textCode == 34000)
    {
        self.layer.spriteOddIsTalking = YES;
        txt = [NSString stringWithFormat:@"Hello, %@. I have been waiting for you.", self.layer.hero.heroName];
    }
    else if (textCode == 34001)
    {
        self.layer.spriteOddIsTalking = YES;
        txt = @"You have displayed a great deal of bravery and skill lately, and defeated my finest servants. You remind me of myself when I was young...";
    }
    else if (textCode == 34002)
    {
        self.layer.spriteOddIsTalking = YES;
        txt = @"Who am I, you ask?... I am Ionak.";
    }
    else if (textCode == 34003)
    {
        self.layer.spriteOddIsTalking = YES;
        txt = @"You probably know of me as the hero who destroyed Holgrath decades ago, and restored peace to Kolamar. However, there is more to my story. On that fateful day, I battled my way to the top of this castle, just as you did today. Holgrath, however, had grown arrogant and lazy, and had not prepared for my arrival. The secret to his power, his crystal amulet, sat on the ground beside his throne. Before he was aware of me, I grabbed his amulet from the ground and put it around my neck. I immediately felt a rush of power like nothing I had ever known, and the rest, is history...";
    }
    else if (textCode == 34004)
    {
        self.layer.spriteOddIsTalking = YES;
        txt = @"When I returned home, I claimed that Holgrath's crystal had been destroyed with him. But in secret, I mastered its powers. The crystal granted me longevity and strength -- hence my ageless appearance. Now, I have fully realized the crystal's full potential, and have prepared an army to unite all of Kolamar under my rule, and soon, the entire world.";
    }
    else if (textCode == 34005)
    {
        self.layer.spriteOddIsTalking = YES;
        txt = @"I see you do not share in my vision... I shall delay no longer; your time has come to an end.";
    }
    
    else if (textCode == 34100)
    {
        self.layer.spriteOddIsTalking = YES;
        txt = @"There is no turning back now...";
    }
    
    
    else if (textCode == 34356)
    {
        [MusicHandler playButtonClick];
        [self.layer pickedUpItem:56];
        self.layer.hero.gotItem56 = YES;
        txt = @"You open the chest. You found 75G.";
    }
    else if (textCode == 34357)
    {
        [MusicHandler playButtonClick];
        [self.layer pickedUpItem:57];
        self.layer.hero.gotItem57 = YES;
        txt = @"You open the chest. You found an Eagle's Charm.";
    }
    else if (textCode == 34358)
    {
        [MusicHandler playButtonClick];
        [self.layer pickedUpItem:58];
        self.layer.hero.gotItem58 = YES;
        txt = @"You open the chest. You found an Onyx Lorica.";
    }
    
    
    else if (textCode == 11000)
    {
        self.layer.spriteEvenIsTalking = YES;
        txt = @"You must beat the servants before you can face the master...";
    }
    else if (textCode == 11001)
    {
        self.layer.spriteEvenIsTalking = YES;
        txt = @"What left is there for you to prove?";
    }
    
    
    
    else if (textCode == 11359)
    {
        [MusicHandler playButtonClick];
        [self.layer pickedUpItem:59];
        self.layer.hero.gotItem59 = YES;
        txt = @"You open the chest. You found Armor of the Forest.";
    }
    else if (textCode == 11360)
    {
        [MusicHandler playButtonClick];
        [self.layer pickedUpItem:60];
        self.layer.hero.gotItem60 = YES;
        txt = @"You open the chest. You foundn a Ice Guardian.";
    }
    else if (textCode == 11361)
    {
        [MusicHandler playButtonClick];
        [self.layer pickedUpItem:61];
        self.layer.hero.gotItem61 = YES;
        txt = @"You open the chest. You found Onyx Legplates.";
    }
    else if (textCode == 11362)
    {
        [MusicHandler playButtonClick];
        [self.layer pickedUpItem:62];
        self.layer.hero.gotItem62 = YES;
        txt = @"You open the chest. You found a Sunscale Helm.";
    }
    else if (textCode == 11363)
    {
        [MusicHandler playButtonClick];
        [self.layer pickedUpItem:63];
        self.layer.hero.gotItem63 = YES;
        txt = @"You open the chest. You found 20,000G.";
    }
    
    else if (textCode == 11408)
    {
        txt = @"...";
    }
    else if (textCode == 11409)
    {
        txt = @"...";
    }
    else if (textCode == 11410)
    {
        txt = @"What human dares to challenge a God?";
    }
    
    
    textBoxLayer = [[TextBoxLayer alloc] initWithColor:[UIColor clearColor] width: 470 height:90 padding:10 text:txt];
    
    if (size.width == 568) {
        textBoxLayer.position =  ccp(40, size.height/2 - 171);
    } else {
        textBoxLayer.position =  ccp(-2, size.height/2 - 171);
    }
    textBoxLayer.delegate = self;
    
    [self addChild:textBoxLayer z:INT_MAX];
    self.textPresent = YES;
    return;
}

-(void)showBModal
{
    if (!bModalIsShowing && self.textPresent)
    {
        bModalIsShowing = YES;
        bModal = [[BoolLayer alloc] init];
        [self addChild:bModal z:100];
    }
}

-(void) textBox:(id<TextBox>)tbox didMoveToPage:(int)p
{
    
    if (currentTextCode == 23)
    {
        if (p==2)
        {
            [self performSelector:@selector(showBModal) withObject:nil afterDelay:0.5];
        }
    }
    if (currentTextCode == 46)
    {
        if (p==2)
        {
            [self performSelector:@selector(showBModal) withObject:nil afterDelay:0.5];
        }
    }
}

-(void) textBox:(id<TextBox>)tbox didFinishAllTextWithPageCount:(int)pc {
    if (bModalIsShowing)
    {
        [self pressedNo];
        return;
    }
	BOOL willEnableTouch;
    if (self.textPresent) {
        [self removeChild:textBoxLayer cleanup:YES];
        self.textPresent = NO;
        willEnableTouch = YES;
        //[self.layer enableTouch];
    }

    self.layer.spriteEvenIsTalking = NO;
    self.layer.spriteOddIsTalking = NO;
    
    
    
    
    
    if (currentTextCode == 10)
    {
        self.layer.spriteEvenIsTalking = YES;
        [self pressedNo];
        return;
    }
    else if (currentTextCode == 12)
    {
        self.layer.spriteEvenIsTalking = YES;
        [self showText:13];
        return;
    }
    else if (currentTextCode == 13)
    {
        self.layer.spriteEvenIsTalking = YES;
        if (!self.layer.hero.gotOrb)
        {
            self.layer.hero.gotOrb = YES;
            [self.layer givenItem:25];
            [self showText:14];
            return;
        }
        else {
            self.layer.spriteEvenIsTalking = NO;
        }
    }
    else if (currentTextCode == 15)
    {
        self.layer.spriteEvenIsTalking = YES;
        [self showText:16];
        return;
    }
    else if (currentTextCode == 16)
    {
        self.layer.spriteEvenIsTalking = YES;
        self.layer.hero.talkedToKingVPostOrb = YES;
        [self showText:17];
        return;
    }
    else if (currentTextCode == 17)
    {
        if (!self.layer.hero.acceptedTaskKingVPostOrb)
        {
            self.layer.spriteEvenIsTalking = YES;
            self.layer.hero.acceptedTaskKingVPostOrb = YES;
            [self.layer unblockCity];
            [self.layer givenItem:999]; // 999 will represent giving 10G
            [self showText:18];
            [self.layer saveHero];
        }
        return;
    }
    else if (currentTextCode == 19)
    {
        self.layer.spriteEvenIsTalking = YES;
        [self showText:20];
        return;
    }
    else if (currentTextCode == 20)
    {
        self.layer.spriteEvenIsTalking = YES;
        [self showText:21];
        return;
    }
    else if (currentTextCode == 21)
    {
        self.layer.spriteEvenIsTalking = YES;
        self.layer.hero.toldNewsKingV = YES;
        [self showText:22];
        return;
    }
    else if (currentTextCode == 22)
    {
        self.layer.spriteEvenIsTalking = YES;
        [self showText:23];
        return;
    }
    else if (currentTextCode == 24)
    {
        self.layer.spriteEvenIsTalking = YES;
        
        self.layer.hero.acceptedFindEilifKingV = YES;
        [self.layer unblockEast];
        [self.layer givenItem:1000];
        [self showText:25];
        return;
    }
    
    else if (currentTextCode == 27)
    {
        self.layer.spriteEvenIsTalking = YES;
        [self showText:28];
        return;
    }
    else if (currentTextCode == 28)
    {
        self.layer.spriteEvenIsTalking = YES;
        
        self.layer.hero.gotPrizeFromKingV = YES;
        [self.layer givenItem:76];
        [self showText:29];
        return;
    }
    else if (currentTextCode == 36)
    {
        self.layer.spriteOddIsTalking = YES;
        [self pressedNo];
        return;
    }
    
    else if (currentTextCode == 47)
    {
        self.layer.spriteEvenIsTalking = YES;
        [self showText:48];
        return;
    }
    
    
    else if (currentTextCode == 50)
    {
        self.layer.spriteEvenIsTalking = YES;
        [self showText:51];
        return;
    }
    else if (currentTextCode == 51)
    {
        self.layer.spriteEvenIsTalking = YES;
        [self showText:52];
        return;
    }
    else if (currentTextCode == 52)
    {
        self.layer.spriteEvenIsTalking = YES;
        [self showText:53];
        self.layer.hero.finishedTaskTraveler = YES;
        [self.layer givenItem:28];
        return;
    }
    
    
    
    
    else if (currentTextCode == 400)
    {
        //[MusicHandler playBackgroundMusic:3]; // this happens in HUD's gobattle method
        self.layer.currentBID = 101;
        [self.layer goBattle];
        return;
    }
    else if (currentTextCode == 401)
    {
        //[MusicHandler playBackgroundMusic:3];
        self.layer.currentBID = 102;
        [self.layer goBattle];
        return;
    }
    else if (currentTextCode == 1412)
    {
        //[MusicHandler playBackgroundMusic:3];
        self.layer.currentBID = 112;
        [self.layer goBattle];
        return;
    }
    
    
    
    else if (currentTextCode == 1010)
    {
        self.layer.spriteOddIsTalking = YES;
        [self showText:1011];
        return;
    }
    else if (currentTextCode == 1011)
    {
        self.layer.spriteOddIsTalking = YES;
        self.layer.hero.deliveredLetterToKingK = YES;
        [self showText:1012];
        return;
    }
    else if (currentTextCode == 1012)
    {
        self.layer.hero.acceptedMessageKingK = YES;
        return;
    }
    else if (currentTextCode == 1015)
    {
        self.layer.spriteOddIsTalking = YES;
        self.layer.hero.gotEarthSword = YES;
        [self.layer givenItem:76];
        [self showText:1967];
        return;
    }
    else if (currentTextCode == 1022)
    {
        self.layer.hero.gotRepellent = YES;
        [self.layer givenItem:19];
        return;
    }
    
    else if (currentTextCode == 2005)
    {
        self.layer.hero.talkedToWatchmen = YES;
        [self.layer unblockCave];
        return;
    }
    
    else if (currentTextCode == 2008)
    {
        self.layer.spriteOddIsTalking = YES;
        [self showText:2009];
        return;
    }
    else if (currentTextCode == 2009)
    {
        self.layer.hero.gotFireRoot = YES;
        [self.layer givenItem:35];
        return;
    }
    else if (currentTextCode == 3017)
    {
        self.layer.spriteOddIsTalking = YES;
        if (!self.layer.hero.gotLorica)
        {
            self.layer.hero.gotLorica = YES;
            [self.layer givenItem:126];
            [self showText:3018];
            return;
        }
        self.layer.spriteOddIsTalking = NO;
        return;
    }
    
    else if (currentTextCode == 3021)
    {
        self.layer.spriteOddIsTalking = YES;
        if (!self.layer.hero.talkedToEilif)
        {
            [MusicHandler playButtonClick];
            self.layer.hero.talkedToEilif = YES;
            [self.layer givenItem:26];
            [self showText:3022];
            return;
        }
        self.layer.spriteOddIsTalking = NO;
        return;
    }
    else if (currentTextCode == 3022)
    {
        self.layer.spriteOddIsTalking = YES;
        [self showText:3023];
        return;
    }
    else if (currentTextCode == 3024)
    {
        self.layer.spriteOddIsTalking = YES;
        [self showText:3025];
        return;
    }
    else if (currentTextCode == 3025)
    {
        self.layer.spriteOddIsTalking = YES;
        [self showText:3026];
        return;
    }
    else if (currentTextCode == 4404)
    {
        self.layer.currentBID = 104;
        [self.layer goBattle];
        return;
    }
    else if (currentTextCode == 4405)
    {
        [self.layer removeBoss4];
    }
    else if (currentTextCode == 4430)
    {
        self.layer.currentBID = 130;
        [self.layer goBattle];
        return;
    }
    else if (currentTextCode == 4431)
    {
        self.layer.currentBID = 131;
        [self.layer goBattle];
        return;
    }
    else if (currentTextCode == 4432)
    {
        self.layer.currentBID = 132;
        [self.layer goBattle];
        return;
    }
    
    else if (currentTextCode == 5000)
    {
        self.layer.spriteOddIsTalking = YES;
        [self showText:5001];
        return;
    }
    else if (currentTextCode == 5001)
    {
        self.layer.spriteOddIsTalking = YES;
        [self showText:5022];
        return;
    }
    else if (currentTextCode == 5022)
    {
        self.layer.spriteOddIsTalking = YES;
        [self showText:5023];
        return;
    }
    else if (currentTextCode == 5023)
    {
        self.layer.spriteOddIsTalking = YES;
        [self.layer givenItem:999]; // 999 will represent giving 100G
        [self showText:5024];
        return;
    }
    else if (currentTextCode == 5024)
    {
        [self showText:5002];
        return;
    }
    else if (currentTextCode == 6405)
    {
        self.layer.currentBID = 105;
        [self.layer goBattle];
        return;
    }
    
    else if (currentTextCode == 8406)
    {
        [self showText:8407];
        return;
    }
    else if (currentTextCode == 8407)
    {
        [self showText:8408];
        return;
    }
    else if (currentTextCode == 8408)
    {
        [self showText:8409];
        return;
    }
    else if (currentTextCode == 8409)
    {
        self.layer.currentBID = 106;
         [self.layer goBattle];
        return;
    }
    
    else if (currentTextCode == 9407)
    {
        self.layer.currentBID = 107;
        [self.layer goBattle];
        return;
    }
    
    else if (currentTextCode == 34000)
    {
        [self showText:34001];
        return;
    }
    else if (currentTextCode == 34001)
    {
        [self showText:34002];
        return;
    }
    else if (currentTextCode == 34002)
    {
        [self showText:34003];
        return;
    }
    else if (currentTextCode == 34003)
    {
        [self showText:34004];
        return;
    }
    else if (currentTextCode == 34004)
    {
        [self showText:34005];
        return;
    }
    else if (currentTextCode == 34005)
    {
        self.layer.currentBID = 111;
        [self.layer goBattle];
        return;
    }
    
    else if (currentTextCode == 11408)
    {
        self.layer.currentBID = 108;
        [self.layer goBattle];
        return;
    }
    else if (currentTextCode == 11409)
    {
        self.layer.currentBID = 109;
        [self.layer goBattle];
        return;
    }
    else if (currentTextCode == 11410)
    {
        self.layer.currentBID = 110;
        [self.layer goBattle];
        return;
    }
    
    
    if (willEnableTouch) {
        [self.layer enableTouch];
    }
    return;
}



- (void)gameLoop: (ccTime) dT {
    if (self.textPresent) {
        [textBoxLayer update:dT];
    }
	
}









-(void)pressedYes
{
    if (self.textPresent) {
        [self removeChild:textBoxLayer cleanup:YES];
        self.textPresent = NO;
        // we don't enable touch here (and by here, i mean at the end of the method, because pressingyes always leads to text or new playlayer
    }
    bModalIsShowing = NO;
    [self removeChild:bModal cleanup:YES];
    
    
    
    
    if (currentTextCode == 10)
    {
        self.layer.spriteEvenIsTalking = YES;
        
        [self.layer unblockTower];
        self.layer.hero.talkedToKingVInitial = YES;
        [self showText:12];
        return;
    }
    
    else if (currentTextCode == 23)
    {
        self.layer.spriteEvenIsTalking = YES;
        
        //self.layer.hero.acceptedFindEilifKingV = YES;
        [self showText:24];
        return;
    }
    else if (currentTextCode == 36)
    {
        self.layer.spriteOddIsTalking = YES;
        [self showText:38];
        return;
    }
    else if (currentTextCode == 46)
    {
        self.layer.spriteEvenIsTalking = YES;
        [self showText:47];
        self.layer.hero.acceptedTaskTraveler = YES;
        return;
    }
    
    else if (currentTextCode == 102)
    {
        if (self.layer.hero.gold >= 1)
        {
            [self.layer performSelector:@selector(stayAtInn) withObject:nil afterDelay:1.4];
            [self showText:103]; 
            return;
        }
        else
        {
            [self showText:104];
        }
    }
    
    else if (currentTextCode == 101)
    {
        [self.layer saveHero];
        self.layer.spriteEvenIsTalking = YES;
        [SceneManager goShop:0];
        return;
    }
    
    else if (currentTextCode == 105)
    {
        [self.layer saveHero];
        [SceneManager goShop:1];
        return;
    }
    else if (currentTextCode == 106)
    {
        [self.layer saveHero];
        [SceneManager goShop:2];
        return;
    }
    
    
    else if (currentTextCode == 1103)
    {
        if (self.layer.hero.gold >= 1)
        {
            [self.layer performSelector:@selector(stayAtInn) withObject:nil afterDelay:1.4];
            [self showText:103];
            return;
        }
        else
        {
            [self showText:104];
        }
    }
    
    else if (currentTextCode == 1101)
    {
        [self.layer saveHero];
        self.layer.spriteEvenIsTalking = YES;
        [SceneManager goShop:3];
        return;
    }
    
    else if (currentTextCode == 1102)
    {
        [self.layer saveHero];
        [SceneManager goShop:4];
        return;
    }
    else if (currentTextCode == 1106)
    {
        [self.layer saveHero];
        [SceneManager goShop:5];
        return;
    }
    else if (currentTextCode == 1107)
    {
        [self.layer saveHero];
        [SceneManager goShop:6];
        return;
    }
    else if (currentTextCode == 1108)
    {
        [self.layer saveHero];
        [SceneManager goShop:7];
        return;
    }
    
    else if (currentTextCode == 2028)
    {
        self.layer.spriteOddIsTalking = YES;
        [self showText:1955];
        return;
    }
    
    else if (currentTextCode == 2100)
    {
        [self.layer saveHero];
        self.layer.spriteEvenIsTalking = YES;
        [SceneManager goShop:8];
        return;
    }
    
    else if (currentTextCode == 2101)
    {
        [self.layer saveHero];
        [SceneManager goShop:9];
        return;
    }
    else if (currentTextCode == 2102)
    {
        if (self.layer.hero.gold >= 1)
        {
            [self.layer performSelector:@selector(stayAtInn) withObject:nil afterDelay:1.4];
            [self showText:103];
            return;
        }
        else
        {
            [self showText:104];
        }
    }
    else if (currentTextCode == 3035)
    {
        [self.layer saveHero];
        [SceneManager goBattle:150];
        return;
    }
    else if (currentTextCode == 3102)
    {
        if (self.layer.hero.gold >= 1)
        {
            [self.layer performSelector:@selector(stayAtInn) withObject:nil afterDelay:1.4];
            [self showText:3103];
            return;
        }
        else
        {
            [self showText:3104];
        }
    }
    
    
    else if (currentTextCode == 3100)
    {
        [self.layer saveHero];
        self.layer.spriteEvenIsTalking = YES;
        [SceneManager goShop:10];
        return;
    }
    else if (currentTextCode == 3101)
    {
        [self.layer saveHero];
        self.layer.spriteEvenIsTalking = YES;
        [SceneManager goShop:11];
        return;
    }
    else if (currentTextCode == 3105)
    {
        [self.layer saveHero];
        self.layer.spriteEvenIsTalking = YES;
        [SceneManager goShop:12];
        return;
    }
    else if (currentTextCode == 3106)
    {
        [self.layer saveHero];
        self.layer.spriteEvenIsTalking = YES;
        [SceneManager goShop:13];
        return;
    }
    
    else if (currentTextCode == 5100)
    {
        [self.layer saveHero];
        self.layer.spriteOddIsTalking = YES;
        [SceneManager goShop:14];
        return;
    }
    else if (currentTextCode == 5104)
    {
        [self.layer saveHero];
        self.layer.spriteEvenIsTalking = YES;
        [SceneManager goShop:15];
        return;
    }
    else if (currentTextCode == 5101)
    {
        if (self.layer.hero.gold >= 1)
        {
            [self.layer performSelector:@selector(stayAtInn) withObject:nil afterDelay:1.4];
            [self showText:5102];
            return;
        }
        else
        {
            [self showText:5103];
        }
    }
    
    else if (currentTextCode == 7100)
    {
        [self.layer saveHero];
        self.layer.spriteOddIsTalking = YES;
        [SceneManager goShop:17];
        return;
    }
    else if (currentTextCode == 7101)
    {
        [self.layer saveHero];
        self.layer.spriteEvenIsTalking = YES;
        [SceneManager goShop:18];
        return;
    }
    else if (currentTextCode == 7102)
    {
        [self.layer saveHero];
        self.layer.spriteOddIsTalking = YES;
        [SceneManager goShop:19];
        return;
    }
    else if (currentTextCode == 7103)
    {
        [self.layer saveHero];
        self.layer.spriteEvenIsTalking = YES;
        [SceneManager goShop:16];
        return;
    }
    else if (currentTextCode == 7105)
    {
        if (self.layer.hero.gold >= 1)
        {
            [self.layer performSelector:@selector(stayAtInn) withObject:nil afterDelay:1.4];
            [self showText:7106];
            return;
        }
        else
        {
            [self showText:7107];
        }
    }
    
}
-(void)pressedNo
{
    self.layer.spriteOddIsTalking = NO;
    self.layer.spriteEvenIsTalking = NO;
    BOOL willEnableTouch;
    if (self.textPresent) {
        [self removeChild:textBoxLayer cleanup:YES];
        self.textPresent = NO;
        willEnableTouch = YES;
        //[self.layer enableTouch];
    }
    bModalIsShowing = NO;
    [self removeChild:bModal cleanup:YES];
    
    
    
    if (currentTextCode == 10)
    {
        self.layer.spriteEvenIsTalking = YES;
        [self showText:11];
        return;
    }
    else if (currentTextCode == 36)
    {
        self.layer.spriteOddIsTalking = YES;
        [self showText:37];
        return;
    }
    else if (currentTextCode == 2028)
    {
        self.layer.spriteOddIsTalking = YES;
        [self showText:1956];
        return;
    }
    
    if (willEnableTouch) {
        [self.layer enableTouch];
    }
    return;
}



-(void) updateDPad
{
    if (self.isInMotion)
    {
        return;
    }
    if (!self.layer.doneMove)
        return;
    if (self.textPresent)
        return;
    CGPoint playerPos = layer.guy.position;
    BOOL command = NO;
    if ([[dPad getButton:8]isSelected]) 
	{
		playerPos.y += layer.theHKMap.tileSize.width;
        self.layer.spriteOrientation = 2;
        command = YES;
	}
	if ([[dPad getButton:2]isSelected]) 
	{
        if (!command)
        {
		playerPos.y -= layer.theHKMap.tileSize.width;
        self.layer.spriteOrientation = 1;
        command = YES;
        }
	}
	if ([[dPad getButton:6]isSelected]) 
	{
        if (!command)
        {
		playerPos.x += layer.theHKMap.tileSize.width;
        self.layer.spriteOrientation = 3;
        command = YES;
        }
	}
	if ([[dPad getButton:4]isSelected]) 
	{
        if (!command)
        {
		playerPos.x -= layer.theHKMap.tileSize.width;
        self.layer.spriteOrientation = 4;
        command = YES;
        }
	}
    if (!command)
        return;
    if ((playerPos.x <= (layer.theHKMap.mapSize.width * layer.theHKMap.tileSize.width)) && (playerPos.y <= (layer.theHKMap.mapSize.height * layer.theHKMap.tileSize.height)) && (playerPos.y >= 0) && (playerPos.x >= 0))
    {
        layer.isBeingTouched = YES;
        isInMotion = YES;
        [layer dsetPlayerPosition: playerPos];
    }
}


-(void)animateHero
{
    if (self.layer.spriteOrientation == 1)
    {
        id actionMove2;
        
        if (self.layer.lastRight)
        {
            self.layer.lastRight = NO;
            actionMove2 = [CCAnimate actionWithAnimation:heroWalkDown restoreOriginalFrame:NO];
        }
        else
        {
            self.layer.lastRight = YES;
            actionMove2 = [CCAnimate actionWithAnimation:heroWalkDown2 restoreOriginalFrame:NO];
        }
        
        [self.spriteHero runAction:actionMove2];
        return;
    }
    
    if (self.layer.spriteOrientation == 2)
    {
        id actionMove2;
        
        if (self.layer.lastRight)
        {
            self.layer.lastRight = NO;
            actionMove2 = [CCAnimate actionWithAnimation:heroWalkUp restoreOriginalFrame:NO];
        }
        else
        {
            self.layer.lastRight = YES;
            actionMove2 = [CCAnimate actionWithAnimation:heroWalkUp2 restoreOriginalFrame:NO];
        }
        
        [self.spriteHero runAction:actionMove2];
        return;
    }
    
    if (self.layer.spriteOrientation == 3)
    {
        id actionMove2 = [CCAnimate actionWithAnimation:heroWalkRight restoreOriginalFrame:NO];
        
        [self.spriteHero runAction:actionMove2];
        return;
    }
    
    if (self.layer.spriteOrientation == 4)
    {
        id actionMove2 = [CCAnimate actionWithAnimation:heroWalkLeft restoreOriginalFrame:NO];
        
        [self.spriteHero runAction:actionMove2];
        return;
    }
}

-(void) updateSprite
{
    if (self.layer.spriteOrientation == 1)
    {
        [self.spriteHero setDisplayFrame:[[heroWalkDown frames] objectAtIndex:0]];
    }
    
    if (self.layer.spriteOrientation == 2)
    {
        [self.spriteHero setDisplayFrame:[[heroWalkUp frames] objectAtIndex:0]];
    }
    
    if (self.layer.spriteOrientation == 3)
    {
        [self.spriteHero setDisplayFrame:[[heroWalkRight frames] objectAtIndex:0]];    
    }
    
    if (self.layer.spriteOrientation == 4)
    {
        [self.spriteHero setDisplayFrame:[[heroWalkLeft frames] objectAtIndex:0]];
    }
}


-(void)updateHealth
{
    [self removeChildByTag:24 cleanup:YES];
    MyHero* hero1 = [GameSceneManager sharedGameSceneManager].hero;
    
    CGSize winSize = [[CCDirector sharedDirector] winSize];
    CCLabelTTF *label3 = [CCLabelTTF labelWithString:[NSString stringWithFormat:@"%d/%d", hero1.heroCurrentHP, hero1.heroHP] dimensions: CGSizeMake(160, 32) alignment:UITextAlignmentLeft fontName:@"Optima-Bold" fontSize:22.0];
    label3.position = ccp(winSize.width/2 - 124, winSize.height - 22);
    label3.color = ccc3(255, 255, 255);
    [self addChild: label3 z:15 tag:24];
    return;
}









@end




