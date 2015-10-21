//
//  DisplayAttributes.m
//  Quest
//
//  Created by Leo Linsky on 7/21/12.
//  Copyright 2012 __MyCompanyName__. All rights reserved.
//

#import "DisplayAttributes.h"


@implementation DisplayAttributes

@synthesize hero;

-(void)exitModal
{
    attributeInfo.attribCode = 0;
    [self removeChild:attributeInfo cleanup:YES];
}

-(id)init
{
    if ((self = [super init]))
    {
        CGSize winSize = [[CCDirector sharedDirector] winSize];
        
        self.hero = [GameSceneManager sharedGameSceneManager].hero;
        [hero release];
        
        
        
        attrib01 = [CCMenuItemImage itemFromNormalImage:@"darkattrib1tile.png" selectedImage:@"attrib1tile.png" disabledImage:@"attrib1tile.png" target:self selector:@selector(onAttrib1)];
        CCMenu *menu1 = [CCMenu menuWithItems:attrib01, nil];
        menu1.position = ccp(35,winSize.height - 40);
        [self addChild:menu1 z:5];
        
        attrib05 = [CCMenuItemImage itemFromNormalImage:@"darkattrib5tile.png" selectedImage:@"attrib5tile.png" disabledImage:@"attrib5tile.png" target:self selector:@selector(onAttrib5)];
        CCMenu *menu5 = [CCMenu menuWithItems:attrib05, nil];
        menu5.position = ccp(135,winSize.height - 40);
        [self addChild:menu5 z:5];
        
        attrib10 = [CCMenuItemImage itemFromNormalImage:@"darkattrib10tile.png" selectedImage:@"attrib10tile.png" disabledImage:@"attrib10tile.png" target:self selector:@selector(onAttrib10)];
        CCMenu *menu10 = [CCMenu menuWithItems:attrib10, nil];
        menu10.position = ccp(235,winSize.height - 40);
        [self addChild:menu10 z:5];
        
        attrib15 = [CCMenuItemImage itemFromNormalImage:@"darkattrib15tile.png" selectedImage:@"attrib15tile.png" disabledImage:@"attrib15tile.png" target:self selector:@selector(onAttrib15)];
        CCMenu *menu15 = [CCMenu menuWithItems:attrib15, nil];
        menu15.position = ccp(335,winSize.height - 40);
        [self addChild:menu15 z:5];
        
        
        
        if (hero.attrib1)
        {
            [attrib01 selected];
        }
        
        if (hero.attrib5)
        {
            [attrib05 selected];
        }
        
        if (hero.attrib10)
        {
            [attrib10 selected];
        }
        
        if (hero.attrib15)
        {
            [attrib15 selected];
        }
        
        
        attrib02 = [CCMenuItemImage itemFromNormalImage:@"darkattrib2tile.png" selectedImage:@"attrib2tile.png" disabledImage:@"attrib2tile.png" target:self selector:@selector(onAttrib2)];
        CCMenu *menu2 = [CCMenu menuWithItems:attrib02, nil];
        menu2.position = ccp(35,winSize.height - 110);
        [self addChild:menu2 z:5];
        
        attrib06 = [CCMenuItemImage itemFromNormalImage:@"darkattrib6tile.png" selectedImage:@"attrib6tile.png" disabledImage:@"attrib6tile.png" target:self selector:@selector(onAttrib6)];
        CCMenu *menu6 = [CCMenu menuWithItems:attrib06, nil];
        menu6.position = ccp(105,winSize.height - 110);
        [self addChild:menu6 z:5];
        attrib07 = [CCMenuItemImage itemFromNormalImage:@"darkattrib7tile.png" selectedImage:@"attrib7tile.png" disabledImage:@"attrib7tile.png" target:self selector:@selector(onAttrib7)];
        CCMenu *menu7 = [CCMenu menuWithItems:attrib07, nil];
        menu7.position = ccp(165,winSize.height - 110);
        [self addChild:menu7 z:5];
        
        attrib11 = [CCMenuItemImage itemFromNormalImage:@"darkattrib11tile.png" selectedImage:@"attrib11tile.png" disabledImage:@"attrib11tile.png" target:self selector:@selector(onAttrib11)];
        CCMenu *menu11 = [CCMenu menuWithItems:attrib11, nil];
        menu11.position = ccp(235,winSize.height - 110);
        [self addChild:menu11 z:5];
        
        attrib16 = [CCMenuItemImage itemFromNormalImage:@"darkattrib16tile.png" selectedImage:@"attrib16tile.png" disabledImage:@"attrib16tile.png" target:self selector:@selector(onAttrib16)];
        CCMenu *menu16 = [CCMenu menuWithItems:attrib16, nil];
        menu16.position = ccp(335,winSize.height - 110);
        [self addChild:menu16 z:5];
        
        
        
        if (!hero.attrib1)
        {
            [attrib02 setIsEnabled:NO];
            attrib02.visible = NO;
        }
        else
        {
            CCSprite *attribTransition00 = [CCSprite spriteWithFile:@"attribtransition3.png"];
            attribTransition00.position = ccp(35, winSize.height - 70);
            [self addChild:attribTransition00 z:3 tag:309];
        }
        
        if (!hero.attrib5)
        {
            [attrib06 setIsEnabled:NO];
            attrib06.visible = NO;
            [attrib07 setIsEnabled:NO];
            attrib07.visible = NO;
        }
        else
        {
            CCSprite *attribTransition00 = [CCSprite spriteWithFile:@"attribtransition1.png"];
            attribTransition00.position = ccp(135, winSize.height - 75);
            [self addChild:attribTransition00 z:3 tag:310];
        }
        
        if (!hero.attrib10)
        {
            [attrib11 setIsEnabled:NO];
            attrib11.visible = NO;
        }
        else
        {
            CCSprite *attribTransition00 = [CCSprite spriteWithFile:@"attribtransition3.png"];
            attribTransition00.position = ccp(235, winSize.height - 70);
            [self addChild:attribTransition00 z:3 tag:311];
        }
        
        if (!hero.attrib15)
        {
            [attrib16 setIsEnabled:NO];
            attrib16.visible = NO;
        }
        else
        {
            CCSprite *attribTransition00 = [CCSprite spriteWithFile:@"attribtransition3.png"];
            attribTransition00.position = ccp(335, winSize.height - 70);
            [self addChild:attribTransition00 z:3 tag:312];
        }
        
        
        
        if (hero.attrib2)
        {
            [attrib02 selected];
        }
        
        if (hero.attrib6)
        {
            [attrib06 selected];
        }
        if (hero.attrib7)
        {
            [attrib07 selected];
        }
        
        if (hero.attrib11)
        {
            [attrib11 selected];
        }
        
        if (hero.attrib16)
        {
            [attrib16 selected];
        }
        
        
        
        
        
        
        attrib03 = [CCMenuItemImage itemFromNormalImage:@"darkattrib3tile.png" selectedImage:@"attrib3tile.png" disabledImage:@"attrib3tile.png" target:self selector:@selector(onAttrib3)];
        CCMenu *menu3 = [CCMenu menuWithItems:attrib03, nil];
        menu3.position = ccp(35,winSize.height - 180);
        [self addChild:menu3 z:5];
        
        attrib08 = [CCMenuItemImage itemFromNormalImage:@"darkattrib8tile.png" selectedImage:@"attrib8tile.png" disabledImage:@"attrib8tile.png" target:self selector:@selector(onAttrib8)];
        CCMenu *menu8 = [CCMenu menuWithItems:attrib08, nil];
        menu8.position = ccp(135,winSize.height - 180);
        [self addChild:menu8 z:5];
        
        attrib12 = [CCMenuItemImage itemFromNormalImage:@"darkattrib12tile.png" selectedImage:@"attrib12tile.png" disabledImage:@"attrib12tile.png" target:self selector:@selector(onAttrib12)];
        CCMenu *menu12 = [CCMenu menuWithItems:attrib12, nil];
        menu12.position = ccp(235,winSize.height - 180);
        [self addChild:menu12 z:5];
        
        attrib17 = [CCMenuItemImage itemFromNormalImage:@"darkattrib17tile.png" selectedImage:@"attrib17tile.png" disabledImage:@"attrib17tile.png" target:self selector:@selector(onAttrib17)];
        CCMenu *menu17 = [CCMenu menuWithItems:attrib17, nil];
        menu17.position = ccp(305,winSize.height - 180);
        [self addChild:menu17 z:5];
        
        attrib18 = [CCMenuItemImage itemFromNormalImage:@"darkattrib18tile.png" selectedImage:@"attrib18tile.png" disabledImage:@"attrib18tile.png" target:self selector:@selector(onAttrib18)];
        CCMenu *menu18 = [CCMenu menuWithItems:attrib18, nil];
        menu18.position = ccp(365,winSize.height - 180);
        [self addChild:menu18 z:5];
        
        
        
        if (!hero.attrib2)
        {
            [attrib03 setIsEnabled:NO];
            attrib03.visible = NO;
        }
        else
        {
            CCSprite *attribTransition00 = [CCSprite spriteWithFile:@"attribtransition3.png"];
            attribTransition00.position = ccp(35, winSize.height - 140);
            [self addChild:attribTransition00 z:3 tag:301];
        }
        
        if (!hero.attrib6 || !hero.attrib7)
        {
            [attrib08 setIsEnabled:NO];
            attrib08.visible = NO;
        }
        else
        {
            CCSprite *attribTransition00 = [CCSprite spriteWithFile:@"attribtransition2.png"];
            attribTransition00.position = ccp(135, winSize.height - 140);
            [self addChild:attribTransition00 z:3 tag:302];
        }
        
        if (!hero.attrib11)
        {
            [attrib12 setIsEnabled:NO];
            attrib12.visible = NO;
        }
        else
        {
            CCSprite *attribTransition00 = [CCSprite spriteWithFile:@"attribtransition3.png"];
            attribTransition00.position = ccp(235, winSize.height - 140);
            [self addChild:attribTransition00 z:3 tag:303];
        }
        
        if (!hero.attrib16)
        {
            [attrib17 setIsEnabled:NO];
            attrib17.visible = NO;
            [attrib18 setIsEnabled:NO];
            attrib18.visible = NO;
        }
        else
        {
            CCSprite *attribTransition00 = [CCSprite spriteWithFile:@"attribtransition1.png"];
            attribTransition00.position = ccp(335, winSize.height - 145);
            [self addChild:attribTransition00 z:3 tag:304];
        }
        
        
        
        if (hero.attrib3)
        {
            [attrib03 selected];
        }
        
        if (hero.attrib8)
        {
            [attrib08 selected];
        }
        if (hero.attrib12)
        {
            [attrib12 selected];
        }
        
        if (hero.attrib17)
        {
            [attrib17 selected];
        }
        
        if (hero.attrib18)
        {
            [attrib18 selected];
        }
        
        
        attrib04 = [CCMenuItemImage itemFromNormalImage:@"darkattrib4tile.png" selectedImage:@"attrib4tile.png" disabledImage:@"attrib4tile.png" target:self selector:@selector(onAttrib4)];
        CCMenu *menu4 = [CCMenu menuWithItems:attrib04, nil];
        menu4.position = ccp(35,winSize.height - 250);
        [self addChild:menu4 z:5];
        
        attrib09 = [CCMenuItemImage itemFromNormalImage:@"darkattrib9tile.png" selectedImage:@"attrib9tile.png" disabledImage:@"attrib9tile.png" target:self selector:@selector(onAttrib9)];
        CCMenu *menu9 = [CCMenu menuWithItems:attrib09, nil];
        menu9.position = ccp(135,winSize.height - 250);
        [self addChild:menu9 z:5];
        
        attrib13 = [CCMenuItemImage itemFromNormalImage:@"darkattrib13tile.png" selectedImage:@"attrib13tile.png" disabledImage:@"attrib13tile.png" target:self selector:@selector(onAttrib13)];
        CCMenu *menu13 = [CCMenu menuWithItems:attrib13, nil];
        menu13.position = ccp(205,winSize.height - 250);
        [self addChild:menu13 z:5];
        
        attrib14 = [CCMenuItemImage itemFromNormalImage:@"darkattrib14tile.png" selectedImage:@"attrib14tile.png" disabledImage:@"attrib14tile.png" target:self selector:@selector(onAttrib14)];
        CCMenu *menu14 = [CCMenu menuWithItems:attrib14, nil];
        menu14.position = ccp(265,winSize.height - 250);
        [self addChild:menu14 z:5];
        
        attrib19 = [CCMenuItemImage itemFromNormalImage:@"darkattrib19tile.png" selectedImage:@"attrib19tile.png" disabledImage:@"attrib19tile.png" target:self selector:@selector(onAttrib19)];
        CCMenu *menu19 = [CCMenu menuWithItems:attrib19, nil];
        menu19.position = ccp(335,winSize.height - 250);
        [self addChild:menu19 z:5];
        
        
        
        if (!hero.attrib3)
        {
            [attrib04 setIsEnabled:NO];
            attrib04.visible = NO;
        }
        else
        {
            CCSprite *attribTransition00 = [CCSprite spriteWithFile:@"attribtransition3.png"];
            attribTransition00.position = ccp(35, winSize.height - 210);
            [self addChild:attribTransition00 z:3 tag:305];
        }
        
        if (!hero.attrib8)
        {
            [attrib09 setIsEnabled:NO];
            attrib09.visible = NO;
        }
        else
        {
            CCSprite *attribTransition00 = [CCSprite spriteWithFile:@"attribtransition3.png"];
            attribTransition00.position = ccp(135, winSize.height - 210);
            [self addChild:attribTransition00 z:3 tag:306];
        }
        
        if (!hero.attrib12)
        {
            [attrib13 setIsEnabled:NO];
            attrib13.visible = NO;
            [attrib14 setIsEnabled:NO];
            attrib14.visible = NO;
        }
        else
        {
            CCSprite *attribTransition00 = [CCSprite spriteWithFile:@"attribtransition1.png"];
            attribTransition00.position = ccp(235, winSize.height - 215);
            [self addChild:attribTransition00 z:3 tag:307];
        }
        
        if (!hero.attrib17 || !hero.attrib18)
        {
            [attrib19 setIsEnabled:NO];
            attrib19.visible = NO;
        }
        else
        {
            CCSprite *attribTransition00 = [CCSprite spriteWithFile:@"attribtransition2.png"];
            attribTransition00.position = ccp(335, winSize.height - 210);
            [self addChild:attribTransition00 z:3 tag:308];
        }
        
        
        
        if (hero.attrib4)
        {
            [attrib04 selected];
        }
        
        if (hero.attrib9)
        {
            [attrib09 selected];
        }
        if (hero.attrib13)
        {
            [attrib13 selected];
        }
        
        if (hero.attrib14)
        {
            [attrib14 selected];
        }
        
        if (hero.attrib19)
        {
            [attrib19 selected];
        }
        
        
        
        
        
        
        
        
        CCLabelTTF *label4 = [CCLabelTTF labelWithString:[NSString stringWithFormat:@"%d Points", hero.attributePoints] dimensions: CGSizeMake(120, 30) alignment:UITextAlignmentLeft fontName:@"Optima-Bold" fontSize:20.0];
        label4.position = ccp(winSize.width - 27, winSize.height/2 - 100);
        label4.color = ccc3(0, 0, 0);
        [self addChild: label4 z:15 tag:25];
        
        
        
        
    }
    return self;
}





