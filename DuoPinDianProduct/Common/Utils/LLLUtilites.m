//
//  LLLAppTool.m
//  LLLDemos
//
//  Created by 李龙林(EX-LILONGLIN001) on 2018/9/3.
//  Copyright © 2018年 lilonglin. All rights reserved.
//

#import "LLLUtilites.h"

@implementation LLLUtilites

#pragma mark - App 信息
/**获取APP的版本号*/
+ (NSString *)getCFBundleVersion{
    NSDictionary *infoDictionary = [[NSBundle mainBundle] infoDictionary];
    NSString *version = [infoDictionary objectForKey:@"CFBundleShortVersionString"];
    return version;
}

/// 获取APP的UUID
+ (NSString *)getUUIDString{
    NSString *udidString = [[[UIDevice currentDevice] identifierForVendor] UUIDString];
    return udidString;
}

#pragma mark - 正则匹配
/// 判断是否是数字
+ (BOOL)isNumberValid:(NSString *)string {
    NSString *regex = @"[0-9]+([.]{1}[0-9]{0,2}){0,1}";
    NSPredicate *pred = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",regex];
    return [pred evaluateWithObject:string];
}

/// 判断是否是数字或字母
+(BOOL)isCharOrNumberValid:(NSString *)string {
    NSString *regex = @"[0-9A-Za-z]{6,16}";
    NSPredicate *pred = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",regex];
    return [pred evaluateWithObject:string];
}

//判断是否是6位数的验证码
+ (BOOL)isCheckCode:(NSString *)str {
    if (str.length != 6) {
        return NO;
    }
    NSString *CODESTRING = @"(^\\d{6}$)";
    NSPredicate *regexCode = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", CODESTRING];
    if ([regexCode evaluateWithObject: str]== YES ) {
        return YES;
    }
    return NO;
}

//正则检查密码规则6-12位数字和密码
+ (BOOL)isCheckPSW:(NSString *)str{
    if (str.length < 6) {
        return NO;
    }
    NSString *CODESTRING = @"(^(?![0-9]+$)(?![a-zA-Z]+$)[0-9A-Za-z]{6,12}$)";
    NSPredicate *regexCode = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", CODESTRING];
    if ([regexCode evaluateWithObject: str]== YES ) {
        return YES;
    }
    return NO;
}

//正则检查是否为车牌号
+ (BOOL)isCheckCarNo:(NSString *)str{
    if (str.length > 11) {
        return NO;
    }
    NSString *CODESTRING = @"(^([\u4e00-\u9fa5][a-zA-Z](([DF](?![a-zA-Z0-9]*[IO])[0-9]{4,5})|([0-9]{5}[DF])))|([冀豫云辽黑湘皖鲁苏浙赣鄂桂甘晋蒙陕吉闽贵粤青藏川宁琼渝京津沪新京军空海北沈兰济南广成使领A-Z]{1}[a-zA-Z0-9]{5,6}[a-zA-Z0-9挂学警港澳]{1})$)";
    NSPredicate *regexCode = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", CODESTRING];
    if ([regexCode evaluateWithObject: str]== YES ) {
        return YES;
    }
    return NO;
}

/// 检验身份证号
+(BOOL)checkIdentityCardNo:(NSString*)cardNo {
    if (cardNo.length != 18) {
        return  NO;
    }
    NSArray* codeArray = [NSArray arrayWithObjects:@"7",@"9",@"10",@"5",@"8",@"4",@"2",@"1",@"6",@"3",@"7",@"9",@"10",@"5",@"8",@"4",@"2", nil];
    NSDictionary* checkCodeDic = [NSDictionary dictionaryWithObjects:[NSArray arrayWithObjects:@"1",@"0",@"X",@"9",@"8",@"7",@"6",@"5",@"4",@"3",@"2", nil]  forKeys:[NSArray arrayWithObjects:@"0",@"1",@"2",@"3",@"4",@"5",@"6",@"7",@"8",@"9",@"10", nil]];
    
    NSScanner* scan = [NSScanner scannerWithString:[cardNo substringToIndex:17]];
    
    int val;
    BOOL isNum = [scan scanInt:&val] && [scan isAtEnd];
    if (!isNum) {
        return NO;
    }
    int sumValue = 0;
    
    for (int i =0; i<17; i++) {
        sumValue+=[[cardNo substringWithRange:NSMakeRange(i , 1) ] intValue]* [[codeArray objectAtIndex:i] intValue];
    }
    NSString* strlast = [checkCodeDic objectForKey:[NSString stringWithFormat:@"%d",sumValue%11]];
    if ([strlast isEqualToString: [[cardNo substringWithRange:NSMakeRange(17, 1)]uppercaseString]]) {
        return YES;
    }
    return  NO;
}

