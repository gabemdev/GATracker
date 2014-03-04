//
//  EventTrackedViewController.m
//  GaTracker
//
//  Created by Rockstar. on 3/3/14.
//
//

#import "EventTrackedViewController.h"

@interface EventTrackedViewController ()

@end

@implementation EventTrackedViewController


- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    [[GATrackingService sharedInstance] trackEvent:@"Event Viewed" withValue:nil fromSender:@"your sender"];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
