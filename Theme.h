//
//  Theme.h
//  Ludow2
//
//  Created by Guillaume ESTREM on 30/03/2015.
//  Copyright (c) 2015 JACQUEZ_ESTREM. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class Variant;

@interface Theme : NSManagedObject

@property (nonatomic, retain) NSString * themeName;
@property (nonatomic, retain) NSSet *themeVariant;
@end

@interface Theme (CoreDataGeneratedAccessors)

- (void)addThemeVariantObject:(Variant *)value;
- (void)removeThemeVariantObject:(Variant *)value;
- (void)addThemeVariant:(NSSet *)values;
- (void)removeThemeVariant:(NSSet *)values;

@end
