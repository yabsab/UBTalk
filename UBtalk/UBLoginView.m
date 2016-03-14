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

- (void)setUpStream{
    
    _xmpp = [[XMPPStream alloc]init];
    [_xmpp setHostName:@"220.149.217.162"];
    [_xmpp addDelegate:self
         delegateQueue:dispatch_get_main_queue()];
}
-(void)connect{
    
    NSString *connectID = [NSString stringWithFormat:@"%@",txid.text];
    NSString *connectPass= [NSString stringWithFormat:@"%@",txpass.text];
    NSLog(@"로그인된 아이디 ID :%@ : ""%@",connectID,connectPass);
    

    
    _xmpp = [[XMPPStream alloc]init];
    [_xmpp setHostName:@"220.149.217.162"];
    [_xmpp addDelegate:self
         delegateQueue:dispatch_get_main_queue()];
    [_xmpp setHostPort:50001];

    [_xmpp setMyJID:[XMPPJID jidWithUser:connectID domain:@"220.149.217.162" resource:nil]];
    [_xmpp connectWithTimeout:30.0 error:nil];
    

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
    
    [self performSegueWithIdentifier:@"test" sender:self];
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
