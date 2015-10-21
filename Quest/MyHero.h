//
//  MyHero.h
//  Quest
//
//  Created by Leo Linsky on 5/18/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Item.h"

@interface MyHero : NSObject <NSCoding>



@property (nonatomic, retain) NSString* heroName;
 
 
@property (nonatomic, assign) CGPoint position;
@property (nonatomic, assign) int currentMap; //1 is PL1, 2 is PL2, etc...
@property (nonatomic, assign) int mapInitMode; //1(coming from login/item shop/menu/battle(win)), 2(gate), 3(teleport), 4(herodied - pl1), 5(start new game), 6(beat ionak - go pl1)

// edit all the inits for the play layers based on the above 2 variables
// scenemanager wont really do anything special besides load different layer, the layer will interpret the previous data

@property (nonatomic, assign) int freeSteps; //repellent/dragon dust increase. Prevents battles



//

@property BOOL isRainingPL1; //30% chance of rain
@property BOOL isRainingPL3; //90% chance of rain
@property BOOL isRainingPL4; //40% chance of rain
@property BOOL isSnowingPL6; //50% chance of snow
//Note: PL5 has 100% chance of snow


//Main Quest - affecting PL1 (THESE ARE LINEAR)

@property BOOL introducedToKingV;
@property BOOL talkedToKingVInitial; //accepted task
@property BOOL gotOrb;
@property BOOL hasLitOrb;
@property BOOL beatBoss1;
@property BOOL talkedToKingVPostOrb;
@property BOOL acceptedTaskKingVPostOrb; //got gold
@property BOOL deliveredLetterToKingK;
@property BOOL acceptedMessageKingK;
@property BOOL toldNewsKingV;
@property BOOL acceptedFindEilifKingV;
@property BOOL beatCyclops;
@property BOOL talkedToEilif;
@property BOOL killedBugs;
@property BOOL beatCaveBoss;
@property BOOL talkedToEilifPostBoss;
@property BOOL savedKing;
@property BOOL wentEllemakPostSaveKing;
@property BOOL talkedToArnuk;
@property BOOL beatDragon;
@property BOOL beatIonak;
@property BOOL wentEllemakPostBeatIonak;
@property BOOL gotPrizeFromKingV;

//Side Quest - affecting PL1    ...later

@property BOOL acceptedTaskTraveler;
@property BOOL talkedToWatchmen;
@property BOOL finishedTaskTraveler;
@property BOOL usedBook;

//Other BOOLS (intermediates, items, talkedToRando, etc

@property BOOL gotItem1; //pl1
@property BOOL gotItem2;
@property BOOL gotItem3;
@property BOOL gotItem4;

@property BOOL gotItem5; //pl2
@property BOOL gotItem6;
@property BOOL gotItem7;
@property BOOL gotItem8;
@property BOOL gotRepellent;
@property BOOL gotEarthSword;

@property BOOL gotItem9; //pl3
@property BOOL gotItem10;
@property BOOL gotItem11;
@property BOOL gotItem12;
@property BOOL gotFireRoot;

@property BOOL gotItem13; //pl4
@property BOOL gotItem14;
@property BOOL gotItem15;
@property BOOL gotItem16;
@property BOOL gotLorica; //king reward: item 126, elven lorica

@property BOOL gotItem17; //pl5
@property BOOL gotItem18;
@property BOOL gotItem19; 
@property BOOL gotItem20;
@property BOOL gotItem21;
@property BOOL gotItem22;
@property BOOL gotItem23;
@property BOOL gotItem24;

@property BOOL gotItem25; //pl6
@property BOOL gotItem26;
@property BOOL gotItem27;

@property BOOL gotItem28; //PL7

@property BOOL gotItem29; //PL8
@property BOOL gotItem30;
@property BOOL gotItem31;

@property BOOL gotItem32; //PL9
@property BOOL gotItem33;
@property BOOL gotItem34;
@property BOOL gotItem35;

@property BOOL gotItem36; //PL10
@property BOOL gotItem37;
@property BOOL gotItem38;
@property BOOL gotItem39;

@property BOOL gotItem40; //PL21
@property BOOL gotItem41;
@property BOOL gotItem42;

@property BOOL gotItem43; //PL20
@property BOOL gotItem44;
@property BOOL gotItem45;

@property BOOL gotItem46; //PL22
@property BOOL gotItem47;
@property BOOL gotItem48;
@property BOOL gotItem49;

