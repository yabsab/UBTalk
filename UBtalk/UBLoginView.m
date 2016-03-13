//
//  ViewController.m
//  UBtalk
//
//  Created by Yazz on 2016. 3. 8..
//  Copyright © 2016년 IMS. All rights reserved.
//


#import "UBLoginView.h"
#import <XMPP.h>
#import "chatview.h"



@interface UBLoginView () <XMPPStreamDelegate>

@end


@implementation UBLoginView

@synthesize txpass,txid;

- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    
    
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}




- (IBAction)gologin:(id)sender {
    
    [self connect];
    
    
}


-(void)connect{
    
    NSString *connectID = [NSString stringWithFormat:@"%@",txid.text];
    NSString *connectPass= [NSString stringWithFormat:@"%@",txpass.text];
    NSLog(@"로그인된 아이디 ID :%@ : ""%@",connectID,connectPass);

    
    _xmpp = [[XMPPStream alloc]init];
    [_xmpp setHostName:@"220.149.217.162"];
    [_xmpp addDelegate:self delegateQueue:dispatch_get_main_queue()];
    [_xmpp setMyJID:[XMPPJID jidWithUser:connectID domain:@"220.149.217.162" resource:nil]];
    [_xmpp setHostPort:50001];
     NSError *error = nil;
    [_xmpp connectWithTimeout:30.0 error:&error];
   

    
    
}

#pragma mark XMPP Delegate

- (void)xmppStreamWillConnect:(XMPPStream *)sender{
    
}



- (void)xmppStream:(XMPPStream *)sender socketDidConnect:(GCDAsyncSocket *)socket{
    
    
}



-(void)xmppStream:(XMPPStream *)sender didNotAuthenticate:(DDXMLElement *)error{
   
    UIAlertView *theAlert = [[UIAlertView alloc] initWithTitle:@"로그인 정보 확인"
                                                       message:@"ID 및 PassWord 확인해주세요"
                                                      delegate:self
                                             cancelButtonTitle:@"OK"
                                             otherButtonTitles:nil];
    [theAlert show];
    
    
}


- (void)xmppStreamDidConnect:(XMPPStream *)sender{
    
     NSString *connectPass= [NSString stringWithFormat:@"%@",txpass.text];
    
    NSError *checkconnect;
    [sender authenticateWithPassword:connectPass error:&checkconnect];
  

}


- (void)xmppStreamDidAuthenticate:(XMPPStream *)stream{
    
    XMPPPresence *presence = [XMPPPresence presence];
    
    [stream sendElement:presence];
    
    chatview *_chatview = [[chatview alloc] init];
    [self presentViewController:_chatview animated:NO completion:nil];
}



- (void)xmppStreamDidStartNegotiation:(XMPPStream *)sender{
    
}

- (void)xmppStreamDidDisconnect:(XMPPStream *)sender withError:(NSError *)error{
    
}



- (void)xmppStream:(XMPPStream *)sender willSecureWithSettings:(NSMutableDictionary *)settings{
    
}

- (void)xmppStream:(XMPPStream *)sender didNotRegister:(NSXMLElement *)error{
    
}




- (void)xmppStream:(XMPPStream *)sender didReceiveMessage:(XMPPMessage *)message{
    
    NSString *msg = [[message elementForName:@"body"] stringValue];
    NSString *from = [[message attributeForName:@"from"] stringValue];
    NSMutableDictionary *m = [[NSMutableDictionary alloc] init];
    NSLog(@"%@",msg);
    NSLog(@"%@",from);
}


-(IBAction)sendmessage:(id)sender  {
    
    NSString *messageStr = self.txpass.text;
    
    if([messageStr length] > 0) {
        
        NSXMLElement *body = [NSXMLElement elementWithName:@"body"];
        [body setStringValue:messageStr];
        
        NSXMLElement *message = [NSXMLElement elementWithName:@"message"];
        [message addAttributeWithName:@"type" stringValue:@"chat"];
        [message addAttributeWithName:@"to" stringValue:@"admin2@desktop-kky"];
        [message addChild:body];
        
        [self.xmpp sendElement:message];
        
    }
}

@end
