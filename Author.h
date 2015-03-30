//
//  Author.h
//  Ludow2
//
//  Created by Guillaume ESTREM on 30/03/2015.
//  Copyright (c) 2015 JACQUEZ_ESTREM. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class Variant;

@interface Author : NSManagedObject

@property (nonatomic, retain) NSString * authorName;
@property (nonatomic, retain) NSSet *authorVariant;
@end

@interface Author (CoreDataGeneratedAccessors)

- (void)addAuthorVariantObject:(Variant *)value;
- (void)removeAuthorVariantObject:(Variant *)value;
- (void)addAuthorVariant:(NSSet *)values;
- (void)removeAuthorVariant:(NSSet *)values;

@end
