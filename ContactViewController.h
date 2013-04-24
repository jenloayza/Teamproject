//
//  ContactViewController.h
//  TeamProject
//
//  Created by Daniela Mora and Jenny Escobar
//  Copyright (c) 2013 All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MessageUI/MessageUI.h>
#import <MessageUI/MFMailComposeViewController.h>

@interface ContactViewController : UIViewController <MFMailComposeViewControllerDelegate>

//IBActions to return to previous view and send Email
- (IBAction)backButton:(id)sender;
- (IBAction)sendEmail:(id)sender;

@end
