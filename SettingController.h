//
//  SettingController.h
//  DrawCircle
//
//  Created by alice chu on 10/21/14.
//  Copyright (c) 2014 Yeming. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SettingController : UIViewController
@property (strong, nonatomic) IBOutlet UISlider *sliderStudy;
@property (strong, nonatomic) IBOutlet UISlider *sliderRest;
@property (strong, nonatomic) IBOutlet UILabel *labelStudy;
@property (strong, nonatomic) IBOutlet UILabel *labelRest;
- (IBAction)sliderStudyChange:(id)sender;
- (IBAction)sliderRestChange:(id)sender;
//- (IBAction)finishSetting:(id)sender;

@end
