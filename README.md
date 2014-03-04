GATracker
=========
This is a Google Analytics shared instance example. It allows for full view controller tracking as well as single events. 

Frameworks needed:
    CodeData
    AdSupport
    SystemConfiguration
    
Libraries needed(You can drag them from the project): 
    libGoogleAnalytics.a
    GAI.h
    GAITrackedViewController.h
    GAITracker.h
    GAITransaction.h
    GAITransactionItem.h
    GAIDictionaryBuilder.h(optional)
    GAIFields(optional)
    GAILogger(optional)
    
Instructions: 

1. Drag the following files into your project:
    GATrackingService.h
    GATrackingService.m

2. In your GATrackingService.m: 
    Modify the sendEventWithCategory string with any event you want(ie. Your app name).
    Enter your tracking id under "your tracking id"

3. Import GATrackingService.h in your Prefix.pch

4. Include a shared instance in your didFinishLaunchingWithOptions  
- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    [self _loadSharedInstances];
    return YES;
}

5. Create your share instance
GATrackingService shared instance
- (void)_loadSharedInstances
{
    [GATrackingService sharedInstance];
}

6. Begin tracking. Check the view controllers to check for examples. 
