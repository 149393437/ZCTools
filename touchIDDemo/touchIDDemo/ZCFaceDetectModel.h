//
//  ZCFaceDetectModel.h
//  touchIDDemo
//
//  Created by 张诚 on 15/5/14.
//  Copyright (c) 2015年 zhangcheng. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ZCFaceDetectModel : NSObject
//人脸位置
@property(nonatomic,copy)NSString*faceFrameString;
//左眼位置
@property(nonatomic,copy)NSString*leftEyePointString;
//右眼位置
@property(nonatomic,copy)NSString*rightEyePointString;
//嘴巴位置
@property(nonatomic,copy)NSString*mouthPointString;
@property(nonatomic)BOOL isSmile;
@property(nonatomic)BOOL isLeftEyeClosed;
@property(nonatomic)BOOL isRightEyeClosed;
@end
