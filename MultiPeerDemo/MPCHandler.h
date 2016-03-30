//
//  MPCHandler.h
//  MultiPeerDemo
//
//  Created by Sravan on 30/03/16.
//  Copyright © 2016 Sravan. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <MultipeerConnectivity/MultipeerConnectivity.h>

@interface MPCHandler : NSObject<MCSessionDelegate>

@property (nonatomic, strong) MCPeerID *peerID;
@property (nonatomic, strong) MCSession *session;
@property (nonatomic, strong) MCBrowserViewController *browser;
@property (nonatomic, strong) MCAdvertiserAssistant *advertiser;

- (void)setupPeerWithDisplayName:(NSString *)displayName;
- (void)setupSession;
- (void)setupBrowser;
- (void)advertiseSelf:(BOOL)advertise;

@end
