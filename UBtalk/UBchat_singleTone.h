//
//  UBchat_singleTone.h
//  UBtalk
//
//  Created by Yazz on 2016. 3. 15..
//  Copyright © 2016년 IMS. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <XMPP.h>

@interface UBchat_singleTone : NSObject {
    
    XMPPStream *xmppStream;
    NSString *password;
    NSString *loginid;
    NSString *message;
   
}


@property (nonatomic, strong) NSString *password; // 로그인 패스워드
@property (nonatomic, strong) NSString *loginid; // 로그인 아이디


//로그인 메소드(싱글톤)
+(UBchat_singleTone *)shareInstance;
+(XMPPStream *)sharexmppStream;


-(void)connectServer: (NSString *)connectID : (NSString *)connectpassword;
-(void)sendMessage : (NSDictionary *) messageParams;
-(void)setUpStream;


@end
