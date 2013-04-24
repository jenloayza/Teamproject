//
//  TrendsViewController.m
//  TeamProject
//
//  Created by Daniela Mora and Jenny Escobar
//  Copyright (c) 2013 All rights reserved.
//

#import "TrendsViewController.h"
#import "AppDelegate.h"

@implementation TrendsViewController

@synthesize webView;
@synthesize navigationBar;
@synthesize navigationItem;

//sets the tab bar name for this view. 
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.title = NSLocalizedString(@"Trends", @"Trends");
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
}

//shows EB's instragram account in a webview when the view appears
-(void)viewDidAppear:(BOOL)animated
{
    url = @"www.instagram.com/ebfashionstyling";
    NSString *http = @"http://";
    url = [[NSString alloc] initWithFormat:@"%@%@", http, url];
    [webView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:url]]];
    
    UIBarButtonItem *backButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"EB Home" style:UIBarButtonItemStylePlain target:
                                       nil action:@selector(backButton)];
    
    self.navigationItem.leftBarButtonItem = backButtonItem;

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

//goes back to the main instagram page when the user clicks on an image
-(void)backButton
{
    [self viewDidAppear:YES];
}

@end
