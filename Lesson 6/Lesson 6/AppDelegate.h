//
//  AppDelegate.h
//  Lesson 6
//
//  Created by Lucas Derraugh on 7/28/13.
//  Copyright (c) 2013 Lucas Derraugh. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@interface AppDelegate : NSObject <NSApplicationDelegate>

@property (assign) IBOutlet NSWindow *window;
@property (weak) IBOutlet NSButton *button;

- (IBAction)buttonPressed:(id)sender;

@end
