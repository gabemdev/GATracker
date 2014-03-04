//
//  GAViewController.h
//  GaTracker
//
//  Created by Rockstar. on 3/3/14.
//
//

#import "GAITrackedViewController.h"

@interface GAViewController : GAITrackedViewController

/**
 *  Track Event from this controller
 */
- (void)trackEvent:(NSString *)event withValue:(NSNumber *)value;

@end
