//
//  Theme+ThemeModel.m
//  Ludow2
//
//  Created by Guillaume ESTREM on 30/03/2015.
//  Copyright (c) 2015 JACQUEZ_ESTREM. All rights reserved.
//

#import "Theme+ThemeModel.h"

@implementation Theme (ThemeModel)
+(int) addTheme:(NSString *)  themeName  withEntity:(NSEntityDescription *) entityDesc inManagedObjectContext :(NSManagedObjectContext *) context {
    Theme* aTheme=nil;
    NSError* error = nil;
    
    
    NSFetchRequest* request = [[NSFetchRequest alloc] init];
    [request setEntity:entityDesc];
    NSPredicate* predicat = [NSPredicate predicateWithFormat:@"%K LIKE [c]%@",@"themeName",themeName];
    [request setPredicate:predicat];
    
    NSArray* result = [context executeFetchRequest:request error:&error];
    int res=0;
    
    if(!error){
        if([result count]==0){// il faut en créer un
            aTheme = [[Theme alloc] initWithEntity:entityDesc insertIntoManagedObjectContext:context];
            aTheme.themeName=themeName;
            res=1;
    
        }
    }
        return res;
    }

+(int) updateTheme:(NSString *) themeName  withName:(NSString*)newThemeName withEntity:(NSEntityDescription *) entityDesc inManagedObjectContext :(NSManagedObjectContext *) context {
    
        Theme* aTheme=nil;
        NSError* error = nil;
        
        
        NSFetchRequest* request = [[NSFetchRequest alloc] init];
        [request setEntity:entityDesc];
        NSPredicate* predicat = [NSPredicate predicateWithFormat:@"%K LIKE [c]%@",@"themeName",themeName];
        [request setPredicate:predicat];
        
        NSArray* result = [context executeFetchRequest:request error:&error];
        int res=0;
        
        if(!error){
            aTheme=result[0];
                aTheme.themeName=themeName;
                res=1;
                
            }
    
        return res;
    }


+(int) deleteTheme:(NSString *) themeName   withEntity:(NSEntityDescription *) entityDesc inManagedObjectContext :(NSManagedObjectContext *) context{
    Theme* aTheme=nil;
    NSError* error = nil;
    
    
    NSFetchRequest* request = [[NSFetchRequest alloc] init];
    [request setEntity:entityDesc];
    NSPredicate* predicat = [NSPredicate predicateWithFormat:@"%K LIKE [c]%@",@"themeName",themeName];
    [request setPredicate:predicat];
    
    NSArray* result = [context executeFetchRequest:request error:&error];
    int res=0;
    
    if(!error){
        aTheme=result[0];
        [context deleteObject:aTheme];
        res=1;
        
    }
    
    return res;
}

+(NSMutableArray* ) getAllThemes:(NSEntityDescription *) entityDesc inManagedObjectContext :(NSManagedObjectContext *) context {
    
    NSError* error = nil;
    NSMutableArray *ThemeList = [[NSMutableArray alloc] init];
    
    
    NSFetchRequest* request = [[NSFetchRequest alloc] init];
    [request setEntity:entityDesc];
    
    
    NSArray* result = [context executeFetchRequest:request error:&error];
    
    
    if(!error){
        
        
        
        for (  Theme *theme in result ) {
            
            
            
            [ThemeList addObject:theme.themeName];
            
            
        }
        
    }
    
    
    
    return ThemeList;
    
    
}


@end
