//
//  NSString+ABStr.h
//  ProjectCommonFramework_OC
//
//  Created by 秦国华 on 2018/5/12.
//  Copyright © 2018年 秦国华. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
@interface NSString (ABStr)

#pragma mark - 富媒体文本

- (NSAttributedString *)ABStrColor:(UIColor *)color range:(NSRange)range;
- (NSAttributedString *)ABStrFont:(UIFont *)font range:(NSRange)range;
- (NSAttributedString *)ABStrColor:(UIColor *)color font:(UIFont *)font range:(NSRange)range;
- (NSAttributedString *)ABStrColor:(UIColor *)color font:(UIFont *)font;
- (NSAttributedString *)ABStrFont:(UIFont *)font color:(UIColor *)color;
//当placeholder 比 text的字体小的时候，使用该方法
- (NSAttributedString *)ABStrFont:(UIFont *)font placeholderFont:(UIFont *)placeholderFont color:(UIColor *)color;

//删除线
- (NSAttributedString *)ABStrStrikethrough;
- (NSAttributedString *)ABStrStrikethroughWithFont:(UIFont *)font color:(UIColor *)color;

//下划线
- (NSAttributedString *)ABStrUnderlineSpacing:(CGFloat)lineSpacing font:(UIFont *)font color:(UIColor *)color;
- (NSAttributedString *)ABStrUnderlineSpacing:(CGFloat)lineSpacing SubStr:(NSString *)subStr color:(UIColor *)color;

//行间距
- (NSAttributedString *)ABStrSpacing:(CGFloat)lineSpacing font:(UIFont *)font;
- (NSAttributedString *)ABStrCenterSpacing:(CGFloat)lineSpacing font:(UIFont *)font;
- (NSAttributedString *)ABStrSpacing:(CGFloat)lineSpacing font:(UIFont *)font color:(UIColor *)color;

- (NSAttributedString *)ABStrSpacing:(CGFloat)lineSpacing firstLineHeadIndent:(CGFloat)firstLineHeadIndent font:(UIFont *)font;
- (NSAttributedString *)ABStrSpacing:(CGFloat)lineSpacing subStr:(NSString *)subStr color:(UIColor *)color;

//不同颜色、含有链接
-(NSMutableAttributedString *)markStr:(NSString *)markStr
                            markColor:(UIColor *)color
                             fontSize:(NSInteger)size
                               offset:(NSInteger)offset;

//不同颜色、含有链接
-(NSMutableAttributedString *)markStr:(NSString *)markStr markColor:(UIColor *)color fontSize:(NSInteger)size offset:(NSInteger)offset spacing:(CGFloat)lineSpacing;
//计算富文本高度
-(CGFloat)getSpaceLabelHeightwithSpeace:(CGFloat)lineSpeace withFont:(UIFont*)font withWidth:(CGFloat)width;
//图片
- (NSAttributedString *)ABStrWithImg:(NSString *)img imgFrame:(CGRect)frame isEnd:(BOOL)isEnd;
//图片文字颜色
- (NSAttributedString *)ABStrWithTxcor:(UIColor *)cor img:(NSString *)img imgFrame:(CGRect)frame isEnd:(BOOL)isEnd;

@end
