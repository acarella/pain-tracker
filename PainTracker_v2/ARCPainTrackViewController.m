//
//  ARCPainTrackViewController.m
//  PainTracker_v2
//
//  Created by antonio.carella@me.com on 11/30/13.
//  Copyright (c) 2013 antonio.carella@me.com. All rights reserved.
//

#import "ARCPainTrackViewController.h"
#import "ARCSuccessViewController.h"
#import "ARCAppDelegate.h"

@interface ARCPainTrackViewController ()
@property (weak, nonatomic) UITextField *activeTextField;
@property NSManagedObject *painEvent;
@property NSManagedObjectContext *context;
@property CGRect topLeftCorner;
@end

@implementation ARCPainTrackViewController

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
    
    //CoreData setup
    ARCAppDelegate *appDelegate =
    [[UIApplication sharedApplication] delegate];
    
    _context = [appDelegate managedObjectContext];

    //Get keyboard notifications
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(keyboardWasShown:)
                                                 name:UIKeyboardDidShowNotification object:nil];
    
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(keyboardWillBeHidden:)
                                                 name:UIKeyboardWillHideNotification object:nil];
    
    [self.scrollView setContentSize:CGSizeMake(self.scrollView.frame.size.width, self.scrollView.frame.size.height)];

    
}

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:YES];
    
    //reset view
    _topLeftCorner = CGRectMake(0,0, 1, 1);
    [self.scrollView scrollRectToVisible: _topLeftCorner animated: YES];
    _painTextOutlet.text = @"";
    _painNumberOutlet.text = @"5";
    _painNumberSlider.value = 5;
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)textFieldDidBeginEditing:(UITextField *)textField
{
    _activeTextField = textField;
}


- (void)textFieldDidEndEditing:(UITextField *)textField
{
    //NSLog(@"Hello from text field end editing.");
    _activeTextField = nil;

}

-(IBAction)textFieldDoneEditing:(id)sender{
    [sender resignFirstResponder];
}

// Called when the UIKeyboardDidShowNotification is sent.
- (void)keyboardWasShown:(NSNotification*)aNotification
{
    
    NSDictionary* info = [aNotification userInfo];
    CGSize kbSize = [[info objectForKey:UIKeyboardFrameBeginUserInfoKey] CGRectValue].size;
    
    UIEdgeInsets contentInsets = UIEdgeInsetsMake(0.0, 0.0, kbSize.height, 0.0);
    _scrollView.contentInset = contentInsets;
    _scrollView.scrollIndicatorInsets = contentInsets;
    
    // If active text field is hidden by keyboard, scroll it so it's visible
    // Your app might not need or want this behavior.
    CGRect aRect = self.view.frame;
    aRect.size.height -= kbSize.height;
    CGPoint textFieldPoint = _activeTextField.frame.origin;
    CGRect textFieldRect = _activeTextField.frame;
    
    if (!CGRectContainsPoint(aRect, textFieldPoint) ) {
        [self.scrollView scrollRectToVisible: textFieldRect animated:YES];
     
    }
     
}

// Called when the UIKeyboardWillHideNotification is sent
- (void)keyboardWillBeHidden:(NSNotification*)aNotification
{
    UIEdgeInsets contentInsets = UIEdgeInsetsZero;
    _scrollView.contentInset = contentInsets;
    _scrollView.scrollIndicatorInsets = contentInsets;
    [self.scrollView scrollRectToVisible: _topLeftCorner animated:YES];
}

- (IBAction)painNumberSlider:(UISlider *)sender {
    
    _painNumberOutlet.text = [NSString stringWithFormat:@"%.1f", sender.value];
    _painNumber = [NSNumber numberWithFloat:sender.value];
}

- (IBAction)painSubmit:(UIButton *)sender {

    _painEvent = [NSEntityDescription
                   insertNewObjectForEntityForName:@"PainEvent"
                   inManagedObjectContext:_context];

    //setting entity attributes
    [_painEvent setValue:  _painNumber forKey:@"number"];
    [_painEvent setValue: _painTextOutlet.text forKey:@"text"];
    [_painEvent setValue:[NSDate date] forKey:@"timeStamp"];
    
    NSError *error;
    [_context save:&error];

    [self performSegueWithIdentifier:@"moveOn" sender:self];
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    ARCSuccessViewController *destViewController = segue.   destinationViewController;
    destViewController.delegate = self;
}
- (IBAction)painText:(UITextField *)sender {
}
@end
