//
//  BattleLayer.m
//  Quest
//
//  Created by Leo Linsky on 3/17/14.
//
//

#import "BattleLayer.h"
#import "CCSendMessages.h"




@implementation BattleLayer

@synthesize currentAttackCode = _currentAttackCode;

@synthesize textPresent = _textPresent, currentItemCode = _currentItemCode, canTouchButtons = _canTouchButtons, hero = _hero, isUpdating = _isUpdating, animationBusy = _animationBusy, isBoss = _isBoss;

+(id)nodeWithBattleID:(int)BID
{
    return [[[self alloc] initWithBattleID:BID] autorelease];
}

-(id)initWithBattleID:(int)battleCode
{
    if ((self = [super init]))
    {
        _hero = [GameSceneManager sharedGameSceneManager].hero;
        enemy = [Monster monsterWithCode:battleCode];
        [enemy retain];
        BID = battleCode;
        
        if ([GameSceneManager sharedGameSceneManager].hero.equipPos1)
        {
            moveSet = [GameSceneManager sharedGameSceneManager].hero.equipPos1.moveSet;
        }
        else {
            NSNumber *move1 = [NSNumber numberWithInt:1];
            NSNumber *move2 = [NSNumber numberWithInt:2];
            NSNumber *move3 = [NSNumber numberWithInt:3];
            moveSet = [[NSArray alloc] initWithObjects:move1,move2,move3, nil];
        }
        
        _currentItemCode = 0;
        isShowingItemScreen = NO;
        
        _currentAttackCode = 0;
        
        
        battleCycleStatus = 0;
        
        isBossBattle = enemy.isBoss;
        _isBoss = isBossBattle;
        
        wonBattle = NO;
        lostBattle = NO;
        
        heroMovedFirst = NO;
        
        
        tempStrMultItem = 1; //item multipliers
        tempDefMultItem = 1;
        tempAgiMultItem = 1;
        
        inBattleExpMult = 1;
        inBattleGoldMult = 1;
        
        miscEnemyAgiMult = 1;
        miscEnemyDefMult = 1;
        miscEnemyStrMult = 1;
        
        lastDamageDone = 0;
        lastDamageTaken = 0;
        lastHitCritical = NO;
        
        minEnemyDef = enemy.monsterStrDef/2 + 1;
        minEnemyStr = enemy.monsterStr/2 + 1;
        
        oldExp = _hero.exp;
        plusHP = 0;
        plusStr = 0;
        plusDef = 0;
        plusAgi = 0;
        plusFP = 0;
        plusAttrib = 0;
        
        
        
        
        
        
        CGSize winSize = [[CCDirector sharedDirector] winSize];
        
        ////////
        /////// Temp UI
        
        /*
        textBoxLayer;
        enemySprite;
        heroSprite;
        
        styleA;
        styleB;
        styleC;
        
        hpBar;
        hpBarCover;
        hpLabel;
        
        background;
        
        itemDisplay;
        */
        
        CCMenuItemImage *flee = [CCMenuItemImage itemFromNormalImage:@"battlebuttonflee002.png" selectedImage:@"battlebuttonflee002_pressed.png" target:self selector:@selector(onFlee)];
		CCMenu *menu = [CCMenu menuWithItems:flee, nil];
		menu.position = ccp(49, winSize.height - 22);
		[menu alignItemsVerticallyWithPadding: 12.0f];
		[self addChild:menu z:2];
        
        CCMenuItemImage *item = [CCMenuItemImage itemFromNormalImage:@"battlebuttonitem002.png" selectedImage:@"battlebuttonitem002_pressed.png" target:self selector:@selector(onItem)];
		CCMenu *menu23 = [CCMenu menuWithItems:item, nil];
		menu23.position = ccp(winSize.width - 49, winSize.height - 22);
		[menu23 alignItemsVerticallyWithPadding: 12.0f];
		[self addChild:menu23 z:2];
        
        /*
        CCMenuItemImage *backToGame = [CCMenuItemImage itemFromNormalImage:@"back_button.png" selectedImage:@"back_button_down.png" target:self selector:@selector(goBackGame)];
		CCMenu *menu24 = [CCMenu menuWithItems:backToGame, nil];
		menu24.position = ccp(180, winSize.height - 20);
		[menu24 alignItemsVerticallyWithPadding: 12.0f];
		[self addChild:menu24 z:2];
         */
        
        CCMenuItemImage *attackButton = [CCMenuItemImage itemFromNormalImage:@"battlebuttonattack002.png" selectedImage:@"battlebuttonattack002_pressed.png" target:self selector: @selector(onAttack)];
		CCMenu *penu = [CCMenu menuWithItems:attackButton, nil];
		penu.position = ccp(416, 102);
		[self addChild:penu z:6 tag:101];
        
        enemySprite = [CCSprite spriteWithFile:enemy.imageFile];
        enemySprite.position = ccp(winSize.width/2, winSize.height/2+winSize.height/16);
        [self addChild:enemySprite];
        
        /*
        NSString *styleAString = [NSString stringWithFormat:@"styleButton%d.png",[[moveSet objectAtIndex:0] intValue]];
        NSString *styleAStringSelected = [NSString stringWithFormat:@"styleButton%d_sel.png",[[moveSet objectAtIndex:0] intValue]];
        NSString *styleBString = [NSString stringWithFormat:@"styleButton%d.png",[[moveSet objectAtIndex:1] intValue]];
        NSString *styleBStringSelected = [NSString stringWithFormat:@"styleButton%d_sel.png",[[moveSet objectAtIndex:1] intValue]];
        NSString *styleCString = [NSString stringWithFormat:@"styleButton%d.png",[[moveSet objectAtIndex:2] intValue]];
        NSString *styleCStringSelected = [NSString stringWithFormat:@"styleButton%d_sel.png",[[moveSet objectAtIndex:2] intValue]];
        */
        
        /////TEMP
        
        NSString *styleAString = @"battlebuttonskilltemplate001.png";
        NSString *styleAStringSelected = @"battlebuttonskilltemplate001_pressed.png";
        NSString *styleBString = @"battlebuttonskilltemplate001.png";
        NSString *styleBStringSelected = @"battlebuttonskilltemplate001_pressed.png";
        NSString *styleCString = @"battlebuttonskilltemplate001.png";
        NSString *styleCStringSelected = @"battlebuttonskilltemplate001_pressed.png";
        
        /// ^ DELETE SOON ^
        
        styleA = [CCMenuItemImage itemFromNormalImage:styleAString selectedImage:styleAStringSelected target:self selector:@selector(onStyleA)];
		styleB = [CCMenuItemImage itemFromNormalImage:styleBString selectedImage:styleBStringSelected target:self selector:@selector(onStyleB)];
		styleC = [CCMenuItemImage itemFromNormalImage:styleCString selectedImage:styleCStringSelected target:self selector: @selector(onStyleC)];
        
        CCMenu *menu2 = [CCMenu menuWithItems:styleA, styleB, styleC, nil];
		menu2.position = ccp(winSize.width - 64, 30);
		[menu2 alignItemsHorizontallyWithPadding: -18.0f];
		[self addChild:menu2 z:400];
        
        
        CCSprite *menuSprite = [CCSprite spriteWithFile:@"battlemenu001.png"];
        menuSprite.position = ccp(winSize.width/2,winSize.height/2);
        [self addChild:menuSprite z:-1];
        
        
        hpBarCover = [CCSprite spriteWithFile:@"battlebackblue.png"];
        hpBarCover.position = ccp(winSize.width/2,winSize.height/2);
        [self addChild:hpBarCover z:-3];
        
        int min = 413;
        hpBar = [CCSprite spriteWithFile:@"healthbarwhite1.png"];
        double temp = _hero.heroCurrentHP/((double)_hero.heroHP);
        int pos = min + 104*temp;
        hpBar.position = ccp(pos,175);
        [self addChild:hpBar z:-2];
        hpLabel = [CCLabelTTF labelWithString:[NSString stringWithFormat:@"%d/%d",_hero.heroCurrentHP,_hero.heroHP] dimensions:CGSizeMake(80.0, 24.0) alignment:UITextAlignmentRight fontName:@"Optima-Bold" fontSize:18.0];
        hpLabel.color = ccc3(0, 0, 0);
        hpLabel.position = ccp(395,158);
        [self addChild:hpLabel z:40];
        
        
        background = [CCSprite spriteWithFile:enemy.backgroundImageFile];
        background.position = ccp(winSize.width/2, winSize.height/2);
        [self addChild:background z:-3];
        
        
        
        //////////
        //////////
        
        
        
        
        _textPresent = NO;
        _isUpdating = NO;
        _animationBusy = NO;
        
        _canTouchButtons = YES;
        [self onStyleA]; //sets self.currentAttackCode and styleAtkMult,Def,Agi...
        
        [self schedule:@selector(gameLoop:) interval:1/60.0f];
        
        battleCycleStatus = 0;
        
    }
    return self;
}

-(void)startBattle
{
    if (BID >= 100) //
    {
        [MusicHandler resetBackgroundMusic:10];
    }
    else{
        [MusicHandler resetBackgroundMusic:9];
    }
    
    NSString *string;
    if (isBossBattle)
    {
        string = [NSString stringWithFormat:@"%@ is ready for Battle.",enemy.name];
    }
    else{
        string = [NSString stringWithFormat:@"%@ appeared!",enemy.name];
    }
    self.canTouchButtons = NO;
    currentMove = 9;
    [self showText:string];
     
}


-(void)doBattleCycle:(int)moveCode //DONE
{
    currentMove = moveCode;
    battleCycleStatus = 1;
    self.canTouchButtons = NO;
    //Figure out the command that brought us here
    
    if (moveCode == 1)
    {
        [self fleeCycle];
    }
    else if (moveCode == 2)
    {
        [self attackCycle];
    }
    else if (moveCode == 3)
    {
        [self itemCycle];
    }
    else
    {
        NSLog(@"moveCode ERROR in doBattleCycle");
    }
}



