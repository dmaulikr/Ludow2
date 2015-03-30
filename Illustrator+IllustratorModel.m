//
//  Illustrator+IllustratorModel.m
//  Ludow2
//
//  Created by Guillaume ESTREM on 30/03/2015.
//  Copyright (c) 2015 JACQUEZ_ESTREM. All rights reserved.
//

#import "Illustrator+IllustratorModel.h"

@implementation Illustrator (IllustratorModel)

+(int) addIllustrator:(NSString *) IllustratorName withEntity:(NSEntityDescription *) entityDesc inManagedObjectContext :(NSManagedObjectContext *) context {
    
    
    Illustrator* anIllustrator=nil;
    NSError* error = nil;
    
    
    NSFetchRequest* request = [[NSFetchRequest alloc] init];
    [request setEntity:entityDesc];
    NSPredicate* predicat = [NSPredicate predicateWithFormat:@"%K LIKE [c]%@",@"illustratorName",IllustratorName];
    [request setPredicate:predicat];
    
    NSArray* result = [context executeFetchRequest:request error:&error];
    int res=0;
    
    if(!error){
        if([result count]==0){// il faut en créer un
            anIllustrator = [[Illustrator alloc] initWithEntity:entityDesc insertIntoManagedObjectContext:context];
            anIllustrator.illustratorName=IllustratorName;
            res=1;
        }
    }
    
    return res;
    
}

+(int) updateIllustrator:(NSString *) IllustratorName withName:(NSString*) newIllustratorName withEntity:(NSEntityDescription *) entityDesc inManagedObjectContext :(NSManagedObjectContext *) context {
    
    
    Illustrator* anIllustrator=nil;
    NSError* error = nil;
    
    
    NSFetchRequest* request = [[NSFetchRequest alloc] init];
    [request setEntity:entityDesc];
    //On vérifie qu'il n'y ait pas déjà cette fonction dans la base
    NSPredicate* predicat = [NSPredicate predicateWithFormat:@"%K LIKE [c]%@",@"illustratorName",IllustratorName];
    [request setPredicate:predicat];
    
    NSArray* result = [context executeFetchRequest:request error:&error];
    int res=0;
    
    if(!error){
        anIllustrator=result[0];
        anIllustrator.illustratorName=newIllustratorName;
        res=1;
            }
    
    return res;
    
}


@end
