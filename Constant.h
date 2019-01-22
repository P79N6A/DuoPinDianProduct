//
//  Constant.h
//  TaiYiToken
//
//  Created by Frued on 2018/8/13.
//  Copyright © 2018年 Frued. All rights reserved.
//

#ifndef Constant_h
#define Constant_h
/**
 *  window object
 */
#define WINDOW [[[UIApplication sharedApplication] delegate] window]


/**
 *  object is not nil and null
 */
#define NotNilAndNull(_ref)  (((_ref) != nil) && (![(_ref) isEqual:[NSNull null]]))

/**
 *  object is nil or null
 */
#define IsNilOrNull(_ref)   (((_ref) == nil) || ([(_ref) isEqual:[NSNull null]]) || ([(_ref) isEqual:[NSNull class]]))

/**
 *  string is nil or null or empty
 */
#define IsStrEmpty(_ref)    (((_ref) == nil) || ([(_ref) isEqual:[NSNull null]]) ||([(_ref)isEqualToString:@""]))

/**
 *  Array is nil or null or empty
 */
#define IsArrEmpty(_ref)    (((_ref) == nil) || ([(_ref) isEqual:[NSNull null]]) ||([(_ref) count] == 0))

/**
 *  validate string
 */
#define VALIDATE_STRING(str) (IsNilOrNull(str) ? @"" : str)

/**
 *  update string
 */
#define UPDATE_STRING(old, new) ((IsNilOrNull(new) || IsStrEmpty(new)) ? old : new)

/**
 *  validate NSNumber
 */
#define VALIDATE_NUMBER(number) (IsNilOrNull(number) ? @0 : number)

/**
 *  update NSNumber
 */
#define UPDATE_NUMBER(old, new) (IsNilOrNull(new) ? old : new)

/**
 *  validate NSArray
 */
#define VALIDATE_ARRAY(arr) (IsNilOrNull(arr) ? [NSArray array] : arr)


/**
 *  validate NSMutableArray
 */
#define VALIDATE_MUTABLEARRAY(arr) (IsNilOrNull(arr) ? [NSMutableArray array] :     [NSMutableArray arrayWithArray: arr])
/**
 *  statusbar height
 */
#define STATUSBAR_HEIGHT [[UIApplication sharedApplication] statusBarFrame].size.height
#define kNavBarHeight 44.0
#define TABBAR_HEIGHT ([[UIApplication sharedApplication] statusBarFrame].size.height>20?83:49)
#define NAVIGATIONBAR_HEIGHT (STATUSBAR_HEIGHT + kNavBarHeight)
#define kIs_iPhoneX (SCREEN_WIDTH == 375.f && SCREEN_HEIGHT == 812.f)
/// 第一个参数是当下的控制器适配iOS11 一下的，第二个参数表示scrollview或子类
#define AdjustsScrollViewInsetNever(controller,view) if(@available(iOS 11.0, *)) {view.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentNever;} else if([controller isKindOfClass:[UIViewController class]]) {controller.automaticallyAdjustsScrollViewInsets = false;}
#define SafeAreaTopHeight (ScreenHeight >= 812.0 ? 88 : 64)
/// 底部宏
#define SafeAreaBottomHeight (ScreenHeight >= 812.0 ? 34 : 0)
#define RGB(r,g,b) [UIColor colorWithRed:r/255.0 green:g/255.0 blue:b/255.0 alpha:1]
#define kRGBA(r,g,b,a) [UIColor colorWithRed:r/255.0 green:g/255.0 blue:b/255.0 alpha:a]
#define ScreenWidth [[UIScreen mainScreen] bounds].size.width
#define ScreenHeight [[UIScreen mainScreen] bounds].size.height
#define WS(weakSelf) __weak __typeof(&*self)weakSelf = self
//获取temp
#define kPathTemp NSTemporaryDirectory()
//获取沙盒 Document
#define kPathDocument [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) firstObject]
//获取沙盒 Cache
#define kPathCache [NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES) firstObject]

#define PRODUCT_BUNDLE_ID @"com.DuoDian.DuoPinDianProduct"
#endif /* Constant_h */
