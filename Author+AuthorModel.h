//
//  Author+AuthorModel.h
//  Ludow2
//
//  Created by Guillaume ESTREM on 30/03/2015.
//  Copyright (c) 2015 JACQUEZ_ESTREM. All rights reserved.
//

#import "Author.h"

@interface Author (AuthorModel)

+(int) addAuthor:(NSString *) authorName  withEntity:(NSEntityDescription *) entityDesc inManagedObjectContext :(NSManagedObjectContext *) context ;


+(int) updateAuthor :(NSString *) authorName withNewName:(NSString*) newAuthorName withEntity:(NSEntityDescription *) entityDesc inManagedObjectContext :(NSManagedObjectContext *) context ;


@end
