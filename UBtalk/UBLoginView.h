//
//  ViewController.h
//  UBtalk
//
//  Created by Yazz on 2016. 3. 8..
//  Copyright © 2016년 IMS. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "chatview.h"


@class XMPPStream;
@class chatview;

@interface UBLoginView : UIViewController



@property (weak, nonatomic) IBOutlet UITextField *txid;
@property (weak, nonatomic) IBOutlet UITextField *txpass;
@property (weak, nonatomic) IBOutlet UITextField *txmessage;

@property (strong, nonatomic) XMPPStream *xmpp;
@property (weak, nonatomic) IBOutlet UILabel *dislabel;

- (IBAction)sendmessage:(id)sender;


-(IBAction)gologin:(id)sender;


-(void)setConnect;
-(void)connect;

@end