-(void)fleeCycle //DONE
{
    if (battleCycleStatus == 1)
    {
        self.canTouchButtons = NO; // should already be no
        BOOL escaped;
        NSString *string;
        heroMovedFirst = YES;
        
        if (isBossBattle)
        {
            string = @"You can't run away from this battle!";
            battleCycleStatus = 10;
            [self showText:string];
            return;
        }
        else
        {
            escaped = [self tryEscape];
            if (escaped)
            {
                string = @"You got away safely!";
                battleCycleStatus = 11;
                [self showText:string];
                return;
            }
            else {
                string = [NSString stringWithFormat:@"You tried to run away, but %@ cut off your escape route!",enemy.name];
                [self showText:string];
                return;
            }
        }
    }
    if (battleCycleStatus == 2)
    {
        [self enemyAttack];
        return; //it returns here because it always creates a textbox to call the cycle again
    }
    if (battleCycleStatus == 3)
    {
        [self defEquipPos1]; //if it creates text, it won't inc battleCycle fast enough to be an issue anyway
    }
    if (battleCycleStatus == 4)
    {
        [self defEquipPos2];
    }
    if (battleCycleStatus == 5)
    {
        [self defEquipPos3];
    }
    if (battleCycleStatus == 6)
    {
        [self defEquipPos4];
    }
    if (battleCycleStatus == 7)
    {
        [self defEquipPos5];
    }
    if (battleCycleStatus == 8)
    {
        [self defAttrib];
    }
    if (battleCycleStatus == 9)
    {
        if (wonBattle)
        {
            [self heroWins]; //Calls winCycle and displays level ups, text (for bosses), rewards, etc
            return;
        }
        else if (lostBattle)
        {
            [self heroDies];
            return;
        }
        else
        {
            self.canTouchButtons = YES;
            return;
        }
    }
    if (battleCycleStatus == 11)
    {
        self.canTouchButtons = YES;
        return;
    }
    if (battleCycleStatus == 12)
    {
        self.hero.mapInitMode = 8;
        [GameSceneManager sharedGameSceneManager].hero = self.hero;
        int temp = self.hero.currentMap;
        [SceneManager goPlay:temp];
    }
    
}

//Determine type of attack, animation, hit/miss, damage, and then display text 
-(void)enemyAttack  //DONE
{
    if (wonBattle)
    {
        battleCycleStatus++;
        return;
    }
    NSArray *skills = [enemy.monsterSkills copy];
    
    double pdf = 0.0;
    double random = ((double)(arc4random()%100))/100;
    int index = 0;
    for (int i=0;i<[skills count];i++)
    {
        pdf += [((NSNumber*)[skills objectAtIndex:i]) doubleValue];
        if (pdf > random)
        {
            index = i; //choose attack type for enemy
            break;
        }
    }
    index++; //For reference in our system that starts with 1
    
    NSString *battleString;
    
    BOOL hit = [self getAttackHitEnemy];
    int damageTaken = 0;
    if (hit)
    {
        damageTaken = [self getAttackDamageEnemy:index];
    }
    else{
        battleString = [NSString stringWithFormat:@"%@ tried to attack, but you dodged!",enemy.name];
        [self showText:battleString];
        return;
    }

    if (index == 1) //Attack
    {
        if (lostBattle)
        {
            battleString = [NSString stringWithFormat:@"%@ attacked! You took %d damage. Oh no - you have been defeated!",enemy.name, damageTaken];
        }
        else
        {
            battleString = [NSString stringWithFormat:@"%@ attacked! You took %d damage.",enemy.name, damageTaken];
        }
        [self showText:battleString];
        [self enemyAttackAnimation];
    }
    else if (index == 2) //Scratch
    {
        if (lostBattle)
        {
            battleString = [NSString stringWithFormat:@"%@ scratched you! You took %d damage. Oh no - you have been defeated!",enemy.name, damageTaken];
        }
        else
        {
            battleString = [NSString stringWithFormat:@"%@ scratched you! You took %d damage.",enemy.name, damageTaken];
        }
        [self showText:battleString];
        [self enemyScratchAnimation];
    }
    else if (index == 3) //Maul
    {
        if (lostBattle)
        {
            battleString = [NSString stringWithFormat:@"%@ mauled you! You took %d damage. Oh no - you have been defeated!",enemy.name, damageTaken];
        }
        else
        {
            battleString = [NSString stringWithFormat:@"%@ mauled you! You took %d damage.",enemy.name, damageTaken];
        }
        [self showText:battleString];
        [self enemyMaulAnimation];
    }
    else if (index == 5) //Bite
    {
        if (lostBattle)
        {
            battleString = [NSString stringWithFormat:@"%@ bit you with razor sharp teeth! You took %d damage. Oh no - you have been defeated!",enemy.name, damageTaken];
        }
        else
        {
            battleString = [NSString stringWithFormat:@"%@ bit you with razor sharp teeth! You took %d damage.",enemy.name, damageTaken];
        }
        [self showText:battleString];
        [self enemyBiteAnimation];
    }
    else if (index == 6) //Ram
    {
        if (lostBattle)
        {
            battleString = [NSString stringWithFormat:@"%@ rammed you at full speed! You took %d damage. Oh no - you have been defeated!",enemy.name, damageTaken];
        }
        else
        {
            battleString = [NSString stringWithFormat:@"%@ rammed you at full speed! You took %d damage.",enemy.name, damageTaken];
        }
        [self showText:battleString];
        [self enemyRamAnimation];
    }
    else if (index == 7) //Lash
    {
        if (lostBattle)
        {
            battleString = [NSString stringWithFormat:@"%@ lashed at you! You took %d damage. Oh no - you have been defeated!",enemy.name, damageTaken];
        }
        else
        {
            battleString = [NSString stringWithFormat:@"%@ lashed at you! You took %d damage.",enemy.name, damageTaken];
        }
        [self showText:battleString];
        [self enemyLashAnimation];
    }
    else if (index == 8) //Slash
    {
        if (lostBattle)
        {
            battleString = [NSString stringWithFormat:@"%@ vicously slashed you! You took %d damage. Oh no - you have been defeated!",enemy.name, damageTaken];
        }
        else
        {
            battleString = [NSString stringWithFormat:@"%@ vicously slashed you! You took %d damage.",enemy.name, damageTaken];
        }
        [self showText:battleString];
        [self enemySlashAnimation];
    }
    else if (index == 9) //Stab
    {
        if (lostBattle)
        {
            battleString = [NSString stringWithFormat:@"%@ stabbed at you! You took %d damage. Oh no - you have been defeated!",enemy.name, damageTaken];
        }
        else
        {
            battleString = [NSString stringWithFormat:@"%@ stabbed at you! You took %d damage.",enemy.name, damageTaken];
        }
        [self showText:battleString];
        [self enemyStabAnimation];
    }
    else if (index == 10) //Gust
    {
        if (lostBattle)
        {
            battleString = [NSString stringWithFormat:@"%@ summoned hurricane winds! You took %d damage. Oh no - you have been defeated!",enemy.name, damageTaken];
        }
        else
        {
            battleString = [NSString stringWithFormat:@"%@ summoned hurricane winds! You took %d damage.",enemy.name, damageTaken];
        }
        [self showText:battleString];
        [self enemyGustAnimation];
    }
    else if (index == 11) //Curse
    {
        if (lostBattle)
        {
            battleString = [NSString stringWithFormat:@"%@ cast a curse! You took %d damage. Oh no - you have been defeated!",enemy.name, damageTaken];
        }
        else
        {
            battleString = [NSString stringWithFormat:@"%@ cast a curse! You took %d damage.",enemy.name, damageTaken];
        }
        [self showText:battleString];
        [self enemyCurseAnimation];
    }
    else if (index == 12) //Fire
    {
        if (lostBattle)
        {
            battleString = [NSString stringWithFormat:@"%@ created an inferno! You took %d damage. Oh no - you have been defeated!",enemy.name, damageTaken];
        }
        else
        {
            battleString = [NSString stringWithFormat:@"%@ created an inferno! You took %d damage.",enemy.name, damageTaken];
        }
        [self showText:battleString];
        [self enemyFireAnimation];
    }
    else if (index == 13) //Blizzard
    {
        if (lostBattle)
        {
            battleString = [NSString stringWithFormat:@"%@ started a blizzard! You took %d damage. Oh no - you have been defeated!",enemy.name, damageTaken];
        }
        else
        {
            battleString = [NSString stringWithFormat:@"%@ started a blizzard! You took %d damage.",enemy.name, damageTaken];
        }
        [self showText:battleString];
        [self enemyBlizzardAnimation];
    }
    else if (index == 14) //Heal
    {
        int healed = enemy.monsterCurrentHP;
        enemy.monsterCurrentHP += MAX( MIN(enemy.monsterHP/8, 100), 1);
        if (enemy.monsterCurrentHP > enemy.monsterHP)
        {
            enemy.monsterCurrentHP = enemy.monsterHP;
        }
        healed = abs(healed-enemy.monsterCurrentHP);
        battleString = [NSString stringWithFormat:@"%@ regenerated health! He gained %d HP.",enemy.name, healed];
        
        [self showText:battleString];
        [self enemyHealAnimation];
    }
    else{
        NSLog(@"\nEnemy Cycle ERROR\n");
    }
    
}

//We won't deal with winning in this method. We will say '%@ has been defeated' in heroWins
-(void)heroAttack //DONE
{
    if (lostBattle)
    {
        battleCycleStatus++;
        return;
    }
    
    NSString *battleString;
    
    BOOL hit = [self getAttackHitHero];
    int damageDone = 0;
    lastHitCritical = NO;
    if (hit)
    {
        damageDone = [self getAttackDamageHero]; // at least 1 damage
    }
    else{
        battleString = [NSString stringWithFormat:@"You tried to attack, but %@ was too quick!",enemy.name];
        [self showText:battleString];
        return;
    }
    
    NSString *critString = @"";
    if (lastHitCritical)
    {
        critString = @" Critical hit!";
    }
    if (self.currentAttackCode == 1) //Charge
    {
        battleString = [NSString stringWithFormat:@"You charged %@.%@ You dealt %d damage.",enemy.name,critString,damageDone];
        [self heroChargeAnimation];
    }
    else if (self.currentAttackCode == 2) //Kick
    {
        battleString = [NSString stringWithFormat:@"You kicked %@.%@ You dealt %d damage.",enemy.name,critString,damageDone];
        [self heroKickAnimation];
    }
    else if (self.currentAttackCode == 3) //Punch
    {
        battleString = [NSString stringWithFormat:@"You punched %@.%@ You dealt %d damage.",enemy.name,critString,damageDone];
        [self heroPunchAnimation];
    }
    else if (self.currentAttackCode == 4) //Melee
    {
        battleString = [NSString stringWithFormat:@"You hit %@.%@ You dealt %d damage.",enemy.name,critString,damageDone];
        [self heroMeleeAnimation];
    }
    else if (self.currentAttackCode == 5) //Stab
    {
        battleString = [NSString stringWithFormat:@"You stabbed at %@.%@ You dealt %d damage.",enemy.name,critString,damageDone];
        [self heroStabAnimation];
    }
    else if (self.currentAttackCode == 6) //Slice
    {
        battleString = [NSString stringWithFormat:@"You sliced %@.%@ You dealt %d damage.",enemy.name,critString,damageDone];
        [self heroSliceAnimation];
    }
    else if (self.currentAttackCode == 7) //Chop
    {
        battleString = [NSString stringWithFormat:@"You chopped %@.%@ You dealt %d damage.",enemy.name,critString,damageDone];
        [self heroChopAnimation];
    }
    else if (self.currentAttackCode == 8) //Crush
    {
        battleString = [NSString stringWithFormat:@"You crushed %@.%@ You dealt %d damage.",enemy.name,critString,damageDone];
        [self heroCrushAnimation];
    }
    else if (self.currentAttackCode == 9) //Cleave
    {
        battleString = [NSString stringWithFormat:@"You cleaved %@.%@ You dealt %d damage.",enemy.name,critString,damageDone];
        [self heroCleaveAnimation];
    }
    else if (self.currentAttackCode == 10) //Slash
    {
        battleString = [NSString stringWithFormat:@"You slashed %@.%@ You dealt %d damage.",enemy.name,critString,damageDone];
        [self heroSlashAnimation];
    }
    else if (self.currentAttackCode == 11) //FireSlash
    {
        battleString = [NSString stringWithFormat:@"You Fire-Slashed %@.%@ You dealt %d damage.",enemy.name,critString,damageDone];
        [self heroFireSlashAnimation];
    }
    else if (self.currentAttackCode == 12) //LightningSlash
    {
        battleString = [NSString stringWithFormat:@"You Lightning-Slashed %@.%@ You dealt %d damage.",enemy.name,critString,damageDone];
        [self heroLightSlashAnimation];
    }
    else if (self.currentAttackCode == 13) //MagicSlice
    {
        battleString = [NSString stringWithFormat:@"You performed an Enchanted Strike on %@.%@ You dealt %d damage.",enemy.name,critString,damageDone];
        [self heroMagicSliceAnimation];
    }
    [self showText:battleString];
    return;
}

