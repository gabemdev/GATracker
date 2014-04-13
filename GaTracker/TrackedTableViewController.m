//
//  TrackedTableViewController.m
//  GaTracker
//
//  Created by Rockstar. on 3/3/14.
//
//

#import "TrackedTableViewController.h"

@interface TrackedTableViewController () <UITableViewDataSource, UITableViewDelegate>
@property (nonatomic, weak) IBOutlet UITableView *tableView;

@end

@implementation TrackedTableViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.tableView.dataSource = self;
    self.tableView.delegate = self;

    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
 
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    return 0;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    
    // Configure the cell...
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [[GATrackingService sharedInstance] trackEvent:@"Projects - Tapped Project Cell" withValue:nil fromSender:@"your sender" /*mutablearray for example: array[@"array item"*/];
    
    //You can also pass a string and set it as the sender
    NSString *string = [NSString stringWithFormat:@"http://www.gabemdev.com"];
    NSURL *url = [NSURL URLWithString:string];
    [[UIApplication sharedApplication] openURL:url];
    [[GATrackingService sharedInstance] trackEvent:@"Projects - Tapped Project Cell" withValue:nil fromSender:string];
    [[LocalyticsSession shared] tagEvent:@"Track this controller"];
}


@end
