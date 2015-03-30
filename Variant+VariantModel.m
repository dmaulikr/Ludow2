//
//  Variant+VariantModel.m
//  Ludow2
//
//  Created by Guillaume ESTREM on 30/03/2015.
//  Copyright (c) 2015 JACQUEZ_ESTREM. All rights reserved.
//

#import "Variant+VariantModel.h"

@implementation Variant (VariantModel)

+(int) addVariant:(NSString *) variantName withMaxPlayers:(NSNumber*) maxPlayers withMinAge:(NSNumber*) minAge withEntity:(NSEntityDescription *) entityDesc inManagedObjectContext :(NSManagedObjectContext *) context {
    
    
    Variant* aVariant=nil;
    NSError* error = nil;
    
    
    NSFetchRequest* request = [[NSFetchRequest alloc] init];
    [request setEntity:entityDesc];
    NSPredicate* predicat = [NSPredicate predicateWithFormat:@"%K LIKE [c]%@",@"variantName",variantName];
    [request setPredicate:predicat];
    
    NSArray* result = [context executeFetchRequest:request error:&error];
    int res=0;
    
    if(!error){
        if([result count]==0){// il faut en créer un
            aVariant = [[Variant alloc] initWithEntity:entityDesc insertIntoManagedObjectContext:context];
            aVariant.variantName=variantName;
            aVariant.maxPlayer=maxPlayers;
            aVariant.minAge=minAge;
            res=1;

        }
    }
    return res;
}
+(int) addThemeToVariant:(NSString *) variantName withTheme:(Theme*) aTheme withEntity:(NSEntityDescription *) entityDesc inManagedObjectContext :(NSManagedObjectContext *) context {
    
    
    
    Variant* aVariant=nil;
    NSError* error = nil;
    
    
    NSFetchRequest* request = [[NSFetchRequest alloc] init];
    [request setEntity:entityDesc];
    NSPredicate* predicat = [NSPredicate predicateWithFormat:@"%K LIKE [c]%@",@"variantName",variantName];
    [request setPredicate:predicat];
    
    NSArray* result = [context executeFetchRequest:request error:&error];
    int res=0;
    
    if(!error){
        aVariant=result[0];
        aVariant.variantTheme=aTheme;
        res=1;
            }
    return res;

}
+(int) addDifficultyToVariant:(NSString *) variantName withDifficulty:(Difficulty*) aDifficulty withEntity:(NSEntityDescription *) entityDesc inManagedObjectContext :(NSManagedObjectContext *) context {
    
    Variant* aVariant=nil;
    NSError* error = nil;
    
    
    NSFetchRequest* request = [[NSFetchRequest alloc] init];
    [request setEntity:entityDesc];
    NSPredicate* predicat = [NSPredicate predicateWithFormat:@"%K LIKE [c]%@",@"variantName",variantName];
    [request setPredicate:predicat];
    
    NSArray* result = [context executeFetchRequest:request error:&error];
    int res=0;
    
    if(!error){
        aVariant=result[0];
        
        aVariant.variantDifficulty=aDifficulty;
        res=1;
    }
    return res;
}
+(int) addGameToVariant:(NSString *) variantName withGame:(Game*) aGame withEntity:(NSEntityDescription *) entityDesc inManagedObjectContext :(NSManagedObjectContext *) context {
    
    Variant* aVariant=nil;
    NSError* error = nil;
    
    
    NSFetchRequest* request = [[NSFetchRequest alloc] init];
    [request setEntity:entityDesc];
    NSPredicate* predicat = [NSPredicate predicateWithFormat:@"%K LIKE [c]%@",@"variantName",variantName];
    [request setPredicate:predicat];
    
    NSArray* result = [context executeFetchRequest:request error:&error];
    int res=0;
    
    if(!error){
        aVariant=result[0];
        aVariant.variantGame=aGame;
        res=1;
    }
    return res;
    
}




+(Variant*) getVariant:(NSString *) variantName  withEntity:(NSEntityDescription *) entityDesc inManagedObjectContext :(NSManagedObjectContext *) context {
    
    
    
    Variant* aVariant=nil;
    NSError* error = nil;
    
    
    NSFetchRequest* request = [[NSFetchRequest alloc] init];
    [request setEntity:entityDesc];
    NSPredicate* predicat = [NSPredicate predicateWithFormat:@"%K LIKE [c]%@",@"variantName",variantName];
    [request setPredicate:predicat];
    
    NSArray* result = [context executeFetchRequest:request error:&error];
    
    if(!error){
        aVariant=result[0];
        
        
    }
    return aVariant;
    
}

@end
