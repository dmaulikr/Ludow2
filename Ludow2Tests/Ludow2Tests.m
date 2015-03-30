//
//  LudowTests.m
//  LudowTests
//
//  Created by Guillaume ESTREM on 07/03/2015.
//  Copyright (c) 2015 GESTREM-AJACQUEZ. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <XCTest/XCTest.h>
#import "GameCategory.h"
#import "Variant.h"
#import "Game.h"
#import "GameCategory+GameCategoryModel.h"
#import "Game+GameModel.h"
#import "Variant+VariantModel.h"
#import "Author+AuthorModel.h"
#import "Illustrator+IllustratorModel.h"
#import "Editor+EditorModel.h"
#import "Theme+ThemeModel.h"
#import "AppDelegate.h"

@interface LudowTests : XCTestCase
@property (weak,nonatomic) AppDelegate* appDelegate;

@end

@implementation LudowTests

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
    self->_appDelegate =[[UIApplication sharedApplication] delegate];
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testExample {
    // This is an example of a functional test case.
    XCTAssert(YES, @"Pass");
}
- (void)testadd {
    
}
- (void)testPerformanceExample {
    // This is an example of a performance test case.
    [self measureBlock:^{
        // Put the code you want to measure the time of here.
    }];
}


/** ####Test Functions from GameCategoryModel ####*/

- (void)testGetAllCategorie{
    NSManagedObjectContext *context = self.appDelegate.managedObjectContext;
    
    NSEntityDescription* entityDesc = [NSEntityDescription entityForName:@"GameCategory" inManagedObjectContext:context];
    NSMutableArray *result=[GameCategory getAllGameCategories:entityDesc inManagedObjectContext:context];
    NSLog(@"taille test %ld",[result count]);
    
    XCTAssertNotEqual([result count], 0,@"Il n'y a pas de categorie");
    
}

- (void)testAddCategory{
    NSManagedObjectContext *context = self.appDelegate.managedObjectContext;
    NSString *CategoryGame=@"Aventure";
    NSEntityDescription* entityDesc = [NSEntityDescription entityForName:@"GameCategory" inManagedObjectContext:context];
    [GameCategory addGameCategory:CategoryGame withEntity:entityDesc inManagedObjectContext:context];
    [self.appDelegate saveContext];
    
    
    }

- (void)testDeleteCategory{
    NSManagedObjectContext *context = self.appDelegate.managedObjectContext;
    NSString *CategoryGame=@"Aventure";
    NSEntityDescription* entityDesc = [NSEntityDescription entityForName:@"GameCategory" inManagedObjectContext:context];
    int res=[GameCategory deleteGameCategory:CategoryGame withEntity:entityDesc inManagedObjectContext:context];
    NSLog(@"detruit %d",res);
    [self.appDelegate saveContext];
    
    
}

- (void)testUpdateCategory{
    NSManagedObjectContext *context = self.appDelegate.managedObjectContext;
    NSString *CategoryGame=@"Aventure";
    NSString *newCategoryName=@"Toto";

    NSEntityDescription* entityDesc = [NSEntityDescription entityForName:@"GameCategory" inManagedObjectContext:context];
    int res=[GameCategory updateGameCategory:CategoryGame withCategoryName:newCategoryName withEntity:entityDesc inManagedObjectContext:context];
    NSLog(@"update %d",res);
    [self.appDelegate saveContext];
    
    
}

- (void)testAddGame{
    NSManagedObjectContext *context = self.appDelegate.managedObjectContext;
    NSString *gameName=@"Trivial Pursuit";
    
    NSEntityDescription* entityDesc = [NSEntityDescription entityForName:@"Game" inManagedObjectContext:context];
    [Game addGame:gameName withEntity:entityDesc inManagedObjectContext:context];
    [self.appDelegate saveContext];
    
    
}

- (void)testAddCategoryToGame{
    NSManagedObjectContext *context = self.appDelegate.managedObjectContext;
    NSString *gameName=@"Cluedo";
    NSString *gameCategoryName=@"Societe";

    
    NSEntityDescription* entityDescGame = [NSEntityDescription entityForName:@"Game" inManagedObjectContext:context];
    NSEntityDescription* entityDescCat = [NSEntityDescription entityForName:@"GameCategory" inManagedObjectContext:context];
    GameCategory *gameCategory=[GameCategory getGameCategory:gameCategoryName withEntity:entityDescCat inManagedObjectContext:context];
    NSLog(@"Categorie nom %@",gameCategory.categoryName);
    int res=[Game addCategoryToGame:gameName withGameCategory:gameCategory withEntity:entityDescGame inManagedObjectContext:context ];
    [self.appDelegate saveContext];
    
    
}

