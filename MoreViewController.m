//
//  MoreViewController.m
//  TeamProject
//
//  Created by Daniela Mora and Jenny Escobar
//  Copyright (c) 2013 All rights reserved.
//

#import "MoreViewController.h"
#import "AppDelegate.h"
#import "ServicesViewController.h"
#import "LookbookViewController.h"
#import "TrendsViewController.h"
#import "GetAdviceViewController.h"
#import "FavoritesController.h"
#import "ContactViewController.h"
#import "AboutMeViewController.h"

@interface MoreViewController ()
{
    NSManagedObjectContext *context;
    //LookBook *lookbook;
}
@end

@implementation MoreViewController

@synthesize tabBarController;
@synthesize buttonPostPhoto = _buttonPostPhoto;
@synthesize labelFirstName = _labelFirstName;
@synthesize loggedInUser = _loggedInUser;
@synthesize profilePic = _profilePic;

//Initializing the view for this controller
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
    FBLoginView *loginview = [[FBLoginView alloc] init];
    AppDelegate *appDelegate = [[UIApplication sharedApplication]delegate];
    context = [appDelegate managedObjectContext];
    //creates the login button for facebook log in
    loginview.frame = CGRectOffset(loginview.frame, 5, 5);
    loginview.delegate = self;
    
    [self.view addSubview:loginview];
    
    [loginview sizeToFit];
}

- (void)viewDidUnload {
    //self.buttonPickFriends = nil;
    self.buttonPostPhoto = nil;
    self.labelFirstName = nil;
    self.loggedInUser = nil;
    self.profilePic = nil;
    [super viewDidUnload];
}

//show that the user is logged in and enables the user to upload to facebook
- (void)loginViewShowingLoggedInUser:(FBLoginView *)loginView {
    self.buttonPostPhoto.enabled = YES;
}

- (void)loginViewFetchedUserInfo:(FBLoginView *)loginView
                            user:(id<FBGraphUser>)user {
    //gets the user information to display on log in view
    self.labelFirstName.text = [NSString stringWithFormat:@"Hello %@!", user.first_name];
    //gets the user id to display profile picture
    self.profilePic.profileID = user.id;
    self.loggedInUser = user;
}

//shows that the user logged out.
- (void)loginViewShowingLoggedOutUser:(FBLoginView *)loginView {
    // test to see if we can use the share dialog built into the Facebook application
    FBShareDialogParams *p = [[FBShareDialogParams alloc] init];
    p.link = [NSURL URLWithString:@"https://developers.facebook.com/ios"];
#ifdef DEBUG
    [FBSettings enableBetaFeatures:FBBetaFeaturesShareDialog];
#endif
    
    self.buttonPostPhoto.enabled = NO;
    //self.buttonPickFriends.enabled = NO;
    self.profilePic.profileID = nil;
    self.labelFirstName.text = nil;
    self.loggedInUser = nil;
}

//handles the errors when trying to log in
- (void)loginView:(FBLoginView *)loginView handleError:(NSError *)error {
    // see https://developers.facebook.com/docs/reference/api/errors/ for general guidance on error handling for Facebook API
    // our policy here is to let the login view handle errors, but to log the results
    NSLog(@"FBLoginView encountered an error=%@", error);
}

#pragma mark -

//gets the permissions from the user
- (void) performPublishAction:(void (^)(void)) action {
    if ([FBSession.activeSession.permissions indexOfObject:@"publish_actions"] == NSNotFound) {
        [FBSession.activeSession requestNewPublishPermissions:@[@"publish_actions"]
                                              defaultAudience:FBSessionDefaultAudienceFriends
                                            completionHandler:^(FBSession *session, NSError *error) {
                                                if (!error) {
                                                    action();
                                                }
                                                //For this example, ignore errors (such as if user cancels).
                                            }];
    } else {
        action();
    }
    
}

