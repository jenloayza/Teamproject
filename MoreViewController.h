//
//  MoreViewController.h
//  TeamProject
//
//  Created by Daniela Mora and Jenny Escobar
//  Copyright (c) 2013 All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>
#import <MessageUI/MessageUI.h>
#import <MessageUI/MFMailComposeViewController.h>
#import "AppDelegate.h"
#import <FacebookSDK/FacebookSDK.h>

@interface MoreViewController : UIViewController <MFMailComposeViewControllerDelegate, UIImagePickerControllerDelegate,
UINavigationControllerDelegate, FBLoginViewDelegate>

@property (strong, nonatomic) UINavigationController *navigationController;
@property (strong, nonatomic) IBOutlet UITabBarController *tabBarController;
@property (strong, nonatomic) IBOutlet FBProfilePictureView *profilePic;
@property (strong, nonatomic) IBOutlet UIButton *buttonPostPhoto;
@property (strong, nonatomic) IBOutlet UILabel *labelFirstName;
@property (strong, nonatomic) id<FBGraphUser> loggedInUser;
@property (strong, nonatomic) IBOutlet UIImageView *favoriteImageView;

//Actions to control MoreViewController's views options
-(IBAction)contactMeSelected:(id)sender;
-(IBAction)aboutMeSelected:(id)sender;
-(IBAction)sendEmailSelected:(id)sender;
-(void)postPhotoClick:(UIImage *)img;
- (void)showAlert:(NSString *)message
           result:(id)result
            error:(NSError *)error;
-(IBAction)backItem:(id)sender;

@end

