//
//  ARCTODViewController.h
//  PainTracker_v2
//
//  Created by antonio.carella@me.com on 12/1/13.
//  Copyright (c) 2013 antonio.carella@me.com. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ARCTODViewController : UIViewController <CPTPlotDataSource>
@property (nonatomic, strong) CPTGraphHostingView *hostView;
@end
