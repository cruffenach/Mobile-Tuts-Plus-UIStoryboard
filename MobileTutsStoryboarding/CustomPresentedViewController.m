//
//  CustomPresentedViewController.m
//  MobileTutsStoryboarding
//
//  Created by Collin Ruffenach on 11/2/11.
//

#import "CustomPresentedViewController.h"

@implementation CustomPresentedViewController


- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    self.navigationItem.title = @"Custom Controller";
}

- (IBAction)done:(id)sender {
    
    [self dismissModalViewControllerAnimated:YES];
}
@end
