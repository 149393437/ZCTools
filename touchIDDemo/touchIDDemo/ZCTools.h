//
//  ZCTools.h
//  touchIDDemo
//
//  Created by 张诚 on 15/5/14.
//  Copyright (c) 2015年 zhangcheng. All rights reserved.
//
/*
 iOS研究院305044955
 版本迭代1.0 初始建立，加入touchID功能
 
 */
#pragma mark touchID代码示例
/*
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
 */



#import <Foundation/Foundation.h>
#import <LocalAuthentication/LocalAuthentication.h>
#import <UIKit/UIKit.h>
typedef enum : NSUInteger {
    touchIDDeviceError=0,
    touchIDCheckSucceed,
    touchIDCheCkCancel,
    touchIDCheckPassWord
} touchIDENUM;
@interface ZCTools : NSObject
//指纹block
@property(nonatomic,copy)void(^touchIDBlock)(touchIDENUM);
//人脸识别block
@property(nonatomic,copy)void(^faceDetectBlock)(BOOL,NSArray*);
//人脸识别的imageView
@property(nonatomic,assign)UIImageView*headerImageView;
//iOS8  指纹验证
-(instancetype)initWithTouchID_Block:(void(^)(touchIDENUM))a;
//iOS7  图像识别
-(instancetype)initWithFaceDetectWithImageView:(UIImageView*)headerImageView Block:(void(^)(BOOL,NSArray*))b;




@end