#pragma mark - 数字转化为汉字形式
/// 将输入的金额数字转化为汉字形式
+(NSString *)numberOfMoneyToChinese:(NSString *)moneyNumber {
    //规范格式到xxxxx.00形式
    NSMutableString *inputString = nil;
    inputString = [NSMutableString stringWithFormat:@"%.2lf", [moneyNumber doubleValue]];
    
    NSMutableString *outPutString= [[NSMutableString alloc]init];
    NSArray *MyScale=@[@"分",@"角",@"元",@"拾",@"佰",@"仟",@"万",@"拾",@"佰",@"仟",@"亿",@"拾",@"佰",@"仟",@"兆",@"拾",@"佰",@"仟"];
    NSArray *chineseNumberArray=@[@"零",@"壹",@"贰",@"叁",@"肆",@"伍",@"陆",@"柒",@"捌",@"玖"];
    //删除 "."
    [inputString deleteCharactersInRange:NSMakeRange([inputString rangeOfString:@"."].location, 1)];
    
    for (int i=0; i<inputString.length; i++) {
        NSInteger currentData = [[inputString substringWithRange:NSMakeRange(i, 1)] intValue];
        NSInteger nextData = 0;
        if (i+1<inputString.length) {
            nextData = [[inputString substringWithRange:NSMakeRange(i+1, 1)] intValue];
        }
        //改为大写数字
        [outPutString appendString:chineseNumberArray[currentData]];
        
        NSString *scale = MyScale[inputString.length-i-1];
        NSString *preOutPutCharacter = [outPutString substringWithRange:NSMakeRange(outPutString.length-1, 1)];
        
        for (int j=0; j<[MyScale count]; j++) {
            NSString *perScale = [MyScale objectAtIndex:j];
            //删除零
            if ([preOutPutCharacter isEqualToString:@"零"]
                && (([scale isEqualToString:perScale] && !nextData)
                    || [scale isEqualToString:@"兆"]
                    || [scale isEqualToString:@"亿"]
                    || [scale isEqualToString:@"万"]
                    || [scale isEqualToString:@"元"]
                    || [scale isEqualToString:@"角"]
                    || [scale isEqualToString:@"分"])) {
                    [outPutString deleteCharactersInRange:NSMakeRange(outPutString.length-1, 1)];
                    break;
                }
        }
        
        if (outPutString.length) {
            preOutPutCharacter = [outPutString substringWithRange:NSMakeRange(outPutString.length-1, 1)];
        }
        
        if (currentData
            || [scale isEqualToString:@"兆"]
            || ([scale isEqualToString:@"亿"] && ![preOutPutCharacter isEqualToString:@"兆"])
            || ([scale isEqualToString:@"万"] && ![preOutPutCharacter isEqualToString:@"亿"])
            || ([scale isEqualToString:@"元"] && outPutString.length)) {
            [outPutString appendString:scale];
        }
    }
    
    NSRange range1 = [outPutString rangeOfString:@"角"];
    NSRange range2 = [outPutString rangeOfString:@"分"];
    
    //判断是否有小数，无则显示xx元整
    if ([[inputString substringFromIndex:inputString.length-1]integerValue ]==0&&outPutString.length>0 && !range1.length && !range2.length){
        if ([[inputString substringFromIndex:inputString.length-2]integerValue ]==0){
            if ([outPutString rangeOfString:@"元"].length>0)
            {
                [outPutString appendString:@"整"];
            }else{
                [outPutString appendString:@"元整"];
            }
        }
    }
    return outPutString;
}

#pragma mark - 视图相关
/// 计算label高度
+ (CGSize)calculateContentSizeWithFrameSize:(CGSize)frameSize withFontSize:(CGFloat)fontSize withString:(NSString*)content {
    NSMutableParagraphStyle *style = [[NSMutableParagraphStyle alloc] init];
    [style setLineBreakMode:NSLineBreakByWordWrapping];
    UIFont *fontContent = [UIFont systemFontOfSize:14.f];
    NSDictionary *dic = @{NSFontAttributeName : fontContent, NSParagraphStyleAttributeName : style};
    CGSize resultSize = [content boundingRectWithSize:frameSize options:(NSStringDrawingUsesLineFragmentOrigin) attributes:dic context:nil].size;
    return resultSize;
}

