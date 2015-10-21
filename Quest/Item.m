//
//  Item.m
//  Quest
//
//  Created by Leo Linsky on 5/19/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "Item.h"

@implementation Item

@synthesize goldValue;
@synthesize sellGoldValue;
@synthesize image;
@synthesize bigImage;
@synthesize canThrowAway;
@synthesize canEquip;
@synthesize itemCount;
@synthesize itemTextColor;
@synthesize canUse,canUseInBattle;
@synthesize goldMult, expMult;
@synthesize moveSet;

@synthesize name,strBonus,aglBonus,defBonus,itemCode,equipCode,description,magDefBonus;
@synthesize strMult, defMult, magDefMult, aglMult;


-(id) initWithItemCode:(int)code
{
    
    if (self = [super init])
    {
        self.itemCode = code;
        
        
        if (itemCode == 1)
        {
            self.name = @"Herb";
            self.itemTextColor = 0;
            
            self.canEquip = NO;
            self.canThrowAway = YES;
            self.canUse = YES;
            self.canUseInBattle = YES;
            
            
            self.itemCount = 1;
            
            self.description = @"A common herb with healing properties. Heals 10 hit points.";
            self.goldValue = 1;
            self.sellGoldValue = 1;
            
            self.image = @"item001big.png";
            self.bigImage = self.image;
            
        }
        if (itemCode == 2)
        {
            self.name = @"Enchanted Herb";
            self.itemTextColor = 0;
            
            self.canEquip = NO;
            self.canThrowAway = YES;
            self.canUse = YES;
            self.canUseInBattle = YES;
            
            
            self.itemCount = 1;
            
            self.description = @"A healing herb made stronger by a magical enchantment. Heals 30 hit points.";
            self.goldValue = 4;
            self.sellGoldValue = 3;
            
            self.image = @"item002big.png";
            self.bigImage = self.image;
            
        }
        if (itemCode == 3)
        {
            self.name = @"Sisensis Roots";
            self.itemTextColor = 0;
            
            self.canEquip = NO;
            self.canThrowAway = YES;
            self.canUse = YES;
            self.canUseInBattle = YES;
            
            
            self.itemCount = 1;
            
            self.description = @"A root from the rare Sisensis tree. Heals 100 hit points.";
            self.goldValue = 18;
            self.sellGoldValue = 12;
            
            self.image = @"item003big.png";
            self.bigImage = self.image;
            
        }
        if (itemCode == 4)
        {
            self.name = @"Elixir";
            self.itemTextColor = 1;
            
            self.canEquip = NO;
            self.canThrowAway = YES;
            self.canUse = YES;
            self.canUseInBattle = YES;
            
            
            self.itemCount = 1;
            
            self.description = @"A powerful healing potion with unmatched restorative capabilities.";
            self.goldValue = 60;
            self.sellGoldValue = 40;
            
            self.image = @"item004big.png";
            self.bigImage = self.image;
            
        }
        
        if (itemCode == 5)
        {
            self.name = @"Strength Potion";
            self.itemTextColor = 0;
            
            self.canEquip = NO;
            self.canThrowAway = YES;
            self.canUse = NO;
            self.canUseInBattle = YES;
            
            
            self.itemCount = 1;
            
            self.description = @"A potion that can be used in battle to temporarily increase your strength.";
            self.goldValue = 20;
            self.sellGoldValue = 14;
            
            self.image = @"item005big.png";
            self.bigImage = self.image;
            
        }
        if (itemCode == 6)
        {
            self.name = @"Defense Potion";
            self.itemTextColor = 0;
            
            self.canEquip = NO;
            self.canThrowAway = YES;
            self.canUse = NO;
            self.canUseInBattle = YES;
            
            
            self.itemCount = 1;
            
            self.description = @"A potion that can be used in battle to temporarily increase your defense.";
            self.goldValue = 19;
            self.sellGoldValue = 13;
            
            self.image = @"item006big.png";
            self.bigImage = self.image;
            
        }
        if (itemCode == 7)
        {
            self.name = @"Speed Potion";
            self.itemTextColor = 0;
            
            self.canEquip = NO;
            self.canThrowAway = YES;
            self.canUse = NO;
            self.canUseInBattle = YES;
            
            
            self.itemCount = 1;
            
            self.description = @"A potion that can be used in battle to temporarily increase your agility.";
            self.goldValue = 19;
            self.sellGoldValue = 13;
            
            self.image = @"item007big.png";
            self.bigImage = self.image;
            
        }
        if (itemCode == 8)
        {
            self.name = @"Super Strength Potion";
            self.itemTextColor = 1;
            
            self.canEquip = NO;
            self.canThrowAway = YES;
            self.canUse = NO;
            self.canUseInBattle = YES;
            
            
            self.itemCount = 1;
            
            self.description = @"A powerful concoction that temporarily grants you incredible strength in battle.";
            self.goldValue = 63;
            self.sellGoldValue = 42;
            
            self.image = @"item008big.png";
            self.bigImage = self.image;
            
        }
        if (itemCode == 9)
        {
            self.name = @"Super Defense Potion";
            self.itemTextColor = 1;
            
            self.canEquip = NO;
            self.canThrowAway = YES;
            self.canUse = NO;
            self.canUseInBattle = YES;
            
            
            self.itemCount = 1;
            
            self.description = @"A powerful concoction that temporarily grants you incredible defense in battle.";
            self.goldValue = 65;
            self.sellGoldValue = 43;
            
            self.image = @"item009big.png";
            self.bigImage = self.image;
            
        }
        if (itemCode == 10)
        {
            self.name = @"Super Speed Potion";
            self.itemTextColor = 1;
            
            self.canEquip = NO;
            self.canThrowAway = YES;
            self.canUse = NO;
            self.canUseInBattle = YES;
            
            
            self.itemCount = 1;
            
            self.description = @"A powerful concoction that temporarily grants you unmatched agility in battle.";
            self.goldValue = 64;
            self.sellGoldValue = 43;
            
            self.image = @"item010big.png";
            self.bigImage = self.image;
            
        }
        if (itemCode == 11)
        {
            self.name = @"Wind Staff";
            self.itemTextColor = 0;
            
            self.canEquip = NO;
            self.canThrowAway = YES;
            self.canUse = NO;
            self.canUseInBattle = YES;
            
            
            self.itemCount = 1;
            
            self.description = @"A common staff that conjures a gust of wind in battle.";
            self.goldValue = 6;
            self.sellGoldValue = 4;
            
            self.image = @"item011big.png";
            self.bigImage = self.image;
            
        }
        if (itemCode == 12)
        {
            self.name = @"Earth Staff";
            self.itemTextColor = 0;
            
            self.canEquip = NO;
            self.canThrowAway = YES;
            self.canUse = NO;
            self.canUseInBattle = YES;
            
            
            self.itemCount = 1;
            
            self.description = @"An enchanted staff that simultaneously damages an enemy and heals you in battle.";
            self.goldValue = 14;
            self.sellGoldValue = 9;
            
            self.image = @"item012big.png";
            self.bigImage = self.image;
            
        }
        if (itemCode == 13)
        {
            self.name = @"Frost Staff";
            self.itemTextColor = 0;
            
            self.canEquip = NO;
            self.canThrowAway = YES;
            self.canUse = NO;
            self.canUseInBattle = YES;
            
            
            self.itemCount = 1;
            
            self.description = @"An enchanted staff that freezes an enemy in battle.";
            self.goldValue = 18;
            self.sellGoldValue = 13;
            
            self.image = @"item013big.png";
            self.bigImage = self.image;
            
        }
        if (itemCode == 14)
        {
            self.name = @"Fire Staff";
            self.itemTextColor = 0;
            
            self.canEquip = NO;
            self.canThrowAway = YES;
            self.canUse = NO;
            self.canUseInBattle = YES;
            
            
            self.itemCount = 1;
            
            self.description = @"An enchanted staff that hits enemies with a fireball in battle.";
            self.goldValue = 26;
            self.sellGoldValue = 16;
            
            self.image = @"item014big.png";
            self.bigImage = self.image;
            
        }
        if (itemCode == 15)
        {
            self.name = @"Hurricane Staff";
            self.itemTextColor = 1;
            
            self.canEquip = NO;
            self.canThrowAway = YES;
            self.canUse = NO;
            self.canUseInBattle = YES;
            
            
            self.itemCount = 1;
            
            self.description = @"A powerful staff that summons hurricane force winds in battle.";
            self.goldValue = 45;
            self.sellGoldValue = 30;
            
            self.image = @"item015big.png";
            self.bigImage = self.image;
            
        }
        if (itemCode == 16)
        {
            self.name = @"Blizzard Staff";
            self.itemTextColor = 1;
            
            self.canEquip = NO;
            self.canThrowAway = YES;
            self.canUse = NO;
            self.canUseInBattle = YES;
            
            
            self.itemCount = 1;
            
            self.description = @"A powerful staff that conjures a powerful blizzard against an enemy.";
            self.goldValue = 75;
            self.sellGoldValue = 50;
            
            self.image = @"item016big.png";
            self.bigImage = self.image;
            
        }
        if (itemCode == 17)
        {
            self.name = @"Gaia Staff";
            self.itemTextColor = 1;
            
            self.canEquip = NO;
            self.canThrowAway = YES;
            self.canUse = NO;
            self.canUseInBattle = YES;
            
            
            self.itemCount = 1;
            
            self.description = @"A powerful staff that absorbs an enemy's health to restore yours in battle.";
            self.goldValue = 125;
            self.sellGoldValue = 83;
            
            self.image = @"item017big.png";
            self.bigImage = self.image;
            
        }
        if (itemCode == 18)
        {
            self.name = @"Phoenix Staff";
            self.itemTextColor = 2;
            
            self.canEquip = NO;
            self.canThrowAway = YES;
            self.canUse = NO;
            self.canUseInBattle = YES;
            
            
            self.itemCount = 1;
            
            self.description = @"A rare and powerfull staff that summons a Phoenix to attack an enemy.";
            self.goldValue = 190;
            self.sellGoldValue = 130;
            
            self.image = @"item018big.png";
            self.bigImage = self.image;
            
        }
        if (itemCode == 19)
        {
            self.name = @"Repellent";
            self.itemTextColor = 1;
            
            self.canEquip = NO;
            self.canThrowAway = YES;
            self.canUse = YES;
            self.canUseInBattle = NO;
            
            
            self.itemCount = 1;
            
            self.description = @"Repels enemy monsters for a short time.";
            self.goldValue = 10;
            self.sellGoldValue = 7;
            
            self.image = @"item019big.png";
            self.bigImage = self.image;
            
        }
        if (itemCode == 20)
        {
            self.name = @"Dragon Dust";
            self.itemTextColor = 1;
            
            self.canEquip = NO;
            self.canThrowAway = YES;
            self.canUse = YES;
            self.canUseInBattle = NO;
            
            
            self.itemCount = 1;
            
            self.description = @"Dragon dust repels enemies for a long period of time.";
            self.goldValue = 90;
            self.sellGoldValue = 60;
            
            self.image = @"item020big.png";
            self.bigImage = self.image;
            
        }
        
        if (itemCode == 24)
        {
            self.name = @"Liquid Courage";
            self.itemTextColor = 2;
            
            self.canEquip = NO;
            self.canThrowAway = YES;
            self.canUse = NO;
            self.canUseInBattle = YES;
            
            
            self.itemCount = 1;
            
            self.description = @"This valuable tonic gives you an explosive energy boost in battle.";
            self.goldValue = 140;
            self.sellGoldValue = 100;
            
            self.image = @"item024big.png";
            self.bigImage = self.image;
            
        }
        
        
        if (itemCode == 25)
        {
            self.name = @"Light Beacon";
            self.itemTextColor = 0;
            
            self.canEquip = NO;
            self.canThrowAway = NO;
            self.canUse = NO;
            self.canUseInBattle = NO;
            
            
            self.itemCount = 1;
            
            self.description = @"Bring this beacon to the light tower to create a shining emergency signal.";
            self.goldValue = 0;
            self.sellGoldValue = 0;
            
            self.image = @"item025big.png";
            self.bigImage = self.image;
            
        }
        if (itemCode == 26)
        {
            self.name = @"Bug Repellent";
            self.itemTextColor = 0;
            
            self.canEquip = NO;
            self.canThrowAway = NO;
            self.canUse = NO;
            self.canUseInBattle = NO;
            
            
            self.itemCount = 1;
            
            self.description = @"Gets rid of insects.";
            self.goldValue = 0;
            self.sellGoldValue = 0;
            
            self.image = @"item026big.png";
            self.bigImage = self.image;
            
        }
        if (itemCode == 27)
        {
            self.name = @"Pirate Compass";
            self.itemTextColor = 0;
            
            self.canEquip = NO;
            self.canThrowAway = NO;
            self.canUse = NO;
            self.canUseInBattle = NO;
            
            
            self.itemCount = 1;
            
            self.description = @"A strange compass that might be of use to pirates.";
            self.goldValue = 0;
            self.sellGoldValue = 0;
            
            self.image = @"item027big.png";
            self.bigImage = self.image;
            
        }
        if (itemCode == 28)
        {
            self.name = @"Art of War (Book)";
            self.itemTextColor = 0;
            
            self.canEquip = NO;
            self.canThrowAway = YES;
            self.canUse = YES;
            self.canUseInBattle = NO;
            
            //Attribute Points + 3
            self.itemCount = 1;
            
            self.description = @"Read this book to increase your knowledge of battle and gain valuable skills.";
            self.goldValue = 60;
            self.sellGoldValue = 50;
            
            self.image = @"item028big.png";
            self.bigImage = self.image;
            
        }
        if (itemCode == 29)
        {
            self.name = @"Sunscale Helm";
            self.itemTextColor = 3;
            
            self.canEquip = YES;
            self.canThrowAway = YES;
            self.canUse = NO;
            self.canUseInBattle = NO;
            
            self.strBonus = 45;
            self.strMult = 3.1;
            self.aglBonus = 80;
            self.aglMult = 3.5;
            self.defBonus = 160;
            self.defMult = 4.2;
            self.magDefBonus = 0;
            self.magDefMult = 1.0;
            
            self.itemCount = 1;
            self.equipCode = 3;
            
            self.goldMult = 1.0;
            self.expMult = 1.0;
            
            self.description = @"A helmet forged from the scales of the legendary Sun Dragon.";
            self.goldValue = 12000;
            self.sellGoldValue = 9420;
            
            self.image = @"item029big.png";
            self.bigImage = self.image;
            
        }
        if (itemCode == 30)
        {
            self.name = @"Ice Guardian";
            self.itemTextColor = 3;
            
            self.canEquip = YES;
            self.canThrowAway = YES;
            self.canUse = NO;
            self.canUseInBattle = NO;
            
            self.strBonus = 110;
            self.strMult = 4.0;
            self.aglBonus = 30;
            self.aglMult = 1.9;
            self.defBonus = 480;
            self.defMult = 6.5;
            self.magDefBonus = 0;
            self.magDefMult = 1.0;
            
            self.itemCount = 1;
            self.equipCode = 2;
            
            self.goldMult = 1.0;
            self.expMult = 1.0;
            
            self.description = @"An enchanted shield of ice. The Ice Guardian is as formidable a weapon as any sword, and an unbreakable barrier. ";
            self.goldValue = 28000;
            self.sellGoldValue = 20420;
            
            self.image = @"item030big2.png";
            self.bigImage = self.image;
            
        }
        if (itemCode == 31)
        {
            self.name = @"Volland Teleport";
            self.itemTextColor = 0;
            
            self.canEquip = NO;
            self.canThrowAway = YES;
            self.canUse = YES;
            self.canUseInBattle = NO;
            
            
            self.itemCount = 1;
            
            self.description = @"A one-time teleport to the city of Volland.";
            self.goldValue = 5;
            self.sellGoldValue = 3;
            
            self.image = @"item031big.png";
            self.bigImage = self.image;
            
        }
        if (itemCode == 32)
        {
            self.name = @"Karamut Teleport";
            self.itemTextColor = 0;
            
            self.canEquip = NO;
            self.canThrowAway = YES;
            self.canUse = YES;
            self.canUseInBattle = NO;
            
            
            self.itemCount = 1;
            
            self.description = @"A one-time teleport to the port city of Karamut.";
            self.goldValue = 8;
            self.sellGoldValue = 5;
            
            self.image = @"item032big.png";
            self.bigImage = self.image;
            
        }
        if (itemCode == 33)
        {
            self.name = @"Agaro Teleport";
            self.itemTextColor = 0;
            
            self.canEquip = NO;
            self.canThrowAway = YES;
            self.canUse = YES;
            self.canUseInBattle = NO;
            
            
            self.itemCount = 1;
            
            self.description = @"A one-time teleport to the mountain town Agaro.";
            self.goldValue = 9;
            self.sellGoldValue = 6;
            
            self.image = @"item033big.png";
            self.bigImage = self.image;
            
        }
        if (itemCode == 34)
        {
            self.name = @"Ellemak Teleport";
            self.itemTextColor = 0;
            
            self.canEquip = NO;
            self.canThrowAway = YES;
            self.canUse = YES;
            self.canUseInBattle = NO;
            
            
            self.itemCount = 1;
            
            self.description = @"A one-time teleport to the Kingdom Ellemak.";
            self.goldValue = 14;
            self.sellGoldValue = 9;
            
            self.image = @"item034big.png";
            self.bigImage = self.image;
            
        }
        if (itemCode == 39)
        {
            self.name = @"Halden Teleport";
            self.itemTextColor = 0;
            
            self.canEquip = NO;
            self.canThrowAway = YES;
            self.canUse = YES;
            self.canUseInBattle = NO;
            
            
            self.itemCount = 1;
            
            self.description = @"A one-time teleport to the northern province Halden.";
            self.goldValue = 21;
            self.sellGoldValue = 14;
            
            self.image = @"item032big.png";
            self.bigImage = self.image;
            
        }
        if (itemCode == 40)
        {
            self.name = @"Gaul Teleport";
            self.itemTextColor = 0;
            
            self.canEquip = NO;
            self.canThrowAway = YES;
            self.canUse = YES;
            self.canUseInBattle = NO;
            
            
            self.itemCount = 1;
            
            self.description = @"A one-time teleport to the Hero's Country.";
            self.goldValue = 25;
            self.sellGoldValue = 17;
            
            self.image = @"item032big.png";
            self.bigImage = self.image;
            
        }
        if (itemCode == 35)
        {
            self.name = @"Fireflower Root";
            self.itemTextColor = 2;
            
            self.canEquip = NO;
            self.canThrowAway = YES;
            self.canUse = YES;
            self.canUseInBattle = NO;
            
            
            self.itemCount = 1;
            
            self.description = @"A rare root that permanently increases your strength.";
            self.goldValue = 360;
            self.sellGoldValue = 240;
            
            self.image = @"item035big.png";
            self.bigImage = self.image;
            
        }
        if (itemCode == 36)
        {
            self.name = @"Ent Bark";
            self.itemTextColor = 2;
            
            self.canEquip = NO;
            self.canThrowAway = YES;
            self.canUse = YES;
            self.canUseInBattle = NO;
            
            
            self.itemCount = 1;
            
            self.description = @"The bark of an Ent permanently improves your defense.";
            self.goldValue = 360;
            self.sellGoldValue = 240;
            
            self.image = @"item036big.png";
            self.bigImage = self.image;
            
        }
        if (itemCode == 37)
        {
            self.name = @"Kayu-Skin Soup";
            self.itemTextColor = 2;
            
            self.canEquip = NO;
            self.canThrowAway = YES;
            self.canUse = YES;
            self.canUseInBattle = NO;
            
            
            self.itemCount = 1;
            
            self.description = @"A magical elixir that permanently enhances your agility.";
            self.goldValue = 360;
            self.sellGoldValue = 240;
            
            self.image = @"item037big.png";
            self.bigImage = self.image;
            
        }
        if (itemCode == 38)
        {
            self.name = @"Jade Elixir";
            self.itemTextColor = 2;
            
            self.canEquip = NO;
            self.canThrowAway = YES;
            self.canUse = YES;
            self.canUseInBattle = NO;
            
            
            self.itemCount = 1;
            
            self.description = @"An enchanted elixir that permanently increases your maximum health level.";
            self.goldValue = 360;
            self.sellGoldValue = 240;
            
            self.image = @"item038big.png";
            self.bigImage = self.image;
            
        }
        
        if (itemCode == 50)
        {
            self.name = @"Copper Sword";
            self.itemTextColor = 0;
            
            self.canEquip = YES;
            self.canThrowAway = YES;
            self.canUse = NO;
            self.canUseInBattle = NO;
            
            self.strBonus = 3;
            self.strMult = 1.1;
            self.aglBonus = 0;
            self.aglMult = 1.0;
            self.defBonus = 0;
            self.defMult = 1.0;
            self.magDefBonus = 0;
            self.magDefMult = 1.0;
            
            self.itemCount = 1;
            self.equipCode = 1;
            
            self.goldMult = 1.0;
            self.expMult = 1.0;
            
            self.description = @"A modest sword made of copper.";
            self.goldValue = 2;
            self.sellGoldValue = 1;
            
            self.image = @"item050big.png";
            self.bigImage = self.image;
            
            NSNumber *move1 = [NSNumber numberWithInt:4];
            NSNumber *move2 = [NSNumber numberWithInt:5];
            NSNumber *move3 = [NSNumber numberWithInt:6];
            self.moveSet = [NSArray arrayWithObjects:move1,move2,move3, nil];
            
        }
        if (itemCode == 51)
        {
            self.name = @"Copper Dagger";
            self.itemTextColor = 0;
            
            self.canEquip = YES;
            self.canThrowAway = YES;
            self.canUse = NO;
            self.canUseInBattle = NO;
            
            self.strBonus = 2;
            self.strMult = 1.1;
            self.aglBonus = 2;
            self.aglMult = 1.1;
            self.defBonus = 0;
            self.defMult = 1.0;
            self.magDefBonus = 0;
            self.magDefMult = 1.0;
            
            self.itemCount = 1;
            self.equipCode = 1;
            
            self.goldMult = 1.0;
            self.expMult = 1.0;
            
            self.description = @"A sturdy dagger made of copper.";
            self.goldValue = 2;
            self.sellGoldValue = 1;
            
            self.image = @"item051big.png";
            self.bigImage = self.image;
            
            NSNumber *move1 = [NSNumber numberWithInt:5];
            NSNumber *move2 = [NSNumber numberWithInt:2];
            NSNumber *move3 = [NSNumber numberWithInt:6];
            self.moveSet = [NSArray arrayWithObjects:move1,move2,move3, nil];
        }
        if (itemCode == 52)
        {
            self.name = @"Iron Dagger";
            self.itemTextColor = 0;
            
            self.canEquip = YES;
            self.canThrowAway = YES;
            self.canUse = NO;
            self.canUseInBattle = NO;
            
            self.strBonus = 4;
            self.strMult = 1.1;
            self.aglBonus = 2;
            self.aglMult = 1.1;
            self.defBonus = 0;
            self.defMult = 1.0;
            self.magDefBonus = 0;
            self.magDefMult = 1.0;
            
            self.itemCount = 1;
            self.equipCode = 1;
            
            self.goldMult = 1.0;
            self.expMult = 1.0;
            
            self.description = @"A sturdy dagger made of iron.";
            self.goldValue = 4;
            self.sellGoldValue = 3;
            
            self.image = @"item052big.png";
            self.bigImage = self.image;
            
            NSNumber *move1 = [NSNumber numberWithInt:5];
            NSNumber *move2 = [NSNumber numberWithInt:2];
            NSNumber *move3 = [NSNumber numberWithInt:6];
            self.moveSet = [NSArray arrayWithObjects:move1,move2,move3, nil];
        }
        if (itemCode == 53)
        {
            self.name = @"Iron Sword";
            self.itemTextColor = 0;
            
            self.canEquip = YES;
            self.canThrowAway = YES;
            self.canUse = NO;
            self.canUseInBattle = NO;
            
            self.strBonus = 6;
            self.strMult = 1.1;
            self.aglBonus = 0;
            self.aglMult = 1.0;
            self.defBonus = 0;
            self.defMult = 1.0;
            self.magDefBonus = 0;
            self.magDefMult = 1.0;
            
            self.itemCount = 1;
            self.equipCode = 1;
            
            self.goldMult = 1.0;
            self.expMult = 1.0;
            
            self.description = @"A modest sword made of iron.";
            self.goldValue = 5;
            self.sellGoldValue = 3;
            
            self.image = @"item053big.png";
            self.bigImage = self.image;
            
            NSNumber *move1 = [NSNumber numberWithInt:4];
            NSNumber *move2 = [NSNumber numberWithInt:5];
            NSNumber *move3 = [NSNumber numberWithInt:6];
            self.moveSet = [NSArray arrayWithObjects:move1,move2,move3, nil];
        }
        if (itemCode == 54)
        {
            self.name = @"Iron Longsword";
            self.itemTextColor = 0;
            
            self.canEquip = YES;
            self.canThrowAway = YES;
            self.canUse = NO;
            self.canUseInBattle = NO;
            
            self.strBonus = 7;
            self.strMult = 1.2;
            self.aglBonus = 0;
            self.aglMult = 1.0;
            self.defBonus = 0;
            self.defMult = 1.0;
            self.magDefBonus = 0;
            self.magDefMult = 1.0;
            
            self.itemCount = 1;
            self.equipCode = 1;
            
            self.goldMult = 1.0;
            self.expMult = 1.0;
            
            self.description = @"A large sword made of iron.";
            self.goldValue = 7;
            self.sellGoldValue = 4;
            
            self.image = @"item054big.png";
            self.bigImage = self.image;
            
            NSNumber *move1 = [NSNumber numberWithInt:7];
            NSNumber *move2 = [NSNumber numberWithInt:5];
            NSNumber *move3 = [NSNumber numberWithInt:6];
            self.moveSet = [NSArray arrayWithObjects:move1,move2,move3, nil];
        }
        if (itemCode == 55)
        {
            self.name = @"Steel Dirk";
            self.itemTextColor = 0;
            
            self.canEquip = YES;
            self.canThrowAway = YES;
            self.canUse = NO;
            self.canUseInBattle = NO;
            
            self.strBonus = 6;
            self.strMult = 1.2;
            self.aglBonus = 2;
            self.aglMult = 1.1;
            self.defBonus = 0;
            self.defMult = 1.0;
            self.magDefBonus = 0;
            self.magDefMult = 1.0;
            
            self.itemCount = 1;
            self.equipCode = 1;
            
            self.goldMult = 1.0;
            self.expMult = 1.0;
            
            self.description = @"A long knife made of steel.";
            self.goldValue = 8;
            self.sellGoldValue = 5;
            
            self.image = @"item055big.png";
            self.bigImage = self.image;
            
            NSNumber *move1 = [NSNumber numberWithInt:4];
            NSNumber *move2 = [NSNumber numberWithInt:5];
            NSNumber *move3 = [NSNumber numberWithInt:6];
            self.moveSet = [NSArray arrayWithObjects:move1,move2,move3, nil];
        }
        if (itemCode == 56)
        {
            self.name = @"Steel Sword";
            self.itemTextColor = 0;
            
            self.canEquip = YES;
            self.canThrowAway = YES;
            self.canUse = NO;
            self.canUseInBattle = NO;
            
            self.strBonus = 8;
            self.strMult = 1.2;
            self.aglBonus = 0;
            self.aglMult = 1.0;
            self.defBonus = 0;
            self.defMult = 1.0;
            self.magDefBonus = 0;
            self.magDefMult = 1.0;
            
            self.itemCount = 1;
            self.equipCode = 1;
            
            self.goldMult = 1.0;
            self.expMult = 1.0;
            
            self.description = @"A simple sword made of steel.";
            self.goldValue = 10;
            self.sellGoldValue = 7;
            
            self.image = @"item056big.png";
            self.bigImage = self.image;
            
            NSNumber *move1 = [NSNumber numberWithInt:4];
            NSNumber *move2 = [NSNumber numberWithInt:5];
            NSNumber *move3 = [NSNumber numberWithInt:6];
            self.moveSet = [NSArray arrayWithObjects:move1,move2,move3, nil];
        }
        if (itemCode == 57)
        {
            self.name = @"Steel Longsword";
            self.itemTextColor = 0;
            
            self.canEquip = YES;
            self.canThrowAway = YES;
            self.canUse = NO;
            self.canUseInBattle = NO;
            
            self.strBonus = 10;
            self.strMult = 1.2;
            self.aglBonus = 0;
            self.aglMult = 1.0;
            self.defBonus = 0;
            self.defMult = 1.0;
            self.magDefBonus = 0;
            self.magDefMult = 1.0;
            
            self.itemCount = 1;
            self.equipCode = 1;
            
            self.goldMult = 1.0;
            self.expMult = 1.0;
            
            self.description = @"A large sword made of steel.";
            self.goldValue = 14;
            self.sellGoldValue = 9;
            
            self.image = @"item057big.png";
            self.bigImage = self.image;
            
            NSNumber *move1 = [NSNumber numberWithInt:7];
            NSNumber *move2 = [NSNumber numberWithInt:5];
            NSNumber *move3 = [NSNumber numberWithInt:6];
            self.moveSet = [NSArray arrayWithObjects:move1,move2,move3, nil];
        }
        if (itemCode == 58)
        {
            self.name = @"Pearl Dagger";
            self.itemTextColor = 1;
            
            self.canEquip = YES;
            self.canThrowAway = YES;
            self.canUse = NO;
            self.canUseInBattle = NO;
            
            self.strBonus = 14;
            self.strMult = 1.4;
            self.aglBonus = 6;
            self.aglMult = 1.2;
            self.defBonus = 0;
            self.defMult = 1.0;
            self.magDefBonus = 0;
            self.magDefMult = 1.0;
            
            self.itemCount = 1;
            self.equipCode = 1;
            
            self.goldMult = 1.0;
            self.expMult = 1.0;
            
            self.description = @"A sharp dagger with a Pearl blade.";
            self.goldValue = 26;
            self.sellGoldValue = 16;
            
            self.image = @"item058big.png";
            self.bigImage = self.image;
            
            NSNumber *move1 = [NSNumber numberWithInt:4];
            NSNumber *move2 = [NSNumber numberWithInt:5];
            NSNumber *move3 = [NSNumber numberWithInt:6];
            self.moveSet = [NSArray arrayWithObjects:move1,move2,move3, nil];
        }
        if (itemCode == 59)
        {
            self.name = @"Pearl Scimitar";
            self.itemTextColor = 1;
            
            self.canEquip = YES;
            self.canThrowAway = YES;
            self.canUse = NO;
            self.canUseInBattle = NO;
            
            self.strBonus = 18;
            self.strMult = 1.5;
            self.aglBonus = 5;
            self.aglMult = 1.2;
            self.defBonus = 0;
            self.defMult = 1.0;
            self.magDefBonus = 0;
            self.magDefMult = 1.0;
            
            self.itemCount = 1;
            self.equipCode = 1;
            
            self.goldMult = 1.0;
            self.expMult = 1.0;
            
            self.description = @"A curved sword with a Pearl blade.";
            self.goldValue = 34;
            self.sellGoldValue = 23;
            
            self.image = @"item059big.png";
            self.bigImage = self.image;
            
            NSNumber *move1 = [NSNumber numberWithInt:4];
            NSNumber *move2 = [NSNumber numberWithInt:9];
            NSNumber *move3 = [NSNumber numberWithInt:6];
            self.moveSet = [NSArray arrayWithObjects:move1,move2,move3, nil];
        }
        if (itemCode == 60)
        {
            self.name = @"Mithril Dagger";
            self.itemTextColor = 1;
            
            self.canEquip = YES;
            self.canThrowAway = YES;
            self.canUse = NO;
            self.canUseInBattle = NO;
            
            self.strBonus = 17;
            self.strMult = 1.5;
            self.aglBonus = 4;
            self.aglMult = 1.2;
            self.defBonus = 0;
            self.defMult = 1.0;
            self.magDefBonus = 0;
            self.magDefMult = 1.0;
            
            self.itemCount = 1;
            self.equipCode = 1;
            
            self.goldMult = 1.0;
            self.expMult = 1.0;
            
            self.description = @"A sharp dagger made of Mithril.";
            self.goldValue = 28;
            self.sellGoldValue = 19;
            
            self.image = @"item060big.png";
            self.bigImage = self.image;
            
            NSNumber *move1 = [NSNumber numberWithInt:4];
            NSNumber *move2 = [NSNumber numberWithInt:5];
            NSNumber *move3 = [NSNumber numberWithInt:6];
            self.moveSet = [NSArray arrayWithObjects:move1,move2,move3, nil];
        }
        if (itemCode == 61)
        {
            self.name = @"Mithril Sword";
            self.itemTextColor = 1;
            
            self.canEquip = YES;
            self.canThrowAway = YES;
            self.canUse = NO;
            self.canUseInBattle = NO;
            
            self.strBonus = 21;
            self.strMult = 1.6;
            self.aglBonus = 3;
            self.aglMult = 1.1;
            self.defBonus = 0;
            self.defMult = 1.0;
            self.magDefBonus = 0;
            self.magDefMult = 1.0;
            
            self.itemCount = 1;
            self.equipCode = 1;
            
            self.goldMult = 1.0;
            self.expMult = 1.0;
            
            self.description = @"A simple sword made of Mithril.";
            self.goldValue = 35;
            self.sellGoldValue = 23;
            
            self.image = @"item061big.png";
            self.bigImage = self.image;
            
            NSNumber *move1 = [NSNumber numberWithInt:4];
            NSNumber *move2 = [NSNumber numberWithInt:5];
            NSNumber *move3 = [NSNumber numberWithInt:6];
            self.moveSet = [NSArray arrayWithObjects:move1,move2,move3, nil];
        }
        if (itemCode == 62)
        {
            self.name = @"Mithril Longsword";
            self.itemTextColor = 1;
            
            self.canEquip = YES;
            self.canThrowAway = YES;
            self.canUse = NO;
            self.canUseInBattle = NO;
            
            self.strBonus = 25;
            self.strMult = 1.7;
            self.aglBonus = 2;
            self.aglMult = 1.1;
            self.defBonus = 0;
            self.defMult = 1.0;
            self.magDefBonus = 0;
            self.magDefMult = 1.0;
            
            self.itemCount = 1;
            self.equipCode = 1;
            
            self.goldMult = 1.0;
            self.expMult = 1.0;
            
            self.description = @"A large sword made of Mithril.";
            self.goldValue = 42;
            self.sellGoldValue = 28;
            
            self.image = @"item062big.png";
            self.bigImage = self.image;
            
            NSNumber *move1 = [NSNumber numberWithInt:7];
            NSNumber *move2 = [NSNumber numberWithInt:5];
            NSNumber *move3 = [NSNumber numberWithInt:6];
            self.moveSet = [NSArray arrayWithObjects:move1,move2,move3, nil];
        }
        if (itemCode == 63)
        {
            self.name = @"Adamantine Dagger";
            self.itemTextColor = 1;
            
            self.canEquip = YES;
            self.canThrowAway = YES;
            self.canUse = NO;
            self.canUseInBattle = NO;
            
            self.strBonus = 34;
            self.strMult = 2.1;
            self.aglBonus = 9;
            self.aglMult = 1.3;
            self.defBonus = 0;
            self.defMult = 1.0;
            self.magDefBonus = 0;
            self.magDefMult = 1.0;
            
            self.itemCount = 1;
            self.equipCode = 1;
            
            self.goldMult = 1.0;
            self.expMult = 1.0;
            
            self.description = @"A sharp dagger made of Adamantine.";
            self.goldValue = 78;
            self.sellGoldValue = 52;
            
            self.image = @"item063big.png";
            self.bigImage = self.image;
            
            NSNumber *move1 = [NSNumber numberWithInt:4];
            NSNumber *move2 = [NSNumber numberWithInt:5];
            NSNumber *move3 = [NSNumber numberWithInt:6];
            self.moveSet = [NSArray arrayWithObjects:move1,move2,move3, nil];
        }
        if (itemCode == 64)
        {
            self.name = @"Adamantine Cutlass";
            self.itemTextColor = 1;
            
            self.canEquip = YES;
            self.canThrowAway = YES;
            self.canUse = NO;
            self.canUseInBattle = NO;
            
            self.strBonus = 40;
            self.strMult = 2.2;
            self.aglBonus = 7;
            self.aglMult = 1.3;
            self.defBonus = 0;
            self.defMult = 1.0;
            self.magDefBonus = 0;
            self.magDefMult = 1.0;
            
            self.itemCount = 1;
            self.equipCode = 1;
            
            self.goldMult = 1.0;
            self.expMult = 1.0;
            
            self.description = @"A fine sword made of Adamantine.";
            self.goldValue = 90;
            self.sellGoldValue = 60;
            
            self.image = @"item064big.png";
            self.bigImage = self.image;
            
            NSNumber *move1 = [NSNumber numberWithInt:9];
            NSNumber *move2 = [NSNumber numberWithInt:7];
            NSNumber *move3 = [NSNumber numberWithInt:6];
            self.moveSet = [NSArray arrayWithObjects:move1,move2,move3, nil];
        }
        if (itemCode == 65)
        {
            self.name = @"Adamantine Longsword";
            self.itemTextColor = 1;
            
            self.canEquip = YES;
            self.canThrowAway = YES;
            self.canUse = NO;
            self.canUseInBattle = NO;
            
            self.strBonus = 45;
            self.strMult = 2.2;
            self.aglBonus = 3;
            self.aglMult = 1.2;
            self.defBonus = 0;
            self.defMult = 1.0;
            self.magDefBonus = 0;
            self.magDefMult = 1.0;
            
            self.itemCount = 1;
            self.equipCode = 1;
            
            self.goldMult = 1.0;
            self.expMult = 1.0;
            
            self.description = @"A large sword made of Adamantine.";
            self.goldValue = 92;
            self.sellGoldValue = 61;
            
            self.image = @"item065big.png";
            self.bigImage = self.image;
            
            NSNumber *move1 = [NSNumber numberWithInt:7];
            NSNumber *move2 = [NSNumber numberWithInt:5];
            NSNumber *move3 = [NSNumber numberWithInt:6];
            self.moveSet = [NSArray arrayWithObjects:move1,move2,move3, nil];
        }
        if (itemCode == 66)
        {
            self.name = @"Ichorean Battle Knife";
            self.itemTextColor = 2;
            
            self.canEquip = YES;
            self.canThrowAway = YES;
            self.canUse = NO;
            self.canUseInBattle = NO;
            
            self.strBonus = 60;
            self.strMult = 2.4;
            self.aglBonus = 12;
            self.aglMult = 1.5;
            self.defBonus = 0;
            self.defMult = 1.0;
            self.magDefBonus = 0;
            self.magDefMult = 1.0;
            
            self.itemCount = 1;
            self.equipCode = 1;
            
            self.goldMult = 1.0;
            self.expMult = 1.0;
            
            self.description = @"A versatile dagger made with an Ichorean blade.";
            self.goldValue = 130;
            self.sellGoldValue = 83;
            
            self.image = @"item066big.png";
            self.bigImage = self.image;
            
            NSNumber *move1 = [NSNumber numberWithInt:10];
            NSNumber *move2 = [NSNumber numberWithInt:5];
            NSNumber *move3 = [NSNumber numberWithInt:7];
            self.moveSet = [NSArray arrayWithObjects:move1,move2,move3, nil];
        }
        if (itemCode == 67)
        {
            self.name = @"Ichorean Sword";
            self.itemTextColor = 2;
            
            self.canEquip = YES;
            self.canThrowAway = YES;
            self.canUse = NO;
            self.canUseInBattle = NO;
            
            self.strBonus = 70;
            self.strMult = 2.6;
            self.aglBonus = 7;
            self.aglMult = 1.4;
            self.defBonus = 0;
            self.defMult = 1.0;
            self.magDefBonus = 0;
            self.magDefMult = 1.0;
            
            self.itemCount = 1;
            self.equipCode = 1;
            
            self.goldMult = 1.0;
            self.expMult = 1.0;
            
            self.description = @"A simple sword with an Ichorean blade.";
            self.goldValue = 185;
            self.sellGoldValue = 122;
            
            self.image = @"item067big.png";
            self.bigImage = self.image;
            
            NSNumber *move1 = [NSNumber numberWithInt:7];
            NSNumber *move2 = [NSNumber numberWithInt:13];
            NSNumber *move3 = [NSNumber numberWithInt:9];
            self.moveSet = [NSArray arrayWithObjects:move1,move2,move3, nil];
        }
        if (itemCode == 68)
        {
            self.name = @"Ichorean Avenger";
            self.itemTextColor = 2;
            
            self.canEquip = YES;
            self.canThrowAway = YES;
            self.canUse = NO;
            self.canUseInBattle = NO;
            
            self.strBonus = 85;
            self.strMult = 2.9;
            self.aglBonus = 0;
            self.aglMult = 1.0;
            self.defBonus = 0;
            self.defMult = 1.0;
            self.magDefBonus = 0;
            self.magDefMult = 1.0;
            
            self.itemCount = 1;
            self.equipCode = 1;
            
            self.goldMult = 1.0;
            self.expMult = 1.0;
            
            self.description = @"A menacing weapon with three Ichorean blades.";
            self.goldValue = 220;
            self.sellGoldValue = 143;
            
            self.image = @"item068big.png";
            self.bigImage = self.image;
            
            NSNumber *move1 = [NSNumber numberWithInt:8];
            NSNumber *move2 = [NSNumber numberWithInt:5];
            NSNumber *move3 = [NSNumber numberWithInt:9];
            self.moveSet = [NSArray arrayWithObjects:move1,move2,move3, nil];
        }
        if (itemCode == 69)
        {
            self.name = @"Onyx Battle Knife";
            self.itemTextColor = 2;
            
            self.canEquip = YES;
            self.canThrowAway = YES;
            self.canUse = NO;
            self.canUseInBattle = NO;
            
            self.strBonus = 95;
            self.strMult = 3.0;
            self.aglBonus = 15;
            self.aglMult = 1.5;
            self.defBonus = 5;
            self.defMult = 1.1;
            self.magDefBonus = 0;
            self.magDefMult = 1.0;
            
            self.itemCount = 1;
            self.equipCode = 1;
            
            self.goldMult = 1.0;
            self.expMult = 1.0;
            
            self.description = @"A versatile dagger made out of pure Onyx.";
            self.goldValue = 395;
            self.sellGoldValue = 262;
            
            self.image = @"item069big.png";
            self.bigImage = self.image;
            
            NSNumber *move1 = [NSNumber numberWithInt:10];
            NSNumber *move2 = [NSNumber numberWithInt:5];
            NSNumber *move3 = [NSNumber numberWithInt:7];
            self.moveSet = [NSArray arrayWithObjects:move1,move2,move3, nil];
        }
        if (itemCode == 70)
        {
            self.name = @"Onyx Sword";
            self.itemTextColor = 2;
            
            self.canEquip = YES;
            self.canThrowAway = YES;
            self.canUse = NO;
            self.canUseInBattle = NO;
            
            self.strBonus = 110;
            self.strMult = 3.1;
            self.aglBonus = 10;
            self.aglMult = 1.4;
            self.defBonus = 6;
            self.defMult = 1.1;
            self.magDefBonus = 0;
            self.magDefMult = 1.0;
            
            self.itemCount = 1;
            self.equipCode = 1;
            
            self.goldMult = 1.0;
            self.expMult = 1.0;
            
            self.description = @"A finely crafted sword made out of pure Onyx.";
            self.goldValue = 430;
            self.sellGoldValue = 283;
            
            self.image = @"item070big.png";
            self.bigImage = self.image;
            
            NSNumber *move1 = [NSNumber numberWithInt:7];
            NSNumber *move2 = [NSNumber numberWithInt:13];
            NSNumber *move3 = [NSNumber numberWithInt:9];
            self.moveSet = [NSArray arrayWithObjects:move1,move2,move3, nil];
        }
        if (itemCode == 71)
        {
            self.name = @"Onyx Avenger";
            self.itemTextColor = 3;
            
            self.canEquip = YES;
            self.canThrowAway = YES;
            self.canUse = NO;
            self.canUseInBattle = NO;
            
            self.strBonus = 140;
            self.strMult = 3.3;
            self.aglBonus = 4;
            self.aglMult = 1.2;
            self.defBonus = 10;
            self.defMult = 1.2;
            self.magDefBonus = 0;
            self.magDefMult = 1.0;
            
            self.itemCount = 1;
            self.equipCode = 1;
            
            self.goldMult = 1.0;
            self.expMult = 1.0;
            
            self.description = @"A menacing weapon equipped with three Onyx blades.";
            self.goldValue = 560;
            self.sellGoldValue = 373;
            
            self.image = @"item071big.png";
            self.bigImage = self.image;
            
            NSNumber *move1 = [NSNumber numberWithInt:8];
            NSNumber *move2 = [NSNumber numberWithInt:5];
            NSNumber *move3 = [NSNumber numberWithInt:9];
            self.moveSet = [NSArray arrayWithObjects:move1,move2,move3, nil];
        }
        if (itemCode == 72)
        {
            self.name = @"Black Serpent's Blade";
            self.itemTextColor = 2;
            
            self.canEquip = YES;
            self.canThrowAway = YES;
            self.canUse = NO;
            self.canUseInBattle = NO;
            
            self.strBonus = 74;
            self.strMult = 2.8;
            self.aglBonus = 38;
            self.aglMult = 2.1;
            self.defBonus = -10;
            self.defMult = 0.9;
            self.magDefBonus = 0;
            self.magDefMult = 1.0;
            
            self.itemCount = 1;
            self.equipCode = 1;
            
            self.goldMult = 1.0;
            self.expMult = 1.0;
            
            self.description = @"A sleek sword with a cursed blade.";
            self.goldValue = 340;
            self.sellGoldValue = 223;
            
            self.image = @"item072big.png";
            self.bigImage = self.image;
            
            NSNumber *move1 = [NSNumber numberWithInt:13];
            NSNumber *move2 = [NSNumber numberWithInt:7];
            NSNumber *move3 = [NSNumber numberWithInt:9];
            self.moveSet = [NSArray arrayWithObjects:move1,move2,move3, nil];
        }
        if (itemCode == 73)
        {
            self.name = @"Sword of Regret";
            self.itemTextColor = 3;
            
            self.canEquip = YES;
            self.canThrowAway = YES;
            self.canUse = NO;
            self.canUseInBattle = NO;
            
            self.strBonus = 140;
            self.strMult = 3.3;
            self.aglBonus = 20;
            self.aglMult = 1.6;
            self.defBonus = 15;
            self.defMult = 1.2;
            self.magDefBonus = 0;
            self.magDefMult = 1.0;
            
            self.itemCount = 1;
            self.equipCode = 1;
            
            self.goldMult = 1.0;
            self.expMult = 1.0;
            
            self.description = @"A powerful weapon that reflects a part of your enemy's attacks.";
            self.goldValue = 940;
            self.sellGoldValue = 613;
            
            self.image = @"item073big.png";
            self.bigImage = self.image;
            
            NSNumber *move1 = [NSNumber numberWithInt:10];
            NSNumber *move2 = [NSNumber numberWithInt:13];
            NSNumber *move3 = [NSNumber numberWithInt:5];
            self.moveSet = [NSArray arrayWithObjects:move1,move2,move3, nil];
        }
        if (itemCode == 74)
        {
            self.name = @"Earthen Sword";
            self.itemTextColor = 2;
            
            self.canEquip = YES;
            self.canThrowAway = YES;
            self.canUse = NO;
            self.canUseInBattle = NO;
            
            self.strBonus = 68;
            self.strMult = 2.8;
            self.aglBonus = 10;
            self.aglMult = 1.2;
            self.defBonus = 18;
            self.defMult = 1.4;
            self.magDefBonus = 0;
            self.magDefMult = 1.0;
            
            self.itemCount = 1;
            self.equipCode = 1;
            
            self.goldMult = 1.0;
            self.expMult = 1.0;
            
            self.description = @"An elemental sword with healing properties.";
            self.goldValue = 540;
            self.sellGoldValue = 351;
            
            self.image = @"item074big.png";
            self.bigImage = self.image;
            
            NSNumber *move1 = [NSNumber numberWithInt:8];
            NSNumber *move2 = [NSNumber numberWithInt:4];
            NSNumber *move3 = [NSNumber numberWithInt:9];
            self.moveSet = [NSArray arrayWithObjects:move1,move2,move3, nil];
        }
        
        if (itemCode == 75)
        {
            self.name = @"Elven Rudius";
            self.itemTextColor = 1;
            
            self.canEquip = YES;
            self.canThrowAway = YES;
            self.canUse = NO;
            self.canUseInBattle = NO;
            
            self.strBonus = 40;
            self.strMult = 1.7;
            self.aglBonus = 12;
            self.aglMult = 1.5;
            self.defBonus = 2;
            self.defMult = 1.1;
            self.magDefBonus = 0;
            self.magDefMult = 1.0;
            
            self.itemCount = 1;
            self.equipCode = 1;
            
            self.goldMult = 1.0;
            self.expMult = 1.0;
            
            self.description = @"A finely crafted blade that imbues its wielder with Elven speed. It often strikes twice.";
            self.goldValue = 153;
            self.sellGoldValue = 101;
            
            self.image = @"item075big.png";
            self.bigImage = self.image;
            
            NSNumber *move1 = [NSNumber numberWithInt:10];
            NSNumber *move2 = [NSNumber numberWithInt:6];
            NSNumber *move3 = [NSNumber numberWithInt:5];
            self.moveSet = [NSArray arrayWithObjects:move1,move2,move3, nil];
        }
        if (itemCode == 76)
        {
            self.name = @"Moonsword";
            self.itemTextColor = 2;
            
            self.canEquip = YES;
            self.canThrowAway = YES;
            self.canUse = NO;
            self.canUseInBattle = NO;
            
            self.strBonus = 78;
            self.strMult = 2.2;
            self.aglBonus = 32;
            self.aglMult = 1.5;
            self.defBonus = 5;
            self.defMult = 1.2;
            self.magDefBonus = 0;
            self.magDefMult = 1.0;
            
            self.itemCount = 1;
            self.equipCode = 1;
            
            self.goldMult = 1.0;
            self.expMult = 1.0;
            
            self.description = @"A serrated battlesword from an unknown land.";
            self.goldValue = 440;
            self.sellGoldValue = 294;
            
            self.image = @"item076big.png";
            self.bigImage = self.image;
            
            NSNumber *move1 = [NSNumber numberWithInt:9];
            NSNumber *move2 = [NSNumber numberWithInt:13];
            NSNumber *move3 = [NSNumber numberWithInt:7];
            self.moveSet = [NSArray arrayWithObjects:move1,move2,move3, nil];
        }
        if (itemCode == 77)
        {
            self.name = @"Crystalline Saber";
            self.itemTextColor = 1;
            
            self.canEquip = YES;
            self.canThrowAway = YES;
            self.canUse = NO;
            self.canUseInBattle = NO;
            
            self.strBonus = 40;
            self.strMult = 2.4;
            self.aglBonus = 10;
            self.aglMult = 1.4;
            self.defBonus = 0;
            self.defMult = 1.0;
            self.magDefBonus = 0;
            self.magDefMult = 1.0;
            
            self.itemCount = 1;
            self.equipCode = 1;
            
            self.goldMult = 1.0;
            self.expMult = 1.0;
            
            self.description = @"A flexible and fast sword made of enchanted crystal.";
            self.goldValue = 150;
            self.sellGoldValue = 100;
            
            self.image = @"item077big.png";
            self.bigImage = self.image;
            
            NSNumber *move1 = [NSNumber numberWithInt:13];
            NSNumber *move2 = [NSNumber numberWithInt:5];
            NSNumber *move3 = [NSNumber numberWithInt:10];
            self.moveSet = [NSArray arrayWithObjects:move1,move2,move3, nil];
        }
        if (itemCode == 78)
        {
            self.name = @"Godblade";
            self.itemTextColor = 3;
            
            self.canEquip = YES;
            self.canThrowAway = YES;
            self.canUse = NO;
            self.canUseInBattle = NO;
            
            self.strBonus = 220;
            self.strMult = 4.1;
            self.aglBonus = 25;
            self.aglMult = 1.5;
            self.defBonus = 28;
            self.defMult = 1.5;
            self.magDefBonus = 0;
            self.magDefMult = 1.0;
            
            self.itemCount = 1;
            self.equipCode = 1;
            
            self.goldMult = 1.2;
            self.expMult = 1.0;
            
            self.description = @"A sword of the Heavens, charged with lightning. Burns anything that it touches.";
            self.goldValue = 1540;
            self.sellGoldValue = 1014;
            
            self.image = @"item078big.png";
            self.bigImage = self.image;
            
            NSNumber *move1 = [NSNumber numberWithInt:12];
            NSNumber *move2 = [NSNumber numberWithInt:9];
            NSNumber *move3 = [NSNumber numberWithInt:8];
            self.moveSet = [NSArray arrayWithObjects:move1,move2,move3, nil];
        }
        if (itemCode == 79)
        {
            self.name = @"Dragonsword";
            self.itemTextColor = 3;
            
            self.canEquip = YES;
            self.canThrowAway = YES;
            self.canUse = NO;
            self.canUseInBattle = NO;
            
            self.strBonus = 155;
            self.strMult = 3.4;
            self.aglBonus = 10;
            self.aglMult = 1.3;
            self.defBonus = 20;
            self.defMult = 1.4;
            self.magDefBonus = 0;
            self.magDefMult = 1.0;
            
            self.itemCount = 1;
            self.equipCode = 1;
            
            self.goldMult = 1.0;
            self.expMult = 1.0;
            
            self.description = @"The ideal weapon for fighting dragons.";
            self.goldValue = 850;
            self.sellGoldValue = 550;
            
            self.image = @"item079big.png";
            self.bigImage = self.image;
            
            NSNumber *move1 = [NSNumber numberWithInt:11];
            NSNumber *move2 = [NSNumber numberWithInt:10];
            NSNumber *move3 = [NSNumber numberWithInt:6];
            self.moveSet = [NSArray arrayWithObjects:move1,move2,move3, nil];
        }
        if (itemCode == 80)
        {
            self.name = @"Hero's Guide";
            self.itemTextColor = 3;
            
            self.canEquip = YES;
            self.canThrowAway = YES;
            self.canUse = NO;
            self.canUseInBattle = NO;
            
            self.strBonus = 340;
            self.strMult = 5.0;
            self.aglBonus = 44;
            self.aglMult = 2.0;
            self.defBonus = 50;
            self.defMult = 2.0;
            self.magDefBonus = 0;
            self.magDefMult = 1.0;
            
            self.itemCount = 1;
            self.equipCode = 1;
            
            self.goldMult = 1.0;
            self.expMult = 1.2;
            
            self.description = @"A perfectly crafted sword fit for a true hero.";
            self.goldValue = 7302;
            self.sellGoldValue = 4901;
            
            self.image = @"item080big.png";
            self.bigImage = self.image;
            
            NSNumber *move1 = [NSNumber numberWithInt:9];
            NSNumber *move2 = [NSNumber numberWithInt:13];
            NSNumber *move3 = [NSNumber numberWithInt:10];
            self.moveSet = [NSArray arrayWithObjects:move1,move2,move3, nil];
        }
        if (itemCode == 81)
        {
            self.name = @"Abyssal Fire";
            self.itemTextColor = 3;
            
            self.canEquip = YES;
            self.canThrowAway = YES;
            self.canUse = NO;
            self.canUseInBattle = NO;
            
            self.strBonus = 297;
            self.strMult = 4.0;
            self.aglBonus = 60;
            self.aglMult = 2.8;
            self.defBonus = 24;
            self.defMult = 1.2;
            self.magDefBonus = 0;
            self.magDefMult = 1.0;
            
            self.itemCount = 1;
            self.equipCode = 1;
            
            self.goldMult = 1.0;
            self.expMult = 1.0;
            
            self.description = @"A demonic weapon that leaves a burning wound on your enemies.";
            self.goldValue = 6580;
            self.sellGoldValue = 4320;
            
            self.image = @"item081big.png";
            self.bigImage = self.image;
            
            NSNumber *move1 = [NSNumber numberWithInt:11];
            NSNumber *move2 = [NSNumber numberWithInt:10];
            NSNumber *move3 = [NSNumber numberWithInt:9];
            self.moveSet = [NSArray arrayWithObjects:move1,move2,move3, nil];
        }
        if (itemCode == 82)
        {
            self.name = @"Justice";
            self.itemTextColor = 3;
            
            self.canEquip = YES;
            self.canThrowAway = YES;
            self.canUse = NO;
            self.canUseInBattle = NO;
            
            self.strBonus = 503;
            self.strMult = 6.0;
            self.aglBonus = 114;
            self.aglMult = 2.5;
            self.defBonus = 54;
            self.defMult = 1.6;
            self.magDefBonus = 0;
            self.magDefMult = 1.0;
            
            self.itemCount = 1;
            self.equipCode = 1;
            
            self.goldMult = 1.0;
            self.expMult = 1.0;
            
            self.description = @"The most powerful sword in existence. This weapon deals indiscriminate Justice upon its foes.";
            self.goldValue = 21114;
            self.sellGoldValue = 14230;
            
            self.image = @"item082big.png";
            self.bigImage = self.image;
            
            NSNumber *move1 = [NSNumber numberWithInt:12];
            NSNumber *move2 = [NSNumber numberWithInt:8];
            NSNumber *move3 = [NSNumber numberWithInt:13];
            self.moveSet = [NSArray arrayWithObjects:move1,move2,move3, nil];
        }
        if (itemCode == 83)
        {
            self.name = @"Dwarven Ax";
            self.itemTextColor = 1;
            
            self.canEquip = YES;
            self.canThrowAway = YES;
            self.canUse = NO;
            self.canUseInBattle = NO;
            
            self.strBonus = 50;
            self.strMult = 2.4;
            self.aglBonus = 0;
            self.aglMult = 1.0;
            self.defBonus = 0;
            self.defMult = 1.0;
            self.magDefBonus = 0;
            self.magDefMult = 1.0;
            
            self.itemCount = 1;
            self.equipCode = 1;
            
            self.goldMult = 1.1;
            self.expMult = 1.0;
            
            self.description = @"A unique battleax that really packs a punch.";
            self.goldValue = 110;
            self.sellGoldValue = 72;
            
            self.image = @"item083big.png";
            self.bigImage = self.image;
            
            NSNumber *move1 = [NSNumber numberWithInt:7];
            NSNumber *move2 = [NSNumber numberWithInt:8];
            NSNumber *move3 = [NSNumber numberWithInt:9];
            self.moveSet = [NSArray arrayWithObjects:move1,move2,move3, nil];
        }
        if (itemCode == 84)
        {
            self.name = @"Jade Spear";
            self.itemTextColor = 1;
            
            self.canEquip = YES;
            self.canThrowAway = YES;
            self.canUse = NO;
            self.canUseInBattle = NO;
            
            self.strBonus = 20;
            self.strMult = 1.4;
            self.aglBonus = 8;
            self.aglMult = 1.2;
            self.defBonus = 6;
            self.defMult = 1.1;
            self.magDefBonus = 0;
            self.magDefMult = 1.0;
            
            self.itemCount = 1;
            self.equipCode = 1;
            
            self.goldMult = 1.0;
            self.expMult = 1.0;
            
            self.description = @"A well-built spear that enables different styles of fighting.";
            self.goldValue = 60;
            self.sellGoldValue = 40;
            
            self.image = @"item084big.png";
            self.bigImage = self.image;
            
            NSNumber *move1 = [NSNumber numberWithInt:5];
            NSNumber *move2 = [NSNumber numberWithInt:6];
            NSNumber *move3 = [NSNumber numberWithInt:7];
            self.moveSet = [NSArray arrayWithObjects:move1,move2,move3, nil];
        }
        if (itemCode == 90)
        {
            self.name = @"Strength Amulet";
            self.itemTextColor = 1;
            
            self.canEquip = YES;
            self.canThrowAway = YES;
            self.canUse = NO;
            self.canUseInBattle = NO;
            
            self.strBonus = 15;
            self.strMult = 1.4;
            self.aglBonus = 0;
            self.aglMult = 1.0;
            self.defBonus = 0;
            self.defMult = 1.0;
            self.magDefBonus = 0;
            self.magDefMult = 1.0;
            
            self.itemCount = 1;
            self.equipCode = 5;
            
            self.goldMult = 1.0;
            self.expMult = 1.0;
            
            self.description = @"An enchanted amulet that enhances its wearer's strength in battle.";
            self.goldValue = 50;
            self.sellGoldValue = 33;
            
            self.image = @"item090big.png";
            self.bigImage = self.image;
            
        }
                if (itemCode == 91)
        {
            self.name = @"Defense Amulet";
            self.itemTextColor = 1;
            
            self.canEquip = YES;
            self.canThrowAway = YES;
            self.canUse = NO;
            self.canUseInBattle = NO;
            
            self.strBonus = 0;
            self.strMult = 1.0;
            self.aglBonus = 0;
            self.aglMult = 1.0;
            self.defBonus = 15;
            self.defMult = 1.4;
            self.magDefBonus = 0;
            self.magDefMult = 1.0;
            
            self.itemCount = 1;
            self.equipCode = 5;
            
            self.goldMult = 1.0;
            self.expMult = 1.0;
            
            self.description = @"An enchanted amulet that enhances its wearer's defense in battle.";
            self.goldValue = 50;
            self.sellGoldValue = 33;
            
            self.image = @"item091big.png";
            self.bigImage = self.image;
            
        }
        if (itemCode == 92)
        {
            self.name = @"Speed Amulet";
            self.itemTextColor = 1;
            
            self.canEquip = YES;
            self.canThrowAway = YES;
            self.canUse = NO;
            self.canUseInBattle = NO;
            
            self.strBonus = 0;
            self.strMult = 1.0;
            self.aglBonus = 15;
            self.aglMult = 1.4;
            self.defBonus = 0;
            self.defMult = 1.0;
            self.magDefBonus = 0;
            self.magDefMult = 1.0;
            
            self.itemCount = 1;
            self.equipCode = 5;
            
            self.goldMult = 1.0;
            self.expMult = 1.0;
            
            self.description = @"An enchanted amulet that enhances its wearer's agility in battle.";
            self.goldValue = 50;
            self.sellGoldValue = 33;
            
            self.image = @"item092big.png";
            self.bigImage = self.image;
            
        }
        if (itemCode == 93)
        {
            self.name = @"Eagle's Charm";
            self.itemTextColor = 2;
            
            self.canEquip = YES;
            self.canThrowAway = YES;
            self.canUse = NO;
            self.canUseInBattle = NO;
            
            self.strBonus = 0;
            self.strMult = 1.0;
            self.aglBonus = 10;
            self.aglMult = 1.3;
            self.defBonus = 0;
            self.defMult = 1.0;
            self.magDefBonus = 0;
            self.magDefMult = 1.0;
            
            self.itemCount = 1;
            self.equipCode = 5;
            
            self.goldMult = 1.3;
            self.expMult = 1.0;
            
            self.description = @"Eagle's Charm increases your speed and allows you to find more gold from your loot.";
            self.goldValue = 200;
            self.sellGoldValue = 134;
            
            self.image = @"item093big.png";
            self.bigImage = self.image;
            
        }
        if (itemCode == 94)
        {
            self.name = @"Amulet of Balok";
            self.itemTextColor = 1;
            
            self.canEquip = YES;
            self.canThrowAway = YES;
            self.canUse = NO;
            self.canUseInBattle = NO;
            
            self.strBonus = 5;
            self.strMult = 1.1;
            self.aglBonus = 8;
            self.aglMult = 1.1;
            self.defBonus = 10;
            self.defMult = 1.2;
            self.magDefBonus = 0;
            self.magDefMult = 1.0;
            
            self.itemCount = 1;
            self.equipCode = 5;
            
            self.goldMult = 1.0;
            self.expMult = 1.0;
            
            self.description = @"A powerful amulet from the ancient Kingdom of Balok. ";
            self.goldValue = 90;
            self.sellGoldValue = 61;
            
            self.image = @"item094big.png";
            self.bigImage = self.image;
        }
        if (itemCode == 95)
        {
            self.name = @"Warrior's Blessing";
            self.itemTextColor = 3;
            
            self.canEquip = YES;
            self.canThrowAway = YES;
            self.canUse = NO;
            self.canUseInBattle = NO;
            
            self.strBonus = 50;
            self.strMult = 1.8;
            self.aglBonus = 50;
            self.aglMult = 1.8;
            self.defBonus = 50;
            self.defMult = 1.8;
            self.magDefBonus = 0;
            self.magDefMult = 1.0;
            
            self.itemCount = 1;
            self.equipCode = 5;
            
            self.goldMult = 1.0;
            self.expMult = 1.0;
            
            self.description = @"A powerful amulet blessed by all of the ancient Kings.";
            self.goldValue = 1000;
            self.sellGoldValue = 667;
            
            self.image = @"item095big.png";
            self.bigImage = self.image;
            
        }
        if (itemCode == 96)
        {
            self.name = @"Diamond Charm";
            self.itemTextColor = 2;
            
            self.canEquip = YES;
            self.canThrowAway = YES;
            self.canUse = NO;
            self.canUseInBattle = NO;
            
            self.strBonus = 5;
            self.strMult = 1.1;
            self.aglBonus = 75;
            self.aglMult = 2.0;
            self.defBonus = 20;
            self.defMult = 1.2;
            self.magDefBonus = 0;
            self.magDefMult = 1.0;
            
            self.itemCount = 1;
            self.equipCode = 5;
            
            self.goldMult = 1.0;
            self.expMult = 1.0;
            
            self.description = @"This charm has a strong agility enchantment and wears down your opponent's defenses.";
            self.goldValue = 550;
            self.sellGoldValue = 370;
            
            self.image = @"item096big.png";
            self.bigImage = self.image;
        }
        if (itemCode == 97)
        {
            self.name = @"Necklace of Winter";
            self.itemTextColor = 1;
            
            self.canEquip = YES;
            self.canThrowAway = YES;
            self.canUse = NO;
            self.canUseInBattle = NO;
            
            self.strBonus = 10;
            self.strMult = 1.2;
            self.aglBonus = 0;
            self.aglMult = 1.0;
            self.defBonus = 30;
            self.defMult = 1.6;
            self.magDefBonus = 0;
            self.magDefMult = 1.0;
            
            self.itemCount = 1;
            self.equipCode = 5;
            
            self.goldMult = 1.0;
            self.expMult = 1.0;
            
            self.description = @"A crystal amulet that protects its bearer.";
            self.goldValue = 100;
            self.sellGoldValue = 67;
            
            self.image = @"item097big.png";
            self.bigImage = self.image;
        }
        if (itemCode == 98)
        {
            self.name = @"Amulet of Wisdom";
            self.itemTextColor = 2;
            
            self.canEquip = YES;
            self.canThrowAway = YES;
            self.canUse = NO;
            self.canUseInBattle = NO;
            
            self.strBonus = 10;
            self.strMult = 1.3;
            self.aglBonus = 10;
            self.aglMult = 1.3;
            self.defBonus = 10;
            self.defMult = 1.3;
            self.magDefBonus = 0;
            self.magDefMult = 1.0;
            
            self.itemCount = 1;
            self.equipCode = 5;
            
            self.goldMult = 1.0;
            self.expMult = 1.2;
            
            self.description = @"A magical amulet that provides its wearer with more insight and experience from each battle.";
            self.goldValue = 210;
            self.sellGoldValue = 140;
            
            self.image = @"item098big.png";
            self.bigImage = self.image;
        }
        if (itemCode == 99)
        {
            self.name = @"Courage";
            self.itemTextColor = 3;
            
            self.canEquip = YES;
            self.canThrowAway = YES;
            self.canUse = NO;
            self.canUseInBattle = NO;
            
            self.strBonus = 240;
            self.strMult = 4.0;
            self.aglBonus = 40;
            self.aglMult = 2.0;
            self.defBonus = 60;
            self.defMult = 2.0;
            self.magDefBonus = 0;
            self.magDefMult = 1.0;
            
            self.itemCount = 1;
            self.equipCode = 5;
            
            self.goldMult = 1.2;
            self.expMult = 1.2;
            
            self.description = @"An incredibly rare and powerful enchanted necklace.";
            self.goldValue = 11000;
            self.sellGoldValue = 6800;
            
            self.image = @"item099big.png";
            self.bigImage = self.image;
        }
        if (itemCode == 100)
        {
            self.name = @"Hannibal's Amulet";
            self.itemTextColor = 3;
            
            self.canEquip = YES;
            self.canThrowAway = YES;
            self.canUse = NO;
            self.canUseInBattle = NO;
            
            self.strBonus = 30;
            self.strMult = 1.5;
            self.aglBonus = 0;
            self.aglMult = 1.0;
            self.defBonus = 30;
            self.defMult = 1.5;
            self.magDefBonus = 0;
            self.magDefMult = 1.0;
            
            self.itemCount = 1;
            self.equipCode = 5;
            
            self.goldMult = 1.0;
            self.expMult = 1.0;
            
            self.description = @"Hannibal's Amulet leaches a percent of the damage you deal on your enemy and uses it to heal you.";
            self.goldValue = 1100;
            self.sellGoldValue = 720;
            
            self.image = @"item100big.png";
            self.bigImage = self.image;
        }
        if (itemCode == 101)
        {
            self.name = @"Vodek's Crystal";
            self.itemTextColor = 3;
            
            self.canEquip = YES;
            self.canThrowAway = NO;
            self.canUse = NO;
            self.canUseInBattle = NO;
            
            self.strBonus = 260;
            self.strMult = 4.0;
            self.aglBonus = 100;
            self.aglMult = 3.0;
            self.defBonus = 120;
            self.defMult = 3.0;
            self.magDefBonus = 0;
            self.magDefMult = 1.0;
            
            self.itemCount = 1;
            self.equipCode = 5;
            
            self.goldMult = 1.0;
            self.expMult = 1.2;
            
            self.description = @"A crystal from the God of War's shield. Brings its bearer incredible power and the ability to regenerate health.";
            self.goldValue = 100000;
            self.sellGoldValue = 50000;
            
            self.image = @"item101big.png";
            self.bigImage = self.image;
        }
        
        if (itemCode == 110)
        {
            self.name = @"Copper Chainmail";
            self.itemTextColor = 0;
            
            self.canEquip = YES;
            self.canThrowAway = YES;
            self.canUse = NO;
            self.canUseInBattle = NO;
            
            self.strBonus = 0;
            self.strMult = 1.0;
            self.aglBonus = -2;
            self.aglMult = 0.8;
            self.defBonus = 7;
            self.defMult = 1.1;
            self.magDefBonus = 0;
            self.magDefMult = 1.0;
            
            self.itemCount = 1;
            self.equipCode = 4;
            
            self.goldMult = 1.0;
            self.expMult = 1.0;
            
            self.description = @"A simple chainmail made of copper.";
            self.goldValue = 6;
            self.sellGoldValue = 4;
            
            self.image = @"item110big.png";
            self.bigImage = self.image;
        }
        if (itemCode == 111)
        {
            self.name = @"Copper Platebody";
            self.itemTextColor = 0;
            
            self.canEquip = YES;
            self.canThrowAway = YES;
            self.canUse = NO;
            self.canUseInBattle = NO;
            
            self.strBonus = 0;
            self.strMult = 1.0;
            self.aglBonus = -6;
            self.aglMult = 0.8;
            self.defBonus = 9;
            self.defMult = 1.2;
            self.magDefBonus = 0;
            self.magDefMult = 1.0;
            
            self.itemCount = 1;
            self.equipCode = 4;
            
            self.goldMult = 1.0;
            self.expMult = 1.0;
            
            self.description = @"A cumbersome platebody made of copper.";
            self.goldValue = 10;
            self.sellGoldValue = 7;
            
            self.image = @"item111big.png";
            self.bigImage = self.image;
        }
        if (itemCode == 112)
        {
            self.name = @"Iron Chainmail";
            self.itemTextColor = 0;
            
            self.canEquip = YES;
            self.canThrowAway = YES;
            self.canUse = NO;
            self.canUseInBattle = NO;
            
            self.strBonus = 0;
            self.strMult = 1.0;
            self.aglBonus = -3;
            self.aglMult = 0.8;
            self.defBonus = 10;
            self.defMult = 1.2;
            self.magDefBonus = 0;
            self.magDefMult = 1.0;
            
            self.itemCount = 1;
            self.equipCode = 4;
            
            self.goldMult = 1.0;
            self.expMult = 1.0;
            
            self.description = @"A simple chainmail made of iron.";
            self.goldValue = 12;
            self.sellGoldValue = 8;
            
            self.image = @"item112big.png";
            self.bigImage = self.image;
        }
        if (itemCode == 113)
        {
            self.name = @"Iron Platebody";
            self.itemTextColor = 0;
            
            self.canEquip = YES;
            self.canThrowAway = YES;
            self.canUse = NO;
            self.canUseInBattle = NO;
            
            self.strBonus = 0;
            self.strMult = 1.0;
            self.aglBonus = -8;
            self.aglMult = 0.7;
            self.defBonus = 15;
            self.defMult = 1.3;
            self.magDefBonus = 0;
            self.magDefMult = 1.0;
            
            self.itemCount = 1;
            self.equipCode = 4;
            
            self.goldMult = 1.0;
            self.expMult = 1.0;
            
            self.description = @"A simple chainmail made of iron.";
            self.goldValue = 16;
            self.sellGoldValue = 10;
            
            self.image = @"item113big.png";
            self.bigImage = self.image;
        }
        if (itemCode == 114)
        {
            self.name = @"Steel Chainmail";
            self.itemTextColor = 0;
            
            self.canEquip = YES;
            self.canThrowAway = YES;
            self.canUse = NO;
            self.canUseInBattle = NO;
            
            self.strBonus = 0;
            self.strMult = 1.0;
            self.aglBonus = -3;
            self.aglMult = 0.8;
            self.defBonus = 16;
            self.defMult = 1.3;
            self.magDefBonus = 0;
            self.magDefMult = 1.0;
            
            self.itemCount = 1;
            self.equipCode = 4;
            
            self.goldMult = 1.0;
            self.expMult = 1.0;
            
            self.description = @"A simple chainmail made of steel.";
            self.goldValue = 18;
            self.sellGoldValue = 12;
            
            self.image = @"item114big.png";
            self.bigImage = self.image;
        }
        if (itemCode == 115)
        {
            self.name = @"Steel Platebody";
            self.itemTextColor = 0;
            
            self.canEquip = YES;
            self.canThrowAway = YES;
            self.canUse = NO;
            self.canUseInBattle = NO;
            
            self.strBonus = 0;
            self.strMult = 1.0;
            self.aglBonus = -6;
            self.aglMult = 0.7;
            self.defBonus = 21;
            self.defMult = 1.4;
            self.magDefBonus = 0;
            self.magDefMult = 1.0;
            
            self.itemCount = 1;
            self.equipCode = 4;
            
            self.goldMult = 1.0;
            self.expMult = 1.0;
            
            self.description = @"A cumbersome platebody made of steel.";
            self.goldValue = 22;
            self.sellGoldValue = 14;
            
            self.image = @"item115big.png";
            self.bigImage = self.image;
        }
        if (itemCode == 116)
        {
            self.name = @"Mithril Chainmail";
            self.itemTextColor = 1;
            
            self.canEquip = YES;
            self.canThrowAway = YES;
            self.canUse = NO;
            self.canUseInBattle = NO;
            
            self.strBonus = 0;
            self.strMult = 1.0;
            self.aglBonus = 0;
            self.aglMult = 1.0;
            self.defBonus = 24;
            self.defMult = 1.5;
            self.magDefBonus = 0;
            self.magDefMult = 1.0;
            
            self.itemCount = 1;
            self.equipCode = 4;
            
            self.goldMult = 1.0;
            self.expMult = 1.0;
            
            self.description = @"A finely crafted chainmail made of Mithril.";
            self.goldValue = 34;
            self.sellGoldValue = 22;
            
            self.image = @"item116big.png";
            self.bigImage = self.image;
        }
        if (itemCode == 117)
        {
            self.name = @"Mithril Platebody";
            self.itemTextColor = 1;
            
            self.canEquip = YES;
            self.canThrowAway = YES;
            self.canUse = NO;
            self.canUseInBattle = NO;
            
            self.strBonus = 0;
            self.strMult = 1.0;
            self.aglBonus = 0;
            self.aglMult = 0.9;
            self.defBonus = 30;
            self.defMult = 1.6;
            self.magDefBonus = 0;
            self.magDefMult = 1.0;
            
            self.itemCount = 1;
            self.equipCode = 4;
            
            self.goldMult = 1.0;
            self.expMult = 1.0;
            
            self.description = @"Strong plated armor made of Mithril.";
            self.goldValue = 50;
            self.sellGoldValue = 33;
            
            self.image = @"item117big.png";
            self.bigImage = self.image;
        }
        if (itemCode == 118)
        {
            self.name = @"Ichorean Chainmail";
            self.itemTextColor = 2;
            
            self.canEquip = YES;
            self.canThrowAway = YES;
            self.canUse = NO;
            self.canUseInBattle = NO;
            
            self.strBonus = 0;
            self.strMult = 1.0;
            self.aglBonus = 0;
            self.aglMult = 1.2;
            self.defBonus = 45;
            self.defMult = 1.9;
            self.magDefBonus = 0;
            self.magDefMult = 1.0;
            
            self.itemCount = 1;
            self.equipCode = 4;
            
            self.goldMult = 1.0;
            self.expMult = 1.0;
            
            self.description = @"A finely crafted mail of Ichorean chains.";
            self.goldValue = 210;
            self.sellGoldValue = 140;
            
            self.image = @"item118big.png";
            self.bigImage = self.image;
        }
        if (itemCode == 119)
        {
            self.name = @"Ichorean Platebody";
            self.itemTextColor = 2;
            
            self.canEquip = YES;
            self.canThrowAway = YES;
            self.canUse = NO;
            self.canUseInBattle = NO;
            
            self.strBonus = 0;
            self.strMult = 1.0;
            self.aglBonus = 0;
            self.aglMult = 1.0;
            self.defBonus = 62;
            self.defMult = 2.2;
            self.magDefBonus = 0;
            self.magDefMult = 1.0;
            
            self.itemCount = 1;
            self.equipCode = 4;
            
            self.goldMult = 1.0;
            self.expMult = 1.0;
            
            self.description = @"Strong body armor made with Ichorean plates.";
            self.goldValue = 300;
            self.sellGoldValue = 200;
            
            self.image = @"item119big.png";
            self.bigImage = self.image;
        }
        if (itemCode == 120)
        {
            self.name = @"Onyx Chainmail";
            self.itemTextColor = 2;
            
            self.canEquip = YES;
            self.canThrowAway = YES;
            self.canUse = NO;
            self.canUseInBattle = NO;
            
            self.strBonus = 0;
            self.strMult = 1.0;
            self.aglBonus = 6;
            self.aglMult = 1.2;
            self.defBonus = 80;
            self.defMult = 2.6;
            self.magDefBonus = 0;
            self.magDefMult = 1.0;
            
            self.itemCount = 1;
            self.equipCode = 4;
            
            self.goldMult = 1.0;
            self.expMult = 1.0;
            
            self.description = @"A finely crafted mail of pure Onyx.";
            self.goldValue = 450;
            self.sellGoldValue = 300;
            
            self.image = @"item120big.png";
            self.bigImage = self.image;
        }
        if (itemCode == 121)
        {
            self.name = @"Onyx Lorica";
            self.itemTextColor = 2;
            
            self.canEquip = YES;
            self.canThrowAway = YES;
            self.canUse = NO;
            self.canUseInBattle = NO;
            
            self.strBonus = 0;
            self.strMult = 1.0;
            self.aglBonus = 8;
            self.aglMult = 1.2;
            self.defBonus = 120;
            self.defMult = 3.2;
            self.magDefBonus = 0;
            self.magDefMult = 1.0;
            
            self.itemCount = 1;
            self.equipCode = 4;
            
            self.goldMult = 1.0;
            self.expMult = 1.0;
            
            self.description = @"Flexible, strengthened body armor woven from pure Onyx crystals.";
            self.goldValue = 700;
            self.sellGoldValue = 460;
            
            self.image = @"item121big.png";
            self.bigImage = self.image;
        }
        if (itemCode == 122)
        {
            self.name = @"Dragon Coat";
            self.itemTextColor = 3;
            
            self.canEquip = YES;
            self.canThrowAway = YES;
            self.canUse = NO;
            self.canUseInBattle = NO;
            
            self.strBonus = 25;
            self.strMult = 1.5;
            self.aglBonus = 10;
            self.aglMult = 1.2;
            self.defBonus = 110;
            self.defMult = 3.0;
            self.magDefBonus = 0;
            self.magDefMult = 1.0;
            
            self.itemCount = 1;
            self.equipCode = 4;
            
            self.goldMult = 1.3;
            self.expMult = 1.0;
            
            self.description = @"A magical armor that has been deemed dragon-proof by the experts. It also attracts more loot.";
            self.goldValue = 920;
            self.sellGoldValue = 613;
            
            self.image = @"item122big.png";
            self.bigImage = self.image;
        }
        if (itemCode == 123)
        {
            self.name = @"Wolfhide Armor";
            self.itemTextColor = 1;
            
            self.canEquip = YES;
            self.canThrowAway = YES;
            self.canUse = NO;
            self.canUseInBattle = NO;
            
            self.strBonus = 10;
            self.strMult = 1.2;
            self.aglBonus = 20;
            self.aglMult = 1.5;
            self.defBonus = 32;
            self.defMult = 1.6;
            self.magDefBonus = 0;
            self.magDefMult = 1.0;
            
            self.itemCount = 1;
            self.equipCode = 4;
            
            self.goldMult = 1.0;
            self.expMult = 1.0;
            
            self.description = @"Armor made of toughened wolfhide.";
            self.goldValue = 120;
            self.sellGoldValue = 80;
            
            self.image = @"item123big.png";
            self.bigImage = self.image;
        }
        if (itemCode == 124)
        {
            self.name = @"Woven Diamond";
            self.itemTextColor = 3;
            
            self.canEquip = YES;
            self.canThrowAway = YES;
            self.canUse = NO;
            self.canUseInBattle = NO;
            
            self.strBonus = 50;
            self.strMult = 1.8;
            self.aglBonus = 60;
            self.aglMult = 2.0;
            self.defBonus = 380;
            self.defMult = 4.6;
            self.magDefBonus = 0;
            self.magDefMult = 1.0;
            
            self.itemCount = 1;
            self.equipCode = 4;
            
            self.goldMult = 1.0;
            self.expMult = 1.0;
            
            self.description = @"This flexible armor is impervious to normal attacks, and will cut any enemy who dares to touch it.";
            self.goldValue = 16400;
            self.sellGoldValue = 11200;
            
            self.image = @"item124big.png";
            self.bigImage = self.image;
        }
        
        if (itemCode == 125)
        {
            self.name = @"Armor of the Forest";
            self.description = @"Elemental body armor that regenerates your health in battle.";
            self.itemTextColor = 3;
            
            self.canEquip = YES;
            self.canThrowAway = YES;
            self.canUse = NO;
            self.canUseInBattle = NO;
            
            self.strBonus = 20; self.strMult = 1.4;
            
            self.aglBonus = 70; self.aglMult = 2.2;
            
            self.defBonus = 130; self.defMult = 3.2;
            
            self.magDefBonus = 0;
            self.magDefMult = 1.0;
            
            self.itemCount = 1;
            self.equipCode = 4;
            
            self.goldMult = 1.0;
            self.expMult = 1.0;
            
            
            
            self.goldValue = 3000;
            self.sellGoldValue = 2000;
            
            self.image = @"item125big.png";
            self.bigImage = self.image;
        }
        if (itemCode == 126)
        {
            self.name = @"Elven Lorica";
            self.description = @"A finely crafted armor suit made for nimble fighters.";
            self.itemTextColor = 2;
            
            self.canEquip = YES;
            self.canThrowAway = YES;
            self.canUse = NO;
            self.canUseInBattle = NO;
            
            self.strBonus = 25; self.strMult = 1.5;
            
            self.aglBonus = 40; self.aglMult = 1.8;
            
            self.defBonus = 80; self.defMult = 2.4;
            
            self.magDefBonus = 0;
            self.magDefMult = 1.0;
            
            self.itemCount = 1;
            self.equipCode = 4;
            
            self.goldMult = 1.0;
            self.expMult = 1.2;
            
            
            
            self.goldValue = 640;
            self.sellGoldValue = 428;
            
            self.image = @"item126big.png";
            self.bigImage = self.image;
        }
        if (itemCode == 127)
        {
            self.name = @"Dwarven Ringmail";
            self.description = @"This hardy suit of Dwarven metal is hard to penetrate, but at the cost of flexibility.";
            self.itemTextColor = 1;
            
            self.canEquip = YES;
            self.canThrowAway = YES;
            self.canUse = NO;
            self.canUseInBattle = NO;
            
            self.strBonus = 20; self.strMult = 1.5;
            
            self.aglBonus = -4; self.aglMult = 0.9;
            
            self.defBonus = 40; self.defMult = 1.8;
            
            self.magDefBonus = 0;
            self.magDefMult = 1.0;
            
            self.itemCount = 1;
            self.equipCode = 4;
            
            self.goldMult = 1.0;
            self.expMult = 1.0;
            
            
            
            self.goldValue = 100;
            self.sellGoldValue = 67;
            
            self.image = @"item127big.png";
            self.bigImage = self.image;
        }
        if (itemCode == 128)
        {
            self.name = @"Hunter's Jacket";
            self.description = @"A hardy hide jacket that serves as good protection.";
            self.itemTextColor = 0;
            
            self.canEquip = YES;
            self.canThrowAway = YES;
            self.canUse = NO;
            self.canUseInBattle = NO;
            
            self.strBonus = 6; self.strMult = 1.1;
            
            self.aglBonus = 4; self.aglMult = 1.1;
            
            self.defBonus = 12; self.defMult = 1.3;
            
            self.magDefBonus = 0;
            self.magDefMult = 1.0;
            self.itemCount = 1;
            self.equipCode = 4;
            
            self.goldMult = 1.0;
            self.expMult = 1.0;
            
            self.goldValue = 26;
            self.sellGoldValue = 16;
            
            self.image = @"item128big.png";
            self.bigImage = self.image;
        }
        
        if (itemCode == 129)
        {
            self.name = @"Hero's Guardian";
            self.description = @"A fearsome set of body armor made of the strongest metals and dragon bones.";
            self.itemTextColor = 3;
            
            self.canEquip = YES;
            self.canThrowAway = YES;
            self.canUse = NO;
            self.canUseInBattle = NO;
            
            self.strBonus = 40; self.strMult = 1.8;
            
            self.aglBonus = 240; self.aglMult = 4.0;
            
            self.defBonus = 40; self.defMult = 1.8;
            
            self.magDefBonus = 0;
            self.magDefMult = 1.0;
            self.itemCount = 1;
            self.equipCode = 4;
            
            self.goldMult = 1.0;
            self.expMult = 1.0;
            
            self.goldValue = 7500;
            self.sellGoldValue = 5000;
            
            self.image = @"item129big.png";
            self.bigImage = self.image;
        }
        if (itemCode == 142)
        {
            self.name = @"Heart";
            self.description = @"An indestructible body armor with magical properties that imbue its wearer with strength and speed.";
            self.itemTextColor = 3;
            
            self.canEquip = YES;
            self.canThrowAway = YES;
            self.canUse = NO;
            self.canUseInBattle = NO;
            
            self.strBonus = 100; self.strMult = 2.5;
            
            self.aglBonus = 100; self.aglMult = 2.5;
            
            self.defBonus = 600; self.defMult = 6.0;
            
            self.magDefBonus = 0;
            self.magDefMult = 1.0;
            self.itemCount = 1;
            self.equipCode = 4;
            
            self.goldMult = 1.0;
            self.expMult = 1.0;
            
            self.goldValue = 28400;
            self.sellGoldValue = 18900;
            
            self.image = @"item142big.png";
            self.bigImage = self.image;
        }
        if (itemCode == 143)
        {
            self.name = @"Adamantine Chainmail";
            self.description = @"A finely crafted chainmail made of Adamantine.";
            self.itemTextColor = 1;
            
            self.canEquip = YES;
            self.canThrowAway = YES;
            self.canUse = NO;
            self.canUseInBattle = NO;
            
            self.strBonus = 0; self.strMult = 1.0;
            
            self.aglBonus = 0; self.aglMult = 1.0;
            
            self.defBonus = 32; self.defMult = 1.6;
            
            self.magDefBonus = 0;
            self.magDefMult = 1.0;
            self.itemCount = 1;
            self.equipCode = 4;
            
            self.goldMult = 1.0;
            self.expMult = 1.0;
            
            self.goldValue = 70;
            self.sellGoldValue = 46;
            
            self.image = @"item143big.png";
            self.bigImage = self.image;
        }
        if (itemCode == 144)
        {
            self.name = @"Adamantine Platebody";
            self.description = @"Strong plated armor made of Adamantine.";
            self.itemTextColor = 1;
            
            self.canEquip = YES;
            self.canThrowAway = YES;
            self.canUse = NO;
            self.canUseInBattle = NO;
            
            self.strBonus = 0; self.strMult = 1.0;
            
            self.aglBonus = 0; self.aglMult = 1.0;
            
            self.defBonus = 37; self.defMult = 1.7;
            
            self.magDefBonus = 0;
            self.magDefMult = 1.0;
            self.itemCount = 1;
            self.equipCode = 4;
            
            self.goldMult = 1.0;
            self.expMult = 1.0;
            
            self.goldValue = 85;
            self.sellGoldValue = 57;
            
            self.image = @"item144big.png";
            self.bigImage = self.image;
        }
        if (itemCode == 130)
        {
            self.name = @"Copper legplates";
            self.description = @"Plated legging armor made of copper.";
            self.itemTextColor = 0;
            
            self.canEquip = YES;
            self.canThrowAway = YES;
            self.canUse = NO;
            self.canUseInBattle = NO;
            
            self.strBonus = 0; self.strMult = 1.0;
            
            self.aglBonus = 0; self.aglMult = 0.9;
            
            self.defBonus = 3; self.defMult = 1.1;
            
            self.magDefBonus = 0;
            self.magDefMult = 1.0;
            self.itemCount = 1;
            self.equipCode = 6;
            
            self.goldMult = 1.0;
            self.expMult = 1.0;
            
            self.goldValue = 3;
            self.sellGoldValue = 2;
            
            self.image = @"item130big.png";
            self.bigImage = self.image;
        }
        if (itemCode == 131)
        {
            self.name = @"Iron legplates";
            self.description = @"Plated legging armor made of iron.";
            self.itemTextColor = 0;
            
            self.canEquip = YES;
            self.canThrowAway = YES;
            self.canUse = NO;
            self.canUseInBattle = NO;
            
            self.strBonus = 0; self.strMult = 1.0;
            
            self.aglBonus = 0; self.aglMult = 0.8;
            
            self.defBonus = 6; self.defMult = 1.1;
            
            self.magDefBonus = 0;
            self.magDefMult = 1.0;
            self.itemCount = 1;
            self.equipCode = 6;
            
            self.goldMult = 1.0;
            self.expMult = 1.0;
            
            self.goldValue = 7;
            self.sellGoldValue = 4;
            
            self.image = @"item131big.png";
            self.bigImage = self.image;
        }
        if (itemCode == 132)
        {
            self.name = @"Leather Chaps";
            self.description = @"Flexible chaps made from hardened leather.";
            self.itemTextColor = 0;
            
            self.canEquip = YES;
            self.canThrowAway = YES;
            self.canUse = NO;
            self.canUseInBattle = NO;
            
            self.strBonus = 0; self.strMult = 1.0;
            
            self.aglBonus = 4; self.aglMult = 1.2;
            
            self.defBonus = 10; self.defMult = 1.2;
            
            self.magDefBonus = 0;
            self.magDefMult = 1.0;
            self.itemCount = 1;
            self.equipCode = 6;
            
            self.goldMult = 1.0;
            self.expMult = 1.0;
            
            self.goldValue = 11;
            self.sellGoldValue = 7;
            
            self.image = @"item132big.png";
            self.bigImage = self.image;
        }
        if (itemCode == 133)
        {
            self.name = @"Wolfhide Chaps";
            self.description = @"Strong hunting chaps made from the hides of wolves.";
            self.itemTextColor = 1;
            
            self.canEquip = YES;
            self.canThrowAway = YES;
            self.canUse = NO;
            self.canUseInBattle = NO;
            
            self.strBonus = 15; self.strMult = 1.6;
            
            self.aglBonus = 12; self.aglMult = 1.4;
            
            self.defBonus = 10; self.defMult = 1.2;
            
            self.magDefBonus = 0;
            self.magDefMult = 1.0;
            self.itemCount = 1;
            self.equipCode = 6;
            
            self.goldMult = 1.0;
            self.expMult = 1.0;
            
            self.goldValue = 84;
            self.sellGoldValue = 56;
            
            self.image = @"item133big.png";
            self.bigImage = self.image;
        }
        if (itemCode == 134)
        {
            self.name = @"Steel legplates";
            self.description = @"Plated legging armor made of steel.";
            self.itemTextColor = 0;
            
            self.canEquip = YES;
            self.canThrowAway = YES;
            self.canUse = NO;
            self.canUseInBattle = NO;
            
            self.strBonus = 0; self.strMult = 1.0;
            
            self.aglBonus = 0; self.aglMult = 0.9;
            
            self.defBonus = 15; self.defMult = 1.2;
            
            self.magDefBonus = 0;
            self.magDefMult = 1.0;
            self.itemCount = 1;
            self.equipCode = 6;
            
            self.goldMult = 1.0;
            self.expMult = 1.0;
            
            self.goldValue = 20;
            self.sellGoldValue = 13;
            
            self.image = @"item134big.png";
            self.bigImage = self.image;
        }
        if (itemCode == 135)
        {
            self.name = @"Mithril legplates";
            self.description = @"Combat legwear armored with Mithril plates.";
            self.itemTextColor = 1;
            
            self.canEquip = YES;
            self.canThrowAway = YES;
            self.canUse = NO;
            self.canUseInBattle = NO;
            
            self.strBonus = 0; self.strMult = 1.0;
            
            self.aglBonus = 0; self.aglMult = 1.0;
            
            self.defBonus = 22; self.defMult = 1.3;
            
            self.magDefBonus = 0;
            self.magDefMult = 1.0;
            self.itemCount = 1;
            self.equipCode = 6;
            
            self.goldMult = 1.0;
            self.expMult = 1.0;
            
            self.goldValue = 30;
            self.sellGoldValue = 20;
            
            self.image = @"item135big.png";
            self.bigImage = self.image;
        }
        if (itemCode == 136)
        {
            self.name = @"Ichorean legplates";
            self.description = @"Combat legwear armored with Ichorean plates.";
            self.itemTextColor = 1;
            
            self.canEquip = YES;
            self.canThrowAway = YES;
            self.canUse = NO;
            self.canUseInBattle = NO;
            
            self.strBonus = 5; self.strMult = 1.1;
            
            self.aglBonus = 0; self.aglMult = 1.0;
            
            self.defBonus = 36; self.defMult = 1.5;
            
            self.magDefBonus = 0;
            self.magDefMult = 1.0;
            self.itemCount = 1;
            self.equipCode = 6;
            
            self.goldMult = 1.0;
            self.expMult = 1.0;
            
            self.goldValue = 120;
            self.sellGoldValue = 80;
            
            self.image = @"item136big.png";
            self.bigImage = self.image;
        }
        if (itemCode == 137)
        {
            self.name = @"Onyx legplates";
            self.description = @"Combat legwear armored with Onyx plates.";
            self.itemTextColor = 2;
            
            self.canEquip = YES;
            self.canThrowAway = YES;
            self.canUse = NO;
            self.canUseInBattle = NO;
            
            self.strBonus = 12; self.strMult = 1.2;
            
            self.aglBonus = 0; self.aglMult = 1.0;
            
            self.defBonus = 65; self.defMult = 2.0;
            
            self.magDefBonus = 0;
            self.magDefMult = 1.0;
            self.itemCount = 1;
            self.equipCode = 6;
            
            self.goldMult = 1.0;
            self.expMult = 1.0;
            
            self.goldValue = 340;
            self.sellGoldValue = 220;
            
            self.image = @"item137big.png";
            self.bigImage = self.image;
        }
        if (itemCode == 138)
        {
            self.name = @"Elven Chaps";
            self.description = @"Hunting legwear worn by the Elves.";
            self.itemTextColor = 2;
            
            self.canEquip = YES;
            self.canThrowAway = YES;
            self.canUse = NO;
            self.canUseInBattle = NO;
            
            self.strBonus = 10; self.strMult = 1.2;
            
            self.aglBonus = 40; self.aglMult = 1.8;
            
            self.defBonus = 35; self.defMult = 1.5;
            
            self.magDefBonus = 0;
            self.magDefMult = 1.0;
            self.itemCount = 1;
            self.equipCode = 6;
            
            self.goldMult = 1.0;
            self.expMult = 1.0;
            
            self.goldValue = 270;
            self.sellGoldValue = 180;
            
            self.image = @"item138big.png";
            self.bigImage = self.image;
        }
        if (itemCode == 139)
        {
            self.name = @"Dragon Chausses";
            self.description = @"Knight's leg armor that can withstand any attack.";
            self.itemTextColor = 3;
            
            self.canEquip = YES;
            self.canThrowAway = YES;
            self.canUse = NO;
            self.canUseInBattle = NO;
            
            self.strBonus = 20; self.strMult = 1.5;
            
            self.aglBonus = 10; self.aglMult = 1.2;
            
            self.defBonus = 70; self.defMult = 2.0;
            
            self.magDefBonus = 0;
            self.magDefMult = 1.0;
            self.itemCount = 1;
            self.equipCode = 6;
            
            self.goldMult = 1.0;
            self.expMult = 1.0;
            
            self.goldValue = 600;
            self.sellGoldValue = 400;
            
            self.image = @"item139big.png";
            self.bigImage = self.image;
        }
        if (itemCode == 140)
        {
            self.name = @"Hunter's Leggings";
            self.description = @"More flexible hunting legwear made from strong and light materials.";
            self.itemTextColor = 0;
            
            self.canEquip = YES;
            self.canThrowAway = YES;
            self.canUse = NO;
            self.canUseInBattle = NO;
            
            self.strBonus = 5; self.strMult = 1.1;
            
            self.aglBonus = 3; self.aglMult = 1.2;
            
            self.defBonus = 10; self.defMult = 1.2;
            
            self.magDefBonus = 0;
            self.magDefMult = 1.0;
            self.itemCount = 1;
            self.equipCode = 6;
            
            self.goldMult = 1.0;
            self.expMult = 1.0;
            
            self.goldValue = 20;
            self.sellGoldValue = 13;
            
            self.image = @"item140big.png";
            self.bigImage = self.image;
        }
        if (itemCode == 141)
        {
            self.name = @"Merit";
            self.description = @"Enchanted leg armor that is impervious to physical and magical attacks.";
            self.itemTextColor = 3;
            
            self.canEquip = YES;
            self.canThrowAway = YES;
            self.canUse = NO;
            self.canUseInBattle = NO;
            
            self.strBonus = 40; self.strMult = 2.0;
            
            self.aglBonus = 80; self.aglMult = 2.5;
            
            self.defBonus = 100; self.defMult = 3.0;
            
            self.magDefBonus = 0;
            self.magDefMult = 1.0;
            self.itemCount = 1;
            self.equipCode = 6;
            
            self.goldMult = 1.0;
            self.expMult = 1.0;
            
            self.goldValue = 15000;
            self.sellGoldValue = 10000;
            
            self.image = @"item141big.png";
            self.bigImage = self.image;
        }
        if (itemCode == 145)
        {
            self.name = @"Adamantine legplates";
            self.description = @"Combat legwear armored with Adamantine plates.";
            self.itemTextColor = 1;
            
            self.canEquip = YES;
            self.canThrowAway = YES;
            self.canUse = NO;
            self.canUseInBattle = NO;
            
            self.strBonus = 0; self.strMult = 1.0;
            
            self.aglBonus = 0; self.aglMult = 1.0;
            
            self.defBonus = 28; self.defMult = 1.4;
            
            self.magDefBonus = 0;
            self.magDefMult = 1.0;
            self.itemCount = 1;
            self.equipCode = 6;
            
            self.goldMult = 1.0;
            self.expMult = 1.0;
            
            self.goldValue = 70;
            self.sellGoldValue = 45;
            
            self.image = @"item145big.png";
            self.bigImage = self.image;
        }
        
        if (itemCode == 150)
        {
            self.name = @"Copper helm";
            self.description = @"A simple helm forged from copper.";
            self.itemTextColor = 0;
            
            self.canEquip = YES;
            self.canThrowAway = YES;
            self.canUse = NO;
            self.canUseInBattle = NO;
            
            self.strBonus = 0; self.strMult = 1.0;
            
            self.aglBonus = 0; self.aglMult = 0.9;
            
            self.defBonus = 3; self.defMult = 1.1;
            
            self.magDefBonus = 0;
            self.magDefMult = 1.0;
            self.itemCount = 1;
            self.equipCode = 3;
            
            self.goldMult = 1.0;
            self.expMult = 1.0;
            
            self.goldValue = 2;
            self.sellGoldValue = 1;
            
            self.image = @"item150big.png";
            self.bigImage = self.image;
        }
        if (itemCode == 151)
        {
            self.name = @"Iron helm";
            self.description = @"A simple helm forged from iron.";
            self.itemTextColor = 0;
            
            self.canEquip = YES;
            self.canThrowAway = YES;
            self.canUse = NO;
            self.canUseInBattle = NO;
            
            self.strBonus = 0; self.strMult = 1.0;
            
            self.aglBonus = 0; self.aglMult = 0.8;
            
            self.defBonus = 5; self.defMult = 1.1;
            
            self.magDefBonus = 0;
            self.magDefMult = 1.0;
            self.itemCount = 1;
            self.equipCode = 3;
            
            self.goldMult = 1.0;
            self.expMult = 1.0;
            
            self.goldValue = 4;
            self.sellGoldValue = 2;
            
            self.image = @"item151big.png";
            self.bigImage = self.image;
        }
        if (itemCode == 152)
        {
            self.name = @"Steel helm";
            self.description = @"A simple helm forged from steel.";
            self.itemTextColor = 0;
            
            self.canEquip = YES;
            self.canThrowAway = YES;
            self.canUse = NO;
            self.canUseInBattle = NO;
            
            self.strBonus = 0; self.strMult = 1.0;
            
            self.aglBonus = 0; self.aglMult = 0.8;
            
            self.defBonus = 10; self.defMult = 1.2;
            
            self.magDefBonus = 0;
            self.magDefMult = 1.0;
            self.itemCount = 1;
            self.equipCode = 3;
            
            self.goldMult = 1.0;
            self.expMult = 1.0;
            
            self.goldValue = 8;
            self.sellGoldValue = 5;
            
            self.image = @"item152big.png";
            self.bigImage = self.image;
        }
        if (itemCode == 153)
        {
            self.name = @"Wolfhide Cap";
            self.description = @"A light cap woven from a wolf's hide.";
            self.itemTextColor = 1;
            
            self.canEquip = YES;
            self.canThrowAway = YES;
            self.canUse = NO;
            self.canUseInBattle = NO;
            
            self.strBonus = 0; self.strMult = 1.0;
            
            self.aglBonus = 5; self.aglMult = 1.2;
            
            self.defBonus = 16; self.defMult = 1.4;
            
            self.magDefBonus = 0;
            self.magDefMult = 1.0;
            self.itemCount = 1;
            self.equipCode = 3;
            
            self.goldMult = 1.0;
            self.expMult = 1.0;
            
            self.goldValue = 31;
            self.sellGoldValue = 20;
            
            self.image = @"item153big.png";
            self.bigImage = self.image;
        }
        if (itemCode == 154)
        {
            self.name = @"Elven Coif";
            self.description = @"An enchanted coif made by the Elves.";
            self.itemTextColor = 2;
            
            self.canEquip = YES;
            self.canThrowAway = YES;
            self.canUse = NO;
            self.canUseInBattle = NO;
            
            self.strBonus = 12; self.strMult = 1.1;
            
            self.aglBonus = 16; self.aglMult = 1.5;
            
            self.defBonus = 34; self.defMult = 2.0;
            
            self.magDefBonus = 0;
            self.magDefMult = 1.0;
            self.itemCount = 1;
            self.equipCode = 3;
            
            self.goldMult = 1.1;
            self.expMult = 1.0;
            
            self.goldValue = 200;
            self.sellGoldValue = 133;
            
            self.image = @"item154big.png";
            self.bigImage = self.image;
        }
        if (itemCode == 155)
        {
            self.name = @"Mithril Helm";
            self.description = @"A strengthened helm forged from Mithril.";
            self.itemTextColor = 1;
            
            self.canEquip = YES;
            self.canThrowAway = YES;
            self.canUse = NO;
            self.canUseInBattle = NO;
            
            self.strBonus = 0; self.strMult = 1.0;
            
            self.aglBonus = 0; self.aglMult = 1.0;
            
            self.defBonus = 18; self.defMult = 1.4;
            
            self.magDefBonus = 0;
            self.magDefMult = 1.0;
            self.itemCount = 1;
            self.equipCode = 3;
            
            self.goldMult = 1.0;
            self.expMult = 1.0;
            
            self.goldValue = 28;
            self.sellGoldValue = 17;
            
            self.image = @"item155big.png";
            self.bigImage = self.image;
        }
        if (itemCode == 156)
        {
            self.name = @"Ichorean Helm";
            self.description = @"A lightweight helm strengthened by Ichorean plates.";
            self.itemTextColor = 2;
            
            self.canEquip = YES;
            self.canThrowAway = YES;
            self.canUse = NO;
            self.canUseInBattle = NO;
            
            self.strBonus = 0; self.strMult = 1.0;
            
            self.aglBonus = 0; self.aglMult = 1.0;
            
            self.defBonus = 34; self.defMult = 1.6;
            
            self.magDefBonus = 0;
            self.magDefMult = 1.0;
            self.itemCount = 1;
            self.equipCode = 3;
            
            self.goldMult = 1.0;
            self.expMult = 1.0;
            
            self.goldValue = 130;
            self.sellGoldValue = 80;
            
            self.image = @"item156big.png";
            self.bigImage = self.image;
        }
        if (itemCode == 157)
        {
            self.name = @"Onyx Helm";
            self.description = @"A lightweight helm forged from pure Onyx.";
            self.itemTextColor = 2;
            
            self.canEquip = YES;
            self.canThrowAway = YES;
            self.canUse = NO;
            self.canUseInBattle = NO;
            
            self.strBonus = 15; self.strMult = 1.2;
            
            self.aglBonus = 10; self.aglMult = 1.2;
            
            self.defBonus = 52; self.defMult = 2.0;
            
            self.magDefBonus = 0;
            self.magDefMult = 1.0;
            self.itemCount = 1;
            self.equipCode = 3;
            
            self.goldMult = 1.0;
            self.expMult = 1.0;
            
            self.goldValue = 320;
            self.sellGoldValue = 213;
            
            self.image = @"item157big.png";
            self.bigImage = self.image;
        }
        if (itemCode == 158)
        {
            self.name = @"Ivory Battle Helm";
            self.description = @"A strengthened battle helm equipped with sharpened Ivory horns.";
            self.itemTextColor = 1;
            
            self.canEquip = YES;
            self.canThrowAway = YES;
            self.canUse = NO;
            self.canUseInBattle = NO;
            
            self.strBonus = 15; self.strMult = 1.4;
            
            self.aglBonus = 0; self.aglMult = 1.0;
            
            self.defBonus = 18; self.defMult = 1.6;
            
            self.magDefBonus = 0;
            self.magDefMult = 1.0;
            self.itemCount = 1;
            self.equipCode = 3;
            
            self.goldMult = 1.0;
            self.expMult = 1.0;
            
            self.goldValue = 90;
            self.sellGoldValue = 60;
            
            self.image = @"item158big.png";
            self.bigImage = self.image;
        }
        if (itemCode == 159)
        {
            self.name = @"Dragonhide Coif";
            self.description = @"A lightweight and strong coif made from a dragon's hide. Enchanted.";
            self.itemTextColor = 3;
            
            self.canEquip = YES;
            self.canThrowAway = YES;
            self.canUse = NO;
            self.canUseInBattle = NO;
            
            self.strBonus = 30; self.strMult = 2.0;
            
            self.aglBonus = 25; self.aglMult = 1.8;
            
            self.defBonus = 80; self.defMult = 3.0;
            
            self.magDefBonus = 10;
            self.magDefMult = 1.0;
            self.itemCount = 1;
            self.equipCode = 3;
            
            self.goldMult = 1.0;
            self.expMult = 1.2;
            
            self.goldValue = 328;
            self.sellGoldValue = 227;
            
            self.image = @"item159big.png";
            self.bigImage = self.image;
        }
        if (itemCode == 160)
        {
            self.name = @"Intellect";
            self.description = @"An incredibly rare and powerful Greathelm that promotes strength, agility, defense, and intellectual ability. Forged from unknown materials.";
            self.itemTextColor = 3;
            
            self.canEquip = YES;
            self.canThrowAway = YES;
            self.canUse = NO;
            self.canUseInBattle = NO;
            
            self.strBonus = 40; self.strMult = 3.0;
            
            self.aglBonus = 70; self.aglMult = 3.4;
            
            self.defBonus = 180; self.defMult = 4.5;
            
            self.magDefBonus = 0;
            self.magDefMult = 1.0;
            self.itemCount = 1;
            self.equipCode = 3;
            
            self.goldMult = 1.3;
            self.expMult = 1.3;
            
            self.goldValue = 10600;
            self.sellGoldValue = 7200;
            
            self.image = @"item160big.png";
            self.bigImage = self.image;
        }
        if (itemCode == 161)
        {
            self.name = @"Onyx Greathelm";
            self.description = @"A large Greathelm forged from pure Onyx.";
            self.itemTextColor = 2;
            
            self.canEquip = YES;
            self.canThrowAway = YES;
            self.canUse = NO;
            self.canUseInBattle = NO;
            
            self.strBonus = 15; self.strMult = 1.2;
            
            self.aglBonus = 0; self.aglMult = 1.0;
            
            self.defBonus = 68; self.defMult = 2.4;
            
            self.magDefBonus = 0;
            self.magDefMult = 1.0;
            self.itemCount = 1;
            self.equipCode = 3;
            
            self.goldMult = 1.0;
            self.expMult = 1.0;
            
            self.goldValue = 500;
            self.sellGoldValue = 330;
            
            self.image = @"item161big.png";
            self.bigImage = self.image;
        }
        if (itemCode == 162)
        {
            self.name = @"Warrior Helm";
            self.description = @"An unbreakable and versatile helm that empowers the courageous.";
            self.itemTextColor = 3;
            
            self.canEquip = YES;
            self.canThrowAway = YES;
            self.canUse = NO;
            self.canUseInBattle = NO;
            
            self.strBonus = 60; self.strMult = 2.6;
            
            self.aglBonus = 0; self.aglMult = 1.0;
            
            self.defBonus = 80; self.defMult = 3.0;
            
            self.magDefBonus = 0;
            self.magDefMult = 1.0;
            self.itemCount = 1;
            self.equipCode = 3;
            
            self.goldMult = 1.0;
            self.expMult = 1.0;
            
            self.goldValue = 700;
            self.sellGoldValue = 480;
            
            self.image = @"item162big.png";
            self.bigImage = self.image;
        }
        if (itemCode == 165)
        {
            self.name = @"Adamantine Helm";
            self.description = @"A strengthened helm forged from Adamantine.";
            self.itemTextColor = 1;
            
            self.canEquip = YES;
            self.canThrowAway = YES;
            self.canUse = NO;
            self.canUseInBattle = NO;
            
            self.strBonus = 0; self.strMult = 1.0;
            
            self.aglBonus = 0; self.aglMult = 1.0;
            
            self.defBonus = 24; self.defMult = 1.4;
            
            self.magDefBonus = 0;
            self.magDefMult = 1.0;
            self.itemCount = 1;
            self.equipCode = 3;
            
            self.goldMult = 1.0;
            self.expMult = 1.0;
            
            self.goldValue = 56;
            self.sellGoldValue = 34;
            
            self.image = @"item165big.png";
            self.bigImage = self.image;
        }
        
        if (itemCode == 180)
        {
            self.name = @"Copper Roundshield";
            self.description = @"A plain roundshield made of copper.";
            self.itemTextColor = 0;
            
            self.canEquip = YES;
            self.canThrowAway = YES;
            self.canUse = NO;
            self.canUseInBattle = NO;
            
            self.strBonus = 0; self.strMult = 1.0;
            
            self.aglBonus = -1; self.aglMult = 1.0;
            
            self.defBonus = 6; self.defMult = 1.1;
            
            self.magDefBonus = 0;
            self.magDefMult = 1.0;
            self.itemCount = 1;
            self.equipCode = 2;
            
            self.goldMult = 1.0;
            self.expMult = 1.0;
            
            self.goldValue = 3;
            self.sellGoldValue = 2;
            
            self.image = @"item180big.png";
            self.bigImage = self.image;
        }
        if (itemCode == 181)
        {
            self.name = @"Iron Roundshield";
            self.description = @"A plain roundshield made of iron.";
            self.itemTextColor = 0;
            
            self.canEquip = YES;
            self.canThrowAway = YES;
            self.canUse = NO;
            self.canUseInBattle = NO;
            
            self.strBonus = 0; self.strMult = 1.0;
            
            self.aglBonus = -3; self.aglMult = 0.9;
            
            self.defBonus = 11; self.defMult = 1.2;
            
            self.magDefBonus = 0;
            self.magDefMult = 1.0;
            self.itemCount = 1;
            self.equipCode = 2;
            
            self.goldMult = 1.0;
            self.expMult = 1.0;
            
            self.goldValue = 7;
            self.sellGoldValue = 4;
            
            self.image = @"item181big.png";
            self.bigImage = self.image;
        }
        if (itemCode == 182)
        {
            self.name = @"Steel Roundshield";
            self.description = @"A plain roundshield made of steel.";
            self.itemTextColor = 0;
            
            self.canEquip = YES;
            self.canThrowAway = YES;
            self.canUse = NO;
            self.canUseInBattle = NO;
            
            self.strBonus = 0; self.strMult = 1.0;
            
            self.aglBonus = -2; self.aglMult = 0.9;
            
            self.defBonus = 18; self.defMult = 1.3;
            
            self.magDefBonus = 0;
            self.magDefMult = 1.0;
            self.itemCount = 1;
            self.equipCode = 2;
            
            self.goldMult = 1.0;
            self.expMult = 1.0;
            
            self.goldValue = 14;
            self.sellGoldValue = 9;
            
            self.image = @"item182big.png";
            self.bigImage = self.image;
        }
        if (itemCode == 183)
        {
            self.name = @"Steel Kiteshield";
            self.description = @"A plated kiteshield made of steel.";
            self.itemTextColor = 0;
            
            self.canEquip = YES;
            self.canThrowAway = YES;
            self.canUse = NO;
            self.canUseInBattle = NO;
            
            self.strBonus = 0; self.strMult = 1.0;
            
            self.aglBonus = -3; self.aglMult = 0.8;
            
            self.defBonus = 22; self.defMult = 1.3;
            
            self.magDefBonus = 0;
            self.magDefMult = 1.0;
            self.itemCount = 1;
            self.equipCode = 2;
            
            self.goldMult = 1.0;
            self.expMult = 1.0;
            
            self.goldValue = 22;
            self.sellGoldValue = 14;
            
            self.image = @"item183big.png";
            self.bigImage = self.image;
        }
        if (itemCode == 184)
        {
            self.name = @"Mithril Roundshield";
            self.description = @"A strengthened roundshield forged from Mithril.";
            self.itemTextColor = 1;
            
            self.canEquip = YES;
            self.canThrowAway = YES;
            self.canUse = NO;
            self.canUseInBattle = NO;
            
            self.strBonus = 0; self.strMult = 1.0;
            
            self.aglBonus = 0; self.aglMult = 1.0;
            
            self.defBonus = 28; self.defMult = 1.4;
            
            self.magDefBonus = 0;
            self.magDefMult = 1.0;
            self.itemCount = 1;
            self.equipCode = 2;
            
            self.goldMult = 1.0;
            self.expMult = 1.0;
            
            self.goldValue = 31;
            self.sellGoldValue = 20;
            
            self.image = @"item184big.png";
            self.bigImage = self.image;
        }
        if (itemCode == 185)
        {
            self.name = @"Mithril Kiteshield";
            self.description = @"A plated kiteshield made of Mithril.";
            self.itemTextColor = 1;
            
            self.canEquip = YES;
            self.canThrowAway = YES;
            self.canUse = NO;
            self.canUseInBattle = NO;
            
            self.strBonus = 0; self.strMult = 1.0;
            
            self.aglBonus = 0; self.aglMult = 0.9;
            
            self.defBonus = 36; self.defMult = 1.5;
            
            self.magDefBonus = 0;
            self.magDefMult = 1.0;
            self.itemCount = 1;
            self.equipCode = 2;
            
            self.goldMult = 1.0;
            self.expMult = 1.0;
            
            self.goldValue = 44;
            self.sellGoldValue = 29;
            
            self.image = @"item185big.png";
            self.bigImage = self.image;
        }
        if (itemCode == 186)
        {
            self.name = @"Ichorean Roundshield";
            self.description = @"A roundshield forged with Ichorean plates.";
            self.itemTextColor = 2;
            
            self.canEquip = YES;
            self.canThrowAway = YES;
            self.canUse = NO;
            self.canUseInBattle = NO;
            
            self.strBonus = 5; self.strMult = 1.1;
            
            self.aglBonus = 0; self.aglMult = 1.0;
            
            self.defBonus = 42; self.defMult = 1.8;
            
            self.magDefBonus = 0;
            self.magDefMult = 1.0;
            self.itemCount = 1;
            self.equipCode = 2;
            
            self.goldMult = 1.0;
            self.expMult = 1.0;
            
            self.goldValue = 180;
            self.sellGoldValue = 120;
            
            self.image = @"item186big.png";
            self.bigImage = self.image;
        }
        if (itemCode == 187)
        {
            self.name = @"Ichorean Kiteshield";
            self.description = @"A versatile kiteshield forged with Ichorean plates.";
            self.itemTextColor = 2;
            
            self.canEquip = YES;
            self.canThrowAway = YES;
            self.canUse = NO;
            self.canUseInBattle = NO;
            
            self.strBonus = 8; self.strMult = 1.1;
            
            self.aglBonus = 0; self.aglMult = 1.0;
            
            self.defBonus = 60; self.defMult = 2.0;
            
            self.magDefBonus = 0;
            self.magDefMult = 1.0;
            self.itemCount = 1;
            self.equipCode = 2;
            
            self.goldMult = 1.0;
            self.expMult = 1.0;
            
            self.goldValue = 290;
            self.sellGoldValue = 193;
            
            self.image = @"item187big.png";
            self.bigImage = self.image;
        }
        if (itemCode == 188)
        {
            self.name = @"Onyx Roundshield";
            self.description = @"A roundshield forged from pure Onyx.";
            self.itemTextColor = 2;
            
            self.canEquip = YES;
            self.canThrowAway = YES;
            self.canUse = NO;
            self.canUseInBattle = NO;
            
            self.strBonus = 10; self.strMult = 1.2;
            
            self.aglBonus = 0; self.aglMult = 1.2;
            
            self.defBonus = 78; self.defMult = 2.5;
            
            self.magDefBonus = 0;
            self.magDefMult = 1.0;
            self.itemCount = 1;
            self.equipCode = 2;
            
            self.goldMult = 1.0;
            self.expMult = 1.0;
            
            self.goldValue = 420;
            self.sellGoldValue = 280;
            
            self.image = @"item188big.png";
            self.bigImage = self.image;
        }
        if (itemCode == 189)
        {
            self.name = @"Onyx Battleshield";
            self.description = @"A powerful Battleshield plated with pure Onyx.";
            self.itemTextColor = 3;
            
            self.canEquip = YES;
            self.canThrowAway = YES;
            self.canUse = NO;
            self.canUseInBattle = NO;
            
            self.strBonus = 40; self.strMult = 2.0;
            
            self.aglBonus = 10; self.aglMult = 1.4;
            
            self.defBonus = 110; self.defMult = 3.2;
            
            self.magDefBonus = 0;
            self.magDefMult = 1.0;
            self.itemCount = 1;
            self.equipCode = 2;
            
            self.goldMult = 1.0;
            self.expMult = 1.0;
            
            self.goldValue = 1080;
            self.sellGoldValue = 700;
            
            self.image = @"item189big.png";
            self.bigImage = self.image;
        }
        if (itemCode == 190)
        {
            self.name = @"Trojan Shield";
            self.description = @"A versatile warrior's shield with an enchanted plating.";
            self.itemTextColor = 2;
            
            self.canEquip = YES;
            self.canThrowAway = YES;
            self.canUse = NO;
            self.canUseInBattle = NO;
            
            self.strBonus = 15; self.strMult = 1.3;
            
            self.aglBonus = 8; self.aglMult = 1.2;
            
            self.defBonus = 40; self.defMult = 1.8;
            
            self.magDefBonus = 0;
            self.magDefMult = 1.0;
            self.itemCount = 1;
            self.equipCode = 2;
            
            self.goldMult = 1.2;
            self.expMult = 1.0;
            
            self.goldValue = 240;
            self.sellGoldValue = 160;
            
            self.image = @"item190big.png";
            self.bigImage = self.image;
        }
        if (itemCode == 191)
        {
            self.name = @"Swordbreaker";
            self.description = @"A shield made of unknown material notorious for dulling the blades of the strongest weapons. Heavy.";
            self.itemTextColor = 1;
            
            self.canEquip = YES;
            self.canThrowAway = YES;
            self.canUse = NO;
            self.canUseInBattle = NO;
            
            self.strBonus = 10; self.strMult = 1.2;
            
            self.aglBonus = -4; self.aglMult = 0.9;
            
            self.defBonus = 42; self.defMult = 1.6;
            
            self.magDefBonus = 0;
            self.magDefMult = 1.0;
            self.itemCount = 1;
            self.equipCode = 2;
            
            self.goldMult = 1.0;
            self.expMult = 1.0;
            
            self.goldValue = 100;
            self.sellGoldValue = 67;
            
            self.image = @"item191big.png";
            self.bigImage = self.image;
        }
        if (itemCode == 192)
        {
            self.name = @"Elven Crystal Shield";
            self.description = @"Forged by the Elves, this shield enhances all aspects of your combat, especially agility.";
            self.itemTextColor = 3;
            
            self.canEquip = YES;
            self.canThrowAway = YES;
            self.canUse = NO;
            self.canUseInBattle = NO;
            
            self.strBonus = 16; self.strMult = 1.2;
            
            self.aglBonus = 35; self.aglMult = 2.0;
            
            self.defBonus = 75; self.defMult = 2.5;
            
            self.magDefBonus = 0;
            self.magDefMult = 1.0;
            self.itemCount = 1;
            self.equipCode = 2;
            
            self.goldMult = 1.1;
            self.expMult = 1.0;
            
            self.goldValue = 500;
            self.sellGoldValue = 330;
            
            self.image = @"item192big.png";
            self.bigImage = self.image;
        }
        if (itemCode == 193)
        {
            self.name = @"Hero's Defender";
            self.description = @"An indestructible shield.";
            self.itemTextColor = 3;
            
            self.canEquip = YES;
            self.canThrowAway = YES;
            self.canUse = NO;
            self.canUseInBattle = NO;
            
            self.strBonus = 50; self.strMult = 2.5;
            
            self.aglBonus = 50; self.aglMult = 2.5;
            
            self.defBonus = 300; self.defMult = 5.0;
            
            self.magDefBonus = 0;
            self.magDefMult = 1.0;
            self.itemCount = 1;
            self.equipCode = 2;
            
            self.goldMult = 1.0;
            self.expMult = 1.0;
            
            self.goldValue = 6300;
            self.sellGoldValue = 4200;
            
            self.image = @"item193big.png";
            self.bigImage = self.image;
        }
        if (itemCode == 194)
        {
            self.name = @"Constitution";
            self.description = @"A powerful enchanted shield with unmatched combat versatility and an impenetrable frame.";
            self.itemTextColor = 3;
            
            self.canEquip = YES;
            self.canThrowAway = YES;
            self.canUse = NO;
            self.canUseInBattle = NO;
            
            self.strBonus = 60; self.strMult = 3.0;
            
            self.aglBonus = 80; self.aglMult = 4.0;
            
            self.defBonus = 520; self.defMult = 7.0;
            
            self.magDefBonus = 0;
            self.magDefMult = 1.0;
            self.itemCount = 1;
            self.equipCode = 2;
            
            self.goldMult = 1.0;
            self.expMult = 1.1;
            
            self.goldValue = 18000;
            self.sellGoldValue = 14000;
            
            self.image = @"item194big.png";
            self.bigImage = self.image;
        }
        if (itemCode == 195)
        {
            self.name = @"Adamantine Roundshield";
            self.description = @"A roundshield forged with Adamantine plates.";
            self.itemTextColor = 1;
            
            self.canEquip = YES;
            self.canThrowAway = YES;
            self.canUse = NO;
            self.canUseInBattle = NO;
            
            self.strBonus = 0; self.strMult = 1.0;
            
            self.aglBonus = 4; self.aglMult = 1.1;
            
            self.defBonus = 36; self.defMult = 1.5;
            
            self.magDefBonus = 0;
            self.magDefMult = 1.0;
            self.itemCount = 1;
            self.equipCode = 2;
            
            self.goldMult = 1.0;
            self.expMult = 1.0;
            
            self.goldValue = 80;
            self.sellGoldValue = 53;
            
            self.image = @"item195big.png";
            self.bigImage = self.image;
        }
        if (itemCode == 196)
        {
            self.name = @"Adamantine Kiteshield";
            self.description = @"A versatile kiteshield forged with Adamantine plates.";
            self.itemTextColor = 1;
            
            self.canEquip = YES;
            self.canThrowAway = YES;
            self.canUse = NO;
            self.canUseInBattle = NO;
            
            self.strBonus = 0; self.strMult = 1.0;
            
            self.aglBonus = 0; self.aglMult = 1.0;
            
            self.defBonus = 41; self.defMult = 1.7;
            
            self.magDefBonus = 0;
            self.magDefMult = 1.0;
            self.itemCount = 1;
            self.equipCode = 2;
            
            self.goldMult = 1.0;
            self.expMult = 1.0;
            
            self.goldValue = 110;
            self.sellGoldValue = 73;
            
            self.image = @"item196big.png";
            self.bigImage = self.image;
        }
        
        
        
        
        
        
        
        
        
    }
    return self;
}








- (id)initWithCoder:(NSCoder *)decoder {

    int code = [decoder decodeIntForKey:@"itemCode"];
    int count = [decoder decodeIntForKey:@"itemCount"];
    
    if (code)
    {
        self = [super init];
        [self initWithItemCode:code];
        self.itemCount = count;
    }
    return self;
}

- (void)encodeWithCoder:(NSCoder *)encoder {
    
    [encoder encodeInt:self.itemCode forKey:@"itemCode"];
    [encoder encodeInt:self.itemCount forKey:@"itemCount"];
}







@end
