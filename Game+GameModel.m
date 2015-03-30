//
//  Game+GameModel.m
//  Ludow2
//
//  Created by Guillaume ESTREM on 30/03/2015.
//  Copyright (c) 2015 JACQUEZ_ESTREM. All rights reserved.
//

#import "Game+GameModel.h"

@implementation Game (GameModel)

+(void) addGame:(NSString *) gameName withEntity:(NSEntityDescription *) entityDesc inManagedObjectContext :(NSManagedObjectContext *) context {
    
    
    Game* aGame=nil;
    NSError* error = nil;
    
    
    NSFetchRequest* request = [[NSFetchRequest alloc] init];
    [request setEntity:entityDesc];
    //On vérifie qu'il n'y ait pas déjà cette fonction dans la base
    NSPredicate* predicat = [NSPredicate predicateWithFormat:@"%K LIKE [c]%@",@"gameName",gameName];
    [request setPredicate:predicat];
    
    NSArray* result = [context executeFetchRequest:request error:&error];
    
    
    if(!error){
        if([result count]==0){// il faut en créer un
            aGame = [[Game alloc] initWithEntity:entityDesc insertIntoManagedObjectContext:context];
            aGame.gameName=gameName;
        }
    }
    
    
}


+(int) UpdateGame:(NSString *) gameName withNewGame:(NSString*)newGameName withEntity:(NSEntityDescription *) entityDesc inManagedObjectContext :(NSManagedObjectContext *) context {
    
    Game* aGame=nil;
    NSError* error = nil;
    
    
    NSFetchRequest* request = [[NSFetchRequest alloc] init];
    [request setEntity:entityDesc];
    //On vérifie qu'il n'y ait pas déjà cette fonction dans la base
    NSPredicate* predicat = [NSPredicate predicateWithFormat:@"%K LIKE [c]%@",@"gameName",gameName];
    [request setPredicate:predicat];
    
    NSArray* result = [context executeFetchRequest:request error:&error];
    int res=0;
    
    if(!error){
        aGame=result[0];
        aGame.gameName=newGameName;
        res=1;
           }
    return res;
}


+(int) deleteGame:(NSString *) gameName  withEntity:(NSEntityDescription *) entity inManagedObjectContext :(NSManagedObjectContext *) context {
    
    NSError *error = nil;
    Game *gameToUpdate=nil;
    
    NSFetchRequest * request = [[NSFetchRequest alloc] init];
    [request setEntity:[NSEntityDescription entityForName:@"Game" inManagedObjectContext:context]];
    NSPredicate* predicat = [NSPredicate predicateWithFormat:@"%K LIKE [c]%@",@"gameName",gameName];
    [request setPredicate:predicat];
    NSArray* result = [context executeFetchRequest:request error:&error];
    int res=1;
    
    if(!error){
        if([result count]==0){
            res=0; // aucun objet à supprimer
        }
        else{
            gameToUpdate = result[0];
            [context deleteObject:gameToUpdate];
        }
        
    }
    return res;
    
}

+(int) addCategoryToGame:(NSString *) gameName withGameCategory:(GameCategory*)gameCategory withEntity:(NSEntityDescription *) entity inManagedObjectContext :(NSManagedObjectContext *) context {
    
    NSError *error = nil;
    Game *gameToUpdate=nil;
    
    NSFetchRequest * request = [[NSFetchRequest alloc] init];
    [request setEntity:[NSEntityDescription entityForName:@"Game" inManagedObjectContext:context]];
    NSPredicate* predicat = [NSPredicate predicateWithFormat:@"%K LIKE [c]%@",@"gameName",gameName];
    [request setPredicate:predicat];
    NSArray* result = [context executeFetchRequest:request error:&error];
    
    
    int res=1;
    
    if(!error){
        if([result count]==0){
            res=0; // aucun objet à supprimer
        }
        else{
            gameToUpdate = result[0];
            gameToUpdate.gameCategory=gameCategory;
        }
        
    }
    return res;
    
}




+(int) deleteVariantToGame:(NSString *) gameName  withVariant:(NSSet*) variantSet
             withEntity:(NSEntityDescription *) entity inManagedObjectContext :(NSManagedObjectContext *) context {
    
    NSError *error = nil;
    Game *aGame=nil;
    
    NSFetchRequest * request = [[NSFetchRequest alloc] init];
    [request setEntity:[NSEntityDescription entityForName:@"Game" inManagedObjectContext:context]];
    NSPredicate* predicat = [NSPredicate predicateWithFormat:@"%K LIKE [c]%@",@"gameName",gameName];
    [request setPredicate:predicat];
    NSArray* result = [context executeFetchRequest:request error:&error];
    
    
    int res=1;
    
    if(!error){
        if([result count]==0){
            res=0; // aucun objet à supprimer
        }
        else{
            aGame= result[0];
            [aGame removeGameVariants:variantSet];
        }
        
    }
    return res;
    
}

+(NSMutableArray* ) getAllGames:(NSEntityDescription *) entityDesc inManagedObjectContext :(NSManagedObjectContext *) context {
    
    
    Game* game=nil;
    NSError* error = nil;
    NSMutableArray *GameList = [[NSMutableArray alloc] init];
    
    
    NSFetchRequest* request = [[NSFetchRequest alloc] init];
    [request setEntity:entityDesc];
    
    
    NSArray* result = [context executeFetchRequest:request error:&error];
    
    
    if(!error){
        
        
        
        for ( game in result ) {
            
            
            
            [GameList addObject:game.gameName];
            
            
        }
        
    }
    
    
    
    return GameList;
}


+(Game*) getGame:(NSString *) gameName withEntity:(NSEntityDescription *) entityDesc inManagedObjectContext :(NSManagedObjectContext *) context {
    
    
    Game* aGame=nil;
    NSError* error = nil;
    
    
    NSFetchRequest* request = [[NSFetchRequest alloc] init];
    [request setEntity:entityDesc];
    //On vérifie qu'il n'y ait pas déjà cette fonction dans la base
    NSPredicate* predicat = [NSPredicate predicateWithFormat:@"%K LIKE [c]%@",@"gameName",gameName];
    [request setPredicate:predicat];
    
    NSArray* result = [context executeFetchRequest:request error:&error];

    if(!error){
        aGame=result[0];
            
            
        }
    
    
        return aGame;
}

@end
