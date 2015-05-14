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

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
