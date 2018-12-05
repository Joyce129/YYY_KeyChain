//
//  UILabel+Extension.m
//  钥匙串
//
//  Created by Jean on 2018/12/5.
//  Copyright © 2018年 YYY. All rights reserved.
//

#import "UILabel+Extension.h"

@implementation UILabel (Extension)

#pragma mark 普通label
-(void)setTextStr:(NSString *)textStr frame:(CGRect)frame fontName:(NSString *)fontName fontSize:(CGFloat)fontSize textColor:(UIColor *)textColor
{
    self.frame = frame;
    self.text = [NSString stringWithFormat:@"%@",textStr];
    self.font = [UIFont fontWithName:fontName size:fontSize];
    self.textColor = textColor;
}

#pragma mark UILabel内容宽、高自适应(多行文本)
-(CGSize)boundingRectWithSize:(CGSize)size
{
    NSDictionary *attribute = @{NSFontAttributeName : self.font};
    CGSize retSize = [self.text boundingRectWithSize:size options:NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading  attributes:attribute context:nil].size;
    return retSize;
}

#pragma mark 显示提示信息
+(void)showAlertInfoWithString:(NSString *)alertInfo
{
    static BOOL isOpen;
    if (!isOpen)
    {
        isOpen = YES;
        UILabel *showLabel = [[UILabel alloc]init];
        showLabel.numberOfLines = 0;
        showLabel.alpha = 0.0f;
        showLabel.backgroundColor = [UIColor blackColor];
        showLabel.textAlignment = NSTextAlignmentCenter;
        showLabel.layer.masksToBounds = YES;
        showLabel.layer.cornerRadius = 3.0f;
        showLabel.text = alertInfo;
        CGFloat width = [showLabel boundingRectWithSize:CGSizeMake(MAXFLOAT, 30)].width + 20;
        CGFloat left = ([UIScreen mainScreen].bounds.size.width - width) * 0.5;
        
        CGFloat top = ([UIScreen mainScreen].bounds.size.height-30) * 0.5;
        [showLabel setTextStr:alertInfo frame:CGRectMake(left, top, width, 30) fontName:@"PingFangSC-Regular" fontSize:13 textColor:[UIColor whiteColor]];
        [[UIApplication sharedApplication].keyWindow addSubview:showLabel];
        [UIView animateWithDuration:0.33 animations:^{
            showLabel.alpha = 0.8f;
        } completion:^(BOOL finished) {
            sleep(1);
            showLabel.alpha = 0.0f;
            [showLabel removeFromSuperview];
            isOpen = NO;
        }];
    }
}

@end
