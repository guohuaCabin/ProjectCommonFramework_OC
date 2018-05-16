//
//  NSString+ABStr.m
//  ProjectCommonFramework_OC
//
//  Created by 秦国华 on 2018/5/12.
//  Copyright © 2018年 秦国华. All rights reserved.
//

#import "NSString+ABStr.h"

@implementation NSString (ABStr)

#pragma mark - 富媒体文本

- (NSAttributedString *)ABStrColor:(UIColor *)color range:(NSRange)range {
    NSMutableAttributedString *ABStr = [[NSMutableAttributedString alloc] initWithString:self];
    [ABStr addAttribute:NSForegroundColorAttributeName value:color range:range];
    return ABStr;
}
- (NSAttributedString *)ABStrFont:(UIFont *)font range:(NSRange)range {
    NSMutableAttributedString *ABStr = [[NSMutableAttributedString alloc] initWithString:self];
    [ABStr setAttributes:@{NSFontAttributeName:font} range:range];
    return ABStr;
}
- (NSAttributedString *)ABStrColor:(UIColor *)color font:(UIFont *)font range:(NSRange)range {
    NSMutableAttributedString *ABStr = [[NSMutableAttributedString alloc]initWithString:self];
    [ABStr setAttributes:@{NSForegroundColorAttributeName:color,
                           NSFontAttributeName:font}
                   range:range];
    return ABStr;
}
- (NSAttributedString *)ABStrColor:(UIColor *)color font:(UIFont *)font {
    return [self ABStrColor:color font:font range:NSMakeRange(0, self.length)];
}
- (NSAttributedString *)ABStrFont:(UIFont *)font color:(UIColor *)color  {
    NSDictionary *dict = @{ NSForegroundColorAttributeName:color,
                            NSFontAttributeName:font };
    NSAttributedString *attrString = [[NSAttributedString alloc] initWithString:self attributes:dict];
    return attrString;
}


- (NSAttributedString *)ABStrFont:(UIFont *)font placeholderFont:(UIFont *)placeholderFont color:(UIColor *)color {
    CGFloat fontLineH = font.lineHeight;
    CGFloat pFontLineH = placeholderFont.lineHeight;
    NSMutableParagraphStyle *paragraph = [[NSMutableParagraphStyle alloc] init];
    paragraph.minimumLineHeight = fontLineH - (fontLineH - pFontLineH) / 2.0;
    NSDictionary *dict = @{
                           NSForegroundColorAttributeName : color ,
                           NSFontAttributeName : placeholderFont ,
                           NSParagraphStyleAttributeName : paragraph};
    NSAttributedString *attrString = [[NSAttributedString alloc] initWithString:self attributes:dict];
    return attrString;
}


//删除线
- (NSAttributedString *)ABStrStrikethrough {
    NSString *str = [NSString stringWithFormat:@"%@",self];
    NSMutableAttributedString *ABStr = [[NSMutableAttributedString alloc]initWithString:str];
    NSRange range = NSMakeRange(0, str.length);
    [ABStr setAttributes:@{
                           NSStrikethroughStyleAttributeName:@(NSUnderlineStyleSingle)
                           }
                   range:range];
    return ABStr;
}
- (NSAttributedString *)ABStrStrikethroughWithFont:(UIFont *)font color:(UIColor *)color {
    NSString *str = [NSString stringWithFormat:@"%@",self];
    NSMutableAttributedString *ABStr = [[NSMutableAttributedString alloc]initWithString:str];
    NSRange range = NSMakeRange(0, str.length);
    [ABStr setAttributes:@{
                           NSStrikethroughStyleAttributeName:@(NSUnderlineStyleSingle),
                           NSFontAttributeName:font,
                           NSForegroundColorAttributeName:color}
                   range:range];
    return ABStr;
}

