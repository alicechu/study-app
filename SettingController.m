//
//  SettingController.m
//  DrawCircle
//
//  Created by alice chu on 10/21/14.
//  Copyright (c) 2014 Yeming. All rights reserved.
//

#import "SettingController.h"
#import "ViewController.h"

@interface SettingController ()

@end

@implementation SettingController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
    if ([segue.identifier isEqualToString:@"backToMain"]) {
        ViewController *viewController=segue.destinationViewController;
        int value=_sliderStudy.value;
        NSLog(@"%i",value);
        viewController.labelTimeString=[NSString stringWithFormat:@"%i:00",value];
        NSLog(@"aaa%@",viewController.labelTimeString);
    }
}

- (IBAction)sliderStudyChange:(id)sender {
    int value=_sliderStudy.value;
    _labelStudy.text=[NSString stringWithFormat:@"%imin",value];
}

- (IBAction)sliderRestChange:(id)sender {
    int value=_sliderRest.value;
    _labelRest.text=[NSString stringWithFormat:@"%imin",value];
}

/*- (IBAction)finishSetting:(id)sender {
    viewController=[[ViewController alloc]initWithNibName:@"ViewController" bundle:nil];
    viewController.labelTime.text=[NSString stringWithFormat:@"%i : 00",(int)_sliderStudy.value];
}*/

@end
