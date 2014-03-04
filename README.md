# GATracker

This is a Google Analytics shared instance example. It allows for full view controller tracking as well as single events. 

# Requirements

GATracker works on any iOS version and is compatible with both ARC and non-ARC projects. It depends on the following Apple frameworks:

* SystemConfiguration.framework
* CoreData.framework
* AdSupport.framework
    
It depends on the following Apple Library:

* libz.dylib
    
You will need LLVM 3.0 or later in order to build GATracker

You will also need the following files, which are available at Google Analytics(You can also directly add the source files to your project): 

You will need version 3.0 or later in order to build GATracker

* libGoogleAnalytics.a
* GAI.h
* GAITrackedViewController.h
* GAITracker.h
* GAITransaction.h
* GAITransactionItem.h
* GAIDictionaryBuilder.h(optional)
* GAIFields.h(optional)
* GAILogger.h(optional)
    
# Installation 

1. Directly add the `GATrackingService.h` and `GATrackingService.m` source files to your project.
2. Include `GATrackingService.h` in your Prefix.pch or wherever you need to include.
2. In your `GATrackingService.m`: 
    - Modify the `sendEventWithCategory` string with any event you want(ie. Your app name).
    - Enter your tracking id under "your tracking id"
3. Include a shared instance in your `didFinishLaunchingWithOptions` and create `_loadSharedInstance:

```objective-c
- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    [self _loadSharedInstance];
    return YES;
}

- (void)_loadSharedInstance
{
    [GATrackingService sharedInstance];
}
```

# Examples

```objective-c
- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    [[GATrackingService sharedInstance] trackEvent:@"Event Viewed" withValue:nil fromSender:@"your sender"];
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [[GATrackingService sharedInstance] trackEvent:@"Projects - Tapped Project Cell" withValue:nil fromSender:@"your sender" /*mutablearray for example: array[@"array item"*/];
    
    //You can also pass a string and set it as the sender
    NSString *string = [NSString stringWithFormat:@"http://www.gabemdev.com"];
    NSURL *url = [NSURL URLWithString:string];
    [[UIApplication sharedApplication] openURL:url];
    [[GATrackingService sharedInstance] trackEvent:@"Projects - Tapped Project Cell" withValue:nil fromSender:string];
}
```

# Alternatives

You may also want to track an entire view controller. You can accomplish this by creating a parent view controller.

Refer to the header file `GAViewController.h`.

```objective-c
@interface GAViewController : GAITrackedViewController

/**
 *  Track Event from this controller
 */
- (void)trackEvent:(NSString *)event withValue:(NSNumber *)value;
@end
```

Refer to the implementation file `GAViewController.m`.

```objective-c
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
````

Now lets track the view controller: 

See example in `GATrackedController.h` & `GATrackedController.m`.

Header file 

```objective-c
#import "GAViewController.h"

@interface GATrackedController : GAViewController

@end
````

Implementation file

```objective-c
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
}

- (void)yourEvent{
    
    [self trackEvent:@"My event - start" withValue:nil];
}

@end
````

## License

This code is distributed under the terms and conditions of the [MIT license](LICENSE). 




