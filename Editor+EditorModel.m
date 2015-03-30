//
//  Editor+EditorModel.m
//  Ludow2
//
//  Created by Guillaume ESTREM on 30/03/2015.
//  Copyright (c) 2015 JACQUEZ_ESTREM. All rights reserved.
//

#import "Editor+EditorModel.h"

@implementation Editor (EditorModel)


+(int) addEditor:(NSString *)  editorName  withEntity:(NSEntityDescription *) entityDesc inManagedObjectContext :(NSManagedObjectContext *) context {
    
    
    Editor* anEditor=nil;
    NSError* error = nil;
    
    
    NSFetchRequest* request = [[NSFetchRequest alloc] init];
    [request setEntity:entityDesc];
    NSPredicate* predicat = [NSPredicate predicateWithFormat:@"%K LIKE [c]%@",@"editorName",editorName];
    [request setPredicate:predicat];
    
    NSArray* result = [context executeFetchRequest:request error:&error];
    int res=0;
    
    if(!error){
        if([result count]==0){// il faut en créer un
            anEditor = [[Editor alloc] initWithEntity:entityDesc insertIntoManagedObjectContext:context];
            anEditor.editorName=editorName;
            res=1;
        }
    }
    
    return res;

}
+(int) updateEditor:(NSString *) editorName  withName:(NSString*)newEditorName withEntity:(NSEntityDescription *) entityDesc inManagedObjectContext :(NSManagedObjectContext *) context {
    
    Editor* anEditor=nil;
    NSError* error = nil;
    
    
    NSFetchRequest* request = [[NSFetchRequest alloc] init];
    [request setEntity:entityDesc];
    NSPredicate* predicat = [NSPredicate predicateWithFormat:@"%K LIKE [c]%@",@"editorName",editorName];
    [request setPredicate:predicat];
    
    NSArray* result = [context executeFetchRequest:request error:&error];
    int res=0;
    
    if(!error){
        anEditor=result[0];
        anEditor.editorName=newEditorName;
            res=1;
        }
    
    
    return res;
}

+(int) deleteEditor:(NSString *) editorName   withEntity:(NSEntityDescription *) entityDesc inManagedObjectContext :(NSManagedObjectContext *) context {
    
    Editor* anEditor=nil;
    NSError* error = nil;
    
    
    NSFetchRequest* request = [[NSFetchRequest alloc] init];
    [request setEntity:entityDesc];
    NSPredicate* predicat = [NSPredicate predicateWithFormat:@"%K LIKE [c]%@",@"editorName",editorName];
    [request setPredicate:predicat];
    
    NSArray* result = [context executeFetchRequest:request error:&error];
    int res=0;
    
    if(!error){
        anEditor=result[0];
        [context deleteObject:anEditor];
        res=1;
    }
    
    
    return res;
}
@end
