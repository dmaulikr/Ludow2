//
//  Illustrator.h
//  Ludow2
//
//  Created by Guillaume ESTREM on 30/03/2015.
//  Copyright (c) 2015 JACQUEZ_ESTREM. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class GameBox;

@interface Illustrator : NSManagedObject

@property (nonatomic, retain) NSString * illustratorName;
@property (nonatomic, retain) NSSet *illustratorGB;
@end

@interface Illustrator (CoreDataGeneratedAccessors)

- (void)addIllustratorGBObject:(GameBox *)value;
- (void)removeIllustratorGBObject:(GameBox *)value;
- (void)addIllustratorGB:(NSSet *)values;
- (void)removeIllustratorGB:(NSSet *)values;

@end
