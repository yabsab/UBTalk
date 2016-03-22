//
//  ViewController.m
//  UBtalk
//
//  Created by Yazz on 2016. 3. 8..
//  Copyright © 2016년 IMS. All rights reserved.
//

#import "AppDelegate.h"
#import "UBLoginView.h"
#import <XMPP.h>
#import "chatview.h"
#import "UBchat_singleTone.h"


@interface UBLoginView () <XMPPStreamDelegate>


@end


@implementation UBLoginView



- (void)viewDidLoad {
    
    [super viewDidLoad];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}


//로그인
- (IBAction)gologin:(id)sender {
    
    NSString *nullid= _txid.text;
    NSString *nullpass= _txpass.text;
    
    if ([nullid length]<1 || [nullpass length]<1) {
        UIAlertView *theAlert = [[UIAlertView alloc] initWithTitle:@"로그인 정보 확인"
                                                           message:@"ID 및 PassWord 확인해주세요"
                                                          delegate:self
                                                 cancelButtonTitle:@"OK"
                                                 otherButtonTitles:nil];
        [theAlert show];

    }
    
    //수정 로그인 확인 시 다음 화면으로 
    
    _ubchat_singleTone  = [[UBchat_singleTone alloc]init];
    [_ubchat_singleTone connectServer:_txid.text :_txpass.text];
   [self performSegueWithIdentifier:@"goChatView" sender:self];
    
   
}



@end
