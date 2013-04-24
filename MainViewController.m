//
//  MainViewController.m
//  TeamProject
//
//  Created by Daniela Mora and Jenny Escobar
//  Copyright (c) 2013 All rights reserved.
//

#import "MainViewController.h"

@implementation MainViewController

@synthesize lookbookViewController, trendsViewController, adviceViewController, servicesViewController, moreViewController;
@synthesize tabBarController, window;

//initialize initial view for application
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

//method to load the tabBarController 
- (void)viewDidLoad
{
    [super viewDidLoad];

    //UITabBarController created progrmatically
    tabBarController =[[UITabBarController alloc]init];
    CGRect tabBarFrame;
    tabBarFrame = CGRectMake(0, 240, 320, 200);
    tabBarController.view.frame = tabBarFrame;
    
//creating an instance of every controller in application
    lookbookViewController = [[LookbookViewController alloc]initWithNibName:@"LookbookViewController" bundle:nil];
    [lookbookViewController setTitle:@"Lookbook"];
    lookbookViewController.tabBarItem.image = [UIImage imageNamed:@"photo.png"];
    trendsViewController = [[TrendsViewController alloc]initWithNibName:@"TrendsViewController" bundle: nil];
    [trendsViewController setTitle:@"Trends"];
    trendsViewController.tabBarItem.image = [UIImage imageNamed:@"shopping-bag.png"];
    adviceViewController = [[GetAdviceViewController alloc]initWithNibName:@"GetAdviceViewController" bundle:nil];
    [adviceViewController setTitle:@"GetAdvice"];
    adviceViewController.tabBarItem.image = [UIImage imageNamed:@"question.png"];
    servicesViewController = [[ServicesViewController alloc]initWithNibName:@"ServicesViewController" bundle:nil];
    [servicesViewController setTitle:@"Services"];
    servicesViewController.tabBarItem.image = [UIImage imageNamed:@"spiral.png"];
    moreViewController = [[MoreViewController  alloc]initWithNibName:@"MoreViewController" bundle:nil];
    [moreViewController setTitle:@"More"];
    moreViewController.tabBarItem.image = [UIImage imageNamed:@"wind.png"];
    
//initializing array with the created controllers
    tabBarController.viewControllers = [NSArray arrayWithObjects:lookbookViewController, trendsViewController, adviceViewController, servicesViewController, moreViewController, nil];
    
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

//Method for when LookBookViewController button in Home //application is selected, this method opens the correspoding //view
-(IBAction)lookbookButton:(id)sender
{
    self.tabBarController.selectedViewController = lookbookViewController ;
    [self presentViewController:tabBarController animated:YES completion:nil];
}

//Method for when TrendsViewController button in Home //application is selected, this method opens the correspoding //view
-(IBAction)trendsButton:(id)sender
{
    self.tabBarController.selectedViewController = trendsViewController;
    [self presentViewController:tabBarController animated:YES completion:nil];
}

//Method for when GetAdviceViewController button in Home //application is selected, this method opens the correspoding //view
-(IBAction)getAdvice:(id)sender
{
    self.tabBarController.selectedViewController = adviceViewController;
    [self presentViewController:tabBarController animated:YES completion:nil];
}


//Method for when ServicesViewController button in Home //application is selected, this method opens the correspoding //view
-(IBAction)servicesButton:(id)sender
{
    self.tabBarController.selectedViewController = servicesViewController;
    [self presentViewController:tabBarController animated:YES completion:nil];
}

//Method for when MoreViewController button in Home //application is selected, this method opens the correspoding //view
-(IBAction)moreButton:(id)sender
{
    self.tabBarController.selectedViewController = moreViewController;
    [self presentViewController:tabBarController animated:YES completion:nil];
}

@end