//下划线
- (NSAttributedString *)ABStrUnderlineSpacing:(CGFloat)lineSpacing font:(UIFont *)font color:(UIColor *)color {
    NSString *str = [NSString stringWithFormat:@"%@",self];
    NSRange range = NSMakeRange(0, str.length);
    NSMutableAttributedString *ABStr = [[NSMutableAttributedString alloc] initWithString:str];
    NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc] init];
    paragraphStyle.lineSpacing = lineSpacing;
    
    NSDictionary *dict = @{
                           NSParagraphStyleAttributeName:paragraphStyle,
                           NSFontAttributeName:font,
                           NSUnderlineStyleAttributeName:@(NSUnderlineStyleSingle),
                           NSForegroundColorAttributeName:color
                           };
    [ABStr setAttributes:dict range:range];
    return ABStr;
}
- (NSAttributedString *)ABStrUnderlineSpacing:(CGFloat)lineSpacing SubStr:(NSString *)subStr color:(UIColor *)color{
    NSString *str = [NSString stringWithFormat:@"%@",self];
    NSRange range = [str rangeOfString:subStr];
    NSMutableAttributedString *ABStr = [[NSMutableAttributedString alloc] initWithString:str];
    NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc] init];
    paragraphStyle.lineSpacing = lineSpacing;
    
    NSDictionary *dict = @{
                           NSParagraphStyleAttributeName:paragraphStyle,
                           NSUnderlineStyleAttributeName:@(NSUnderlineStyleSingle),
                           NSForegroundColorAttributeName:color
                           };
    [ABStr setAttributes:dict range:range];
    return ABStr;
}
//行间距
- (NSAttributedString *)ABStrSpacing:(CGFloat)lineSpacing font:(UIFont *)font {
    NSString *str = [NSString stringWithFormat:@"%@",self];
    NSMutableAttributedString *ABStr = [[NSMutableAttributedString alloc] initWithString:str];
    NSRange range = NSMakeRange(0, str.length);
    NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc] init];
    paragraphStyle.lineSpacing = lineSpacing;
    //    paragraphStyle.alignment = NSTextAlignmentJustified;
    [ABStr addAttribute:NSParagraphStyleAttributeName value:paragraphStyle range:range];
    [ABStr addAttribute:NSFontAttributeName value:font range:range];
    return ABStr;
}
//居中对齐带间距
- (NSAttributedString *)ABStrCenterSpacing:(CGFloat)lineSpacing font:(UIFont *)font {
    
    NSString *str = [NSString stringWithFormat:@"%@",self];
    NSMutableAttributedString *ABStr = [[NSMutableAttributedString alloc] initWithString:str];
    NSRange range = NSMakeRange(0, str.length);
    NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc] init];
    paragraphStyle.alignment=NSTextAlignmentCenter;
    paragraphStyle.lineSpacing = lineSpacing;
    //    paragraphStyle.alignment = NSTextAlignmentJustified;
    [ABStr addAttribute:NSParagraphStyleAttributeName value:paragraphStyle range:range];
    [ABStr addAttribute:NSFontAttributeName value:font range:range];
    
    return ABStr;
}

//行间距
- (NSAttributedString *)ABStrSpacing:(CGFloat)lineSpacing font:(UIFont *)font color:(UIColor *)color {
    
    NSString *str = [NSString stringWithFormat:@"%@",self];
    NSMutableAttributedString *ABStr = [[NSMutableAttributedString alloc] initWithString:str];
    
    NSRange range = NSMakeRange(0, str.length);
    NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc] init];
    paragraphStyle.lineSpacing = lineSpacing;
    [ABStr addAttribute:NSParagraphStyleAttributeName value:paragraphStyle range:range];
    [ABStr addAttribute:NSFontAttributeName value:font range:range];
    [ABStr addAttribute:NSForegroundColorAttributeName value:color range:range];
    
    return ABStr;
}

- (NSAttributedString *)ABStrSpacing:(CGFloat)lineSpacing firstLineHeadIndent:(CGFloat)firstLineHeadIndent font:(UIFont *)font {
    
    NSString *str = [NSString stringWithFormat:@"%@",self];
    NSRange range = NSMakeRange(0, str.length);
    NSMutableAttributedString *ABStr = [[NSMutableAttributedString alloc] initWithString:str];
    NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc] init];
    paragraphStyle.lineSpacing = lineSpacing;
    paragraphStyle.firstLineHeadIndent = firstLineHeadIndent;
    
    NSDictionary *dict = @{
                           NSParagraphStyleAttributeName:paragraphStyle,
                           NSFontAttributeName:font,
                           };
    [ABStr setAttributes:dict range:range];
    
    return ABStr;
}

/**
 *  获取需要的AttributedString
 *
 *  @param lineSpacing 行间距
 *  @param subStr     改变的子字符串
 *  @param color     子字符串的颜色
 *
 *  @return AttributedString
 */
- (NSAttributedString *)ABStrSpacing:(CGFloat)lineSpacing subStr:(NSString *)subStr color:(UIColor *)color{
    NSString *str = [NSString stringWithFormat:@"%@",self];
    NSMutableAttributedString *ABStr = [[NSMutableAttributedString alloc] initWithString:str];
    NSRange range = [self rangeOfString:subStr];
    NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc] init];
    paragraphStyle.lineSpacing = lineSpacing;
    [ABStr addAttribute:NSParagraphStyleAttributeName value:paragraphStyle range:range];
    [ABStr addAttribute:NSForegroundColorAttributeName value:color range:range];
    return ABStr;
}
/**
 *  获取需要的AttributedString
 *
 *  @param markStr 需要改变的字符串
 *  @param color     改变的颜色
 *
 *  @return AttributedString
 */
