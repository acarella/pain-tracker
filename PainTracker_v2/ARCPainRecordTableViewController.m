//
//  ARCPainRecordTableViewController.m
//  PainTracker_v2
//
//  Created by antonio.carella@me.com on 8/24/14.
//  Copyright (c) 2014 antonio.carella@me.com. All rights reserved.
//

#import "ARCPainRecordTableViewController.h"
#import "ARCAppDelegate.h"
#import "PainEvent.h"

@implementation ARCPainRecordTableViewController 



- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self.tableView reloadData];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{

    return [self.painEvents count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"PainEventCellIdentifier"];
    
    PainEvent *painEvent = (self.painEvents)[indexPath.row];
    
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"mm dd 'at' HH:mm"];
    
    NSString *timeStampString = [formatter stringFromDate:painEvent.timeStamp];
    
    cell.textLabel.text = timeStampString;
    cell.detailTextLabel.text = [painEvent.number stringValue];
    
    return cell;
}

@end
