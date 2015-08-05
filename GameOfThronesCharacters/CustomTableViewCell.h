//
//  CustomTableViewCell.h
//  GameOfThronesCharacters
//
//  Created by Bradley Justice on 8/4/15.
//  Copyright (c) 2015 Bradley Justice. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CustomTableViewCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UIImageView *characterImage;
@property (weak, nonatomic) IBOutlet UILabel *characterNameLabel;
@property (weak, nonatomic) IBOutlet UILabel *actorNameLabel;
@property (weak, nonatomic) IBOutlet UILabel *houseNameLabel;
@property (weak, nonatomic) IBOutlet UILabel *ageLabel;
@property (weak, nonatomic) IBOutlet UILabel *dragonMountLabel;
@property (weak, nonatomic) IBOutlet UIImageView *dragonImage;

@end
