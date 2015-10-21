//
//  OptionsLayer.m
//  Quest
//
//  Created by Leo Linsky on 3/17/12.
//  Copyright 2012 __MyCompanyName__. All rights reserved.
//

#import "OptionsLayer.h"
#import "GameSceneManager.h"


@implementation OptionsLayer

static BOOL musicMuted = FALSE;
static BOOL soundMuted = FALSE;
static int prevMusicLevel;
static int prevSoundLevel;

@synthesize soundSlider = _soundSlider;
@synthesize musicSlider = _musicSlider;
@synthesize musicBtn, soundBtn;
//@synthesize prevMusicLevel, prevSoundLevel;

- (id) init
{
    self = [super init];
    if (self != nil) {
		
		CGSize size = [[CCDirector sharedDirector] winSize];
		CCSprite *background = [CCSprite spriteWithFile:@"menu_background.png"];
		background.position = ccp(size.width/2, size.height/2);
		[self addChild:background];
		
		self.musicBtn = [CCMenuItemToggle itemWithTarget:self selector:@selector(onMusicClick:) items:
									  [CCMenuItemImage itemFromNormalImage:@"music_button.png" selectedImage:@"music_button_down.png"],
									  [CCMenuItemImage itemFromNormalImage:@"music_button_down.png" selectedImage:@"music_button.png"],
									  nil];
		musicBtn.position = ccp(size.width/2 - 165, size.height/2 + 40);
		if (!musicMuted) {
            [musicBtn setSelectedIndex:0];
        }else{
            [musicBtn setSelectedIndex:1];
        }
    
		// Sound on/off button
		self.soundBtn = [CCMenuItemToggle itemWithTarget:self selector:@selector(onSoundClick:) items:
									  [CCMenuItemImage itemFromNormalImage:@"sound_button.png" selectedImage:@"sound_button_down.png"],
									  [CCMenuItemImage itemFromNormalImage:@"sound_button_down.png" selectedImage:@"sound_button.png"],
									  nil];
		soundBtn.position = ccp(size.width/2 - 165, size.height/2);
		if (!soundMuted) {
            [soundBtn setSelectedIndex:0];
        }else{
            [soundBtn setSelectedIndex:1];
        }
        
        
        
		SimpleAudioEngine *sae = [SimpleAudioEngine sharedEngine];
		
		// Music slider
		self.musicSlider = [CCMenuItemSlider itemFromTrackImage: @"slider_bar.png" knobImage: @"slider_knob.png" target:self selector: @selector(onMusicSlide:)];
		self.musicSlider.minValue = 0;
		self.musicSlider.maxValue = 100;
		self.musicSlider.value = floor([GameSceneManager sharedGameSceneManager].hero.musicVolume*100.0); // floor(sae.backgroundMusicVolume * 100);
		self.musicSlider.position = ccp(size.width/2 + 45, size.height/2 + 40);
		
		// Sound slider
		self.soundSlider = [CCMenuItemSlider itemFromTrackImage: @"slider_bar.png" knobImage: @"slider_knob.png" target:self selector: @selector(onSoundSlide:)];
		self.soundSlider.minValue = 0;
		self.soundSlider.maxValue = 100;
		self.soundSlider.value = floor([GameSceneManager sharedGameSceneManager].hero.soundVolume*100.0); //floor(sae.effectsVolume * 100);
		self.soundSlider.position = ccp(size.width/2 + 45, size.height/2);
		
		// Back
		CCMenuItemSprite *backBtn = [CCMenuItemImage itemFromNormalImage:@"back_button.png" selectedImage:@"back_button_down.png" target:self selector:@selector(onBackClick:)];
		backBtn.position = ccp(size.width - 60, 25);
		
		
		CCMenu *menu = [CCMenu menuWithItems:
						musicBtn, self.musicSlider, 
						soundBtn, self.soundSlider,
						backBtn,
					    nil];
		
        menu.position = ccp(0,0);
		[self addChild:menu];
        
        
        
        
        
        
        _plusItem = [[CCMenuItemImage itemFromNormalImage:@"ButtonPlus.png" 
                                            selectedImage:@"ButtonPlusSel.png" target:nil selector:nil] retain];
        _minusItem = [[CCMenuItemImage itemFromNormalImage:@"ButtonMinus.png" 
                                             selectedImage:@"ButtonMinusSel.png" target:nil selector:nil] retain];
        CCMenuItemToggle *toggleItem = [CCMenuItemToggle itemWithTarget:self 
                                                               selector:@selector(plusMinusButtonTapped:) items:_plusItem, _minusItem, nil];
        CCMenu *toggleMenu = [CCMenu menuWithItems:toggleItem, nil];
        toggleMenu.position = ccp(60, 120);
        if ([GameSceneManager sharedGameSceneManager].usingVirtualControlPad)
        {
            [toggleItem setSelectedIndex:0];
        }
        else
        {
            [toggleItem setSelectedIndex:1];
        }
        
        [self addChild:toggleMenu z:INT_MAX];
        
        
        
        
    }
    return self;
}