//PL30-34
@property BOOL gotItem50;
@property BOOL gotItem51;
@property BOOL gotItem52;
@property BOOL gotItem53;
@property BOOL gotItem54;
@property BOOL gotItem55;
@property BOOL gotItem56;
@property BOOL gotItem57;
@property BOOL gotItem58;

//PL11
@property BOOL gotItem59;
@property BOOL gotItem60;
@property BOOL gotItem61;
@property BOOL gotItem62;
@property BOOL gotItem63;


@property BOOL beatIceGolem1;
@property BOOL beatIceGolem2;
@property BOOL beatIceGolem3;
@property BOOL beatVank;
@property BOOL beatCaveTroll;
@property BOOL beatSunDragon;
@property BOOL beatTitan;
@property BOOL beatVodek;
@property BOOL justBeatVodek;

@property BOOL beatTowerKeeper;
@property BOOL beatTraveler;

// When writing the code, go from the bottom up (if beatIonak -> return), then (if acceptedFindEilif... ->return) etc to assign priority to different bools




//trash 








//PL1 things

@property (nonatomic, assign) CGPoint sprite1position;
@property (nonatomic, assign) CGPoint sprite2position;
@property (nonatomic, assign) CGPoint sprite3position;
@property (nonatomic, assign) CGPoint sprite4position;
@property (nonatomic, assign) CGPoint sprite5position;
@property (nonatomic, assign) CGPoint sprite6position;
@property (nonatomic, assign) CGPoint sprite7position;
@property (nonatomic, assign) CGPoint sprite8position;
@property (nonatomic, assign) CGPoint sprite9position;
@property (nonatomic, assign) CGPoint sprite10position;
@property (nonatomic, assign) CGPoint sprite11position;
@property (nonatomic, assign) CGPoint sprite12position;
@property (nonatomic, assign) CGPoint sprite13position;
@property (nonatomic, assign) CGPoint sprite14position;
@property (nonatomic, assign) CGPoint sprite15position;
@property (nonatomic, assign) CGPoint sprite16position;
@property (nonatomic, assign) CGPoint sprite17position;
@property (nonatomic, assign) CGPoint sprite18position;
@property (nonatomic, assign) CGPoint sprite19position;
@property (nonatomic, assign) CGPoint sprite20position;
@property (nonatomic, assign) CGPoint sprite21position;
@property (nonatomic, assign) CGPoint sprite22position;
@property (nonatomic, assign) CGPoint sprite23position;
@property (nonatomic, assign) CGPoint sprite24position;
@property (nonatomic, assign) CGPoint sprite25position;
@property (nonatomic, assign) CGPoint sprite26position;
@property (nonatomic, assign) CGPoint sprite27position;

@property (nonatomic, assign) int sprite1_Orientation;
@property (nonatomic, assign) int sprite2_Orientation;
@property (nonatomic, assign) int sprite3_Orientation;
@property (nonatomic, assign) int sprite4_Orientation;
@property (nonatomic, assign) int sprite5_Orientation;
@property (nonatomic, assign) int sprite6_Orientation;
@property (nonatomic, assign) int sprite7_Orientation;
@property (nonatomic, assign) int sprite8_Orientation;
@property (nonatomic, assign) int sprite9_Orientation;
@property (nonatomic, assign) int sprite10_Orientation;
@property (nonatomic, assign) int sprite11_Orientation;
@property (nonatomic, assign) int sprite12_Orientation;
@property (nonatomic, assign) int sprite13_Orientation;
@property (nonatomic, assign) int sprite14_Orientation;
@property (nonatomic, assign) int sprite15_Orientation;
@property (nonatomic, assign) int sprite16_Orientation;
@property (nonatomic, assign) int sprite17_Orientation;
@property (nonatomic, assign) int sprite18_Orientation;
@property (nonatomic, assign) int sprite19_Orientation;
@property (nonatomic, assign) int sprite20_Orientation;
@property (nonatomic, assign) int sprite21_Orientation;
@property (nonatomic, assign) int sprite22_Orientation;
@property (nonatomic, assign) int sprite23_Orientation;
@property (nonatomic, assign) int sprite24_Orientation;
@property (nonatomic, assign) int sprite25_Orientation;
@property (nonatomic, assign) int sprite26_Orientation;
@property (nonatomic, assign) int sprite27_Orientation;




// PL2 things

