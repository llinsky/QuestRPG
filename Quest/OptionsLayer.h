//
//  OptionsLayer.h
//  Quest
//
//  Created by Leo Linsky on 3/17/12.
//  Copyright 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "cocos2d.h"
#import "CCMenuItemSlider.h"
#import "SceneManager.h"
#import "MusicHandler.h"
#import "SimpleAudioEngine.h"

@interface OptionsLayer : CCLayer {
	CCMenuItemSlider *_musicSlider;
	CCMenuItemSlider *_soundSlider;
    
    CCMenuItemToggle *musicBtn;
    CCMenuItemToggle *soundBtn;
    
    CCMenuItem *_plusItem; //d-Pad
    CCMenuItem *_minusItem; //manual (default)
    
	//int prevMusicLevel;
	//int prevSoundLevel;
}

@property (nonatomic, retain) CCMenuItemToggle *musicBtn;
@property (nonatomic, retain) CCMenuItemToggle *soundBtn;

@property (nonatomic, retain) CCMenuItemSlider *musicSlider;
@property (nonatomic, retain) CCMenuItemSlider *soundSlider;
//@property int prevMusicLevel;
//@property int prevSoundLevel;

- (id) init;
- (void) onMusicClick:(id)sender;
- (void) onMusicSlide:(id)sender;
- (void) onSoundClick:(id)sender;
- (void) onSoundSlide:(id)sender;
- (void)onBackClick:(id)sender;

@end