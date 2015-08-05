//
//  ViewController.m
//  GameOfThronesCharacters
//
//  Created by Bradley Justice on 8/4/15.
//  Copyright (c) 2015 Bradley Justice. All rights reserved.
//

#import "ViewController.h"
#import "AddCharacterViewController.h"
#import "CustomTableViewCell.h"

@interface ViewController ()
@property NSMutableArray *charactersArray;
@property NSArray *characterImages;
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property NSString *enteredCharacter;
@property NSString *enteredActor;
@property NSString *enteredHouse;
@property NSString *enteredAge;
@property NSString *enteredDragonMount;


@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.characterImages = [NSArray arrayWithObjects:[UIImage imageNamed:@"daenerys.jpeg"],
                                                     [UIImage imageNamed:@"hodor.jpg"],
                                                     [UIImage imageNamed:@"jon.jpeg"], nil];

    [self loadData];

    if (self.charactersArray.count == 0) {

    NSString *path = [[NSBundle mainBundle]pathForResource:@"gameofthrones" ofType:@"plist"];
    NSArray *plistData = [NSArray arrayWithContentsOfFile:path];
    for (NSDictionary *dict in plistData) {

        NSManagedObject *character = [NSEntityDescription insertNewObjectForEntityForName:@"Character" inManagedObjectContext:self.moc];
        [character setValue:[dict objectForKey:@"character"] forKey:@"character"];
        [character setValue:[dict objectForKey:@"actor"] forKey:@"actor"];
        [character setValue:[dict objectForKey:@"house"] forKey:@"house"];
        [character setValue:[dict objectForKey:@"age"] forKey:@"age"];
        [character setValue:[dict objectForKey:@"dragonMount"] forKey:@"dragonMount"];


        UIImage *image = [UIImage imageNamed:[dict objectForKey:@"photoData"]];
        NSData *data = UIImageJPEGRepresentation(image, 1.0);
        [character setValue:data forKey:@"photoData"];

    }

    [self.moc save:NULL];
    [self loadData];
    }
}

- (void)loadData {
    NSSortDescriptor *sortDescriptor = [NSSortDescriptor sortDescriptorWithKey:@"character" ascending:YES];
    NSFetchRequest *request = [NSFetchRequest fetchRequestWithEntityName:@"Character"];
    request.sortDescriptors = @[sortDescriptor];

    self.charactersArray = [NSMutableArray arrayWithArray: [self.moc executeFetchRequest:request error:NULL]];

    [self.tableView reloadData];
}

#pragma mark - table methods

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.charactersArray.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    CustomTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    NSManagedObject *character = [self.charactersArray objectAtIndex:indexPath.row];
    cell.characterNameLabel.text = [character valueForKey:@"character"];
    cell.actorNameLabel.text = [character valueForKey:@"actor"];
    cell.houseNameLabel.text = [character valueForKey:@"house"];
    cell.ageLabel.text = [character valueForKey:@"age"];
    cell.dragonMountLabel.text = [character valueForKey:@"dragonMount"];
    cell.imageView.image = [UIImage imageWithData:[character valueForKey:@"photoData"]];

    return cell;
}


- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    NSManagedObject *object = [self.charactersArray objectAtIndex:indexPath.row];
    [self.moc deleteObject:object];
    [self.moc save:NULL];
    [self loadData];

}

-(NSString *)tableView:(UITableView *)tableView titleForDeleteConfirmationButtonForRowAtIndexPath:(NSIndexPath *)indexPath {
    return @"WHITE WALKER";
}


#pragma mark - segue method

- (IBAction)unwindSegue:(UIStoryboardSegue *)unwindSegue {
    AddCharacterViewController *vc = unwindSegue.sourceViewController;
    self.enteredCharacter = vc.enteredCharacter;
    self.enteredActor = vc.enteredActor;
    self.enteredHouse = vc.enteredHouse;
    self.enteredAge = vc.enteredAge;
    self.enteredDragonMount = vc.enteredDragonMount;

    NSManagedObject *character = [NSEntityDescription insertNewObjectForEntityForName:@"Character" inManagedObjectContext:self.moc];

    [character setValue:self.enteredCharacter forKey:@"character"];
    [character setValue:self.enteredActor forKey:@"actor"];
    [character setValue:self.enteredHouse forKey:@"house"];
    [character setValue:self.enteredAge forKey:@"age"];
    [character setValue:self.enteredDragonMount forKey:@"dragonMount"];

    int rand = arc4random_uniform((int)self.characterImages.count);

    UIImage *image = [self.characterImages objectAtIndex:rand];
    NSData *data = UIImageJPEGRepresentation(image, 1.0);

    [character setValue:data forKey:@"photoData"];

    [self.moc save:NULL];

    [self loadData];
}

@end