-(BOOL)getAttackHitEnemy //Clarification: This is whether the enemy attack hit me or not
{
    BOOL monsterHit;
    
    int randNum = arc4random()%20;
    
    double enemyTempSpeed = enemy.monsterSpeed + 1;
    double heroTempSpeed = styleAgiMult*(self.hero.heroSPD*self.hero.aglMult + self.hero.aglBonus) + 1;
    
    enemyTempSpeed = (enemyTempSpeed + enemyTempSpeed*(arc4random()%10)/10.0);
    
    
    if (enemyTempSpeed > 5*heroTempSpeed)
    {
        monsterHit = TRUE;
    }
    else if (enemyTempSpeed > 3*heroTempSpeed)
    {
        if (randNum > 0)
        {
            monsterHit = YES;
        }
        else
        {
            monsterHit = NO;
        }
    }
    else if (enemyTempSpeed > 2*heroTempSpeed)
    {
        if (randNum > 1)
        {
            monsterHit = YES;
        }
        else
        {
            monsterHit = NO;
        }
    }
    else if (enemyTempSpeed > heroTempSpeed)
    {
        if (randNum > 3)
        {
            monsterHit = YES;
        }
        else
        {
            monsterHit = NO;
        }
    }
    else if (enemyTempSpeed*5 < heroTempSpeed)
    {
        if (randNum > 17)
        {
            monsterHit = YES;
        }
        else
        {
            monsterHit = NO;
        }
    }
    else if (enemyTempSpeed*3 < heroTempSpeed)
    {
        if (randNum > 13)
        {
            monsterHit = YES;
        }
        else
        {
            monsterHit = NO;
        }
    }
    else if (enemyTempSpeed*2 < heroTempSpeed)
    {
        if (randNum > 9)
        {
            monsterHit = YES;
        }
        else
        {
            monsterHit = NO;
        }
    }
    else if (enemyTempSpeed <= heroTempSpeed)
    {
        if (randNum > 7)
        {
            monsterHit = YES;
        }
        else
        {
            monsterHit = NO;
        }
    }
    
    if (!monsterHit)
    {
        lastDamageTaken = 0;
    }
    return monsterHit;
}

-(int)getAttackDamageEnemy:(int)index
{
    double enemyAtkMult = 1;
    if (index == 1)
    {
        enemyAtkMult = 1;
    }
    else if (index == 2)
    {
        enemyAtkMult = 1.4;
    }
    else if (index == 3)
    {
        enemyAtkMult = 2;
    }
    else if (index == 4)
    {
        enemyAtkMult = 1.5;
    }
    else if (index == 5)
    {
        enemyAtkMult = 2.3;
    }
    else if (index == 6)
    {
        enemyAtkMult = 1.2;
    }
    else if (index == 7)
    {
        enemyAtkMult = 2.2;
    }
    else if (index == 8)
    {
        enemyAtkMult = 1.3;
    }
    else if (index == 9)
    {
        enemyAtkMult = 2.8;
        if (self.hero.attrib7)
        {
            enemyAtkMult *= 0.6;
        }
    }
    else if (index == 10)
    {
        enemyAtkMult = 2.5;
        if (self.hero.attrib7)
        {
            enemyAtkMult *= 0.6;
        }
    }
    else if (index == 11)
    {
        enemyAtkMult = 3.5;
        if (self.hero.attrib7)
        {
            enemyAtkMult *= 0.6;
        }
    }
    else if (index == 12)
    {
        enemyAtkMult = 3.5;
        if (self.hero.attrib7)
        {
            enemyAtkMult *= 0.6;
        }
    }
    else if (index == 13)
    {
        enemyAtkMult = 0;
    }
    
    double rand = 90 + arc4random()%20;
    double heroDefPower = rand*tempDefMultItem*styleDefMult*((double)(self.hero.heroStrDef*self.hero.strMult + self.hero.strBonus))/100 + rand*tempAgiMultItem*styleAgiMult*((double)(self.hero.heroSPD*self.hero.aglMult+ self.hero.aglBonus))/400;
    double monsterAtkPower = miscEnemyStrMult*enemyAtkMult*enemy.monsterStr;
    
    
    double temp = monsterAtkPower/heroDefPower;
    if (temp <= 1)
    {
        if (temp > 0.4)
        {
            temp = 1;
        }
        else{
            temp = 0;
        }
    }
    int enemyDamageDealt = (int) temp;
    
    
    if (enemyDamageDealt >= self.hero.heroCurrentHP)
    {
        enemyDamageDealt = self.hero.heroCurrentHP;
        lostBattle = YES;
    }
    lastDamageTaken = enemyDamageDealt;
    
    [self updateHP:(self.hero.heroCurrentHP - enemyDamageDealt)];
    //self.hero.heroCurrentHP -= enemyDamageDealt;
    
    return enemyDamageDealt;
}

-(BOOL)getAttackHitHero
{
    BOOL heroHit;
    
    int randNum = arc4random()%20;
    
    double enemyTempSpeed = enemy.monsterSpeed + 1;
    double heroTempSpeed = styleAgiMult*(self.hero.heroSPD*self.hero.aglMult + self.hero.aglBonus) + 1;
    
    enemyTempSpeed = (enemyTempSpeed + enemyTempSpeed*(arc4random()%10)/10.0);
    
    
    if (enemyTempSpeed > 5*heroTempSpeed)
    {
        if (randNum > 11)
        {
            heroHit = YES;
        }
        else
        {
            heroHit = NO;
        }
    }
    else if (enemyTempSpeed > 3*heroTempSpeed)
    {
        if (randNum > 9)
        {
            heroHit = YES;
        }
        else
        {
            heroHit = NO;
        }
    }
    else if (enemyTempSpeed > 2*heroTempSpeed)
    {
        if (randNum > 5)
        {
            heroHit = YES;
        }
        else
        {
            heroHit = NO;
        }
    }
    else if (enemyTempSpeed > heroTempSpeed)
    {
        if (randNum > 3)
        {
            heroHit = YES;
        }
        else
        {
            heroHit = NO;
        }
    }
    else if (enemyTempSpeed*5 < heroTempSpeed)
    {
        heroHit = YES;
    }
    else if (enemyTempSpeed*3 < heroTempSpeed)
    {
        if (randNum > 0)
        {
            heroHit = YES;
        }
        else
        {
            heroHit = NO;
        }
    }
    else if (enemyTempSpeed*2 < heroTempSpeed)
    {
        if (randNum > 1)
        {
            heroHit = YES;
        }
        else
        {
            heroHit = NO;
        }
    }
    else if (enemyTempSpeed <= heroTempSpeed)
    {
        if (randNum > 2)
        {
            heroHit = YES;
        }
        else
        {
            heroHit = NO;
        }
    }
    
    if (!heroHit)
    {
        lastDamageDone = 0;
    }
    return heroHit;
}

-(int)getAttackDamageHero
{
    double rand = 90 + arc4random()%20;
    double critMult = 1;
    
    lastHitCritical = NO;
    if (self.hero.attrib4)
    {
        if ((arc4random()%100) >= 70)
        {
            lastHitCritical = YES;
            critMult = 2;
        }
    }
    
    
    double heroAtkPower = rand*tempStrMultItem*styleStrMult*((double)(self.hero.heroStr*self.hero.strMult + self.hero.strBonus))/100 + rand*tempAgiMultItem*styleAgiMult*((double)(self.hero.heroSPD*self.hero.aglMult+ self.hero.aglBonus))/800;
    double monsterDefPower = miscEnemyDefMult*enemy.monsterStrDef;
    
    
    double temp = critMult*heroAtkPower/monsterDefPower;
    if (temp <= 1)
    {
        if (temp > 0.3)
        {
            temp = 1;
        }
        else{
            temp = 0;
        }
    }
    int heroDamageDealt = (int) temp;
    
    
    if (heroDamageDealt >= enemy.monsterCurrentHP)
    {
        heroDamageDealt = enemy.monsterCurrentHP;
        wonBattle = YES;
    }
    lastDamageDone = heroDamageDealt;
    enemy.monsterCurrentHP -= heroDamageDealt;
    
    return heroDamageDealt;
}

