//
//  MoveView.m
//  Lesson 1
//
//  Created by Lucas Derraugh on 6/23/13.
//  Copyright (c) 2013 Lucas Derraugh. All rights reserved.
//

#import "MoveView.h"

@implementation MoveView {
    NSImageView *_imageView;
    NSRect _startFrame;
    NSRect _endFrame;
    BOOL _isAtStart;
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
        _isAtStart = YES;
    }
    return self;
}

- (BOOL)acceptsFirstResponder {
    return YES;
}

- (void)keyDown:(NSEvent *)theEvent {
    if (_isAtStart) {
        [[_imageView animator] setFrame:_endFrame];
        [[_imageView animator] setAlphaValue:0.25];
    } else {
        [[_imageView animator] setFrame:_startFrame];
        [[_imageView animator] setAlphaValue:1.0];
    }
    _isAtStart = !_isAtStart;
}

@end
