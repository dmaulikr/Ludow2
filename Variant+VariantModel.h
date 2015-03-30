//
//  Variant+VariantModel.h
//  Ludow2
//
//  Created by Guillaume ESTREM on 30/03/2015.
//  Copyright (c) 2015 JACQUEZ_ESTREM. All rights reserved.
//

#import "Variant.h"

@interface Variant (VariantModel)
+(int) addVariant:(NSString *) variantName withMaxPlayers:(NSNumber*) maxPlayers withMinAge:(NSNumber*) minAge withEntity:(NSEntityDescription *) entityDesc inManagedObjectContext :(NSManagedObjectContext *) context ;
+(int) addThemeToVariant:(NSString *) variantName withTheme:(Theme*) aTheme withEntity:(NSEntityDescription *) entityDesc inManagedObjectContext :(NSManagedObjectContext *) context ;

+(int) addDifficultyToVariant:(NSString *) variantName withDifficulty:(Difficulty*) aDifficulty withEntity:(NSEntityDescription *) entityDesc inManagedObjectContext :(NSManagedObjectContext *) context ;

+(int) addGameToVariant:(NSString *) variantName withGame:(Game*) aGame withEntity:(NSEntityDescription *) entityDesc inManagedObjectContext :(NSManagedObjectContext *) context ;


+(Variant*) getVariant:(NSString *) variantName  withEntity:(NSEntityDescription *) entityDesc inManagedObjectContext :(NSManagedObjectContext *) context ;


// add deleteVariant

@end
