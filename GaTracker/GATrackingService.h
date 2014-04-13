//
//  GATrackingService.h
//  GaTracker
//
//  Created by Rockstar. on 3/3/14.
//
//

#import <Foundation/Foundation.h>

#error Update tracking ids
#define kCDKLocalyticsKey   @"Localytics Key"
#define kCDKCrashlyticsKey  @"CrashLytics Key"
#define kCDKGATrackingKey   @"Your tracking id"
@interface GATrackingService : NSObject

+ (GATrackingService *)sharedInstance;

-(void)trackEvent:(NSString *)event withValue:(NSNumber *)value fromSender:(NSString *)sender;

@end
