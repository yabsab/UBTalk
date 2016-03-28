//
//  UBchat_singleTone.m
//  UBtalk
//
//  Created by Yazz on 2016. 3. 15..
//  Copyright © 2016년 IMS. All rights reserved.
//

#import "UBchat_singleTone.h"
#import <XMPP.h>
#import <XMPPRosterMemoryStorage.h>


@interface UBchat_singleTone() <XMPPStreamDelegate>
@property (nonatomic,strong) XMPPStream *xmppStream;



@end

@implementation UBchat_singleTone


+(UBchat_singleTone *)shareInstance{
    static UBchat_singleTone *_ubchat_singleTone;
    
    if(_ubchat_singleTone==nil){
       
        _ubchat_singleTone = [[UBchat_singleTone alloc]init];
        [_ubchat_singleTone connectServer:_ubchat_singleTone.loginid: _ubchat_singleTone.password ];
    
    
    }
    return _ubchat_singleTone;
}










- (void)xmppStream:(XMPPStream *)sender didReceivePresence:(XMPPPresence *)presence{
    



}






-(void)connectServer:(NSString *)connectID :(NSString *)connectpassword{
   
    [self setUpStream];

    loginid = [NSString stringWithFormat:@"%@",connectID];
    password= [NSString stringWithFormat:@"%@",connectpassword];
    NSLog(@"로그인된 아이디 ID :%@ : ""%@",loginid,password);
    [xmppStream setMyJID:[XMPPJID jidWithUser:connectID domain:@"220.149.217.162" resource:nil]];
    [xmppStream connectWithTimeout:30.0 error:nil];
    
}


- (void)setUpStream{
    
    xmppStream = [[XMPPStream alloc]init];
    [xmppStream setHostName:@"220.149.217.162"];
    [xmppStream addDelegate:self delegateQueue:dispatch_get_main_queue()];
    [xmppStream setHostPort:50001];
}



-(void)sendMessage:(NSMutableDictionary *)messageParams{
    NSDictionary *messageStr = [[NSMutableDictionary alloc]init];
    messageStr = messageParams;
    NSString *sendID = [messageStr objectForKey:@"id"];
    NSString *sendMessage= [messageStr objectForKey:@"message"];
    
    if([messageStr count]>0){
   
        
        NSXMLElement *body = [NSXMLElement elementWithName:@"body"];
        [body setStringValue:sendMessage];
        NSXMLElement *SendMessage = [NSXMLElement elementWithName:@"message"];
        [SendMessage addAttributeWithName:@"type" stringValue:@"chat"];
        [SendMessage addAttributeWithName:@"to" stringValue:sendID];
        [SendMessage addChild:body];
        
        //time stamp
        NSDate *date = [NSDate date];
        NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
        [formatter setDateFormat:@"hh:mm a"];
         NSLog(@"%@",date);
    
        [xmppStream sendElement: SendMessage];

         NSLog(@"%@",SendMessage);
      
    }


}


#pragma mark XMPP Delegate
- (void)xmppStreamWillConnect:(XMPPStream *)sender{
    
}



- (void)xmppStream:(XMPPStream *)sender socketDidConnect:(GCDAsyncSocket *)socket{
    
}


-(void)xmppStream:(XMPPStream *)sender didReceiveMessage:(XMPPMessage *)message{
 
    NSString *msg = [[message elementForName:@"body"] stringValue];
    NSString *from = [[message attributeForName:@"from"] stringValue];
    
    NSLog(@"%@",msg);
    NSLog(@"%@",from);
    
    
}


- (void)xmppStreamDidConnect:(XMPPStream *)sender{
   
    NSString *connectPass= [NSString stringWithFormat:@"%@",password];
    NSError *checkconnect;
    [sender authenticateWithPassword:connectPass error:&checkconnect];

}


- (void)xmppStreamDidAuthenticate:(XMPPStream *)stream{
    
    XMPPPresence *presence = [XMPPPresence presence];
    [stream sendElement:presence];
    [[self xmppStream] sendElement:presence];

    
}

- (void)xmppStreamDidStartNegotiation:(XMPPStream *)sender{
  
}

- (void)xmppStreamDidDisconnect:(XMPPStream *)sender withError:(NSError *)error{
       
}

- (void)xmppStream:(XMPPStream *)sender willSecureWithSettings:(NSMutableDictionary *)settings{
    
}

- (void)xmppStream:(XMPPStream *)sender didNotRegister:(NSXMLElement *)error{
    
}



@end