-(void)heroWins
{
    currentMove = 4;
    self.canTouchButtons = NO; //should already be false
    battleCycleStatus = 1;
    
    enemy.monsterExperience = (int)(((double)enemy.monsterExperience)*inBattleExpMult*self.hero.itemExpMult*self.hero.attribExpMult);
    enemy.monsterRewardGold = (int)(((double)enemy.monsterRewardGold)*inBattleGoldMult*self.hero.itemGoldMult*self.hero.attribGoldMult);
    
    oldExp = self.hero.exp;
    self.hero.exp += enemy.monsterExperience;
    self.hero.gold += enemy.monsterRewardGold;
    
    int oldLvl = [self levelForExp:oldExp];
    int newLvl = [self levelForExp:self.hero.exp];
    if (oldLvl != newLvl)
    {
        [self levelFrom:oldLvl ToLevel:newLvl];
    }
    
    if (enemy.monsterRewardItem)
    {
        [self givenItem:enemy.monsterRewardItem];
    }
    
    if (BID==101){
        self.hero.beatBoss1 = YES;
    }
    else if (BID==102){
        self.hero.beatCyclops = YES;
    }
    else if (BID==130){
        self.hero.beatIceGolem1 = YES;
    }
    else if (BID==131){
        self.hero.beatIceGolem2 = YES;
    }
    else if (BID==132){
        self.hero.beatIceGolem3 = YES;
    }
    else if (BID==104){
        self.hero.beatVank = YES;
    }
    else if (BID==105){
        self.hero.beatDragon = YES;
    }
    else if (BID==106){
        self.hero.beatCaveBoss = YES;
    }
    else if (BID==107){
        self.hero.beatCaveTroll = YES;
        [self givenItem:27];
    }
    else if (BID==108){
        self.hero.beatSunDragon = YES;
    }
    else if (BID==109){
        self.hero.beatTitan = YES;
    }
    else if (BID==110){
        self.hero.beatVodek = YES;
    }
    else if (BID==111){
        self.hero.beatIonak = YES;
    }
    else if (BID==112){
        self.hero.beatTowerKeeper = YES;
    }
    else if (BID==150){
        self.hero.beatTraveler = YES;
    }
    
    [MusicHandler playButtonClick];
    [MusicHandler resetBackgroundMusic:12];
    
    [self winCycle];
    return;
}
-(void)winCycle
{
    if (battleCycleStatus == 1) //%@ has been defeated!
    {
        self.canTouchButtons = NO; //should already be no
        NSString *victoryString = [NSString stringWithFormat:@"%@ has been defeated!", enemy.name];
        [self showText:victoryString];
        return;
    }
    if (battleCycleStatus == 2) //Special Text / Special boss stuff (update bools, items)
    {
        if (BID==101){
            NSString *victoryString = @"Imp: You may have won today human, but nothing will stop my master!!";
            [self showText:victoryString];
            return;
        }
        else if (BID==106){
            NSString *victoryString = @"Veran: You are strong... perhaps you will stand a chance against Vankur...";
            [self showText:victoryString];
            return;
        }
        else if (BID == 107)
        {
            NSString *victoryString = @"The Cave Troll dropped an unusual item...";
            [self showText:victoryString];
            return;
        }
        else if (BID==110){
            NSString *victoryString = @"Vodek: Who... are you?";
            [self showText:victoryString];
            return;
        }
        else if (BID==111){
            NSString *victoryString = @"Ionak: No! This can't be!";
            [self showText:victoryString];
            return;
        }
        else if (BID==112){
            NSString *victoryString = @"Keeper: My Tower! Nooo!";
            [self showText:victoryString];
            return;
        }
        else if (BID==150){
            NSString *victoryString = @"Traveler: You're no ordinary Hero...";
            [self showText:victoryString];
            return;
        }
        
        battleCycleStatus++;
    }
    if (battleCycleStatus == 3) // item
    {
        if (enemy.monsterRewardItem && (BID != 107))
        {
            Item *loot = [[Item alloc] initWithItemCode:enemy.monsterRewardItem];
            NSString *string = [NSString stringWithFormat:@"You found one %@ amongst the loot.",loot.name];
            [self showText:string];
            [Item release];
            return;
        }
        battleCycleStatus++;
    }
    if (battleCycleStatus == 4) //You received %@ gold and %@ experience
    {
        NSString *victoryString;
        if (enemy.monsterRewardGold == 0)
        {
            victoryString = [NSString stringWithFormat:@"You have gained %d experience for winning.", enemy.monsterExperience];
        }
        else
        {
            victoryString = [NSString stringWithFormat:@"You have gained %d experience and %d gold coins for winning.", enemy.monsterExperience, enemy.monsterRewardGold];
        }
        [self showText:victoryString];
        return;
    }
    if (battleCycleStatus == 5) //You grew from LVL %d to LVL %d.
    {
        int oldLvl = [self levelForExp:oldExp];
        int newLvl = [self levelForExp:self.hero.exp];
        if (oldLvl != newLvl)
        {
            NSString *string = [NSString stringWithFormat:@"Congratulations! You have grown from level %d to level %d.", oldLvl, newLvl];
            [self showText:string];
            return;
        }
        battleCycleStatus++;
    }
    if (battleCycleStatus == 6) //ATK: +%d DEF: +%d AGI: +%d etc
    {
        int oldLvl = [self levelForExp:oldExp];
        int newLvl = [self levelForExp:self.hero.exp];
        if (oldLvl != newLvl)
        {
            NSString *string = [NSString stringWithFormat:@"Hit Points: +%d. Strength: +%d. Defense: +%d. Agility: +%d. Free Points: +%d. Attribute Points: +%d.",plusHP, plusStr, plusDef, plusAgi, plusFP, plusAttrib];
            [self showText:string];
            return;
        }
        battleCycleStatus++;
    }
    if (battleCycleStatus == 7)
    {
        self.hero.mapInitMode = 8;
        [GameSceneManager sharedGameSceneManager].hero = self.hero;
        int temp = self.hero.currentMap;
        [SceneManager goPlay:temp];
    }
}

-(BOOL)doesHeroGoFirst
{
    BOOL heroGoesFirst;
    
    int randNum = arc4random()%20;
    
    double enemyTempSpeed = enemy.monsterSpeed + 1;
    double heroTempSpeed = styleAgiMult*(self.hero.heroSPD*self.hero.aglMult + self.hero.aglBonus) + 1;
    
    enemyTempSpeed = (enemyTempSpeed + enemyTempSpeed*(arc4random()%10)/10.0);
    
    
    if (enemyTempSpeed > 2*heroTempSpeed)
    {
        heroGoesFirst = NO;
    }
    else if (enemyTempSpeed > heroTempSpeed)
    {
        if (randNum > 14)
        {
            heroGoesFirst = YES;
        }
        else
        {
            heroGoesFirst = NO;
        }
    }
    else if (enemyTempSpeed*2 < heroTempSpeed)
    {
        heroGoesFirst = YES;
    }
    else
    {
        if (randNum > 4)
        {
            heroGoesFirst = YES;
        }
        else
        {
            heroGoesFirst = NO;
        }
    }
    return heroGoesFirst;
}

-(void)heroDies
{
    self.canTouchButtons = NO; //should already be NO
    currentMove = 5; //So you don't start a new cycle
    
    self.hero.heroOrientation = 1;
    self.hero.gold = self.hero.gold * 0.6;
    self.hero.heroCurrentHP = self.hero.heroHP;
    [GameSceneManager sharedGameSceneManager].hero = self.hero;
    [GameSceneManager sharedGameSceneManager].justDied = YES;
    
    [MusicHandler playButtonClick]; // Change to dun dun dun sound effect
    
    NSString *deathString = [NSString stringWithFormat:@"Oh dear, you have been defeated! Everything is going black..."];
    [self showText:deathString];
    [self performSelector:@selector(die) withObject:nil afterDelay:1.5];
}

-(void)attackCycle //DONE
{
    if (battleCycleStatus == 1)
    {
        self.canTouchButtons = NO; //should already be no
        heroMovedFirst = [self doesHeroGoFirst];
        if (heroMovedFirst)
        {
            [self heroAttack]; //this accounts for missing attacks, too
            return;
        }
        else{
            [self enemyAttack]; //this accounts for missing attacks, too
            return;
        }
    }
    if (battleCycleStatus == 2)
    {
        if (heroMovedFirst)
        {
            [self atkAttrib];
        }
        else{
            [self defAttrib];
        }
    }
    if (battleCycleStatus == 3)
    {
        if (heroMovedFirst)
        {
            [self atkEquipPos1];
        }
        else{
            [self defEquipPos1];
        }
    }
    if (battleCycleStatus == 4)
    {
        if (heroMovedFirst)
        {
            [self atkEquipPos2];
        }
        else{
            [self defEquipPos2];
        }
    }
    if (battleCycleStatus == 5)
    {
        if (heroMovedFirst)
        {
            [self atkEquipPos3];
        }
        else{
            [self defEquipPos3];
        }
    }
    if (battleCycleStatus == 6)
    {
        if (heroMovedFirst)
        {
            [self atkEquipPos4];
        }
        else{
            [self defEquipPos4];
        }
    }
    if (battleCycleStatus == 7)
    {
        if (heroMovedFirst)
        {
            [self atkEquipPos5];
        }
        else{
            [self defEquipPos5];
        }
    }
    if (battleCycleStatus == 8)
    {
        if (wonBattle)
        {
            [self heroWins]; //Calls winCycle and displays level ups, text (for bosses), rewards, etc
            return;
        }
        else if (lostBattle)
        {
            [self heroDies];
            return;
        }
        battleCycleStatus++;
    }
    if (battleCycleStatus == 9)
    {
        if (heroMovedFirst)
        {
            [self enemyAttack]; //this accounts for missing attacks, too
            return;
        }
        else{
            [self heroAttack]; //this accounts for missing attacks, too
            return;
        }
    }
    if (battleCycleStatus == 10)
    {
        if (heroMovedFirst)
        {
            [self defAttrib];
        }
        else{
            [self atkAttrib];
        }
    }
    if (battleCycleStatus == 11)
    {
        if (heroMovedFirst)
        {
            [self defEquipPos1];
        }
        else{
            [self atkEquipPos1];
        }
    }
    if (battleCycleStatus == 12)
    {
        if (heroMovedFirst)
        {
            [self defEquipPos2];
        }
        else{
            [self atkEquipPos2];
        }
    }
    if (battleCycleStatus == 13)
    {
        if (heroMovedFirst)
        {
            [self defEquipPos3];
        }
        else{
            [self atkEquipPos3];
        }
    }
    if (battleCycleStatus == 14)
    {
        if (heroMovedFirst)
        {
            [self defEquipPos4];
        }
        else{
            [self atkEquipPos4];
        }
    }
    if (battleCycleStatus == 15)
    {
        if (heroMovedFirst)
        {
            [self defEquipPos5];
        }
        else{
            [self atkEquipPos5];
        }
    }
    if (battleCycleStatus == 16)
    {
        if (wonBattle)
        {
            [self heroWins]; //Calls winCycle and displays level ups, text (for bosses), rewards, etc
            return;
        }
        else if (lostBattle)
        {
            [self heroDies];
            return;
        }
        else
        {
            self.canTouchButtons = YES;
            return;
        }
    }
    return;
}




-(BOOL)canUseItem:(int)itemCode
{
    return true;
}

