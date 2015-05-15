//
//  ViewController.m
//  touchIDDemo
//
//  Created by 张诚 on 15/5/14.
//  Copyright (c) 2015年 zhangcheng. All rights reserved.
//

#import "ViewController.h"
#import "ZCTools.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}
- (IBAction)touchIDClick:(id)sender {
    ZCTools*tools=[[ZCTools alloc]initWithTouchID_Block:^(touchIDENUM x) {
        switch (x) {
            case touchIDCheCkCancel:
                NSLog(@"取消");
                break;
            case touchIDCheckPassWord:
                NSLog(@"手动输入密码");
                
                break;
            case touchIDCheckSucceed:
                NSLog(@"验证成功");
                
                break;
            case touchIDDeviceError:
                NSLog(@"无法启动touid");
                
                break;
        }
    }];
    tools=nil;
}
- (IBAction)fachDetect:(id)sender {
    UIImageView*imageView=(UIImageView*)[self.view viewWithTag:100];
    if (imageView==nil) {
        imageView=[[UIImageView alloc]initWithFrame:self.view.frame];
        imageView.tag=100;
        [self.view addSubview:imageView];
        
        UITapGestureRecognizer*tap=[[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tapClick:)];
        imageView.userInteractionEnabled=YES;
        [imageView addGestureRecognizer:tap];
    }else{
        for (UIView*view in imageView.subviews) {
            [view removeFromSuperview];
        }
    }
    
    imageView.image=[UIImage imageNamed:[NSString stringWithFormat:@"%d.jpg",arc4random()%30]];

    
    
    
    ZCTools*tools=[[ZCTools alloc]initWithFaceDetectWithImageView:imageView Block:^(BOOL isSucceed, NSArray *array) {
        
        for (ZCFaceDetectModel*model in array)
        {
            //识别出的人脸
            UIView*face=[[UIView alloc]initWithFrame:CGRectFromString(model.faceFrameString)];
            face.backgroundColor=[UIColor redColor];
            face.alpha=0.6;
            [imageView addSubview:face];
            //识别出的左眼
            UIView*leftEye=[[UIView alloc]initWithFrame:CGRectMake(0, 0, 10, 10)];
            leftEye.center=CGPointFromString(model.leftEyePointString);
            leftEye.backgroundColor=[UIColor blueColor];
            leftEye.alpha=0.6;
            [imageView addSubview:leftEye];
            //识别出的右眼
            UIView*rightEye=[[UIView alloc]initWithFrame:CGRectMake(0, 0, 10, 10)];
            rightEye.center=CGPointFromString(model.rightEyePointString);
            rightEye.backgroundColor=[UIColor yellowColor];
            rightEye.alpha=0.6;
            [imageView addSubview:rightEye];
            //识别出的嘴
            
            UIView*mouth=[[UIView alloc]initWithFrame:CGRectMake(0, 0, 10, 10)];
            mouth.center=CGPointFromString(model.mouthPointString);
            mouth.backgroundColor=[UIColor greenColor];
            mouth.alpha=0.6;
            [imageView addSubview:mouth];
            
            NSLog(@"是否微笑%d~~~左眼是否闭上%d~~~右眼是否闭上%d",model.isSmile,model.isLeftEyeClosed,model.isRightEyeClosed);
        }
        
    }];
    tools=nil;
    
}
-(void)tapClick:(UITapGestureRecognizer*)tap{
    [self fachDetect:nil];

}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
