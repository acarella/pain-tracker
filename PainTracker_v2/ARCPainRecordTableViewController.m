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
    ARCAppDelegate* appDelegate = [UIApplication sharedApplication].delegate;
    
    self.fetchedRecordsArray = [appDelegate getAllPainRecords];
    [self.tableView reloadData];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{

    return [self.fetchedRecordsArray count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellReuseIdentifier = @"PainEventCellIdentifier";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellReuseIdentifier forIndexPath:indexPath];
    PainEvent * record = [self.fetchedRecordsArray objectAtIndex:indexPath.row];
    cell.textLabel.text = [NSString stringWithFormat:@"%@ %@, %@ ",record.number,record.text,record.timeStamp];
    return cell;
}

@end
