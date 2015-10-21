//
//  LoadLayer.m
//  Quest
//
//  Created by Leo Linsky on 1/2/15.
//
//

#import "LoadLayer.h"
#import "GameSceneManager.h"

@implementation LoadLayer


-(id) init
{
    
    if ((self = [super init])) {
        
        //CGSize winSize = [[CCDirector sharedDirector] winSize];
        
        //open playlayer that corresponds to saved game, or PL1
        
        //put a white partially translucent image above it, and maybe add some smokey or foggy effects
        
        //add the usual buttons with the usual functions
        
        /*
        CCSprite *background = [CCSprite spriteWithFile:@"menu_back_semi_trans.png"];
        background.position = ccp(winSize.width/2, winSize.height/2);
        [self addChild:background];
        */
        
        NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
        
        NSData *archivedObject = [defaults objectForKey:@"savedGame"];
        GameSceneManager *loadedFile = (GameSceneManager *)[NSKeyedUnarchiver unarchiveObjectWithData:archivedObject];
        
        if (loadedFile.saveFile)
        {
            [GameSceneManager setGameSceneManager:loadedFile];
            [GameSceneManager sharedGameSceneManager].foundSavedGameData = true;
        }
        
        
        [self performSelector:@selector(loadMenu) withObject:nil afterDelay:1.0];
         
         }
    
    return self;
}

-(void)loadMenu
{
    [SceneManager goMenu];
}

@end
