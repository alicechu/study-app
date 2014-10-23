//
//  ViewController.h
//  DrawCircle
//
//  Created by Yeming on 13-8-27.
//  Copyright (c) 2013年 Yeming. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SettingController.h"
@interface ViewController : UIViewController
@property (strong, nonatomic) IBOutlet UILabel *labelTime;
- (IBAction)tapDetect:(UITapGestureRecognizer*)sender;
@property (strong,nonatomic) NSString *labelTimeString;
@property (strong, nonatomic) IBOutlet UILabel *labelTest;
@end
