//
//  AppDelegate.h
//  MultiPeerDemo
//
//  Created by Sravan on 30/03/16.
//  Copyright © 2016 Sravan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MPCHandler.h"

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (nonatomic, strong) MPCHandler *mpcHandler;

@end

