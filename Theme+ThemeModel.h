//
//  Theme+ThemeModel.h
//  Ludow2
//
//  Created by Guillaume ESTREM on 30/03/2015.
//  Copyright (c) 2015 JACQUEZ_ESTREM. All rights reserved.
//

#import "Theme.h"

@interface Theme (ThemeModel)

+(int) addTheme:(NSString *)  themeName  withEntity:(NSEntityDescription *) entityDesc inManagedObjectContext :(NSManagedObjectContext *) context ;

+(int) updateTheme:(NSString *) themeName  withName:(NSString*)newThemeName withEntity:(NSEntityDescription *) entityDesc inManagedObjectContext :(NSManagedObjectContext *) context ;

+(int) deleteTheme:(NSString *) themeName   withEntity:(NSEntityDescription *) entityDesc inManagedObjectContext :(NSManagedObjectContext *) context;

+(NSMutableArray* ) getAllThemes:(NSEntityDescription *) entity inManagedObjectContext :(NSManagedObjectContext *) context ;

@end