- (void)onMusicSlide:(id)sender
{
    CCMenuItemSlider* slider = (CCMenuItemSlider*)sender;
	[SimpleAudioEngine sharedEngine].backgroundMusicVolume = (slider.value / 100.0);
    if (slider.value == 0) {
        musicMuted = TRUE;
        [self.musicBtn setSelectedIndex:1];
    }else{
        musicMuted = FALSE;
        [self.musicBtn setSelectedIndex:0];
    }
    
    [GameSceneManager sharedGameSceneManager].hero.musicVolume = (slider.value/100.0);
}

- (void)onMusicClick:(id)sender
{
	[MusicHandler playButtonClick];
    
    if ([sender selectedIndex] == 1) {
		//button in off state, mute music
        prevMusicLevel = self.musicSlider.value;
		self.musicSlider.value = 0;
		[SimpleAudioEngine sharedEngine].backgroundMusicVolume = 0;
        musicMuted = TRUE;
	}else {
		//button in on state, return to previous level
        self.musicSlider.value = prevMusicLevel;
        [SimpleAudioEngine sharedEngine].backgroundMusicVolume = ((float)prevMusicLevel / 100);
        musicMuted = FALSE;
	}
    
}

- (void)onSoundSlide:(id)sender
{
    CCMenuItemSlider* slider = (CCMenuItemSlider*)sender;
	[SimpleAudioEngine sharedEngine].effectsVolume = (slider.value / 100.0);
    if (slider.value == 0) {
        soundMuted = TRUE;
        [self.soundBtn setSelectedIndex:1];
    }else{
        soundMuted = FALSE;
        [self.soundBtn setSelectedIndex:0];
    }
    
    [GameSceneManager sharedGameSceneManager].hero.soundVolume = (slider.value/100.0);
}

- (void)onSoundClick:(id)sender
{
	[MusicHandler playButtonClick];

    if ([sender selectedIndex] == 1) {
		//button in off state, mute music
        prevSoundLevel = self.soundSlider.value;
		self.soundSlider.value = 0;
		[SimpleAudioEngine sharedEngine].effectsVolume = 0;
        soundMuted = TRUE;
	}else {
		//button in on state, return to previous level
        self.soundSlider.value = prevSoundLevel;
        [SimpleAudioEngine sharedEngine].effectsVolume = ((float)prevSoundLevel / 100);
        soundMuted = FALSE;
	}
}

- (void)onBackClick:(id)sender
{
	[MusicHandler playButtonClick];
	[SceneManager goMenu];
}



- (void)plusMinusButtonTapped:(id)sender {  
    CCMenuItemToggle *toggleItem = (CCMenuItemToggle *)sender;
    if (toggleItem.selectedItem == _plusItem) {
        [GameSceneManager sharedGameSceneManager].usingVirtualControlPad = YES;
    } else if (toggleItem.selectedItem == _minusItem) {
        [GameSceneManager sharedGameSceneManager].usingVirtualControlPad = NO;
    }  
}





-(void)dealloc
{
    [_plusItem release];
    _plusItem = nil;
    [_minusItem release];
    _minusItem = nil;
    [super dealloc];
}

@end