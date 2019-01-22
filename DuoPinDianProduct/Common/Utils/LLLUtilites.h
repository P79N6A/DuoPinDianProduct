//
//  LLLAppTool.h
//  LLLDemos
//
//  Created by 李龙林(EX-LILONGLIN001) on 2018/9/3.
//  Copyright © 2018年 lilonglin. All rights reserved.
//  工具类，一些非对象的，而是类方法调用的类

#import <Foundation/Foundation.h>

@interface LLLUtilites : NSObject

/// 获取APP的版本号
+ (NSString *)getCFBundleVersion;

/// 获取APP的UUID
+ (NSString *)getUUIDString;

/// 判断是否是数字
+ (BOOL)isNumberValid:(NSString *)string;

/// 判断是否是数字或字母
+(BOOL)isCharOrNumberValid:(NSString *)string;

//判断是否是6位数的验证码
+ (BOOL)isCheckCode:(NSString *)str;

//正则检查密码规则6-12位数字和密码
+ (BOOL)isCheckPSW:(NSString *)str;

//正则检查是否为车牌号
+ (BOOL)isCheckCarNo:(NSString *)str;

/// 检验身份证号
+(BOOL)checkIdentityCardNo:(NSString*)cardNo;

/// 将输入的金额数字转化为汉字形式
+(NSString *)numberOfMoneyToChinese:(NSString *)moneyNumber;

/// 计算label高度
+ (CGSize)calculateContentSizeWithFrameSize:(CGSize)frameSize withFontSize:(CGFloat)fontSize withString:(NSString*)content;

/// 阴影加圆角
+ (void)addShadowWithView:(UIView *)view WithOpacity:(float)shadowOpacity shadowRadius:(CGFloat)shadowRadius andCornerRadius:(CGFloat)cornerRadius;

/// 更换rootViewController
+ (void)restoreRootViewController:(UIViewController *)rootViewController;

@end
