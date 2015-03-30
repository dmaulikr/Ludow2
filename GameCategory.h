//
//  GameCategory.h
//  Ludow2
//
//  Created by Guillaume ESTREM on 30/03/2015.
//  Copyright (c) 2015 JACQUEZ_ESTREM. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class Game;

@interface GameCategory : NSManagedObject

@property (nonatomic, retain) NSString * categoryName;
@property (nonatomic, retain) NSSet *categoryGame;
@end

@interface GameCategory (CoreDataGeneratedAccessors)

- (void)addCategoryGameObject:(Game *)value;
- (void)removeCategoryGameObject:(Game *)value;
- (void)addCategoryGame:(NSSet *)values;
- (void)removeCategoryGame:(NSSet *)values;

@end
