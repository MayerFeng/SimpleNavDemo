//
//  UILabel+Compute.m
//  LiveTest
//
//  Created by 任强宾 on 16/9/14.
//  Copyright © 2016年 NeiQuan. All rights reserved.
//

#import "UILabel+Compute.h"

@implementation UILabel (Compute)

#pragma mark - 计算字符串宽度(单行)
- (CGFloat)getWidth
{
    NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc] init];
    [paragraphStyle setLineBreakMode:NSLineBreakByCharWrapping];
    paragraphStyle.alignment = self.textAlignment;
    NSDictionary *attributes = @{NSFontAttributeName:self.font, NSParagraphStyleAttributeName:paragraphStyle};
    CGRect rect = [self.text boundingRectWithSize:CGSizeMake(MAXFLOAT, MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading attributes:attributes context:nil];
    return rect.size.width;
}

#pragma mark - 计算文字绘制所需宽度
- (CGFloat)getWidthWithText:(NSString *)text
{
    CGSize size = [text sizeWithAttributes:@{NSFontAttributeName:self.font}];
    CGFloat width = ceilf(size.width);
    return width;
}

#pragma mark - 计算字符串的高度(单行/多行)
- (CGFloat)getHeight
{
    NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc] init];
    [paragraphStyle setLineBreakMode:NSLineBreakByCharWrapping];
    paragraphStyle.alignment = self.textAlignment;
    NSDictionary *attributes = @{NSFontAttributeName:self.font, NSParagraphStyleAttributeName:paragraphStyle};
    NSMutableString *muString = [NSMutableString stringWithString:@"哈"];
    if (self.numberOfLines > 1) {
        for (int i = 1; i < self.numberOfLines; i++) {
            [muString appendFormat:@"\n哈"];
        }
    }
    CGSize size = [muString sizeWithAttributes:attributes];
    CGFloat height = ceilf(size.height);
    return height;
}

#pragma mark - 计算文字绘制所需大小
- (CGSize)getSize
{
    NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc] init];
    [paragraphStyle setLineBreakMode:NSLineBreakByCharWrapping];
    paragraphStyle.alignment = self.textAlignment;
    NSDictionary *attributes = @{NSFontAttributeName:self.font, NSParagraphStyleAttributeName:paragraphStyle};
    CGSize size = [self.text boundingRectWithSize:CGSizeMake(self.bounds.size.width, MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading attributes:attributes context:nil].size;
    return CGSizeMake(ceilf(size.width), ceilf(size.height));
}

#pragma mark - 计算文字绘制所需大小
- (CGSize)getSizeWithWidth:(CGFloat)width
{
    NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc] init];
    [paragraphStyle setLineBreakMode:NSLineBreakByCharWrapping];
    paragraphStyle.alignment = self.textAlignment;
    NSDictionary *attributes = @{NSFontAttributeName:self.font, NSParagraphStyleAttributeName:paragraphStyle};
    CGSize size = [self.text boundingRectWithSize:CGSizeMake(width, MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading attributes:attributes context:nil].size;
    return CGSizeMake(ceilf(size.width), ceilf(size.height));
}

#pragma mark - 计算文字绘制所需大小
+ (CGFloat)getHeightWithFont:(UIFont *)font
{
    NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc] init];
    [paragraphStyle setLineBreakMode:NSLineBreakByCharWrapping];
    NSDictionary *attributes = @{NSFontAttributeName:font, NSParagraphStyleAttributeName:paragraphStyle};
    CGRect rect = [@"哈哈" boundingRectWithSize:CGSizeMake(1000, MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading attributes:attributes context:nil];
    return ceilf(rect.size.height);
}

#pragma mark - 计算文字绘制所需宽度
+ (CGFloat)getWidthWithFont:(UIFont *)font text:(NSString *)text
{
    CGSize size = [text sizeWithAttributes:@{NSFontAttributeName:font}];
    CGFloat width = ceilf(size.width);
    return width;
}

#pragma mark - 根据字体,宽度绘制所需高度
+ (CGFloat)getHeightWithFont:(UIFont *)font Width:(CGFloat)width text:(NSString *)text
{
    NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc] init];
    [paragraphStyle setLineBreakMode:NSLineBreakByCharWrapping];
    NSDictionary *attributes = @{NSFontAttributeName:font, NSParagraphStyleAttributeName:paragraphStyle};
    CGRect rect = [text boundingRectWithSize:CGSizeMake(width, MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading attributes:attributes context:nil];
    return ceilf(rect.size.height);
}

@end
