//
//  AppDelegate.m
//  MobileTutsStoryboarding
//
//  Created by Collin Ruffenach on 10/30/11.
//

#import "AppDelegate.h"

@implementation AppDelegate

@synthesize window = _window;

- (void)dealloc {

    [_window release];
    [super dealloc];
}

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {

    return YES;
}

@end
