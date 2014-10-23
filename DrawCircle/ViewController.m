//
//  ViewController.m
//  DrawCircle
//
//  Created by Yeming on 13-8-27.
//  Copyright (c) 2013年 Yeming. All rights reserved.
//

#import "ViewController.h"
#import <QuartzCore/QuartzCore.h>
@interface ViewController ()
{
    CAShapeLayer *arcLayer;
    BOOL *start;
    /*BOOL _isIntroduceVC;
    NSInteger numberOfHeight;
    BOOL _isIos5;
    BOOL _isAnimation;
    BOOL _isPressButton;*/
}
@end
@implementation ViewController
//@synthesize labelTime;
- (void)viewDidLoad
{
    [super viewDidLoad];
    if (_labelTimeString==NULL){
        self.labelTime.text=@"45:00";//default value
    }
    else{
        self.labelTime.text=_labelTimeString;
    }
    start=false;
    //_labelTime.text=
    //self.view.backgroundColor=[UIColor whiteColor];
    // Do any additional setup after loading the view, typically from a nib.
}
- (IBAction)tapDetect:(UITapGestureRecognizer*)sender {
    if (start==false)
    {
        start=true;
        int timeValue=[[self.labelTime.text componentsSeparatedByString:@":"][0] integerValue];
        [self intiUIOfView];
        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        for (int i=timeValue-1; i>=0; i--) {
           for (int j=59; j>=0; j--) {
              dispatch_async(dispatch_get_main_queue(), ^{
                _labelTime.text=[NSString stringWithFormat:@"%i:%i",i,j];
            });
            [NSThread sleepForTimeInterval:1.0f];
        }
    }
    });
    }
    else
    {
        [NSThread exit];
        [arcLayer removeFromSuperlayer];
    }
}
-(void)intiUIOfView
{
    UIBezierPath *path=[UIBezierPath bezierPath];
    
    CGRect rect=[UIScreen mainScreen].applicationFrame;
    
    [path addArcWithCenter:CGPointMake(rect.size.width/2,rect.size.height/2-90) radius:100 startAngle:3*M_PI/2 endAngle:7*M_PI/2 clockwise:YES];
    arcLayer=[CAShapeLayer layer];
    arcLayer.path=path.CGPath;//46,169,230
    arcLayer.fillColor=[UIColor colorWithRed:46.0/255.0 green:169.0/255.0 blue:230.0/255.0 alpha:0].CGColor;
    arcLayer.strokeColor=[UIColor blackColor].CGColor;
    arcLayer.lineWidth=4;
    arcLayer.frame=self.view.frame;
    [self.view.layer addSublayer:arcLayer];
    [self drawLineAnimation:arcLayer];
    
    
}
-(void)drawLineAnimation:(CALayer*)layer
{
    CABasicAnimation *bas=[CABasicAnimation animationWithKeyPath:@"strokeEnd"];
    int timeValue=[[self.labelTime.text componentsSeparatedByString:@":"][0] integerValue];
    NSLog(@"%i",timeValue);
    bas.duration=timeValue*60;
    bas.delegate=self;
    bas.fromValue=[NSNumber numberWithInteger:0];
    //bas.toValue=[NSNumber numberWithInteger:5];
    [layer addAnimation:bas forKey:@"key"];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
@end
