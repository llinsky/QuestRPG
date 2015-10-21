//
//  ItemShopMenu.m
//  Quest
//
//  Created by Leo Linsky on 9/15/12.
//  Copyright 2012 __MyCompanyName__. All rights reserved.
//


// I'll make a YES/NO option modal that pops up with a textbox when you talk to a shopowner. This will be implemented in the HUD

#import "ItemShopMenu.h"
#import "DisplayEquipItemLayer.h"
#import "CCMenuAdvanced.h"
#import "CCScrollLayer.h"



@implementation ItemShopMenu

@synthesize shopCode;
@synthesize shopMode;

@synthesize hero;

-(id)initWithShopCode:(int)code
{
    if (self = [super init])
    {
        self.shopCode = code;
        shopMode = YES;
        self.hero = [GameSceneManager sharedGameSceneManager].hero;
        
        isShowingItemLayer = NO;
        
        CGSize winSize = [[CCDirector sharedDirector] winSize];
        
        CCSprite *background = [CCSprite spriteWithFile: @"IGmenuback5.png"];
		background.position = ccp(winSize.width/2, winSize.height/2 + 20);
		[self addChild:background z:-1];
        
        CCSprite *foreground = [CCSprite spriteWithFile: @"shopmenuback1.png"];
		foreground.position = ccp(winSize.width/2, winSize.height/2 + 20);
		[self addChild:foreground z:1];
        
        int b = 0;
        if (hero.gold > 5000)
        {
            b = 4;
        }
        
        CCSprite *goldback = [CCSprite spriteWithFile: @"goldback2.png"];
		goldback.position = ccp(50, winSize.height - 12);
		[self addChild:goldback z:10];
        
        CCSprite *gold = [CCSprite spriteWithFile: @"igmenugold3.png"];
		gold.position = ccp(13, winSize.height - 15);
		[self addChild:gold z:15 tag:21];
        
        
        CCMenuItemImage *backToGame = [CCMenuItemImage itemFromNormalImage:@"igmenugame4.png" selectedImage:@"igmenugame4_pressed.png" target:self selector:@selector(goBackGame:)];
        
        
        CCMenu *menu212 = [CCMenu menuWithItems:backToGame, nil];
		menu212.position = ccp(winSize.width - 46, winSize.height - 20);
		[menu212 alignItemsVerticallyWithPadding: 6.0f];
		[self addChild:menu212 z:87778 tag:901];
        
        
        if (hero.gold < 20000)
        {
            CCLabelTTF *label02 = [CCLabelTTF labelWithString:[NSString stringWithFormat:@"%dG", hero.gold] dimensions: CGSizeMake(140, 30) alignment:UITextAlignmentLeft fontName:@"Optima-Bold" fontSize:18.0];
            label02.position = ccp(97 - b, winSize.height - 20);
            label02.color = ccc3(255, 255, 255);
            [self addChild: label02 z:15 tag:60];
        }
        else
        {
            CCLabelTTF *label02 = [CCLabelTTF labelWithString:[NSString stringWithFormat:@"%d", hero.gold] dimensions: CGSizeMake(140, 30) alignment:UITextAlignmentLeft fontName:@"Optima-Bold" fontSize:18.0];
            label02.position = ccp(97 - b, winSize.height - 20);
            label02.color = ccc3(255, 255, 255);
            [self addChild: label02 z:15 tag:60];
        }
        
        shopButton = [CCMenuItemImage itemFromNormalImage:@"buttonshop1.png" selectedImage:@"buttonshop1_pressed.png" target:self selector:@selector(onShop)];
		sellButton = [CCMenuItemImage itemFromNormalImage:@"buttonsell1.png" selectedImage:@"buttonsell1_pressed.png" target:self selector:@selector(onSell)];
        CCMenu *menu2 = [CCMenu menuWithItems:shopButton, sellButton, nil];
		menu2.position = ccp(35, winSize.height/2 - 40);
		[menu2 alignItemsVerticallyWithPadding: 10.0f];
		[self addChild:menu2 z:400];
        
        
        
        if (shopMode)
        {
            [shopButton selected];
            [sellButton unselected];
        }
        
        
        
        if (shopCode == 0) // PL1 Sprite 16 - General store (low level)
        {
            Item* i1 = [[Item alloc] initWithItemCode:1];
            Item* i2 = [[Item alloc] initWithItemCode:2];
            Item* i3 = [[Item alloc] initWithItemCode:5];
            Item* i4 = [[Item alloc] initWithItemCode:6];
            Item* i5 = [[Item alloc] initWithItemCode:7];
            Item* i6 = [[Item alloc] initWithItemCode:11];
            Item* i7 = [[Item alloc] initWithItemCode:12];
            Item* i8 = [[Item alloc] initWithItemCode:13];
            Item* i9 = [[Item alloc] initWithItemCode:14];
            Item* i10 = [[Item alloc] initWithItemCode:19];
            Item* i11 = [[Item alloc] initWithItemCode:31];
            Item* i12 = [[Item alloc] initWithItemCode:32];
            Item* i13 = [[Item alloc] initWithItemCode:33];
            Item* i14 = [[Item alloc] initWithItemCode:34];
            
            shopInventory = [[NSArray alloc] initWithObjects:i1,i2,i3,i4,i5,i6,i7,i8,i9,i10,i11,i12,i13,i14, nil];
            
            CCLabelTTF *shopName = [CCLabelTTF labelWithString:@"Remus's General Store" dimensions: CGSizeMake(230, 40) alignment:UITextAlignmentCenter fontName:@"Optima-Bold" fontSize:24.0];
            shopName.position = ccp(winSize.width/2, winSize.height - 25);
            shopName.color = ccc3(0, 0, 0);
            [self addChild: shopName z:15];
        }
        else if (shopCode == 1) // PL1 Sprite 17 - Weapons Shop (low level)
        {
            Item* i1 = [[Item alloc] initWithItemCode:51];
            Item* i2 = [[Item alloc] initWithItemCode:50];
            Item* i3 = [[Item alloc] initWithItemCode:52];
            Item* i4 = [[Item alloc] initWithItemCode:53];
            Item* i5 = [[Item alloc] initWithItemCode:54];
            Item* i6 = [[Item alloc] initWithItemCode:55];
            Item* i7 = [[Item alloc] initWithItemCode:56];
            Item* i8 = [[Item alloc] initWithItemCode:57];
            Item* i9 = [[Item alloc] initWithItemCode:60];
            Item* i10 = [[Item alloc] initWithItemCode:61];
            Item* i11 = [[Item alloc] initWithItemCode:62];
            Item* i12 = [[Item alloc] initWithItemCode:75];
            Item* i13 = [[Item alloc] initWithItemCode:77];
            
            Item* i14 = [[Item alloc] initWithItemCode:90];
            Item* i15 = [[Item alloc] initWithItemCode:91];
            Item* i16 = [[Item alloc] initWithItemCode:92];
            Item* i17 = [[Item alloc] initWithItemCode:94];
            Item* i18 = [[Item alloc] initWithItemCode:97];
            
            shopInventory = [[NSArray alloc] initWithObjects:i1,i2,i3,i4,i5,i6,i7,i8,i9,i10,i11,i12,i13,i14,i15,i16,i17,i18, nil];
            
            CCLabelTTF *shopName = [CCLabelTTF labelWithString:@"Bart's Weapon Smith" dimensions: CGSizeMake(230, 40) alignment:UITextAlignmentCenter fontName:@"Optima-Bold" fontSize:24.0];
            shopName.position = ccp(winSize.width/2, winSize.height - 25);
            shopName.color = ccc3(0, 0, 0);
            [self addChild: shopName z:15];
        }
        else if (shopCode == 2) // PL1 Sprite 18 - Armor Shop (low level)
        {
            Item* i1 = [[Item alloc] initWithItemCode:110];
            Item* i2 = [[Item alloc] initWithItemCode:111];
            Item* i3 = [[Item alloc] initWithItemCode:112];
            Item* i4 = [[Item alloc] initWithItemCode:113];
            Item* i5 = [[Item alloc] initWithItemCode:114];
            Item* i6 = [[Item alloc] initWithItemCode:115];
            Item* i7 = [[Item alloc] initWithItemCode:116];
            Item* i8 = [[Item alloc] initWithItemCode:117];
            
            Item* i9 = [[Item alloc] initWithItemCode:128];
            Item* i10 = [[Item alloc] initWithItemCode:123];
            Item* i11 = [[Item alloc] initWithItemCode:127];
            
            Item* i12 = [[Item alloc] initWithItemCode:130];
            Item* i13 = [[Item alloc] initWithItemCode:131];
            Item* i14 = [[Item alloc] initWithItemCode:132];
            Item* i15 = [[Item alloc] initWithItemCode:133];
            Item* i16 = [[Item alloc] initWithItemCode:134];
            Item* i17 = [[Item alloc] initWithItemCode:135];
            Item* i18 = [[Item alloc] initWithItemCode:140];
            
            Item* i19 = [[Item alloc] initWithItemCode:150];
            Item* i20 = [[Item alloc] initWithItemCode:151];
            Item* i21 = [[Item alloc] initWithItemCode:152];
            Item* i22 = [[Item alloc] initWithItemCode:153];
            Item* i23 = [[Item alloc] initWithItemCode:155];
            Item* i24 = [[Item alloc] initWithItemCode:158];
            
            Item* i25 = [[Item alloc] initWithItemCode:180];
            Item* i26 = [[Item alloc] initWithItemCode:181];
            Item* i27 = [[Item alloc] initWithItemCode:182];
            Item* i28 = [[Item alloc] initWithItemCode:183];
            Item* i29 = [[Item alloc] initWithItemCode:184];
            Item* i30 = [[Item alloc] initWithItemCode:185];
            Item* i31 = [[Item alloc] initWithItemCode:191];
            
            shopInventory = [[NSArray alloc] initWithObjects:i1,i2,i3,i4,i5,i6,i7,i8,i9,i10,i11,i12,i13,i14,i15,i16,i17,i18,i19,i20,i21,i22,i23,i24,i25,i26,i27,i28,i29,i30,i31, nil];
            
            CCLabelTTF *shopName = [CCLabelTTF labelWithString:@"Rock's Blacksmith" dimensions: CGSizeMake(230, 40) alignment:UITextAlignmentCenter fontName:@"Optima-Bold" fontSize:24.0];
            shopName.position = ccp(winSize.width/2, winSize.height - 25);
            shopName.color = ccc3(0, 0, 0);
            [self addChild: shopName z:15];
        }
        else if (shopCode == 3) // PL2 Sprite 46 - General Store 1 (huge store)
        {
            Item* i1 = [[Item alloc] initWithItemCode:1];
            Item* i2 = [[Item alloc] initWithItemCode:2];
            Item* i3 = [[Item alloc] initWithItemCode:3];
            Item* i4 = [[Item alloc] initWithItemCode:4];
            Item* i5 = [[Item alloc] initWithItemCode:19];
            Item* i6 = [[Item alloc] initWithItemCode:20];
            Item* i7 = [[Item alloc] initWithItemCode:31];
            Item* i8 = [[Item alloc] initWithItemCode:32];
            Item* i9 = [[Item alloc] initWithItemCode:33];
            Item* i10 = [[Item alloc] initWithItemCode:34];
            Item* i11 = [[Item alloc] initWithItemCode:39];
            
            shopInventory = [[NSArray alloc] initWithObjects:i1,i2,i3,i4,i5,i6,i7,i8,i9,i10,i11, nil];
            
            CCLabelTTF *shopName = [CCLabelTTF labelWithString:@"Karamut Marketplace" dimensions: CGSizeMake(230, 40) alignment:UITextAlignmentCenter fontName:@"Optima-Bold" fontSize:24.0];
            shopName.position = ccp(winSize.width/2, winSize.height - 25);
            shopName.color = ccc3(0, 0, 0);
            [self addChild: shopName z:15];
        }
        else if (shopCode == 4) // PL2 Sprite 47 - General Store 2 (huge store)
        {
            Item* i1 = [[Item alloc] initWithItemCode:5];
            Item* i2 = [[Item alloc] initWithItemCode:6];
            Item* i3 = [[Item alloc] initWithItemCode:7];
            Item* i4 = [[Item alloc] initWithItemCode:8];
            Item* i5 = [[Item alloc] initWithItemCode:9];
            Item* i6 = [[Item alloc] initWithItemCode:10];
            Item* i7 = [[Item alloc] initWithItemCode:24];
            Item* i8 = [[Item alloc] initWithItemCode:11];
            Item* i9 = [[Item alloc] initWithItemCode:12];
            Item* i10 = [[Item alloc] initWithItemCode:13];
            Item* i11 = [[Item alloc] initWithItemCode:14];
            Item* i12 = [[Item alloc] initWithItemCode:15];
            Item* i13 = [[Item alloc] initWithItemCode:16];
            Item* i14 = [[Item alloc] initWithItemCode:17];
            Item* i15 = [[Item alloc] initWithItemCode:18];
            
            shopInventory = [[NSArray alloc] initWithObjects:i1,i2,i3,i4,i5,i6,i7,i8,i9,i10,i11,i12,i13,i14,i15, nil];
            
            
            CCLabelTTF *shopName = [CCLabelTTF labelWithString:@"Karamut Marketplace" dimensions: CGSizeMake(230, 40) alignment:UITextAlignmentCenter fontName:@"Optima-Bold" fontSize:24.0];
            shopName.position = ccp(winSize.width/2, winSize.height - 25);
            shopName.color = ccc3(0, 0, 0);
            [self addChild: shopName z:15];
        }
        else if (shopCode == 5) // PL2 Sprite 49 - Weapons Store (huge store)
        {
            Item* i1 = [[Item alloc] initWithItemCode:52];
            Item* i2 = [[Item alloc] initWithItemCode:53];
            Item* i3 = [[Item alloc] initWithItemCode:54];
            Item* i4 = [[Item alloc] initWithItemCode:55];
            Item* i5 = [[Item alloc] initWithItemCode:56];
            Item* i6 = [[Item alloc] initWithItemCode:57];
            Item* i7 = [[Item alloc] initWithItemCode:58];
            Item* i8 = [[Item alloc] initWithItemCode:59];
            Item* i9 = [[Item alloc] initWithItemCode:60];
            Item* i10 = [[Item alloc] initWithItemCode:61];
            Item* i11 = [[Item alloc] initWithItemCode:62];
            Item* i12 = [[Item alloc] initWithItemCode:63];
            Item* i13 = [[Item alloc] initWithItemCode:64];
            Item* i14 = [[Item alloc] initWithItemCode:65];
            Item* i15 = [[Item alloc] initWithItemCode:66];
            Item* i16 = [[Item alloc] initWithItemCode:67];
            Item* i17 = [[Item alloc] initWithItemCode:68];
            Item* i18 = [[Item alloc] initWithItemCode:69];
            Item* i19 = [[Item alloc] initWithItemCode:70];
            
            Item* i20 = [[Item alloc] initWithItemCode:90];
            Item* i21 = [[Item alloc] initWithItemCode:91];
            Item* i22 = [[Item alloc] initWithItemCode:92];
            Item* i23 = [[Item alloc] initWithItemCode:93];
            Item* i24 = [[Item alloc] initWithItemCode:96];
            Item* i25 = [[Item alloc] initWithItemCode:98];
            
            shopInventory = [[NSArray alloc] initWithObjects:i1,i2,i3,i4,i5,i6,i7,i8,i9,i10,i11,i12,i13,i14,i15,i16,i17,i18,i19,i20,i21,i22,i23,i24,i25, nil];
            
            
            CCLabelTTF *shopName = [CCLabelTTF labelWithString:@"Karamut Blacksmith" dimensions: CGSizeMake(230, 40) alignment:UITextAlignmentCenter fontName:@"Optima-Bold" fontSize:24.0];
            shopName.position = ccp(winSize.width/2, winSize.height - 25);
            shopName.color = ccc3(0, 0, 0);
            [self addChild: shopName z:15];
        }
        else if (shopCode == 6) // PL2 Sprite 50 - Armor Store (huge store)
        {
            Item* i1 = [[Item alloc] initWithItemCode:112];
            Item* i2 = [[Item alloc] initWithItemCode:113];
            Item* i3 = [[Item alloc] initWithItemCode:114];
            Item* i4 = [[Item alloc] initWithItemCode:115];
            Item* i5 = [[Item alloc] initWithItemCode:116];
            Item* i6 = [[Item alloc] initWithItemCode:117];
            Item* i7 = [[Item alloc] initWithItemCode:143];
            Item* i8 = [[Item alloc] initWithItemCode:144];
            Item* i9 = [[Item alloc] initWithItemCode:118];
            Item* i10 = [[Item alloc] initWithItemCode:119];
            Item* i11 = [[Item alloc] initWithItemCode:128];
            Item* i12 = [[Item alloc] initWithItemCode:123];
            Item* i13 = [[Item alloc] initWithItemCode:127];
            
            
            Item* i14 = [[Item alloc] initWithItemCode:131];
            Item* i15 = [[Item alloc] initWithItemCode:132];
            Item* i16 = [[Item alloc] initWithItemCode:133];
            Item* i17 = [[Item alloc] initWithItemCode:134];
            Item* i18 = [[Item alloc] initWithItemCode:135];
            Item* i19 = [[Item alloc] initWithItemCode:145];
            Item* i20 = [[Item alloc] initWithItemCode:136];
            
            Item* i21 = [[Item alloc] initWithItemCode:151];
            Item* i22 = [[Item alloc] initWithItemCode:152];
            Item* i23 = [[Item alloc] initWithItemCode:153];
            Item* i24 = [[Item alloc] initWithItemCode:154];
            Item* i25 = [[Item alloc] initWithItemCode:155];
            Item* i26 = [[Item alloc] initWithItemCode:156];
            Item* i27 = [[Item alloc] initWithItemCode:158];
            
            Item* i28 = [[Item alloc] initWithItemCode:181];
            Item* i29 = [[Item alloc] initWithItemCode:182];
            Item* i30 = [[Item alloc] initWithItemCode:183];
            Item* i31 = [[Item alloc] initWithItemCode:184];
            Item* i32 = [[Item alloc] initWithItemCode:185];
            Item* i33 = [[Item alloc] initWithItemCode:186];
            Item* i34 = [[Item alloc] initWithItemCode:187];
            Item* i35 = [[Item alloc] initWithItemCode:191];
            Item* i36 = [[Item alloc] initWithItemCode:195];
            Item* i37 = [[Item alloc] initWithItemCode:196];
            
            shopInventory = [[NSArray alloc] initWithObjects:i1,i2,i3,i4,i5,i6,i7,i8,i9,i10,i11,i12,i13,i14,i15,i16,i17,i18,i19,i20,i21,i22,i23,i24,i25,i26,i27,i28,i29,i30,i31,i32,i33,i34,i35,i36,i37, nil];
            
            CCLabelTTF *shopName = [CCLabelTTF labelWithString:@"Dhur's Armory" dimensions: CGSizeMake(230, 40) alignment:UITextAlignmentCenter fontName:@"Optima-Bold" fontSize:24.0];
            shopName.position = ccp(winSize.width/2, winSize.height - 25);
            shopName.color = ccc3(0, 0, 0);
            [self addChild: shopName z:15];
        }
        else if (shopCode == 7) // PL2 Sprite 51 - Advanced Combat (huge store)
        {
            Item* i1 = [[Item alloc] initWithItemCode:71];
            Item* i2 = [[Item alloc] initWithItemCode:72];
            Item* i3 = [[Item alloc] initWithItemCode:73];
            Item* i4 = [[Item alloc] initWithItemCode:74];
            Item* i5 = [[Item alloc] initWithItemCode:75];
            Item* i6 = [[Item alloc] initWithItemCode:83];
            Item* i7 = [[Item alloc] initWithItemCode:84];
            Item* i8 = [[Item alloc] initWithItemCode:78];
            Item* i9 = [[Item alloc] initWithItemCode:79];
            Item* i10 = [[Item alloc] initWithItemCode:80];
            
            Item* i11 = [[Item alloc] initWithItemCode:120];
            Item* i12 = [[Item alloc] initWithItemCode:121];
            Item* i13 = [[Item alloc] initWithItemCode:122];
            Item* i14 = [[Item alloc] initWithItemCode:126];
            Item* i15 = [[Item alloc] initWithItemCode:125];
            
            Item* i16 = [[Item alloc] initWithItemCode:137];
            Item* i17 = [[Item alloc] initWithItemCode:138];
            Item* i18 = [[Item alloc] initWithItemCode:149];
            
            Item* i19 = [[Item alloc] initWithItemCode:157];
            Item* i20 = [[Item alloc] initWithItemCode:159];
            Item* i21 = [[Item alloc] initWithItemCode:161];
            Item* i22 = [[Item alloc] initWithItemCode:162];
            
            Item* i23 = [[Item alloc] initWithItemCode:188];
            Item* i24 = [[Item alloc] initWithItemCode:189];
            Item* i25 = [[Item alloc] initWithItemCode:190];
            Item* i26 = [[Item alloc] initWithItemCode:192];
            Item* i27 = [[Item alloc] initWithItemCode:193];
            
            Item* i28 = [[Item alloc] initWithItemCode:98];
            Item* i29 = [[Item alloc] initWithItemCode:94];
            Item* i30 = [[Item alloc] initWithItemCode:100];
            
            shopInventory = [[NSArray alloc] initWithObjects:i1,i2,i3,i4,i5,i6,i7,i8,i9,i10,i11,i12,i13,i14,i15,i16,i17,i18,i19,i20,i21,i22,i23,i24,i25,i26,i27,i28,i29,i30, nil];
            
            CCLabelTTF *shopName = [CCLabelTTF labelWithString:@"Advanced Combat Smith" dimensions: CGSizeMake(230, 40) alignment:UITextAlignmentCenter fontName:@"Optima-Bold" fontSize:24.0];
            shopName.position = ccp(winSize.width/2, winSize.height - 25);
            shopName.color = ccc3(0, 0, 0);
            [self addChild: shopName z:15];
        }
        else if (shopCode == 8) // PL3 Sprite 72 - Weapons/Armor (medium level) //some unique items sold here
        {
            Item* i1 = [[Item alloc] initWithItemCode:55];
            Item* i2 = [[Item alloc] initWithItemCode:56];
            Item* i3 = [[Item alloc] initWithItemCode:57];
            Item* i4 = [[Item alloc] initWithItemCode:58];
            Item* i5 = [[Item alloc] initWithItemCode:59];
            Item* i6 = [[Item alloc] initWithItemCode:60];
            Item* i7 = [[Item alloc] initWithItemCode:61];
            Item* i8 = [[Item alloc] initWithItemCode:62];
            Item* i9 = [[Item alloc] initWithItemCode:63];
            Item* i10 = [[Item alloc] initWithItemCode:64];
            Item* i11 = [[Item alloc] initWithItemCode:65];
            
            Item* i12 = [[Item alloc] initWithItemCode:114];
            Item* i13 = [[Item alloc] initWithItemCode:115];
            Item* i14 = [[Item alloc] initWithItemCode:116];
            Item* i15 = [[Item alloc] initWithItemCode:117];
            Item* i16 = [[Item alloc] initWithItemCode:143];
            Item* i17 = [[Item alloc] initWithItemCode:144];
            Item* i18 = [[Item alloc] initWithItemCode:127];
            
            Item* i19 = [[Item alloc] initWithItemCode:133];
            Item* i20 = [[Item alloc] initWithItemCode:134];
            Item* i21 = [[Item alloc] initWithItemCode:135];
            
            Item* i22 = [[Item alloc] initWithItemCode:152];
            Item* i23 = [[Item alloc] initWithItemCode:153];
            Item* i24 = [[Item alloc] initWithItemCode:154];
            Item* i25 = [[Item alloc] initWithItemCode:155];
            Item* i26 = [[Item alloc] initWithItemCode:165];
            
            Item* i27 = [[Item alloc] initWithItemCode:182];
            Item* i28 = [[Item alloc] initWithItemCode:183];
            Item* i29 = [[Item alloc] initWithItemCode:184];
            Item* i30 = [[Item alloc] initWithItemCode:185];
            Item* i31 = [[Item alloc] initWithItemCode:195];
            Item* i32 = [[Item alloc] initWithItemCode:190];
            Item* i33 = [[Item alloc] initWithItemCode:191];
            
            Item* i34 = [[Item alloc] initWithItemCode:94];
            Item* i35 = [[Item alloc] initWithItemCode:98];
            Item* i36 = [[Item alloc] initWithItemCode:97];
            
            shopInventory = [[NSArray alloc] initWithObjects:i1,i2,i3,i4,i5,i6,i7,i8,i9,i10,i11,i12,i13,i14,i15,i16,i17,i18,i19,i20,i21,i22,i23,i24,i25, i26, i27, i28, i29, i30, i31, i32, i33,i34,i35,i36, nil];
            
            CCLabelTTF *shopName = [CCLabelTTF labelWithString:@"Imported Weapons Shop" dimensions: CGSizeMake(230, 40) alignment:UITextAlignmentCenter fontName:@"Optima-Bold" fontSize:24.0];
            shopName.position = ccp(winSize.width/2, winSize.height - 25);
            shopName.color = ccc3(0, 0, 0);
            [self addChild: shopName z:15];
        }
        else if (shopCode == 9) // PL3 Sprite 73 - General Store
        {
            Item* i1 = [[Item alloc] initWithItemCode:1];
            Item* i2 = [[Item alloc] initWithItemCode:2];
            Item* i3 = [[Item alloc] initWithItemCode:3];
            Item* i4 = [[Item alloc] initWithItemCode:4];
            Item* i5 = [[Item alloc] initWithItemCode:19];
            Item* i6 = [[Item alloc] initWithItemCode:20];
            Item* i7 = [[Item alloc] initWithItemCode:31];
            Item* i8 = [[Item alloc] initWithItemCode:32];
            Item* i9 = [[Item alloc] initWithItemCode:33];
            Item* i10 = [[Item alloc] initWithItemCode:34];
            Item* i11 = [[Item alloc] initWithItemCode:39];
            
            shopInventory = [[NSArray alloc] initWithObjects:i1,i2,i3,i4,i5,i6,i7,i8,i9,i10,i11,nil];
            
            CCLabelTTF *shopName = [CCLabelTTF labelWithString:@"Mountain's Shadow Marketplace" dimensions: CGSizeMake(230, 40) alignment:UITextAlignmentCenter fontName:@"Optima-Bold" fontSize:24.0];
            shopName.position = ccp(winSize.width/2, winSize.height - 25);
            shopName.color = ccc3(0, 0, 0);
            [self addChild: shopName z:15];
        }
        else if (shopCode == 10) // PL4 Sprite 100 - General items (good store)
        {
            Item* i1 = [[Item alloc] initWithItemCode:1];
            Item* i2 = [[Item alloc] initWithItemCode:2];
            Item* i3 = [[Item alloc] initWithItemCode:3];
            Item* i4 = [[Item alloc] initWithItemCode:4];
            Item* i5 = [[Item alloc] initWithItemCode:19];
            Item* i6 = [[Item alloc] initWithItemCode:20];
            Item* i7 = [[Item alloc] initWithItemCode:31];
            Item* i8 = [[Item alloc] initWithItemCode:32];
            Item* i9 = [[Item alloc] initWithItemCode:33];
            Item* i10 = [[Item alloc] initWithItemCode:34];
            Item* i11 = [[Item alloc] initWithItemCode:39];
            
            shopInventory = [[NSArray alloc] initWithObjects:i1,i2,i3,i4,i5,i6,i7,i8,i9,i10,i11, nil];
            
            CCLabelTTF *shopName = [CCLabelTTF labelWithString:@"Rock's Blacksmith" dimensions: CGSizeMake(230, 40) alignment:UITextAlignmentCenter fontName:@"Optima-Bold" fontSize:24.0];
            shopName.position = ccp(winSize.width/2, winSize.height - 25);
            shopName.color = ccc3(0, 0, 0);
            [self addChild: shopName z:15];
        }
        else if (shopCode == 11) // PL4 Sprite 101 - General items (good store - different)
        {
            Item* i1 = [[Item alloc] initWithItemCode:5];
            Item* i2 = [[Item alloc] initWithItemCode:6];
            Item* i3 = [[Item alloc] initWithItemCode:7];
            Item* i4 = [[Item alloc] initWithItemCode:8];
            Item* i5 = [[Item alloc] initWithItemCode:9];
            Item* i6 = [[Item alloc] initWithItemCode:10];
            Item* i7 = [[Item alloc] initWithItemCode:24];
            Item* i8 = [[Item alloc] initWithItemCode:11];
            Item* i9 = [[Item alloc] initWithItemCode:12];
            Item* i10 = [[Item alloc] initWithItemCode:13];
            Item* i11 = [[Item alloc] initWithItemCode:14];
            Item* i12 = [[Item alloc] initWithItemCode:15];
            Item* i13 = [[Item alloc] initWithItemCode:16];
            Item* i14 = [[Item alloc] initWithItemCode:17];
            Item* i15 = [[Item alloc] initWithItemCode:18];
            
            shopInventory = [[NSArray alloc] initWithObjects:i1,i2,i3,i4,i5,i6,i7,i8,i9,i10,i11,i12,i13,i14,i15, nil];
            
            CCLabelTTF *shopName = [CCLabelTTF labelWithString:@"Rock's Blacksmith" dimensions: CGSizeMake(230, 40) alignment:UITextAlignmentCenter fontName:@"Optima-Bold" fontSize:24.0];
            shopName.position = ccp(winSize.width/2, winSize.height - 25);
            shopName.color = ccc3(0, 0, 0);
            [self addChild: shopName z:15];
        }
        else if (shopCode == 12) // PL4 Sprite 102 - Armor
        {
            
            Item* i1 = [[Item alloc] initWithItemCode:116];
            Item* i2 = [[Item alloc] initWithItemCode:117];
            Item* i3 = [[Item alloc] initWithItemCode:123];
            Item* i4 = [[Item alloc] initWithItemCode:143];
            Item* i5 = [[Item alloc] initWithItemCode:144];
            Item* i6 = [[Item alloc] initWithItemCode:118];
            Item* i7 = [[Item alloc] initWithItemCode:119];
            Item* i8 = [[Item alloc] initWithItemCode:120];
            Item* i9 = [[Item alloc] initWithItemCode:121];
            Item* i10 = [[Item alloc] initWithItemCode:122];
            Item* i11 = [[Item alloc] initWithItemCode:123];
            Item* i12 = [[Item alloc] initWithItemCode:127];
            Item* i13 = [[Item alloc] initWithItemCode:125];
            Item* i14 = [[Item alloc] initWithItemCode:124];
            Item* i15 = [[Item alloc] initWithItemCode:126];
            Item* i16 = [[Item alloc] initWithItemCode:129];
            
            Item* i18 = [[Item alloc] initWithItemCode:133];
            Item* i19 = [[Item alloc] initWithItemCode:135];
            Item* i20 = [[Item alloc] initWithItemCode:145];
            Item* i21 = [[Item alloc] initWithItemCode:136];
            Item* i22 = [[Item alloc] initWithItemCode:137];
            Item* i23 = [[Item alloc] initWithItemCode:138];
            Item* i24 = [[Item alloc] initWithItemCode:139];
            
            Item* i25 = [[Item alloc] initWithItemCode:155];
            Item* i26 = [[Item alloc] initWithItemCode:165];
            Item* i27 = [[Item alloc] initWithItemCode:154];
            Item* i28 = [[Item alloc] initWithItemCode:156];
            Item* i29 = [[Item alloc] initWithItemCode:158];
            Item* i30 = [[Item alloc] initWithItemCode:159];
            Item* i31 = [[Item alloc] initWithItemCode:161];
            Item* i32 = [[Item alloc] initWithItemCode:162];
            
            Item* i33 = [[Item alloc] initWithItemCode:184];
            Item* i34 = [[Item alloc] initWithItemCode:185];
            Item* i35 = [[Item alloc] initWithItemCode:195];
            Item* i36 = [[Item alloc] initWithItemCode:196];
            Item* i37 = [[Item alloc] initWithItemCode:186];
            Item* i38 = [[Item alloc] initWithItemCode:187];
            Item* i39 = [[Item alloc] initWithItemCode:188];
            Item* i40 = [[Item alloc] initWithItemCode:189];
            Item* i41 = [[Item alloc] initWithItemCode:192];
            Item* i42 = [[Item alloc] initWithItemCode:193];
            
            shopInventory = [[NSArray alloc] initWithObjects:i1,i2,i3,i4,i5,i6,i7,i8,i9,i10,i11,i12,i13,i14,i15,i16,i18,i19,i20,i21,i22,i23,i24,i25,i26,i27,i28,i29,i30,i31,i32,i33,i34,i35,i36,i37,i38,i39,i40,i41,i42, nil];
            
            CCLabelTTF *shopName = [CCLabelTTF labelWithString:@"Ellemak Armor Emporium" dimensions: CGSizeMake(230, 40) alignment:UITextAlignmentCenter fontName:@"Optima-Bold" fontSize:24.0];
            shopName.position = ccp(winSize.width/2, winSize.height - 25);
            shopName.color = ccc3(0, 0, 0);
            [self addChild: shopName z:15];
        }
        else if (shopCode == 13) // PL4 Sprite 103 - Blacksmith
        {
            Item* i1 = [[Item alloc] initWithItemCode:60];
            Item* i2 = [[Item alloc] initWithItemCode:61];
            Item* i3 = [[Item alloc] initWithItemCode:62];
            Item* i4 = [[Item alloc] initWithItemCode:63];
            Item* i5 = [[Item alloc] initWithItemCode:64];
            Item* i6 = [[Item alloc] initWithItemCode:65];
            Item* i7 = [[Item alloc] initWithItemCode:66];
            Item* i8 = [[Item alloc] initWithItemCode:67];
            Item* i9 = [[Item alloc] initWithItemCode:68];
            Item* i10 = [[Item alloc] initWithItemCode:69];
            Item* i11 = [[Item alloc] initWithItemCode:70];
            Item* i12 = [[Item alloc] initWithItemCode:71];
            Item* i13 = [[Item alloc] initWithItemCode:72];
            Item* i14 = [[Item alloc] initWithItemCode:73];
            Item* i15 = [[Item alloc] initWithItemCode:74];
            Item* i16 = [[Item alloc] initWithItemCode:75];
            Item* i17 = [[Item alloc] initWithItemCode:78];
            Item* i18 = [[Item alloc] initWithItemCode:79];
            Item* i19 = [[Item alloc] initWithItemCode:80];
            Item* i20 = [[Item alloc] initWithItemCode:81];
            
            Item* i21 = [[Item alloc] initWithItemCode:90];
            Item* i22 = [[Item alloc] initWithItemCode:91];
            Item* i23 = [[Item alloc] initWithItemCode:92];
            Item* i24 = [[Item alloc] initWithItemCode:93];
            Item* i25 = [[Item alloc] initWithItemCode:95];
            Item* i26 = [[Item alloc] initWithItemCode:98];
            Item* i27 = [[Item alloc] initWithItemCode:96];
            Item* i28 = [[Item alloc] initWithItemCode:100];
            
            shopInventory = [[NSArray alloc] initWithObjects:i1,i2,i3,i4,i5,i6,i7,i8,i9,i10,i11,i12,i13,i14,i15,i16,i17,i18,i19,i20,i21,i22,i23,i24,i25,i26,i27,i28, nil];
            
            shopInventory = [[NSArray alloc] initWithObjects:i1,i2,i3,i4,i5,i6, nil];
            
            CCLabelTTF *shopName = [CCLabelTTF labelWithString:@"Morgan's Blacksmith" dimensions: CGSizeMake(230, 40) alignment:UITextAlignmentCenter fontName:@"Optima-Bold" fontSize:24.0];
            shopName.position = ccp(winSize.width/2, winSize.height - 25);
            shopName.color = ccc3(0, 0, 0);
            [self addChild: shopName z:15];
        }
        else if (shopCode == 14) // PL6 Sprite 115 - General items 
        {
            Item* i1 = [[Item alloc] initWithItemCode:1];
            Item* i2 = [[Item alloc] initWithItemCode:2];
            Item* i3 = [[Item alloc] initWithItemCode:3];
            Item* i4 = [[Item alloc] initWithItemCode:4];
            Item* i5 = [[Item alloc] initWithItemCode:19];
            Item* i6 = [[Item alloc] initWithItemCode:20];
            Item* i7 = [[Item alloc] initWithItemCode:31];
            Item* i8 = [[Item alloc] initWithItemCode:32];
            Item* i9 = [[Item alloc] initWithItemCode:33];
            Item* i10 = [[Item alloc] initWithItemCode:34];
            Item* i11 = [[Item alloc] initWithItemCode:39];
            
            Item* i12 = [[Item alloc] initWithItemCode:5];
            Item* i13 = [[Item alloc] initWithItemCode:6];
            Item* i14 = [[Item alloc] initWithItemCode:7];
            Item* i15 = [[Item alloc] initWithItemCode:8];
            Item* i16 = [[Item alloc] initWithItemCode:9];
            Item* i17 = [[Item alloc] initWithItemCode:10];
            Item* i18 = [[Item alloc] initWithItemCode:24];
            
            shopInventory = [[NSArray alloc] initWithObjects:i1,i2,i3,i4,i5,i6,i7,i8,i9,i10,i11,i12,i13,i14,i15,i16,i17,i18, nil];
            
            CCLabelTTF *shopName = [CCLabelTTF labelWithString:@"Halden Marketplace" dimensions: CGSizeMake(230, 40) alignment:UITextAlignmentCenter fontName:@"Optima-Bold" fontSize:24.0];
            shopName.position = ccp(winSize.width/2, winSize.height - 25);
            shopName.color = ccc3(0, 0, 0);
            [self addChild: shopName z:15];
        }
        else if (shopCode == 15) // PL6 Sprite 116 - Weapons/Armor (medium/high)
        {
            Item* i1 = [[Item alloc] initWithItemCode:71];
            Item* i2 = [[Item alloc] initWithItemCode:72];
            Item* i3 = [[Item alloc] initWithItemCode:73];
            Item* i4 = [[Item alloc] initWithItemCode:74];
            Item* i5 = [[Item alloc] initWithItemCode:83];
            Item* i6 = [[Item alloc] initWithItemCode:84];
            Item* i7 = [[Item alloc] initWithItemCode:78];
            Item* i8 = [[Item alloc] initWithItemCode:79];
            Item* i9 = [[Item alloc] initWithItemCode:80];
            Item* i10 = [[Item alloc] initWithItemCode:81];
            
            Item* i11 = [[Item alloc] initWithItemCode:120];
            Item* i12 = [[Item alloc] initWithItemCode:121];
            Item* i13 = [[Item alloc] initWithItemCode:122];
            Item* i14 = [[Item alloc] initWithItemCode:126];
            Item* i15 = [[Item alloc] initWithItemCode:125];
            
            Item* i16 = [[Item alloc] initWithItemCode:137];
            Item* i17 = [[Item alloc] initWithItemCode:138];
            Item* i18 = [[Item alloc] initWithItemCode:149];
            
            Item* i19 = [[Item alloc] initWithItemCode:157];
            Item* i20 = [[Item alloc] initWithItemCode:159];
            Item* i21 = [[Item alloc] initWithItemCode:161];
            Item* i22 = [[Item alloc] initWithItemCode:162];
            
            Item* i23 = [[Item alloc] initWithItemCode:188];
            Item* i24 = [[Item alloc] initWithItemCode:189];
            Item* i25 = [[Item alloc] initWithItemCode:190];
            Item* i26 = [[Item alloc] initWithItemCode:192];
            Item* i27 = [[Item alloc] initWithItemCode:193];
            
            Item* i28 = [[Item alloc] initWithItemCode:98];
            Item* i29 = [[Item alloc] initWithItemCode:96];
            Item* i30 = [[Item alloc] initWithItemCode:94];
            Item* i31 = [[Item alloc] initWithItemCode:100];
            
            shopInventory = [[NSArray alloc] initWithObjects:i1,i2,i3,i4,i5,i6,i7,i8,i9,i10,i11,i12,i13,i14,i15,i16,i17,i18,i19,i20,i21,i22,i23,i24,i25,i26,i27,i28,i29,i30,i31, nil];
            
            
            CCLabelTTF *shopName = [CCLabelTTF labelWithString:@"Halden Elite Armory" dimensions: CGSizeMake(230, 40) alignment:UITextAlignmentCenter fontName:@"Optima-Bold" fontSize:24.0];
            shopName.position = ccp(winSize.width/2, winSize.height - 25);
            shopName.color = ccc3(0, 0, 0);
            [self addChild: shopName z:15];
        }
        else if (shopCode == 16) // PL8 Sprite 122 - General items (good store - different)
        {
            Item* i1 = [[Item alloc] initWithItemCode:1];
            Item* i2 = [[Item alloc] initWithItemCode:2];
            Item* i3 = [[Item alloc] initWithItemCode:3];
            Item* i4 = [[Item alloc] initWithItemCode:4];
            Item* i5 = [[Item alloc] initWithItemCode:19];
            Item* i6 = [[Item alloc] initWithItemCode:20];
            Item* i7 = [[Item alloc] initWithItemCode:31];
            Item* i8 = [[Item alloc] initWithItemCode:32];
            Item* i9 = [[Item alloc] initWithItemCode:33];
            Item* i10 = [[Item alloc] initWithItemCode:34];
            Item* i11 = [[Item alloc] initWithItemCode:39];
            Item* i12 = [[Item alloc] initWithItemCode:40];
            
            Item* i13 = [[Item alloc] initWithItemCode:5];
            Item* i14 = [[Item alloc] initWithItemCode:6];
            Item* i15 = [[Item alloc] initWithItemCode:7];
            Item* i16 = [[Item alloc] initWithItemCode:8];
            Item* i17 = [[Item alloc] initWithItemCode:9];
            Item* i18 = [[Item alloc] initWithItemCode:10];
            Item* i19 = [[Item alloc] initWithItemCode:24];
            
            shopInventory = [[NSArray alloc] initWithObjects:i1,i2,i3,i4,i5,i6,i7,i8,i9,i10,i11,i12,i13,i14,i15,i16,i17,i18,i19, nil];
            
            
            CCLabelTTF *shopName = [CCLabelTTF labelWithString:@"Hero's Market" dimensions: CGSizeMake(230, 40) alignment:UITextAlignmentCenter fontName:@"Optima-Bold" fontSize:24.0];
            shopName.position = ccp(winSize.width/2, winSize.height - 25);
            shopName.color = ccc3(0, 0, 0);
            [self addChild: shopName z:15];
        }
        else if (shopCode == 17) // PL8 Sprite 123 - Weapons and Amulets (High)
        {
            Item* i1 = [[Item alloc] initWithItemCode:71];
            Item* i2 = [[Item alloc] initWithItemCode:72];
            Item* i3 = [[Item alloc] initWithItemCode:73];
            Item* i4 = [[Item alloc] initWithItemCode:74];
            Item* i5 = [[Item alloc] initWithItemCode:76];
            Item* i6 = [[Item alloc] initWithItemCode:78];
            Item* i7 = [[Item alloc] initWithItemCode:79];
            Item* i8 = [[Item alloc] initWithItemCode:80];
            Item* i9 = [[Item alloc] initWithItemCode:81];
            Item* i10 = [[Item alloc] initWithItemCode:82];
            
            Item* i11 = [[Item alloc] initWithItemCode:95];
            Item* i12 = [[Item alloc] initWithItemCode:96];
            Item* i13 = [[Item alloc] initWithItemCode:100];
            Item* i14 = [[Item alloc] initWithItemCode:99];
            
            shopInventory = [[NSArray alloc] initWithObjects:i1,i2,i3,i4,i5,i6,i7,i8,i9,i10,i11,i12,i13,i14, nil];
            
            CCLabelTTF *shopName = [CCLabelTTF labelWithString:@"Hero's Weapon Smith" dimensions: CGSizeMake(230, 40) alignment:UITextAlignmentCenter fontName:@"Optima-Bold" fontSize:24.0];
            shopName.position = ccp(winSize.width/2, winSize.height - 25);
            shopName.color = ccc3(0, 0, 0);
            [self addChild: shopName z:15];
        }
        else if (shopCode == 18) // PL8 Sprite 124 - Body Armor (High)
        {
            Item* i1 = [[Item alloc] initWithItemCode:121];
            Item* i2 = [[Item alloc] initWithItemCode:122];
            Item* i3 = [[Item alloc] initWithItemCode:125];
            Item* i4 = [[Item alloc] initWithItemCode:124];
            Item* i5 = [[Item alloc] initWithItemCode:126];
            Item* i6 = [[Item alloc] initWithItemCode:129];
            Item* i7 = [[Item alloc] initWithItemCode:142];
            
            Item* i8 = [[Item alloc] initWithItemCode:137];
            Item* i9 = [[Item alloc] initWithItemCode:138];
            Item* i10 = [[Item alloc] initWithItemCode:139];
            Item* i11 = [[Item alloc] initWithItemCode:141];
            
            shopInventory = [[NSArray alloc] initWithObjects:i1,i2,i3,i4,i5,i6,i7,i8,i9,i10,i11, nil];
            
            
            CCLabelTTF *shopName = [CCLabelTTF labelWithString:@"Hero's Armory" dimensions: CGSizeMake(230, 40) alignment:UITextAlignmentCenter fontName:@"Optima-Bold" fontSize:24.0];
            shopName.position = ccp(winSize.width/2, winSize.height - 25);
            shopName.color = ccc3(0, 0, 0);
            [self addChild: shopName z:15];
        }
        else if (shopCode == 19) // PL8 Sprite 125 - Shields and Helms (High)
        {
            Item* i1 = [[Item alloc] initWithItemCode:154];
            Item* i2 = [[Item alloc] initWithItemCode:157];
            Item* i3 = [[Item alloc] initWithItemCode:159];
            Item* i4 = [[Item alloc] initWithItemCode:161];
            Item* i5 = [[Item alloc] initWithItemCode:162];
            Item* i6 = [[Item alloc] initWithItemCode:160];
            
            Item* i7 = [[Item alloc] initWithItemCode:190];
            Item* i8 = [[Item alloc] initWithItemCode:188];
            Item* i9 = [[Item alloc] initWithItemCode:189];
            Item* i10 = [[Item alloc] initWithItemCode:192];
            Item* i11 = [[Item alloc] initWithItemCode:193];
            Item* i12 = [[Item alloc] initWithItemCode:194];
            
            shopInventory = [[NSArray alloc] initWithObjects:i1,i2,i3,i4,i5,i6,i7,i8,i9,i10,i11,i12, nil];
            
            CCLabelTTF *shopName = [CCLabelTTF labelWithString:@"Hero's Crucible" dimensions: CGSizeMake(230, 40) alignment:UITextAlignmentCenter fontName:@"Optima-Bold" fontSize:24.0];
            shopName.position = ccp(winSize.width/2, winSize.height - 25);
            shopName.color = ccc3(0, 0, 0);
            [self addChild: shopName z:15];
        }
        else //
        {
            NSLog(@"\nError ItemShop Code\n");
            Item* i1 = [[Item alloc] initWithItemCode:1];
            Item* i2 = [[Item alloc] initWithItemCode:2];
            Item* i3 = [[Item alloc] initWithItemCode:50];
            Item* i4 = [[Item alloc] initWithItemCode:51];
            Item* i5 = [[Item alloc] initWithItemCode:14];
            Item* i6 = [[Item alloc] initWithItemCode:140];
            Item* i7 = [[Item alloc] initWithItemCode:31];
            Item* i8 = [[Item alloc] initWithItemCode:32];
            
            shopInventory = [[NSArray alloc] initWithObjects:i1,i2,i3,i4,i5,i6,i7,i8,nil];
            
            CCLabelTTF *shopName = [CCLabelTTF labelWithString:@"Rock's Blacksmith" dimensions: CGSizeMake(230, 40) alignment:UITextAlignmentCenter fontName:@"Optima-Bold" fontSize:24.0];
            shopName.position = ccp(winSize.width/2, winSize.height - 25);
            shopName.color = ccc3(0, 0, 0);
            [self addChild: shopName z:15];
        }
        
        
        
        NSArray *menuItems = [self labelsFromShopStock];
        
        CCMenuAdvanced *menu1 = [CCMenuAdvanced menuWithItems: nil];	
        for (CCMenuItem *item in menuItems)
            [menu1 addChild: item];	
        
        [menu1 alignItemsVerticallyWithPadding: 10 bottomToTop: NO]; //< also sets contentSize and keyBindings on Mac
        //menu.isRelativeAnchorPoint = YES;	
        menu1.position = ccp(20, 110);
        [self addChild:menu1 z:0 tag:101];
        
        //menu.scale = MIN ((winSize.width / 2.0f) / menu.contentSize.width, 0.75f );
        menu1.boundaryRect = CGRectMake(menu1.position.x, menu1.position.y, 280.0, 20.0);
        [menu1 fixPosition];
        
        
        
        
        
    }
    return self;
}