-(void)itemCycle
{
    if (battleCycleStatus == 1)
    {
        //NOTE: If item use failed, this won't get called
        //(ex: if potion wouldn't increase multiplier, then touchedBack gets called and it makes error sound, instead of calling itemCycle)
        //This also applies for herbs not healing you (full HP), and staffs being used against bosses
        self.canTouchButtons = NO; //should already be no
        if (self.currentItemCode == 1)
        {
            int a = 10;
            if ((self.hero.heroCurrentHP + a) > self.hero.heroHP)
            {
                a = self.hero.heroHP-self.hero.heroCurrentHP;
            }
            [self updateHP:(self.hero.heroCurrentHP + a)];
            [MusicHandler playButtonClick];
            NSString *string = [NSString stringWithFormat:@"The Herb heals you by %d HP.",a];
            [self showText:string];
            return;
        }
        else if (self.currentItemCode == 2)
        {
            int a = 30;
            if ((self.hero.heroCurrentHP + a) > self.hero.heroHP)
            {
                a = self.hero.heroHP-self.hero.heroCurrentHP;
            }
            [self updateHP:(self.hero.heroCurrentHP + a)];
            [MusicHandler playButtonClick];
            NSString *string = [NSString stringWithFormat:@"The Enchanted Herb heals you by %d HP.",a];
            [self showText:string];
            return;
        }
        else if (self.currentItemCode == 3)
        {
            int a = 100;
            if ((self.hero.heroCurrentHP + a) > self.hero.heroHP)
            {
                a = self.hero.heroHP-self.hero.heroCurrentHP;
            }
            [self updateHP:(self.hero.heroCurrentHP + a)];
            [MusicHandler playButtonClick];
            NSString *string = [NSString stringWithFormat:@"The Sisensis roots heals you by %d HP.",a];
            [self showText:string];
            return;
        }
        else if (self.currentItemCode == 4)
        {
            int a = 500;
            if ((self.hero.heroCurrentHP + a) > self.hero.heroHP)
            {
                a = self.hero.heroHP-self.hero.heroCurrentHP;
            }
            [self updateHP:(self.hero.heroCurrentHP + a)];
            [MusicHandler playButtonClick];
            NSString *string = [NSString stringWithFormat:@"The Elixir heals you by %d HP.",a];
            [self showText:string];
            return;
        }
        else if (self.currentItemCode == 5)
        {
            tempStrMultItem = 1.2; //You already checked whether this is higher in item menu
            [MusicHandler playButtonClick];
            NSString *string = @"You drink the Strength Potion. You feel stronger...";
            [self showText:string];
            return;
        }
        else if (self.currentItemCode == 6)
        {
            tempDefMultItem = 1.2; //You already checked whether this is higher in item menu
            [MusicHandler playButtonClick];
            NSString *string = @"You drink the Defense Potion. You feel stronger...";
            [self showText:string];
            return;
        }
        else if (self.currentItemCode == 7)
        {
            tempAgiMultItem = 1.2; //You already checked whether this is higher in item menu
            [MusicHandler playButtonClick];
            NSString *string = @"You drink the Speed Potion. You feel quicker...";
            [self showText:string];
            return;
        }
        else if (self.currentItemCode == 8)
        {
            tempStrMultItem = 1.8; //You already checked whether this is higher in item menu
            [MusicHandler playButtonClick];
            NSString *string = @"You drink the Super Strength Potion. You feel much stronger...";
            [self showText:string];
            return;
        }
        else if (self.currentItemCode == 9)
        {
            tempDefMultItem = 1.8; //You already checked whether this is higher in item menu
            [MusicHandler playButtonClick];
            NSString *string = @"You drink the Super Defense Potion. You feel much stronger...";
            [self showText:string];
            return;
        }
        else if (self.currentItemCode == 10)
        {
            tempAgiMultItem = 1.8; //You already checked whether this is higher in item menu
            [MusicHandler playButtonClick];
            NSString *string = @"You drink the Super Speed Potion. You feel much faster...";
            [self showText:string];
            return;
        }
        else if (self.currentItemCode == 11)
        {
            //You already checked whether staff can be used
            [self heroWindStaffAnimation];
            
            NSString *string = @"You used a Wind Staff. It created powerful winds!";
            [self showText:string];
            return;
        }
        else if (self.currentItemCode == 12)
        {
            //You already checked whether staff can be used
            [self heroLeechAnimation];
            
            NSString *string = @"You used an Earth Staff. It leeches your enemy's HP!";
            [self showText:string];
            return;
        }
        else if (self.currentItemCode == 13)
        {
            //You already checked whether staff can be used
            [self heroIceStaffAnimation];
            
            NSString *string = @"You used a Frost Staff. It creates an icy gust!";
            [self showText:string];
            return;
        }
        else if (self.currentItemCode == 14)
        {
            //You already checked whether staff can be used
            [self heroFireStaffAnimation];
            
            NSString *string = @"You used a Fire Staff. It creates a fireball!";
            [self showText:string];
            return;
        }
        else if (self.currentItemCode == 15)
        {
            //You already checked whether staff can be used
            [self heroWindStaffAnimation];
            
            NSString *string = @"You used a Hurricane Staff. It summons hurricane winds!";
            [self showText:string];
            return;
        }
        else if (self.currentItemCode == 16)
        {
            //You already checked whether staff can be used
            [self heroIceStaffAnimation];
            
            NSString *string = @"You used a Blizzard Staff. It creates a wild ice storm!";
            [self showText:string];
            return;
        }
        else if (self.currentItemCode == 17)
        {
            //You already checked whether staff can be used
            [self heroLeechAnimation];
            
            NSString *string = @"You used a Gaia Staff. It leeches your enemy's HP!";
            [self showText:string];
            return;
        }
        else if (self.currentItemCode == 18)
        {
            //You already checked whether staff can be used
            [self heroIceStaffAnimation];
            
            NSString *string = @"You used a Phoenix Staff. It summons a fiery Phoenix!";
            [self showText:string];
            return;
        }
        else if (self.currentItemCode == 24)
        {
            tempStrMultItem = 2.3;
            tempDefMultItem = 1.9;
            tempAgiMultItem = 0.8;
            NSString *string01 = @"You drink some Liquid Courage. You feel empowered.";
            [self showText:string01];
            return;
        }
        else
        {
            NSLog(@"\nItemCode ERROR\nItemCode ERROR\n");
        }
        battleCycleStatus++;
    }
    else if (battleCycleStatus == 2)
    {
        if (self.currentItemCode == 11)
        {
            int a;
            double b,c;
            b = arc4random()%5;
            c = (8+b)/10.0;
            a = (int) 80*c/enemy.monsterStrDef;
            
            if (a >= enemy.monsterCurrentHP)
            {
                a = enemy.monsterCurrentHP;
                wonBattle = YES;
            }
            
            enemy.monsterCurrentHP -= a;
            NSString *string = [NSString stringWithFormat:@"It inflicts %d damage on %@.", a, enemy.name];
            [self showText:string];
            return;
        }
        else if (self.currentItemCode == 12)
        {
            int h = 10;
            if ((self.hero.heroCurrentHP + h) > self.hero.heroHP)
            {
                h = self.hero.heroHP-self.hero.heroCurrentHP;
            }
            [self updateHP:(self.hero.heroCurrentHP + h)];
            int a;
            double b,c;
            b = arc4random()%5;
            c = (8+b)/10.0;
            a = (int) 100*c/enemy.monsterStrDef;
            
            if (a >= enemy.monsterCurrentHP)
            {
                a = enemy.monsterCurrentHP;
                wonBattle = YES;
            }
            enemy.monsterCurrentHP -= a;
            NSString *string = [NSString stringWithFormat:@"You heal by %d HP. It inflicts %d damage on %@.", h, a, enemy.name];
            [self showText:string];
            return;
        }
        else if (self.currentItemCode == 13)
        {
            int a;
            double b,c;
            b = arc4random()%5;
            c = (8+b)/10.0;
            a = (int) 160*c/enemy.monsterStrDef;
            
            if (a >= enemy.monsterCurrentHP)
            {
                a = enemy.monsterCurrentHP;
                wonBattle = YES;
            }
            
            enemy.monsterCurrentHP -= a;
            NSString *string = [NSString stringWithFormat:@"It inflicts %d damage on %@.", a, enemy.name];
            [self showText:string];
            return;
        }
        else if (self.currentItemCode == 14)
        {
            int a;
            double b,c;
            b = arc4random()%5;
            c = (8+b)/10.0;
            a = (int) 210*c/enemy.monsterStrDef;
            
            if (a >= enemy.monsterCurrentHP)
            {
                a = enemy.monsterCurrentHP;
                wonBattle = YES;
            }
            
            enemy.monsterCurrentHP -= a;
            NSString *string = [NSString stringWithFormat:@"It inflicts %d damage on %@.", a, enemy.name];
            [self showText:string];
            return;
        }
        else if (self.currentItemCode == 15)
        {
            int a;
            double b,c;
            b = arc4random()%5;
            c = (8+b)/10.0;
            a = (int) 350*c/enemy.monsterStrDef;
            
            if (a >= enemy.monsterCurrentHP)
            {
                a = enemy.monsterCurrentHP;
                wonBattle = YES;
            }
            
            enemy.monsterCurrentHP -= a;
            NSString *string = [NSString stringWithFormat:@"It inflicts %d damage on %@.", a, enemy.name];
            [self showText:string];
            return;
        }
        else if (self.currentItemCode == 16)
        {
            int a;
            double b,c;
            b = arc4random()%5;
            c = (8+b)/10.0;
            a = (int) 410*c/enemy.monsterStrDef;
            
            if (a >= enemy.monsterCurrentHP)
            {
                a = enemy.monsterCurrentHP;
                wonBattle = YES;
            }
            
            enemy.monsterCurrentHP -= a;
            NSString *string = [NSString stringWithFormat:@"It inflicts %d damage on %@.", a, enemy.name];
            [self showText:string];
            return;
        }
        else if (self.currentItemCode == 17)
        {
            int a;
            double b,c;
            b = arc4random()%5;
            c = (8+b)/10.0;
            a = (int) 460*c/enemy.monsterStrDef;
            
            if (a >= enemy.monsterCurrentHP)
            {
                a = enemy.monsterCurrentHP;
                wonBattle = YES;
            }
            
            int h = MAX(a,30);
            
            if ((self.hero.heroCurrentHP + h) > self.hero.heroHP)
            {
                h = self.hero.heroHP-self.hero.heroCurrentHP;
            }
            [self updateHP:(self.hero.heroCurrentHP + h)];
            
            
            enemy.monsterCurrentHP -= a;
            NSString *string = [NSString stringWithFormat:@"You heal by %d HP. It inflicts %d damage on %@.", h, a, enemy.name];
            [self showText:string];
            return;
        }
        else if (self.currentItemCode == 18)
        {
            int a;
            double b,c;
            b = arc4random()%5;
            c = (8+b)/10.0;
            a = (int) 600*c/enemy.monsterStrDef;
            
            if (a >= enemy.monsterCurrentHP)
            {
                a = enemy.monsterCurrentHP;
                wonBattle = YES;
            }
            
            enemy.monsterCurrentHP -= a;
            NSString *string = [NSString stringWithFormat:@"It inflicts %d damage on %@.", a, enemy.name];
            [self showText:string];
            return;
        }
        battleCycleStatus++;
    }
    
    else if (battleCycleStatus == 3)
    {
        if (wonBattle)
        {
            [self heroWins]; //Calls winCycle and displays level ups, text (for bosses), rewards, etc
            return;
        }
        else if (lostBattle)
        {
            [self heroDies];
            return;
        }
        else
        {
            self.canTouchButtons = YES;
            return;
        }
    }
}









