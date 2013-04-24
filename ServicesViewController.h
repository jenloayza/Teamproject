//
//  ServicesViewController.h
//  TeamProject
//
//  Created by Daniela Mora and Jenny Escobar
//  Copyright (c) 2013 All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import <MessageUI/MessageUI.h>
#import <MessageUI/MFMailComposeViewController.h>

@interface ServicesViewController : UIViewController <MFMailComposeViewControllerDelegate>

@property (strong, nonatomic) IBOutlet UITabBarController *tabBarController;

//Action for each possible selection inside //ServicesViewController
-(IBAction)wardrobeSelected:(id)sender;
-(IBAction)personalSelected:(id)sender;
-(IBAction)privateSelected:(id)sender;
-(IBAction)creativeSelected:(id)sender;
//each view will give option of sending email
-(IBAction)emailSelected:(id)sender;
//IBAction to return to previous view
-(IBAction)backItem:(id)sender;

@end
