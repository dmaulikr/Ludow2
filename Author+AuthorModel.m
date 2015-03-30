//
//  Author+AuthorModel.m
//  Ludow2
//
//  Created by Guillaume ESTREM on 30/03/2015.
//  Copyright (c) 2015 JACQUEZ_ESTREM. All rights reserved.
//

#import "Author+AuthorModel.h"

@implementation Author (AuthorModel)

+(int) addAuthor:(NSString *) authorName withEntity:(NSEntityDescription *) entityDesc inManagedObjectContext :(NSManagedObjectContext *) context {
    
    
    Author* anAuthor=nil;
    NSError* error = nil;
    
    
    NSFetchRequest* request = [[NSFetchRequest alloc] init];
    [request setEntity:entityDesc];
    //On vérifie qu'il n'y ait pas déjà cette fonction dans la base
    NSPredicate* predicat = [NSPredicate predicateWithFormat:@"%K LIKE [c]%@",@"authorName",authorName];
    [request setPredicate:predicat];
    
    NSArray* result = [context executeFetchRequest:request error:&error];
    int res=0;
    
    if(!error){
        if([result count]==0){// il faut en créer un
            anAuthor = [[Author alloc] initWithEntity:entityDesc insertIntoManagedObjectContext:context];
            anAuthor.authorName=authorName;
            res=1;
        }
    }

    return res;
    
}

+(int) updateAuthor :(NSString *) authorName withNewName:(NSString*) newAuthorName withEntity:(NSEntityDescription *) entityDesc inManagedObjectContext :(NSManagedObjectContext *) context {
    Author* anAuthor=nil;
    NSError* error = nil;
    
    
    NSFetchRequest* request = [[NSFetchRequest alloc] init];
    [request setEntity:entityDesc];
    NSPredicate* predicat = [NSPredicate predicateWithFormat:@"%K LIKE [c]%@",@"authorName",authorName];
    [request setPredicate:predicat];
    
    NSArray* result = [context executeFetchRequest:request error:&error];
    int res=0;
    
    if(!error){
        anAuthor=result[0];
        anAuthor.authorName=newAuthorName;
        res=1;
    }
    return res;
}

@end
