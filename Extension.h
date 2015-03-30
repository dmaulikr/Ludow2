//
//  Extension.h
//  Ludow2
//
//  Created by Guillaume ESTREM on 30/03/2015.
//  Copyright (c) 2015 JACQUEZ_ESTREM. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class Variant;

@interface Extension : NSManagedObject

@property (nonatomic, retain) NSString * extensionName;
@property (nonatomic, retain) NSSet *extensionVariants;
@end

@interface Extension (CoreDataGeneratedAccessors)

- (void)addExtensionVariantsObject:(Variant *)value;
- (void)removeExtensionVariantsObject:(Variant *)value;
- (void)addExtensionVariants:(NSSet *)values;
- (void)removeExtensionVariants:(NSSet *)values;

@end
