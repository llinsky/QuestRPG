//
//  DisplayAttributes.h
//  Quest
//
//  Created by Leo Linsky on 7/21/12.
//  Copyright 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "cocos2d.h"
#import "MyHero.h"
#import "GameSceneManager.h"
#import "MusicHandler.h"
#import "DisplayAttribDetails.h"


@interface DisplayAttributes : CCLayer {
    CCMenuItemImage *attrib01;
    CCMenuItemImage *attrib02;
    CCMenuItemImage *attrib03;
    CCMenuItemImage *attrib04;
    CCMenuItemImage *attrib05;
    CCMenuItemImage *attrib06;
    CCMenuItemImage *attrib07;
    CCMenuItemImage *attrib08;
    CCMenuItemImage *attrib09;
    CCMenuItemImage *attrib10;
    CCMenuItemImage *attrib11;
    CCMenuItemImage *attrib12;
    CCMenuItemImage *attrib13;
    CCMenuItemImage *attrib14;
    CCMenuItemImage *attrib15;
    CCMenuItemImage *attrib16;
    CCMenuItemImage *attrib17;
    CCMenuItemImage *attrib18;
    CCMenuItemImage *attrib19;
    
    DisplayAttribDetails *attributeInfo;
    
}

@property (nonatomic, retain) MyHero *hero;




-(void)onAttrib1;
-(void)onAttrib2;
-(void)onAttrib3;
-(void)onAttrib4;
-(void)onAttrib5;
-(void)onAttrib6;
-(void)onAttrib7;
-(void)onAttrib8;
-(void)onAttrib9;
-(void)onAttrib10;
-(void)onAttrib11;
-(void)onAttrib12;
-(void)onAttrib13;
-(void)onAttrib14;
-(void)onAttrib15;
-(void)onAttrib16;
-(void)onAttrib17;
-(void)onAttrib18;
-(void)onAttrib19;



-(void)update:(int)justUnlocked;

-(void)unlock:(int)attribute;

-(void)exitModal;







@end
















