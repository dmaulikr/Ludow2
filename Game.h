//
//  Game.h
//  Ludow2
//
//  Created by Guillaume ESTREM on 30/03/2015.
//  Copyright (c) 2015 JACQUEZ_ESTREM. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class GameCategory, Variant;

@interface Game : NSManagedObject

@property (nonatomic, retain) NSString * gameName;
@property (nonatomic, retain) GameCategory *gameCategory;
@property (nonatomic, retain) NSSet *gameVariants;
@end

@interface Game (CoreDataGeneratedAccessors)

- (void)addGameVariantsObject:(Variant *)value;
- (void)removeGameVariantsObject:(Variant *)value;
- (void)addGameVariants:(NSSet *)values;
- (void)removeGameVariants:(NSSet *)values;

@end
