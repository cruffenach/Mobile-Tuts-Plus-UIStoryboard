//
//  FadeSegue.m
//  MobileTutsStoryboarding
//
//  Created by Collin Ruffenach on 10/31/11.
//  Copyright (c) 2011 ELC Technologies. All rights reserved.
//

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

//void FMSetGasValueForFireEmitterLayer(double gas, CAEmitterLayer *fireEmitter) {
//    
//    [fireEmitter setVelocity:<#(float)#>
//}

-(void)perform {
    
    CALayer *sourceLayer = [[[self sourceViewController] view] layer];
    CALayer *destinationLayer = [[[self destinationViewController] view] layer];
    
    [destinationLayer setOpacity:0.0];
    [sourceLayer addSublayer:destinationLayer];
   
    UIViewController *sourceViewController = (UIViewController*)[self sourceViewController];
    UIViewController *destinationController = (UIViewController*)[self destinationViewController];                    
    
    double delayInSeconds = 0.5;
    
    dispatch_time_t modalPresentationTime = dispatch_time(DISPATCH_TIME_NOW, delayInSeconds * NSEC_PER_SEC);
    dispatch_after(modalPresentationTime, dispatch_get_main_queue(), ^(void){

        [sourceViewController presentModalViewController:destinationController
                                                animated:NO];
        [destinationLayer setOpacity:1.0];
    });
    
    CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"opacity"];
    [animation setDuration:delayInSeconds];
    [animation setRemovedOnCompletion:YES];
    [animation setFromValue:[NSNumber numberWithFloat:1.0]];
    [animation setToValue:[NSNumber numberWithFloat:0.0]];
    [sourceLayer addAnimation:animation 
                       forKey:@"animateOpacity"];
    
    CABasicAnimation *fadeIn = [CABasicAnimation animationWithKeyPath:@"opacity"];
    [fadeIn setDuration:delayInSeconds];
    [fadeIn setRemovedOnCompletion:YES];
    [fadeIn setFromValue:[NSNumber numberWithFloat:0.0]];
    [fadeIn setToValue:[NSNumber numberWithFloat:1.0]];
    [fadeIn setAutoreverses:NO];
    [destinationLayer addAnimation:fadeIn
                            forKey:@"animateOpacity"];
}

@end
