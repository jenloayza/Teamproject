//
//  ContactViewController.m
//  TeamProject
//
//  Created by Daniela Mora and Jenny Escobar
//  Copyright (c) 2013 All rights reserved.
//

#import "ContactViewController.h"
#import "MoreViewController.h"

@interface ContactViewController ()

@end

@implementation ContactViewController

//Initializing the ContactViewController's view
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
  // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
//return to previous view
- (IBAction)backButton:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}
//Send Email Action
-(IBAction)sendEmail:(id)sender
{
	//Testing if device is configured for email use
    if ([MFMailComposeViewController canSendMail])
    {
        MFMailComposeViewController *mailViewController = [[MFMailComposeViewController alloc] init];
        mailViewController.mailComposeDelegate = self;
        [mailViewController setSubject:@"  "];
        [mailViewController setToRecipients:[NSArray arrayWithObject:@"stylist@erikabriceno.com"]];
        [mailViewController setMessageBody:@" " isHTML:NO];
        [self presentViewController:mailViewController animated:NO completion:nil];
        
    }
//if not show alert to user
    else
    {
        UIAlertView *alert = [[UIAlertView alloc]
                              initWithTitle:@"Device Configuration"
                              message:@"Device is unable to send email in its current state, please configure your device"
                              delegate:nil
                              cancelButtonTitle:@"Ok"
                              otherButtonTitles:nil];
        
        [alert show];
        
    }
}
//Compose mail section with UIAlerts for report to user
//regarding email
- (void) mailComposeController:(MFMailComposeViewController *)controller didFinishWithResult:(MFMailComposeResult)result error:(NSError *)error
{
    switch (result)
    {
        case MFMailComposeResultCancelled:
        {
            
            UIAlertView *alert = [[UIAlertView alloc]
                                  initWithTitle:@"Draft Deleted"
                                  message:nil
                                  delegate:nil
                                  cancelButtonTitle:@"Ok"
                                  otherButtonTitles:nil];
            
            [alert show];
        }
            
            break;
        case MFMailComposeResultSaved:
        {
            
            UIAlertView *alert = [[UIAlertView alloc]
                                  initWithTitle:@"Email Saved"
                                  message:@"Your email has been saved"
                                  delegate:nil
                                  cancelButtonTitle:@"Ok"
                                  otherButtonTitles:nil];
            
            [alert show];
        }
            
            break;
        case MFMailComposeResultSent:
        {
            
            UIAlertView *alert = [[UIAlertView alloc]
                                  initWithTitle:@"Email Sent"
                                  message:nil
                                  delegate:nil
                                  cancelButtonTitle:@"Ok"
                                  otherButtonTitles:nil];
            
            [alert show];
        }
            
            break;
            
        case MFMailComposeResultFailed:
        {
            
            UIAlertView *alert = [[UIAlertView alloc]
                                  initWithTitle:@"There was a problem trying to send this email."
                                  message:[error localizedDescription]
                                  delegate:nil
                                  cancelButtonTitle:@"Ok"
                                  otherButtonTitles:nil];
            
            [alert show];
        }
            break;
        default:
            break;
    }
    
    [self dismissViewControllerAnimated:YES completion:NULL];
}

@end
