//
//  AddingGameViewController.m
//  ludo2
//
//  Created by JACQUEZ on 22/03/2015.
//  Copyright (c) 2015 JACQUEZ_ESTREM. All rights reserved.
//

#import "AddingGameViewController.h"
#import "GameCategory+GameCategoryModel.h"
#import "AppDelegate.h"

@interface AddingGameViewController ()
{
    NSMutableArray *_pickerData; //category data
    NSArray *_pickerData1; //language data
}
@property (weak,nonatomic) AppDelegate* appDelegate;

@end

@implementation AddingGameViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    //Charge le appDelegate
    self->_appDelegate = [[UIApplication sharedApplication]delegate];
    
    /******PICKER VIEW CATEGORY ********/
    // set the frame to zero
    self.categoryPicker = [[UIPickerView alloc] init];
    /*********** Create NSMutableArray _pickerData ********/
    // On recupere la liste des categories
    
    NSManagedObjectContext *context = self.appDelegate.managedObjectContext;
    
    NSEntityDescription* entityDesc = [NSEntityDescription entityForName:@"GameCategory" inManagedObjectContext:context];
    _pickerData=[GameCategory getAllGameCategories:entityDesc inManagedObjectContext:context];
    NSLog(@"taille picker %ld",[_pickerData count]);
    
    
    /****** Fin creation NSmutableArray _pickerData *****/
    [self.view addSubview:self.tfCategory];
    

    self.categoryPicker.showsSelectionIndicator = YES;
    self.categoryPicker.dataSource = self;
    self.categoryPicker.delegate = self;
    
    // set change the inputView (default is keyboard) to UIPickerView
    self.tfCategory.inputView = self.categoryPicker;
    
    // add a toolbar with Cancel & Done button
    UIToolbar *toolBar = [[UIToolbar alloc] initWithFrame:CGRectMake(0, 0, 320, 44)];
    toolBar.barStyle = UIBarStyleBlackOpaque;
    
    UIBarButtonItem *doneButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemDone target:self action:@selector(doneTouched:)];
    UIBarButtonItem *cancelButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemCancel target:self action:@selector(cancelTouched:)];
    
    // the middle button is to make the Done button align to right
    [toolBar setItems:[NSArray arrayWithObjects:cancelButton, [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:nil action:nil], doneButton, nil]];
    self.tfCategory.inputAccessoryView = toolBar;
}

    /**********PICKER VIEW LANGUAGE***********/
    
   /* // set the frame to zero
    self.languagePicker = [[UIPickerView alloc] init];
    _pickerData1 = @[@"Francais", @"Anglais", @"Allemand", @"Espagnol", @"Portugais", @"Italien"];
    [self.view addSubview:self.tfLanguage];
    
    
    self.languagePicker.showsSelectionIndicator = YES;
    self.languagePicker.dataSource = self;
    self.languagePicker.delegate = self;
    
    // set change the inputView (default is keyboard) to UIPickerView
    self.tfLanguage.inputView = self.languagePicker;
    
    // add a toolbar with Cancel & Done button
    UIToolbar *toolBar1 = [[UIToolbar alloc] initWithFrame:CGRectMake(0, 0, 320, 44)];
    toolBar1.barStyle = UIBarStyleBlackOpaque;
    
    UIBarButtonItem *doneButton1 = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemDone target:self action:@selector(doneTouched1:)];
    UIBarButtonItem *cancelButton1 = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemCancel target:self action:@selector(cancelTouched1:)];
    
    // the middle button is to make the Done button align to right
    [toolBar1 setItems:[NSArray arrayWithObjects:cancelButton1, [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:nil action:nil], doneButton1, nil]];
    self.tfLanguage.inputAccessoryView = toolBar1;

    
}*/

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Débarrassez-vous des ressources qui peuvent être recréées.
}


//Picker view Category

- (UIPickerView *)locationsPicker {
    return self.categoryPicker;
}


- (void)cancelTouched:(UIBarButtonItem *)sender
{
    // hide the picker view
    [self.tfCategory resignFirstResponder];
}

- (void)doneTouched:(UIBarButtonItem *)sender
{
    // hide the picker view
    [self.tfCategory resignFirstResponder];
    self.tfCategory.text=self.categorySelected;
}

#pragma mark - UIPickerViewDataSource
- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
    return 1;
}
// Le nombre de lignes des données
- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{   //if(pickerView==self.categoryPicker)
    return _pickerData.count;

    /*else
    return _pickerData1.count;*/
}

#pragma mark - UIPickerViewDelegate
// Les données à retourner pour la ligne et le composant (colonne) qui est passé en entrée
- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
    {
    NSString *item = [_pickerData objectAtIndex:row];
    
    return item;
}


// Détecter l'élément sélectionné dans le picker view
- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component
{
    // perform some action
    
    NSLog([_pickerData objectAtIndex:row]);
    self.categorySelected=[_pickerData objectAtIndex:row];
    }
/*
//Picker View Language


- (void)cancelTouched1:(UIBarButtonItem *)sender
{
    // hide the picker view
    [self.tfLanguage resignFirstResponder];
}

- (void)doneTouched1:(UIBarButtonItem *)sender
{
    // hide the picker view
    [self.tfLanguage resignFirstResponder];
    self.tfLanguage.text=self.languageSelected;
}*/
- (IBAction)saisieReturn :(id)sender{
    [sender resignFirstResponder];
    }
 

@end