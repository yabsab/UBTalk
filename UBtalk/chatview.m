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
#import <XMPPStream.h>


@interface chatview () <XMPPStreamDelegate>

@end


@implementation chatview


- (void)viewDidLoad {
    
    [super viewDidLoad];
    self.shareInstance = [UBchat_singleTone shareInstance];
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}



- (IBAction)btSendMessage:(id)sender {
    
    
    _shareInstance = [UBchat_singleTone shareInstance];
    NSMutableDictionary *addchat =[[NSMutableDictionary alloc]init];
    [addchat setObject:_sendId.text forKey:@"id"];
    [addchat setObject:_txsendMessage.text forKey:@"message"];
    [_shareInstance sendMessage:addchat];
    
    
}

-(void)getbuddy : (NSMutableArray *) allbuddy{
    NSMutableArray *disallbuddy = [[NSMutableArray alloc]init];
    disallbuddy = allbuddy;
    NSLog(@"%@",disallbuddy);
    
    
}


@end