-(void) onAttrib1
{
    if (hero.attrib1)
    {
        [attrib01 selected];
    }
    [MusicHandler playButtonClick];
    if (attributeInfo.attribCode == 1)
    {
        attributeInfo.attribCode = 0;
        [self removeChild:attributeInfo cleanup:YES];
        return;
    }
    [self removeChild:attributeInfo cleanup:YES];
    attributeInfo = [[DisplayAttribDetails alloc] initWithAttributeCode:1];
    [self addChild:attributeInfo z:34000];
    
}
-(void) onAttrib2
{
    if (hero.attrib2)
    {
        [attrib02 selected];
    }
    [MusicHandler playButtonClick];
    if (attributeInfo.attribCode == 2)
    {
        attributeInfo.attribCode = 0;
        [self removeChild:attributeInfo cleanup:YES];
        return;
    }
    [self removeChild:attributeInfo cleanup:YES];
    attributeInfo = [[DisplayAttribDetails alloc] initWithAttributeCode:2];
    [self addChild:attributeInfo z:34000];
}
-(void) onAttrib3
{
    if (hero.attrib3)
    {
        [attrib03 selected];
    }
    [MusicHandler playButtonClick];
    if (attributeInfo.attribCode == 3)
    {
        attributeInfo.attribCode = 0;
        [self removeChild:attributeInfo cleanup:YES];
        return;
    }
    [self removeChild:attributeInfo cleanup:YES];
    attributeInfo = [[DisplayAttribDetails alloc] initWithAttributeCode:3];
    [self addChild:attributeInfo z:34000];
}
-(void) onAttrib4
{
    if (hero.attrib4)
    {
        [attrib04 selected];
    }
    [MusicHandler playButtonClick];
    if (attributeInfo.attribCode == 4)
    {
        attributeInfo.attribCode = 0;
        [self removeChild:attributeInfo cleanup:YES];
        return;
    }
    [self removeChild:attributeInfo cleanup:YES];
    attributeInfo = [[DisplayAttribDetails alloc] initWithAttributeCode:4];
    [self addChild:attributeInfo z:34000];
}
-(void) onAttrib5
{
    if (hero.attrib5)
    {
        [attrib05 selected];
    }
    [MusicHandler playButtonClick];
    if (attributeInfo.attribCode == 5)
    {
        attributeInfo.attribCode = 0;
        [self removeChild:attributeInfo cleanup:YES];
        return;
    }
    [self removeChild:attributeInfo cleanup:YES];
    attributeInfo = [[DisplayAttribDetails alloc] initWithAttributeCode:5];
    [self addChild:attributeInfo z:34000];
}
-(void) onAttrib6
{
    if (hero.attrib6)
    {
        [attrib06 selected];
    }
    [MusicHandler playButtonClick];
    if (attributeInfo.attribCode == 6)
    {
        attributeInfo.attribCode = 0;
        [self removeChild:attributeInfo cleanup:YES];
        return;
    }
    [self removeChild:attributeInfo cleanup:YES];
    attributeInfo = [[DisplayAttribDetails alloc] initWithAttributeCode:6];
    [self addChild:attributeInfo z:34000];
}
-(void) onAttrib7
{
    if (hero.attrib7)
    {
        [attrib07 selected];
    }
    [MusicHandler playButtonClick];
    if (attributeInfo.attribCode == 7)
    {
        attributeInfo.attribCode = 0;
        [self removeChild:attributeInfo cleanup:YES];
        return;
    }
    [self removeChild:attributeInfo cleanup:YES];
    attributeInfo = [[DisplayAttribDetails alloc] initWithAttributeCode:7];
    [self addChild:attributeInfo z:34000];
}
-(void) onAttrib8
{
    if (hero.attrib8)
    {
        [attrib08 selected];
    }
    [MusicHandler playButtonClick];
    if (attributeInfo.attribCode == 8)
    {
        attributeInfo.attribCode = 0;
        [self removeChild:attributeInfo cleanup:YES];
        return;
    }
    [self removeChild:attributeInfo cleanup:YES];
    attributeInfo = [[DisplayAttribDetails alloc] initWithAttributeCode:8];
    [self addChild:attributeInfo z:34000];
}
-(void) onAttrib9
{
    if (hero.attrib9)
    {
        [attrib09 selected];
    }
    [MusicHandler playButtonClick];
    if (attributeInfo.attribCode == 9)
    {
        attributeInfo.attribCode = 0;
        [self removeChild:attributeInfo cleanup:YES];
        return;
    }
    [self removeChild:attributeInfo cleanup:YES];
    attributeInfo = [[DisplayAttribDetails alloc] initWithAttributeCode:9];
    [self addChild:attributeInfo z:34000];
}
-(void) onAttrib10
{
    if (hero.attrib10)
    {
        [attrib10 selected];
    }
    [MusicHandler playButtonClick];
    if (attributeInfo.attribCode == 10)
    {
        attributeInfo.attribCode = 0;
        [self removeChild:attributeInfo cleanup:YES];
        return;
    }
    [self removeChild:attributeInfo cleanup:YES];
    attributeInfo = [[DisplayAttribDetails alloc] initWithAttributeCode:10];
    [self addChild:attributeInfo z:34000];
}
-(void) onAttrib11
{
    if (hero.attrib11)
    {
        [attrib11 selected];
    }
    [MusicHandler playButtonClick];
    if (attributeInfo.attribCode == 11)
    {
        attributeInfo.attribCode = 0;
        [self removeChild:attributeInfo cleanup:YES];
        return;
    }
    [self removeChild:attributeInfo cleanup:YES];
    attributeInfo = [[DisplayAttribDetails alloc] initWithAttributeCode:11];
    [self addChild:attributeInfo z:34000];
}
-(void) onAttrib12
{
    if (hero.attrib12)
    {
        [attrib12 selected];
    }
    [MusicHandler playButtonClick];
    if (attributeInfo.attribCode == 12)
    {
        attributeInfo.attribCode = 0;
        [self removeChild:attributeInfo cleanup:YES];
        return;
    }
    [self removeChild:attributeInfo cleanup:YES];
    attributeInfo = [[DisplayAttribDetails alloc] initWithAttributeCode:12];
    [self addChild:attributeInfo z:34000];
}
-(void) onAttrib13
{
    if (hero.attrib13)
    {
        [attrib13 selected];
    }
    [MusicHandler playButtonClick];
    if (attributeInfo.attribCode == 13)
    {
        attributeInfo.attribCode = 0;
        [self removeChild:attributeInfo cleanup:YES];
        return;
    }
    [self removeChild:attributeInfo cleanup:YES];
    attributeInfo = [[DisplayAttribDetails alloc] initWithAttributeCode:13];
    [self addChild:attributeInfo z:34000];
}
-(void) onAttrib14
{
    if (hero.attrib14)
    {
        [attrib14 selected];
    }
    [MusicHandler playButtonClick];
    if (attributeInfo.attribCode == 14)
    {
        attributeInfo.attribCode = 0;
        [self removeChild:attributeInfo cleanup:YES];
        return;
    }
    [self removeChild:attributeInfo cleanup:YES];
    attributeInfo = [[DisplayAttribDetails alloc] initWithAttributeCode:14];
    [self addChild:attributeInfo z:34000];
}
-(void) onAttrib15
{
    if (hero.attrib15)
    {
        [attrib15 selected];
    }
    [MusicHandler playButtonClick];
    if (attributeInfo.attribCode == 15)
    {
        attributeInfo.attribCode = 0;
        [self removeChild:attributeInfo cleanup:YES];
        return;
    }
    [self removeChild:attributeInfo cleanup:YES];
    attributeInfo = [[DisplayAttribDetails alloc] initWithAttributeCode:15];
    [self addChild:attributeInfo z:34000];
}
-(void) onAttrib16
{
    if (hero.attrib16)
    {
        [attrib16 selected];
    }
    [MusicHandler playButtonClick];
    if (attributeInfo.attribCode == 16)
    {
        attributeInfo.attribCode = 0;
        [self removeChild:attributeInfo cleanup:YES];
        return;
    }
    [self removeChild:attributeInfo cleanup:YES];
    attributeInfo = [[DisplayAttribDetails alloc] initWithAttributeCode:16];
    [self addChild:attributeInfo z:34000];
}
-(void) onAttrib17
{
    if (hero.attrib17)
    {
        [attrib17 selected];
    }
    [MusicHandler playButtonClick];
    if (attributeInfo.attribCode == 17)
    {
        attributeInfo.attribCode = 0;
        [self removeChild:attributeInfo cleanup:YES];
        return;
    }
    [self removeChild:attributeInfo cleanup:YES];
    attributeInfo = [[DisplayAttribDetails alloc] initWithAttributeCode:17];
    [self addChild:attributeInfo z:34000];
}
-(void) onAttrib18
{
    if (hero.attrib18)
    {
        [attrib18 selected];
    }
    [MusicHandler playButtonClick];
    if (attributeInfo.attribCode == 18)
    {
        attributeInfo.attribCode = 0;
        [self removeChild:attributeInfo cleanup:YES];
        return;
    }
    [self removeChild:attributeInfo cleanup:YES];
    attributeInfo = [[DisplayAttribDetails alloc] initWithAttributeCode:18];
    [self addChild:attributeInfo z:34000];
}
-(void) onAttrib19
{
    if (hero.attrib19)
    {
        [attrib19 selected];
    }
    [MusicHandler playButtonClick];
    if (attributeInfo.attribCode == 19)
    {
        attributeInfo.attribCode = 0;
        [self removeChild:attributeInfo cleanup:YES];
        return;
    }
    [self removeChild:attributeInfo cleanup:YES];
    attributeInfo = [[DisplayAttribDetails alloc] initWithAttributeCode:19];
    [self addChild:attributeInfo z:34000];
}



