/*
 周边加阴影，并且同时圆角
 */
+ (void)addShadowWithView:(UIView *)view WithOpacity:(float)shadowOpacity shadowRadius:(CGFloat)shadowRadius andCornerRadius:(CGFloat)cornerRadius {
    CALayer *shadowLayer = [CALayer layer];
    //////// shadow /////////
    shadowLayer.frame = view.layer.frame;
    shadowLayer.shadowColor = [UIColor blackColor].CGColor;//shadowColor阴影颜色
    shadowLayer.shadowOffset = CGSizeMake(0, 0);//shadowOffset阴影偏移，默认(0, -3),这个跟shadowRadius配合使用
    shadowLayer.shadowOpacity = shadowOpacity;//0.8;//阴影透明度，默认0
    shadowLayer.shadowRadius = shadowRadius;//8;//阴影半径，默认3
    
    //路径阴影
    UIBezierPath *path = [UIBezierPath bezierPath];
    
    float width = shadowLayer.bounds.size.width;
    float height = shadowLayer.bounds.size.height;
    float x = shadowLayer.bounds.origin.x;
    float y = shadowLayer.bounds.origin.y;
    
    CGPoint topLeft      = shadowLayer.bounds.origin;
    CGPoint topRight     = CGPointMake(x + width, y);
    CGPoint bottomRight  = CGPointMake(x + width, y + height);
    CGPoint bottomLeft   = CGPointMake(x, y + height);
    
    CGFloat offset = -1.f;
    [path moveToPoint:CGPointMake(topLeft.x - offset, topLeft.y + cornerRadius)];
    [path addArcWithCenter:CGPointMake(topLeft.x + cornerRadius, topLeft.y + cornerRadius) radius:(cornerRadius + offset) startAngle:M_PI endAngle:M_PI_2 * 3 clockwise:YES];
    [path addLineToPoint:CGPointMake(topRight.x - cornerRadius, topRight.y - offset)];
    [path addArcWithCenter:CGPointMake(topRight.x - cornerRadius, topRight.y + cornerRadius) radius:(cornerRadius + offset) startAngle:M_PI_2 * 3 endAngle:M_PI * 2 clockwise:YES];
    [path addLineToPoint:CGPointMake(bottomRight.x + offset, bottomRight.y - cornerRadius)];
    [path addArcWithCenter:CGPointMake(bottomRight.x - cornerRadius, bottomRight.y - cornerRadius) radius:(cornerRadius + offset) startAngle:0 endAngle:M_PI_2 clockwise:YES];
    [path addLineToPoint:CGPointMake(bottomLeft.x + cornerRadius, bottomLeft.y + offset)];
    [path addArcWithCenter:CGPointMake(bottomLeft.x + cornerRadius, bottomLeft.y - cornerRadius) radius:(cornerRadius + offset) startAngle:M_PI_2 endAngle:M_PI clockwise:YES];
    [path addLineToPoint:CGPointMake(topLeft.x - offset, topLeft.y + cornerRadius)];
    
    //设置阴影路径
    shadowLayer.shadowPath = path.CGPath;
    
    //////// cornerRadius /////////
    view.layer.cornerRadius = cornerRadius;
    view.layer.masksToBounds = YES;
    view.layer.shouldRasterize = YES;
    view.layer.rasterizationScale = [UIScreen mainScreen].scale;
    
    [view.superview.layer insertSublayer:shadowLayer below:view.layer];
}

/// 更换rootViewController
+ (void)restoreRootViewController:(UIViewController *)rootViewController{
    typedef void (^Animation)(void);
    
    UIWindow* window = [UIApplication sharedApplication].keyWindow;
    
    rootViewController.modalTransitionStyle = UIModalTransitionStyleCrossDissolve;
    Animation animation = ^{
        BOOL oldState = [UIView areAnimationsEnabled];
        [UIView setAnimationsEnabled:NO];
        window.rootViewController = rootViewController;
        [UIView setAnimationsEnabled:oldState];
    };
    
    [UIView transitionWithView:window
                      duration:0.5f
                       options:UIViewAnimationOptionTransitionCrossDissolve
                    animations:animation
                    completion:nil];
}

@end
