//
//  MainViewController.h
//  TeamProject
//
//  Created by Daniela Mora and Jenny Escobar
//  Copyright (c) 2013 All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LookbookViewController.h"
#import "TrendsViewController.h"
#import "GetAdviceViewController.h"
#import "ServicesViewController.h"
#import "MoreViewController.h"

@interface MainViewController : UIViewController

@property (strong, nonatomic) UIWindow *window;
@property (strong, nonatomic) IBOutlet UITabBarController *tabBarController;
@property (strong, nonatomic) LookbookViewController *lookbookViewController;
@property (strong, nonatomic) TrendsViewController *trendsViewController;
@property (strong, nonatomic) GetAdviceViewController *adviceViewController;
@property (strong, nonatomic) ServicesViewController *servicesViewController;
@property (strong, nonatomic) MoreViewController *moreViewController;

//When initial view in app is loaded, these actions 
//handle the creation of each controller 
-(IBAction)lookbookButton:(id)sender;
-(IBAction)trendsButton:(id)sender;
-(IBAction)getAdvice:(id)sender;
-(IBAction)servicesButton:(id)sender;
-(IBAction)moreButton:(id)sender;

@end
