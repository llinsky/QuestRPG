//
//  MyHero.m
//  Quest
//
//  Created by Leo Linsky on 5/18/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "MyHero.h"

@implementation MyHero

@synthesize beatBoss1, freeSteps,wentEllemakPostSaveKing,wentEllemakPostBeatIonak;
@synthesize gotItem1,gotItem2,gotItem3,gotItem4,gotItem5,gotItem6,gotItem7,gotItem8,gotItem9,gotItem10,gotItem11,gotItem12,gotItem13,gotItem14,gotItem15,gotItem16,gotItem17,gotItem18,gotItem19,gotItem20,gotLorica,gotItem21,gotItem22,gotItem23,gotItem24,gotItem25,gotItem26,gotItem27,gotItem28,gotItem29,gotItem30,gotItem31,gotItem32,gotItem33,gotItem34,gotItem35,gotItem36,gotItem37,gotItem38,gotItem39,gotItem40,gotItem41,gotItem42,gotItem43,gotItem44,gotItem45,gotItem46,gotItem47,gotItem48,gotItem49,gotItem50,gotItem51,gotItem52,gotItem53,gotItem54,gotItem55,gotItem56,gotItem57,gotItem58;
@synthesize introducedToKingV, gotOrb, killedBugs;
@synthesize beatIonak,acceptedMessageKingK,acceptedTaskTraveler,acceptedFindEilifKingV,acceptedTaskKingVPostOrb,deliveredLetterToKingK,hasLitOrb,toldNewsKingV,talkedToKingVInitial,talkedToKingVPostOrb,finishedTaskTraveler;
@synthesize beatDragon,beatCyclops,beatCaveBoss,talkedToArnuk,talkedToEilif,savedKing;
@synthesize gotPrizeFromKingV,gotRepellent;
@synthesize sprite1position;
@synthesize heroAtkStyle,gotFireRoot;
@synthesize talkedToEilifPostBoss;
@synthesize talkedToWatchmen,usedBook;
@synthesize attribGoldMult,attribExpMult;


@synthesize heroCurrentHP;
@synthesize gold, exp, heroHP, heroStr, defBonus, heroName, position, strBonus, currentMap, freePoints, heroSkills, heroStrDef, heroInventory, heroOrientation, heroLvl;
@synthesize heroSPD;
@synthesize attributePoints;

@synthesize aglBonus, defMult, strMult, aglMult;

@synthesize equipPos1,equipPos2,equipPos3,equipPos4,equipPos5,equipPos6;

@synthesize attrib1,attrib2,attrib3,attrib4,attrib5,attrib6,attrib7,attrib8,attrib9,attrib10,attrib11,attrib12,attrib13,attrib14,attrib15,attrib16,attrib17,attrib18,attrib19;

@synthesize attribAgiMult,attribDefMult,attribStrMult;

@synthesize itemInPos1,itemInPos2,itemInPos3,itemInPos4,itemInPos5,itemInPos6;

@synthesize itemExpMult;
@synthesize itemGoldMult;

@synthesize mapInitMode;
@synthesize musicCode;

@synthesize sprite2position,sprite3position,sprite4position,sprite5position,sprite6position,sprite7position,sprite8position,sprite9position,sprite10position,sprite11position,sprite12position,sprite13position,sprite14position,sprite15position,sprite16position,sprite17position,sprite18position,sprite19position,sprite20position,sprite21position,sprite22position,sprite23position,sprite24position,sprite25position,sprite26position,sprite27position;

@synthesize sprite1_Orientation,sprite2_Orientation,sprite3_Orientation,sprite4_Orientation,sprite5_Orientation,sprite6_Orientation,sprite7_Orientation,sprite8_Orientation,sprite9_Orientation,sprite10_Orientation,sprite11_Orientation,sprite12_Orientation,sprite13_Orientation,sprite14_Orientation,sprite15_Orientation,sprite16_Orientation,sprite17_Orientation,sprite18_Orientation,sprite19_Orientation,sprite20_Orientation,sprite21_Orientation,sprite22_Orientation,sprite23_Orientation,sprite24_Orientation,sprite25_Orientation,sprite26_Orientation,sprite27_Orientation;

