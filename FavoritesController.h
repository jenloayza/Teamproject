//
//  FavoritesController.h
//  TeamProject
//
//  Created by Daniela Mora and Jenny Escobar
//  Copyright (c) 2013 All rights reserved.


#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

//@class LookbookViewController;

@interface FavoritesController : UIViewController  <NSFetchedResultsControllerDelegate, UITableViewDataSource, UITableViewDelegate>
{
    NSManagedObject *photo;
    IBOutlet UITableView *table;
}

@property (strong, nonatomic) NSMutableArray *photos;
@property (nonatomic, retain) NSFetchedResultsController *fetchedResultsController;
@property (nonatomic, retain) NSManagedObjectContext *managedObjectContext;
@property (nonatomic, retain)  NSManagedObject *managedObject;
@property (nonatomic, retain) FavoritesController *imageView;
@property (nonatomic, retain)  UIImage *imageInCell;

- (IBAction)backButton:(id)sender;
@end


