//
//  chatview.m
//  UBtalk
//
//  Created by Yazz on 2016. 3. 11..
//  Copyright © 2016년 IMS. All rights reserved.
//

#import "chatview.h"
#import "UBLoginView.h"
#import "UBchat_singleTone.h"
#import <XMPP.h>

@interface chatview () <XMPPStreamDelegate>

@end

@implementation chatview

-(UBchat_singleTone *)ubsingle {
    
    return (UBchat_singleTone *)[[UIApplication sharedApplication]delegate];
}

- (XMPPStream *)xmppStream {
    return [[self ubsingle] xmppStream];
}


- (void)viewDidLoad {
    
    [super viewDidLoad];
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
  }


- (IBAction)btSendMessage:(id)sender {
   
    
    NSString *messageStr = self.txsendMessage.text;
    if([messageStr length] > 0) {
        NSXMLElement *body = [NSXMLElement elementWithName:@"body"];
        [body setStringValue:messageStr];
        
        NSXMLElement *message = [NSXMLElement elementWithName:@"message"];
        [message addAttributeWithName:@"type" stringValue:@"chat"];
        [message addAttributeWithName:@"to" stringValue:@"testjy@desktop-kky"];
        [message addChild:body];
        [self.xmppStream sendElement:message];
        

    
    }
    
    
    
  }

@end