-(void)testGetAllGames{
    NSManagedObjectContext *context = self.appDelegate.managedObjectContext;

    NSEntityDescription* entityDescGame = [NSEntityDescription entityForName:@"Game" inManagedObjectContext:context];
  
    NSMutableArray *gameList=[Game getAllGames:entityDescGame inManagedObjectContext:context];
    NSLog(@"Taille %lu",[gameList count]);
}
-(void)testAddVariant{
    NSManagedObjectContext *context = self.appDelegate.managedObjectContext;
    
    NSEntityDescription* entityDesc = [NSEntityDescription entityForName:@"Variant" inManagedObjectContext:context];
    
    NSString * variantName = @"Multijoueur";
    NSNumber * minAge=[NSNumber numberWithInt:10];
    NSNumber * maxPlayers=[NSNumber numberWithInt:4];

    int res=[Variant addVariant:variantName withMaxPlayers:maxPlayers withMinAge:minAge withEntity:entityDesc inManagedObjectContext:context];
    NSLog(@"Variant Ok");
    [self.appDelegate saveContext];


}

-(void)testAddGameToVariant{
    NSManagedObjectContext *context = self.appDelegate.managedObjectContext;
    
    NSEntityDescription* entityDescVariant = [NSEntityDescription entityForName:@"Variant" inManagedObjectContext:context];
     NSEntityDescription* entityDescGame = [NSEntityDescription entityForName:@"Game" inManagedObjectContext:context];
    
    NSString * variantName = @"Multijoueur";
    NSString * gameName = @"Cluedo";

 
    Game *aGame=[Game getGame:gameName withEntity:entityDescGame inManagedObjectContext:context ];
    
   [Variant addGameToVariant:variantName withGame:aGame withEntity:entityDescVariant inManagedObjectContext:context];
    NSLog(@"Variant Ok");
    [self.appDelegate saveContext];
    
    
}

-(void)testAddAuthor{
    NSManagedObjectContext *context = self.appDelegate.managedObjectContext;
    
    NSEntityDescription* entityDesc = [NSEntityDescription entityForName:@"Author" inManagedObjectContext:context];
    
    NSString * authorName = @"Guillaume ESTREM";
    
    
    [Author addAuthor:authorName withEntity:entityDesc inManagedObjectContext:context ];
    
    [self.appDelegate saveContext];
    
    
}

-(void)testAddIllustrator{
    NSManagedObjectContext *context = self.appDelegate.managedObjectContext;
    
    NSEntityDescription* entityDesc = [NSEntityDescription entityForName:@"Illustrator" inManagedObjectContext:context];
    
    NSString * illustratorName = @"Guillaume ESTREM";
    
    
    [Illustrator addIllustrator:illustratorName withEntity:entityDesc inManagedObjectContext:context ];
    
    [self.appDelegate saveContext];
    
    
}

-(void)testAddEditor{
    NSManagedObjectContext *context = self.appDelegate.managedObjectContext;
    
    NSEntityDescription* entityDesc = [NSEntityDescription entityForName:@"Editor" inManagedObjectContext:context];
    
    NSString * editorName = @"Guillaume ESTREM";
    
    
    [Editor addEditor:editorName withEntity:entityDesc inManagedObjectContext:context];
    
    [self.appDelegate saveContext];
    
    
}

-(void)testAddTheme{
    NSManagedObjectContext *context = self.appDelegate.managedObjectContext;
    
    NSEntityDescription* entityDesc = [NSEntityDescription entityForName:@"Theme" inManagedObjectContext:context];
    
    NSString * themeName = @"Paris";
    
    
    [Theme addTheme:themeName withEntity:entityDesc inManagedObjectContext:context];
    [self.appDelegate saveContext];
    
    
}
-(void) testAjoutCategorie{
    
    
    //Jeu de cartes
    GameCategory* jeuDeCartes=nil;
    NSError* error = nil;
    NSEntityDescription* entityDesc = [NSEntityDescription entityForName:@"GameCategory" inManagedObjectContext:self.appDelegate.managedObjectContext];
    NSFetchRequest* request = [[NSFetchRequest alloc] init];
    [request setEntity:entityDesc];
    NSPredicate* predicat = [NSPredicate predicateWithFormat:@"%K LIKE [c]%@",@"categoryName",@"Enquete"];
    [request setPredicate:predicat];
    
    NSArray* result = [self.appDelegate.managedObjectContext executeFetchRequest:request error:&error];
    
    
    if(!error){
        if([result count]==0){// il faut en créer un
            jeuDeCartes = [[GameCategory alloc] initWithEntity:entityDesc insertIntoManagedObjectContext:self.appDelegate.managedObjectContext];
            jeuDeCartes.categoryName= @"Enquete";
        }
        else{ // une categorie jeu de cartes existe, on la récupère
            jeuDeCartes = result[0];
        }
    }
    XCTAssertNotNil(jeuDeCartes, @"jeuDeCartes n'existe pas !");
    XCTAssertEqualObjects(jeuDeCartes.categoryName, @"Enquete", @"Categorie avec un nom différent de jeuDeCartes !");
    [self.appDelegate saveContext];
    
    
}

