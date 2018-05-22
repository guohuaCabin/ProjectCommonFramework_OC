//
//  UIImage+QGH.h
//  ProjectCommonFramework_OC
//
//  Created by 秦国华 on 2018/5/12.
//  Copyright © 2018年 秦国华. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (QGH)

//改变图片颜色
- (UIImage *)changeImgColor:(UIColor *)color;
#pragma mark - 颜色->图片

+ (UIImage *)imageWithColor:(UIColor *)color size:(CGSize)size;

#pragma mark - 拉伸图片
//拉伸两边，保持中间部分不变（用于中间带箭头的图片）
- (UIImage *)imageStretchLeftAndRightWithImageStr:(NSString *)imageStr containerSize:(CGSize)imageViewSize;

+ (UIImage *)imageWithName:(NSString *)name edgeInsets:(UIEdgeInsets)edgeInsets;
+ (UIImage *)imageWithName:(NSString *)name left:(NSInteger)w top:(NSInteger)h;//中间部分拉伸
- (UIImage *)stretchLeft:(NSInteger)w top:(NSInteger)h __TVOS_PROHIBITED;
- (UIImage *)stretchMiddle;
- (UIImage *)stretchMiddle:(UIEdgeInsets)insets;

#pragma mark - 格式转换、保存

- (NSData *)toPNGData;
- (UIImage *)toPNGImage;
- (NSData *)toJPEGData;
- (NSData *)toJPEGData:(CGFloat)compression;
- (UIImage *)toJPEGImage;
- (UIImage *)toJPEGImage:(CGFloat)compression;

- (BOOL)writePNGToFile:(NSString *)path atomically:(BOOL)useAuxiliaryFile;
- (BOOL)writeJPEGToFile:(NSString *)path atomically:(BOOL)useAuxiliaryFile;
- (BOOL)writeJPEGToFile:(NSString *)path compression:(CGFloat)compression atomically:(BOOL)useAuxiliaryFile;

#pragma mark - 修改图片颜色

- (UIImage *)changeColor:(UIColor *)color;

#pragma mark - 裁剪
//按rect 裁剪图片
- (UIImage *)cutWithRect:(CGRect)rect;
//裁剪中间圆形图片
- (UIImage*)cuteCircle;
- (UIImage*)cuteCircle:(CGFloat)wh;
//裁剪中间正方形图片
- (UIImage *)cutedCenterSquare;
//缩放到指定宽高(wh)，裁剪中间正方形图片
- (UIImage *)scaledSquare:(CGFloat)wh;
//等比缩放本图片大小, 不失真
- (UIImage *)scaleToWidth:(CGFloat)iw;
//等比缩放本图片大小
- (UIImage *)scaleToWidth1:(CGFloat)iw;
- (UIImage *)scaleToSize:(CGSize)size;
//图片压缩至 kSize 单位k
- (NSData *)zipToKSize:(CGFloat)kSize;
//图片缩放到size大小
-(UIImage*)originImage:(UIImage *)image scaleToSize:(CGSize)size;
//图片旋转
+ (UIImage *)fixOrientation:(UIImage *)aImage;

#pragma mark - 模糊

//截取某一块图片并模糊
- (UIImage *)blurWithRadius:(CGFloat)radius cutFrame:(CGRect)frame;
//系统滤镜模糊
- (UIImage *)blurSysWithRadius:(CGFloat)blur;
//高斯模糊
- (UIImage *)blurWithRadius:(CGFloat)blurRadius;
//高斯模糊滤镜，可调节模糊程度
- (UIImage*)gaussBlur:(CGFloat)blurLevel;

#pragma mark - 获取图片某一像素的颜色

- (UIColor *)colorAtPixel:(CGPoint)point ImageViewFrame:(CGRect)viewFrame;


#pragma mark 画纯色图片，指定颜色生成图片
/**
 画纯色图片，指定颜色生成图片
 @param color 图片颜色
 @param size 图片大小
 */
+ (UIImage *)imageWithColor:(UIColor *)color andSize:(CGSize)size;

// 画虚线
+ (UIImage*)dottedImageWithStartPoint:(CGPoint)startPoint EndPoint:(CGPoint)endPoint Color:(UIColor *)color Width:(NSInteger)width;

@end
