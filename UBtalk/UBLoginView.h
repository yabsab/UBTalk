//
//  ViewController.h
//  UBtalk
//
//  Created by Yazz on 2016. 3. 8..
//  Copyright © 2016년 IMS. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "chatview.h"
#import "UBchat_singleTone.h"




@interface UBLoginView : UIViewController


@property (weak, nonatomic) IBOutlet UITextField *txid;
@property (weak, nonatomic) IBOutlet UITextField *txpass;

@property (nonatomic,strong) UBchat_singleTone  *shareInstance;


-(IBAction)gologin:(id)sender;


@end

