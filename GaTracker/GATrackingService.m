//
//  GATrackingService.m
//  GaTracker
//
//  Created by Rockstar. on 3/3/14.
//
//

#import "GATrackingService.h"
#import "GAI.h"
#import "LocalyticsSession.h"
#import "LocalyticsUtilities.h"

@interface GATrackingService()
@property (nonatomic, strong) id <GAITracker> gaiTracker;
@end

@implementation GATrackingService

- (id)init
{
    [super doesNotRecognizeSelector:_cmd];
    return nil;
}

- (id)_initPrivate
{
    self = [super init];
    if (self) {
        [GAI sharedInstance].trackUncaughtExceptions = YES;
        [GAI sharedInstance].dispatchInterval = 10;
        self.gaiTracker = [[GAI sharedInstance] trackerWithTrackingId:kCDKGATrackingKey];
        [[LocalyticsSession shared] startSession:kCDKLocalyticsKey];
        
        //------------
        //Use crashlytics to install
        //------------
        //[Crashlytics startWithAPIKey:kCDKCrashlyticsKey];
    }
    return self;
}

- (void)trackEvent:(NSString *)event withValue:(NSNumber *)value fromSender:(NSString *)sender
{
    [self.gaiTracker sendEventWithCategory:@"Your App Name" withAction:event withLabel:sender withValue:value];
}

+ (GATrackingService *)sharedInstance
{
    static GATrackingService *instance = nil;
    if (!instance) {
        instance = [[GATrackingService alloc] _initPrivate];
    }
    return instance;
}

@end