@synthesize sprite30_Orientation,sprite30position,sprite31_Orientation,sprite31position,sprite32_Orientation,sprite32position,sprite33_Orientation,sprite33position,sprite34_Orientation,sprite34position,sprite35_Orientation,sprite35position,sprite36_Orientation,sprite36position,sprite37_Orientation,sprite37position,sprite38_Orientation,sprite38position,sprite39_Orientation,sprite39position,sprite40_Orientation,sprite40position,sprite41_Orientation,sprite41position,sprite42_Orientation,sprite42position,sprite43_Orientation,sprite43position,sprite44_Orientation,sprite44position,sprite45_Orientation,sprite45position,sprite46_Orientation,sprite46position,sprite47_Orientation,sprite47position,sprite48_Orientation,sprite48position,sprite49_Orientation,sprite49position,sprite50_Orientation,sprite50position,sprite51_Orientation,sprite51position,sprite52_Orientation,sprite52position,sprite53_Orientation,sprite53position;

@synthesize sprite61_Orientation,sprite61position,sprite62_Orientation,sprite62position,sprite63_Orientation,sprite63position,sprite64_Orientation,sprite64position,sprite65_Orientation,sprite65position,sprite66_Orientation,sprite66position,sprite67_Orientation,sprite67position,sprite68_Orientation,sprite68position,sprite69_Orientation,sprite69position,sprite70_Orientation,sprite70position,sprite71_Orientation,sprite71position,sprite72_Orientation,sprite72position,sprite73_Orientation,sprite73position,sprite74_Orientation,sprite74position,sprite75_Orientation,sprite75position,sprite76_Orientation,sprite76position;

@synthesize beatVank,beatTitan,beatVodek,beatCaveTroll,beatIceGolem1,beatIceGolem2,beatIceGolem3,beatSunDragon;
@synthesize beatTowerKeeper, gotEarthSword;

@synthesize beatTraveler,sprite100_Orientation,sprite100position,sprite101_Orientation,sprite101position,sprite102_Orientation,sprite102position,sprite103_Orientation,sprite103position,sprite104_Orientation,sprite104position,sprite81_Orientation,sprite81position,sprite82_Orientation,sprite82position,sprite83_Orientation,sprite83position,sprite84_Orientation,sprite84position,sprite85_Orientation,sprite85position,sprite86_Orientation,sprite86position,sprite87_Orientation,sprite87position,sprite88_Orientation,sprite88position,sprite89_Orientation,sprite89position,sprite90_Orientation,sprite90position,sprite91_Orientation,sprite91position,sprite92_Orientation,sprite92position,sprite93_Orientation,sprite93position,sprite94_Orientation,sprite94position,sprite95_Orientation,sprite95position,sprite96_Orientation,sprite96position,sprite97_Orientation,sprite97position,sprite98_Orientation,sprite98position,sprite99_Orientation,sprite99position;

@synthesize sprite111_Orientation,sprite111position,sprite112_Orientation,sprite112position,sprite113_Orientation,sprite113position,sprite114_Orientation,sprite114position,sprite115_Orientation,sprite115position,sprite116_Orientation,sprite116position,sprite117_Orientation,sprite117position,sprite118_Orientation,sprite118position,sprite119_Orientation,sprite119position;

@synthesize sprite120_Orientation,sprite120position,sprite121_Orientation,sprite121position,sprite122_Orientation,sprite122position,sprite123_Orientation,sprite123position,sprite124_Orientation,sprite124position,sprite125_Orientation,sprite125position,sprite126_Orientation,sprite126position,sprite127_Orientation,sprite127position,sprite128_Orientation,sprite128position,sprite129_Orientation,sprite129position,sprite130_Orientation,sprite130position;

@synthesize gotItem59,gotItem60,gotItem61,gotItem62,gotItem63;

@synthesize isRainingPL1,isRainingPL3,isRainingPL4,isSnowingPL6;

@synthesize musicVolume,soundVolume;

- (id)init {
    self = [super init];
    if (self) {
        
        self.musicVolume = 1;
        self.soundVolume = 1;
        //Do Nothing
        
        //Let GameSceneManager initialize Hero
    }
    return self;
}


@end