-(void) testAjoutGame{
    
    
    //Monopoly
    Game* monopoly=nil;
    NSError* error = nil;
    NSEntityDescription* entityDesc = [NSEntityDescription entityForName:@"Game" inManagedObjectContext:self.appDelegate.managedObjectContext];
    NSFetchRequest* request = [[NSFetchRequest alloc] init];
    [request setEntity:entityDesc];
    NSPredicate* predicat = [NSPredicate predicateWithFormat:@"%K LIKE [c]%@",@"gameName",@"Tarot"];
    [request setPredicate:predicat];
    
    NSArray* result = [self.appDelegate.managedObjectContext executeFetchRequest:request error:&error];
    
    
    if(!error){
        if([result count]==0){// il faut en créer un
            monopoly = [[Game alloc] initWithEntity:entityDesc insertIntoManagedObjectContext:self.appDelegate.managedObjectContext];
            monopoly.gameName= @"Tarot";
        }
        else{ // le jeu existe, on le récupère
            monopoly = result[0];
        }
    }
    XCTAssertNotNil(monopoly, @"monopoly n'existe pas !");
    XCTAssertEqualObjects(monopoly.gameName, @"Tarot", @"jeu avec un nom différent de monopoly !");
    
    
}


-(void) testDeleteGame{
    
    
    //Monopoly
    Game* monopoly=nil;
    NSError* error = nil;
    NSManagedObjectContext *context = self.appDelegate.managedObjectContext;
    
    NSEntityDescription* entityDesc = [NSEntityDescription entityForName:@"Game" inManagedObjectContext:self.appDelegate.managedObjectContext];
    NSFetchRequest* request = [[NSFetchRequest alloc] init];
    [request setEntity:entityDesc];
    NSPredicate* predicat = [NSPredicate predicateWithFormat:@"%K LIKE [c]%@",@"gameName",@"Tarot"];
    [request setPredicate:predicat];
    
    NSArray* result = [self.appDelegate.managedObjectContext executeFetchRequest:request error:&error];
    
    
    if(!error){
        if([result count]==0){// il faut en créer un
            
        }
        else{ // le jeu existe, on le récupère
            monopoly = result[0];
            [context deleteObject:monopoly];
            
        }
    }
    XCTAssertNotNil(monopoly, @"monopoly n'existe pas !");
    XCTAssertEqualObjects(monopoly.gameName, @"Tarot", @"jeu avec un nom différent de monopoly !");
    [self.appDelegate saveContext];
    
    
}