-(void)update:(int)justUnlocked
{
    
    CGSize winSize = [[CCDirector sharedDirector] winSize];
    
    [self removeChild:attrib01 cleanup:YES];
    [self removeChild:attrib02 cleanup:YES];
    [self removeChild:attrib03 cleanup:YES];
    [self removeChild:attrib04 cleanup:YES];
    [self removeChild:attrib05 cleanup:YES];
    [self removeChild:attrib06 cleanup:YES];
    [self removeChild:attrib07 cleanup:YES];
    [self removeChild:attrib08 cleanup:YES];
    [self removeChild:attrib09 cleanup:YES];
    [self removeChild:attrib10 cleanup:YES];
    [self removeChild:attrib11 cleanup:YES];
    [self removeChild:attrib12 cleanup:YES];
    [self removeChild:attrib13 cleanup:YES];
    [self removeChild:attrib14 cleanup:YES];
    [self removeChild:attrib15 cleanup:YES];
    [self removeChild:attrib16 cleanup:YES];
    [self removeChild:attrib17 cleanup:YES];
    [self removeChild:attrib18 cleanup:YES];
    [self removeChild:attrib19 cleanup:YES];
    
    [self removeChild:attributeInfo cleanup:YES];
    
    
    [self removeChildByTag:301 cleanup:YES];
    [self removeChildByTag:302 cleanup:YES];
    [self removeChildByTag:303 cleanup:YES];
    [self removeChildByTag:304 cleanup:YES];
    [self removeChildByTag:305 cleanup:YES];
    [self removeChildByTag:306 cleanup:YES];
    [self removeChildByTag:307 cleanup:YES];
    [self removeChildByTag:308 cleanup:YES];
    [self removeChildByTag:309 cleanup:YES];
    [self removeChildByTag:310 cleanup:YES];
    [self removeChildByTag:311 cleanup:YES];
    [self removeChildByTag:312 cleanup:YES];
    
    
    
    
    attrib01 = [CCMenuItemImage itemFromNormalImage:@"darkattrib1tile.png" selectedImage:@"attrib1tile.png" disabledImage:@"attrib1tile.png" target:self selector:@selector(onAttrib1)];
    CCMenu *menu1 = [CCMenu menuWithItems:attrib01, nil];
    menu1.position = ccp(35,winSize.height - 40);
    [self addChild:menu1 z:5];
    
    attrib05 = [CCMenuItemImage itemFromNormalImage:@"darkattrib5tile.png" selectedImage:@"attrib5tile.png" disabledImage:@"attrib5tile.png" target:self selector:@selector(onAttrib5)];
    CCMenu *menu5 = [CCMenu menuWithItems:attrib05, nil];
    menu5.position = ccp(135,winSize.height - 40);
    [self addChild:menu5 z:5];
    
    attrib10 = [CCMenuItemImage itemFromNormalImage:@"darkattrib10tile.png" selectedImage:@"attrib10tile.png" disabledImage:@"attrib10tile.png" target:self selector:@selector(onAttrib10)];
    CCMenu *menu10 = [CCMenu menuWithItems:attrib10, nil];
    menu10.position = ccp(235,winSize.height - 40);
    [self addChild:menu10 z:5];
    
    attrib15 = [CCMenuItemImage itemFromNormalImage:@"darkattrib15tile.png" selectedImage:@"attrib15tile.png" disabledImage:@"attrib15tile.png" target:self selector:@selector(onAttrib15)];
    CCMenu *menu15 = [CCMenu menuWithItems:attrib15, nil];
    menu15.position = ccp(335,winSize.height - 40);
    [self addChild:menu15 z:5];
    
    
    
    if (hero.attrib1)
    {
        [attrib01 selected];
    }
    
    if (hero.attrib5)
    {
        [attrib05 selected];
    }
    
    if (hero.attrib10)
    {
        [attrib10 selected];
    }
    
    if (hero.attrib15)
    {
        [attrib15 selected];
    }
    
    
    attrib02 = [CCMenuItemImage itemFromNormalImage:@"darkattrib2tile.png" selectedImage:@"attrib2tile.png" disabledImage:@"attrib2tile.png" target:self selector:@selector(onAttrib2)];
    CCMenu *menu2 = [CCMenu menuWithItems:attrib02, nil];
    menu2.position = ccp(35,winSize.height - 110);
    [self addChild:menu2 z:5];
    
    attrib06 = [CCMenuItemImage itemFromNormalImage:@"darkattrib6tile.png" selectedImage:@"attrib6tile.png" disabledImage:@"attrib6tile.png" target:self selector:@selector(onAttrib6)];
    CCMenu *menu6 = [CCMenu menuWithItems:attrib06, nil];
    menu6.position = ccp(105,winSize.height - 110);
    [self addChild:menu6 z:5];
    attrib07 = [CCMenuItemImage itemFromNormalImage:@"darkattrib7tile.png" selectedImage:@"attrib7tile.png" disabledImage:@"attrib7tile.png" target:self selector:@selector(onAttrib7)];
    CCMenu *menu7 = [CCMenu menuWithItems:attrib07, nil];
    menu7.position = ccp(165,winSize.height - 110);
    [self addChild:menu7 z:5];
    
    attrib11 = [CCMenuItemImage itemFromNormalImage:@"darkattrib11tile.png" selectedImage:@"attrib11tile.png" disabledImage:@"attrib11tile.png" target:self selector:@selector(onAttrib11)];
    CCMenu *menu11 = [CCMenu menuWithItems:attrib11, nil];
    menu11.position = ccp(235,winSize.height - 110);
    [self addChild:menu11 z:5];
    
    attrib16 = [CCMenuItemImage itemFromNormalImage:@"darkattrib16tile.png" selectedImage:@"attrib16tile.png" disabledImage:@"attrib16tile.png" target:self selector:@selector(onAttrib16)];
    CCMenu *menu16 = [CCMenu menuWithItems:attrib16, nil];
    menu16.position = ccp(335,winSize.height - 110);
    [self addChild:menu16 z:5];
    
    
    
    if (!hero.attrib1)
    {
        [attrib02 setIsEnabled:NO];
        attrib02.visible = NO;
    }
    else
    {
        CCSprite *attribTransition00 = [CCSprite spriteWithFile:@"attribtransition3.png"];
        attribTransition00.position = ccp(35, winSize.height - 70);
        [self addChild:attribTransition00 z:3 tag:309];
    }
    
    if (!hero.attrib5)
    {
        [attrib06 setIsEnabled:NO];
        attrib06.visible = NO;
        [attrib07 setIsEnabled:NO];
        attrib07.visible = NO;
    }
    else
    {
        CCSprite *attribTransition00 = [CCSprite spriteWithFile:@"attribtransition1.png"];
        attribTransition00.position = ccp(135, winSize.height - 75);
        [self addChild:attribTransition00 z:3 tag:310];
    }
    
    if (!hero.attrib10)
    {
        [attrib11 setIsEnabled:NO];
        attrib11.visible = NO;
    }
    else
    {
        CCSprite *attribTransition00 = [CCSprite spriteWithFile:@"attribtransition3.png"];
        attribTransition00.position = ccp(235, winSize.height - 70);
        [self addChild:attribTransition00 z:3 tag:311];
    }
    
    if (!hero.attrib15)
    {
        [attrib16 setIsEnabled:NO];
        attrib16.visible = NO;
    }
    else
    {
        CCSprite *attribTransition00 = [CCSprite spriteWithFile:@"attribtransition3.png"];
        attribTransition00.position = ccp(335, winSize.height - 70);
        [self addChild:attribTransition00 z:3 tag:312];
    }
    
    
    
    if (hero.attrib2)
    {
        [attrib02 selected];
    }
    
    if (hero.attrib6)
    {
        [attrib06 selected];
    }
    if (hero.attrib7)
    {
        [attrib07 selected];
    }
    
    if (hero.attrib11)
    {
        [attrib11 selected];
    }
    
    if (hero.attrib16)
    {
        [attrib16 selected];
    }
    
    
    
    
    
    
    attrib03 = [CCMenuItemImage itemFromNormalImage:@"darkattrib3tile.png" selectedImage:@"attrib3tile.png" disabledImage:@"attrib3tile.png" target:self selector:@selector(onAttrib3)];
    CCMenu *menu3 = [CCMenu menuWithItems:attrib03, nil];
    menu3.position = ccp(35,winSize.height - 180);
    [self addChild:menu3 z:5];
    
    attrib08 = [CCMenuItemImage itemFromNormalImage:@"darkattrib8tile.png" selectedImage:@"attrib8tile.png" disabledImage:@"attrib8tile.png" target:self selector:@selector(onAttrib8)];
    CCMenu *menu8 = [CCMenu menuWithItems:attrib08, nil];
    menu8.position = ccp(135,winSize.height - 180);
    [self addChild:menu8 z:5];
    
    attrib12 = [CCMenuItemImage itemFromNormalImage:@"darkattrib12tile.png" selectedImage:@"attrib12tile.png" disabledImage:@"attrib12tile.png" target:self selector:@selector(onAttrib12)];
    CCMenu *menu12 = [CCMenu menuWithItems:attrib12, nil];
    menu12.position = ccp(235,winSize.height - 180);
    [self addChild:menu12 z:5];
    
    attrib17 = [CCMenuItemImage itemFromNormalImage:@"darkattrib17tile.png" selectedImage:@"attrib17tile.png" disabledImage:@"attrib17tile.png" target:self selector:@selector(onAttrib17)];
    CCMenu *menu17 = [CCMenu menuWithItems:attrib17, nil];
    menu17.position = ccp(305,winSize.height - 180);
    [self addChild:menu17 z:5];
    
    attrib18 = [CCMenuItemImage itemFromNormalImage:@"darkattrib18tile.png" selectedImage:@"attrib18tile.png" disabledImage:@"attrib18tile.png" target:self selector:@selector(onAttrib18)];
    CCMenu *menu18 = [CCMenu menuWithItems:attrib18, nil];
    menu18.position = ccp(365,winSize.height - 180);
    [self addChild:menu18 z:5];
    
    
    
    if (!hero.attrib2)
    {
        [attrib03 setIsEnabled:NO];
        attrib03.visible = NO;
    }
    else
    {
        CCSprite *attribTransition00 = [CCSprite spriteWithFile:@"attribtransition3.png"];
        attribTransition00.position = ccp(35, winSize.height - 140);
        [self addChild:attribTransition00 z:3 tag:301];
    }
    
    if (!hero.attrib6 || !hero.attrib7)
    {
        [attrib08 setIsEnabled:NO];
        attrib08.visible = NO;
    }
    else
    {
        CCSprite *attribTransition00 = [CCSprite spriteWithFile:@"attribtransition2.png"];
        attribTransition00.position = ccp(135, winSize.height - 140);
        [self addChild:attribTransition00 z:3 tag:302];
    }
    
    if (!hero.attrib11)
    {
        [attrib12 setIsEnabled:NO];
        attrib12.visible = NO;
    }
    else
    {
        CCSprite *attribTransition00 = [CCSprite spriteWithFile:@"attribtransition3.png"];
        attribTransition00.position = ccp(235, winSize.height - 140);
        [self addChild:attribTransition00 z:3 tag:303];
    }
    
    if (!hero.attrib16)
    {
        [attrib17 setIsEnabled:NO];
        attrib17.visible = NO;
        [attrib18 setIsEnabled:NO];
        attrib18.visible = NO;
    }
    else
    {
        CCSprite *attribTransition00 = [CCSprite spriteWithFile:@"attribtransition1.png"];
        attribTransition00.position = ccp(335, winSize.height - 145);
        [self addChild:attribTransition00 z:3 tag:304];
    }
    
    
    
    if (hero.attrib3)
    {
        [attrib03 selected];
    }
    
    if (hero.attrib8)
    {
        [attrib08 selected];
    }
    if (hero.attrib12)
    {
        [attrib12 selected];
    }
    
    if (hero.attrib17)
    {
        [attrib17 selected];
    }
    
    if (hero.attrib18)
    {
        [attrib18 selected];
    }
    
    
    attrib04 = [CCMenuItemImage itemFromNormalImage:@"darkattrib4tile.png" selectedImage:@"attrib4tile.png" disabledImage:@"attrib4tile.png" target:self selector:@selector(onAttrib4)];
    CCMenu *menu4 = [CCMenu menuWithItems:attrib04, nil];
    menu4.position = ccp(35,winSize.height - 250);
    [self addChild:menu4 z:5];
    
    attrib09 = [CCMenuItemImage itemFromNormalImage:@"darkattrib9tile.png" selectedImage:@"attrib9tile.png" disabledImage:@"attrib9tile.png" target:self selector:@selector(onAttrib9)];
    CCMenu *menu9 = [CCMenu menuWithItems:attrib09, nil];
    menu9.position = ccp(135,winSize.height - 250);
    [self addChild:menu9 z:5];
    
    attrib13 = [CCMenuItemImage itemFromNormalImage:@"darkattrib13tile.png" selectedImage:@"attrib13tile.png" disabledImage:@"attrib13tile.png" target:self selector:@selector(onAttrib13)];
    CCMenu *menu13 = [CCMenu menuWithItems:attrib13, nil];
    menu13.position = ccp(205,winSize.height - 250);
    [self addChild:menu13 z:5];
    
    attrib14 = [CCMenuItemImage itemFromNormalImage:@"darkattrib14tile.png" selectedImage:@"attrib14tile.png" disabledImage:@"attrib14tile.png" target:self selector:@selector(onAttrib14)];
    CCMenu *menu14 = [CCMenu menuWithItems:attrib14, nil];
    menu14.position = ccp(265,winSize.height - 250);
    [self addChild:menu14 z:5];
    
    attrib19 = [CCMenuItemImage itemFromNormalImage:@"darkattrib19tile.png" selectedImage:@"attrib19tile.png" disabledImage:@"attrib19tile.png" target:self selector:@selector(onAttrib19)];
    CCMenu *menu19 = [CCMenu menuWithItems:attrib19, nil];
    menu19.position = ccp(335,winSize.height - 250);
    [self addChild:menu19 z:5];
    
    
    
    if (!hero.attrib3)
    {
        [attrib04 setIsEnabled:NO];
        attrib04.visible = NO;
    }
    else
    {
        CCSprite *attribTransition00 = [CCSprite spriteWithFile:@"attribtransition3.png"];
        attribTransition00.position = ccp(35, winSize.height - 210);
        [self addChild:attribTransition00 z:3 tag:305];
    }
    
    if (!hero.attrib8)
    {
        [attrib09 setIsEnabled:NO];
        attrib09.visible = NO;
    }
    else
    {
        CCSprite *attribTransition00 = [CCSprite spriteWithFile:@"attribtransition3.png"];
        attribTransition00.position = ccp(135, winSize.height - 210);
        [self addChild:attribTransition00 z:3 tag:306];
    }
    
    if (!hero.attrib12)
    {
        [attrib13 setIsEnabled:NO];
        attrib13.visible = NO;
        [attrib14 setIsEnabled:NO];
        attrib14.visible = NO;
    }
    else
    {
        CCSprite *attribTransition00 = [CCSprite spriteWithFile:@"attribtransition1.png"];
        attribTransition00.position = ccp(235, winSize.height - 215);
        [self addChild:attribTransition00 z:3 tag:307];
    }
    
    if (!hero.attrib17 || !hero.attrib18)
    {
        [attrib19 setIsEnabled:NO];
        attrib19.visible = NO;
    }
    else
    {
        CCSprite *attribTransition00 = [CCSprite spriteWithFile:@"attribtransition2.png"];
        attribTransition00.position = ccp(335, winSize.height - 210);
        [self addChild:attribTransition00 z:3 tag:308];
    }
    
    
    
    if (hero.attrib4)
    {
        [attrib04 selected];
    }
    
    if (hero.attrib9)
    {
        [attrib09 selected];
    }
    if (hero.attrib13)
    {
        [attrib13 selected];
    }
    
    if (hero.attrib14)
    {
        [attrib14 selected];
    }
    
    if (hero.attrib19)
    {
        [attrib19 selected];
    }

    
    
    
    
    
    
    [self removeChildByTag:25 cleanup:YES];
    CCLabelTTF *label4 = [CCLabelTTF labelWithString:[NSString stringWithFormat:@"%d Points", hero.attributePoints] dimensions: CGSizeMake(120, 30) alignment:UITextAlignmentLeft fontName:@"Optima-Bold" fontSize:20.0];
    label4.position = ccp(winSize.width - 25, winSize.height/2 - 100);
    label4.color = ccc3(0, 0, 0);
    [self addChild: label4 z:15 tag:25];
    
    
    
}

