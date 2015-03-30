//
//  AddingVariantViewController.m
//  Ludow2
//
//  Created by JACQUEZ on 24/03/2015.
//  Copyright (c) 2015 JACQUEZ_ESTREM. All rights reserved.
//

#import "AddingVariantViewController.h"

@interface AddingVariantViewController ()
{
    NSMutableArray *_pickerData;
}

@end

@implementation AddingVariantViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    /******PICKER VIEW CATEGORY ********/
    // set the frame to zero
    self.themePicker = [[UIPickerView alloc] init];
    _pickerData = @[@"theme1", @"theme2", @"Theme3"];
    [self.view addSubview:self.tfTheme];
    
    
    self.themePicker.showsSelectionIndicator = YES;
    self.themePicker.dataSource = self;
    self.themePicker.delegate = self;
    
    // set change the inputView (default is keyboard) to UIPickerView
    self.tfTheme.inputView = self.themePicker;
    
    // add a toolbar with Cancel & Done button
    UIToolbar *toolBar = [[UIToolbar alloc] initWithFrame:CGRectMake(0, 0, 320, 44)];
    toolBar.barStyle = UIBarStyleBlackOpaque;
    
    UIBarButtonItem *doneButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemDone target:self action:@selector(doneTouched:)];
    UIBarButtonItem *cancelButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemCancel target:self action:@selector(cancelTouched:)];
    
    // the middle button is to make the Done button align to right
    [toolBar setItems:[NSArray arrayWithObjects:cancelButton, [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:nil action:nil], doneButton, nil]];
    self.tfTheme.inputAccessoryView = toolBar;
    
    //Number Pad Done/Cancel Button MaxPayers
    
    
    UIToolbar* numberToolbar = [[UIToolbar alloc]initWithFrame:CGRectMake(0, 0, 320, 50)];
    numberToolbar.barStyle = UIBarStyleBlackTranslucent;
    numberToolbar.items = [NSArray arrayWithObjects:
                           [[UIBarButtonItem alloc]initWithTitle:@"Cancel" style:UIBarButtonItemStyleBordered target:self action:@selector(cancelNumberPad)],
                           [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:nil action:nil],
                           [[UIBarButtonItem alloc]initWithTitle:@"Done" style:UIBarButtonItemStyleDone target:self action:@selector(doneWithNumberPad)],
                           nil];
    [numberToolbar sizeToFit];
    self.tfMaxPlayers.inputAccessoryView = numberToolbar;
    
     //Number Pad Done/Cancel Button MinAge
    
    UIToolbar* numberToolbar1 = [[UIToolbar alloc]initWithFrame:CGRectMake(0, 0, 320, 50)];
    numberToolbar1.barStyle = UIBarStyleBlackTranslucent;
    numberToolbar1.items = [NSArray arrayWithObjects:
                           [[UIBarButtonItem alloc]initWithTitle:@"Cancel" style:UIBarButtonItemStyleBordered target:self action:@selector(cancelNumberPad1)],
                           [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:nil action:nil],
                           [[UIBarButtonItem alloc]initWithTitle:@"Done" style:UIBarButtonItemStyleDone target:self action:@selector(doneWithNumberPad1)],
                           nil];
    [numberToolbar1 sizeToFit];
    self.tfMinAge.inputAccessoryView = numberToolbar1;
 
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (UIPickerView *)locationsPicker {
    return self.themePicker;
}


- (void)cancelTouched:(UIBarButtonItem *)sender
{
    // hide the picker view
    [self.tfTheme resignFirstResponder];
}

- (void)doneTouched:(UIBarButtonItem *)sender
{
    // hide the picker view
    [self.tfTheme resignFirstResponder];
    self.tfTheme.text=self.themeSelected;
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
    self.themeSelected=[_pickerData objectAtIndex:row];
}
- (IBAction)saisieReturn :(id)sender{
    [sender resignFirstResponder];
}

//Methods Number Pad Done/Cancel Button MaxPlayers
-(void)cancelNumberPad{
    [self.tfMaxPlayers resignFirstResponder];
    self.tfMaxPlayers.text = @"";
}

-(void)doneWithNumberPad{
    NSString *numberFromTheKeyboard = self.tfMaxPlayers.text;
    [self.tfMaxPlayers resignFirstResponder];
}

//Methods Number Pad Done/Cancel Button MinAge

-(void)cancelNumberPad1{
    [self.tfMinAge resignFirstResponder];
    self.tfMinAge.text = @"";
}

-(void)doneWithNumberPad1{
    NSString *numberFromTheKeyboard = self.tfMinAge.text;
    [self.tfMinAge resignFirstResponder];
}


/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
