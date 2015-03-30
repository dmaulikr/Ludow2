//
//  Difficulty.h
//  Ludow2
//
//  Created by Guillaume ESTREM on 30/03/2015.
//  Copyright (c) 2015 JACQUEZ_ESTREM. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class Variant;

@interface Difficulty : NSManagedObject

@property (nonatomic, retain) NSString * difficultyLevel;
@property (nonatomic, retain) NSSet *difficultyVariant;
@end

@interface Difficulty (CoreDataGeneratedAccessors)

- (void)addDifficultyVariantObject:(Variant *)value;
- (void)removeDifficultyVariantObject:(Variant *)value;
- (void)addDifficultyVariant:(NSSet *)values;
- (void)removeDifficultyVariant:(NSSet *)values;

@end