-(void)unlock:(int)attribute
{
    
    if (attribute == 1)
    {
        if (hero.attributePoints >= 1)
        {
            hero.attributePoints -= 1;
            hero.attrib1 = YES;
            hero.attribStrMult = 1.1; 
            [GameSceneManager sharedGameSceneManager].hero = self.hero;
            [MusicHandler playButtonClick];
            int justUnlocked = 1;
            [self update:justUnlocked];
            [attrib01 selected];
            attributeInfo.attribCode = 0;
            return;
        }
        else
        {
            [MusicHandler playButtonClick];
        }
        return;
    }
    if (attribute == 2)
    {
        if (hero.attributePoints >= 3)
        {
            hero.attributePoints -= 3;
            hero.attrib2 = YES;
            hero.attribStrMult = 1.4; 
            [GameSceneManager sharedGameSceneManager].hero = self.hero;
            [MusicHandler playButtonClick];
            int justUnlocked = 2;
            [self update:justUnlocked];
            [attrib02 selected];
            attributeInfo.attribCode = 0;
            return;
        }
        else
        {
            [MusicHandler playButtonClick];
        }
        return;
    }
    if (attribute == 3)
    {
        if (hero.attributePoints >= 6)
        {
            hero.attributePoints -= 6;
            hero.attrib3 = YES;
            hero.attribStrMult = 1.9; 
            [GameSceneManager sharedGameSceneManager].hero = self.hero;
            [MusicHandler playButtonClick];
            int justUnlocked = 3;
            [self update:justUnlocked];
            [attrib03 selected];
            attributeInfo.attribCode = 0;
            return;
        }
        else
        {
            [MusicHandler playButtonClick];
        }
        return;
    }
    if (attribute == 4)
    {
        if (hero.attributePoints >= 12)
        {
            hero.attributePoints -= 12;
            hero.attrib4 = YES;
            [GameSceneManager sharedGameSceneManager].hero = self.hero;
            [MusicHandler playButtonClick];
            int justUnlocked = 4;
            [self update:justUnlocked];
            [attrib04 selected];
            attributeInfo.attribCode = 0;
            return;
        }
        else
        {
            [MusicHandler playButtonClick];
        }
        return;
    }
    if (attribute == 5)
    {
        if (hero.attributePoints >= 1)
        {
            hero.attributePoints -= 1;
            hero.attrib5 = YES;
            hero.attribDefMult = 1.1;
            [GameSceneManager sharedGameSceneManager].hero = self.hero;
            [MusicHandler playButtonClick];
            int justUnlocked = 5;
            [self update:justUnlocked];
            [attrib05 selected];
            attributeInfo.attribCode = 0;
            return;
        }
        else
        {
            [MusicHandler playButtonClick];
        }
        return;
    }
    if (attribute == 6)
    {
        if (hero.attributePoints >= 3)
        {
            hero.attributePoints -= 3;
            hero.attrib6 = YES;
            hero.attribDefMult = 1.4;
            [GameSceneManager sharedGameSceneManager].hero = self.hero;
            [MusicHandler playButtonClick];
            int justUnlocked = 6;
            [self update:justUnlocked];
            [attrib06 selected];
            attributeInfo.attribCode = 0;
            return;
        }
        else
        {
            [MusicHandler playButtonClick];
        }
        return;
    }
    if (attribute == 7)
    {
        if (hero.attributePoints >= 3) //CHANGE
        {
            hero.attributePoints -= 3;
            hero.attrib7 = YES;
            [GameSceneManager sharedGameSceneManager].hero = self.hero;
            [MusicHandler playButtonClick];
            int justUnlocked = 7;
            [self update:justUnlocked];
            [attrib07 selected];
            attributeInfo.attribCode = 0;
            return;
        }
        else
        {
            [MusicHandler playButtonClick];
        }
        return;
    }
    if (attribute == 8)
    {
        if (hero.attributePoints >= 8)
        {
            hero.attributePoints -= 8;
            hero.attrib8 = YES;
            hero.attribDefMult = 1.9;
            hero.attribDefMult = 1.9;
            [GameSceneManager sharedGameSceneManager].hero = self.hero;
            [MusicHandler playButtonClick];
            int justUnlocked = 8;
            [self update:justUnlocked];
            [attrib08 selected];
            attributeInfo.attribCode = 0;
            return;
        }
        else
        {
            [MusicHandler playButtonClick];
        }
        return;
    }
    if (attribute == 9)
    {
        if (hero.attributePoints >= 10)
        {
            hero.attributePoints -= 10;
            hero.attrib9 = YES;
            [GameSceneManager sharedGameSceneManager].hero = self.hero;
            [MusicHandler playButtonClick];
            int justUnlocked = 9;
            [self update:justUnlocked];
            [attrib09 selected];
            attributeInfo.attribCode = 0;
            return;
        }
        else
        {
            [MusicHandler playButtonClick];
        }
        return;
    }
    if (attribute == 10)
    {
        if (hero.attributePoints >= 1)
        {
            hero.attributePoints -= 1;
            hero.attrib10 = YES;
            hero.attribAgiMult = 1.1;
            [GameSceneManager sharedGameSceneManager].hero = self.hero;
            [MusicHandler playButtonClick];
            int justUnlocked = 10;
            [self update:justUnlocked];
            [attrib10 selected];
            attributeInfo.attribCode = 0;
            return;
        }
        else
        {
            [MusicHandler playButtonClick];
        }
        return;
    }
    if (attribute == 11)
    {
        if (hero.attributePoints >= 3)
        {
            hero.attributePoints -= 3;
            hero.attrib11 = YES;
            hero.attribAgiMult = 1.4;
            [GameSceneManager sharedGameSceneManager].hero = self.hero;
            [MusicHandler playButtonClick];
            int justUnlocked = 11;
            [self update:justUnlocked];
            [attrib11 selected];
            attributeInfo.attribCode = 0;
            return;
        }
        else
        {
            [MusicHandler playButtonClick];
        }
        return;
    }
    if (attribute == 12)
    {
        if (hero.attributePoints >= 5)
        {
            hero.attributePoints -= 5;
            hero.attrib12 = YES;
            hero.attribAgiMult = 1.8;
            [GameSceneManager sharedGameSceneManager].hero = self.hero;
            [MusicHandler playButtonClick];
            int justUnlocked = 12;
            [self update:justUnlocked];
            [attrib12 selected];
            attributeInfo.attribCode = 0;
            return;
        }
        else
        {
            [MusicHandler playButtonClick];
        }
        return;
    }
    if (attribute == 13)
    {
        if (hero.attributePoints >= 7)
        {
            hero.attributePoints -= 7;
            hero.attrib13 = YES;
            hero.attribAgiMult = 2.1;
            [GameSceneManager sharedGameSceneManager].hero = self.hero;
            [MusicHandler playButtonClick];
            int justUnlocked = 13;
            [self update:justUnlocked];
            [attrib13 selected];
            attributeInfo.attribCode = 0;
            return;
        }
        else
        {
            [MusicHandler playButtonClick];
        }
        return;
    }
    if (attribute == 14)
    {
        if (hero.attributePoints >= 14)
        {
            hero.attributePoints -= 14;
            hero.attrib14 = YES;
            [GameSceneManager sharedGameSceneManager].hero = self.hero;
            [MusicHandler playButtonClick];
            int justUnlocked = 14;
            [self update:justUnlocked];
            [attrib14 selected];
            attributeInfo.attribCode = 0;
            return;
        }
        else
        {
            [MusicHandler playButtonClick];
        }
        return;
    }
    if (attribute == 15)
    {
        if (hero.attributePoints >= 2)
        {
            hero.attributePoints -= 2;
            hero.attrib15 = YES;
            hero.attribExpMult = 1.2;
            [GameSceneManager sharedGameSceneManager].hero = self.hero;
            [MusicHandler playButtonClick];
            int justUnlocked = 15;
            [self update:justUnlocked];
            [attrib15 selected];
            attributeInfo.attribCode = 0;
            return;
        }
        else
        {
            [MusicHandler playButtonClick];
        }
        return;
    }
    if (attribute == 16)
    {
        if (hero.attributePoints >= 3)
        {
            hero.attributePoints -= 3;
            hero.attrib16 = YES;
            hero.attribGoldMult = 1.2;
            [GameSceneManager sharedGameSceneManager].hero = self.hero;
            [MusicHandler playButtonClick];
            int justUnlocked = 16;
            [self update:justUnlocked];
            [attrib16 selected];
            attributeInfo.attribCode = 0;
            return;
        }
        else
        {
            [MusicHandler playButtonClick];
        }
        return;
    }
    if (attribute == 17)
    {
        if (hero.attributePoints >= 5)
        {
            hero.attributePoints -= 5;
            hero.attrib17 = YES;
            hero.attribExpMult = 1.6;
            [GameSceneManager sharedGameSceneManager].hero = self.hero;
            [MusicHandler playButtonClick];
            int justUnlocked = 17;
            [self update:justUnlocked];
            [attrib17 selected];
            attributeInfo.attribCode = 0;
            return;
        }
        else
        {
            [MusicHandler playButtonClick];
        }
        return;
    }
    if (attribute == 18)
    {
        if (hero.attributePoints >= 6)
        {
            hero.attributePoints -= 6;
            hero.attrib18 = YES;
            hero.attribGoldMult = 1.6;
            [GameSceneManager sharedGameSceneManager].hero = self.hero;
            [MusicHandler playButtonClick];
            int justUnlocked = 18;
            [self update:justUnlocked];
            [attrib18 selected];
            attributeInfo.attribCode = 0;
            return;
        }
        else
        {
            [MusicHandler playButtonClick];
        }
        return;
    }
    if (attribute == 19)
    {
        if (hero.attributePoints >= 12)
        {
            hero.attributePoints -= 12;
            hero.attrib19 = YES;
            [GameSceneManager sharedGameSceneManager].hero = self.hero;
            [MusicHandler playButtonClick];
            int justUnlocked = 19;
            [self update:justUnlocked];
            [attrib19 selected];
            attributeInfo.attribCode = 0;
            return;
        }
        else
        {
            [MusicHandler playButtonClick];
        }
        return;
    }
    
}







@end








