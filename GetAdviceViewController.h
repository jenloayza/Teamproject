//
//  GetAdviceViewController.h
//  TeamProject
//
//  Created by Daniela Mora and Jenny Escobar
//  Copyright (c) 2013 All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MobileCoreServices/MobileCoreServices.h>
#import "MoreViewController.h"

@interface GetAdviceViewController : UIViewController <UIImagePickerControllerDelegate,
UINavigationControllerDelegate>
{
    UINavigationBar *toolbar;
    UIImageView *imageView;
    BOOL newMedia;
    UIImage *image;
}
@property (nonatomic, retain) IBOutlet UIImageView *imageView;
@property (nonatomic, retain) IBOutlet UINavigationBar *toolbar;
@property (nonatomic, retain) UIImage *image;
@property (nonatomic, retain) MoreViewController *more;
@property (nonatomic, retain) NSString *ID;

//lets the user take a picture
- (IBAction)useCamera: (id)sender;
//lets the user use an image from the camera roll
- (IBAction)useCameraRoll: (id)sender;
//lets the user upload an image to EB's facebook page
- (IBAction)uploadImage:(id)sender;

@end

