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
    NSString *password;
    NSString *loginid;
    
    
}

//로그인 메소드(싱글톤)
//+(UBchat_singleTone *)LoginInstanc;

-(void)connectServer: (NSString *)connectID : (NSString *)connectpassword;

@property (nonatomic, readonly) XMPPStream *xmppStream;
@property (strong, nonatomic) UIWindow *window;

@end

