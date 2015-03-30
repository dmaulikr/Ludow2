//
//  Editor+EditorModel.h
//  Ludow2
//
//  Created by Guillaume ESTREM on 30/03/2015.
//  Copyright (c) 2015 JACQUEZ_ESTREM. All rights reserved.
//

#import "Editor.h"

@interface Editor (EditorModel)

+(int) addEditor:(NSString *)  editorName  withEntity:(NSEntityDescription *) entityDesc inManagedObjectContext :(NSManagedObjectContext *) context ;
+(int) updateEditor:(NSString *) editorName  withName:(NSString*)newEditorName withEntity:(NSEntityDescription *) entityDesc inManagedObjectContext :(NSManagedObjectContext *) context ;

+(int) deleteEditor:(NSString *) editorName   withEntity:(NSEntityDescription *) entityDesc inManagedObjectContext :(NSManagedObjectContext *) context;
@end
