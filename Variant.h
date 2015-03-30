//
//  Variant.h
//  Ludow2
//
//  Created by Guillaume ESTREM on 30/03/2015.
//  Copyright (c) 2015 JACQUEZ_ESTREM. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class Author, Difficulty, Extension, Game, GameBox, Theme;

@interface Variant : NSManagedObject

@property (nonatomic, retain) NSNumber * maxPlayer;
@property (nonatomic, retain) NSNumber * minAge;
@property (nonatomic, retain) NSString * variantName;
@property (nonatomic, retain) NSSet *variantAuthor;
@property (nonatomic, retain) Difficulty *variantDifficulty;
@property (nonatomic, retain) NSSet *variantExtension;
@property (nonatomic, retain) Game *variantGame;
@property (nonatomic, retain) NSSet *variantGameBox;
@property (nonatomic, retain) Theme *variantTheme;
@end

@interface Variant (CoreDataGeneratedAccessors)

- (void)addVariantAuthorObject:(Author *)value;
- (void)removeVariantAuthorObject:(Author *)value;
- (void)addVariantAuthor:(NSSet *)values;
- (void)removeVariantAuthor:(NSSet *)values;

- (void)addVariantExtensionObject:(Extension *)value;
- (void)removeVariantExtensionObject:(Extension *)value;
- (void)addVariantExtension:(NSSet *)values;
- (void)removeVariantExtension:(NSSet *)values;

- (void)addVariantGameBoxObject:(GameBox *)value;
- (void)removeVariantGameBoxObject:(GameBox *)value;
- (void)addVariantGameBox:(NSSet *)values;
- (void)removeVariantGameBox:(NSSet *)values;

@end