// This should get called every time any button is pressed
-(void)touchedBack //DONE
{
    if (isShowingItemScreen)
    {
        [self removeChild:itemDisplay cleanup:YES];
        isShowingItemScreen = NO;
    }
}

-(void)showText:(NSString *)string
{
    CGSize size = [[CCDirector sharedDirector] winSize];
    textBoxLayer = [[TextBoxLayer alloc] initWithColor:[UIColor clearColor] width: 330 height:80 padding:8 text:string];
    textBoxLayer.position =  ccp(0, size.height/2 - 160);
    textBoxLayer.delegate = self;
    [self addChild:textBoxLayer z:INT_MAX];
    
    
    //self.textPresent = YES;
    [self performSelector:@selector(letTextGoAway) withObject:nil afterDelay:0.5];
    
    return;
}

-(void)letTextGoAway //DONE
{
    self.textPresent = YES;
}


- (void)gameLoop: (float) dT  //DONE
{
    [textBoxLayer update:dT];
}

-(void) textBox:(id<TextBox>)tbox didFinishAllTextWithPageCount:(int)pc //DONE
{
    if ((!self.textPresent) || self.isUpdating)
    {
        CCSendMessages *crazy = [CCSendMessages actionWithTarget:self];
        [[crazy addMessage] textBox:tbox didFinishAllTextWithPageCount:pc];
        CCDelayTime *delay = [CCDelayTime actionWithDuration:0.125];
        [[CCDirector sharedDirector].runningScene runAction:[CCSequence actions:delay,crazy,nil]];
        return;
    }
    [self removeChild:textBoxLayer cleanup:YES];
    self.textPresent = NO;
    
    battleCycleStatus++;
    
    if (currentMove == 0)
    {
        self.canTouchButtons = YES;
        battleCycleStatus = 1;
        return;
    }
    else if (currentMove == 1)
    {
        [self fleeCycle];
    }
    else if (currentMove == 2)
    {
        [self attackCycle];
    }
    else if (currentMove == 3)
    {
        [self itemCycle];
    }
    else if (currentMove == 4)
    {
        [self winCycle];
    }
    else if (currentMove == 9) //This is initial text box
    {
        self.canTouchButtons = YES;
        battleCycleStatus = 1;
        return;
    }
    else
    {
        NSLog(@"moveCode ERROR in doBattleCycle");
    }
}

-(BOOL) tryEscape //DONE
{
    BOOL escaped;
    int enemyTempSpeed = enemy.monsterSpeed;
    int heroTempSpeed = (int) (self.hero.heroSPD*self.hero.aglMult + self.hero.aglBonus);
    
    enemyTempSpeed = (int) (enemyTempSpeed * (1 + 0.1 * ((double)(arc4random()%10))) );
    
    if (enemyTempSpeed > heroTempSpeed*3)
    {
        escaped = FALSE;
    }
    else if (enemyTempSpeed > heroTempSpeed)
    {
        int rand4 = arc4random()%10;
        if (rand4 > 5)
        {
            escaped = TRUE;
        }
    }
    else if (enemyTempSpeed * 3 < heroTempSpeed)
    {
        escaped = TRUE;
    }
    else if (enemyTempSpeed <= heroTempSpeed)
    {
        int rand4 = arc4random()%10;
        if (rand4 > 2)
        {
            escaped = TRUE;
        }
    }
    return escaped;
}


//These position constants will need to be updated
//CREATE isUpdating boolean that doesn't let text go away until it's done
-(void) updateHP:(int)newHP
{
    self.isUpdating = YES;
    
    int min = 413;
    
    double temp = newHP/((double)self.hero.heroHP);
    int newPosX = min + 104*temp;
    CGPoint newPos = ccp(newPosX, 129);
    
    double time = sqrt(abs((double)newHP-self.hero.heroCurrentHP))/36.0 + 0.03;
    
    id actionMove = [CCMoveTo actionWithDuration:time position:newPos];
    [hpBar runAction:[CCSequence actions:actionMove,nil]];
    
    [self performSelector:@selector(doneUpdating) withObject:nil afterDelay:time];
    
    int numSteps = abs(newHP - self.hero.heroCurrentHP);
    if (numSteps == 0)
        return;
    time = time/numSteps;
    
    
    [self updateHPLabelTo:newHP WithTime:time];
    
}

-(void) updateHPLabelTo:(int)newVal WithTime:(double)time
{
    int numSteps = abs(newVal - self.hero.heroCurrentHP);
    if (numSteps == 0)
        return;
    
    BOOL hpDecreasing;
    if (newVal >= self.hero.heroCurrentHP)
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
            self.hero.heroCurrentHP--;
            [self removeChild:hpLabel cleanup:YES];
            hpLabel = [CCLabelTTF labelWithString:[NSString stringWithFormat:@"%d/%d",_hero.heroCurrentHP,_hero.heroHP] dimensions:CGSizeMake(80.0, 24.0) alignment:UITextAlignmentRight fontName:@"Optima-Bold" fontSize:18.0];
            hpLabel.color = ccc3(0, 0, 0);
            hpLabel.position = ccp(395,158);
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
            self.hero.heroCurrentHP++;
            [self removeChild:hpLabel cleanup:YES];
            hpLabel = [CCLabelTTF labelWithString:[NSString stringWithFormat:@"%d/%d",_hero.heroCurrentHP,_hero.heroHP] dimensions:CGSizeMake(80.0, 24.0) alignment:UITextAlignmentRight fontName:@"Optima-Bold" fontSize:18.0];
            hpLabel.color = ccc3(0, 0, 0);
            hpLabel.position = ccp(395,158);
            [self addChild:hpLabel z:40];
            
            CCSendMessages *crazy = [CCSendMessages actionWithTarget:self];
            [[crazy addMessage] updateHPLabelTo:newVal WithTime:time];
            CCDelayTime *delay = [CCDelayTime actionWithDuration:time];
            [self runAction:[CCSequence actions:delay,crazy,nil]];
            
        }
    }
}
-(void)doneUpdating //DONE
{
    self.isUpdating = NO;
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
        plusHP += 1 + (int)sqrt((double) oldLevel) + arc4random()%((int) sqrt((double)oldLevel));
        plusStr += 1 + (int)sqrt((double) oldLevel) + arc4random()%((int) sqrt((double)oldLevel));
        plusDef += 1 + (int)sqrt((double) oldLevel) + arc4random()%((int) sqrt((double)oldLevel));
        plusAgi += 1 + (int)sqrt((double) oldLevel) + arc4random()%((int) sqrt((double)oldLevel));
        plusFP += 2 + (int)sqrt((double) oldLevel) + arc4random()%((int) sqrt((double)oldLevel));
        plusAttrib += 1;
        int rand = newLevel%5;
        if (rand == 0)
            plusAttrib += 1;
        
        oldLevel++;
    }
    self.hero.heroHP += plusHP;
    //self.hero.heroCurrentHP += plusHP;
    
    [self updateHP:(self.hero.heroCurrentHP + plusHP)]; //
    
    self.hero.heroStr += plusStr;
    self.hero.heroStrDef += plusDef;
    self.hero.heroSPD += plusAgi;
    self.hero.freePoints += plusFP;
    self.hero.attributePoints += plusAttrib;
    self.hero.heroLvl = newLevel;
    [GameSceneManager sharedGameSceneManager].hero = self.hero;
    
    return;
}

























