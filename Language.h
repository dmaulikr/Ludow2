//
//  Language.h
//  Ludow2
//
//  Created by Guillaume ESTREM on 30/03/2015.
//  Copyright (c) 2015 JACQUEZ_ESTREM. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class GameBox;

@interface Language : NSManagedObject

@property (nonatomic, retain) NSString * languageName;
@property (nonatomic, retain) NSSet *languageGB;
@end

@interface Language (CoreDataGeneratedAccessors)

- (void)addLanguageGBObject:(GameBox *)value;
- (void)removeLanguageGBObject:(GameBox *)value;
- (void)addLanguageGB:(NSSet *)values;
- (void)removeLanguageGB:(NSSet *)values;

@end
