//
//  chatview.h
//  UBtalk
//
//  Created by Yazz on 2016. 3. 11..
//  Copyright © 2016년 IMS. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <XMPP.h>
#import "UBchat_singleTone.h"


@interface chatview : UIViewController



- (IBAction)btSendMessage:(id)sender;




@property (weak, nonatomic) IBOutlet UITextField *txsendMessage;
@property (weak, nonatomic) IBOutlet UITextField *sendId;


@property (nonatomic, strong) UBchat_singleTone *shareInstance;


-(void)getbuddy : (NSMutableArray *) allbuddy;

@end
