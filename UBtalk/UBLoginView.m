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
#import "UBchat_singleTone.h"




@interface UBLoginView () <XMPPStreamDelegate>

@end


@implementation UBLoginView
  BOOL checklogin = YES;




- (void)viewDidLoad {
    
    [super viewDidLoad];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}



//로그인
- (IBAction)gologin:(id)sender {
    _ubchat_singletone = [[UBchat_singleTone alloc]init];
    [_ubchat_singletone connectServer:_txid.text :_txpass.text];
    [self performSegueWithIdentifier:@"test" sender:self];

}



@end
