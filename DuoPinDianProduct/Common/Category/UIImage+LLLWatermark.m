//
//  UIImage+LLLWatermark.m
//  LLLDemos
//
//  Created by 李龙林(EX-LILONGLIN001) on 2018/8/28.
//  Copyright © 2018年 lilonglin. All rights reserved.
//

#import "UIImage+LLLWatermark.h"

@implementation UIImage (LLLWatermark)

- (UIImage *)imageWater:(UIImage *)imageLogo waterString:(NSString *)waterString {
    
    UIGraphicsBeginImageContext(self.size);
//    UIGraphicsBeginImageContextWithOptions(self.size, NO, 0);
    
    // 原始图片渲染
    [self drawInRect:CGRectMake(0, 0, self.size.width, self.size.height)];
    
    CGFloat waterX = self.size.width - 200;
    CGFloat waterY = self.size.height - 200;
    CGFloat waterW = 200;
    CGFloat waterH = 200;
    
    // logo 渲染
    [imageLogo drawInRect:CGRectMake(waterX, waterY, waterW, waterH)];
    
    // 渲染文字
    NSMutableParagraphStyle * paragraphStyle = [[NSMutableParagraphStyle defaultParagraphStyle] mutableCopy];
    
    paragraphStyle.lineBreakMode = NSLineBreakByCharWrapping;
    
    NSDictionary * dic = @{
                           NSFontAttributeName : [UIFont systemFontOfSize:40],
                           NSParagraphStyleAttributeName : paragraphStyle,
                           NSForegroundColorAttributeName : [UIColor redColor]
                           };
    
    [waterString drawInRect:CGRectMake(50, 50, 200, 50) withAttributes:dic];
    
    // UIImage
    UIImage * imageNew = UIGraphicsGetImageFromCurrentImageContext();
    
    UIGraphicsEndImageContext();
    
    return imageNew;
}

@end
