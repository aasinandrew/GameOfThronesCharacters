//
//  ViewController.h
//  GameOfThronesCharacters
//
//  Created by Bradley Justice on 8/4/15.
//  Copyright (c) 2015 Bradley Justice. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>

@interface ViewController : UIViewController <UITableViewDataSource, UITableViewDelegate>

@property NSManagedObjectContext *moc;



@end