- (void)testUpdateGame {
    NSError *error = nil;
    
    //This is your NSManagedObject subclass
    Game * tarot = nil;
    
    //Set up to get the thing you want to update
    NSFetchRequest * request = [[NSFetchRequest alloc] init];
    [request setEntity:[NSEntityDescription entityForName:@"Game" inManagedObjectContext:self.appDelegate.managedObjectContext]];
    NSPredicate* predicat = [NSPredicate predicateWithFormat:@"%K LIKE [c]%@",@"gameName",@"monopoly"];
    [request setPredicate:predicat];
    
    //Ask for it
    tarot = [[self.appDelegate.managedObjectContext executeFetchRequest:request error:&error] lastObject];
    
    if (error) {
        //Handle any errors
    }
    
    if (!tarot) {
        //Nothing there to update
    }
    
    //Update the object
    tarot.gameName= @"Tarot";
    
    //Save it
    [self.appDelegate saveContext];
    
    
}
- (void)testAddVariantSet {
    NSManagedObjectContext *context = self.appDelegate.managedObjectContext;
    NSMutableSet* setVariants = [NSMutableSet set];
    
    Variant* variant = [NSEntityDescription insertNewObjectForEntityForName: @"Variant" inManagedObjectContext: context];
    variant.variantName=@"New York";
    //variant.gameName=@"Cluedo";
    variant.maxPlayer=[NSNumber numberWithInt:6];
    variant.minAge=[NSNumber numberWithInt:2];
    
    [setVariants addObject: variant];
    [self.appDelegate saveContext];
    
    
    
    
}
-(void) testAddFullGame{
    
    //Monopoly
    GameCategory* gameCategory=nil;
    NSError* error = nil;
    NSManagedObjectContext *context = self.appDelegate.managedObjectContext;
    
    NSEntityDescription* entityDesc = [NSEntityDescription entityForName:@"GameCategory" inManagedObjectContext:context];
    NSFetchRequest* request = [[NSFetchRequest alloc] init];
    [request setEntity:entityDesc];
    NSPredicate* predicat = [NSPredicate predicateWithFormat:@"%K LIKE [c]%@",@"categoryName",@"Enquet2"];
    [request setPredicate:predicat];
    
    NSArray* result = [context executeFetchRequest:request error:&error];
    
    
    if(!error){
        if([result count]==0){// il faut en créer un
            
            gameCategory= [[GameCategory alloc] initWithEntity:entityDesc insertIntoManagedObjectContext:context];
            gameCategory.categoryName=@"Enquet2";
            Game* aGame = [NSEntityDescription insertNewObjectForEntityForName: @"Game" inManagedObjectContext: context];
            aGame.gameName=@"Cluedo";
            [gameCategory addCategoryGameObject:aGame];
            
            
        }
        else{ // le jeu existe, on le récupère
            
            
        }
    }
    //XCTAssertNotNil(monopoly, @"monopoly n'existe pas !");
    //XCTAssertEqualObjects(monopoly.gameName, @"Tarot", @"jeu avec un nom différent de monopoly !");
    [self.appDelegate saveContext];
    
    
    
    
}

- (void)testUpdateVariantInGame {
    NSError *error = nil;
    
    //This is your NSManagedObject subclass
    Game * aGame = nil;
    // on créé la variante
    
    NSManagedObjectContext *context = self.appDelegate.managedObjectContext;
    
    Variant* variant = [NSEntityDescription insertNewObjectForEntityForName: @"Variant" inManagedObjectContext: context];
    variant.variantName=@"Tokyo";
    variant.maxPlayer=[NSNumber numberWithInt:3];
    variant.minAge=[NSNumber numberWithInt:1];
    //[setVariants addObject: variant];
    
    
    
    
    
    NSEntityDescription* entityDesc = [NSEntityDescription entityForName:@"Game" inManagedObjectContext:self.appDelegate.managedObjectContext];
    NSFetchRequest* request = [[NSFetchRequest alloc] init];
    [request setEntity:entityDesc];
    NSPredicate* predicat = [NSPredicate predicateWithFormat:@"%K LIKE [c]%@",@"gameName",@"Cluedo"];
    [request setPredicate:predicat];
    
    NSArray* result = [context executeFetchRequest:request error:&error];
    
    if(!error){
        if([result count]==0){// il faut en créer un
            aGame= [[Game alloc] initWithEntity:entityDesc insertIntoManagedObjectContext:context];
            aGame.gameName= @"Bridge1";
            //[tarot addGameVariants: setVariants];
            
            
        }
        else{ // le jeu existe, on le récupère
            aGame = result[0];
        }
    }
    XCTAssertNotNil(aGame, @"monopoly n'existe pas !");
    XCTAssertEqualObjects(aGame.gameName, @"Bridge1", @"jeu avec un nom différent de monopoly !");
    
    
    
    
    //Save it
    [self.appDelegate saveContext];
    
    
}

-(void) testReturnAllCategorie{
    
    
    //Jeu de cartes
    NSError* error = nil;
    NSEntityDescription* entityDesc = [NSEntityDescription entityForName:@"GameCategory" inManagedObjectContext:self.appDelegate.managedObjectContext];
    NSFetchRequest* request = [[NSFetchRequest alloc] init];
    [request setEntity:entityDesc];
    
    
    NSArray* result = [self.appDelegate.managedObjectContext executeFetchRequest:request error:&error];
    
    
    if(!error){
        NSLog(@"Nombre categorue %lu",(unsigned long)[result count]);
    }
}





@end
