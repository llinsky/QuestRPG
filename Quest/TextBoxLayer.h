//
//  TextBoxLayer.h
//  Quest
//
//  Created by Leo Linsky on 5/21/12.
//  Copyright 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "cocos2d.h"
#import "TextBox.h"

@interface TextBoxLayer : CCLayerColor <TextBox> {
	
	CCLabelBMFont *textLabel;
    //CCLabelTTF *textLabel;
    
    CCSprite *background;
	
	NSString *text;
	NSMutableArray *lines;
	
	float progress;
	int linesPerPage;
	int currentPageIndex;
	NSMutableString *currentPage;
	int currentPageCharCount;
	
	int totalPages;
	
	id<TextBoxDelegate> delegate;
	
	BOOL ended;
}

@property (readwrite,assign) id<TextBoxDelegate> delegate;

- (NSString *)nextPage;

- (int)calculateStringSize:(NSString *)txt;

@end
