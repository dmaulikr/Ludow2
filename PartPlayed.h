//
//  PartPlayed.h
//  Ludow2
//
//  Created by Guillaume ESTREM on 30/03/2015.
//  Copyright (c) 2015 JACQUEZ_ESTREM. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class GameBox;

@interface PartPlayed : NSManagedObject

@property (nonatomic, retain) NSDate * datePartPlayed;
@property (nonatomic, retain) NSNumber * rankPartPlayed;
@property (nonatomic, retain) NSSet *partPlayedGB;
@end

@interface PartPlayed (CoreDataGeneratedAccessors)

- (void)addPartPlayedGBObject:(GameBox *)value;
- (void)removePartPlayedGBObject:(GameBox *)value;
- (void)addPartPlayedGB:(NSSet *)values;
- (void)removePartPlayedGB:(NSSet *)values;

@end
