//
//  TextBox.h
//  Quest
//
//  Created by Leo Linsky on 5/21/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>


#define TEXT_FONT_FILE @"testFont5.fnt"

@protocol TextBox <NSObject>

- (id) initWithColor:(UIColor *)color 
			   width:(CGFloat)w 
			  height:(CGFloat)h 
			 padding:(CGFloat)padding 
				text:(NSString *)txt;

- (void)update:(float)dt;

@end

@protocol TextBoxDelegate <NSObject>

- (void)textBox:(id<TextBox>)tbox didFinishAllTextWithPageCount:(int)pc;

@optional
- (void)textBox:(id<TextBox>)tbox didMoveToPage:(int)p;

@end
