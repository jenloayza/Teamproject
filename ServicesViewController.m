//
//  ServicesViewController.m
//  TeamProject
//
//  Created by Daniela Mora and Jenny Escobar
//  Copyright (c) 2013 All rights reserved.
//

#import "ServicesViewController.h"
#import "LookbookViewController.h"
#import "TrendsViewController.h"
#import "GetAdviceViewController.h"
#import "MoreViewController.h"


@implementation ServicesViewController

@synthesize tabBarController;

-(void)viewDidLoad
{
    [super viewDidLoad];
}
//Method to open the wardrobeView within //servicesViewController
-(IBAction)wardrobeSelected:(id)sender
{
//initializing new view for ServicesViewController
    ServicesViewController *wardrobeView = [[ServicesViewController alloc]initWithNibName:@"WardrobeView" bundle:nil];
    [self presentViewController:wardrobeView animated:YES completion:nil];
    
    [super viewDidLoad];
}

//Method to open the accompanierView within //servicesViewController
-(IBAction)personalSelected:(id)sender
{
//initializing new view for ServicesViewController

    ServicesViewController *personalView = [[ServicesViewController alloc]initWithNibName:@"AccompaniedView" bundle:nil];
    [self presentViewController:personalView animated:YES completion:nil];
}

//Method to open the PrivateView within
//servicesViewController
-(IBAction)privateSelected:(id)sender
{
//initializing new view for ServicesViewController
    ServicesViewController *privateView = [[ServicesViewController alloc]initWithNibName:@"PrivateView" bundle:nil];
    [self presentViewController:privateView animated:YES completion:nil];
}

//Method to open the CreativeView within //servicesViewController
-(IBAction)creativeSelected:(id)sender
{
  //initializing new view for ServicesViewController
    ServicesViewController *creativeView = [[ServicesViewController alloc]initWithNibName:@"CreativeView" bundle:nil];
    [self presentViewController:creativeView animated:YES completion:nil];
}

//Email button selected for the selected view in ServicesTabItem
-(IBAction)emailSelected:(id)sender
{
    //Checking whether device is configured to send email
    if ([MFMailComposeViewController canSendMail])
    {
        MFMailComposeViewController *mailViewController = [[MFMailComposeViewController alloc] init];
        mailViewController.mailComposeDelegate = self;
        [mailViewController setSubject:@"  "];
        [mailViewController setToRecipients:[NSArray arrayWithObject:@"stylist@erikabriceno.com"]];
        [mailViewController setMessageBody:@" " isHTML:NO];
        [self presentViewController:mailViewController animated:NO completion:nil];
        
    }
    else
    {
	//report to user
        UIAlertView *alert = [[UIAlertView alloc]
                              initWithTitle:@"Device Configuration"
                              message:@"Device is unable to send email in its current state, please configure your device"
                              delegate:nil
                              cancelButtonTitle:@"Ok"
                              otherButtonTitles:nil];
        
        [alert show];
        
    }
}
//composition of mail with report for user selection
//(ex:email sent, deleted, in draft,cancel)
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
    
    // Close the Mail Interface
    [self dismissViewControllerAnimated:YES completion:NULL];
}

//Method to dismiss current view and return to previous
-(IBAction)backItem:(id)sender
{
    
    [self dismissViewControllerAnimated:YES completion:nil];
    
}

@end


