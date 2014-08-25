//
//  ARCMonthViewController.h
//  PainTracker_v2
//
//  Created by antonio.carella@me.com on 12/2/13.
//  Copyright (c) 2013 antonio.carella@me.com. All rights reserved.
//

#import <UIKit/UIKit.h>
//#import <CorePlot/CorePlot.h>

@interface ARCMonthViewController : UIViewController<CPTPlotDataSource>{
    
CPTXYGraph *graph;
NSArray *plotData;

}

@property (strong, nonatomic) CPTGraphHostingView *hostView;

@end
