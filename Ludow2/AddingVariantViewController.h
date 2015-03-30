//
//  AddingVariantViewController.h
//  Ludow2
//
//  Created by JACQUEZ on 24/03/2015.
//  Copyright (c) 2015 JACQUEZ_ESTREM. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AddingVariantViewController : UIViewController<UIPickerViewDataSource, UIPickerViewDelegate, UITextFieldDelegate>

@property (weak, nonatomic) IBOutlet UIBarButtonItem *saveItem;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *backItem;
@property (weak, nonatomic) IBOutlet UITextField *tfGameName;
@property (weak, nonatomic) IBOutlet UITextField *tfVariantName;
@property (weak, nonatomic) IBOutlet UITextField *tfMaxPlayers;

@property (weak, nonatomic) IBOutlet UITextField *tfMinAge;

@property (weak, nonatomic) IBOutlet UITextField *tfTheme;
@property (strong, nonatomic) UIPickerView *themePicker;
@property (nonatomic) NSString *themeSelected;

@property (nonatomic) UIBarButtonItem* doneButtonNumberPad;

- (IBAction)saisieReturn :(id)sender;
- (IBAction)doneClicked:(id)sender;


@end