// Should be DONE
-(void)atkEquipPos1
{
    if (wonBattle)
    {
        battleCycleStatus++;
        return;
    }
    if (self.hero.equipPos1.itemCode == 74)
    {
        if (lastDamageDone > 0)
        {
            int a;
            double b,c;
            b = arc4random()%4;
            c = (8+b)/10.0;
            a = (int) (lastDamageDone*c/10.0);
            
            if (a!=0)
            {
                if ((self.hero.heroCurrentHP + a) > self.hero.heroHP)
                {
                    a = self.hero.heroHP-self.hero.heroCurrentHP;
                }
                [self updateHP:(self.hero.heroCurrentHP + a)];
                
                if (a!=0)
                {
                    NSString *atkString = [NSString stringWithFormat:@"Your Earthen Sword regenerates %d HP.",a];
                    [self showText:atkString];
                    return;
                }
            }
        }
    }
    else if (self.hero.equipPos1.itemCode == 75)
    {
        if (lastDamageDone > 0)
        {
            int a;
            double b,c;
            b = arc4random()%4;
            c = (8+b)/10.0;
            a = (int) (lastDamageDone/1.8);
            
            if (b>=2) //50% chance you won't strike again
            {
                a = 0;
            }
            if (a!=0)
            {
                if (a >= enemy.monsterCurrentHP)
                {
                    a = enemy.monsterCurrentHP;
                }
                enemy.monsterCurrentHP -= a;
                NSString *string;
                if (enemy.monsterCurrentHP <= 0)
                {
                    wonBattle = true;
                }
                string = [NSString stringWithFormat:@"You seized the opportunity to strike twice! You hit %d damage on %@.", a, enemy.name];
                [self showText:string];
                [self heroBurnAnimation];
                return;
            }
        }
    }
    else if (self.hero.equipPos1.itemCode == 78)
    {
        if (lastDamageDone > 0)
        {
            int a;
            double b,c;
            b = arc4random()%4;
            c = (8+b)/10.0;
            a = (int) (lastDamageDone*c/8.0);
            
            if (a!=0)
            {
                if (a >= enemy.monsterCurrentHP)
                {
                    a = enemy.monsterCurrentHP;
                }
                enemy.monsterCurrentHP -= a;
                NSString *string;
                if (enemy.monsterCurrentHP <= 0)
                {
                    wonBattle = true;
                }
                string = [NSString stringWithFormat:@"The burn from your Godblade inflicts %d damage on %@.", a, enemy.name];
                [self showText:string];
                [self heroBurnAnimation];
                return;
            }
        }
    }
    else if (self.hero.equipPos1.itemCode == 81)
    {
        if (lastDamageDone > 0)
        {
            int a;
            double b,c;
            b = arc4random()%4;
            c = (8+b)/10.0;
            a = (int) (lastDamageDone*c/6.0);
            
            if (a!=0)
            {
                if (a >= enemy.monsterCurrentHP)
                {
                    a = enemy.monsterCurrentHP;
                }
                enemy.monsterCurrentHP -= a;
                NSString *string;
                if (enemy.monsterCurrentHP <= 0)
                {
                    wonBattle = true;
                }
                string = [NSString stringWithFormat:@"The burn from Abyssal Fire inflicts %d damage on %@.", a, enemy.name];
                [self showText:string];
                [self heroBurnAnimation];
                return;
            }
        }
    }
    battleCycleStatus++;
}
-(void)atkEquipPos2
{
    battleCycleStatus++;
}
-(void)atkEquipPos3
{
    battleCycleStatus++;
}
-(void)atkEquipPos4
{
    if (self.hero.equipPos4.itemCode == 125)
    {
        int a;
        double b,c;
        b = arc4random()%4;
        c = (8+b)/10.0;
        a = (int) (self.hero.heroHP*c/12.0);
        
        if (a!=0)
        {
            if ((self.hero.heroCurrentHP + a) > self.hero.heroHP)
            {
                a = self.hero.heroHP-self.hero.heroCurrentHP;
            }
            [self updateHP:(self.hero.heroCurrentHP + a)];
            
            if (a!=0)
            {
                NSString *atkString = [NSString stringWithFormat:@"Your Armor of the Forest regenerates %d HP.",a];
                [self showText:atkString];
                return;
            }
        }
    }
    else if (self.hero.equipPos4.itemCode == 142)
    {
        if (lastDamageDone > 0)
        {
            int a;
            double b,c;
            b = arc4random()%4;
            c = (8+b)/10.0;
            a = (int) (lastDamageDone*c/6.0);
            
            if (a!=0)
            {
                if ((self.hero.heroCurrentHP + a) > self.hero.heroHP)
                {
                    a = self.hero.heroHP-self.hero.heroCurrentHP;
                }
                [self updateHP:(self.hero.heroCurrentHP + a)];
                
                if (a!=0)
                {
                    NSString *atkString = [NSString stringWithFormat:@"Heart heals you by %d HP.",a];
                    [self showText:atkString];
                    return;
                }
            }
        }
    }
    battleCycleStatus++;
}
-(void)atkEquipPos5
{
    
    if (self.hero.equipPos5.itemCode == 101)
    {
        int a = (int) (self.hero.heroHP * 0.07);
        if (a == 0)
        {
            a = 1;
        }
        if ((self.hero.heroCurrentHP + a) > self.hero.heroHP)
        {
            a = self.hero.heroHP-self.hero.heroCurrentHP;
        }
        if (a!=0)
        {
            [self updateHP:(self.hero.heroCurrentHP + a)];
            
            NSString *string = [NSString stringWithFormat:@"Vodek's Crystal restores your health by %d hit points.", a];
            [self showText:string];
            return;
        }
    }
    else if (self.hero.equipPos5.itemCode == 93)
    {
        if (!isBossBattle)
        {
            inBattleGoldMult *= 1.1;
            if (inBattleGoldMult >= 2.0)
            {
                inBattleGoldMult = 2.0;
            }
            else
            {
                NSString *string = [NSString stringWithFormat:@"Your Eagle's Charm continues to increase the enemy's loot."];
                [self showText:string];
                return;
            }
        }
    }
    else if (self.hero.equipPos5.itemCode == 98)
    {
        if (!isBossBattle)
        {
            inBattleExpMult *= 1.1;
            if (inBattleExpMult >= 2.0)
            {
                inBattleExpMult = 2.0;
            }
            else
            {
                NSString *string = [NSString stringWithFormat:@"Your Amulet of Wisdom provides you with insight about the battle."];
                [self showText:string];
                return;
            }
        }
    }
    if (wonBattle)
    {
        battleCycleStatus++;
        return;
    }
    if (self.hero.equipPos5.itemCode == 100)
    {
        if (lastDamageDone > 0)
        {
            int a,temp;
            double b,c;
            b = arc4random()%4;
            c = (8+b)/10.0;
            a = (int) (lastDamageDone*c/4.0);
            
            if (a!=0)
            {
                if (a >= enemy.monsterCurrentHP)
                {
                    a = enemy.monsterCurrentHP;
                }
                
                if ((self.hero.heroCurrentHP + a) > self.hero.heroHP)
                {
                    temp = self.hero.heroHP-self.hero.heroCurrentHP;
                }
                else
                {
                    temp = a;
                }
                
                enemy.monsterCurrentHP -= a;
                [self updateHP:(self.hero.heroCurrentHP + temp)];
            
                NSString *string;
                if (enemy.monsterCurrentHP <= 0)
                {
                    wonBattle = true;
                }
                string = [NSString stringWithFormat:@"Hannibal's Amulet absorbs %d HP from %@ and restores your health by %d HP.", a, enemy.name,temp];
                [self showText:string];
                [self heroBurnAnimation];
                return;
            }
        }
    }
    battleCycleStatus++;
}

-(void)defEquipPos1
{
    if (lostBattle)
    {
        battleCycleStatus++;
        return;
    }
    if (self.hero.equipPos4.itemCode == 73)
    {
        
        if (lastDamageTaken > 0)
        {
            int a;
            double b,c;
            b = arc4random()%4;
            c = (8+b)/10.0;
            a = (int) (lastDamageTaken*c/5.0);
            
            if (a!=0)
            {
                if (a >= enemy.monsterCurrentHP)
                {
                    a = enemy.monsterCurrentHP;
                }
                enemy.monsterCurrentHP -= a;
                NSString *string;
                if (enemy.monsterCurrentHP <= 0)
                {
                    wonBattle = true;
                }
                string = [NSString stringWithFormat:@"Your Sword of Regret recoils - %@ takes %d damage.", enemy.name, a];
                [self showText:string];
                [self heroFinishAtkAnimation];
                return;
            }
        }
    }
    battleCycleStatus++;
}
-(void)defEquipPos2
{
    battleCycleStatus++;
}
-(void)defEquipPos3
{
    battleCycleStatus++;
}
-(void)defEquipPos4
{
    if (lostBattle)
    {
        battleCycleStatus++;
        return;
    }
    if (self.hero.equipPos4.itemCode == 124)
    {
        
        if (lastDamageTaken > 0)
        {
            int a;
            double b,c;
            b = arc4random()%4;
            c = (8+b)/10.0;
            a = (int) (lastDamageTaken*c/6.0);
            
            if (a!=0)
            {
                if (a >= enemy.monsterCurrentHP)
                {
                    a = enemy.monsterCurrentHP;
                }
                enemy.monsterCurrentHP -= a;
                NSString *string;
                if (enemy.monsterCurrentHP <= 0)
                {
                    wonBattle = true;
                }
                string = [NSString stringWithFormat:@"%@ is hurt by Woven Diamond - Woven Diamond causes %d damage.", enemy.name, a];
                [self showText:string];
                [self heroFinishAtkAnimation];
                return;
            }
        }
    }
    else if (self.hero.equipPos1.itemCode == 127)
    {
        if (isBossBattle)
        {
            inBattleGoldMult *= 1.1;
            if (inBattleGoldMult >= 2.0)
            {
                inBattleGoldMult = 2.0;
            }
            else
            {
                NSString *string = [NSString stringWithFormat:@"Your Dwarven Ringmail continues to increase the enemy's loot."];
                [self showText:string];
                return;
            }
        }
    }
    battleCycleStatus++;
}
-(void)defEquipPos5
{
    if (lostBattle)
    {
        battleCycleStatus++;
        return;
    }
    if (self.hero.equipPos5.itemCode == 96)
    {
        if (!isBossBattle)
        {
            double tempD = enemy.monsterStrDef;
            tempD *= 0.97;
            NSString *string = [NSString stringWithFormat:@"Your Diamond Charm wears down %@.",enemy.name];
            if (tempD < 50)
            {
                if (enemy.monsterStrDef > 12)
                {
                    enemy.monsterStrDef -= 1;
                    [self showText:string];
                    return;
                }
            }
            else{
                enemy.monsterStrDef = tempD;
                [self showText:string];
                return;
            }
            
        }
    }
    battleCycleStatus++;
}


-(void)atkAttrib
{
    if (wonBattle)
    {
        battleCycleStatus++;
        return;
    }
    if (self.hero.attrib14)
    {
        if (lastDamageDone > 0)
        {
            int a;
            double b,c;
            b = arc4random()%4;
            c = (8+b)/10.0;
            a = (int) (lastDamageDone/1.1);
            
            if (b>=2) //50% chance you won't strike again
            {
                a = 0;
            }
            if (a!=0)
            {
                if (a >= enemy.monsterCurrentHP)
                {
                    a = enemy.monsterCurrentHP;
                }
                enemy.monsterCurrentHP -= a;
                NSString *string;
                if (enemy.monsterCurrentHP <= 0)
                {
                    wonBattle = true;
                }
                string = [NSString stringWithFormat:@"You caught %@ off guard and attacked again! You dealt %d damage.",enemy.name,a];
                [self showText:string];
                [self heroBurnAnimation];
                return;
            }
        }
    }
    battleCycleStatus++;
}
-(void)defAttrib
{
    if (lostBattle)
    {
        battleCycleStatus++;
        return;
    }
    if (self.hero.attrib9)
    {
        int a = enemy.monsterStrDef;
        int b = enemy.monsterStr;
        if (a>minEnemyDef || b>minEnemyStr)
        {
            if (a>minEnemyDef)
            {
                a = (int)(((double)a)*0.95);
            }
            if (b>minEnemyStr)
            {
                b = (int)(((double)b)*0.97);
            }
            enemy.monsterStrDef = a;
            enemy.monsterStr = b;
            NSString *string = [NSString stringWithFormat:@"%@ grows fatigued as the battle wears on.",enemy.name];
            [self showText:string];
            return;
        }
    }
    battleCycleStatus++;
}



-(void) givenItem:(int)itemCode
{
    NSMutableArray *array = [self.hero.heroInventory mutableCopy];
    
    Item *itemGiven = [[Item alloc] initWithItemCode:itemCode];
    
    [array addObject:(itemGiven)];
    self.hero.heroInventory = array;
}

