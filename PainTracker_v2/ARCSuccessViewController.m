//
//  ARCSuccessViewController.m
//  PainTracker_v2
//
//  Created by antonio.carella@me.com on 11/30/13.
//  Copyright (c) 2013 antonio.carella@me.com. All rights reserved.
//

#import "ARCSuccessViewController.h"
#import "ARCAppDelegate.h"

@interface ARCSuccessViewController ()
@property NSManagedObjectContext *context;

@end

@implementation ARCSuccessViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    
    // Getting PainEvent entity from db.
    ARCAppDelegate *appDelegate =
    [[UIApplication sharedApplication] delegate];
    
    _context =
    [appDelegate managedObjectContext];
    
    NSEntityDescription *entityDesc =
    [NSEntityDescription entityForName:@"PainEvent"
                inManagedObjectContext:_context];
    
    NSFetchRequest *request = [[NSFetchRequest alloc] init];
    [request setEntity:entityDesc];
    
    NSError *error;
    NSArray *objects = [_context executeFetchRequest:request error:&error];
    
    NSManagedObject *oneObject = objects.lastObject;
    _painNumber = [oneObject valueForKey:@"number"];
    _painDateTime = [oneObject valueForKey:@"timeStamp"];
    _painText = [oneObject valueForKey:@"text"];
    
    NSNumberFormatter *formatter = [[NSNumberFormatter alloc] init]; 
    [formatter setMaximumFractionDigits:1];
    _painLevelOutlet.text = [formatter stringFromNumber: _painNumber];
    _painNotesOutlet.text = _painText;
    _painDateTimeOutlet.text = [NSString stringWithFormat:@"%@", _painDateTime];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
