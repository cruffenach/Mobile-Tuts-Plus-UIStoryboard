//
//  FadeSegue.m
//  MobileTutsStoryboarding
//
//  Created by Collin Ruffenach on 10/31/11.
//

#import "AppDelegate.h"
#import "FadeSegue.h"

#import <QuartzCore/QuartzCore.h>
#import <CoreImage/CoreImage.h>

@implementation FadeSegue

-(id)initWithIdentifier:(NSString *)identifier 
                 source:(UIViewController *)source
            destination:(UIViewController *)destination {
    
    if(self = [super initWithIdentifier:identifier
                                 source:source
                            destination:destination]) {
        
        NSLog(@"Custom initialization");
    }
    
    return self;
}

-(void)perform {

    __block UIViewController *sourceViewController = (UIViewController*)[self sourceViewController];
    __block UIViewController *destinationController = (UIViewController*)[self destinationViewController];                    
    
    [UIView transitionWithView:sourceViewController.navigationController.view
                      duration:.5
                       options:UIViewAnimationOptionTransitionCrossDissolve
                    animations:^{                        
                        [sourceViewController.navigationController pushViewController:destinationController
                                                                             animated:NO];
                    } 
                    completion:^(BOOL finished) {
                        NSLog(@"Transition Completed");
                    }];
}

@end
