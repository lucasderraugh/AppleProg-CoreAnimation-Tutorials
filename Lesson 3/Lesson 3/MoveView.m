//
//  MoveView.m
//  Lesson 3
//
//  Created by Lucas Derraugh on 7/4/13.
//  Copyright (c) 2013 Lucas Derraugh. All rights reserved.
//

#import "MoveView.h"
#import <QuartzCore/QuartzCore.h>

@implementation MoveView {
    NSImageView *_imageView;
    NSRect _startFrame;
    NSRect _endFrame;
}

- (id)initWithFrame:(NSRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        CGFloat width = NSWidth(frame);
        CGFloat height = NSHeight(frame);
        _startFrame = NSMakeRect(0, 0, width/3.0, height/3.0);
        _endFrame = NSMakeRect(width/2.0, 100, width/2.0, height/2.0);
        _imageView = [[NSImageView alloc] initWithFrame:_startFrame];
        [_imageView setImage:[NSImage imageNamed:@"image.png"]];
        [_imageView setImageScaling:NSImageScaleAxesIndependently];
        [self addSubview:_imageView];
        [_imageView setAnimations:@{@"frameOrigin": [self originAnimation],
                                    @"frameSize" : [self sizeAnimation]}];
    }
    
    return self;
}

- (CABasicAnimation *)originAnimation {
    CABasicAnimation *originAnim = [CABasicAnimation animation];
    CAMediaTimingFunction *timing = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseOut];
    [originAnim setTimingFunction:timing];
    [originAnim setDuration:4.0f];
    [originAnim setFromValue:[NSValue valueWithPoint:_startFrame.origin]];
    [originAnim setToValue:[NSValue valueWithPoint:_endFrame.origin]];
    return originAnim;
}

- (CABasicAnimation *)sizeAnimation {
    CABasicAnimation *sizeAnimation = [CABasicAnimation animation];
    [sizeAnimation setDuration:2.5f];
    [sizeAnimation setFromValue:[NSValue valueWithSize:_startFrame.size]];
    [sizeAnimation setToValue:[NSValue valueWithSize:_endFrame.size]];
    return sizeAnimation;
}

- (void)mouseDown:(NSEvent *)theEvent {
    [[_imageView animator] setFrame:_endFrame];
}


@end