@property (nonatomic, assign) CGPoint sprite30position;
@property (nonatomic, assign) CGPoint sprite31position;
@property (nonatomic, assign) CGPoint sprite32position;
@property (nonatomic, assign) CGPoint sprite33position;
@property (nonatomic, assign) CGPoint sprite34position;
@property (nonatomic, assign) CGPoint sprite35position;
@property (nonatomic, assign) CGPoint sprite36position;
@property (nonatomic, assign) CGPoint sprite37position;
@property (nonatomic, assign) CGPoint sprite38position;
@property (nonatomic, assign) CGPoint sprite39position;
@property (nonatomic, assign) CGPoint sprite40position;
@property (nonatomic, assign) CGPoint sprite41position;
@property (nonatomic, assign) CGPoint sprite42position;
@property (nonatomic, assign) CGPoint sprite43position;
@property (nonatomic, assign) CGPoint sprite44position;
@property (nonatomic, assign) CGPoint sprite45position;
@property (nonatomic, assign) CGPoint sprite46position;
@property (nonatomic, assign) CGPoint sprite47position;
@property (nonatomic, assign) CGPoint sprite48position;
@property (nonatomic, assign) CGPoint sprite49position;
@property (nonatomic, assign) CGPoint sprite50position;
@property (nonatomic, assign) CGPoint sprite51position;
@property (nonatomic, assign) CGPoint sprite52position;
@property (nonatomic, assign) CGPoint sprite53position;


@property (nonatomic, assign) int sprite30_Orientation;
@property (nonatomic, assign) int sprite31_Orientation;
@property (nonatomic, assign) int sprite32_Orientation;
@property (nonatomic, assign) int sprite33_Orientation;
@property (nonatomic, assign) int sprite34_Orientation;
@property (nonatomic, assign) int sprite35_Orientation;
@property (nonatomic, assign) int sprite36_Orientation;
@property (nonatomic, assign) int sprite37_Orientation;
@property (nonatomic, assign) int sprite38_Orientation;
@property (nonatomic, assign) int sprite39_Orientation;
@property (nonatomic, assign) int sprite40_Orientation;
@property (nonatomic, assign) int sprite41_Orientation;
@property (nonatomic, assign) int sprite42_Orientation;
@property (nonatomic, assign) int sprite43_Orientation;
@property (nonatomic, assign) int sprite44_Orientation;
@property (nonatomic, assign) int sprite45_Orientation;
@property (nonatomic, assign) int sprite46_Orientation;
@property (nonatomic, assign) int sprite47_Orientation;
@property (nonatomic, assign) int sprite48_Orientation;
@property (nonatomic, assign) int sprite49_Orientation;
@property (nonatomic, assign) int sprite50_Orientation;
@property (nonatomic, assign) int sprite51_Orientation;
@property (nonatomic, assign) int sprite52_Orientation;
@property (nonatomic, assign) int sprite53_Orientation;


//PL 3



@property (nonatomic, assign) CGPoint sprite61position;
@property (nonatomic, assign) CGPoint sprite62position;
@property (nonatomic, assign) CGPoint sprite63position;
@property (nonatomic, assign) CGPoint sprite64position;
@property (nonatomic, assign) CGPoint sprite65position;
@property (nonatomic, assign) CGPoint sprite66position;
@property (nonatomic, assign) CGPoint sprite67position;
@property (nonatomic, assign) CGPoint sprite68position;
@property (nonatomic, assign) CGPoint sprite69position;
@property (nonatomic, assign) CGPoint sprite70position;
@property (nonatomic, assign) CGPoint sprite71position;
@property (nonatomic, assign) CGPoint sprite72position;
@property (nonatomic, assign) CGPoint sprite73position;
@property (nonatomic, assign) CGPoint sprite74position;
@property (nonatomic, assign) CGPoint sprite75position;
@property (nonatomic, assign) CGPoint sprite76position;

@property (nonatomic, assign) int sprite61_Orientation;
@property (nonatomic, assign) int sprite62_Orientation;
@property (nonatomic, assign) int sprite63_Orientation;
@property (nonatomic, assign) int sprite64_Orientation;
@property (nonatomic, assign) int sprite65_Orientation;
@property (nonatomic, assign) int sprite66_Orientation;
@property (nonatomic, assign) int sprite67_Orientation;
@property (nonatomic, assign) int sprite68_Orientation;
@property (nonatomic, assign) int sprite69_Orientation;
@property (nonatomic, assign) int sprite70_Orientation;
@property (nonatomic, assign) int sprite71_Orientation;
@property (nonatomic, assign) int sprite72_Orientation;
@property (nonatomic, assign) int sprite73_Orientation;
@property (nonatomic, assign) int sprite74_Orientation;
@property (nonatomic, assign) int sprite75_Orientation;
@property (nonatomic, assign) int sprite76_Orientation;

