//
//  AddCharacterViewController.m
//  GameOfThronesCharacters
//
//  Created by Bradley Justice on 8/4/15.
//  Copyright (c) 2015 Bradley Justice. All rights reserved.
//

#import "AddCharacterViewController.h"

@interface AddCharacterViewController () <UITextFieldDelegate>
@property (weak, nonatomic) IBOutlet UITextField *characterTextField;
@property (weak, nonatomic) IBOutlet UITextField *actorTextField;
@property (weak, nonatomic) IBOutlet UITextField *houseTextField;
@property (weak, nonatomic) IBOutlet UITextField *ageTextField;
@property (weak, nonatomic) IBOutlet UITextField *dragonMountTextField;

@end

@implementation AddCharacterViewController

- (void)viewDidLoad {
    [super viewDidLoad];

}

- (IBAction)addCharacter:(UIButton *)sender {

    self.enteredCharacter = self.characterTextField.text;
    self.enteredActor = self.actorTextField.text;
    self.enteredHouse = self.houseTextField.text;
    self.enteredAge = self.ageTextField.text;
    self.enteredDragonMount = self.dragonMountTextField.text;

}

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    [textField resignFirstResponder];
    return NO;
}


@end
