//
//  TrendsViewController.h
//  TeamProject
//
//  Created by Daniela Mora and Jenny Escobar
//  Copyright (c) 2013 All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TrendsViewController : UIViewController
{
    IBOutlet UIWebView *webView;
    NSString *url;
}

//properties needed for the trends view controller
@property (strong, nonatomic) UIWebView *webView;
@property (strong, nonatomic) IBOutlet UINavigationBar *navigationBar;
@property (strong, nonatomic) IBOutlet UINavigationItem *navigationItem;

@end
