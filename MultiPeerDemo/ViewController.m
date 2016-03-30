//
//  ViewController.m
//  MultiPeerDemo
//
//  Created by Sravan on 30/03/16.
//  Copyright © 2016 Sravan. All rights reserved.
//

#import "ViewController.h"
#import "AppDelegate.h"

@interface ViewController ()<MCBrowserViewControllerDelegate>

@property (strong, nonatomic) AppDelegate *appDelegate;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.appDelegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];
    
    [self.appDelegate.mpcHandler setupPeerWithDisplayName:[UIDevice currentDevice].name];
    [self.appDelegate.mpcHandler setupSession];
    [self.appDelegate.mpcHandler advertiseSelf:self.visibilitySwitch.isOn];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(multipeerConnectionStatusChanged:) name:@"MPCDemo_DidChangeStateNotification" object:nil] ;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)visibilitySwitchStatusChanged:(id)sender {
}

- (IBAction)connectBtnTapped:(id)sender {
}

- (IBAction)disconnectBtnTapped:(id)sender {
    [self.appDelegate.mpcHandler.session disconnect] ;
}

- (IBAction)searchBtnTapped:(id)sender {
    if (self.appDelegate.mpcHandler.session != nil) {
        [[self.appDelegate mpcHandler] setupBrowser];
        [[[self.appDelegate mpcHandler] browser] setDelegate:self];
        
        [self presentViewController:self.appDelegate.mpcHandler.browser
                           animated:YES
                         completion:nil];
    }
}

#pragma mark - MCBrowser Delegate methods
- (void)browserViewControllerDidFinish:(MCBrowserViewController *)browserViewController {
    [self.appDelegate.mpcHandler.browser dismissViewControllerAnimated:YES completion:nil];
}

- (void)browserViewControllerWasCancelled:(MCBrowserViewController *)browserViewController {
    [self.appDelegate.mpcHandler.browser dismissViewControllerAnimated:YES completion:nil];
}

#pragma mark - Notification selectors
-(void)multipeerConnectionStatusChanged:(NSNotification *)notification {
    // Get the state of the peer.
//    int state = [[[notification userInfo] objectForKey:@"state"] intValue];
    
    NSLog(@"Peer: %@ Status : %@",
          [[notification userInfo] objectForKey:@"peerID"],
          [[notification userInfo] objectForKey:@"state"]);
    
    /*
    MCSessionStateNotConnected, 0
    MCSessionStateConnecting,   1
    MCSessionStateConnected     2
    */
}

@end
