//
//  AppDelegate.h
//  TeamProject
//
//  Created by Daniela Mora and Jenny Escobar
//  Copyright (c) 2013 All rights reserved.
//


#import <UIKit/UIKit.h>
#import <FacebookSDK/FacebookSDK.h>
#import "CoreData/CoreData.h"

@class MoreViewController;
@class MainViewController;

@interface AppDelegate : UIResponder <UIApplicationDelegate>


@property (strong, nonatomic) UIWindow *window;
@property (strong, nonatomic) UITabBarItem *lookbook;
//
@property (strong, nonatomic) MainViewController *mainViewController;
@property (readonly, strong, nonatomic) NSManagedObjectContext *managedObjectContext;
@property (readonly, strong, nonatomic) NSManagedObjectModel *managedObjectModel;
@property (readonly, strong, nonatomic) NSPersistentStoreCoordinator *persistentStoreCoordinator;

@end
