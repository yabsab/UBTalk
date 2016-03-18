//
//  UBchat_singleTone.m
//  UBtalk
//
//  Created by Yazz on 2016. 3. 15..
//  Copyright © 2016년 IMS. All rights reserved.
//

#import "UBchat_singleTone.h"

@interface UBchat_singleTone() <XMPPStreamDelegate>
@end



@implementation UBchat_singleTone

+ (UBchat_singleTone *)sharedInstanc{
    
    static UBchat_singleTone *sharedInstance = nil;
    
    if(sharedInstance==nil){
        
        sharedInstance = [[UBchat_singleTone alloc]init];
        
    }
     return sharedInstance;
}


-(void)connectServer:(NSString *)connectID :(NSString *)connectpassword{
   
   
    NSString *getloginId = [NSString stringWithFormat:@"%@",connectID];
    NSString *getloginPass= [NSString stringWithFormat:@"%@",connectpassword];
    password = getloginPass;

    NSLog(@"로그인된 아이디 ID :%@ : ""%@",getloginId,getloginPass);
    _xmppStream = [[XMPPStream alloc]init];
    [_xmppStream setHostName:@"220.149.217.162"];
    [_xmppStream addDelegate:self delegateQueue:dispatch_get_main_queue()];
    [_xmppStream setHostPort:50001];
    [_xmppStream setMyJID:[XMPPJID jidWithUser:connectID domain:@"220.149.217.162" resource:nil]];
    [_xmppStream connectWithTimeout:30.0 error:nil];

}





-(void)sendMessage:(NSMutableDictionary *)messageParams{
  
    NSDictionary *messageStr = [[NSMutableDictionary alloc]init];
    messageStr = messageParams;
    
    NSString *sendID = [messageStr objectForKey:@"id"];
    NSString *sendMessage= [messageStr objectForKey:@"message"];
    
 
    
    if([messageStr count]>0){
   
        NSXMLElement *body = [NSXMLElement elementWithName:@"body"];
        [body setStringValue:sendMessage];
        NSLog(@"%@",body);
        
        NSXMLElement *SendMessage = [NSXMLElement elementWithName:@"message"];
        [SendMessage addAttributeWithName:@"type" objectValue:sendMessage];
        [SendMessage addAttributeWithName:@"to" objectValue:sendID];
         NSLog(@"메시지%@",SendMessage);

       
        [self.xmppStream sendElement: SendMessage];

    }
//    if([messageStr count] > 0) {
//        
//        NSXMLElement *body = [NSXMLElement elementWithName:@"body"];
//        [body setStringValue:messageStr];
//        
//        NSXMLElement *message = [NSXMLElement elementWithName:@"message"];
//        [message addAttributeWithName:@"type" stringValue:@"chat"];
//        [message addAttributeWithName:@"to" stringValue:@"testjy@desktop-kky"];
//        [message addChild:body];
//        
//        
//        [self.xmppStream sendElement: message];
//        
//        
//    }
    
}






- (void)xmppStream:(XMPPStream *)sender didFailToSendMessage:(XMPPMessage *)message error:(NSError *)error{
    
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

    NSLog(@"==============================================================");
    NSLog(@"xmppStreamDidAuthenticate");
    NSLog(@"==============================================================");
    
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
