//
//  ViewController.m
//  UBtalk
//
//  Created by Yazz on 2016. 3. 8..
//  Copyright © 2016년 IMS. All rights reserved.
//


#import "UBLoginView.h"
#import <XMPP.h>




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
    
    NSString  *myJID = @"yazz@220.149.217.162";
    NSString  *myPassword = @"yazz9630";
    
//    [self setUpStream];
    
    _xmpp = [[XMPPStream alloc]init];
    [_xmpp setHostName:@"220.149.217.162"];
    [_xmpp addDelegate:self
         delegateQueue:dispatch_get_main_queue()];
    [_xmpp setHostPort:50001];
    
    [_xmpp setMyJID:[XMPPJID jidWithString:myJID]];
    
    [_xmpp connectWithTimeout:30.0 error:nil];
    
//    _xmpp conne
}






#pragma mark XMPP Delegate

- (void)xmppStreamWillConnect:(XMPPStream *)sender{
    
}

/**
 * This method is called after the tcp socket has connected to the remote host.
 * It may be used as a hook for various things, such as updating the UI or extracting the server's IP address.
 *
 * If developing an iOS app that runs in the background,
 * please use XMPPStream's enableBackgroundingOnSocket property as opposed to doing it directly on the socket here.
 **/
- (void)xmppStream:(XMPPStream *)sender socketDidConnect:(GCDAsyncSocket *)socket{


}

- (void)xmppStreamDidConnect:(XMPPStream *)sender{
    [sender authenticateWithPassword:@"yazz9630" error:nil];
    
}


/**
 * This method is called after a TCP connection has been established with the server,
 * and the opening XML stream negotiation has started.
 **/
- (void)xmppStreamDidStartNegotiation:(XMPPStream *)sender{
    
}

- (void)xmppStreamDidDisconnect:(XMPPStream *)sender withError:(NSError *)error{
    
}


/**
 * This method is called immediately prior to the stream being secured via TLS/SSL.
 * Note that this delegate may be called even if you do not explicitly invoke the startTLS method.
 * Servers have the option of requiring connections to be secured during the opening process.
 * If this is the case, the XMPPStream will automatically attempt to properly secure the connection.
 *
 * The dictionary of settings is what will be passed to the startTLS method of the underlying GCDAsyncSocket.
 * The GCDAsyncSocket header file contains a discussion of the available key/value pairs,
 * as well as the security consequences of various options.
 * It is recommended reading if you are planning on implementing this method.
 *
 * The dictionary of settings that are initially passed will be an empty dictionary.
 * If you choose not to implement this method, or simply do not edit the dictionary,
 * then the default settings will be used.
 * That is, the kCFStreamSSLPeerName will be set to the configured host name,
 * and the default security validation checks will be performed.
 *
 * This means that authentication will fail if the name on the X509 certificate of
 * the server does not match the value of the hostname for the xmpp stream.
 * It will also fail if the certificate is self-signed, or if it is expired, etc.
 *
 * These settings are most likely the right fit for most production environments,
 * but may need to be tweaked for development or testing,
 * where the development server may be using a self-signed certificate.
 *
 * Note: If your development server is using a self-signed certificate,
 * you likely need to add GCDAsyncSocketManuallyEvaluateTrust=YES to the settings.
 * Then implement the xmppStream:didReceiveTrust:completionHandler: delegate method to perform custom validation.
 **/
- (void)xmppStream:(XMPPStream *)sender willSecureWithSettings:(NSMutableDictionary *)settings{
    
}

- (void)xmppStream:(XMPPStream *)sender didNotRegister:(NSXMLElement *)error{
    
}

/**
 * This method is called after authentication has successfully finished.
 * If authentication fails for some reason, the xmppStream:didNotAuthenticate: method will be called instead.
 **/
- (void)xmppStreamDidAuthenticate:(XMPPStream *)stream{

    XMPPPresence *presence = [XMPPPresence presence];

    [stream sendElement:presence];
}

/**
 * This method is called if authentication fails.
 **/
- (void)xmppStream:(XMPPStream *)sender didNotAuthenticate:(NSXMLElement *)error{
    
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
