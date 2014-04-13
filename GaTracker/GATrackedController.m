//
//  GATrackedController.m
//  GaTracker
//
//  Created by Rockstar. on 3/3/14.
//
//

#import "GATrackedController.h"

@interface GATrackedController ()

@end

@implementation GATrackedController


- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    [self trackEvent:@"Track this controller" withValue:nil];
    [[LocalyticsSession shared] tagScreen:@"Track this controller"];
}

- (void)yourEvent{
    
    [self trackEvent:@"My event - start" withValue:nil];
    [[LocalyticsSession shared] tagEvent:@"Track this controller"];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
