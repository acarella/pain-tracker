//
//  PainEvent.h
//  PainTracker_v2
//
//  Created by antonio.carella@me.com on 8/24/14.
//  Copyright (c) 2014 antonio.carella@me.com. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface PainEvent : NSManagedObject

@property (nonatomic, retain) NSNumber * number;
@property (nonatomic, retain) NSString * text;
@property (nonatomic, retain) NSDate * timeStamp;

@end
