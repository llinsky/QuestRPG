//
//  BattleEngineLayer.m
//  Quest
//
//  Created by Leo Linsky on 7/15/12.
//  Copyright 2012 __MyCompanyName__. All rights reserved.
//

#import "BattleEngineLayer.h"
#import "CCSendMessages.h"

#define unit_attack 20
#define unit_defense 5
#define unit_agility 10
#define unit_mag 1




@implementation BattleEngineLayer

@synthesize battleIsStillGoing,battleCycleStatus,battleID,enemy,hero,heroMoveCode,canTouchButtons,textPresent;
@synthesize isArenaBattle,isBossBattle;



-(id) init
{
	if ((self = [super init])) {
		
        self.hero = [GameSceneManager sharedGameSceneManager].hero;
        
        CGSize winSize = [[CCDirector sharedDirector] winSize];
		CCMenuItemImage *flee = [CCMenuItemImage itemFromNormalImage:@"back_button.png" selectedImage:@"back_button_down.png" target:self selector:@selector(onFlee)];
		CCMenu *menu = [CCMenu menuWithItems:flee, nil];
		menu.position = ccp(winSize.width - 60, winSize.height - 25);
		[menu alignItemsVerticallyWithPadding: 12.0f];
		[self addChild:menu z:2];
        
        CCMenuItemImage *item = [CCMenuItemImage itemFromNormalImage:@"back_button.png" selectedImage:@"back_button_down.png" target:self selector:@selector(onItem)];
		CCMenu *menu23 = [CCMenu menuWithItems:item, nil];
		menu23.position = ccp(winSize.width - 180, winSize.height - 25);
		[menu23 alignItemsVerticallyWithPadding: 12.0f];
		[self addChild:menu23 z:2];
        
        
        CCMenuItemImage *backToGame = [CCMenuItemImage itemFromNormalImage:@"back_button.png" selectedImage:@"back_button_down.png" target:self selector:@selector(goBackGame:)];
		CCMenu *menu24 = [CCMenu menuWithItems:backToGame, nil];
		menu24.position = ccp(60, winSize.height - 25);
		[menu24 alignItemsVerticallyWithPadding: 12.0f];
		[self addChild:menu24 z:2];
        
        CCMenuItemImage *attackButton = [CCMenuItemImage itemFromNormalImage:@"credits_button.png" selectedImage:@"credits_button_down.png" target:self selector: @selector(onAttack)];
		CCMenu *penu = [CCMenu menuWithItems:attackButton, nil];
		penu.position = ccp(340, 100);
		[self addChild:penu z:6 tag:101];
        
        if (hero.heroAtkStyle)
        {
            self.heroMoveCode = self.hero.heroAtkStyle;
        }
        else
        {
            heroMoveCode = 1;
        }
        aggr = [CCMenuItemImage itemFromNormalImage:@"credits_button.png" selectedImage:@"credits_button_down.png" target:self selector:@selector(onAggressive)];
		quick = [CCMenuItemImage itemFromNormalImage:@"credits_button.png" selectedImage:@"credits_button_down.png" target:self selector:@selector(onQuick)];
		def = [CCMenuItemImage itemFromNormalImage:@"credits_button.png" selectedImage:@"credits_button_down.png" target:self selector: @selector(onDefensive)];
        if (heroMoveCode == 1)
        {
            [aggr selected];
        }
        else if (heroMoveCode == 2)
            [quick selected];
        else if (heroMoveCode == 3)
            [def selected];
		CCMenu *menu2 = [CCMenu menuWithItems:aggr, quick, def, nil];
		menu2.position = ccp(winSize.width - 10, winSize.height/2 - 105);
		[menu2 alignItemsVerticallyWithPadding: 3.0f];
		[self addChild:menu2 z:400];
        
        
        
        
        hpBarCover = [CCSprite spriteWithFile:@"battlesceneback1.png"];
        hpBarCover.position = ccp(winSize.width/2,winSize.height/2);
        [self addChild:hpBarCover z:-1];
        
        int min = 413;
        hpBar = [CCSprite spriteWithFile:@"healthbarwhite1.png"];
        double temp = hero.heroCurrentHP/((double)hero.heroHP);
        int pos = min + 104*temp;
        hpBar.position = ccp(pos,129);
        [self addChild:hpBar z:-2];
        hpLabel = [CCLabelTTF labelWithString:[NSString stringWithFormat:@"%d/%d",hero.heroCurrentHP,hero.heroHP] dimensions:CGSizeMake(80.0, 24.0) alignment:UITextAlignmentRight fontName:@"Optima-Bold" fontSize:13.0];
        hpLabel.color = ccc3(0, 0, 0);
        hpLabel.position = ccp(400,112);
        [self addChild:hpLabel z:40];

        
        self.battleCycleStatus = 0;
        self.canTouchButtons = NO;
        self.textPresent = NO;
        willAttack = YES;
        willFlee = NO;
        willItem = NO;
        
        plusHP = 0;
        plusStr = 0;
        plusDef = 0;
        plusAgi = 0;
        plusFP = 0;
        plusAttrib = 0;
        
        canAttackAgain = YES;

        animationBusy = NO;
        
        inBattleExpMult = 1.0;
        inBattleGoldMult = 1.0;
        
        won = FALSE;
        wonOnCycle = 0;
        
        tempStrMult = 1.0;
        tempDefMult = 1.0;
        tempAgiMult = 1.0;
        
        
        [self schedule:@selector(gameLoop:) interval:1/60.0f];
	}
	return self;
}







-(void) startBattle: (int) battleSceneID
{
    self.battleIsStillGoing = YES;
    self.battleID = battleSceneID;

    
    
    CGSize winSize = [[CCDirector sharedDirector] winSize];
    
    //CCSprite *textBack = [CCSprite spriteWithFile: @"pinktemp2.png"];
    //textBack.position = ccp(160, winSize.height/2 - 125);
    //[self addChild:textBack z:4];
    
    heroSprite = [CCSprite spriteWithFile: @"guysprite08.png"];
    heroSprite.position = ccp(winSize.width/4, winSize.height/2 - 60);
    [self addChild:heroSprite z:3];
    
    
    
    
    if (battleID == 0)
    {
        CGSize winSize = [[CCDirector sharedDirector] winSize];
		
        CCSprite *background = [CCSprite spriteWithFile: @"battlebackstandard.png"];
        background.position = ccp(winSize.width/2, winSize.height/2);
        [self addChild:background z:-3];
        
        Monster *enemy0 = [[Monster alloc] init];
        
        
        int rando1 = arc4random()%2;
        int rando2 = arc4random()%2;
        
        
        enemy0.monsterRewardGold = rando1 + rando2;
        enemy0.name = @"Error";
        enemy0.imageFile = @"monster1sprite03.png";
        enemy0.monsterStr = 65 + rando2;
        enemy0.monsterStrDef = 22 + rando2;
        enemy0.monsterMag = 1 + rando2;
        enemy0.monsterSpeed = 14 + rando2;
        
        enemy0.monsterLvl = MAX(1, rando2);
        enemy0.monsterHP = 87 + rando1 + rando2;
        enemy0.monsterSkills = nil;
        enemy0.monsterExperience = 3 + rando1 + rando2;
        enemy0.monsterRewardItem = 0;
        enemy0.monsterCurrentHP = enemy0.monsterHP;
        enemy0.isBoss = NO;
        
        self.enemy = enemy0;  
        [enemy0 release];
		
        
    }
    else if (battleID == 1)
    {
        CGSize winSize = [[CCDirector sharedDirector] winSize];
		
        CCSprite *background = [CCSprite spriteWithFile: @"battlebackstandard.png"];
        background.position = ccp(winSize.width/2, winSize.height/2);
        [self addChild:background z:-3];
        
        Monster *enemy0 = [[Monster alloc] init];
        
        
        int rando1 = arc4random()%2;
        int rando2 = arc4random()%2;
        
        
        enemy0.monsterRewardGold = rando1 + rando2;
        enemy0.name = @"Imp";
        enemy0.imageFile = @"monster1sprite03.png";
        enemy0.monsterStr = 10*unit_attack + rando2;
        enemy0.monsterStrDef = 5*unit_defense + rando2;
        enemy0.monsterMag = 1*unit_mag + rando2;
        enemy0.monsterSpeed = 14*unit_agility + rando2;
        
        enemy0.monsterLvl = MAX(1, rando2);
        enemy0.monsterHP = 87 + rando1 + rando2;
        enemy0.monsterSkills = nil;
        enemy0.monsterExperience = 3 + rando1 + rando2;
        enemy0.monsterRewardItem = 0;
        enemy0.monsterCurrentHP = enemy0.monsterHP;
        enemy0.isBoss = NO;
        
        self.enemy = enemy0;  
        [enemy0 release];
		
    }
    
    
    
    
    
    
    else if (battleID == 101)
    {
        CGSize winSize = [[CCDirector sharedDirector] winSize];
		
        CCSprite *background = [CCSprite spriteWithFile: @"battlebackstandard.png"];
        background.position = ccp(winSize.width/2, winSize.height/2);
        [self addChild:background z:-3];
        
        Monster *enemy0 = [[Monster alloc] init];        
        
        enemy0.monsterRewardGold = 10;
        enemy0.name = @"Imp";
        enemy0.imageFile = @"boss1sprite03.png";
        enemy0.monsterStr = 16*unit_attack;
        enemy0.monsterStrDef = 10*unit_defense;
        enemy0.monsterMag = 4*unit_mag;
        enemy0.monsterSpeed = 8*unit_agility;
        
        enemy0.monsterLvl = 5;
        enemy0.monsterHP = 47;
        enemy0.monsterSkills = nil;
        enemy0.monsterExperience = 40;
        enemy0.monsterRewardItem = 0;
        enemy0.monsterCurrentHP = enemy0.monsterHP;
        enemy0.isBoss = YES;
        
        self.enemy = enemy0;  
        [enemy0 release];
		
    }
    else if (battleID == 102)
    {
        CGSize winSize = [[CCDirector sharedDirector] winSize];
		
        CCSprite *background = [CCSprite spriteWithFile: @"battlebackstandard.png"];
        background.position = ccp(winSize.width/2, winSize.height/2);
        [self addChild:background z:-3];
        
        Monster *enemy0 = [[Monster alloc] init];
        
        enemy0.monsterRewardGold = 50;
        enemy0.name = @"Cyclops";
        enemy0.imageFile = @"boss2sprite02.png";
        enemy0.monsterStr = 46*unit_attack;
        enemy0.monsterStrDef = 30*unit_defense;
        enemy0.monsterMag = 2*unit_mag;
        enemy0.monsterSpeed = 28*unit_agility;
        
        enemy0.monsterLvl = 5;
        enemy0.monsterHP = 47;
        enemy0.monsterSkills = nil;
        enemy0.monsterExperience = 800;
        enemy0.monsterRewardItem = 0;
        enemy0.monsterCurrentHP = enemy0.monsterHP;
        enemy0.isBoss = YES;
        
        self.enemy = enemy0;
        [enemy0 release];
		
    }
    else
    {
        CGSize winSize = [[CCDirector sharedDirector] winSize];
		
        CCSprite *background = [CCSprite spriteWithFile: @"battlebackstandard.png"];
        background.position = ccp(winSize.width/2, winSize.height/2);
        [self addChild:background z:-3];
        
        Monster *enemy0 = [[Monster alloc] init];
        
        
        int rando1 = arc4random()%2;
        int rando2 = arc4random()%2;
        
        
        enemy0.monsterRewardGold = rando1 + rando2;
        enemy0.name = @"Imp";
        enemy0.imageFile = @"monster1sprite03.png";
        enemy0.monsterStr = 10*unit_attack + rando2;
        enemy0.monsterStrDef = 5*unit_defense + rando2;
        enemy0.monsterMag = 1*unit_mag + rando2;
        enemy0.monsterSpeed = 14*unit_agility + rando2;
        
        enemy0.monsterLvl = MAX(1, rando2);
        enemy0.monsterHP = 87 + rando1 + rando2;
        enemy0.monsterSkills = nil;
        enemy0.monsterExperience = 3 + rando1 + rando2;
        enemy0.monsterRewardItem = 0;
        enemy0.monsterCurrentHP = enemy0.monsterHP;
        enemy0.isBoss = NO;
        
        self.enemy = enemy0;
        [enemy0 release];
    }
    
    
    
    
    
    
    
    enemySprite = [CCSprite spriteWithFile:self.enemy.imageFile];
    enemySprite.position = ccp(winSize.width/2, winSize.height/2);
    [self addChild:enemySprite];
    
    self.battleCycleStatus = 1;
    [self battleCycle];
}








