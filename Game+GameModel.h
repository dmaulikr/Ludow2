//
//  Game+GameModel.h
//  Ludow2
//
//  Created by Guillaume ESTREM on 30/03/2015.
//  Copyright (c) 2015 JACQUEZ_ESTREM. All rights reserved.
//

#import "Game.h"

@interface Game (GameModel)

+(void) addGame:(NSString *) gameName withEntity:(NSEntityDescription *) entity inManagedObjectContext :(NSManagedObjectContext *) context ;

+(int) UpdateGame:(NSString *) gameName withNewGame:(NSString*)newGameName withEntity:(NSEntityDescription *) entity inManagedObjectContext :(NSManagedObjectContext *) context ;

+(int) addCategoryToGame:(NSString *) gameName withGameCategory:(GameCategory*)gameCategory withEntity:(NSEntityDescription *) entity inManagedObjectContext :(NSManagedObjectContext *) context ;



+(int) deleteGame:(NSString *) gameName withEntity:(NSEntityDescription *) entity inManagedObjectContext :(NSManagedObjectContext *) context ;

+(NSMutableArray* ) getAllGames:(NSEntityDescription *) entity inManagedObjectContext :(NSManagedObjectContext *) context ;

+(Game*) getGame:(NSString *) gameName withEntity:(NSEntityDescription *) entity inManagedObjectContext :(NSManagedObjectContext *) context ;
@end
