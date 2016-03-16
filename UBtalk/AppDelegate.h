//
//  AppDelegate.h
//  UBtalk
//
//  Created by Yazz on 2016. 3. 8..
//  Copyright © 2016년 IMS. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <XMPP.h>

@class XMPPStream;
@interface AppDelegate : UIResponder <UIApplicationDelegate>{

XMPPStream *xmppStream;
}

@property (nonatomic, readonly) XMPPStream *xmppStream;
@property (strong, nonatomic) UIWindow *window;

@end

