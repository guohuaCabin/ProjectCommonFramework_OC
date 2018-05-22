//
//  UIButton+QGH.h
//  ProjectCommonFramework_OC
//
//  Created by 秦国华 on 2018/5/12.
//  Copyright © 2018年 秦国华. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIButton (QGH)

/*!
 * 设置按钮正常状态下的图片
 */
- (void)setNormalImageName:(NSString *)imageName;
- (void)setNormalImage:(UIImage *)image;
- (void)setNormalImageWithColor:(UIColor *)color;

/*!
 * 设置按钮Hightlighted状态下的图片
 */
- (void)setHightlightedImageName:(NSString *)imageName;
- (void)setHightlightedImage:(UIImage *)image;
- (void)setHightlightedImageWithColor:(UIColor *)color;

/*!
 * 设置按钮Selected状态下的图片
 */
- (void)setSelectedImageName:(NSString *)imageName;
- (void)setSelectedImage:(UIImage *)image;
- (void)setSelectedImageWithColor:(UIColor *)color;

/*!
 * 设置按钮状态下的图片
 */
- (void)setNormal:(UIColor *)color hightlighted:(UIColor *)hgColor;
- (void)setNormal:(UIColor *)color selected:(UIColor *)selColor;
- (void)setNormal:(UIColor *)color hightlighted:(UIColor *)hgColor selected:(UIColor *)selColor;

#pragma mark - 文字&字体

- (void)setTitleFont:(UIFont *)font;
- (void)setTitleFontSize:(CGFloat)size;

#pragma mark - 设置
//正常
- (void)setNormalTitle:(NSString *)title;
- (void)setNormalBgImageName:(NSString *)name;
- (void)setNormalBgImage:(UIImage *)img;
- (void)setNormalBgColor:(UIColor *)color;

//高亮
- (void)setHightTitle:(NSString *)title;
- (void)setHightImageName:(NSString *)name;
- (void)setHightImage:(UIImage *)img;
- (void)setHightBgImageName:(NSString *)name;
- (void)setHightBgImage:(UIImage *)img;
- (void)setHighlightedBgColor:(UIColor *)color;

//选中
- (void)setSelectTitle:(NSString *)title;

- (void)setSelectBgImage:(UIImage *)img;
- (void)setSelectBgImageName:(NSString *)name;
- (void)setSelectedBgColor:(UIColor *)color;

#pragma mark - 设置背景颜色
- (void)setBgColor:(UIColor *)color forState:(UIControlState)state;

#pragma mark - 获取tableviewCell的NSIndexPath
/** 获取btn 当前的NSIndexPath */
- (NSIndexPath *)getTVCellIndexPath;
- (NSIndexPath *)getTVCellIndexPathAtTV:(UITableView *)tableView;


#pragma mark - 修改点击区域
/** 点击区域 上下左右+edge */
- (void)setEnlargeEdge:(CGFloat)edge;
/** 点击区域 上下左右+top、bottom、left、right */
- (void)setEnlargeEdgeWithTop:(CGFloat)top right:(CGFloat)right bottom:(CGFloat)bottom left:(CGFloat)left;


#pragma mark - 设置文字和图片的位置
//设置文字和图片正常位置
-(void)setTitleAndImageWithNormalState;
//设置文字和图片位置
-(void)setTitleAndImageWithLeftTitle:(BOOL)isLeft interval:(CGFloat)interval;
/*! 贴纸底部button  图片在上，文字在下 */
+ (UIButton *)creatBottomButtonWithFarme:(CGRect)frame title:(NSString *)title font:(CGFloat)font imageName:(NSString *)imageName;

/*! @brief 按钮倒计时 */
- (void)startTime:(NSInteger )timeout title:(NSString *)tittle waitTittle:(NSString *)waitTittle;


@end
