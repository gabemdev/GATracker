//
//  GAViewController.m
//  GaTracker
//
//  Created by Rockstar. on 3/3/14.
//
//

#import "GAViewController.h"
#import "AppDelegate.h"

@interface GAViewController ()

@end

@implementation GAViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
}

#pragma mark - Tracking

- (void)trackEvent:(NSString *)event withValue:(NSNumber *)value
{
    [[GATrackingService sharedInstance] trackEvent:event withValue:value fromSender:self.trackedViewName];
}

- (void)setTitle:(NSString *)title
{
    [super setTitle:title];
    self.trackedViewName = title;
}

@end
