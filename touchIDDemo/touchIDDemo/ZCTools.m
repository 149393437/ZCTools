//
//  ZCTools.m
//  touchIDDemo
//
//  Created by 张诚 on 15/5/14.
//  Copyright (c) 2015年 zhangcheng. All rights reserved.
//

#import "ZCTools.h"
#import <LocalAuthentication/LocalAuthentication.h>
#import <UIKit/UIKit.h>


@implementation ZCTools
-(instancetype)initWithTouchID_Block:(void(^)(touchIDENUM))a
{
    if (self=[super init]) {
        
        self.touchIDBlock=a;
        
        [self createTouchID];
    }
    return self;
}
-(void)createTouchID{
    //判断版本
    if ([[UIDevice currentDevice].systemVersion floatValue]<8.0) {
        if (self.touchIDBlock) {
            self.touchIDBlock(touchIDDeviceError);
        }
        return;
    }
    
    
    //创建touchID功能
    LAContext*context=[[LAContext alloc]init];
    NSError*error=nil;
    //判断是否能启动指纹功能
    if ([context canEvaluatePolicy:LAPolicyDeviceOwnerAuthenticationWithBiometrics error:&error]) {
        //启动指纹验证
        [context evaluatePolicy:LAPolicyDeviceOwnerAuthenticationWithBiometrics localizedReason:@"请验证指纹" reply:^(BOOL success, NSError *error) {
            //由于本身验证touchID是一个弹框，所以在这里我们是无法在启动一个弹框的
            if (success) {
//                NSLog(@"指纹验证成功");
                if (self.touchIDBlock) {
                self.touchIDBlock(touchIDCheckSucceed);
                }
            }else{
                switch (error.code) {
                    case -2:
//                        NSLog(@"点击的取消");
                        if (self.touchIDBlock) {
                        self.touchIDBlock(touchIDCheCkCancel);
                        }
                        break;
                    case -3:
//                        NSLog(@"手动输入密码");
                        if (self.touchIDBlock) {
                            self.touchIDBlock(touchIDCheckPassWord);
                        }

                    default:
                        break;
                }
            }
            
            
        }];
    }else{
        if (self.touchIDBlock) {
            self.touchIDBlock(touchIDDeviceError);
        }
        
        
    }

    
    

}

@end
