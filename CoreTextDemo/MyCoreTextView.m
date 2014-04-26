//
//  MyCoreTextView.m
//  CoreTextDemo
//
//  Created by 文正光 on 14-4-26.
//  Copyright (c) 2014年 Fengboyun. All rights reserved.
//

#import "MyCoreTextView.h"
#import <CoreText/CoreText.h>

@implementation MyCoreTextView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
*/
- (void)drawRect:(CGRect)rect
{
    // Drawing code
    [super drawRect:rect];
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGMutablePathRef path = CGPathCreateMutable();
    CGPathAddRect(path, NULL, self.bounds);
    NSAttributedString *attString = [[NSAttributedString alloc] initWithString:@"hello text core world!"];
    
    CTFramesetterRef framesetterRef = CTFramesetterCreateWithAttributedString((CFAttributedStringRef)attString);
    CTFrameRef frameRef = CTFramesetterCreateFrame(framesetterRef, CFRangeMake(0, [attString length]), path, NULL);
    CTFrameDraw(frameRef, context);
    
    CFRelease(frameRef);
    CFRelease(path);
    CFRelease(framesetterRef);
}


@end