-(void)die
{
    if (BID == 101)
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
















//Animation -- make enemy disappear when they are defeated?
-(void)enemyAttackAnimation
{
    
}
-(void)enemyScratchAnimation
{
    
}
-(void)enemyMaulAnimation
{
    
}
-(void)enemyBiteAnimation
{
    
}
-(void)enemyRamAnimation
{
    
}
-(void)enemyLashAnimation
{
    
}
-(void)enemySlashAnimation
{
    
}
-(void)enemyStabAnimation
{
    
}
-(void)enemyGustAnimation
{
    
}
-(void)enemyCurseAnimation
{
    
}
-(void)enemyFireAnimation
{
    
}
-(void)enemyBlizzardAnimation
{
    
}
-(void)enemyHealAnimation
{
    
}

-(void)enemyFinishAtkAnimation
{
    
}


-(void)heroChargeAnimation
{
    
}
-(void)heroKickAnimation
{
    
}
-(void)heroPunchAnimation
{
    
}
-(void)heroMeleeAnimation
{
    
}
-(void)heroStabAnimation
{
    
}
-(void)heroSliceAnimation
{
    
}
-(void)heroChopAnimation
{
    
}
-(void)heroCrushAnimation
{
    
}
-(void)heroCleaveAnimation
{
    
}
-(void)heroSlashAnimation
{
    
}
-(void)heroFireSlashAnimation
{
    
}
-(void)heroLightSlashAnimation
{
    
}
-(void)heroMagicSliceAnimation
{
    
}

-(void)heroFinishAtkAnimation
{
    
}

-(void)heroBurnAnimation
{
    
}
-(void)heroLeechAnimation
{
    
}
-(void)heroWindStaffAnimation
{
    
}
-(void)heroFireStaffAnimation
{
    
}
-(void)heroIceStaffAnimation
{
    
}

-(void)shieldBashAnimation      //str *1.2 def *2.2 agi*1.0 //replaces second weapon attack
{
    
}
-(void)backSlashAnimation       //str *1.6 def *2.0 agi*1.4 //replaces second weapon attack
{
    
}
-(void)headButtAnimation        //str *1.8 def *0.6 agi*1.0 //replaces third weapon attack
{
    
}







//UI Methods
-(void)onAttack
{
    if (!self.canTouchButtons)
    {
        return;
    }
    if (self.textPresent)
    {
        return;
    }
    [self doBattleCycle:2];
    [self touchedBack];
}
-(void)onStyleA
{
    if (!self.canTouchButtons)
    {
        return;
    }
    [styleA selected];
    [styleB unselected];
    [styleC unselected];
    if (self.currentAttackCode != [[moveSet objectAtIndex:0] intValue])
    {
        [MusicHandler playButtonClick];
    }
    _currentAttackCode = [[moveSet objectAtIndex:0] intValue];
    
    if (self.currentAttackCode == 1)
    {
        styleStrMult = 1.5;
        styleDefMult = 0.7;
        styleAgiMult = 1.0;
    }
    else if (self.currentAttackCode == 2)
    {
        styleStrMult = 1.1;
        styleDefMult = 1.5;
        styleAgiMult = 0.9;
    }
    else if (self.currentAttackCode == 3)
    {
        styleStrMult = 1.0;
        styleDefMult = 1.0;
        styleAgiMult = 1.5;
    }
    else if (self.currentAttackCode == 4)
    {
        styleStrMult = 1.5;
        styleDefMult = 1.0;
        styleAgiMult = 1.0;
    }
    else if (self.currentAttackCode == 5)
    {
        styleStrMult = 1.4;
        styleDefMult = 1.3;
        styleAgiMult = 1.0;
    }
    else if (self.currentAttackCode == 6)
    {
        styleStrMult = 1.3;
        styleDefMult = 0.8;
        styleAgiMult = 1.7;
    }
    else if (self.currentAttackCode == 7)
    {
        styleStrMult = 1.9;
        styleDefMult = 1.0;
        styleAgiMult = 1.0;
    }
    else if (self.currentAttackCode == 8)
    {
        styleStrMult = 2.5;
        styleDefMult = 0.8;
        styleAgiMult = 0.8;
    }
    else if (self.currentAttackCode == 9)
    {
        styleStrMult = 2.0;
        styleDefMult = 1.2;
        styleAgiMult = 1.0;
    }
    else if (self.currentAttackCode == 10)
    {
        styleStrMult = 2.2;
        styleDefMult = 1.0;
        styleAgiMult = 1.8;
    }
    else if (self.currentAttackCode == 11)
    {
        styleStrMult = 2.6;
        styleDefMult = 1.0;
        styleAgiMult = 1.4;
    }
    else if (self.currentAttackCode == 12)
    {
        styleStrMult = 2.8;
        styleDefMult = 1.0;
        styleAgiMult = 1.4;
    }
    else if (self.currentAttackCode == 13)
    {
        styleStrMult = 2.2;
        styleDefMult = 1.2;
        styleAgiMult = 1.6;
    }
    
    [self touchedBack];
}
-(void)onStyleB
{
    if (!self.canTouchButtons)
    {
        return;
    }
    [styleA unselected];
    [styleB selected];
    [styleC unselected];
    if (self.currentAttackCode != [[moveSet objectAtIndex:1] intValue])
    {
        [MusicHandler playButtonClick];
    }
    self.currentAttackCode = [[moveSet objectAtIndex:1] intValue];
    
    if (self.currentAttackCode == 1)
    {
        styleStrMult = 1.5;
        styleDefMult = 0.7;
        styleAgiMult = 1.0;
    }
    else if (self.currentAttackCode == 2)
    {
        styleStrMult = 1.1;
        styleDefMult = 1.5;
        styleAgiMult = 0.9;
    }
    else if (self.currentAttackCode == 3)
    {
        styleStrMult = 1.0;
        styleDefMult = 1.0;
        styleAgiMult = 1.5;
    }
    else if (self.currentAttackCode == 4)
    {
        styleStrMult = 1.5;
        styleDefMult = 1.0;
        styleAgiMult = 1.0;
    }
    else if (self.currentAttackCode == 5)
    {
        styleStrMult = 1.4;
        styleDefMult = 1.3;
        styleAgiMult = 1.0;
    }
    else if (self.currentAttackCode == 6)
    {
        styleStrMult = 1.3;
        styleDefMult = 0.8;
        styleAgiMult = 1.7;
    }
    else if (self.currentAttackCode == 7)
    {
        styleStrMult = 1.9;
        styleDefMult = 1.0;
        styleAgiMult = 1.0;
    }
    else if (self.currentAttackCode == 8)
    {
        styleStrMult = 2.5;
        styleDefMult = 0.8;
        styleAgiMult = 0.8;
    }
    else if (self.currentAttackCode == 9)
    {
        styleStrMult = 2.0;
        styleDefMult = 1.2;
        styleAgiMult = 1.0;
    }
    else if (self.currentAttackCode == 10)
    {
        styleStrMult = 2.2;
        styleDefMult = 1.0;
        styleAgiMult = 1.8;
    }
    else if (self.currentAttackCode == 11)
    {
        styleStrMult = 2.6;
        styleDefMult = 1.0;
        styleAgiMult = 1.4;
    }
    else if (self.currentAttackCode == 12)
    {
        styleStrMult = 2.8;
        styleDefMult = 1.0;
        styleAgiMult = 1.4;
    }
    else if (self.currentAttackCode == 13)
    {
        styleStrMult = 2.2;
        styleDefMult = 1.2;
        styleAgiMult = 1.6;
    }
    
    [self touchedBack];
}
-(void)onStyleC
{
    if (!self.canTouchButtons)
    {
        return;
    }
    [styleA unselected];
    [styleB unselected];
    [styleC selected];
    if (self.currentAttackCode != [[moveSet objectAtIndex:2] intValue])
    {
        [MusicHandler playButtonClick];
    }
    self.currentAttackCode = [[moveSet objectAtIndex:2] intValue];
    
    if (self.currentAttackCode == 1)
    {
        styleStrMult = 1.5;
        styleDefMult = 0.7;
        styleAgiMult = 1.0;
    }
    else if (self.currentAttackCode == 2)
    {
        styleStrMult = 1.1;
        styleDefMult = 1.5;
        styleAgiMult = 0.9;
    }
    else if (self.currentAttackCode == 3)
    {
        styleStrMult = 1.0;
        styleDefMult = 1.0;
        styleAgiMult = 1.5;
    }
    else if (self.currentAttackCode == 4)
    {
        styleStrMult = 1.5;
        styleDefMult = 1.0;
        styleAgiMult = 1.0;
    }
    else if (self.currentAttackCode == 5)
    {
        styleStrMult = 1.4;
        styleDefMult = 1.3;
        styleAgiMult = 1.0;
    }
    else if (self.currentAttackCode == 6)
    {
        styleStrMult = 1.3;
        styleDefMult = 0.8;
        styleAgiMult = 1.7;
    }
    else if (self.currentAttackCode == 7)
    {
        styleStrMult = 1.9;
        styleDefMult = 1.0;
        styleAgiMult = 1.0;
    }
    else if (self.currentAttackCode == 8)
    {
        styleStrMult = 2.5;
        styleDefMult = 0.8;
        styleAgiMult = 0.8;
    }
    else if (self.currentAttackCode == 9)
    {
        styleStrMult = 2.0;
        styleDefMult = 1.2;
        styleAgiMult = 1.0;
    }
    else if (self.currentAttackCode == 10)
    {
        styleStrMult = 2.2;
        styleDefMult = 1.0;
        styleAgiMult = 1.8;
    }
    else if (self.currentAttackCode == 11)
    {
        styleStrMult = 2.6;
        styleDefMult = 1.0;
        styleAgiMult = 1.4;
    }
    else if (self.currentAttackCode == 12)
    {
        styleStrMult = 2.8;
        styleDefMult = 1.0;
        styleAgiMult = 1.4;
    }
    else if (self.currentAttackCode == 13)
    {
        styleStrMult = 2.2;
        styleDefMult = 1.2;
        styleAgiMult = 1.6;
    }
    
    [self touchedBack];
}
-(void)onItem
{
    [self touchedBack];
    if (self.canTouchButtons)
    {
        itemDisplay = [[DisplayBattleItems alloc] init];
        [self addChild:itemDisplay z:INT_MAX];
        
        isShowingItemScreen = YES;
        
    }
}
-(void)onFlee
{
    if (!self.canTouchButtons)
    {
        return;
    }
    if (self.textPresent)
    {
        return;
    }
    [self doBattleCycle:1];
    [self touchedBack];
}

-(void)onEnemy
{
    [self onAttack];
}



//For DEBUGGING - DELETE

-(void) goBackGame
{
    self.hero.mapInitMode = 8;
    self.hero.heroCurrentHP = self.hero.heroHP;
    [GameSceneManager sharedGameSceneManager].hero = self.hero;
    int temp = self.hero.currentMap;
    [SceneManager goPlay:temp];
}


@end





