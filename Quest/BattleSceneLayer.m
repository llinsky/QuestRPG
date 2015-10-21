//
//  BattleSceneLayer.m
//  Quest
//
//  Created by Leo Linsky on 3/17/12.
//  Copyright 2012 __MyCompanyName__. All rights reserved.
//

/*

#import "BattleSceneLayer.h"


@implementation BattleSceneLayer

@synthesize battleID;

@synthesize enemy;
@synthesize hero;
@synthesize battleIsStillGoing;
@synthesize battleCycleStatus;
@synthesize textPresent;
@synthesize battleCycleBusy;
@synthesize heroMoveCode;
@synthesize canTouchButtons;
@synthesize itemUseCode;

@synthesize enemyAttackID;
@synthesize textCanCycle;
@synthesize tempDamageDealt;


-(id) init
{
	
	if ((self = [super init])) {
		
        self.hero = [GameSceneManager sharedGameSceneManager].hero;
        CGSize winSize = [[CCDirector sharedDirector] winSize];
        
        self.textPresent = NO;
        self.battleCycleBusy = NO;
        
        if (hero.heroAtkStyle)
        {
            self.heroMoveCode = self.hero.heroAtkStyle;
        }
        else
        {
            heroMoveCode = 0;
        }
        self.canTouchButtons = YES;
        
        
		CCMenuItemImage *backToGame = [CCMenuItemImage itemFromNormalImage:@"back_button.png" selectedImage:@"back_button_down.png" target:self selector:@selector(goBackGame:)];
		CCMenu *menu = [CCMenu menuWithItems:backToGame, nil];
		menu.position = ccp(winSize.width - 60, winSize.height - 25);
		[menu alignItemsVerticallyWithPadding: 12.0f];
		[self addChild:menu z:2];
        
        self.battleCycleStatus = 0;
        

        
        CCMenuItemImage *attackButton = [CCMenuItemImage itemFromNormalImage:@"credits_button.png" selectedImage:@"credits_button_down.png" target:self selector: @selector(onAttack)];
		CCMenu *penu = [CCMenu menuWithItems:attackButton, nil];
		penu.position = ccp(340, 100);
		[self addChild:penu z:6 tag:101];
        
        
        aggr = [CCMenuItemImage itemFromNormalImage:@"credits_button.png" selectedImage:@"credits_button_down.png" target:self selector:@selector(onAggressive)];
		quick = [CCMenuItemImage itemFromNormalImage:@"credits_button.png" selectedImage:@"credits_button_down.png" target:self selector:@selector(onQuick)];
		def = [CCMenuItemImage itemFromNormalImage:@"credits_button.png" selectedImage:@"credits_button_down.png" target:self selector: @selector(onDefensive)];
        if (heroMoveCode == 0)
        {
            [aggr selected];
        }
        else if (heroMoveCode == 1)
            [quick selected];
        else if (heroMoveCode == 2)
            [def selected];
    
		
		CCMenu *menu2 = [CCMenu menuWithItems:aggr, quick, def, nil];
		menu2.position = ccp(winSize.width - 15, winSize.height/2 - 50);
		[menu2 alignItemsVerticallyWithPadding: 5.0f];
		[self addChild:menu2 z:400];
        
        
    
    
        self.canTouchButtons = NO;
        willAttack = YES;
        self.textCanCycle = NO;
         
        [self schedule:@selector(gameLoop:) interval:1/60.0f];
        [self performSelector:@selector(scheduleBattleCycle) withObject:nil afterDelay:0.2];
	}
	
	return self;
}

-(void) scheduleBattleCycle
{
    [self schedule:@selector(battleCycle) interval:1.0f];
}


-(void) goBackGame: (id)sender
{
    if (!self.canTouchButtons)
        return;
    [GameSceneManager sharedGameSceneManager].hero = self.hero;
    [MusicHandler playButtonClick];
    [SceneManager goPlay];
}


-(void) startBattle: (int) battleSceneID
{
    self.battleIsStillGoing = TRUE;
    battleID = battleSceneID;
    
    
    
    
    
    CGSize winSize = [[CCDirector sharedDirector] winSize];
    

    
    CCSprite *textBack = [CCSprite spriteWithFile: @"pinktemp2.png"];
    textBack.position = ccp(160, winSize.height/2 - 125);
    [self addChild:textBack z:4];
    
    heroSprite = [CCSprite spriteWithFile: @"guysprite08.png"];
    heroSprite.position = ccp(winSize.width/4, winSize.height/2 - 60);
    [self addChild:heroSprite z:3];
    
    
    
    
    if (battleID == 0)
    {
        CGSize winSize = [[CCDirector sharedDirector] winSize];
		
        CCSprite *background = [CCSprite spriteWithFile: @"generic_background.png"];
        background.position = ccp(winSize.width/2, winSize.height/2);
        [self addChild:background z:0];
        
        Monster *enemy0 = [[Monster alloc] init];
        
        
        int rando1 = (int) arc4random()%5;
        int rando2 = (int) arc4random()%4;


        enemy0.monsterRewardGold = 2 + rando1 + rando2;
        enemy0.name = @"Imp";
        enemy0.imageFile = @"ash2.png";
        enemy0.monsterStr = 6 + rando2;
        enemy0.monsterStrDef = 5 + rando2;
        enemy0.monsterMag = 5 + rando2;
        enemy0.monsterSpeed = 6 + rando2;
        
        enemy0.monsterLvl = MAX(1, rando2);
        enemy0.monsterHP = 17 + rando1*rando2;
        enemy0.monsterSkills = nil;
        enemy0.monsterExperience = 5 + 2*rando2;
        enemy0.monsterRewardItem = nil;
        enemy0.monsterCurrentHP = enemy0.monsterHP;
        
        self.enemy = enemy0;  
        [enemy0 release];
        

        
        enemySprite = [CCSprite spriteWithFile:self.enemy.imageFile];
        enemySprite.position = ccp(winSize.width/2, winSize.height/2);
        [self addChild:enemySprite];
		
        
    }
    if (battleID == 1)
    {
        CGSize winSize = [[CCDirector sharedDirector] winSize];
		
        CCSprite *background = [CCSprite spriteWithFile: @"generic_background.png"];
        background.position = ccp(winSize.width/2, winSize.height/2);
        [self addChild:background z:0];
        
        Monster *enemy0 = [[Monster alloc] init];
        
        
        int rando1 = (int) arc4random()%5;
        int rando2 = (int) arc4random()%4;
        
        
        enemy0.monsterRewardGold = 2 + rando1 + rando2;
        enemy0.name = @"Wild Imp";
        enemy0.imageFile = @"ash2.png";
        enemy0.monsterStr = 6 + rando2;
        enemy0.monsterStrDef = 5 + rando2;
        enemy0.monsterMag = 5 + rando2;
        enemy0.monsterSpeed = 6 + rando2;
        
        enemy0.monsterLvl = MAX(1, rando2);
        enemy0.monsterHP = 17 + rando1*rando2;
        enemy0.monsterSkills = nil;
        enemy0.monsterExperience = 5 + 2*rando2;
        enemy0.monsterRewardItem = nil;
        enemy0.monsterCurrentHP = enemy0.monsterHP;
        
        self.enemy = enemy0;  
        [enemy0 release];
        
        

        
        enemySprite = [CCSprite spriteWithFile:self.enemy.imageFile];
        enemySprite.position = ccp(winSize.width/2, winSize.height/2);
        [self addChild:enemySprite];
		
    }
    
    

    self.battleCycleStatus = 1;
    [self battleCycle];
}

-(void) battleCycle
{
    if (self.battleCycleBusy)
        return;
    
    if (!battleIsStillGoing)
    {
        return;
    }
    

    if (self.battleCycleStatus == 1)
    {
        if (0 <= battleID <=5)
        {
            NSString *string = [NSString stringWithFormat:@"%@ appeared!",self.enemy.name]; 
        
            CGSize size = [[CCDirector sharedDirector] winSize];
            textBoxLayer = [[TextBoxLayer alloc] initWithColor:[UIColor grayColor] width: 320 height:60 padding:10 text:string];
            textBoxLayer.position =  ccp(-5, size.height/2 - 160);
            textBoxLayer.delegate = self;
        
            [self addChild:textBoxLayer z:INT_MAX];
        
            self.textPresent = YES;
            self.textCanCycle = YES;
            self.battleCycleBusy = YES;
        }
    }
    
    if (self.battleCycleStatus == 2)
    {

        self.canTouchButtons = YES;
        self.battleCycleBusy = YES;
    }
    
    if (self.battleCycleStatus == 3)
    {
        //[self removeChildByTag:101 cleanup:YES];
        self.canTouchButtons = NO;
        
        int rando00;
        if (heroMoveCode == 1)
            rando00 = 1.0;
        else if (heroMoveCode == 2)
            rando00 = 1.4;
        else if (heroMoveCode == 3)
            rando00 = 0.9;
        
        int enemyTempSpeed = enemy.monsterSpeed;
        int heroTempSpeed = rando00*hero.heroSPD;
        
        if (!willAttack)
        {
            
        }
        else
        {
            
            enemyTempSpeed = (int) (enemyTempSpeed + enemyTempSpeed*0.04*(arc4random()%10) - enemyTempSpeed*0.03*(arc4random()%10));
            
            if (enemyTempSpeed > 5*heroTempSpeed)
            {
                int rand1 = arc4random()%10;
                if (rand1 > 7)
                {
                    heroMissed = FALSE;
                }
                else
                {
                    heroMissed = TRUE;
                }
                monsterMissed = FALSE;
                heroMovesFirst = NO;
            }
            else if (enemyTempSpeed > 2*heroTempSpeed)
            {
                int rand2 = arc4random()%10;
                if (rand2 > 4)
                {
                    heroMissed = FALSE;
                }
                else
                {
                    heroMissed = TRUE;
                }
                monsterMissed = FALSE;
                heroMovesFirst = NO;
            }
            else if (enemyTempSpeed > heroTempSpeed)
            {
                int rand3 = arc4random()%14;
                if (rand3 > 1)
                {
                    heroMissed = FALSE;
                }
                else
                {
                    heroMissed = TRUE;
                }
                monsterMissed = FALSE;
                heroMovesFirst = NO;
            }
            else if (enemyTempSpeed*5 < heroTempSpeed)
            {
                int rand4 = arc4random()%12;
                if (rand4 > 9)
                {
                    monsterMissed = FALSE;
                }
                else
                {
                    monsterMissed = TRUE;
                }
                heroMissed = FALSE;
                heroMovesFirst = YES;
            }
            else if (enemyTempSpeed*2 < heroTempSpeed)
            {
                int rand4 = arc4random()%10;
                if (rand4 > 5)
                {
                    monsterMissed = FALSE;
                }
                else
                {
                    monsterMissed = TRUE;
                }
                heroMissed = FALSE;
                heroMovesFirst = YES;
            }
            else if (enemyTempSpeed <= heroTempSpeed)
            {
                int rand4 = arc4random()%10;
                if (rand4 > 1)
                {
                    monsterMissed = FALSE;
                }
                else
                {
                    monsterMissed = TRUE;
                }
                heroMissed = FALSE;
                heroMovesFirst = YES;
            }
            
            if (heroMissed)
            {
                if (0 <= battleID <=5)
                {
                    
                    int r1 = arc4random()%2;
                    if (r1 == 0)
                    {
                        enemyAttackID = 1;
                        
                        int r2 = 71 + arc4random()%30;
                        int r3 = 71 + arc4random()%30;
                        
                        int rando02;
                        if (heroMoveCode == 1)
                            rando02 = 1.0;
                        else if (heroMoveCode == 2)
                            rando02 = 1.0;
                        else if (heroMoveCode == 3)
                            rando02 = 1.4;
                        
                        int calc1 = enemy.monsterStr*r2/100;
                        int calc2 = (hero.heroStrDef * rando02 * hero.defMult + hero.defBonus)*r3/100 + (hero.heroSPD * hero.aglMult + hero.aglBonus)/5;
                        
                        int enemyDamageDealt = (calc1*calc1*2)/(calc2*calc2) + 1;
                        NSString *string;
                        
                        self.hero.heroCurrentHP -= enemyDamageDealt;
                        if (self.hero.heroCurrentHP <= 0)
                        {
                            self.battleIsStillGoing = NO;
                            string = [NSString stringWithFormat:@"%@ attacked! You took %d damage. You have died!",self.enemy.name, enemyDamageDealt];
                        }
                        else
                        {
                            string = [NSString stringWithFormat:@"%@ attacked! %@ took %d damage.",self.enemy.name, self.hero.heroName, enemyDamageDealt]; 
                        }
                        

                        
                        CGSize size = [[CCDirector sharedDirector] winSize];
                        textBoxLayer = [[TextBoxLayer alloc] initWithColor:[UIColor grayColor] width: 320 height:60 padding:10 text:string];
                        textBoxLayer.position =  ccp(-5, size.height/2 - 160);
                        textBoxLayer.delegate = self;
                        
                        [self addChild:textBoxLayer z:INT_MAX];
                        
                        
                        [self performSelector:@selector(heroGetsAttacked1) withObject:nil afterDelay:0.2];
                        
                        
                        self.textPresent = YES;
                        self.battleCycleBusy = YES;
                    }
                    else
                    {
                        enemyAttackID = 2;
                        
                        int r2 = 71 + arc4random()%30;
                        int r3 = 71 + arc4random()%30;
                        
                        int calc1 = enemy.monsterStr*r2/100;
                        int calc2 = (hero.heroStrDef * hero.defMult + hero.defBonus)*r3/100 + (hero.heroSPD * hero.aglMult + hero.aglBonus)/5;
                        
                        int enemyDamageDealt = (calc1*calc1*2)/(calc2*calc2) + 1;
                        NSString *string;
                        
                        self.hero.heroCurrentHP -= enemyDamageDealt;
                        if (self.hero.heroCurrentHP <= 0)
                        {
                            self.battleIsStillGoing = NO;
                            string = [NSString stringWithFormat:@"%@ attacked! You took %d damage. You have died!",self.enemy.name, enemyDamageDealt];
                        }
                        else
                        {
                            string = [NSString stringWithFormat:@"%@ attacked! You took %d damage.",self.enemy.name, enemyDamageDealt]; 
                        }
                        
                        
                        
                        CGSize size = [[CCDirector sharedDirector] winSize];
                        textBoxLayer = [[TextBoxLayer alloc] initWithColor:[UIColor grayColor] width: 320 height:60 padding:10 text:string];
                        textBoxLayer.position =  ccp(-5, size.height/2 - 160);
                        textBoxLayer.delegate = self;
                        
                        [self addChild:textBoxLayer z:INT_MAX];
                        
                        
                        [self performSelector:@selector(heroGetsAttacked1) withObject:nil afterDelay:0.2];
                        
                        
                        self.textPresent = YES;
                        self.battleCycleBusy = YES;
                    }

                }
            }
            else if (monsterMissed)
            {
                if (0 <= battleID <=5)
                {
                    int rando01;
                    if (heroMoveCode == 1)
                        rando01 = 1.4;
                    else if (heroMoveCode == 2)
                        rando01 = 1.1;
                    else if (heroMoveCode == 3)
                        rando01 = 0.9;
                        
                        
                    int r2 = 71 + arc4random()%30;
                    int r3 = 71 + arc4random()%30;
                    
                    int calc1 = (hero.heroStr*hero.strMult + hero.strBonus)*r2/100 + (hero.heroSPD * hero.aglMult + hero.aglBonus)/5;
                    int calc2 = (enemy.monsterStrDef * r3/100);
                    
                    int heroDamageDealt = (calc1*calc1*2)/(calc2*calc2) + 1;
                    NSString *string;
                    
                    enemy.monsterCurrentHP -= heroDamageDealt;
                    if (enemy.monsterCurrentHP <= 0)
                    {
                        self.battleIsStillGoing = NO;
                        string = [NSString stringWithFormat:@"You attacked! You dealt %d damage. You have won!", heroDamageDealt];
                    }
                    else
                    {
                        string = [NSString stringWithFormat:@"You attacked! You dealt %d damage.", heroDamageDealt]; 
                    }
                    CGSize size = [[CCDirector sharedDirector] winSize];
                    textBoxLayer = [[TextBoxLayer alloc] initWithColor:[UIColor grayColor] width: 320 height:60 padding:10 text:string];
                    textBoxLayer.position =  ccp(-5, size.height/2 - 160);
                    textBoxLayer.delegate = self;
                    
                    [self addChild:textBoxLayer z:INT_MAX];
                    
                    
                    [self performSelector:@selector(enemyGetsAttacked1) withObject:nil afterDelay:0.2];
                    
                    
                    self.textPresent = YES;
                    self.battleCycleBusy = YES;
                        
                        
                }
                    
            }
            else if (heroMovesFirst)
            {
                if (0 <= battleID <=5)
                {
                    int rando01;
                    if (heroMoveCode == 1)
                        rando01 = 1.4;
                    else if (heroMoveCode == 2)
                        rando01 = 1.1;
                    else if (heroMoveCode == 3)
                        rando01 = 0.9;
                    
                    
                    int r2 = 71 + arc4random()%30;
                    int r3 = 71 + arc4random()%30;
                    
                    int calc1 = (hero.heroStr*hero.strMult + hero.strBonus)*r2/100 + (hero.heroSPD * hero.aglMult + hero.aglBonus)/5;
                    int calc2 = (enemy.monsterStrDef * r3/100);
                    
                    int heroDamageDealt = (calc1*calc1*2)/(calc2*calc2) + 1;
                    
                    int r1 = arc4random()%2;
                    if (r1 == 0)
                    {
                        enemyAttackID = 1;
                        
                        int r4 = 71 + arc4random()%30;
                        int r5 = 71 + arc4random()%30;
                        
                        int rando02;
                        if (heroMoveCode == 1)
                            rando02 = 1.0;
                        else if (heroMoveCode == 2)
                            rando02 = 1.0;
                        else if (heroMoveCode == 3)
                            rando02 = 1.4;
                        
                        int calc3 = enemy.monsterStr*r4/100;
                        int calc4 = (hero.heroStrDef * rando02 * hero.defMult + hero.defBonus)*r5/100 + (hero.heroSPD * hero.aglMult + hero.aglBonus)/5;
                        
                        int enemyDamageDealt = (calc3*calc3*2)/(calc4*calc4) + 1;
                        
                        enemy.monsterCurrentHP -= heroDamageDealt;
                        NSString *string1;
                        if (enemy.monsterCurrentHP <= 0)
                        {
                            self.battleIsStillGoing = NO;
                            string1 = [NSString stringWithFormat:@"You attacked! You dealt %d damage. You have won!", heroDamageDealt];
                        }
                        else
                        {
                            string1 = [NSString stringWithFormat:@"You attacked! You dealt %d damage.", heroDamageDealt]; 
                        }
                        CGSize size = [[CCDirector sharedDirector] winSize];
                        textBoxLayer = [[TextBoxLayer alloc] initWithColor:[UIColor grayColor] width: 320 height:60 padding:10 text:string1];
                        textBoxLayer.position =  ccp(-5, size.height/2 - 160);
                        textBoxLayer.delegate = self;
                        [self addChild:textBoxLayer z:INT_MAX];
                        
                        
                        [self bothHeroFirstAttack1:enemyDamageDealt];
                        
                        
                        self.battleCycleBusy = YES;
                    }
                    else
                    {
                        enemyAttackID = 2;
                        
                        int r4 = 71 + arc4random()%30;
                        int r5 = 71 + arc4random()%30;
                        
                        int rando02;
                        if (heroMoveCode == 1)
                            rando02 = 1.0;
                        else if (heroMoveCode == 2)
                            rando02 = 1.0;
                        else if (heroMoveCode == 3)
                            rando02 = 1.4;
                        
                        int calc3 = enemy.monsterStr*r4/100;
                        int calc4 = (hero.heroStrDef * rando02 * hero.defMult + hero.defBonus)*r5/100 + (hero.heroSPD * hero.aglMult + hero.aglBonus)/5;
                        
                        int enemyDamageDealt = (calc3*calc3*2)/(calc4*calc4) + 1;
                        
                        enemy.monsterCurrentHP -= heroDamageDealt;
                        NSString *string1;
                        if (enemy.monsterCurrentHP <= 0)
                        {
                            self.battleIsStillGoing = NO;
                            string1 = [NSString stringWithFormat:@"You attacked! You dealt %d damage. You have won!", heroDamageDealt];
                        }
                        else
                        {
                            string1 = [NSString stringWithFormat:@"You attacked! You dealt %d damage.", heroDamageDealt]; 
                        }
                        CGSize size = [[CCDirector sharedDirector] winSize];
                        textBoxLayer = [[TextBoxLayer alloc] initWithColor:[UIColor grayColor] width: 320 height:60 padding:10 text:string1];
                        textBoxLayer.position =  ccp(-5, size.height/2 - 160);
                        textBoxLayer.delegate = self;
                        [self addChild:textBoxLayer z:INT_MAX];
                        
                        
                        [self bothHeroFirstAttack1:enemyDamageDealt];
                        
                        
                        self.battleCycleBusy = YES;
                    }
                    
                    
                    
                    
                }
                
                
                
                
            }
            else if (!heroMovesFirst)
            {
                if (0 <= battleID <=5)
                {
                    int rando01;
                    if (heroMoveCode == 1)
                        rando01 = 1.4;
                    else if (heroMoveCode == 2)
                        rando01 = 1.1;
                    else if (heroMoveCode == 3)
                        rando01 = 0.9;
                    
                    
                    int r2 = 71 + arc4random()%30;
                    int r3 = 71 + arc4random()%30;
                    
                    int calc1 = (hero.heroStr*hero.strMult + hero.strBonus)*r2/100 + (hero.heroSPD * hero.aglMult + hero.aglBonus)/5;
                    int calc2 = (enemy.monsterStrDef * r3/100);
                    
                    int heroDamageDealt = (calc1*calc1*2)/(calc2*calc2) + 1;
                    
                    int r1 = arc4random()%2;
                    if (r1 == 0)
                    {
                        enemyAttackID = 1;
                        
                        int r4 = 71 + arc4random()%30;
                        int r5 = 71 + arc4random()%30;
                        
                        int rando02;
                        if (heroMoveCode == 1)
                            rando02 = 1.0;
                        else if (heroMoveCode == 2)
                            rando02 = 1.0;
                        else if (heroMoveCode == 3)
                            rando02 = 1.4;
                        
                        int calc3 = enemy.monsterStr*r4/100;
                        int calc4 = (hero.heroStrDef * rando02 * hero.defMult + hero.defBonus)*r5/100 + (hero.heroSPD * hero.aglMult + hero.aglBonus)/5;
                        
                        int enemyDamageDealt = (calc3*calc3*2)/(calc4*calc4) + 1;
                        
                        hero.heroCurrentHP -= enemyDamageDealt;
                        NSString *string1;
                        if (self.hero.heroCurrentHP <= 0)
                        {
                            self.battleIsStillGoing = NO;
                            string1 = [NSString stringWithFormat:@"%@ attacked! You took %d damage. You have died!",self.enemy.name, enemyDamageDealt];
                        }
                        else
                        {
                            string1 = [NSString stringWithFormat:@"%@ attacked! You took %d damage.",self.enemy.name, enemyDamageDealt]; 
                        }
                        CGSize size = [[CCDirector sharedDirector] winSize];
                        textBoxLayer = [[TextBoxLayer alloc] initWithColor:[UIColor grayColor] width: 320 height:60 padding:10 text:string1];
                        textBoxLayer.position =  ccp(-5, size.height/2 - 160);
                        textBoxLayer.delegate = self;
                        [self addChild:textBoxLayer z:INT_MAX];
                        
                        
                        [self bothHeroLastAttack1:heroDamageDealt];
                        
                        
                        self.battleCycleBusy = YES;
                    }
                    else
                    {
                        enemyAttackID = 2;
                        
                        int r4 = 71 + arc4random()%30;
                        int r5 = 71 + arc4random()%30;
                        
                        int rando02;
                        if (heroMoveCode == 1)
                            rando02 = 1.0;
                        else if (heroMoveCode == 2)
                            rando02 = 1.0;
                        else if (heroMoveCode == 3)
                            rando02 = 1.4;
                        
                        int calc3 = enemy.monsterStr*r4/100;
                        int calc4 = (hero.heroStrDef * rando02 * hero.defMult + hero.defBonus)*r5/100 + (hero.heroSPD * hero.aglMult + hero.aglBonus)/5;
                        
                        int enemyDamageDealt = (calc3*calc3*2)/(calc4*calc4) + 1;
                        
                        enemy.monsterCurrentHP -= heroDamageDealt;
                        NSString *string1;
                        if (enemy.monsterCurrentHP <= 0)
                        {
                            self.battleIsStillGoing = NO;
                            string1 = [NSString stringWithFormat:@"You attacked! You dealt %d damage. You have won!", heroDamageDealt];
                        }
                        else
                        {
                            string1 = [NSString stringWithFormat:@"You attacked! You dealt %d damage.", heroDamageDealt]; 
                        }
                        CGSize size = [[CCDirector sharedDirector] winSize];
                        textBoxLayer = [[TextBoxLayer alloc] initWithColor:[UIColor grayColor] width: 320 height:60 padding:10 text:string1];
                        textBoxLayer.position =  ccp(-5, size.height/2 - 160);
                        textBoxLayer.delegate = self;
                        [self addChild:textBoxLayer z:INT_MAX];
                        
                        
                        [self bothHeroFirstAttack1:enemyDamageDealt];
                        
                        
                        self.battleCycleBusy = YES;
                    }
                    
                    
                    
                    
                }
                
                
                
                
                
                
            }
            
        } 
        
    }
    
    if (self.battleCycleStatus == 4)
    {
        self.battleCycleBusy = YES;
    }
    
    
}


-(void) bothHeroFirstAttack1:(int)enemyDamageDone
{
    [MusicHandler playButtonClick];
    [enemySprite setTexture:nil];
    tempDamageDealt = enemyDamageDone;
    [self performSelector:@selector(bothHeroFirstAttack3) withObject:nil afterDelay:0.08];
    
}
-(void) bothHeroFirstAttack2
{
    if (!self.battleIsStillGoing)
    {
        return;
    }
    NSString *string;
    self.hero.heroCurrentHP -= tempDamageDealt;
    if (self.hero.heroCurrentHP <= 0)
    {
        self.battleIsStillGoing = NO;
        string = [NSString stringWithFormat:@"%@ attacked! You took %d damage. You have died!",self.enemy.name, tempDamageDealt];
    }
    else
    {
        string = [NSString stringWithFormat:@"%@ attacked! You took %d damage.",self.enemy.name, tempDamageDealt]; 
    }
    CGSize size = [[CCDirector sharedDirector] winSize];
    textBoxLayer = [[TextBoxLayer alloc] initWithColor:[UIColor grayColor] width: 320 height:60 padding:10 text:string];
    textBoxLayer.position =  ccp(-5, size.height/2 - 160);
    textBoxLayer.delegate = self;
    
    [self addChild:textBoxLayer z:INT_MAX];
    if (battleIsStillGoing)
    {
        [MusicHandler playButtonClick];
        [heroSprite setTexture:nil];
        [self performSelector:@selector(bothHeroFirstAttack4) withObject:nil afterDelay:0.08];
    }
}

-(void) bothHeroFirstAttack3
{
    [enemySprite setTexture:[[CCTextureCache sharedTextureCache] addImage:self.enemy.imageFile]];
    [self performSelector:@selector(bothHeroFirstAttack2) withObject:nil afterDelay:0.6];
}
-(void) bothHeroFirstAttack4
{
    [heroSprite setTexture:[[CCTextureCache sharedTextureCache] addImage:@"guysprite08.png"]];
}




-(void) bothHeroLastAttack1:(int)heroDamageDone
{
    [MusicHandler playButtonClick];
    [heroSprite setTexture:nil];
    tempDamageDealt = heroDamageDone;
    [self performSelector:@selector(bothHeroLastAttack3) withObject:nil afterDelay:0.08];
    
}
-(void) bothHeroLastAttack2
{
    if (!self.battleIsStillGoing)
    {
        return;
    }
    NSString *string;
    self.hero.heroCurrentHP -= tempDamageDealt;
    if (self.hero.heroCurrentHP <= 0)
    {
        self.battleIsStillGoing = NO;
        string = [NSString stringWithFormat:@"%@ attacked! You took %d damage. You have died!",self.enemy.name, tempDamageDealt];
    }
    else
    {
        string = [NSString stringWithFormat:@"%@ attacked! You took %d damage.",self.enemy.name, tempDamageDealt]; 
    }
    CGSize size = [[CCDirector sharedDirector] winSize];
    textBoxLayer = [[TextBoxLayer alloc] initWithColor:[UIColor grayColor] width: 320 height:60 padding:10 text:string];
    textBoxLayer.position =  ccp(-5, size.height/2 - 160);
    textBoxLayer.delegate = self;
    
    [self addChild:textBoxLayer z:INT_MAX];
    
    if (battleIsStillGoing)
    {
        [MusicHandler playButtonClick];
        [enemySprite setTexture:nil];
        [self performSelector:@selector(bothHeroLastAttack4) withObject:nil afterDelay:0.08];
    }
}
-(void) bothHeroLastAttack3
{
    [heroSprite setTexture:[[CCTextureCache sharedTextureCache] addImage:@"guysprite08.png"]];
    [self performSelector:@selector(bothHeroLastAttack2) withObject:nil afterDelay:0.6];
}
-(void) bothHeroLastAttack4
{
    [enemySprite setTexture:[[CCTextureCache sharedTextureCache] addImage:self.enemy.imageFile]];
}














-(void) onAttack
{
    
    if (self.hero.heroAtkStyle == 1)
    {
        self.heroMoveCode = 1;
    }
    if (self.hero.heroAtkStyle == 2)
    {
        self.heroMoveCode = 2;
    }
    if (self.hero.heroAtkStyle == 3)
    {
        self.heroMoveCode = 3;
    }
    self.hero.heroAtkStyle = self.heroMoveCode;
    battleCycleStatus++;
    self.battleCycleBusy = NO;
    return;
}

-(void) onEnemy
{
    if (!self.canTouchButtons)
    {
        return;
    }
    else
    {
        [self onAttack];
    }
}


-(void) onAggressive
{
    [aggr selected];
    [quick unselected];
    [def unselected];
    if (heroMoveCode != 0)
        [MusicHandler playButtonClick];
    heroMoveCode = 0;
}
-(void) onQuick
{
    [aggr unselected];
    [quick selected];
    [def unselected];
    if (heroMoveCode != 1)
        [MusicHandler playButtonClick];
    heroMoveCode = 1;
    
}
-(void) onDefensive
{
    [aggr unselected];
    [quick unselected];
    [def selected];
    if (heroMoveCode != 2)
        [MusicHandler playButtonClick];
    heroMoveCode = 2;
}









-(void) heroGetsAttacked1
{
    [MusicHandler playButtonClick];
    [heroSprite setTexture:nil];
    [self performSelector:@selector(heroGetsAttacked2) withObject:nil afterDelay:0.08];
}

-(void) enemyGetsAttacked1
{
    [MusicHandler playButtonClick];
    [enemySprite setTexture:nil];
    [self performSelector:@selector(enemyGetsAttacked2) withObject:nil afterDelay:0.08];
}

-(void) heroGetsAttacked2
{
    [heroSprite setTexture:[[CCTextureCache sharedTextureCache] addImage:@"guysprite08.png"]];
    if (!battleCycleBusy)
    {
        if (self.hero.heroCurrentHP <= 0)
        {
            [self heroDies];
        }
    }
    self.battleCycleBusy = NO;
    
}

-(void) enemyGetsAttacked2
{
    [enemySprite setTexture:[[CCTextureCache sharedTextureCache] addImage:self.enemy.imageFile]];
    self.battleCycleBusy = NO;
}
















    

-(void) battleCycle2: (int)herosMoveCode
{
    
    if (herosMoveCode == 0)
    {
        // Hero uses 'attack 1'
        
        // getHeroMoveCode disappears
        // animation, sounds, text bla bla bla
        // both parties attack, damage is dealt...
        
        
    }
    
    
    
    if (self.battleIsStillGoing)
    {
        [self battleCycle];
    }
    else
    {
        int tempOldExp = self.hero.exp;
        self.hero.exp += self.enemy.monsterExperience;
        self.hero.gold += self.enemy.monsterRewardGold;
        if (self.enemy.monsterRewardItem)
        {
            NSMutableArray *array = [self.hero.heroInventory mutableCopy];
            [array addObject:self.enemy.monsterRewardItem];
            self.hero.heroInventory = array;
        }
        
        
        //Display these accomplishments ^
        
        int oldLvl = [self levelForExp:tempOldExp];
        int newLvl = [self levelForExp:self.hero.exp];
        if (oldLvl != newLvl)
        {
            [self levelFrom:oldLvl ToLevel:newLvl];
        }
        
        [GameSceneManager sharedGameSceneManager].hero = self.hero;
    }
    
    return;
}



-(int) levelForExp:(int)exp
{
    if (exp <= 10)
    {
        return 1;
    }
    if (exp < 25)
    {
        return 2;
    }
    if (exp < 50)
    {
        return 3;
    }
    if (exp < 90)
    {
        return 4;
    }
    if (exp < 150)
    {
        return 5;
    }
    
    return 1;
    
}

-(void) levelFrom:(int)oldLevel ToLevel:(int)newLevel
{
    while (oldLevel < newLevel)
    {
        int plusHP = 4 + (int)sqrt((double) oldLevel) + arc4random()%((int) sqrt((double)oldLevel));
        int plusMP = 1 + (int)sqrt((double) oldLevel)/2 + ((arc4random()%((int) sqrt((double)oldLevel)))/2);
        int plusStr = 4 + (int)sqrt((double) oldLevel) + arc4random()%((int) sqrt((double)oldLevel));
        int plusDef = 4 + (int)sqrt((double) oldLevel) + arc4random()%((int) sqrt((double)oldLevel));
        int plusAgi = 2 + (int)sqrt((double) oldLevel) + arc4random()%((int) sqrt((double)oldLevel));
        int plusMagDef = 3 + (int)sqrt((double) oldLevel) + arc4random()%((int) sqrt((double)oldLevel));
        
        //Display this stuff and add it to hero stats
        
        oldLevel++;
    }
    return;
}


-(void) textBox:(id<TextBox>)tbox didFinishAllTextWithPageCount:(int)pc {
    [self removeChild:textBoxLayer cleanup:YES];
    self.textPresent = NO;
    
    //NSLog([NSString stringWithFormat:@" %d",self.hero.heroCurrentHP]);
    if (self.hero.heroCurrentHP <= 0)
    {
        if (!self.battleCycleBusy)
        {
            [self heroDies];
        }
        //NSLog(@"1");
    }
    else if (self.battleCycleStatus == 3)
    {
        if (battleIsStillGoing)
        {
            self.battleCycleStatus = 2;
        }
        //NSLog(@"2");
    }
    else
    {
        self.battleCycleStatus++;
        //NSLog(@"3");
        //NSLog([NSString stringWithFormat:@" %d",self.battleCycleStatus]);
    }
    
    if ((!battleIsStillGoing) || (self.enemy.monsterHP <= 0))
    {
        [self heroWins];
    }
    
    if (self.textCanCycle)
    {
        self.battleCycleBusy = NO;
        self.textCanCycle = NO;
    }
}



- (void)gameLoop: (ccTime) dT {
    [textBoxLayer update:dT];
}














- (void) ccTouchEnded:(UITouch *)touch withEvent:(UIEvent *)event
{
    
     CGPoint touchLocation = [touch locationInView:[touch view]];
     touchLocation = [[CCDirector sharedDirector] convertToGL:touchLocation];
     touchLocation = [self convertToNodeSpace:touchLocation];
     
     CGPoint playerPos = enemySprite.position;
     CGPoint diff = ccpSub(touchLocation, playerPos);
    double magnitude = sqrt(pow(diff.x,2) + pow(diff.y,2));
    if (magnitude < 40.0)
    {
        //later do an animation (like darken the sprite or something when touched)
        [self onEnemy];
    } 
}


-(void) heroDies
{
    self.hero.position = ccp(0,0);
    self.hero.gold = self.hero.gold * 0.6;
    self.hero.heroCurrentHP = self.hero.heroHP;
    [GameSceneManager sharedGameSceneManager].hero = self.hero;
    [GameSceneManager sharedGameSceneManager].justDied = YES;
    [MusicHandler playButtonClick];
    [SceneManager goPlay];
}

-(void) heroWins
{
    self.hero.gold = self.hero.gold += self.enemy.monsterRewardGold;
    [GameSceneManager sharedGameSceneManager].hero = self.hero;
    [GameSceneManager sharedGameSceneManager].justDied = NO;
    [MusicHandler playButtonClick];
    [SceneManager goPlay];
}






@end

 */