-(NSMutableAttributedString *)markStr:(NSString *)markStr
                            markColor:(UIColor *)color
                             fontSize:(NSInteger)size
                               offset:(NSInteger)offset
{
    NSString *allStr = [NSString stringWithFormat:@"%@",self];
    NSMutableAttributedString *attrStr = [[NSMutableAttributedString alloc]initWithString:allStr];
    
    //设置需要处理的字符串
    NSRange range=[allStr rangeOfString:markStr];
    
    [attrStr addAttribute:NSFontAttributeName value:[UIFont systemFontOfSize:size] range:range];
    
    [attrStr addAttribute:NSForegroundColorAttributeName value:color range:range];
    //向下偏移
    [attrStr addAttribute:NSBaselineOffsetAttributeName value:@(offset) range:range];
    return attrStr;
}

//设置不同颜色的富文本
-(NSMutableAttributedString *)markStr:(NSString *)markStr markColor:(UIColor *)color fontSize:(NSInteger)size offset:(NSInteger)offset spacing:(CGFloat)lineSpacing
{
    NSString *allStr = [NSString stringWithFormat:@"%@",self];
    NSMutableAttributedString *attrStr = [[NSMutableAttributedString alloc]initWithString:allStr];
    
    NSRange rangeAll = NSMakeRange(0, allStr.length);
    
    NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc] init];
    paragraphStyle.lineSpacing = lineSpacing;
    [attrStr addAttribute:NSParagraphStyleAttributeName value:paragraphStyle range:rangeAll];
    
    //设置需要处理的字符串
    NSRange range=[allStr rangeOfString:markStr];
    
    [attrStr addAttribute:NSFontAttributeName value:[UIFont systemFontOfSize:size] range:range];
    
    [attrStr addAttribute:NSForegroundColorAttributeName value:color range:range];
    //向下偏移
    [attrStr addAttribute:NSBaselineOffsetAttributeName value:@(offset) range:range];
    return attrStr;
}

/**
 *  计算富文本字体高度
 *
 *  @param lineSpeace 行高
 *  @param font       字体
 *  @param width      字体所占宽度
 *
 *  @return 富文本高度
 */
-(CGFloat)getSpaceLabelHeightwithSpeace:(CGFloat)lineSpeace withFont:(UIFont*)font withWidth:(CGFloat)width {
    NSMutableParagraphStyle *paraStyle = [[NSMutableParagraphStyle alloc] init];
    paraStyle.lineBreakMode = NSLineBreakByCharWrapping;
    /** 行高 */
    paraStyle.lineSpacing = lineSpeace;
    // NSKernAttributeName字体间距
    NSDictionary *dic = @{NSFontAttributeName:font,
                          NSParagraphStyleAttributeName:paraStyle
                          };
    CGSize size = [self boundingRectWithSize:CGSizeMake(width,MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin attributes:dic context:nil].size;
    return size.height;
}


- (NSAttributedString *)ABStrWithImg:(NSString *)img imgFrame:(CGRect)frame isEnd:(BOOL)isEnd{
    NSString *str = [NSString stringWithFormat:@"%@",self];
    NSMutableAttributedString *ABStr = [[NSMutableAttributedString alloc]initWithString:str];
    NSTextAttachment *attch = [[NSTextAttachment alloc] init];
    // 表情图片
    attch.image = [UIImage imageNamed:img];
    // 设置图片大小
    attch.bounds = frame;
    // 创建带有图片的富文本
    NSAttributedString *attrString = [NSAttributedString attributedStringWithAttachment:attch];
    NSMutableAttributedString *attr = [[NSMutableAttributedString alloc]init];
    if (isEnd) {
        [attr appendAttributedString:ABStr];
        [attr appendAttributedString:attrString];
    }else{
        [attr appendAttributedString:attrString];
        [attr appendAttributedString:ABStr];
    }
    return attr;
}
- (NSAttributedString *)ABStrWithTxcor:(UIColor *)cor img:(NSString *)img imgFrame:(CGRect)frame isEnd:(BOOL)isEnd{
    NSString *str = [NSString stringWithFormat:@"%@",self];
    NSDictionary *dict = @{ NSForegroundColorAttributeName:cor };
    NSMutableAttributedString *ABStr = [[NSMutableAttributedString alloc]initWithString:str attributes:dict];
    NSTextAttachment *attch = [[NSTextAttachment alloc] init];
    // 表情图片
    attch.image = [UIImage imageNamed:img];
    // 设置图片大小
    attch.bounds = frame;
    // 创建带有图片的富文本
    NSAttributedString *attrString = [NSAttributedString attributedStringWithAttachment:attch];
    NSMutableAttributedString *attr = [[NSMutableAttributedString alloc]init];
    if (isEnd) {
        [attr appendAttributedString:ABStr];
        [attr appendAttributedString:attrString];
    }else{
        [attr appendAttributedString:attrString];
        [attr appendAttributedString:ABStr];
    }
    return attr;
}



@end
