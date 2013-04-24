//
//  FavoritesController.m
//  TeamProject
//
//  Created by Daniela Mora and Jenny Escobar
//  Copyright (c) 2013 All rights reserved.
//

#import "FavoritesController.h"
#import "LookbookViewController.h"

@implementation FavoritesController
{
    NSArray *list;
    NSArray *searchResults;
}

@synthesize fetchedResultsController, managedObjectContext, imageInCell,  imageView;
@synthesize photos;
//@synthesize initialtable;

//Managing the object from database
-(NSManagedObjectContext *)managedObjectContext
{
    NSManagedObjectContext *context = nil;
    id delegate = [[UIApplication sharedApplication] delegate];
    if ([delegate performSelector:@selector(managedObjectContext)])
    {
        context = [delegate managedObjectContext];
    }
    return context;
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    
    // Fetch persistent data
    managedObjectContext = [self managedObjectContext];
    NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] initWithEntityName:@"Images"];
    self.photos= [[managedObjectContext executeFetchRequest:fetchRequest error:nil] mutableCopy];
    [table reloadData];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [photos count];
}

//setting the rows in table
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil)
    {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier] ;
    }
    
    photo = [self.photos objectAtIndex:indexPath.row];
    [cell.textLabel setText:[NSString stringWithFormat:@"%@ ", [photo valueForKey:@"name"]]];
    
    imageInCell = [UIImage imageWithData:[photo valueForKey:@"image"]];
    [cell.imageView setImage:imageInCell];
    
    return cell;
}

//set LookBook's view back as main view
- (IBAction)backButton:(id)sender
{
    [self dismissViewControllerAnimated:YES completion:nil];
}

//method to delete cells in Favorite's table
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSManagedObjectContext *context = [self managedObjectContext];
    
    if (editingStyle == UITableViewCellEditingStyleDelete)
    {
        // Delete object from database
        [context deleteObject:[self.photos objectAtIndex:indexPath.row]];
        
        //if deletion can't be completed
        NSError *error = nil;
        if (![context save:&error]) {
            NSLog(@"Can't Delete! %@ %@", error, [error localizedDescription]);
            return;
        }
        
        // Remove from table view
        [self.photos removeObjectAtIndex:indexPath.row];
        [table deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }
}

@end