-(void) battleCycle
{
    
    
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
        }
        else if (isBossBattle)
        {
            NSString *string = [NSString stringWithFormat:@"%@ is ready for battle!",self.enemy.name];
            
            CGSize size = [[CCDirector sharedDirector] winSize];
            textBoxLayer = [[TextBoxLayer alloc] initWithColor:[UIColor grayColor] width: 320 height:60 padding:10 text:string];
            textBoxLayer.position =  ccp(-5, size.height/2 - 160);
            textBoxLayer.delegate = self;
            
            [self addChild:textBoxLayer z:INT_MAX];
            
            self.textPresent = YES;
        }
        
    }
    
    
    
    if (self.battleCycleStatus == 2)
    {
        self.canTouchButtons = YES;
        
        /*if (!battleIsStillGoing)
        {
            self.battleCycleStatus = 6;
            [self battleCycle];
        }*/
    }
    
    
    
    
    if (self.battleCycleStatus == 3)
    {
        self.canTouchButtons = NO;
        
        
        
        if (willAttack)
        {
            
            double styleMult;
            if (heroMoveCode == 1)
                styleMult = 1.0;
            else if (heroMoveCode == 2)
                styleMult = 1.4;
            else if (heroMoveCode == 3)
                styleMult = 0.9;
            
            int enemyTempSpeed = enemy.monsterSpeed;
            int heroTempSpeed = (int) (styleMult*(hero.heroSPD+hero.aglBonus)*hero.aglMult + 0.0001);
            
            enemyTempSpeed = (int) (enemyTempSpeed + enemyTempSpeed*0.04*(arc4random()%10) - enemyTempSpeed*0.03*(arc4random()%10));
            
            
            
            
            if (enemyTempSpeed > 7*heroTempSpeed)
            {
                int rand1 = arc4random()%12;
                if (rand1 > 9)
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
            else if (enemyTempSpeed > 5*heroTempSpeed)
            {
                int rand2 = arc4random()%11;
                if (rand2 > 7)
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
            else if (enemyTempSpeed > 3*heroTempSpeed)
            {
                int rand2 = arc4random()%10;
                if (rand2 > 5)
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
            else if (enemyTempSpeed*7 < heroTempSpeed)
            {
                int rand4 = arc4random()%14;
                if (rand4 > 11)
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
            else if (enemyTempSpeed*5 < heroTempSpeed)
            {
                int rand4 = arc4random()%11;
                if (rand4 > 8)
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
            else if (enemyTempSpeed*3 < heroTempSpeed)
            {
                int rand4 = arc4random()%10;
                if (rand4 > 6)
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
            
            //
            //
            //Now, who goes first and who/if anyone has missed is determined.
            //
            //
            
        
            
            if (heroMovesFirst)
            {
                if (heroMissed)
                {
                    NSString *string1 = [NSString stringWithFormat:@"You attacked! %@ dodges your attack.", self.enemy.name];
                    CGSize size = [[CCDirector sharedDirector] winSize];
                    textBoxLayer = [[TextBoxLayer alloc] initWithColor:[UIColor grayColor] width: 320 height:60 padding:10 text:string1];
                    textBoxLayer.position =  ccp(-5, size.height/2 - 160);
                    textBoxLayer.delegate = self;
                    [self addChild:textBoxLayer z:INT_MAX];
                    self.textPresent = YES;
                    //[self performSelector:@selector(textBox:didFinishAllTextWithPageCount:) withObject:nil afterDelay:0.5];
                    
                    return;
                }
                
                double rando01;
                if (heroMoveCode == 1)
                    rando01 = 1.8;
                else if (heroMoveCode == 2)
                    rando01 = 1.2;
                else if (heroMoveCode == 3)
                    rando01 = 0.8;
                
                
                int r2 = 91 + arc4random()%10;
                int r3 = 91 + arc4random()%10;
                
                //++++++++++++++++
                BOOL crit = NO;
                if (self.hero.attrib4)
                {
                    double u = arc4random()%100;
                    if (u >= 70)
                    {
                        crit = YES;
                        u = 2.3;
                    }
                    else
                    {
                        u = 1.0;
                    }
                    rando01 *= u;
                }
                //++++++++++++++++
                
                
                double calc1 = (rando01 * hero.heroStr*((int)sqrt((double)(hero.strMult)))*hero.attribStrMult*tempStrMult + hero.strBonus)*r2/100.0 + (hero.heroSPD * hero.aglMult *hero.attribAgiMult*tempAgiMult + hero.aglBonus)/5;
                double calc2 = (enemy.monsterStrDef * r3/100.0);
                
                
                double temp = calc1/calc2;
                if (temp <= 1)
                    temp = 1;
                int heroDamageDealt = (int) temp;
                
                //
                if (heroDamageDealt >= enemy.monsterCurrentHP)
                {
                    heroDamageDealt = enemy.monsterCurrentHP;
                }
                //
                
                lastDamageDealtByMe = heroDamageDealt;
                
                enemy.monsterCurrentHP -= heroDamageDealt;
                NSString *string2;
                
                
                if (!crit)
                {
                if (enemy.monsterCurrentHP <= 0)
                {
                    self.battleIsStillGoing = NO;
                    
                    won = TRUE;
                    wonOnCycle = self.battleCycleStatus;
                    self.battleCycleStatus = 13;
                    string2 = [NSString stringWithFormat:@"You attacked %@! You dealt %d damage.                                                                                           %@ has been defeated!", self.enemy.name, heroDamageDealt, self.enemy.name];
                    self.textPresent = YES;
                    //[self performSelector:@selector(letTextGoAway) withObject:nil afterDelay:0.6];
                }
                else
                {
                    string2 = [NSString stringWithFormat:@"You attacked %@! You dealt %d damage.", self.enemy.name, heroDamageDealt];
                    self.textPresent = YES;
                }
                CGSize size = [[CCDirector sharedDirector] winSize];
                textBoxLayer = [[TextBoxLayer alloc] initWithColor:[UIColor grayColor] width: 320 height:60 padding:10 text:string2];
                textBoxLayer.position =  ccp(-5, size.height/2 - 160);
                textBoxLayer.delegate = self;
                [self addChild:textBoxLayer z:INT_MAX];  
                //self.textPresent = YES;
                //[self performSelector:@selector(textBox:didFinishAllTextWithPageCount:) withObject:nil afterDelay:0.5];
                [self animateEnemyGetsAttacked];
                }
                else
                {
                    if (enemy.monsterCurrentHP <= 0)
                    {
                        self.battleIsStillGoing = NO;
                        
                        won = TRUE;
                        wonOnCycle = self.battleCycleStatus;
                        self.battleCycleStatus = 13;
                        
                        string2 = [NSString stringWithFormat:@"You hit a critical hit on %@! You dealt %d damage.                                                                                           %@ has been defeated!", self.enemy.name, heroDamageDealt, self.enemy.name];
                        self.textPresent = YES;
                        //[self performSelector:@selector(letTextGoAway) withObject:nil afterDelay:0.6];
                    }
                    else
                    {
                        string2 = [NSString stringWithFormat:@"You hit a critical hit on %@! You dealt %d damage.", self.enemy.name, heroDamageDealt];
                        self.textPresent = YES;
                    }
                    CGSize size = [[CCDirector sharedDirector] winSize];
                    textBoxLayer = [[TextBoxLayer alloc] initWithColor:[UIColor grayColor] width: 320 height:60 padding:10 text:string2];
                    textBoxLayer.position =  ccp(-5, size.height/2 - 160);
                    textBoxLayer.delegate = self;
                    [self addChild:textBoxLayer z:INT_MAX];  
                    //self.textPresent = YES;
                    //[self performSelector:@selector(textBox:didFinishAllTextWithPageCount:) withObject:nil afterDelay:0.5];
                    [self animateEnemyGetsAttacked];
                }
                
                
                return;
            }
            
            if (!heroMovesFirst)
            {
                if (monsterMissed)
                {
                    NSString *string1 = [NSString stringWithFormat:@"%@ attacked! You quickly evade the attack.", self.enemy.name];
                    CGSize size = [[CCDirector sharedDirector] winSize];
                    textBoxLayer = [[TextBoxLayer alloc] initWithColor:[UIColor grayColor] width: 320 height:60 padding:10 text:string1];
                    textBoxLayer.position =  ccp(-5, size.height/2 - 160);
                    textBoxLayer.delegate = self;
                    [self addChild:textBoxLayer z:INT_MAX];
                    self.textPresent = YES;
                    
                    
                    return;
                }
                
                double defStyleMult;
                if (heroMoveCode == 1)
                    defStyleMult = 0.9;
                else if (heroMoveCode == 2)
                    defStyleMult = 1.1;
                else if (heroMoveCode == 3)
                    defStyleMult = 1.6;
                
                int r4 = 91 + arc4random()%10;
                int r5 = 91 + arc4random()%10;
                double calc3 = enemy.monsterStr*r4/100.0;
                double calc4 = (hero.heroStrDef * defStyleMult * ((int)sqrt((double)(hero.defMult))) * hero.attribDefMult * tempDefMult + hero.defBonus)*r5/100.0 + (hero.heroSPD * hero.aglMult * hero.attribAgiMult * tempAgiMult + hero.aglBonus)/5;
                
                
                double temp = calc3/calc4;
                if (temp <= 1)
                {
                    int randy = arc4random()%2;
                    if (randy == 0)
                    {
                        temp = 1;
                    }
                    else
                    {
                        monsterMissed = YES;
                        NSString *string1 = [NSString stringWithFormat:@"%@ attacked! You quickly evade the attack.", self.enemy.name];
                        CGSize size = [[CCDirector sharedDirector] winSize];
                        textBoxLayer = [[TextBoxLayer alloc] initWithColor:[UIColor grayColor] width: 320 height:60 padding:10 text:string1];
                        textBoxLayer.position =  ccp(-5, size.height/2 - 160);
                        textBoxLayer.delegate = self;
                        [self addChild:textBoxLayer z:INT_MAX];
                        self.textPresent = YES;
                        
                        return;
                    }
                }
                
                int enemyDamageDealt = (int) temp;
                
                //
                if (enemyDamageDealt >= hero.heroCurrentHP)
                {
                    enemyDamageDealt = hero.heroCurrentHP;
                }
                //
                
                lastDamageDealtByEnemy = enemyDamageDealt;
                
                int tempCurrentHP = hero.heroCurrentHP;
                [self updateHP:(hero.heroCurrentHP - enemyDamageDealt)];
                tempCurrentHP -= enemyDamageDealt;
                
                
                NSString *string2;
                
                
                
                if (tempCurrentHP <= 0)
                {
                    self.battleIsStillGoing = NO;
                    
                    self.battleCycleStatus = 13;
                    string2 = [NSString stringWithFormat:@"%@ attacked! You took %d damage. You have died!",self.enemy.name, enemyDamageDealt];
                    
                }
                else
                {
                    string2 = [NSString stringWithFormat:@"%@ attacked! You took %d damage.",self.enemy.name, enemyDamageDealt]; 
                }
                CGSize size = [[CCDirector sharedDirector] winSize];
                textBoxLayer = [[TextBoxLayer alloc] initWithColor:[UIColor grayColor] width: 320 height:60 padding:10 text:string2];
                textBoxLayer.position =  ccp(-5, size.height/2 - 160);
                textBoxLayer.delegate = self;
                [self addChild:textBoxLayer z:INT_MAX];
                self.textPresent = YES;
                //[self performSelector:@selector(textBox:didFinishAllTextWithPageCount:) withObject:nil afterDelay:0.5];
                [self animateHeroGetsAttacked];

                
                return;
            }

            
        }
   
        return;
    }
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    if (self.battleCycleStatus == 4)        //weapon
    {
        if (heroMovesFirst)
        {
            
            if (self.hero.equipPos1.itemCode == 74)
            {
                if (!heroMissed)
                {
                    int a;
                    double b,c;
                    b = arc4random()%4;
                    c = (8+b)/10.0;
                    a = (int) (lastDamageDealtByMe*c/10.0);
                    
                    if (a!=0)
                    {
                        if ((hero.heroCurrentHP + a) > hero.heroHP)
                        {
                            a = hero.heroHP-hero.heroCurrentHP;
                        }
                        [self updateHP:(hero.heroCurrentHP + a)];
                        
                        if (a!=0)
                        {
                        NSString *string01 = [NSString stringWithFormat:@"Your Earthen Sword regenerates %d HP.",a];
                        CGSize size = [[CCDirector sharedDirector] winSize];
                        textBoxLayer = [[TextBoxLayer alloc] initWithColor:[UIColor grayColor] width: 320 height:60 padding:10 text:string01];
                        textBoxLayer.position =  ccp(-5, size.height/2 - 160);
                        textBoxLayer.delegate = self;
                        [self addChild:textBoxLayer z:INT_MAX];
                            [self performSelector:@selector(letTextGoAway) withObject:nil afterDelay:0.4];
                            //self.textPresent = YES;
                        return;
                        }
                    }
                
                        
                }
            }
            
            else if (self.hero.equipPos1.itemCode == 78)        
            {                                                   
                if (!heroMissed)
                {
                    int a;
                    double b,c;
                    b = arc4random()%4;
                    c = (8+b)/10.0;
                    a = (int) (lastDamageDealtByMe*c/8.0);
                    
                    if (a!=0)
                    {
                    
                    if (a >= enemy.monsterCurrentHP)
                    {
                        a = enemy.monsterCurrentHP;
                    }
                    
                    enemy.monsterCurrentHP -= a;
                    NSString *string2;
                    if (enemy.monsterCurrentHP <= 0)
                    {
                        self.battleIsStillGoing = NO;
                        
                        won = TRUE;
                        wonOnCycle = self.battleCycleStatus;
                        self.battleCycleStatus = 13;
                        string2 = [NSString stringWithFormat:@"The burn from your Godblade inflicts %d damage on %@.                                                                                           %@ has been defeated!", a, self.enemy.name, self.enemy.name];
                        self.textPresent = YES;
                        //[self performSelector:@selector(letTextGoAway) withObject:nil afterDelay:0.6];
                    }
                    else
                    {
                        string2 = [NSString stringWithFormat:@"The burn of your Godblade inflicts %d damage on %@.", a, self.enemy.name];
                        self.textPresent = YES;
                    }
                    CGSize size = [[CCDirector sharedDirector] winSize];
                    textBoxLayer = [[TextBoxLayer alloc] initWithColor:[UIColor grayColor] width: 320 height:60 padding:10 text:string2];
                    textBoxLayer.position =  ccp(-5, size.height/2 - 160);
                    textBoxLayer.delegate = self;
                    [self addChild:textBoxLayer z:INT_MAX];  
                    [self animateEnemyGetsAttacked];
                        return;
                    }
                    
                }
                
                
            }
            else if (self.hero.equipPos1.itemCode == 81)
            {
                if (!heroMissed)
                {
                    int a;
                    double b,c;
                    b = arc4random()%4;
                    c = (8+b)/10.0;
                    a = (int) (lastDamageDealtByMe*c/6.0);
                    
                    if (a!=0)
                    {
                    
                    if (a >= enemy.monsterCurrentHP)
                    {
                        a = enemy.monsterCurrentHP;
                    }
                    
                    enemy.monsterCurrentHP -= a;
                    NSString *string2;
                    if (enemy.monsterCurrentHP <= 0)
                    {
                        self.battleIsStillGoing = NO;
                        
                        won = TRUE;
                        wonOnCycle = self.battleCycleStatus;
                        self.battleCycleStatus = 13;
                        string2 = [NSString stringWithFormat:@"The burn from Abyssal Fire inflicts %d damage on %@.                                                                                           %@ has been defeated!", a, self.enemy.name, self.enemy.name];
                        self.textPresent = YES;
                        //[self performSelector:@selector(letTextGoAway) withObject:nil afterDelay:0.6];
                    }
                    else
                    {
                        string2 = [NSString stringWithFormat:@"The burn from Abyssal Fire inflicts %d damage on %@.", a, self.enemy.name];
                        self.textPresent = YES;
                    }
                    CGSize size = [[CCDirector sharedDirector] winSize];
                    textBoxLayer = [[TextBoxLayer alloc] initWithColor:[UIColor grayColor] width: 320 height:60 padding:10 text:string2];
                    textBoxLayer.position =  ccp(-5, size.height/2 - 160);
                    textBoxLayer.delegate = self;
                    [self addChild:textBoxLayer z:INT_MAX];  
                    [self animateEnemyGetsAttacked];
                        return;
                    }
                    
                    
                }
                
            }
        }
        self.battleCycleStatus++;
    }
    
    
    if (self.battleCycleStatus == 5)        //amulet
    {
        if (heroMovesFirst)
        {
            if (self.hero.equipPos5.itemCode == 100)
            {
                int a, temp;
                double b,c;
                b = arc4random()%4;
                c = (8+b)/12.0;
                a = (int) (lastDamageDealtByMe*c/10.0);
                
                if (a!=0)
                {
                    if (a >= enemy.monsterCurrentHP)
                    {
                        a = enemy.monsterCurrentHP;
                    }
                    
                    if ((hero.heroCurrentHP + a) > hero.heroHP)
                    {
                        temp = hero.heroHP-hero.heroCurrentHP;
                    }
                    else
                    {
                        temp = a;
                    }
                    
                    self.enemy.monsterCurrentHP -= a;
                    [self updateHP:(hero.heroCurrentHP + temp)];
                    
                    NSString *string02;
                    if (enemy.monsterCurrentHP <= 0)
                    {
                        self.battleIsStillGoing = NO;
                        
                        won = TRUE;
                        wonOnCycle = self.battleCycleStatus;
                        self.battleCycleStatus = 13;
                        string02 = [NSString stringWithFormat:@"Hannibal's Amulet absorbs %d HP from %@ and restores your health by %d HP.                                                                                              %@ has been defeated!", a, self.enemy.name, temp, self.enemy.name];
                        self.textPresent = YES;
                    }
                    else
                    {
                        string02 = [NSString stringWithFormat:@"Hannibal's Amulet absorbs %d HP from %@ and restores your health by %d HP.", a, self.enemy.name, temp];
                        self.textPresent = YES;
                    }
                    CGSize size = [[CCDirector sharedDirector] winSize];
                    textBoxLayer = [[TextBoxLayer alloc] initWithColor:[UIColor grayColor] width: 320 height:60 padding:10 text:string02];
                    textBoxLayer.position =  ccp(-5, size.height/2 - 160);
                    textBoxLayer.delegate = self;
                    [self addChild:textBoxLayer z:INT_MAX];  
                    [self animateEnemyGetsAttacked];
                    return;
                }
                
            }
        }
        
        self.battleCycleStatus++;
    }
    
    
    if (self.battleCycleStatus == 6)        //body
    {
        if (heroMovesFirst)
        {
            
            if (self.hero.equipPos4.itemCode == 125)
            {
                if (!heroMissed)
                {
                    int a;
                    double b,c;
                    b = arc4random()%4;
                    c = (8+b)/10.0;
                    a = (int) (lastDamageDealtByMe*c/9.0);
                    
                    if (a!=0)
                    {
                        if ((hero.heroCurrentHP + a) > hero.heroHP)
                        {
                            a = hero.heroHP-hero.heroCurrentHP;
                        }
                        if (a!=0)
                        {
                        [self updateHP:(hero.heroCurrentHP + a)];
                        
                        NSString *string01 = [NSString stringWithFormat:@"Your Armor of the Forest regenerates %d HP.",a];
                        CGSize size = [[CCDirector sharedDirector] winSize];
                        textBoxLayer = [[TextBoxLayer alloc] initWithColor:[UIColor grayColor] width: 320 height:60 padding:10 text:string01];
                        textBoxLayer.position =  ccp(-5, size.height/2 - 160);
                        textBoxLayer.delegate = self;
                        [self addChild:textBoxLayer z:INT_MAX];
                            [self performSelector:@selector(letTextGoAway) withObject:nil afterDelay:0.4];
                            //self.textPresent = YES;
                        return;
                        }
                    }
                    
                    
                }
            }
            else if (self.hero.equipPos4.itemCode == 142)
            {
                if (!heroMissed)
                {
                    int a;
                    double b,c;
                    b = arc4random()%4;
                    c = (8+b)/10.0;
                    a = (int) (lastDamageDealtByMe*c/4.0);
                    
                    if (a!=0)
                    {
                        if ((hero.heroCurrentHP + a) > hero.heroHP)
                        {
                            a = hero.heroHP-hero.heroCurrentHP;
                        }
                        if (a!=0)
                        {
                        [self updateHP:(hero.heroCurrentHP + a)];
                        
                        NSString *string01 = [NSString stringWithFormat:@"Heart heals you by %d HP.",a];
                        CGSize size = [[CCDirector sharedDirector] winSize];
                        textBoxLayer = [[TextBoxLayer alloc] initWithColor:[UIColor grayColor] width: 320 height:60 padding:10 text:string01];
                        textBoxLayer.position =  ccp(-5, size.height/2 - 160);
                        textBoxLayer.delegate = self;
                        [self addChild:textBoxLayer z:INT_MAX];
                            [self performSelector:@selector(letTextGoAway) withObject:nil afterDelay:0.4];
                            //self.textPresent = YES;
                        return;
                        }
                    }
                    
                    
                }
            }
        }
        else
        {
            if (self.hero.equipPos4.itemCode == 124)
            {
                
                int a;
                double b,c;
                b = arc4random()%4;
                c = (8+b)/10.0;
                a = (int) (lastDamageDealtByEnemy *c/6.0);
                
                if (a!=0)
                {
                    
                    if (a >= enemy.monsterCurrentHP)
                    {
                        a = enemy.monsterCurrentHP;
                    }
                    
                    enemy.monsterCurrentHP -= a;
                    NSString *string2;
                    if (enemy.monsterCurrentHP <= 0)
                    {
                        self.battleIsStillGoing = NO;
                        
                        won = TRUE;
                        wonOnCycle = self.battleCycleStatus;
                        self.battleCycleStatus = 13;
                        string2 = [NSString stringWithFormat:@"%@ is hurt by Woven Diamond - Woven Diamond causes %d damage.                                                                                   %@ has been defeated! ", self.enemy.name, a, self.enemy.name];
                        self.textPresent = YES;
                        //[self performSelector:@selector(letTextGoAway) withObject:nil afterDelay:0.6];
                    }
                    else
                    {
                        string2 = [NSString stringWithFormat:@"%@ is hurt by Woven Diamond - Woven Diamond causes %d damage.", self.enemy.name, a];
                        self.textPresent = YES;
                    }
                    CGSize size = [[CCDirector sharedDirector] winSize];
                    textBoxLayer = [[TextBoxLayer alloc] initWithColor:[UIColor grayColor] width: 320 height:60 padding:10 text:string2];
                    textBoxLayer.position =  ccp(-5, size.height/2 - 160);
                    textBoxLayer.delegate = self;
                    [self addChild:textBoxLayer z:INT_MAX];  
                    [self animateEnemyGetsAttacked];
                    return;
                }
                
                
                
            }
        }
        
        self.battleCycleStatus++;
    }
    
    
    if (self.battleCycleStatus == 7)        //attribute
    {
        
        self.battleCycleStatus++;
    }
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    if (self.battleCycleStatus == 8)
    {
        if (heroMovesFirst)
        {
            if (monsterMissed)
            {
                NSString *string1 = [NSString stringWithFormat:@"%@ attacked! You quickly evade the attack.", self.enemy.name];
                CGSize size = [[CCDirector sharedDirector] winSize];
                textBoxLayer = [[TextBoxLayer alloc] initWithColor:[UIColor grayColor] width: 320 height:60 padding:10 text:string1];
                textBoxLayer.position =  ccp(-5, size.height/2 - 160);
                textBoxLayer.delegate = self;
                [self addChild:textBoxLayer z:INT_MAX];
                self.textPresent = YES;
                //[self performSelector:@selector(textBox:didFinishAllTextWithPageCount:) withObject:nil afterDelay:0.5];
                
                return;
            }
            
            double defStyleMult;
            if (heroMoveCode == 1)
                defStyleMult = 0.9;
            else if (heroMoveCode == 2)
                defStyleMult = 1.1;
            else if (heroMoveCode == 3)
                defStyleMult = 1.6;
            
            int r4 = 91 + arc4random()%10;
            int r5 = 91 + arc4random()%10;
            double calc3 = enemy.monsterStr*r4/100.0;
            double calc4 = (hero.heroStrDef * defStyleMult * ((int)sqrt((double)(hero.defMult))) * hero.attribDefMult * tempDefMult + hero.defBonus)*r5/100.0 + (hero.heroSPD * hero.aglMult * hero.attribAgiMult * tempAgiMult + hero.aglBonus)/5;
            
            
            double temp = calc3/calc4;
            if (temp <= 1)
            {
                int randy = arc4random()%2;
                if (randy == 0)
                {
                    temp = 1;
                }
                else
                {
                    monsterMissed = YES;
                    NSString *string1 = [NSString stringWithFormat:@"%@ attacked! You quickly evade the attack.", self.enemy.name];
                    CGSize size = [[CCDirector sharedDirector] winSize];
                    textBoxLayer = [[TextBoxLayer alloc] initWithColor:[UIColor grayColor] width: 320 height:60 padding:10 text:string1];
                    textBoxLayer.position =  ccp(-5, size.height/2 - 160);
                    textBoxLayer.delegate = self;
                    [self addChild:textBoxLayer z:INT_MAX];
                    self.textPresent = YES;
                    
                    return;
                }
            }
            
            int enemyDamageDealt = (int) temp;
            
            //
            if (enemyDamageDealt >= hero.heroCurrentHP)
            {
                enemyDamageDealt = hero.heroCurrentHP;
            }
            //
            
            lastDamageDealtByEnemy = enemyDamageDealt;
            
            int tempCurrentHP = hero.heroCurrentHP;
            [self updateHP:(hero.heroCurrentHP - enemyDamageDealt)];
            tempCurrentHP -= enemyDamageDealt;
            
            
            
            
            NSString *string2;
            if (tempCurrentHP <= 0)
            {
                
                self.battleIsStillGoing = NO;
                self.battleCycleStatus = 13;
                string2 = [NSString stringWithFormat:@"%@ attacked! %@ inflicted %d damage on you.",self.enemy.name, self.enemy.name, enemyDamageDealt];
            }
            else
            {
                string2 = [NSString stringWithFormat:@"%@ attacked! You took %d damage.",self.enemy.name, enemyDamageDealt];
                
            }
            CGSize size = [[CCDirector sharedDirector] winSize];
            textBoxLayer = [[TextBoxLayer alloc] initWithColor:[UIColor grayColor] width: 320 height:60 padding:10 text:string2];
            textBoxLayer.position =  ccp(-5, size.height/2 - 160);
            textBoxLayer.delegate = self;
            self.textPresent = YES;
            [self addChild:textBoxLayer z:INT_MAX];
            //self.textPresent = YES;
            //[self performSelector:@selector(textBox:didFinishAllTextWithPageCount:) withObject:nil afterDelay:0.5];
            [self animateHeroGetsAttacked];
            
            return;
        }
        if (!heroMovesFirst)
        {
            if (heroMissed)
            {
                NSString *string1 = [NSString stringWithFormat:@"You attacked! %@ dodges your attack.", self.enemy.name];
                CGSize size = [[CCDirector sharedDirector] winSize];
                textBoxLayer = [[TextBoxLayer alloc] initWithColor:[UIColor grayColor] width: 320 height:60 padding:10 text:string1];
                textBoxLayer.position =  ccp(-5, size.height/2 - 160);
                textBoxLayer.delegate = self;
                [self addChild:textBoxLayer z:INT_MAX];
                self.textPresent = YES;
                //[self performSelector:@selector(textBox:didFinishAllTextWithPageCount:) withObject:nil afterDelay:0.5];
                
                return;
            }
            
            double rando01;
            if (heroMoveCode == 1)
                rando01 = 1.8;
            else if (heroMoveCode == 2)
                rando01 = 1.2;
            else if (heroMoveCode == 3)
                rando01 = 0.8;
            
            
            //++++++++++++++++
            BOOL crit = NO;
            if (self.hero.attrib4)
            {
                double u = arc4random()%100;
                if (u >= 70)
                {
                    crit = YES;
                    u = 2.3;
                }
                else
                {
                    u = 1.0;
                }
                rando01 *= u;
            }
            //++++++++++++++++
            
            
            int r2 = 91 + arc4random()%10;
            int r3 = 91 + arc4random()%10;
            
            double calc1 = (rando01 * hero.heroStr*((int)sqrt((double)(hero.strMult)))*hero.attribStrMult*tempStrMult + hero.strBonus)*r2/100.0 + (hero.heroSPD * hero.aglMult *hero.attribAgiMult * tempAgiMult + hero.aglBonus)/5;
            double calc2 = (enemy.monsterStrDef * r3/100.0);
            
            
            double temp = calc1/calc2;
            if (temp <= 1)
                temp = 1;
            int heroDamageDealt = (int) temp;
            
            //
            if (heroDamageDealt >= enemy.monsterCurrentHP)
            {
                heroDamageDealt = enemy.monsterCurrentHP;
            }
            //
            
            enemy.monsterCurrentHP -= heroDamageDealt;
            
            lastDamageDealtByMe = heroDamageDealt;
            
            NSString *string2;
            
            if (!crit)
            {
            if (enemy.monsterCurrentHP <= 0)
            {
                self.battleIsStillGoing = NO;
                
                won = TRUE;
                wonOnCycle = self.battleCycleStatus;
                self.battleCycleStatus = 13;
                string2 = [NSString stringWithFormat:@"You attacked %@! You dealt %d damage.                                                                      %@ has been defeated!", self.enemy.name, heroDamageDealt, self.enemy.name];
                self.textPresent = YES;
            }
            else
            {
                string2 = [NSString stringWithFormat:@"You attacked %@! You dealt %d damage.", self.enemy.name, heroDamageDealt]; 
                self.textPresent = YES;
            }
            CGSize size = [[CCDirector sharedDirector] winSize];
            textBoxLayer = [[TextBoxLayer alloc] initWithColor:[UIColor grayColor] width: 320 height:60 padding:10 text:string2];
            textBoxLayer.position =  ccp(-5, size.height/2 - 160);
            textBoxLayer.delegate = self;
            [self addChild:textBoxLayer z:INT_MAX]; 
            //self.textPresent = YES;
            //[self performSelector:@selector(textBox:didFinishAllTextWithPageCount:) withObject:nil afterDelay:0.5];
            [self animateEnemyGetsAttacked];
            }
            else
            {
                if (enemy.monsterCurrentHP <= 0)
                {
                    self.battleIsStillGoing = NO;
              
                    won = TRUE;
                    wonOnCycle = self.battleCycleStatus;
                    self.battleCycleStatus = 13;
                    string2 = [NSString stringWithFormat:@"You hit a critical hit on %@! You dealt %d damage.                                                                      %@ has been defeated!", self.enemy.name, heroDamageDealt, self.enemy.name];
                    self.textPresent = YES;
                }
                else
                {
                    string2 = [NSString stringWithFormat:@"You hit a critical hit on %@! You dealt %d damage.", self.enemy.name, heroDamageDealt]; 
                    self.textPresent = YES;
                }
                CGSize size = [[CCDirector sharedDirector] winSize];
                textBoxLayer = [[TextBoxLayer alloc] initWithColor:[UIColor grayColor] width: 320 height:60 padding:10 text:string2];
                textBoxLayer.position =  ccp(-5, size.height/2 - 160);
                textBoxLayer.delegate = self;
                [self addChild:textBoxLayer z:INT_MAX]; 
                //self.textPresent = YES;
                //[self performSelector:@selector(textBox:didFinishAllTextWithPageCount:) withObject:nil afterDelay:0.5];
                [self animateEnemyGetsAttacked];
            }
            
            return;
            
            
        }
        return;
        
    }
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    if (self.battleCycleStatus == 9)        //weapon
    {
        if (self.hero.equipPos1.itemCode == 73)
        {
            int a;
            double b,c;
            b = arc4random()%4;
            c = (8+b)/10.0;
            a = (int) (lastDamageDealtByEnemy *c/5.0);
            
            if (a!=0)
            {
                
                if (a >= enemy.monsterCurrentHP)
                {
                    a = enemy.monsterCurrentHP;
                }
                
                enemy.monsterCurrentHP -= a;
                NSString *string2;
                if (enemy.monsterCurrentHP <= 0)
                {
                    self.battleIsStillGoing = NO;
                    
                    won = TRUE;
                    wonOnCycle = self.battleCycleStatus;
                    self.battleCycleStatus = 13;
                    string2 = [NSString stringWithFormat:@"Your Sword of Regret recoils - %@ takes %d damage.                                                                                   %@ has been defeated! ", self.enemy.name, a, self.enemy.name];
                    self.textPresent = YES;
                    //[self performSelector:@selector(letTextGoAway) withObject:nil afterDelay:0.6];
                }
                else
                {
                    string2 = [NSString stringWithFormat:@"Your Sword of Regret recoils - %@ takes %d damage.", self.enemy.name, a];
                    self.textPresent = YES;
                }
                CGSize size = [[CCDirector sharedDirector] winSize];
                textBoxLayer = [[TextBoxLayer alloc] initWithColor:[UIColor grayColor] width: 320 height:60 padding:10 text:string2];
                textBoxLayer.position =  ccp(-5, size.height/2 - 160);
                textBoxLayer.delegate = self;
                [self addChild:textBoxLayer z:INT_MAX];  
                [self animateEnemyGetsAttacked];
                return;
            }
        }
        if (!heroMovesFirst)
        {
            
            if (self.hero.equipPos1.itemCode == 74)
            {
                if (!heroMissed)
                {
                    int a;
                    double b,c;
                    b = arc4random()%4;
                    c = (8+b)/10.0;
                    a = (int) lastDamageDealtByMe*c/10.0;
                    
                    if (a!=0)
                    {
                        if ((hero.heroCurrentHP + a) > hero.heroHP)
                        {
                            a = hero.heroHP-hero.heroCurrentHP;
                        }
                        [self updateHP:(hero.heroCurrentHP + a)];
                        
                        if (a!=0)
                        {
                        NSString *string01 = [NSString stringWithFormat:@"Your Earthen sword regenerates %d hit points.",a];
                        CGSize size = [[CCDirector sharedDirector] winSize];
                        textBoxLayer = [[TextBoxLayer alloc] initWithColor:[UIColor grayColor] width: 320 height:60 padding:10 text:string01];
                        textBoxLayer.position =  ccp(-5, size.height/2 - 160);
                        textBoxLayer.delegate = self;
                        [self addChild:textBoxLayer z:INT_MAX];
                            [self performSelector:@selector(letTextGoAway) withObject:nil afterDelay:0.4];
                            //self.textPresent = YES;
                        return;
                        }
                    }
                    
                    
                }
            }
            
            else if (self.hero.equipPos1.itemCode == 78)        //78 Godblade - In the future I might change this and 81 Abyssal Fire to
            {                                                   //constant damage attacks based on a set STR
                if (!heroMissed)
                {
                    int a;
                    double b,c;
                    b = arc4random()%4;
                    c = (8+b)/10.0;
                    a = (int) lastDamageDealtByMe*c/8.0;
                    
                    if (a!=0)
                    {
                        
                        if (a >= enemy.monsterCurrentHP)
                        {
                            a = enemy.monsterCurrentHP;
                        }
                        
                        enemy.monsterCurrentHP -= a;
                        NSString *string2;
                        if (enemy.monsterCurrentHP <= 0)
                        {
                            self.battleIsStillGoing = NO;
                            
                            won = TRUE;
                            wonOnCycle = self.battleCycleStatus;
                            self.battleCycleStatus = 13;
                            string2 = [NSString stringWithFormat:@"The burn from your Godblade inflicts %d damage on %@.                                                                                           %@ has been defeated!", a, self.enemy.name, self.enemy.name];
                            self.textPresent = YES;
                            //[self performSelector:@selector(letTextGoAway) withObject:nil afterDelay:0.6];
                        }
                        else
                        {
                            string2 = [NSString stringWithFormat:@"The burn of your Godblade inflicts %d damage on %@.", a, self.enemy.name];
                            self.textPresent = YES;
                        }
                        CGSize size = [[CCDirector sharedDirector] winSize];
                        textBoxLayer = [[TextBoxLayer alloc] initWithColor:[UIColor grayColor] width: 320 height:60 padding:10 text:string2];
                        textBoxLayer.position =  ccp(-5, size.height/2 - 160);
                        textBoxLayer.delegate = self;
                        [self addChild:textBoxLayer z:INT_MAX];  
                        [self animateEnemyGetsAttacked];
                        return;
                    }
                    
                }
                
                
            }
            else if (self.hero.equipPos1.itemCode == 81)
            {
                if (!heroMissed)
                {
                    int a;
                    double b,c;
                    b = arc4random()%4;
                    c = (8+b)/10.0;
                    a = (int) lastDamageDealtByMe*c/6.0;
                    
                    if (a!=0)
                    {
                        
                        if (a >= enemy.monsterCurrentHP)
                        {
                            a = enemy.monsterCurrentHP;
                        }
                        
                        enemy.monsterCurrentHP -= a;
                        NSString *string2;
                        if (enemy.monsterCurrentHP <= 0)
                        {
                            self.battleIsStillGoing = NO;
                            
                            won = TRUE;
                            wonOnCycle = self.battleCycleStatus;
                            self.battleCycleStatus = 13;
                            string2 = [NSString stringWithFormat:@"The burn from Abyssal Fire inflicts %d damage on %@.                                                                                           %@ has been defeated!", a, self.enemy.name, self.enemy.name];
                            self.textPresent = YES;
                            //[self performSelector:@selector(letTextGoAway) withObject:nil afterDelay:0.6];
                        }
                        else
                        {
                            string2 = [NSString stringWithFormat:@"The burn from Abyssal Fire inflicts %d damage on %@.", a, self.enemy.name];
                            self.textPresent = YES;
                        }
                        CGSize size = [[CCDirector sharedDirector] winSize];
                        textBoxLayer = [[TextBoxLayer alloc] initWithColor:[UIColor grayColor] width: 320 height:60 padding:10 text:string2];
                        textBoxLayer.position =  ccp(-5, size.height/2 - 160);
                        textBoxLayer.delegate = self;
                        [self addChild:textBoxLayer z:INT_MAX];  
                        [self animateEnemyGetsAttacked];
                        return;
                    }
                    
                    
                }
                
            }
        }
        
        
        if (heroMovesFirst)
        {
            if (self.hero.equipPos1.itemCode == 75)
            {
                if (monsterMissed)
                {
                    int RAND = arc4random()%10;
                    if (RAND > 4)
                    {
                        double rando01;
                        if (heroMoveCode == 1)
                            rando01 = 1.8;
                        else if (heroMoveCode == 2)
                            rando01 = 1.2;
                        else if (heroMoveCode == 3)
                            rando01 = 0.8;
                        
                        
                        int r2 = 91 + arc4random()%10;
                        int r3 = 91 + arc4random()%10;
                        
                        double calc1 = (rando01 * hero.heroStr*((int)sqrt((double)(hero.strMult)))*hero.attribStrMult  * tempStrMult + hero.strBonus)*r2/100.0 + (hero.heroSPD * hero.aglMult *hero.attribAgiMult * tempAgiMult + hero.aglBonus)/5;
                        double calc2 = (enemy.monsterStrDef * r3/100.0);
                        
                        
                        double temp = calc1/calc2;
                        if (temp <= 1)
                            temp = 1;
                        int heroDamageDealt = (int) temp;
                        
                        //
                        if (heroDamageDealt >= enemy.monsterCurrentHP)
                        {
                            heroDamageDealt = enemy.monsterCurrentHP;
                        }
                        //
                        
                        enemy.monsterCurrentHP -= heroDamageDealt;
                        NSString *string2;
                        if (enemy.monsterCurrentHP <= 0)
                        {
                            self.battleIsStillGoing = NO;
                            
                            won = TRUE;
                            wonOnCycle = self.battleCycleStatus;
                            self.battleCycleStatus = 13;
                            string2 = [NSString stringWithFormat:@"You seized the opportunity to strike %@ again! You dealt %d damage.                                                                                           %@ has been defeated!", self.enemy.name, heroDamageDealt, self.enemy.name];
                            self.textPresent = YES;
                            //[self performSelector:@selector(letTextGoAway) withObject:nil afterDelay:0.6];
                        }
                        else
                        {
                            string2 = [NSString stringWithFormat:@"You seized the opportunity to strike %@ again! You dealt %d damage.", self.enemy.name, heroDamageDealt];
                            self.textPresent = YES;
                        }
                        CGSize size = [[CCDirector sharedDirector] winSize];
                        textBoxLayer = [[TextBoxLayer alloc] initWithColor:[UIColor grayColor] width: 320 height:60 padding:10 text:string2];
                        textBoxLayer.position =  ccp(-5, size.height/2 - 160);
                        textBoxLayer.delegate = self;
                        [self addChild:textBoxLayer z:INT_MAX];  
                        //self.textPresent = YES;
                        //[self performSelector:@selector(textBox:didFinishAllTextWithPageCount:) withObject:nil afterDelay:0.5];
                        [self animateEnemyGetsAttacked];
                        
                        
                        return;
                    }
                }
            }
        }
        
        self.battleCycleStatus++;
    }
    
    
    if (self.battleCycleStatus == 10)       //amulet
    {
        if (!heroMovesFirst)
        {
            if (self.hero.equipPos5.itemCode == 100)
            {
                int a, temp;
                double b,c;
                b = arc4random()%4;
                c = (8+b)/12.0;
                a = (int) lastDamageDealtByMe*c/10.0;
                
                if (a!=0)
                {
                    if (a >= enemy.monsterCurrentHP)
                    {
                        a = enemy.monsterCurrentHP;
                    }
                    
                    if ((hero.heroCurrentHP + a) > hero.heroHP)
                    {
                        temp = hero.heroHP-hero.heroCurrentHP;
                    }
                    else
                    {
                        temp = a;
                    }
                    
                    self.enemy.monsterCurrentHP -= a;
                    [self updateHP:(hero.heroCurrentHP + temp)];
                    
                    NSString *string02;
                    if (enemy.monsterCurrentHP <= 0)
                    {
                        self.battleIsStillGoing = NO;
                        
                        won = TRUE;
                        wonOnCycle = self.battleCycleStatus;
                        self.battleCycleStatus = 13;
                        string02 = [NSString stringWithFormat:@"Hannibal's Amulet absorbs %d HP from %@ and restores your health by %d HP.                                                                                              %@ has been defeated!", a, self.enemy.name, temp, self.enemy.name];
                        [self performSelector:@selector(letTextGoAway) withObject:nil afterDelay:0.4];
                        //self.textPresent = YES;
                    }
                    else
                    {
                        string02 = [NSString stringWithFormat:@"Hannibal's Amulet absorbs %d HP from %@ and restores your health by %d HP.", a, self.enemy.name, temp];
                        [self performSelector:@selector(letTextGoAway) withObject:nil afterDelay:0.4];
                        //self.textPresent = YES;
                    }
                    CGSize size = [[CCDirector sharedDirector] winSize];
                    textBoxLayer = [[TextBoxLayer alloc] initWithColor:[UIColor grayColor] width: 320 height:60 padding:10 text:string02];
                    textBoxLayer.position =  ccp(-5, size.height/2 - 160);
                    textBoxLayer.delegate = self;
                    [self addChild:textBoxLayer z:INT_MAX];  
                    [self animateEnemyGetsAttacked];
                    return;
                }
                
            }
        }
        
        if (self.hero.equipPos5.itemCode == 93)
        {
            if (!enemy.isBoss)
            {
            inBattleGoldMult *= 1.05;
            if (inBattleGoldMult >= 2.0)
            {
                inBattleGoldMult = 2.0;
            }
            else
            {
                NSString *string01 = [NSString stringWithFormat:@"Your Eagle's Charm continues to increase the enemy's loot."];
                CGSize size = [[CCDirector sharedDirector] winSize];
                textBoxLayer = [[TextBoxLayer alloc] initWithColor:[UIColor grayColor] width: 320 height:60 padding:10 text:string01];
                textBoxLayer.position =  ccp(-5, size.height/2 - 160);
                textBoxLayer.delegate = self;
                [self addChild:textBoxLayer z:INT_MAX];
                self.textPresent = YES;
                return;
            }
            }
            
        }
        
        
        else if (self.hero.equipPos5.itemCode == 96)
        {
            if (!enemy.isBoss)
            {
            if (canAttackAgain)
            {
            double tempD = enemy.monsterStrDef;
            tempD *= 0.98;
            NSString *string01 = [NSString stringWithFormat:@"Your Diamond Charm wears down %@.",self.enemy.name];
            if (tempD < 50)
            {
                if (enemy.monsterStrDef > 12)
                {
                    enemy.monsterStrDef -= 1;
                    CGSize size = [[CCDirector sharedDirector] winSize];
                    textBoxLayer = [[TextBoxLayer alloc] initWithColor:[UIColor grayColor] width: 320 height:60 padding:10 text:string01];
                    textBoxLayer.position =  ccp(-5, size.height/2 - 160);
                    textBoxLayer.delegate = self;
                    [self addChild:textBoxLayer z:INT_MAX];
                    self.textPresent = YES;
                    return;
                }
            }
            else
            {
                enemy.monsterStrDef = tempD;
                CGSize size = [[CCDirector sharedDirector] winSize];
                textBoxLayer = [[TextBoxLayer alloc] initWithColor:[UIColor grayColor] width: 320 height:60 padding:10 text:string01];
                textBoxLayer.position =  ccp(-5, size.height/2 - 160);
                textBoxLayer.delegate = self;
                [self addChild:textBoxLayer z:INT_MAX];
                self.textPresent = YES;
                return;
            }
            
            }
            }
        }
        
        else if (self.hero.equipPos5.itemCode == 98)
        {
            if (!enemy.isBoss)
            {
            inBattleExpMult *= 1.06;
            if (inBattleExpMult >= 2.0)
            {
                inBattleExpMult = 2.0;
            }
            else
            {
                NSString *string01 = [NSString stringWithFormat:@"Your Amulet of Wisdom provides you insight about the battle."];
                CGSize size = [[CCDirector sharedDirector] winSize];
                textBoxLayer = [[TextBoxLayer alloc] initWithColor:[UIColor grayColor] width: 320 height:60 padding:10 text:string01];
                textBoxLayer.position =  ccp(-5, size.height/2 - 160);
                textBoxLayer.delegate = self;
                [self addChild:textBoxLayer z:INT_MAX];
                self.textPresent = YES;
                return;
            }
            }
        }
    
        if (self.hero.equipPos5.itemCode == 101)
        {
            int a = (int) (hero.heroHP * 0.05);
            if (a == 0)
                a = 1;
            if ((hero.heroCurrentHP + a) > hero.heroHP)
            {
                a = hero.heroHP-hero.heroCurrentHP;
            }
            if (a!=0)
            {
                [self updateHP:(hero.heroCurrentHP + a)];
                
                NSString *string01 = [NSString stringWithFormat:@"Vodek's Crystal restores your health by %d hit points.", a];
                CGSize size = [[CCDirector sharedDirector] winSize];
                textBoxLayer = [[TextBoxLayer alloc] initWithColor:[UIColor grayColor] width: 320 height:60 padding:10 text:string01];
                textBoxLayer.position =  ccp(-5, size.height/2 - 160);
                textBoxLayer.delegate = self;
                [self addChild:textBoxLayer z:INT_MAX];
                [self performSelector:@selector(letTextGoAway) withObject:nil afterDelay:0.4];
                //self.textPresent = YES;
                return;
            }
        }
        
        self.battleCycleStatus++;
    }
    
    if (self.battleCycleStatus == 11)       //body
    {
        if (!heroMovesFirst)
        {
            
            if (self.hero.equipPos4.itemCode == 125)
            {
                if (!heroMissed)
                {
                    int a;
                    double b,c;
                    b = arc4random()%4;
                    c = (8+b)/10.0;
                    a = (int) (lastDamageDealtByMe*c/9.0);
                    
                    if (a!=0)
                    {
                        if ((hero.heroCurrentHP + a) > hero.heroHP)
                        {
                            a = hero.heroHP-hero.heroCurrentHP;
                        }
                        if (a!=0)
                        {
                        [self updateHP:(hero.heroCurrentHP + a)];
                        
                        NSString *string01 = [NSString stringWithFormat:@"Your Armor of the Forest regenerates %d HP.",a];
                        CGSize size = [[CCDirector sharedDirector] winSize];
                        textBoxLayer = [[TextBoxLayer alloc] initWithColor:[UIColor grayColor] width: 320 height:60 padding:10 text:string01];
                        textBoxLayer.position =  ccp(-5, size.height/2 - 160);
                        textBoxLayer.delegate = self;
                        [self addChild:textBoxLayer z:INT_MAX];
                            [self performSelector:@selector(letTextGoAway) withObject:nil afterDelay:0.4];
                            //self.textPresent = YES;
                        return;
                        }
                    }
                    
                    
                }
            }
            else if (self.hero.equipPos4.itemCode == 127)
            {
                if (!enemy.isBoss)
                {
                if (canAttackAgain)
                {
                inBattleGoldMult *= 1.08;
                if (inBattleGoldMult >= 2.0)
                {
                    inBattleGoldMult = 2.0;
                }
                else
                {
                    NSString *string01 = [NSString stringWithFormat:@"Your Dwarven Ringmail continues to increase the enemy's loot."];
                    CGSize size = [[CCDirector sharedDirector] winSize];
                    textBoxLayer = [[TextBoxLayer alloc] initWithColor:[UIColor grayColor] width: 320 height:60 padding:10 text:string01];
                    textBoxLayer.position =  ccp(-5, size.height/2 - 160);
                    textBoxLayer.delegate = self;
                    [self addChild:textBoxLayer z:INT_MAX];
                    self.textPresent = YES;
                    return;
                }
                }
                }
            }
            else if (self.hero.equipPos4.itemCode == 142)
            {
                if (!heroMissed)
                {
                    int a;
                    double b,c;
                    b = arc4random()%4;
                    c = (8+b)/10.0;
                    a = (int) (lastDamageDealtByMe*c/4.0);
                    
                    if (a!=0)
                    {
                        if ((hero.heroCurrentHP + a) > hero.heroHP)
                        {
                            a = hero.heroHP-hero.heroCurrentHP;
                        }
                        if (a!=0)
                        {
                        [self updateHP:(hero.heroCurrentHP + a)];
                        
                        NSString *string01 = [NSString stringWithFormat:@"Heart heals you by %d HP.",a];
                        CGSize size = [[CCDirector sharedDirector] winSize];
                        textBoxLayer = [[TextBoxLayer alloc] initWithColor:[UIColor grayColor] width: 320 height:60 padding:10 text:string01];
                        textBoxLayer.position =  ccp(-5, size.height/2 - 160);
                        textBoxLayer.delegate = self;
                        [self addChild:textBoxLayer z:INT_MAX];
                            [self performSelector:@selector(letTextGoAway) withObject:nil afterDelay:0.4];
                            //self.textPresent = YES;
                        return;
                        }
                    }
                    
                    
                }
            }
        }
        else
        {
            if (self.hero.equipPos4.itemCode == 124)
            {
                int a;
                double b,c;
                b = arc4random()%4;
                c = (8+b)/10.0;
                a = (int) (lastDamageDealtByEnemy *c/6.0);
                
                if (a!=0)
                {
                    
                    if (a >= enemy.monsterCurrentHP)
                    {
                        a = enemy.monsterCurrentHP;
                    }
                    enemy.monsterCurrentHP -= a;
                    NSString *string2;
                    if (enemy.monsterCurrentHP <= 0)
                    {
                        self.battleIsStillGoing = NO;
                        
                        won = TRUE;
                        wonOnCycle = self.battleCycleStatus;
                        self.battleCycleStatus = 13;
                        string2 = [NSString stringWithFormat:@"%@ is hurt by Woven Diamond - Woven Diamond causes %d damage.                                                                                   %@ has been defeated! ", self.enemy.name, a, self.enemy.name];
                        self.textPresent = YES;
                        //[self performSelector:@selector(letTextGoAway) withObject:nil afterDelay:0.6];
                    }
                    else
                    {
                        string2 = [NSString stringWithFormat:@"%@ is hurt by Woven Diamond - Woven Diamond causes %d damage.", self.enemy.name, a];
                        self.textPresent = YES;
                    }
                    CGSize size = [[CCDirector sharedDirector] winSize];
                    textBoxLayer = [[TextBoxLayer alloc] initWithColor:[UIColor grayColor] width: 320 height:60 padding:10 text:string2];
                    textBoxLayer.position =  ccp(-5, size.height/2 - 160);
                    textBoxLayer.delegate = self;
                    [self addChild:textBoxLayer z:INT_MAX];  
                    [self animateEnemyGetsAttacked];
                    return;
                }
            }
            else if (self.hero.equipPos4.itemCode == 127)
            {
                if (!enemy.isBoss)
                {
                    if (canAttackAgain)
                    {
                        inBattleGoldMult *= 1.08;
                        if (inBattleGoldMult >= 2.0)
                        {
                            inBattleGoldMult = 2.0;
                        }
                        else
                        {
                            NSString *string01 = [NSString stringWithFormat:@"Your Dwarven Ringmail continues to increase the enemy's loot."];
                            CGSize size = [[CCDirector sharedDirector] winSize];
                            textBoxLayer = [[TextBoxLayer alloc] initWithColor:[UIColor grayColor] width: 320 height:60 padding:10 text:string01];
                            textBoxLayer.position =  ccp(-5, size.height/2 - 160);
                            textBoxLayer.delegate = self;
                            [self addChild:textBoxLayer z:INT_MAX];
                            self.textPresent = YES;
                            return;
                        }
                    }
                }
            }
        }
        
        self.battleCycleStatus++;
    }
    if (self.battleCycleStatus == 12)       //attribute
    {
        if (canAttackAgain)
        {
        if (hero.attrib14)
        {
            int u = arc4random()%100;
            if (u >= 70)
            {
                canAttackAgain = NO;
                heroMovesFirst = NO;
                self.battleCycleStatus = 8;
                [self battleCycle];
                return;
            }
        }
        }
        if (!enemy.isBoss)
        {
        if (hero.attrib9)
        {
            int a = enemy.monsterStrDef;
            int b;
            if (a>20)
            {
                b = (int)(a * 0.97);
                enemy.monsterStrDef = b;
                NSString *string01 = [NSString stringWithFormat:@"%@ grows fatigued as the battle wears on.",enemy.name];
                CGSize size = [[CCDirector sharedDirector] winSize];
                textBoxLayer = [[TextBoxLayer alloc] initWithColor:[UIColor grayColor] width: 320 height:60 padding:10 text:string01];
                textBoxLayer.position =  ccp(-5, size.height/2 - 160);
                textBoxLayer.delegate = self;
                [self addChild:textBoxLayer z:INT_MAX];
                self.textPresent = YES;
                return;
            }
        }
        }
        
        self.battleCycleStatus++;
    }
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    if (self.battleCycleStatus == 13)
    {
        self.battleCycleStatus = 2;
        canAttackAgain = YES;
        [self battleCycle];
        return;
        
    }
    
    
    
    if (self.battleCycleStatus == 14)
    {
        
        if (self.hero.heroCurrentHP <= 0)
        {
            self.hero.position = ccp(0,0);
            self.hero.heroOrientation = 1;
            self.hero.gold = self.hero.gold * 0.6;
            self.hero.heroCurrentHP = self.hero.heroHP;
            [GameSceneManager sharedGameSceneManager].hero = self.hero;
            [GameSceneManager sharedGameSceneManager].justDied = YES;
            NSString *deathString;
            deathString = [NSString stringWithFormat:@"Oh dear, you have been defeated! Everything is going black..."];
            CGSize size = [[CCDirector sharedDirector] winSize];
            textBoxLayer = [[TextBoxLayer alloc] initWithColor:[UIColor grayColor] width: 320 height:60 padding:10 text:deathString];
            textBoxLayer.position =  ccp(-5, size.height/2 - 160);
            textBoxLayer.delegate = self;
            [self addChild:textBoxLayer z:INT_MAX]; 
            //self.textPresent = YES;
            [MusicHandler playButtonClick];
            [self performSelector:@selector(heroDies) withObject:nil afterDelay:1.2];
            return;
        }
        if (self.enemy.monsterCurrentHP <= 0)
        {
            if (won)
            {
                self.battleCycleStatus = wonOnCycle + 100;
                [self battleCycle];
                return;
            }
            
            
            NSString *victoryString;
            
            if (self.enemy.monsterRewardGold == 0)
            {
                victoryString = [NSString stringWithFormat:@"You have gained %d experience for winning.", ((int) (self.enemy.monsterExperience*inBattleExpMult*hero.itemExpMult*hero.attribExpMult))];
            }
            else
            {
                victoryString = [NSString stringWithFormat:@"You have gained %d experience and %d gold coins for winning.", ((int) (self.enemy.monsterExperience*inBattleExpMult*hero.itemExpMult*hero.attribExpMult)), ((int) (self.enemy.monsterRewardGold*inBattleGoldMult*hero.itemGoldMult*hero.attribGoldMult))];
            }
            
            CGSize size = [[CCDirector sharedDirector] winSize];
            textBoxLayer = [[TextBoxLayer alloc] initWithColor:[UIColor grayColor] width: 320 height:60 padding:10 text:victoryString];
            textBoxLayer.position =  ccp(-5, size.height/2 - 160);
            textBoxLayer.delegate = self;
            [self addChild:textBoxLayer z:INT_MAX]; 
            [MusicHandler playButtonClick];
            self.textPresent = YES;
            return;
        }
        
        
        
    }
    
    
    
    if (self.battleCycleStatus == 15)
    {
        int tempOldExp = self.hero.exp;
        self.hero.exp += (int) self.enemy.monsterExperience*inBattleExpMult*hero.itemExpMult*hero.attribExpMult;
        self.hero.gold += (int) self.enemy.monsterRewardGold*inBattleGoldMult*hero.itemGoldMult*hero.attribGoldMult;
        
        
        
        int oldLvl = [self levelForExp:tempOldExp];
        int newLvl = [self levelForExp:self.hero.exp];
        if (oldLvl != newLvl)
        {
            [self levelFrom:oldLvl ToLevel:newLvl];
            
            //NSString *string = [NSString stringWithFormat:@"Congratulations! You have grown from level %d to level %d.                                             Hit Points: +%d. Strength: +%d. Defense: +%d. Agility: +%d. Free Points: +%d. Attribute Points: +%d.", oldLvl, newLvl, plusHP, plusStr, plusDef, plusAgi, plusFP, plusAttrib];
            NSString *string = [NSString stringWithFormat:@"Congratulations! You have grown from level %d to level %d.                                                                                                                                         Hit Points: +%d. Strength: +%d. Defense: +%d. Agility: +%d. Free Points: +%d. Attribute Points: +%d.", oldLvl, newLvl, plusHP, plusStr, plusDef, plusAgi, plusFP, plusAttrib];
            CGSize size = [[CCDirector sharedDirector] winSize];
            textBoxLayer = [[TextBoxLayer alloc] initWithColor:[UIColor grayColor] width: 320 height:60 padding:10 text:string];
            textBoxLayer.position =  ccp(-5, size.height/2 - 160);
            textBoxLayer.delegate = self;
            [self addChild:textBoxLayer z:INT_MAX]; 
            self.textPresent = YES;
            return;
        }
        
        self.battleCycleStatus++;
        [self battleCycle];
        
    }
    
    
    
    if (self.battleCycleStatus == 16)
    {
        if (battleID == 101)
            self.hero.beatBoss1 = YES;
        if (battleID == 102)
            self.hero.beatCyclops = YES;
        
        self.hero.mapInitMode = 8;
        [GameSceneManager sharedGameSceneManager].hero = self.hero;
        int temp = self.hero.currentMap;
        [SceneManager goPlay:temp];
        
    }
    
    
   
    
    
    //itemCycle from 40-43
    
    if (self.battleCycleStatus == 40)
    {
        if (currentItemCode == 1)
        {
            int a = 10;
            if ((hero.heroCurrentHP + a) > hero.heroHP)
            {
                a = hero.heroHP-hero.heroCurrentHP;
            }
            [self updateHP:(hero.heroCurrentHP + a)];
            
            NSString *string01 = [NSString stringWithFormat:@"You heal by %d HP.",a];
            CGSize size = [[CCDirector sharedDirector] winSize];
            textBoxLayer = [[TextBoxLayer alloc] initWithColor:[UIColor grayColor] width: 320 height:60 padding:10 text:string01];
            textBoxLayer.position =  ccp(-5, size.height/2 - 160);
            self.battleCycleStatus = 42;
            textBoxLayer.delegate = self;
            [self addChild:textBoxLayer z:INT_MAX];
            [self performSelector:@selector(letTextGoAway) withObject:nil afterDelay:0.4];
            //self.textPresent = YES;
            return;
        }
        else if (currentItemCode == 2)
        {
            int a = 30;
            if ((hero.heroCurrentHP + a) > hero.heroHP)
            {
                a = hero.heroHP-hero.heroCurrentHP;
            }
            [self updateHP:(hero.heroCurrentHP + a)];
            
            NSString *string01 = [NSString stringWithFormat:@"You heal by %d HP.",a];
            CGSize size = [[CCDirector sharedDirector] winSize];
            textBoxLayer = [[TextBoxLayer alloc] initWithColor:[UIColor grayColor] width: 320 height:60 padding:10 text:string01];
            textBoxLayer.position =  ccp(-5, size.height/2 - 160);
            self.battleCycleStatus = 42;
            textBoxLayer.delegate = self;
            [self addChild:textBoxLayer z:INT_MAX];
            [self performSelector:@selector(letTextGoAway) withObject:nil afterDelay:0.4];
            //self.textPresent = YES;
            return;
        }
        else if (currentItemCode == 3)
        {
            int a = 100;
            if ((hero.heroCurrentHP + a) > hero.heroHP)
            {
                a = hero.heroHP-hero.heroCurrentHP;
            }
            [self updateHP:(hero.heroCurrentHP + a)];
            
            NSString *string01 = [NSString stringWithFormat:@"You heal by %d HP.",a];
            CGSize size = [[CCDirector sharedDirector] winSize];
            textBoxLayer = [[TextBoxLayer alloc] initWithColor:[UIColor grayColor] width: 320 height:60 padding:10 text:string01];
            textBoxLayer.position =  ccp(-5, size.height/2 - 160);
            self.battleCycleStatus = 42;
            textBoxLayer.delegate = self;
            [self addChild:textBoxLayer z:INT_MAX];
            [self performSelector:@selector(letTextGoAway) withObject:nil afterDelay:0.4];
            //self.textPresent = YES;
            return;
        }
        else if (currentItemCode == 4)
        {
            int a = 500;
            if ((hero.heroCurrentHP + a) > hero.heroHP)
            {
                a = hero.heroHP-hero.heroCurrentHP;
            }
            [self updateHP:(hero.heroCurrentHP + a)];
            
            NSString *string01 = [NSString stringWithFormat:@"You heal by %d HP.",a];
            CGSize size = [[CCDirector sharedDirector] winSize];
            textBoxLayer = [[TextBoxLayer alloc] initWithColor:[UIColor grayColor] width: 320 height:60 padding:10 text:string01];
            textBoxLayer.position =  ccp(-5, size.height/2 - 160);
            self.battleCycleStatus = 42;
            textBoxLayer.delegate = self;
            [self addChild:textBoxLayer z:INT_MAX];
            self.textPresent = YES;
            return;
        }
        else if (currentItemCode == 5)
        {
            tempStrMult = 1.2;
            NSString *string01 = [NSString stringWithFormat:@"You feel stronger."];
            CGSize size = [[CCDirector sharedDirector] winSize];
            textBoxLayer = [[TextBoxLayer alloc] initWithColor:[UIColor grayColor] width: 320 height:60 padding:10 text:string01];
            textBoxLayer.position =  ccp(-5, size.height/2 - 160);
            self.battleCycleStatus = 42;
            textBoxLayer.delegate = self;
            [self addChild:textBoxLayer z:INT_MAX];
            self.textPresent = YES;
            return;
        }
        else if (currentItemCode == 6)
        {
            tempDefMult = 1.2;
            NSString *string01 = [NSString stringWithFormat:@"You feel stronger."];
            CGSize size = [[CCDirector sharedDirector] winSize];
            textBoxLayer = [[TextBoxLayer alloc] initWithColor:[UIColor grayColor] width: 320 height:60 padding:10 text:string01];
            textBoxLayer.position =  ccp(-5, size.height/2 - 160);
            self.battleCycleStatus = 42;
            textBoxLayer.delegate = self;
            [self addChild:textBoxLayer z:INT_MAX];
            self.textPresent = YES;
            return;
        }
        else if (currentItemCode == 7)
        {
            tempAgiMult = 1.2;
            NSString *string01 = [NSString stringWithFormat:@"You feel faster."];
            CGSize size = [[CCDirector sharedDirector] winSize];
            textBoxLayer = [[TextBoxLayer alloc] initWithColor:[UIColor grayColor] width: 320 height:60 padding:10 text:string01];
            textBoxLayer.position =  ccp(-5, size.height/2 - 160);
            self.battleCycleStatus = 42;
            textBoxLayer.delegate = self;
            [self addChild:textBoxLayer z:INT_MAX];
            self.textPresent = YES;
            return;
        }
        else if (currentItemCode == 8)
        {
            tempStrMult = 1.9;
            NSString *string01 = [NSString stringWithFormat:@"You feel much stronger."];
            CGSize size = [[CCDirector sharedDirector] winSize];
            textBoxLayer = [[TextBoxLayer alloc] initWithColor:[UIColor grayColor] width: 320 height:60 padding:10 text:string01];
            textBoxLayer.position =  ccp(-5, size.height/2 - 160);
            self.battleCycleStatus = 42;
            textBoxLayer.delegate = self;
            [self addChild:textBoxLayer z:INT_MAX];
            self.textPresent = YES;
            return;
        }
        else if (currentItemCode == 9)
        {
            tempDefMult = 1.9;
            NSString *string01 = [NSString stringWithFormat:@"You feel much stronger."];
            CGSize size = [[CCDirector sharedDirector] winSize];
            textBoxLayer = [[TextBoxLayer alloc] initWithColor:[UIColor grayColor] width: 320 height:60 padding:10 text:string01];
            textBoxLayer.position =  ccp(-5, size.height/2 - 160);
            self.battleCycleStatus = 42;
            textBoxLayer.delegate = self;
            [self addChild:textBoxLayer z:INT_MAX];
            self.textPresent = YES;
            return;
        }
        else if (currentItemCode == 10)
        {
            tempAgiMult = 1.9;
            NSString *string01 = [NSString stringWithFormat:@"You feel much faster."];
            CGSize size = [[CCDirector sharedDirector] winSize];
            textBoxLayer = [[TextBoxLayer alloc] initWithColor:[UIColor grayColor] width: 320 height:60 padding:10 text:string01];
            textBoxLayer.position =  ccp(-5, size.height/2 - 160);
            self.battleCycleStatus = 42;
            textBoxLayer.delegate = self;
            [self addChild:textBoxLayer z:INT_MAX];
            self.textPresent = YES;
            return;
        }
        else if (currentItemCode == 11)
        {
            if (enemy.isBoss)
            {
                NSString *string01 = [NSString stringWithFormat:@"It has no effect on %@.", enemy.name];
                CGSize size = [[CCDirector sharedDirector] winSize];
                textBoxLayer = [[TextBoxLayer alloc] initWithColor:[UIColor grayColor] width: 320 height:60 padding:10 text:string01];
                textBoxLayer.position =  ccp(-5, size.height/2 - 160);
                self.battleCycleStatus = 42;
                textBoxLayer.delegate = self;
                [self addChild:textBoxLayer z:INT_MAX];
                self.textPresent = YES;
                return;
            }
            else
            {
                int a;
                double b,c;
                b = arc4random()%5;
                c = (8+b)/10.0;
                a = (int) 80*c/enemy.monsterStrDef;
                
                
                    if (a >= enemy.monsterCurrentHP)
                    {
                        a = enemy.monsterCurrentHP;
                    }
                    
                    enemy.monsterCurrentHP -= a;
                    NSString *string2;
                    if (enemy.monsterCurrentHP <= 0)
                    {
                        self.battleIsStillGoing = NO;
                        
                        won = TRUE;
                        wonOnCycle = self.battleCycleStatus;
                        self.battleCycleStatus = 13;
                        string2 = [NSString stringWithFormat:@"It inflicts %d damage on %@.                                                                                           %@ has been defeated!", a, self.enemy.name, self.enemy.name];
                        [self performSelector:@selector(letTextGoAway) withObject:nil afterDelay:0.4];
                        //self.textPresent = YES;
                    }
                    else
                    {
                        string2 = [NSString stringWithFormat:@"It inflicts %d damage on %@.", a, self.enemy.name];
                        [self performSelector:@selector(letTextGoAway) withObject:nil afterDelay:0.4];
                        //self.textPresent = YES;
                    }
                    CGSize size = [[CCDirector sharedDirector] winSize];
                    textBoxLayer = [[TextBoxLayer alloc] initWithColor:[UIColor grayColor] width: 320 height:60 padding:10 text:string2];
                    textBoxLayer.position =  ccp(-5, size.height/2 - 160);
                    textBoxLayer.delegate = self;
                    [self addChild:textBoxLayer z:INT_MAX];  
                    [self animateEnemyGetsAttacked];
                    return;
                }
        }
        else if (currentItemCode == 12)
        {
            int h = 10;
            if ((hero.heroCurrentHP + h) > hero.heroHP)
            {
                h = hero.heroHP-hero.heroCurrentHP;
            }
            [self updateHP:(hero.heroCurrentHP + h)];
            
            if (enemy.isBoss)
            {
                NSString *string01 = [NSString stringWithFormat:@"You use the Earth staff and heal by %d hit points. It has no effect on %@.", h, enemy.name];
                CGSize size = [[CCDirector sharedDirector] winSize];
                textBoxLayer = [[TextBoxLayer alloc] initWithColor:[UIColor grayColor] width: 320 height:60 padding:10 text:string01];
                textBoxLayer.position =  ccp(-5, size.height/2 - 160);
                self.battleCycleStatus = 42;
                textBoxLayer.delegate = self;
                [self addChild:textBoxLayer z:INT_MAX];
                [self performSelector:@selector(letTextGoAway) withObject:nil afterDelay:0.4];
                //self.textPresent = YES;
                return;
            }
            else
            {
                int a;
                double b,c;
                b = arc4random()%4;
                c = (8+b)/10.0;
                a = (int) 110*c/enemy.monsterStrDef;
                
                
                if (a >= enemy.monsterCurrentHP)
                {
                    a = enemy.monsterCurrentHP;
                }
                
                enemy.monsterCurrentHP -= a;
                NSString *string2;
                if (enemy.monsterCurrentHP <= 0)
                {
                    self.battleIsStillGoing = NO;
                    
                    won = TRUE;
                    wonOnCycle = self.battleCycleStatus;
                    self.battleCycleStatus = 13;
                    string2 = [NSString stringWithFormat:@"You use the Earth staff and heal by %d hit points. It inflicts %d damage on %@.                                                                                           %@ has been defeated!", h, a, self.enemy.name, self.enemy.name];
                    [self performSelector:@selector(letTextGoAway) withObject:nil afterDelay:0.4];
                    //self.textPresent = YES;
                }
                else
                {
                    string2 = [NSString stringWithFormat:@"You use the Earth staff and heal by %d hit points. It inflicts %d damage on %@.", h, a, self.enemy.name];
                    [self performSelector:@selector(letTextGoAway) withObject:nil afterDelay:0.4];
                    //self.textPresent = YES;
                }
                CGSize size = [[CCDirector sharedDirector] winSize];
                textBoxLayer = [[TextBoxLayer alloc] initWithColor:[UIColor grayColor] width: 320 height:60 padding:10 text:string2];
                textBoxLayer.position =  ccp(-5, size.height/2 - 160);
                textBoxLayer.delegate = self;
                [self addChild:textBoxLayer z:INT_MAX];  
                [self animateEnemyGetsAttacked];
                return;
            }
        }
        else if (currentItemCode == 13)
        {
            if (enemy.isBoss)
            {
                NSString *string01 = [NSString stringWithFormat:@"It has no effect on %@.", enemy.name];
                CGSize size = [[CCDirector sharedDirector] winSize];
                textBoxLayer = [[TextBoxLayer alloc] initWithColor:[UIColor grayColor] width: 320 height:60 padding:10 text:string01];
                textBoxLayer.position =  ccp(-5, size.height/2 - 160);
                self.battleCycleStatus = 42;
                textBoxLayer.delegate = self;
                [self addChild:textBoxLayer z:INT_MAX];
                [self performSelector:@selector(letTextGoAway) withObject:nil afterDelay:0.4];
                //self.textPresent = YES;
                return;
            }
            else
            {
                int a;
                double b,c;
                b = arc4random()%4;
                c = (8+b)/10.0;
                a = (int) 160*c/enemy.monsterStrDef;
                
                
                if (a >= enemy.monsterCurrentHP)
                {
                    a = enemy.monsterCurrentHP;
                }
                
                enemy.monsterCurrentHP -= a;
                NSString *string2;
                if (enemy.monsterCurrentHP <= 0)
                {
                    self.battleIsStillGoing = NO;
                    
                    won = TRUE;
                    wonOnCycle = self.battleCycleStatus;
                    self.battleCycleStatus = 13;
                    string2 = [NSString stringWithFormat:@"It inflicts %d damage on %@.                                                                                           %@ has been defeated!", a, self.enemy.name, self.enemy.name];
                    [self performSelector:@selector(letTextGoAway) withObject:nil afterDelay:0.4];
                    //self.textPresent = YES;
                }
                else
                {
                    string2 = [NSString stringWithFormat:@"It inflicts %d damage on %@.", a, self.enemy.name];
                    [self performSelector:@selector(letTextGoAway) withObject:nil afterDelay:0.4];
                    //self.textPresent = YES;
                }
                CGSize size = [[CCDirector sharedDirector] winSize];
                textBoxLayer = [[TextBoxLayer alloc] initWithColor:[UIColor grayColor] width: 320 height:60 padding:10 text:string2];
                textBoxLayer.position =  ccp(-5, size.height/2 - 160);
                textBoxLayer.delegate = self;
                [self addChild:textBoxLayer z:INT_MAX];  
                [self animateEnemyGetsAttacked];
                return;
            }
        }
        else if (currentItemCode == 14)
        {
            if (enemy.isBoss)
            {
                NSString *string01 = [NSString stringWithFormat:@"It has no effect on %@.", enemy.name];
                CGSize size = [[CCDirector sharedDirector] winSize];
                textBoxLayer = [[TextBoxLayer alloc] initWithColor:[UIColor grayColor] width: 320 height:60 padding:10 text:string01];
                textBoxLayer.position =  ccp(-5, size.height/2 - 160);
                self.battleCycleStatus = 42;
                textBoxLayer.delegate = self;
                [self addChild:textBoxLayer z:INT_MAX];
                self.textPresent = YES;
                return;
            }
            else
            {
                int a;
                double b,c;
                b = arc4random()%4;
                c = (8+b)/10.0;
                a = (int) 210*c/enemy.monsterStrDef;
                
                
                if (a >= enemy.monsterCurrentHP)
                {
                    a = enemy.monsterCurrentHP;
                }
                
                enemy.monsterCurrentHP -= a;
                NSString *string2;
                if (enemy.monsterCurrentHP <= 0)
                {
                    self.battleIsStillGoing = NO;
                    
                    won = TRUE;
                    wonOnCycle = self.battleCycleStatus;
                    self.battleCycleStatus = 13;
                    string2 = [NSString stringWithFormat:@"It inflicts %d damage on %@.                                                                                           %@ has been defeated!", a, self.enemy.name, self.enemy.name];
                    [self performSelector:@selector(letTextGoAway) withObject:nil afterDelay:0.4];
                    //self.textPresent = YES;
                }
                else
                {
                    string2 = [NSString stringWithFormat:@"It inflicts %d damage on %@.", a, self.enemy.name];
                    [self performSelector:@selector(letTextGoAway) withObject:nil afterDelay:0.4];
                    //self.textPresent = YES;
                }
                CGSize size = [[CCDirector sharedDirector] winSize];
                textBoxLayer = [[TextBoxLayer alloc] initWithColor:[UIColor grayColor] width: 320 height:60 padding:10 text:string2];
                textBoxLayer.position =  ccp(-5, size.height/2 - 160);
                textBoxLayer.delegate = self;
                [self addChild:textBoxLayer z:INT_MAX];  
                [self animateEnemyGetsAttacked];
                return;
            }
        }
        else if (currentItemCode == 15)
        {
            if (enemy.isBoss)
            {
                NSString *string01 = [NSString stringWithFormat:@"It has no effect on %@.", enemy.name];
                CGSize size = [[CCDirector sharedDirector] winSize];
                textBoxLayer = [[TextBoxLayer alloc] initWithColor:[UIColor grayColor] width: 320 height:60 padding:10 text:string01];
                textBoxLayer.position =  ccp(-5, size.height/2 - 160);
                self.battleCycleStatus = 42;
                textBoxLayer.delegate = self;
                [self addChild:textBoxLayer z:INT_MAX];
                self.textPresent = YES;
                return;
            }
            else
            {
                int a;
                double b,c;
                b = arc4random()%4;
                c = (8+b)/10.0;
                a = (int) 350*c/enemy.monsterStrDef;
                
                
                if (a >= enemy.monsterCurrentHP)
                {
                    a = enemy.monsterCurrentHP;
                }
                
                enemy.monsterCurrentHP -= a;
                NSString *string2;
                if (enemy.monsterCurrentHP <= 0)
                {
                    self.battleIsStillGoing = NO;
                    
                    won = TRUE;
                    wonOnCycle = self.battleCycleStatus;
                    self.battleCycleStatus = 13;
                    string2 = [NSString stringWithFormat:@"It inflicts %d damage on %@.                                                                                           %@ has been defeated!", a, self.enemy.name, self.enemy.name];
                    [self performSelector:@selector(letTextGoAway) withObject:nil afterDelay:0.4];
                    //self.textPresent = YES;
                }
                else
                {
                    string2 = [NSString stringWithFormat:@"It inflicts %d damage on %@.", a, self.enemy.name];
                    [self performSelector:@selector(letTextGoAway) withObject:nil afterDelay:0.4];
                    //self.textPresent = YES;
                }
                CGSize size = [[CCDirector sharedDirector] winSize];
                textBoxLayer = [[TextBoxLayer alloc] initWithColor:[UIColor grayColor] width: 320 height:60 padding:10 text:string2];
                textBoxLayer.position =  ccp(-5, size.height/2 - 160);
                textBoxLayer.delegate = self;
                [self addChild:textBoxLayer z:INT_MAX];  
                [self animateEnemyGetsAttacked];
                return;
            }
        }
        else if (currentItemCode == 16)
        {
            if (enemy.isBoss)
            {
                NSString *string01 = [NSString stringWithFormat:@"It has no effect on %@.", enemy.name];
                CGSize size = [[CCDirector sharedDirector] winSize];
                textBoxLayer = [[TextBoxLayer alloc] initWithColor:[UIColor grayColor] width: 320 height:60 padding:10 text:string01];
                textBoxLayer.position =  ccp(-5, size.height/2 - 160);
                self.battleCycleStatus = 42;
                textBoxLayer.delegate = self;
                [self addChild:textBoxLayer z:INT_MAX];
                self.textPresent = YES;
                return;
            }
            else
            {
                int a;
                double b,c;
                b = arc4random()%4;
                c = (8+b)/10.0;
                a = (int) 410*c/enemy.monsterStrDef;
                
                
                if (a >= enemy.monsterCurrentHP)
                {
                    a = enemy.monsterCurrentHP;
                }
                
                enemy.monsterCurrentHP -= a;
                NSString *string2;
                if (enemy.monsterCurrentHP <= 0)
                {
                    self.battleIsStillGoing = NO;
                    
                    won = TRUE;
                    wonOnCycle = self.battleCycleStatus;
                    self.battleCycleStatus = 13;
                    string2 = [NSString stringWithFormat:@"It inflicts %d damage on %@.                                                                                           %@ has been defeated!", a, self.enemy.name, self.enemy.name];
                    [self performSelector:@selector(letTextGoAway) withObject:nil afterDelay:0.4];
                    //self.textPresent = YES;
                }
                else
                {
                    string2 = [NSString stringWithFormat:@"It inflicts %d damage on %@.", a, self.enemy.name];
                    [self performSelector:@selector(letTextGoAway) withObject:nil afterDelay:0.4];
                    //self.textPresent = YES;
                }
                CGSize size = [[CCDirector sharedDirector] winSize];
                textBoxLayer = [[TextBoxLayer alloc] initWithColor:[UIColor grayColor] width: 320 height:60 padding:10 text:string2];
                textBoxLayer.position =  ccp(-5, size.height/2 - 160);
                textBoxLayer.delegate = self;
                [self addChild:textBoxLayer z:INT_MAX];  
                [self animateEnemyGetsAttacked];
                return;
            }
        }
        else if (currentItemCode == 17)
        {
            if (enemy.isBoss)
            {
                NSString *string01 = [NSString stringWithFormat:@"It has no effect on %@.", enemy.name];
                CGSize size = [[CCDirector sharedDirector] winSize];
                textBoxLayer = [[TextBoxLayer alloc] initWithColor:[UIColor grayColor] width: 320 height:60 padding:10 text:string01];
                textBoxLayer.position =  ccp(-5, size.height/2 - 160);
                self.battleCycleStatus = 42;
                textBoxLayer.delegate = self;
                [self addChild:textBoxLayer z:INT_MAX];
                self.textPresent = YES;
                return;
            }
            else
            {
                
                int a;
                double b,c;
                b = arc4random()%4;
                c = (8+b)/10.0;
                a = (int) 460*c/enemy.monsterStrDef;
                
                
                if (a >= enemy.monsterCurrentHP)
                {
                    a = enemy.monsterCurrentHP;
                }
                
                int h = a;
                if ((hero.heroCurrentHP + h) > hero.heroHP)
                {
                    h = hero.heroHP-hero.heroCurrentHP;
                }
                [self updateHP:(hero.heroCurrentHP + h)];
                
                enemy.monsterCurrentHP -= a;
                NSString *string2;
                if (enemy.monsterCurrentHP <= 0)
                {
                    self.battleIsStillGoing = NO;
                    
                    won = TRUE;
                    wonOnCycle = self.battleCycleStatus;
                    self.battleCycleStatus = 13;
                    string2 = [NSString stringWithFormat:@"It inflicts %d damage on %@ and heals you by %d hit points.                                                                                           %@ has been defeated!", a, self.enemy.name, h, self.enemy.name];
                    self.textPresent = YES;
                    [self performSelector:@selector(letTextGoAway) withObject:nil afterDelay:0.4];
                    //self.textPresent = YES;
                }
                else
                {
                    string2 = [NSString stringWithFormat:@"It inflicts %d damage on %@ and heals you by %d hit points.", a, self.enemy.name, h];
                    [self performSelector:@selector(letTextGoAway) withObject:nil afterDelay:0.4];
                    //self.textPresent = YES;
                }
                CGSize size = [[CCDirector sharedDirector] winSize];
                textBoxLayer = [[TextBoxLayer alloc] initWithColor:[UIColor grayColor] width: 320 height:60 padding:10 text:string2];
                textBoxLayer.position =  ccp(-5, size.height/2 - 160);
                textBoxLayer.delegate = self;
                [self addChild:textBoxLayer z:INT_MAX];  
                [self animateEnemyGetsAttacked];
                return;
            }
        }
        else if (currentItemCode == 18)
        {
            if (enemy.isBoss)
            {
                NSString *string01 = [NSString stringWithFormat:@"It has no effect on %@.", enemy.name];
                CGSize size = [[CCDirector sharedDirector] winSize];
                textBoxLayer = [[TextBoxLayer alloc] initWithColor:[UIColor grayColor] width: 320 height:60 padding:10 text:string01];
                textBoxLayer.position =  ccp(-5, size.height/2 - 160);
                self.battleCycleStatus = 42;
                textBoxLayer.delegate = self;
                [self addChild:textBoxLayer z:INT_MAX];
                self.textPresent = YES;
                return;
            }
            else
            {
                int a;
                double b,c;
                b = arc4random()%4;
                c = (8+b)/10.0;
                a = (int) 600*c/enemy.monsterStrDef;
                
                
                if (a >= enemy.monsterCurrentHP)
                {
                    a = enemy.monsterCurrentHP;
                }
                
                enemy.monsterCurrentHP -= a;
                NSString *string2;
                if (enemy.monsterCurrentHP <= 0)
                {
                    self.battleIsStillGoing = NO;
                    
                    won = TRUE;
                    wonOnCycle = self.battleCycleStatus;
                    self.battleCycleStatus = 13;
                    string2 = [NSString stringWithFormat:@"It inflicts %d damage on %@.                                                                                           %@ has been defeated!", a, self.enemy.name, self.enemy.name];
                    [self performSelector:@selector(letTextGoAway) withObject:nil afterDelay:0.4];
                    //self.textPresent = YES;
                }
                else
                {
                    string2 = [NSString stringWithFormat:@"It inflicts %d damage on %@.", a, self.enemy.name];
                    [self performSelector:@selector(letTextGoAway) withObject:nil afterDelay:0.4];
                    //self.textPresent = YES;
                }
                CGSize size = [[CCDirector sharedDirector] winSize];
                textBoxLayer = [[TextBoxLayer alloc] initWithColor:[UIColor grayColor] width: 320 height:60 padding:10 text:string2];
                textBoxLayer.position =  ccp(-5, size.height/2 - 160);
                textBoxLayer.delegate = self;
                [self addChild:textBoxLayer z:INT_MAX];  
                [self animateEnemyGetsAttacked];
                return;
            }
        }
        else if (currentItemCode == 24)
        {
            tempStrMult = 2.3;
            tempDefMult = 1.9;
            tempAgiMult = 0.8;
            NSString *string01 = [NSString stringWithFormat:@"You drink some Liquid Courage. You feel empowered."];
            CGSize size = [[CCDirector sharedDirector] winSize];
            textBoxLayer = [[TextBoxLayer alloc] initWithColor:[UIColor grayColor] width: 320 height:60 padding:10 text:string01];
            textBoxLayer.position =  ccp(-5, size.height/2 - 160);
            self.battleCycleStatus = 42;
            textBoxLayer.delegate = self;
            [self addChild:textBoxLayer z:INT_MAX];
            self.textPresent = YES;
            return;
        }
        
    }
    
    if (self.battleCycleStatus == 41)
    {
        if (currentItemCode == 1)
        {
            
        }
        else if (currentItemCode == 2)
        {
            
        }
        else if (currentItemCode == 3)
        {
            
        }
        else if (currentItemCode == 4)
        {
            
        }
        else if (currentItemCode == 5)
        {
            
        }
        self.battleCycleStatus++;
    }
    
    
    if (self.battleCycleStatus == 42)
    {
        if (currentItemCode == 1)
        {
            
        }
        else if (currentItemCode == 2)
        {
            
        }
        else if (currentItemCode == 3)
        {
            
        }
        else if (currentItemCode == 4)
        {
            
        }
        else if (currentItemCode == 5)
        {
            
        }
        self.battleCycleStatus++;
    }
    
    if (self.battleCycleStatus == 43)
    {
        double styleMult;
        if (heroMoveCode == 1)
            styleMult = 1.0;
        else if (heroMoveCode == 2)
            styleMult = 1.4;
        else if (heroMoveCode == 3)
            styleMult = 0.9;
        
        int enemyTempSpeed = enemy.monsterSpeed;
        int heroTempSpeed = (int) (styleMult*(hero.heroSPD+hero.aglBonus)*hero.aglMult + 0.0001);
        
        enemyTempSpeed = (int) (enemyTempSpeed + enemyTempSpeed*0.04*(arc4random()%10) - enemyTempSpeed*0.03*(arc4random()%10));
        
        
        
        
        if (enemyTempSpeed > heroTempSpeed)
        {
            monsterMissed = FALSE;
        }
        else if (enemyTempSpeed*7 < heroTempSpeed)
        {
            int rand4 = arc4random()%14;
            if (rand4 > 11)
            {
                monsterMissed = FALSE;
            }
            else
            {
                monsterMissed = TRUE;
            }
        }
        else if (enemyTempSpeed*5 < heroTempSpeed)
        {
            int rand4 = arc4random()%11;
            if (rand4 > 8)
            {
                monsterMissed = FALSE;
            }
            else
            {
                monsterMissed = TRUE;
            }
        }
        else if (enemyTempSpeed*3 < heroTempSpeed)
        {
            int rand4 = arc4random()%10;
            if (rand4 > 6)
            {
                monsterMissed = FALSE;
            }
            else
            {
                monsterMissed = TRUE;
            }
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
        }
        
        
        
        heroMovesFirst = YES;
        self.battleCycleStatus = 8;
        lastDamageDealtByMe = 0;
        [self battleCycle];
        return;
        
    }
    
    
    
    
    
    
    
    
    
    
    //fleeCycle
    
    if (self.battleCycleStatus == 50)
    {
        int enemyTempSpeed = enemy.monsterSpeed;
        int heroTempSpeed = (int) (hero.heroSPD+hero.aglBonus)*hero.aglMult;
        
        enemyTempSpeed = (int) (enemyTempSpeed + enemyTempSpeed*0.04*(arc4random()%10) - enemyTempSpeed*0.03*(arc4random()%10));
        
        if (enemyTempSpeed > heroTempSpeed*3)
        {
            escapeFailed = TRUE;
        }
        else if (enemyTempSpeed > heroTempSpeed)
        {
            int rand4 = arc4random()%10;
            if (rand4 > 5)
            {
                escapeFailed = TRUE;
            }
        }
        else if (enemyTempSpeed * 3 < heroTempSpeed)
        {
            escapeFailed = FALSE;
        }
        else if (enemyTempSpeed <= heroTempSpeed)
        {
            int rand4 = arc4random()%10;
            if (rand4 > 2)
            {
                escapeFailed = FALSE;
            }
        }
        if (enemy.isBoss)
        {
            escapeFailed = YES;
        }
        
        if (escapeFailed)
        {
            NSString *string;
            self.battleCycleStatus = 7;
            heroMovesFirst = YES;
            monsterMissed = NO;
            string = [NSString stringWithFormat:@"%@ cut off your escape route!",enemy.name];
            CGSize size = [[CCDirector sharedDirector] winSize];
            textBoxLayer = [[TextBoxLayer alloc] initWithColor:[UIColor grayColor] width: 320 height:60 padding:10 text:string];
            textBoxLayer.position =  ccp(-5, size.height/2 - 160);
            textBoxLayer.delegate = self;
            textPresent = YES;
            [self addChild:textBoxLayer z:INT_MAX];
            
        }
        else
        {
            [MusicHandler playButtonClick];
            self.hero.mapInitMode = 8;
            [GameSceneManager sharedGameSceneManager].hero = self.hero;
            int temp = self.hero.currentMap;
            [SceneManager goPlay:temp];
        }
        
    }
    
    
    
    
    
    
    
    
    
    
    
    if (self.battleCycleStatus == 103)
    {
        self.battleCycleStatus++;
    }
    if (self.battleCycleStatus == 104)
    {
        
            if (self.hero.equipPos1.itemCode == 74)
            {
                if (!heroMissed)
                {
                    int a;
                    double b,c;
                    b = arc4random()%4;
                    c = (8+b)/10.0;
                    a = (int) (lastDamageDealtByMe*c/10.0);
                    
                    if (a!=0)
                    {
                        if ((hero.heroCurrentHP + a) > hero.heroHP)
                        {
                            a = hero.heroHP-hero.heroCurrentHP;
                        }
                        [self updateHP:(hero.heroCurrentHP + a)];
                        
                        if (a!=0)
                        {
                        NSString *string01 = [NSString stringWithFormat:@"Your Earthen Sword regenerates %d HP.",a];
                        CGSize size = [[CCDirector sharedDirector] winSize];
                        textBoxLayer = [[TextBoxLayer alloc] initWithColor:[UIColor grayColor] width: 320 height:60 padding:10 text:string01];
                        textBoxLayer.position =  ccp(-5, size.height/2 - 160);
                        textBoxLayer.delegate = self;
                        [self addChild:textBoxLayer z:INT_MAX];
                            [self performSelector:@selector(letTextGoAway) withObject:nil afterDelay:0.4];
                            //self.textPresent = YES;
                        return;
                        }
                    }
                }
            }
        self.battleCycleStatus++;
    }
    if (self.battleCycleStatus == 105)
    {
        if (!enemy.isBoss)
        {
            if (self.hero.equipPos5.itemCode == 93)
            {
                inBattleGoldMult *= 1.05;
                if (inBattleGoldMult >= 2.0)
                {
                    inBattleGoldMult = 2.0;
                }
                /*
                else
                {
                    NSString *string01 = [NSString stringWithFormat:@"Your Eagle's Charm increases the enemy's loot."];
                    CGSize size = [[CCDirector sharedDirector] winSize];
                    textBoxLayer = [[TextBoxLayer alloc] initWithColor:[UIColor grayColor] width: 320 height:60 padding:10 text:string01];
                    textBoxLayer.position =  ccp(-5, size.height/2 - 160);
                    textBoxLayer.delegate = self;
                    [self addChild:textBoxLayer z:INT_MAX];
                    self.textPresent = YES;
                    return;
                }
                 */
                
            }
            
            if (self.hero.equipPos5.itemCode == 98)
            {
                inBattleExpMult *= 1.06;
                if (inBattleExpMult >= 2.0)
                {
                    inBattleExpMult = 2.0;
                }
                /*
                else
                {
                    NSString *string01 = [NSString stringWithFormat:@"Your Amulet of Wisdom provides you insight about the battle."];
                    CGSize size = [[CCDirector sharedDirector] winSize];
                    textBoxLayer = [[TextBoxLayer alloc] initWithColor:[UIColor grayColor] width: 320 height:60 padding:10 text:string01];
                    textBoxLayer.position =  ccp(-5, size.height/2 - 160);
                    textBoxLayer.delegate = self;
                    [self addChild:textBoxLayer z:INT_MAX];
                    self.textPresent = YES;
                    return;
                }
                 */
            }
            
            if (self.hero.equipPos5.itemCode == 101)
            {
                int a = (int) (hero.heroHP * 0.02);
                if (a == 0)
                    a = 1;
                if ((hero.heroCurrentHP + a) > hero.heroHP)
                {
                    a = hero.heroHP-hero.heroCurrentHP;
                }
                if (a!=0)
                {
                    [self updateHP:(hero.heroCurrentHP + a)];
                
                    NSString *string01 = [NSString stringWithFormat:@"Vodek's Crystal restores your health by %d hit points.", a];
                    CGSize size = [[CCDirector sharedDirector] winSize];
                    textBoxLayer = [[TextBoxLayer alloc] initWithColor:[UIColor grayColor] width: 320 height:60 padding:10 text:string01];
                    textBoxLayer.position =  ccp(-5, size.height/2 - 160);
                    textBoxLayer.delegate = self;
                    [self addChild:textBoxLayer z:INT_MAX];
                    self.textPresent = YES;
                    return;
                }
            }
            
        }
        self.battleCycleStatus++;
    }
    if (self.battleCycleStatus == 106)
    {
        
            if (self.hero.equipPos4.itemCode == 125)
            {
                if (!heroMissed)
                {
                    int a;
                    double b,c;
                    b = arc4random()%4;
                    c = (8+b)/10.0;
                    a = (int) (lastDamageDealtByMe*c/9.0);
                    
                    if (a!=0)
                    {
                        if ((hero.heroCurrentHP + a) > hero.heroHP)
                        {
                            a = hero.heroHP-hero.heroCurrentHP;
                        }
                        if (a!=0)
                        {
                        [self updateHP:(hero.heroCurrentHP + a)];
                        
                        NSString *string01 = [NSString stringWithFormat:@"Your Armor of the Forest regenerates %d HP.",a];
                        CGSize size = [[CCDirector sharedDirector] winSize];
                        textBoxLayer = [[TextBoxLayer alloc] initWithColor:[UIColor grayColor] width: 320 height:60 padding:10 text:string01];
                        textBoxLayer.position =  ccp(-5, size.height/2 - 160);
                        textBoxLayer.delegate = self;
                        [self addChild:textBoxLayer z:INT_MAX];
                            [self performSelector:@selector(letTextGoAway) withObject:nil afterDelay:0.4];
                            //self.textPresent = YES;
                        return;
                        }
                    }
                }
            }
        
            else if (self.hero.equipPos4.itemCode == 127)
            {
                if (!enemy.isBoss)
                {
                    if (canAttackAgain)
                    {
                        inBattleGoldMult *= 1.08;
                        if (inBattleGoldMult >= 2.0)
                        {
                            inBattleGoldMult = 2.0;
                        }
                        /*
                        else
                        {
                            NSString *string01 = [NSString stringWithFormat:@"Your Dwarven Ringmail increases the enemy's loot."];
                            CGSize size = [[CCDirector sharedDirector] winSize];
                            textBoxLayer = [[TextBoxLayer alloc] initWithColor:[UIColor grayColor] width: 320 height:60 padding:10 text:string01];
                            textBoxLayer.position =  ccp(-5, size.height/2 - 160);
                            textBoxLayer.delegate = self;
                            [self addChild:textBoxLayer z:INT_MAX];
                            self.textPresent = YES;
                            return;
                        }
                         */
                    }
                }
                
            else if (self.hero.equipPos4.itemCode == 142)
            {
                if (!heroMissed)
                {
                    int a;
                    double b,c;
                    b = arc4random()%4;
                    c = (8+b)/10.0;
                    a = (int) (lastDamageDealtByMe*c/4.0);
                    
                    if (a!=0)
                    {
                        if ((hero.heroCurrentHP + a) > hero.heroHP)
                        {
                            a = hero.heroHP-hero.heroCurrentHP;
                        }
                        if (a!=0)
                        {
                        [self updateHP:(hero.heroCurrentHP + a)];
                        
                    
                        NSString *string01 = [NSString stringWithFormat:@"Heart heals you by %d HP.",a];
                        CGSize size = [[CCDirector sharedDirector] winSize];
                        textBoxLayer = [[TextBoxLayer alloc] initWithColor:[UIColor grayColor] width: 320 height:60 padding:10 text:string01];
                        textBoxLayer.position =  ccp(-5, size.height/2 - 160);
                        textBoxLayer.delegate = self;
                        [self addChild:textBoxLayer z:INT_MAX];
                            [self performSelector:@selector(letTextGoAway) withObject:nil afterDelay:0.4];
                            //self.textPresent = YES;
                        return;
                        }
                    }
                }
            }
            }
        self.battleCycleStatus++;
    }
    if (self.battleCycleStatus == 107)
    {
        self.battleCycleStatus++;
    }
    if (self.battleCycleStatus == 108)
    {
        self.battleCycleStatus = 14;
        won = NO;
        [self battleCycle];
        return;
    }
    if (self.battleCycleStatus == 109)
    {
        if (self.hero.equipPos1.itemCode == 74)
        {
            if (!heroMissed)
            {
                int a;
                double b,c;
                b = arc4random()%4;
                c = (8+b)/10.0;
                a = (int) (lastDamageDealtByMe*c/10.0);
                
                if (a!=0)
                {
                    if ((hero.heroCurrentHP + a) > hero.heroHP)
                    {
                        a = hero.heroHP-hero.heroCurrentHP;
                    }
                    [self updateHP:(hero.heroCurrentHP + a)];
                    
                    if (a!=0)
                    {
                    NSString *string01 = [NSString stringWithFormat:@"Your Earthen Sword regenerates %d HP.",a];
                    CGSize size = [[CCDirector sharedDirector] winSize];
                    textBoxLayer = [[TextBoxLayer alloc] initWithColor:[UIColor grayColor] width: 320 height:60 padding:10 text:string01];
                    textBoxLayer.position =  ccp(-5, size.height/2 - 160);
                    textBoxLayer.delegate = self;
                    [self addChild:textBoxLayer z:INT_MAX];
                        [self performSelector:@selector(letTextGoAway) withObject:nil afterDelay:0.4];
                        //self.textPresent = YES;
                    return;
                    }
                }
            }
        }
        self.battleCycleStatus++;
    }
    if (self.battleCycleStatus == 110)
    {
        if (!enemy.isBoss)
        {
        if (self.hero.equipPos5.itemCode == 93)
        {
            inBattleGoldMult *= 1.05;
            if (inBattleGoldMult >= 2.0)
            {
                inBattleGoldMult = 2.0;
            }
            else
            {
                /*
                NSString *string01 = [NSString stringWithFormat:@"Your Eagle's Charm increases the enemy's loot."];
                CGSize size = [[CCDirector sharedDirector] winSize];
                textBoxLayer = [[TextBoxLayer alloc] initWithColor:[UIColor grayColor] width: 320 height:60 padding:10 text:string01];
                textBoxLayer.position =  ccp(-5, size.height/2 - 160);
                textBoxLayer.delegate = self;
                [self addChild:textBoxLayer z:INT_MAX];
                self.textPresent = YES;
                return;
                 */
            }
            
        }
        
        if (self.hero.equipPos5.itemCode == 98)
        {
            inBattleExpMult *= 1.06;
            if (inBattleExpMult >= 2.0)
            {
                inBattleExpMult = 2.0;
            }
            else
            {
                /*
                NSString *string01 = [NSString stringWithFormat:@"Your Amulet of Wisdom provides you insight about the battle."];
                CGSize size = [[CCDirector sharedDirector] winSize];
                textBoxLayer = [[TextBoxLayer alloc] initWithColor:[UIColor grayColor] width: 320 height:60 padding:10 text:string01];
                textBoxLayer.position =  ccp(-5, size.height/2 - 160);
                textBoxLayer.delegate = self;
                [self addChild:textBoxLayer z:INT_MAX];
                self.textPresent = YES;
                return;
                 */
            }
        }
        }
        self.battleCycleStatus++;
    }
    if (self.battleCycleStatus == 111)
    {
            
            if (self.hero.equipPos4.itemCode == 125)
            {
                if (!heroMissed)
                {
                    int a;
                    double b,c;
                    b = arc4random()%4;
                    c = (8+b)/10.0;
                    a = (int) (lastDamageDealtByMe*c/9.0);
                    
                    if (a!=0)
                    {
                        if ((hero.heroCurrentHP + a) > hero.heroHP)
                        {
                            a = hero.heroHP-hero.heroCurrentHP;
                        }
                        if (a!=0)
                        {
                        [self updateHP:(hero.heroCurrentHP + a)];
                        
                        NSString *string01 = [NSString stringWithFormat:@"Your Armor of the Forest regenerates %d HP.",a];
                        CGSize size = [[CCDirector sharedDirector] winSize];
                        textBoxLayer = [[TextBoxLayer alloc] initWithColor:[UIColor grayColor] width: 320 height:60 padding:10 text:string01];
                        textBoxLayer.position =  ccp(-5, size.height/2 - 160);
                        textBoxLayer.delegate = self;
                        [self addChild:textBoxLayer z:INT_MAX];
                            [self performSelector:@selector(letTextGoAway) withObject:nil afterDelay:0.4];
                            //self.textPresent = YES;
                        return;
                        }
                    }
                    
                }
            }
            else if (self.hero.equipPos4.itemCode == 127)
            {
                if (!enemy.isBoss)
                {
                if (canAttackAgain)
                {
                    inBattleGoldMult *= 1.08;
                    if (inBattleGoldMult >= 2.0)
                    {
                        inBattleGoldMult = 2.0;
                    }
                    /*
                    else
                    {
                        NSString *string01 = [NSString stringWithFormat:@"Your Dwarven Ringmail increases the enemy's loot."];
                        CGSize size = [[CCDirector sharedDirector] winSize];
                        textBoxLayer = [[TextBoxLayer alloc] initWithColor:[UIColor grayColor] width: 320 height:60 padding:10 text:string01];
                        textBoxLayer.position =  ccp(-5, size.height/2 - 160);
                        textBoxLayer.delegate = self;
                        [self addChild:textBoxLayer z:INT_MAX];
                        self.textPresent = YES;
                        return;
                    }
                     */
                }
            }
            else if (self.hero.equipPos4.itemCode == 142)
            {
                if (!heroMissed)
                {
                    int a;
                    double b,c;
                    b = arc4random()%4;
                    c = (8+b)/10.0;
                    a = (int) (lastDamageDealtByMe*c/4.0);
                    
                    if (a!=0)
                    {
                        if ((hero.heroCurrentHP + a) > hero.heroHP)
                        {
                            a = hero.heroHP-hero.heroCurrentHP;
                        }
                        if (a!=0)
                        {
                        [self updateHP:(hero.heroCurrentHP + a)];
                        
                        NSString *string01 = [NSString stringWithFormat:@"Heart heals you by %d HP.",a];
                        CGSize size = [[CCDirector sharedDirector] winSize];
                        textBoxLayer = [[TextBoxLayer alloc] initWithColor:[UIColor grayColor] width: 320 height:60 padding:10 text:string01];
                        textBoxLayer.position =  ccp(-5, size.height/2 - 160);
                        textBoxLayer.delegate = self;
                        [self addChild:textBoxLayer z:INT_MAX];
                            [self performSelector:@selector(letTextGoAway) withObject:nil afterDelay:0.4];
                            //self.textPresent = YES;
                        return;
                        }
                    }
                }
            }
        }
    }
    if (self.battleCycleStatus == 112)
    {
        self.battleCycleStatus++;
    }
    if (self.battleCycleStatus == 113)
    {
        self.battleCycleStatus = 14;
        won = NO;
        [self battleCycle];
        return;
    }
    
    
}















-(void) onAttack
{
    if (!self.canTouchButtons)
        return;
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
    willAttack = YES;
    self.hero.heroAtkStyle = self.heroMoveCode;
    battleCycleStatus++;
    [self battleCycle];
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
    if (!self.canTouchButtons)
        return;
    [aggr selected];
    [quick unselected];
    [def unselected];
    if (heroMoveCode != 1)
        [MusicHandler playButtonClick];
    heroMoveCode = 1;
    hero.heroAtkStyle = heroMoveCode;
}
-(void) onQuick
{
    if (!self.canTouchButtons)
        return;
    [aggr unselected];
    [quick selected];
    [def unselected];
    if (heroMoveCode != 2)
        [MusicHandler playButtonClick];
    heroMoveCode = 2;
    hero.heroAtkStyle = heroMoveCode;
    
}
-(void) onDefensive
{
    if (!self.canTouchButtons)
        return;
    [aggr unselected];
    [quick unselected];
    [def selected];
    if (heroMoveCode != 3)
        [MusicHandler playButtonClick];
    heroMoveCode = 3;
    hero.heroAtkStyle = heroMoveCode;
}

-(void) goBackGame: (id)sender
{
    //if (!self.canTouchButtons)
    //    return;
    self.hero.heroCurrentHP = self.hero.heroHP;
    self.hero.mapInitMode = 8;
    [GameSceneManager sharedGameSceneManager].hero = self.hero;
    [MusicHandler playButtonClick];
    int temp = self.hero.currentMap;
    [SceneManager goPlay:temp];
}








-(void) animateHeroGetsAttacked
{
    id delay1 = [CCDelayTime actionWithDuration:0.2];
    id delay2 = [CCDelayTime actionWithDuration:0.3];
    id myCallFunc = [CCCallFunc actionWithTarget:self selector:@selector(playAttackSound)];
    id hideAction = [CCHide action];
    id showAction = [CCShow action];
    id sequence = [CCSequence actions: delay1,hideAction,delay2,myCallFunc,showAction,nil];
    
    animationBusy = YES;
    
    [heroSprite runAction: sequence];
    
}

-(void) animateEnemyGetsAttacked
{
    id delay1 = [CCDelayTime actionWithDuration:0.2];
    id delay2 = [CCDelayTime actionWithDuration:0.3];
    id myCallFunc = [CCCallFunc actionWithTarget:self selector:@selector(playAttackSound)];
    id hideAction = [CCHide action];
    id showAction = [CCShow action];
    id sequence = [CCSequence actions: delay1,hideAction,delay2,myCallFunc,showAction,nil];
    
    animationBusy = YES;
    
    [enemySprite runAction: sequence];
}

-(void)playAttackSound
{
    [MusicHandler playButtonClick];
    animationBusy = NO;
}










-(int) levelForExp:(int)exp
{
    if (exp < 10)
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
    if (exp < 140)
    {
        return 5;
    }
    if (exp < 210)
    {
        return 6;
    }
    if (exp < 310)
    {
        return 7;
    }
    if (exp < 450)
    {
        return 8;
    }
    if (exp < 640)
    {
        return 9;
    }
    if (exp < 900)
    {
        return 10;
    }
    if (exp < 1300)
    {
        return 11;
    }
    
    return 1;
    
}

-(void) levelFrom:(int)oldLevel ToLevel:(int)newLevel
{
    while (oldLevel < newLevel)
    {
        plusHP += 2 + (int)sqrt((double) oldLevel) + arc4random()%((int) sqrt((double)oldLevel));
        plusStr += 2 + (int)sqrt((double) oldLevel) + arc4random()%((int) sqrt((double)oldLevel));
        plusDef += 2 + (int)sqrt((double) oldLevel) + arc4random()%((int) sqrt((double)oldLevel));
        plusAgi += 2 + (int)sqrt((double) oldLevel) + arc4random()%((int) sqrt((double)oldLevel));
        plusFP += 2 + (int)sqrt((double) oldLevel) + arc4random()%((int) sqrt((double)oldLevel));
        plusAttrib += 1;
        int rand = newLevel%5;
        if (rand == 0)
            plusAttrib += 1;
        
        oldLevel++;
    }
    self.hero.heroHP += plusHP;
    
    //self.hero.heroCurrentHP += plusHP;
    
    [self updateHP:(hero.heroCurrentHP + plusHP)];
        
    self.hero.heroStr += plusStr;
    self.hero.heroStrDef += plusDef;
    self.hero.heroSPD += plusAgi;
    self.hero.freePoints += plusFP;
    self.hero.attributePoints += plusAttrib;
    self.hero.heroLvl = newLevel;
    [GameSceneManager sharedGameSceneManager].hero = self.hero;
    
    return;
}


-(void)heroDies
{
    if (battleID == 101)
    {
        self.hero.hasLitOrb = NO;
        self.hero.beatBoss1 = NO;
        
        
        NSMutableArray *array = [self.hero.heroInventory mutableCopy];
        Item *itemGiven = [[Item alloc] initWithItemCode:25];
        
        [array addObject:(itemGiven)];
        self.hero.heroInventory = array;
    }
    self.hero.mapInitMode = 4;
    [GameSceneManager sharedGameSceneManager].hero = self.hero;
    [SceneManager goPlay:1];
}






-(void)itemCycle:(int)itemCode
{
    currentItemCode = itemCode;
    Item *temp1 = [[Item alloc] initWithItemCode:itemCode];
    NSMutableArray *array = [hero.heroInventory mutableCopy];
    BOOL shouldDeleteItem = NO;
    int tempIndex;
    for (int i = 0; i < array.count; i++)
    {
        if (((Item*)[array objectAtIndex:i]).itemCode == currentItemCode)
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
    hero.heroInventory = array;
    [GameSceneManager sharedGameSceneManager].hero = hero;
    
    
    NSString *string;
    string = [NSString stringWithFormat:@"You used the %@.",temp1.name];
    CGSize size = [[CCDirector sharedDirector] winSize];
    textBoxLayer = [[TextBoxLayer alloc] initWithColor:[UIColor grayColor] width: 320 height:60 padding:10 text:string];
    textBoxLayer.position =  ccp(-5, size.height/2 - 160);
    textBoxLayer.delegate = self;
    self.textPresent = YES;
    [self addChild:textBoxLayer z:INT_MAX]; 
    [MusicHandler playButtonClick];
    
    
    self.battleCycleStatus = 39;
}

-(void)fleeCycle
{
    NSString *string;
    string = [NSString stringWithFormat:@"You ran away!"];
    CGSize size = [[CCDirector sharedDirector] winSize];
    textBoxLayer = [[TextBoxLayer alloc] initWithColor:[UIColor grayColor] width: 320 height:60 padding:10 text:string];
    textBoxLayer.position =  ccp(-5, size.height/2 - 160);
    textBoxLayer.delegate = self;
    self.textPresent = YES;
    [self addChild:textBoxLayer z:INT_MAX];
    self.canTouchButtons = NO;
    
    self.battleCycleStatus = 49;
}










-(void) letTextGoAway
{
    self.textPresent = YES;
}

-(void) updateHP:(int)newHP //CREATE isUpdating boolean that doesn't let text go away until it's done!! 
{
    int min = 413;
    
    double temp = newHP/((double)hero.heroHP);
    int newPosX = min + 104*temp;
    CGPoint newPos = ccp(newPosX, 129);
    
    double time = sqrt(abs((double)newHP-hero.heroCurrentHP))/36.0 + 0.03;
    
    id actionMove = [CCMoveTo actionWithDuration:time position:newPos];
    [hpBar runAction:[CCSequence actions:actionMove,nil]];
    
    int numSteps = abs(newHP - hero.heroCurrentHP);
    if (numSteps == 0)
        return;
    time = time/numSteps;
    
    
    [self updateHPLabelTo:newHP WithTime:time];
    
}

-(void) updateHPLabelTo:(int)newVal WithTime:(double)time
{
    int numSteps = abs(newVal - hero.heroCurrentHP);
    if (numSteps == 0)
        return;
    
    BOOL hpDecreasing;
    if (newVal >= hero.heroCurrentHP)
    {
        hpDecreasing = NO;
    }
    else
    {
        hpDecreasing = YES;
    }
    
    if (hpDecreasing)
    {
        if (numSteps > 0)
        {
            hero.heroCurrentHP--;
            [self removeChild:hpLabel cleanup:YES];
            hpLabel = [CCLabelTTF labelWithString:[NSString stringWithFormat:@"%d/%d",hero.heroCurrentHP,hero.heroHP] dimensions:CGSizeMake(80.0, 24.0) alignment:UITextAlignmentRight fontName:@"Optima-Bold" fontSize:13.0];
            hpLabel.color = ccc3(0, 0, 0);
            hpLabel.position = ccp(400,112);
            [self addChild:hpLabel z:40];
            
            CCSendMessages *crazy = [CCSendMessages actionWithTarget:self];
            [[crazy addMessage] updateHPLabelTo:newVal WithTime:time];
            CCDelayTime *delay = [CCDelayTime actionWithDuration:time];
            [self runAction:[CCSequence actions:delay,crazy,nil]]; 
            
        }
    }
    else
    {
        if (numSteps > 0)
        {
            hero.heroCurrentHP++;
            [self removeChild:hpLabel cleanup:YES];
            hpLabel = [CCLabelTTF labelWithString:[NSString stringWithFormat:@"%d/%d",hero.heroCurrentHP,hero.heroHP] dimensions:CGSizeMake(80.0, 24.0) alignment:UITextAlignmentRight fontName:@"Optima-Bold" fontSize:13.0];
            hpLabel.color = ccc3(0, 0, 0);
            hpLabel.position = ccp(400,112);
            [self addChild:hpLabel z:40];
            
            CCSendMessages *crazy = [CCSendMessages actionWithTarget:self];
            [[crazy addMessage] updateHPLabelTo:newVal WithTime:time];
            CCDelayTime *delay = [CCDelayTime actionWithDuration:time];
            [self runAction:[CCSequence actions:delay,crazy,nil]]; 
            
        }
    }
}








-(void)onFlee
{
    if (!canTouchButtons)
        return;
    [self fleeCycle];
}


-(void)onItem
{
    if (canTouchButtons)
    {
        canTouchButtons = NO;
        
        itemDisplay = [[DisplayBattleItems alloc] init];
        [self addChild:itemDisplay z:99999];
        
        isShowingItemScreen = YES;
        
    }
}


-(void)touchedBack
{
    if (isShowingItemScreen)
    {
        [self removeChild:itemDisplay cleanup:YES];
        isShowingItemScreen = NO;
        self.canTouchButtons = YES;
        isShowingItemScreen = NO;
    }
}







- (void)gameLoop: (ccTime) dT {
    [textBoxLayer update:dT];
}

-(void) textBox:(id<TextBox>)tbox didFinishAllTextWithPageCount:(int)pc {
    if (!self.textPresent)
    {
        CCSendMessages *crazy = [CCSendMessages actionWithTarget:self];
        [[crazy addMessage] textBox:tbox didFinishAllTextWithPageCount:pc];
        CCDelayTime *delay = [CCDelayTime actionWithDuration:0.15];
        [[CCDirector sharedDirector].runningScene runAction:[CCSequence actions:delay,crazy,nil]]; 
        return;
    }
    [self removeChild:textBoxLayer cleanup:YES];
    self.textPresent = NO;
    
    self.battleCycleStatus++;
    [self battleCycle];
}   





@end
