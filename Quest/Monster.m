//
//  Monster.m
//  Quest
//
//  Created by Leo Linsky on 5/20/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "Monster.h"


#define UNIT_ATK 5
#define UNIT_DEF 4
#define UNIT_AGI 3
#define UNIT_HP 6

@implementation Monster


@synthesize name=_name,imageFile=_imageFile,monsterHP,monsterLvl,monsterMag,monsterStr,monsterRewardGold,monsterSkills=_monsterSkills,monsterStrDef,monsterExperience;
@synthesize monsterSpeed;
@synthesize monsterCurrentHP;
@synthesize isBoss;
@synthesize monsterRewardItem;
@synthesize backgroundImageFile = _backgroundImageFile;

/*
Attack      //str*1.0   //1
Scratch     //str*1.4   //2
Maul        //str*2.0   //3
Bite        //str*1.5   //4
Ram         //str*2.3   //5
Lash        //str*1.2   //6
Slash       //str*2.2   //7
Stab        //str*1.3   //8
Gust        //str*2.8   //9     //magic
Curse       //str*2.5   //10    //magic
Fire        //str*3.5   //11    //magic
Blizzard    //str*3.5   //12    //magic
Heal        //heal      //13    //magic     //heals HP/8 (tentatively)
 */

-(id)initWithCode:(int)code
{
    if (self = [super init])
    {
        int rand = arc4random()%20;
        if (code == 1) {
            if (rand < 12) {
                code = 1;
            } else if (rand < 17) {
                code = 2;
            } else {
                code = 3;
            }
        }
        else if (code == 2) {
            if (rand < 12) {
                code = 1;
            } else if (rand < 17) {
                code = 2;
            } else {
                code = 3;
            }
        }
        
        
        if (code == 0)
        {
            _monsterSkills = [[NSArray alloc] initWithObjects:[NSNumber numberWithDouble:0.6],[NSNumber numberWithDouble:0.2],[NSNumber numberWithDouble:0],[NSNumber numberWithDouble:0.2],[NSNumber numberWithDouble:0],[NSNumber numberWithDouble:0],[NSNumber numberWithDouble:0],[NSNumber numberWithDouble:0],[NSNumber numberWithDouble:0],[NSNumber numberWithDouble:0],[NSNumber numberWithDouble:0],[NSNumber numberWithDouble:0],[NSNumber numberWithDouble:0], nil];
            _backgroundImageFile = @"battleback01.png";
            
            int rando1 = arc4random()%2;
            int rando2 = arc4random()%3;
            
            
            self.monsterRewardGold = rando2;
            _name = @"Imp";
            _imageFile = @"monster1sprite03.png";
            self.monsterStr = 3*UNIT_ATK + rando2;
            self.monsterStrDef = 2*UNIT_DEF + rando2;
            self.monsterSpeed = 2*UNIT_AGI + rando2;
            self.monsterHP = 2*UNIT_HP + rando1 + rando2;
            
            self.monsterLvl = MAX(1,rando2);

            self.monsterExperience = 3 + rando1 + rando2;
            
            self.monsterRewardItem = 0;
            if ((rando1+rando2)==3)
            {
                int rando3 = arc4random()%5;
                if (rando3 == 0)
                {
                    self.monsterRewardItem = 1;
                }
            }
            self.monsterCurrentHP = self.monsterHP;
            self.isBoss = NO;
            
        }
        else if (code == 1)
        {
            _monsterSkills = [[NSArray alloc] initWithObjects:[NSNumber numberWithDouble:1], nil];
            _backgroundImageFile = @"battleback01.png";
            
            int rando1 = arc4random()%2;
            int rando2 = arc4random()%3;
            
            
            self.monsterRewardGold = rando1 + rando2;
            _name = @"Imp";
            _imageFile = @"monster1sprite03.png";
            self.monsterStr = 12 + rando2;
            self.monsterStrDef = 10 + rando2;
            self.monsterMag = 1 + rando2;
            self.monsterSpeed = 14 + rando2;
            
            self.monsterLvl = MAX(1,rando2);
            self.monsterHP = 27 + rando1 + rando2;
            self.monsterExperience = 3 + rando1 + rando2;
            self.monsterRewardItem = 0;
            self.monsterCurrentHP = self.monsterHP;
            self.isBoss = NO;
        }
        else if (code == 2)
        {
            _monsterSkills = [[NSArray alloc] initWithObjects:[NSNumber numberWithDouble:1], nil];
            _backgroundImageFile = @"battleback01.png";
            
            int rando1 = arc4random()%2;
            int rando2 = arc4random()%3;
            
            
            self.monsterRewardGold = rando1 + rando2;
            _name = @"Goblin";
            _imageFile = @"monster2sprite1.png";
            self.monsterStr = 15 + rando2;
            self.monsterStrDef = 12 + rando2;
            self.monsterMag = 1 + rando2;
            self.monsterSpeed = 14 + rando2;
            
            self.monsterLvl = MAX(1,rando2);
            self.monsterHP = 27 + rando1 + rando2;
            self.monsterExperience = 3 + rando1 + rando2;
            self.monsterRewardItem = 0;
            self.monsterCurrentHP = self.monsterHP;
            self.isBoss = NO;
        }
        else if (code == 3)
        {
            _monsterSkills = [[NSArray alloc] initWithObjects:[NSNumber numberWithDouble:1], nil];
            _backgroundImageFile = @"battleback01.png";
            
            int rando1 = arc4random()%2;
            int rando2 = arc4random()%3;
            
            
            self.monsterRewardGold = rando1 + rando2;
            _name = @"Forest Gnome";
            _imageFile = @"monster3sprite1.png";
            self.monsterStr = 15 + rando2;
            self.monsterStrDef = 12 + rando2;
            self.monsterMag = 1 + rando2;
            self.monsterSpeed = 14 + rando2;
            
            self.monsterLvl = MAX(1,rando2);
            self.monsterHP = 27 + rando1 + rando2;
            self.monsterExperience = 3 + rando1 + rando2;
            self.monsterRewardItem = 0;
            self.monsterCurrentHP = self.monsterHP;
            self.isBoss = NO;
        }
        else if (code == 4)
        {
            _monsterSkills = [[NSArray alloc] initWithObjects:[NSNumber numberWithDouble:1], nil];
            _backgroundImageFile = @"battleback01.png";
            
            int rando1 = arc4random()%2;
            int rando2 = arc4random()%3;
            
            
            self.monsterRewardGold = rando1 + rando2;
            _name = @"Error";
            _imageFile = @"monster4sprite1.png";
            self.monsterStr = 15 + rando2;
            self.monsterStrDef = 12 + rando2;
            self.monsterMag = 1 + rando2;
            self.monsterSpeed = 14 + rando2;
            
            self.monsterLvl = MAX(1,rando2);
            self.monsterHP = 27 + rando1 + rando2;
            self.monsterExperience = 3 + rando1 + rando2;
            self.monsterRewardItem = 0;
            self.monsterCurrentHP = self.monsterHP;
            self.isBoss = NO;
        }
        else if (code == 5)
        {
            _monsterSkills = [[NSArray alloc] initWithObjects:[NSNumber numberWithDouble:1], nil];
            _backgroundImageFile = @"battleback01.png";
            
            int rando1 = arc4random()%2;
            int rando2 = arc4random()%3;
            
            
            self.monsterRewardGold = rando1 + rando2;
            _name = @"Error";
            _imageFile = @"monster5sprite1.png";
            self.monsterStr = 15 + rando2;
            self.monsterStrDef = 12 + rando2;
            self.monsterMag = 1 + rando2;
            self.monsterSpeed = 14 + rando2;
            
            self.monsterLvl = MAX(1,rando2);
            self.monsterHP = 27 + rando1 + rando2;
            self.monsterExperience = 3 + rando1 + rando2;
            self.monsterRewardItem = 0;
            self.monsterCurrentHP = self.monsterHP;
            self.isBoss = NO;
        }
        else if (code == 6)
        {
            _monsterSkills = [[NSArray alloc] initWithObjects:[NSNumber numberWithDouble:1], nil];
            _backgroundImageFile = @"battleback01.png";
            
            int rando1 = arc4random()%2;
            int rando2 = arc4random()%3;
            
            
            self.monsterRewardGold = rando1 + rando2;
            _name = @"Error";
            _imageFile = @"monster1sprite03.png";
            self.monsterStr = 15 + rando2;
            self.monsterStrDef = 12 + rando2;
            self.monsterMag = 1 + rando2;
            self.monsterSpeed = 14 + rando2;
            
            self.monsterLvl = MAX(1,rando2);
            self.monsterHP = 27 + rando1 + rando2;
            self.monsterExperience = 3 + rando1 + rando2;
            self.monsterRewardItem = 0;
            self.monsterCurrentHP = self.monsterHP;
            self.isBoss = NO;
        }
        else if (code == 7)
        {
            _monsterSkills = [[NSArray alloc] initWithObjects:[NSNumber numberWithDouble:1], nil];
            _backgroundImageFile = @"battleback01.png";
            
            int rando1 = arc4random()%2;
            int rando2 = arc4random()%3;
            
            
            self.monsterRewardGold = rando1 + rando2;
            _name = @"Error";
            _imageFile = @"monster1sprite03.png";
            self.monsterStr = 15 + rando2;
            self.monsterStrDef = 12 + rando2;
            self.monsterMag = 1 + rando2;
            self.monsterSpeed = 14 + rando2;
            
            self.monsterLvl = MAX(1,rando2);
            self.monsterHP = 27 + rando1 + rando2;
            self.monsterExperience = 3 + rando1 + rando2;
            self.monsterRewardItem = 0;
            self.monsterCurrentHP = self.monsterHP;
            self.isBoss = NO;
        }
        else if (code == 8)
        {
            _monsterSkills = [[NSArray alloc] initWithObjects:[NSNumber numberWithDouble:1], nil];
            _backgroundImageFile = @"battleback01.png";
            
            int rando1 = arc4random()%2;
            int rando2 = arc4random()%3;
            
            
            self.monsterRewardGold = rando1 + rando2;
            _name = @"Error";
            _imageFile = @"monster1sprite03.png";
            self.monsterStr = 15 + rando2;
            self.monsterStrDef = 12 + rando2;
            self.monsterMag = 1 + rando2;
            self.monsterSpeed = 14 + rando2;
            
            self.monsterLvl = MAX(1,rando2);
            self.monsterHP = 27 + rando1 + rando2;
            self.monsterExperience = 3 + rando1 + rando2;
            self.monsterRewardItem = 0;
            self.monsterCurrentHP = self.monsterHP;
            self.isBoss = NO;
        }
        else if (code == 9)
        {
            _monsterSkills = [[NSArray alloc] initWithObjects:[NSNumber numberWithDouble:1], nil];
            _backgroundImageFile = @"battleback01.png";
            
            int rando1 = arc4random()%2;
            int rando2 = arc4random()%3;
            
            
            self.monsterRewardGold = rando1 + rando2;
            _name = @"Error";
            _imageFile = @"monster1sprite03.png";
            self.monsterStr = 15 + rando2;
            self.monsterStrDef = 12 + rando2;
            self.monsterMag = 1 + rando2;
            self.monsterSpeed = 14 + rando2;
            
            self.monsterLvl = MAX(1,rando2);
            self.monsterHP = 27 + rando1 + rando2;
            self.monsterExperience = 3 + rando1 + rando2;
            self.monsterRewardItem = 0;
            self.monsterCurrentHP = self.monsterHP;
            self.isBoss = NO;
        }
        else if (code == 10)
        {
            _monsterSkills = [[NSArray alloc] initWithObjects:[NSNumber numberWithDouble:1], nil];
            _backgroundImageFile = @"battleback01.png";
            
            int rando1 = arc4random()%2;
            int rando2 = arc4random()%3;
            
            
            self.monsterRewardGold = rando1 + rando2;
            _name = @"Error";
            _imageFile = @"monster1sprite03.png";
            self.monsterStr = 15 + rando2;
            self.monsterStrDef = 12 + rando2;
            self.monsterMag = 1 + rando2;
            self.monsterSpeed = 14 + rando2;
            
            self.monsterLvl = MAX(1,rando2);
            self.monsterHP = 27 + rando1 + rando2;
            self.monsterExperience = 3 + rando1 + rando2;
            self.monsterRewardItem = 0;
            self.monsterCurrentHP = self.monsterHP;
            self.isBoss = NO;
        }
        else if (code == 11)
        {
            _monsterSkills = [[NSArray alloc] initWithObjects:[NSNumber numberWithDouble:1], nil];
            _backgroundImageFile = @"battleback01.png";
            
            int rando1 = arc4random()%2;
            int rando2 = arc4random()%3;
            
            
            self.monsterRewardGold = rando1 + rando2;
            _name = @"Error";
            _imageFile = @"monster1sprite03.png";
            self.monsterStr = 15 + rando2;
            self.monsterStrDef = 12 + rando2;
            self.monsterMag = 1 + rando2;
            self.monsterSpeed = 14 + rando2;
            
            self.monsterLvl = MAX(1,rando2);
            self.monsterHP = 27 + rando1 + rando2;
            self.monsterExperience = 3 + rando1 + rando2;
            self.monsterRewardItem = 0;
            self.monsterCurrentHP = self.monsterHP;
            self.isBoss = NO;
        }
        else if (code == 12)
        {
            _monsterSkills = [[NSArray alloc] initWithObjects:[NSNumber numberWithDouble:1], nil];
            _backgroundImageFile = @"battleback01.png";
            
            int rando1 = arc4random()%2;
            int rando2 = arc4random()%3;
            
            
            self.monsterRewardGold = rando1 + rando2;
            _name = @"Error";
            _imageFile = @"monster1sprite03.png";
            self.monsterStr = 15 + rando2;
            self.monsterStrDef = 12 + rando2;
            self.monsterMag = 1 + rando2;
            self.monsterSpeed = 14 + rando2;
            
            self.monsterLvl = MAX(1,rando2);
            self.monsterHP = 27 + rando1 + rando2;
            self.monsterExperience = 3 + rando1 + rando2;
            self.monsterRewardItem = 0;
            self.monsterCurrentHP = self.monsterHP;
            self.isBoss = NO;
        }
        else if (code == 13)
        {
            _monsterSkills = [[NSArray alloc] initWithObjects:[NSNumber numberWithDouble:1], nil];
            _backgroundImageFile = @"battleback01.png";
            
            int rando1 = arc4random()%2;
            int rando2 = arc4random()%3;
            
            
            self.monsterRewardGold = rando1 + rando2;
            _name = @"Error";
            _imageFile = @"monster1sprite03.png";
            self.monsterStr = 15 + rando2;
            self.monsterStrDef = 12 + rando2;
            self.monsterMag = 1 + rando2;
            self.monsterSpeed = 14 + rando2;
            
            self.monsterLvl = MAX(1,rando2);
            self.monsterHP = 27 + rando1 + rando2;
            self.monsterExperience = 3 + rando1 + rando2;
            self.monsterRewardItem = 0;
            self.monsterCurrentHP = self.monsterHP;
            self.isBoss = NO;
        }
        
        else if (code == 101)
        {
            _monsterSkills = [[NSArray alloc] initWithObjects:[NSNumber numberWithDouble:1], nil];
            _backgroundImageFile = @"battleback01.png";
            
            int rando1 = arc4random()%2;
            int rando2 = arc4random()%3;
            
            
            self.monsterRewardGold = rando1 + rando2;
            _name = @"Imp Soldier";
            _imageFile = @"monster1sprite03.png";
            self.monsterStr = 15 + rando2;
            self.monsterStrDef = 12 + rando2;
            self.monsterMag = 1 + rando2;
            self.monsterSpeed = 14 + rando2;
            
            self.monsterLvl = MAX(1,rando2);
            self.monsterHP = 27 + rando1 + rando2;
            self.monsterExperience = 3 + rando1 + rando2;
            self.monsterRewardItem = 0;
            self.monsterCurrentHP = self.monsterHP;
            self.isBoss = NO;
        } else if (code == 102)
        {
            _monsterSkills = [[NSArray alloc] initWithObjects:[NSNumber numberWithDouble:1], nil];
            _backgroundImageFile = @"battleback01.png";
            
            int rando1 = arc4random()%2;
            int rando2 = arc4random()%3;
            
            
            self.monsterRewardGold = rando1 + rando2;
            _name = @"Cyclops";
            _imageFile = @"monster1sprite03.png";
            self.monsterStr = 25 + rando2;
            self.monsterStrDef = 16 + rando2;
            self.monsterMag = 1 + rando2;
            self.monsterSpeed = 18 + rando2;
            
            self.monsterLvl = MAX(1,rando2);
            self.monsterHP = 50 + rando1 + rando2;
            self.monsterExperience = 3 + rando1 + rando2;
            self.monsterRewardItem = 0;
            self.monsterCurrentHP = self.monsterHP;
            self.isBoss = NO;
        }
        
        else{
            _monsterSkills = [[NSArray alloc] initWithObjects:[NSNumber numberWithDouble:1], nil];
            _backgroundImageFile = @"battleback01.png";
            
            int rando1 = arc4random()%2;
            int rando2 = arc4random()%3;
            
            
            self.monsterRewardGold = rando1 + rando2;
            _name = @"Error";
            _imageFile = @"monster1sprite03.png";
            self.monsterStr = 15 + rando2;
            self.monsterStrDef = 12 + rando2;
            self.monsterMag = 1 + rando2;
            self.monsterSpeed = 14 + rando2;
            
            self.monsterLvl = MAX(1,rando2);
            self.monsterHP = 27 + rando1 + rando2;
            self.monsterExperience = 3 + rando1 + rando2;
            self.monsterRewardItem = 0;
            self.monsterCurrentHP = self.monsterHP;
            self.isBoss = NO;
            
            NSLog(@"\nERROR ENEMY CODE\n");
        }
        
        
    }
    return self;
}

+(id)monsterWithCode:(int)code
{
    return [[[self alloc] initWithCode:code] autorelease];
}




@end
