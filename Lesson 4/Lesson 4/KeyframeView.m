//
//  KeyframeView.m
//  Lesson 4
//
//  Created by Lucas Derraugh on 7/11/13.
//  Copyright (c) 2013 Lucas Derraugh. All rights reserved.
//

#import "KeyframeView.h"
#import <QuartzCore/QuartzCore.h>

@implementation KeyframeView {
    NSImageView *_imageView;
}

- (id)initWithFrame:(NSRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        _imageView = [[NSImageView alloc] initWithFrame:NSMakeRect(0, 0,
                                                                   frame.size.width/3.0,
                                                                   frame.size.height/3.0)];
        [_imageView setImageScaling:NSImageScaleAxesIndependently];
        [_imageView setImage:[NSImage imageNamed:@"image.png"]];
        [self addSubview:_imageView];
        [self setUpAnimation];
    }
    
    return self;
}

- (void)setUpAnimation {
    CAKeyframeAnimation *keyframeAni = [CAKeyframeAnimation animation];
    keyframeAni.duration = 3.0;
    keyframeAni.autoreverses = YES;
    keyframeAni.calculationMode = kCAAnimationCubic;
    CGFloat x = [_imageView frame].origin.x;
    CGFloat y = [_imageView frame].origin.y;
    keyframeAni.values = @[[NSValue valueWithPoint:NSMakePoint(x, y)],
                           [NSValue valueWithPoint:NSMakePoint(x, y+200)],
                           [NSValue valueWithPoint:NSMakePoint(x+300, y+200)],
                           [NSValue valueWithPoint:NSMakePoint(x+300, y)],
                           [NSValue valueWithPoint:NSMakePoint(x, y)]];
    keyframeAni.keyTimes = @[@0.0, @0.4, @0.8, @0.9, @1.0];
    [_imageView setAnimations:@{@"frameOrigin": keyframeAni}];
}

- (void)mouseDown:(NSEvent *)theEvent {
    [[_imageView animator] setFrame:[_imageView frame]];
}

@end
