//
//  GameBox.h
//  Ludow2
//
//  Created by Guillaume ESTREM on 30/03/2015.
//  Copyright (c) 2015 JACQUEZ_ESTREM. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class Editor, Illustrator, Language, PartPlayed, Variant;

@interface GameBox : NSManagedObject

@property (nonatomic, retain) NSDate * releasedYear;
@property (nonatomic, retain) Editor *gameBoxEditor;
@property (nonatomic, retain) Language *gameBoxeLanguage;
@property (nonatomic, retain) NSSet *gameBoxIllutrator;
@property (nonatomic, retain) NSSet *gameBoxPartPlayed;
@property (nonatomic, retain) NSSet *gameBoxVariants;
@end

@interface GameBox (CoreDataGeneratedAccessors)

- (void)addGameBoxIllutratorObject:(Illustrator *)value;
- (void)removeGameBoxIllutratorObject:(Illustrator *)value;
- (void)addGameBoxIllutrator:(NSSet *)values;
- (void)removeGameBoxIllutrator:(NSSet *)values;

- (void)addGameBoxPartPlayedObject:(PartPlayed *)value;
- (void)removeGameBoxPartPlayedObject:(PartPlayed *)value;
- (void)addGameBoxPartPlayed:(NSSet *)values;
- (void)removeGameBoxPartPlayed:(NSSet *)values;

- (void)addGameBoxVariantsObject:(Variant *)value;
- (void)removeGameBoxVariantsObject:(Variant *)value;
- (void)addGameBoxVariants:(NSSet *)values;
- (void)removeGameBoxVariants:(NSSet *)values;

@end
