//
//  UILabel+QGH.m
//  ProjectCommonFramework_OC
//
//  Created by 秦国华 on 2018/5/19.
//  Copyright © 2018年 秦国华. All rights reserved.
//

#import "UILabel+QGH.h"

@implementation UILabel (QGH)
// 创建一个UILabel
+ (UILabel *)commonLabelWithFrame:(CGRect)frame
                             text:(NSString*)text
                            color:(UIColor*)color
                             font:(UIFont*)font
                    textAlignment:(NSTextAlignment)textAlignment
{
    UILabel *label = [[UILabel alloc] initWithFrame:frame];
    label.text = text;
    label.textColor = color;
    label.font = font;
    label.textAlignment = textAlignment;
    
    label.backgroundColor = [UIColor clearColor];
    
    return label;
}

//动态设置Label的高度
+ (UILabel *)dynamicHeightLabelWithPointX:(CGFloat)pointX
                                   pointY:(CGFloat)pointY
                                    width:(CGFloat)width
                               strContent:(NSString *)strContent
                                    color:(UIColor *)color
                                     font:(UIFont *)font
                            textAlignmeng:(NSTextAlignment)textAlignmeng
{
    NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc]init];
    paragraphStyle.lineBreakMode = NSLineBreakByWordWrapping;
    
    NSDictionary *attributes = @{NSFontAttributeName:font,
                                 NSParagraphStyleAttributeName:paragraphStyle.copy};
    
    CGSize labelSize = [strContent boundingRectWithSize:CGSizeMake(width,MAXFLOAT)
                                                options:NSStringDrawingUsesLineFragmentOrigin
                                             attributes:attributes
                                                context:nil].size;
    
    UILabel *myLabel = [[UILabel alloc] initWithFrame:CGRectMake(pointX, pointY, width, labelSize.height)];
    myLabel.numberOfLines = 0;
    myLabel.text = strContent;
    myLabel.font = font;
    myLabel.textColor = color;
    return myLabel;
    
}


@end
