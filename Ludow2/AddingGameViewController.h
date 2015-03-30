//
//  AddingGameViewController.h
//  ludo2
//
//  Created by JACQUEZ on 22/03/2015.
//  Copyright (c) 2015 JACQUEZ_ESTREM. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface AddingGameViewController : UIViewController<UIPickerViewDataSource, UIPickerViewDelegate, UITextFieldDelegate>


@property (weak, nonatomic) IBOutlet UITextField *tfGameName;
@property (weak, nonatomic) IBOutlet UITextField *tfCategory;


@property (weak, nonatomic) IBOutlet UIBarButtonItem *saveItem;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *backItem;

@property (strong, nonatomic) UIPickerView *categoryPicker;
@property (nonatomic) NSString *categorySelected;

//@property (strong, nonatomic) UIPickerView *languagePicker;
//@property (nonatomic) NSString *languageSelected;

- (IBAction)saisieReturn :(id)sender;


@end
