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
    

}

@property (nonatomic,strong) XMPPStream *xmppStream;



//로그인 메소드(싱글톤)
+(UBchat_singleTone *)LoginInstanc;

-(void)connectServer: (NSString *)connectID : (NSString *)connectpassword;



@end
