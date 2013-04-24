//
//  LookbookViewController.h
//  TeamProject
//
//  Created by Daniela Mora and Jenny Escobar
//  Copyright (c) 2013 All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface LookbookViewController : UIViewController
{
    //Keep current index
    NSUInteger currentImageIndex;
    //array to store images in LookBook 
    NSArray *imageArray;
}

@property (strong, retain) IBOutlet UIImageView *imageView;
@property (strong, retain) NSString *imageName;
@property (strong, nonatomic) IBOutlet UIImageView *favImageView;

//IBActions to controller image view (previous,next)
- (IBAction)next:(id)sender;
- (IBAction)previous:(id)sender;
//saving into Favorite's tableView
- (IBAction)save:(id)sender;
//Action to open FavoritViewController's view
- (IBAction)favorites:(id)sender;
//return to LookBook's view
- (IBAction)backButton:(id)sender;

@end