//PL4

@property (nonatomic, assign) CGPoint sprite81position;
@property (nonatomic, assign) CGPoint sprite82position;
@property (nonatomic, assign) CGPoint sprite83position;
@property (nonatomic, assign) CGPoint sprite84position;
@property (nonatomic, assign) CGPoint sprite85position;
@property (nonatomic, assign) CGPoint sprite86position;
@property (nonatomic, assign) CGPoint sprite87position;
@property (nonatomic, assign) CGPoint sprite88position;
@property (nonatomic, assign) CGPoint sprite89position;
@property (nonatomic, assign) CGPoint sprite90position;
@property (nonatomic, assign) CGPoint sprite91position;
@property (nonatomic, assign) CGPoint sprite92position;
@property (nonatomic, assign) CGPoint sprite93position;
@property (nonatomic, assign) CGPoint sprite94position;
@property (nonatomic, assign) CGPoint sprite95position;
@property (nonatomic, assign) CGPoint sprite96position;
@property (nonatomic, assign) CGPoint sprite97position;
@property (nonatomic, assign) CGPoint sprite98position;
@property (nonatomic, assign) CGPoint sprite99position;
@property (nonatomic, assign) CGPoint sprite100position;
@property (nonatomic, assign) CGPoint sprite101position;
@property (nonatomic, assign) CGPoint sprite102position;
@property (nonatomic, assign) CGPoint sprite103position;
@property (nonatomic, assign) CGPoint sprite104position;

@property (nonatomic, assign) int sprite81_Orientation;
@property (nonatomic, assign) int sprite82_Orientation;
@property (nonatomic, assign) int sprite83_Orientation;
@property (nonatomic, assign) int sprite84_Orientation;
@property (nonatomic, assign) int sprite85_Orientation;
@property (nonatomic, assign) int sprite86_Orientation;
@property (nonatomic, assign) int sprite87_Orientation;
@property (nonatomic, assign) int sprite88_Orientation;
@property (nonatomic, assign) int sprite89_Orientation;
@property (nonatomic, assign) int sprite90_Orientation;
@property (nonatomic, assign) int sprite91_Orientation;
@property (nonatomic, assign) int sprite92_Orientation;
@property (nonatomic, assign) int sprite93_Orientation;
@property (nonatomic, assign) int sprite94_Orientation;
@property (nonatomic, assign) int sprite95_Orientation;
@property (nonatomic, assign) int sprite96_Orientation;
@property (nonatomic, assign) int sprite97_Orientation;
@property (nonatomic, assign) int sprite98_Orientation;
@property (nonatomic, assign) int sprite99_Orientation;
@property (nonatomic, assign) int sprite100_Orientation;
@property (nonatomic, assign) int sprite101_Orientation;
@property (nonatomic, assign) int sprite102_Orientation;
@property (nonatomic, assign) int sprite103_Orientation;
@property (nonatomic, assign) int sprite104_Orientation;


@property (nonatomic, assign) CGPoint sprite111position;
@property (nonatomic, assign) CGPoint sprite112position;
@property (nonatomic, assign) CGPoint sprite113position;
@property (nonatomic, assign) CGPoint sprite114position;
@property (nonatomic, assign) CGPoint sprite115position;
@property (nonatomic, assign) CGPoint sprite116position;
@property (nonatomic, assign) CGPoint sprite117position;
@property (nonatomic, assign) CGPoint sprite118position;
@property (nonatomic, assign) CGPoint sprite119position;

@property (nonatomic, assign) int sprite111_Orientation;
@property (nonatomic, assign) int sprite112_Orientation;
@property (nonatomic, assign) int sprite113_Orientation;
@property (nonatomic, assign) int sprite114_Orientation;
@property (nonatomic, assign) int sprite115_Orientation;
@property (nonatomic, assign) int sprite116_Orientation;
@property (nonatomic, assign) int sprite117_Orientation;
@property (nonatomic, assign) int sprite118_Orientation;
@property (nonatomic, assign) int sprite119_Orientation;

