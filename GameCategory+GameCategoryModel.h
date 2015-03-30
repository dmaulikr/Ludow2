//
//  GameCategory+GameCategoryModel.h
//  Ludow2
//
//  Created by Guillaume ESTREM on 23/03/2015.
//  Copyright (c) 2015 JACQUEZ_ESTREM. All rights reserved.
//

#import "GameCategory.h"
#import "AppDelegate.h"
@interface GameCategory (GameCategoryModel)
@property (weak,nonatomic) AppDelegate* appDelegate;

+(NSMutableArray* ) getAllGameCategories:(NSEntityDescription *) entity inManagedObjectContext :(NSManagedObjectContext *) context ;

+(GameCategory*) getGameCategory:(NSString *) categoryName withEntity:(NSEntityDescription *) entityDesc inManagedObjectContext :(NSManagedObjectContext *) context ;

+(void) addGameCategory:(NSString *) categoryName withEntity:(NSEntityDescription *) entity inManagedObjectContext :(NSManagedObjectContext *) context ;

+(int) deleteGameCategory:(NSString *) categoryName withEntity:(NSEntityDescription *) entity inManagedObjectContext :(NSManagedObjectContext *) context ;

+(int) updateGameCategory:(NSString *) categoryNameToUpdate withCategoryName :(NSString *) newGameCategory  withEntity:(NSEntityDescription *) entity inManagedObjectContext :(NSManagedObjectContext *) context ;
@end
