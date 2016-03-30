//
//  ViewController.h
//  MultiPeerDemo
//
//  Created by Sravan on 30/03/16.
//  Copyright © 2016 Sravan. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController

@property (weak, nonatomic) IBOutlet UISwitch *visibilitySwitch;

- (IBAction)visibilitySwitchStatusChanged:(id)sender;
- (IBAction)connectBtnTapped:(id)sender;
- (IBAction)disconnectBtnTapped:(id)sender;
- (IBAction)searchBtnTapped:(id)sender;

@end

