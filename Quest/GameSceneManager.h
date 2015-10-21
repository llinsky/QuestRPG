//
//  GameSceneManager.h
//  Quest
//
//  Created by Leo Linsky on 3/17/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "cocos2d.h"
#import "MyHero.h"

//This will actually just be a singleton with all the game's information

@interface GameSceneManager : NSObject <NSCoding>



{
    
    MyHero* _hero;
    

   // @public
    //CCScene *currentPlayScene;
}


+ (GameSceneManager*) sharedGameSceneManager;

+ (void) setGameSceneManager:(GameSceneManager*)singleton;





@property (atomic, retain) MyHero* hero;

@property BOOL justDied;


@property BOOL foundSavedGameData;
@property BOOL menuMusic;

//settings
@property BOOL usingVirtualControlPad;
@property int textSpeed;
@property double musicVolume;
@property double soundVolume;

@property BOOL saveFile;


@end
