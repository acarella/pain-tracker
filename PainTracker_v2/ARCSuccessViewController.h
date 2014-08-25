//
//  ARCSuccessViewController.h
//  PainTracker_v2
//
//  Created by antonio.carella@me.com on 11/30/13.
//  Copyright (c) 2013 antonio.carella@me.com. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ARCSuccessViewController : UIViewController
@property (strong, nonatomic) IBOutlet UILabel *painLevelOutlet;
@property (strong, nonatomic) IBOutlet UILabel *painNotesOutlet;
@property (strong, nonatomic) IBOutlet UILabel *painDateTimeOutlet;
@property (nonatomic, weak) id delegate;
@property (nonatomic, weak) NSDate *painDateTime;
@property (nonatomic, weak) NSNumber *painNumber;
@property (nonatomic, weak) NSString *painText;

@end
