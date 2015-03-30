//
//  Illustrator+IllustratorModel.h
//  Ludow2
//
//  Created by Guillaume ESTREM on 30/03/2015.
//  Copyright (c) 2015 JACQUEZ_ESTREM. All rights reserved.
//

#import "Illustrator.h"

@interface Illustrator (IllustratorModel)

+(int) addIllustrator:(NSString *)  illustratorName  withEntity:(NSEntityDescription *) entityDesc inManagedObjectContext :(NSManagedObjectContext *) context ;
+(int) updateIllustrator:(NSString *) illustratorName  withName:(NSString*)newIllustratorName withEntity:(NSEntityDescription *) entityDesc inManagedObjectContext :(NSManagedObjectContext *) context ;

@end
