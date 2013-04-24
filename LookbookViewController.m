//
//  LookbookViewController.m
//  TeamProject
//
//  Created by Daniela Mora and Jenny Escobar
//  Copyright (c) 2013 All rights reserved.
//

#import "LookbookViewController.h"
#import "ServicesViewController.h"
#import "MoreViewController.h"
#import "GetAdviceViewController.h"
#import "TrendsViewController.h"
#import "AppDelegate.h"
#import "FavoritesController.h"

@interface LookbookViewController ()
{
    NSManagedObjectContext *context;
}
@end

@implementation LookbookViewController

@synthesize imageView, imageName, favImageView;

//starting the LookBook's view with array of images
-(void)viewDidLoad
{
    imageArray = [NSArray arrayWithObjects:
                  [UIImage imageNamed:@"1.png"],
                  [UIImage imageNamed:@"2.png"],
                  [UIImage imageNamed:@"3.png"],
                  [UIImage imageNamed:@"4.png"],
                  [UIImage imageNamed:@"5.png"],
                  nil];
    currentImageIndex = 0;
    [imageView setImage:[imageArray objectAtIndex:currentImageIndex]];
    
    AppDelegate *appDelegate = [[UIApplication sharedApplication]delegate];
    context = [appDelegate managedObjectContext];
    
    [super viewDidLoad];
}

//Method to call next image in array
- (IBAction)next:(id)sender
{
    currentImageIndex++;
    if (currentImageIndex ==[imageArray count])
    {
        currentImageIndex = 0;
        
    }
    //set coming image in UIImageView
    [imageView setImage:[imageArray objectAtIndex:currentImageIndex]];
}

//Method to call previous image in array
- (IBAction)previous:(id)sender
{
    if (currentImageIndex == 0)
    {
        currentImageIndex = [imageArray count] - 1;
    }
    else
    {
        currentImageIndex--;
    }
//setting the image in UIImageView
    [imageView setImage:[imageArray objectAtIndex:currentImageIndex]];
}

- (IBAction)save:(id)sender;
{
    NSEntityDescription *entityDescription = [NSEntityDescription entityForName:@"Images" inManagedObjectContext:context];
    NSManagedObject *newImage = [[NSManagedObject alloc]initWithEntity:entityDescription insertIntoManagedObjectContext:context];
    
    UIImage *currentImage = imageArray[currentImageIndex];
    NSData * imageData = UIImagePNGRepresentation(currentImage);
    
    imageName = [NSString stringWithFormat:@"photo%i", currentImageIndex];
    
    [newImage setValue:imageData forKey:@"image"];
    [newImage setValue:imageName forKey:@"name"];
    
    NSError *error;
    [context save:&error];
    
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Saved"
                                                    message:@"Image was set as favorite"
                                                   delegate:self
                                          cancelButtonTitle:nil
                                          otherButtonTitles:@"OK", nil];
    [alert show];
    
    NSEntityDescription *entityDescription2 = [NSEntityDescription entityForName:@"Images" inManagedObjectContext:context];
    NSFetchRequest *request = [[NSFetchRequest alloc]init];
    [request setEntity:entityDescription2];
    
    
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"name like %@", imageName];
    [request setPredicate:predicate];
    
    
}

//Open FavoriteViewController's view
- (IBAction)favorites:(id)sender
{
    FavoritesController *favorite= [[FavoritesController alloc]initWithNibName:@"FavViewController" bundle:nil];
    [self presentViewController:favorite animated:NO completion:nil];
}

//Return to LookBook's view
- (IBAction)backButton:(id)sender
{
  //dismiss current view
    [self dismissViewControllerAnimated:YES completion:nil];
    
}

@end