//method to upload photo to facebook
- (void)postPhotoClick:(UIImage *)img
{
    
    //this grabs the image and converts it to NSData type.
    NSData* imageData = UIImageJPEGRepresentation(img, 90);
    NSMutableDictionary * params = [NSMutableDictionary dictionaryWithObjectsAndKeys:
                                    @"Testing!", @"message",
                                    imageData, @"source",
                                    nil];
    
    if(imageData == nil)
    {
        // if the user doesnt select an image to upload it sends an error
        UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"Error"
                                                            message:@"Please select an image"
                                                           delegate:nil
                                                  cancelButtonTitle:@"OK"
                                                  otherButtonTitles:nil];
        [alertView show];
    }
    //uploads the image with the respective permissions
    [FBRequestConnection startWithGraphPath:[NSString stringWithFormat:@"617980383/photos"]
                                 parameters:params
                                 HTTPMethod:@"POST"
                          completionHandler:^(FBRequestConnection *connection, id result,NSError *error){
                              [self showAlert:@"Photo Post" result:result error:error];
                              self.buttonPostPhoto.enabled = YES;
                          }];
}


//shows the alerts that happen when trying to upload the image
- (void)showAlert:(NSString *)message
           result:(id)result
            error:(NSError *)error {
    
    NSString *alertMsg;
    NSString *alertTitle;
    if (error) {
        alertTitle = @"Error";
        if (error.fberrorShouldNotifyUser ||
            error.fberrorCategory == FBErrorCategoryPermissions ||
            error.fberrorCategory == FBErrorCategoryAuthenticationReopenSession) {
            alertMsg = error.fberrorUserMessage;
        }else{
            alertMsg = @"Operation failed due to a connection problem, retry later.";
        }
    } else {
        NSDictionary *resultDict = (NSDictionary *)result;
        alertMsg = [NSString stringWithFormat:@"Successfully posted"];
        NSString *postId = [resultDict valueForKey:@"id"];
        if (!postId) {
            postId = [resultDict valueForKey:@"postId"];
        }
        alertTitle = @"Success";
    }
    
    UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:alertTitle
                                                        message:alertMsg
                                                       delegate:nil
                                              cancelButtonTitle:@"OK"
                                              otherButtonTitles:nil];
    [alertView show];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

//send email action
-(IBAction)sendEmailSelected:(id)sender
{
    //cheking if device has been configured to send email
  if ([MFMailComposeViewController canSendMail]) {
        MFMailComposeViewController *mailViewController = [[MFMailComposeViewController alloc] init];
        mailViewController.mailComposeDelegate = self;
        [mailViewController setSubject:@""];
        [mailViewController setToRecipients:[NSArray arrayWithObject:@"stylist@erikabriceno.com"]];
        [mailViewController setMessageBody:@"" isHTML:NO];
        [self presentViewController:mailViewController animated:YES completion:nil];
    }
    else
	//if not report is givent to the user 
	{
        UIAlertView *alert = [[UIAlertView alloc]
                              initWithTitle:@"Device Configuration"
                              message:@"Device is unable to send email in its current state, please configure email on the device"
                              delegate:nil
                              cancelButtonTitle:@"Ok"
                              otherButtonTitles:nil];
        
        [alert show];
    }
}
//composition of mail which includes UIViewAlerts for each 
//action performed by the user(save,sent, delete,cancel)
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

//Method which opens the view for the contact information
-(IBAction)contactMeSelected:(id)sender
{
    ContactViewController *contactView = [[ContactViewController alloc]initWithNibName:@"ContactMeView" bundle:nil];
    [self presentViewController:contactView animated:YES completion:nil];
}

//Method to open the view for aboutMeController's view
-(IBAction)aboutMeSelected:(id)sender
{
    AboutMeViewController *aboutView = [[AboutMeViewController alloc]initWithNibName:@"AboutMeView" bundle:nil];
    [self presentViewController:aboutView animated:YES completion:nil];
    
}

//dismiss current view which returns to previous view
-(IBAction)backItem:(id)sender
{
    [self dismissViewControllerAnimated:YES completion:nil];
}

@end