@property (nonatomic, assign) CGPoint sprite120position;
@property (nonatomic, assign) CGPoint sprite121position;
@property (nonatomic, assign) CGPoint sprite122position;
@property (nonatomic, assign) CGPoint sprite123position;
@property (nonatomic, assign) CGPoint sprite124position;
@property (nonatomic, assign) CGPoint sprite125position;
@property (nonatomic, assign) CGPoint sprite126position;
@property (nonatomic, assign) CGPoint sprite127position;
@property (nonatomic, assign) CGPoint sprite128position;
@property (nonatomic, assign) CGPoint sprite129position;

@property (nonatomic, assign) int sprite120_Orientation;
@property (nonatomic, assign) int sprite121_Orientation;
@property (nonatomic, assign) int sprite122_Orientation;
@property (nonatomic, assign) int sprite123_Orientation;
@property (nonatomic, assign) int sprite124_Orientation;
@property (nonatomic, assign) int sprite125_Orientation;
@property (nonatomic, assign) int sprite126_Orientation;
@property (nonatomic, assign) int sprite127_Orientation;
@property (nonatomic, assign) int sprite128_Orientation;
@property (nonatomic, assign) int sprite129_Orientation;

@property (nonatomic, assign) CGPoint sprite130position;
@property (nonatomic, assign) int sprite130_Orientation;

@property (nonatomic, assign) int heroOrientation;
@property (nonatomic, assign) int gold;
@property (nonatomic, copy) NSArray* heroInventory;


 // Hero's Stats

@property (nonatomic, assign) int heroLvl;

@property (nonatomic, assign) int heroStr;
@property (nonatomic, assign) int heroStrDef;

@property (nonatomic, assign) int heroHP;
@property (nonatomic, assign) int heroSPD;

@property (nonatomic, assign) int heroCurrentHP;

 
@property (nonatomic, assign) int exp;
@property (nonatomic, assign) int freePoints;
@property (nonatomic, assign) int attributePoints;

// a bunch of bool properties for different attributes unlocked
// and ints

@property (nonatomic, assign) double attribStrMult;
@property (nonatomic, assign) double attribDefMult;
@property (nonatomic, assign) double attribAgiMult;

@property double attribGoldMult;
@property double attribExpMult;


// ^Also possible multipliers to weaken the enemy... (later)




@property BOOL attrib1; // Str * 1.1
@property BOOL attrib2; // Str * 1.3
@property BOOL attrib3; // Str * 1.6
@property BOOL attrib4; // 30% Crit. Hit (Str * 2.2)
@property BOOL attrib5; // Def * 1.1
@property BOOL attrib6; // Def * 1.3
@property BOOL attrib7; // Mag Def * 1.3
@property BOOL attrib8; // Def * 1.6, Mag Def * 1.6
@property BOOL attrib9; // Defense wears down enemy, decreases str/speed during battle
@property BOOL attrib10; // Agil * 1.1
@property BOOL attrib11; // Agil * 1.3
@property BOOL attrib12; // Agil * 1.5
@property BOOL attrib13; // Agil * 1.8
@property BOOL attrib14; // 40% chance of hitting twice
@property BOOL attrib15; // Exp * 1.2
@property BOOL attrib16; // Gold * 1.2
@property BOOL attrib17; // Gold * 1.5
@property BOOL attrib18; // Exp * 1.5
@property BOOL attrib19; // Regen health while walking around





// what items are equipped where

@property BOOL itemInPos1;
@property BOOL itemInPos2;
@property BOOL itemInPos3;
@property BOOL itemInPos4;
@property BOOL itemInPos5;
@property BOOL itemInPos6;

@property (nonatomic, retain) Item *equipPos1; // main weapon
@property (nonatomic, retain) Item *equipPos2; // shield / secondary weapon thing
@property (nonatomic, retain) Item *equipPos3; // helm
@property (nonatomic, retain) Item *equipPos4; // body armor
@property (nonatomic, retain) Item *equipPos5; // amulet / necklace
@property (nonatomic, retain) Item *equipPos6; // legwear



 
@property (nonatomic, assign) int strBonus;
@property (nonatomic, assign) double strMult;
@property (nonatomic, assign) int defBonus;
@property (nonatomic, assign) double defMult;
@property (nonatomic, assign) int aglBonus;
@property (nonatomic, assign) double aglMult;
 
 
@property int heroAtkStyle;



@property (nonatomic, assign) double itemGoldMult;
@property (nonatomic, assign) double itemExpMult;


@property int musicCode;



@end
