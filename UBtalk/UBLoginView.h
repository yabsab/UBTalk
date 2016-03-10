//
//  ViewController.h
//  UBtalk
//
//  Created by Yazz on 2016. 3. 8..
//  Copyright © 2016년 IMS. All rights reserved.
//

#import <UIKit/UIKit.h>


@class XMPPStream;

@interface UBLoginView : UIViewController
<UITextFieldDelegate>


@property (weak, nonatomic) IBOutlet UITextField *txid;
@property (weak, nonatomic) IBOutlet UITextField *txpass;
@property (strong, nonatomic) XMPPStream *xmpp;
@property (weak, nonatomic) IBOutlet UILabel *dislabel;
- (IBAction)sendmessage:(id)sender;


-(IBAction)gologin:(id)sender;

-(void)setConnect;
-(void)setUpStream;
-(void)connect;
@end