-(void)buy
{
    Item *temp = [[Item alloc] initWithItemCode:currentItemIndex];
    
    if (hero.gold < temp.goldValue)
    {
        [MusicHandler playButtonClick];
        return;
    }
    
    [MusicHandler playButtonClick];
    hero.gold -= temp.goldValue;
    
    NSMutableArray *array = [hero.heroInventory mutableCopy];
    
    BOOL shouldAddItem = YES;
    for (int i = 0; i < array.count; i++)
    {
        if (((Item*)[array objectAtIndex:i]).itemCode == temp.itemCode)
        {
            ((Item*)[array objectAtIndex:i]).itemCount++;
            shouldAddItem = NO;
            break;
        }
    }
    if (shouldAddItem)
    {
        [array addObject:(temp)];
    }
    
    [self touchedBack];
    hero.heroInventory = array;
    [GameSceneManager sharedGameSceneManager].hero = self.hero;
    [self updateTaggedStuff];
}

-(void)sell
{
    NSMutableArray *array = [hero.heroInventory mutableCopy];
    int tempIndex;
    BOOL shouldDeleteItem = NO;
    
    Item* temp1 = [[Item alloc] initWithItemCode:currentItemIndex];
    hero.gold += temp1.sellGoldValue;
    
    for (int i = 0; i < array.count; i++)
    {
        if (((Item*)[array objectAtIndex:i]).itemCode == currentItemIndex)
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
    
    [self updateTaggedStuff];
    [MusicHandler playButtonClick];
    [self touchedBack];
}




-(void) updateTaggedStuff
{
    [GameSceneManager sharedGameSceneManager].hero = hero;
    
    CGSize winSize = [[CCDirector sharedDirector] winSize];
    [self removeChildByTag:21 cleanup:YES];
    [self removeChildByTag:90 cleanup:YES];
    [self removeChildByTag:60 cleanup:YES];
    int b = 0;
    if (hero.gold > 5000)
    {
        b = 4;
    }
    
    CCSprite *goldback = [CCSprite spriteWithFile: @"goldback2.png"];
    goldback.position = ccp(50, winSize.height - 12);
    [self addChild:goldback z:10 tag:90];
    
    CCSprite *gold = [CCSprite spriteWithFile: @"igmenugold3.png"];
    gold.position = ccp(13, winSize.height - 15);
    [self addChild:gold z:15 tag:21];
    
    if (hero.gold < 20000)
    {
        CCLabelTTF *label02 = [CCLabelTTF labelWithString:[NSString stringWithFormat:@"%dG", hero.gold] dimensions: CGSizeMake(140, 30) alignment:UITextAlignmentLeft fontName:@"Optima-Bold" fontSize:18.0];
        label02.position = ccp(97 - b, winSize.height - 20);
        label02.color = ccc3(255, 255, 255);
        [self addChild: label02 z:15 tag:60];
    }
    else
    {
        CCLabelTTF *label02 = [CCLabelTTF labelWithString:[NSString stringWithFormat:@"%d", hero.gold] dimensions: CGSizeMake(140, 30) alignment:UITextAlignmentLeft fontName:@"Optima-Bold" fontSize:18.0];
        label02.position = ccp(97 - b, winSize.height - 20);
        label02.color = ccc3(255, 255, 255);
        [self addChild: label02 z:15 tag:60];
    }
    
    
    
    
    [self removeChildByTag:101 cleanup:YES];
    
    NSArray *menuItems;
    
    if (shopMode)
    {
        menuItems = [self labelsFromShopStock];
    }
    else
    {
        menuItems = [self labelsFromInventory];
    }
    
    CCMenuAdvanced *menu = [CCMenuAdvanced menuWithItems: nil];	
    for (CCMenuItem *item in menuItems)
        [menu addChild: item];	
    
    [menu alignItemsVerticallyWithPadding: 10 bottomToTop: NO]; //< also sets contentSize and keyBindings on Mac
    //menu.isRelativeAnchorPoint = YES;	
    menu.position = ccp(20, 110);
    [self addChild:menu z:0 tag:101];
    
    //menu.scale = MIN ((winSize.width / 2.0f) / menu.contentSize.width, 0.75f );
    menu.boundaryRect = CGRectMake(menu.position.x, menu.position.y, 280.0, 20.0);
    [menu fixPosition];
}




-(void)onShop
{
    [shopButton selected];
    [sellButton unselected];
    [self touchedBack];
    
    if (!shopMode)
    {
        [MusicHandler playButtonClick];
    }
    shopMode = YES;
    
    [self updateTaggedStuff];
}

-(void)onSell
{
    [shopButton unselected];
    [sellButton selected];
    [self touchedBack];
    
    if (shopMode)
    {
        [MusicHandler playButtonClick];
    }
    shopMode = NO;
    
    [self updateTaggedStuff];
}

-(void) goBackGame: (id)sender
{
    self.hero.mapInitMode = 7;
    [GameSceneManager sharedGameSceneManager].hero = self.hero;
    [MusicHandler playButtonClick];
    int temp = self.hero.currentMap;
    [SceneManager goPlay:temp];
}

-(void)touchedBack
{
    if (isShowingItemLayer)
    {
        [self removeChild:detailLayer cleanup:YES];
        isShowingItemLayer = NO;
    }
}








-(void)labelPressed:(id)sender
{
    int tempInt = ((CCMenuItemLabel*)sender).tag;
    
    Item *tempItem;
    
    if (shopMode)
    {
        tempItem = [shopInventory objectAtIndex:tempInt]; 
    }
    else
    {
        tempItem = [hero.heroInventory objectAtIndex:tempInt];
    }
    
    if (isShowingItemLayer)
    {
        [self removeChild:detailLayer cleanup:YES];
        isShowingItemLayer = NO;
    }
    else
    {
        detailLayer = [[DisplayEquipItemLayer alloc] init];
        detailLayer.tag = 9999;
    }
    
    int a;
    if (shopMode)
    {
        a = 4;
    }
    else
    {
        a = 5;
    }
    if (detailLayer.tag != tempInt)
    {
        detailLayer = [[DisplayEquipItemLayer alloc] initWithItem:tempItem source:a];
        currentItemIndex = tempItem.itemCode;
        [self addChild:detailLayer z:34000];
        isShowingItemLayer = YES;
        detailLayer.tag = tempInt;
    }
    
    
}



-(NSArray*)labelsFromInventory
{
    NSArray* array1 = hero.heroInventory;
    NSMutableArray* array2 = [NSMutableArray array];
    
    
    for(int i = 0; i< array1.count;i++)
    {
        CCMenuItemLabel *label = [CCMenuItemLabel itemWithLabel:[CCLabelTTF labelWithString:[NSString stringWithFormat:@"%@ - %d", ((Item*)[array1 objectAtIndex:i]).name, ((Item*)[array1 objectAtIndex:i]).itemCount] fontName:@"Optima-Bold" fontSize:18.0]
                                                         target: self 
                                                       selector: @selector(labelPressed:)];
        label.color = ccc3(0, 0, 0);
        label.tag = i;
        [array2 addObject:label];
    }
    return array2;
}


-(NSArray*)labelsFromShopStock
{
    NSArray* array1 = shopInventory;
    NSMutableArray* array2 = [NSMutableArray array];
    
    
    for(int i = 0; i< array1.count;i++)
    {
        CCMenuItemLabel *label = [CCMenuItemLabel itemWithLabel:[CCLabelTTF labelWithString:[NSString stringWithFormat:@"%@", ((Item*)[array1 objectAtIndex:i]).name] fontName:@"Optima-Bold" fontSize:18.0]
                                                         target: self 
                                                       selector: @selector(labelPressed:)];
        label.color = ccc3(0, 0, 0);
        label.tag = i;
        [array2 addObject:label];
    }
    return array2;
}









@end










