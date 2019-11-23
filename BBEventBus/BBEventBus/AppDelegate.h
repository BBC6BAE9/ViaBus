//
//  AppDelegate.h
//  BBEventBus
//
//  Created by huang on 2019/11/23.
//  Copyright © 2019 huang. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (readonly, strong) NSPersistentContainer *persistentContainer;

- (void)saveContext;


@end

