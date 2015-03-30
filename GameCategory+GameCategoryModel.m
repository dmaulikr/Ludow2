//
//  GameCategory+GameCategoryModel.m
//  Ludow2
//
//  Created by Guillaume ESTREM on 23/03/2015.
//  Copyright (c) 2015 JACQUEZ_ESTREM. All rights reserved.
//

#import "GameCategory+GameCategoryModel.h"

@implementation GameCategory (GameCategoryModel)

+(NSMutableArray* ) getAllGameCategories:(NSEntityDescription *) entityDesc inManagedObjectContext :(NSManagedObjectContext *) context {
    
    
    GameCategory* gameCategory=nil;
    NSError* error = nil;
    NSMutableArray *GameCategoryList = [[NSMutableArray alloc] init];
    
    
    NSFetchRequest* request = [[NSFetchRequest alloc] init];
    [request setEntity:entityDesc];
    
    
    NSArray* result = [context executeFetchRequest:request error:&error];
    
    
    if(!error){
        
        
        
        for ( gameCategory in result ) {
            
            
            
            [GameCategoryList addObject:gameCategory.categoryName];
            
            
        }
        
    }
    
    
    
    return GameCategoryList;
}

+(void) addGameCategory:(NSString *) categoryName withEntity:(NSEntityDescription *) entityDesc inManagedObjectContext :(NSManagedObjectContext *) context {
    
    
    GameCategory* aGameCategory=nil;
    NSError* error = nil;
    
    
    NSFetchRequest* request = [[NSFetchRequest alloc] init];
    [request setEntity:entityDesc];
    //On vérifie qu'il n'y ait pas déjà cette fonction dans la base
    NSPredicate* predicat = [NSPredicate predicateWithFormat:@"%K LIKE [c]%@",@"categoryName",categoryName];
    [request setPredicate:predicat];
    
    NSArray* result = [context executeFetchRequest:request error:&error];
    
    
    if(!error){
        if([result count]==0){// il faut en créer un
            aGameCategory = [[GameCategory alloc] initWithEntity:entityDesc insertIntoManagedObjectContext:context];
            aGameCategory.categoryName=categoryName;
        }
    }
    
    
}

+(int) deleteGameCategory:(NSString *) categoryName withEntity:(NSEntityDescription *) entity inManagedObjectContext :(NSManagedObjectContext *) context {
    GameCategory *gameCategoryToDelete=nil;
    NSError* error = nil;

    NSFetchRequest* request = [[NSFetchRequest alloc] init];
    [request setEntity:entity];
    NSPredicate* predicat = [NSPredicate predicateWithFormat:@"%K LIKE [c]%@",@"categoryName",categoryName];
    [request setPredicate:predicat];

    NSArray* result = [context executeFetchRequest:request error:&error];
    int res=1;

    if(!error){
        if([result count]==0){
            res=0; // aucun objet à supprimer
        }
        else{
            gameCategoryToDelete = result[0];
            [context deleteObject:gameCategoryToDelete];
        }
    
    }
    return res;
}

+(int) updateGameCategory:(NSString *) categoryNameToUpdate withCategoryName :(NSString *) newGameCategory  withEntity:(NSEntityDescription *) entity inManagedObjectContext :(NSManagedObjectContext *) context{
    
    NSError *error = nil;
    GameCategory *gameCategoryToUpdate=nil;

    NSFetchRequest * request = [[NSFetchRequest alloc] init];
    [request setEntity:[NSEntityDescription entityForName:@"GameCategory" inManagedObjectContext:context]];
    NSPredicate* predicat = [NSPredicate predicateWithFormat:@"%K LIKE [c]%@",@"categoryName",categoryNameToUpdate];
    [request setPredicate:predicat];
    NSArray* result = [context executeFetchRequest:request error:&error];
    int res=1;
    
    if(!error){
        if([result count]==0){
            res=0; // aucun objet à supprimer
        }
        else{
            gameCategoryToUpdate = result[0];
            gameCategoryToUpdate.categoryName=newGameCategory;
        }
        
    }
    return res;
   

}

+(GameCategory*) getGameCategory:(NSString *) categoryName withEntity:(NSEntityDescription *) entityDesc inManagedObjectContext :(NSManagedObjectContext *) context {
    
    
    GameCategory* aGameCategory=nil;
    NSError* error = nil;
    
    
    NSFetchRequest* request = [[NSFetchRequest alloc] init];
    [request setEntity:entityDesc];
    //On vérifie qu'il n'y ait pas déjà cette fonction dans la base
    NSPredicate* predicat = [NSPredicate predicateWithFormat:@"%K LIKE [c]%@",@"categoryName",categoryName];
    [request setPredicate:predicat];
    
    NSArray* result = [context executeFetchRequest:request error:&error];
    
    
    if(!error){
        
        aGameCategory=result[0];
       
}
    return aGameCategory;

}

@end

