//
//  ARCPainTrackViewController.h
//  PainTracker_v2
//
//  Created by antonio.carella@me.com on 11/30/13.
//  Copyright (c) 2013 antonio.carella@me.com. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ARCPainTrackViewController : UIViewController
@property (weak, nonatomic) IBOutlet UILabel *painNumberOutlet;
@property (weak, nonatomic) IBOutlet UITextField *painTextOutlet;
@property (strong, nonatomic) IBOutlet UIScrollView *scrollView;
@property (weak, nonatomic) IBOutlet UISlider *painNumberSlider;
@property (strong, nonatomic) NSNumber *painNumber;
- (IBAction)painNumberSlider:(UISlider *)sender;
- (IBAction)painSubmit:(UIButton *)sender;
- (IBAction)textFieldDidBeginEditing:(id)sender;
- (IBAction)textFieldDoneEditing:(id)sender;

@end
