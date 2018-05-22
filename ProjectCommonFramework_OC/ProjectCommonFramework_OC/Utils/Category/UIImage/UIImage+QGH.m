//
//  UIImage+QGH.m
//  ProjectCommonFramework_OC
//
//  Created by 秦国华 on 2018/5/12.
//  Copyright © 2018年 秦国华. All rights reserved.
//

#import "UIImage+QGH.h"
#import <Accelerate/Accelerate.h>
@implementation UIImage (QGH)

//改变图片颜色
- (UIImage *)changeImgColor:(UIColor *)color {
    UIGraphicsBeginImageContextWithOptions(self.size, NO, self.scale);
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextTranslateCTM(context, 0, self.size.height);
    CGContextScaleCTM(context, 1.0, -1.0);
    CGContextSetBlendMode(context, kCGBlendModeNormal);
    CGRect rect = CGRectMake(0, 0, self.size.width, self.size.height);
    CGContextClipToMask(context, rect, self.CGImage);
    [color setFill];
    CGContextFillRect(context, rect);
    UIImage*newImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return newImage;
}
#pragma mark - 颜色->图片
+ (UIImage *)imageWithColor:(UIColor *)color size:(CGSize)size {
    CGRect rect = CGRectMake(0.0f, 0.0f, size.width, size.height);
    UIGraphicsBeginImageContext(rect.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetFillColorWithColor(context, [color CGColor]);
    CGContextFillRect(context, rect);
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return image;
}

#pragma mark - 拉伸图片
//拉伸两边，保持中间部分不变（用于中间带箭头的图片）
- (UIImage *)imageStretchLeftAndRightWithImageStr:(NSString *)imageStr containerSize:(CGSize)imageViewSize
{
    CGSize imageSize = self.size;
    //imageView的宽高取整，否则会出现横竖两条缝
    CGSize bgSize = CGSizeMake(floorf(imageViewSize.width), floorf(imageViewSize.height));
    
    UIImage *image = [UIImage imageNamed:imageStr];
    
    image = [image stretchableImageWithLeftCapWidth:imageSize.width *0.8 topCapHeight:imageSize.height * 0.5];
    CGFloat tempWidth = (bgSize.width)/2 + (imageSize.width)/2;
    
    UIGraphicsBeginImageContextWithOptions(CGSizeMake(tempWidth, bgSize.height), NO, [UIScreen mainScreen].scale);
    
    [image drawInRect:CGRectMake(0, 0, tempWidth, bgSize.height)];
    
    UIImage *firstStrechImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    UIImage *secondStrechImage = [firstStrechImage stretchableImageWithLeftCapWidth:imageSize.width *0.2 topCapHeight:imageSize.height*0.5];
    
    return secondStrechImage;
}

+ (UIImage *)imageWithName:(NSString *)name edgeInsets:(UIEdgeInsets)edgeInsets
{
    UIImage *image=[UIImage imageNamed:name];
    return [image resizableImageWithCapInsets:edgeInsets];
    
}
+ (UIImage *)imageWithName:(NSString *)name left:(NSInteger)w top:(NSInteger)h{
    UIImage *image=[UIImage imageNamed:name];
    return [image stretchableImageWithLeftCapWidth:w topCapHeight:h];
    
}
- (UIImage *)stretchLeft:(NSInteger)w top:(NSInteger)h __TVOS_PROHIBITED {
    return [self stretchableImageWithLeftCapWidth:w topCapHeight:h];
}

- (UIImage *)stretchMiddle {
    CGFloat cx = self.size.width/2.0;
    CGFloat cy = self.size.height/2.0;
    CGFloat cc = 0.1;
    UIEdgeInsets eins = UIEdgeInsetsMake(cy-cc, cx-cc, cy+cc, cx+cc);
    return [self resizableImageWithCapInsets:eins];
}
- (UIImage *)stretchMiddle:(UIEdgeInsets)insets{
    return [self resizableImageWithCapInsets:insets];
}
#pragma mark - 格式转换、保存
- (NSData *)toPNGData {
    return UIImagePNGRepresentation(self);
}
- (UIImage *)toPNGImage {
    NSData *data = [self toPNGData];
    return [UIImage imageWithData:data];
}


- (NSData *)toJPEGData {
    return UIImageJPEGRepresentation(self, 1.0);
}
- (NSData *)toJPEGData:(CGFloat)compression {
    return UIImageJPEGRepresentation(self, compression);
}
- (UIImage *)toJPEGImage {
    return [self toJPEGImage:1.0];
}
- (UIImage *)toJPEGImage:(CGFloat)compression {
    NSData *data = [self toJPEGData:compression];
    return [UIImage imageWithData:data];
}



- (BOOL)writePNGToFile:(NSString *)path atomically:(BOOL)useAuxiliaryFile {
    return [[self toPNGData] writeToFile:path atomically:YES];
}
- (BOOL)writeJPEGToFile:(NSString *)path atomically:(BOOL)useAuxiliaryFile {
    return [[self toJPEGData] writeToFile:path atomically:YES];
}
- (BOOL)writeJPEGToFile:(NSString *)path compression:(CGFloat)compression atomically:(BOOL)useAuxiliaryFile {
    return [[self toJPEGData:compression] writeToFile:path atomically:YES];
}

//修改图片颜色
- (UIImage *)changeColor:(UIColor *)color {
    UIGraphicsBeginImageContextWithOptions(self.size, NO, self.scale);
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextTranslateCTM(context, 0, self.size.height);
    CGContextScaleCTM(context, 1.0, -1.0);
    CGContextSetBlendMode(context, kCGBlendModeNormal);
    CGRect rect = CGRectMake(0, 0, self.size.width, self.size.height);
    CGContextClipToMask(context, rect, self.CGImage);
    [color setFill];
    CGContextFillRect(context, rect);
    UIImage*newImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return newImage;
}

#pragma mark - 裁剪
//按rect 裁剪图片
- (UIImage *)cutWithRect:(CGRect)rect {
    CGImageRef imageRef = CGImageCreateWithImageInRect([self CGImage], rect);
    UIImage *image = [UIImage imageWithCGImage:imageRef];
    CGImageRelease(imageRef);
    return image;
}

- (UIImage*)cuteCircle {
    CGFloat iw = self.size.width;
    CGFloat ih = self.size.height;
    CGFloat wh = iw > ih ? ih : iw;
    //获取图片尺寸
    UIImage *img = [self scaledSquare:wh];
    CGSize size = img.size;
    //开启位图上下文
    UIGraphicsBeginImageContextWithOptions(size, NO, 0);
    //创建圆形路径
    UIBezierPath *path = [UIBezierPath bezierPathWithOvalInRect:CGRectMake(0, 0, size.width, size.height)];
    //设置为裁剪区域
    [path addClip];
    //绘制图片
    [img drawAtPoint:CGPointZero];
    //获取裁剪后的图片
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    //关闭上下文
    UIGraphicsEndImageContext();
    return image;
}

- (UIImage*)cuteCircle:(CGFloat)wh {
    //获取图片尺寸
    UIImage *img = [self scaledSquare:wh];
    CGSize size = img.size;
    //开启位图上下文
    UIGraphicsBeginImageContextWithOptions(size, NO, 0);
    //创建圆形路径
    UIBezierPath *path = [UIBezierPath bezierPathWithOvalInRect:CGRectMake(0, 0, size.width, size.height)];
    //设置为裁剪区域
    [path addClip];
    //绘制图片
    [img drawAtPoint:CGPointZero];
    //获取裁剪后的图片
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    //关闭上下文
    UIGraphicsEndImageContext();
    return image;
}


//裁剪中间正方形图片
- (UIImage *)cutedCenterSquare {
    CGRect newRect = [self centerRect];
    UIImage *newImg = [self cutWithRect:newRect];
    return newImg;
}

//缩放到指定宽高(wh)，裁剪中间正方形图片
- (UIImage *)scaledSquare:(CGFloat)wh {
    CGFloat iw = self.size.width;
    CGFloat ih = self.size.height;
    CGAffineTransform scaleTransform;
    CGPoint origin;
    if (iw > ih) {
        CGFloat scaleRatio = wh / ih;
        scaleTransform = CGAffineTransformMakeScale(scaleRatio, scaleRatio);
        origin = CGPointMake(-(iw - ih)/2.0, 0);
    } else {
        CGFloat scaleRatio = wh / iw;
        scaleTransform = CGAffineTransformMakeScale(scaleRatio, scaleRatio);
        origin = CGPointMake(0, -(ih - iw)/2.0);
    }
    CGSize size = CGSizeMake(wh, wh);
    
    if ([[UIScreen mainScreen] respondsToSelector:@selector(scale)]) {
        UIGraphicsBeginImageContextWithOptions(size, YES, 0);
    } else {
        UIGraphicsBeginImageContext(size);
    }
    
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextConcatCTM(context, scaleTransform);
    [self drawAtPoint:origin];
    
    UIImage*newImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return newImage;
}

- (CGRect)centerRect {
    CGFloat iw = self.size.width;
    CGFloat ih = self.size.height;
    CGFloat scale = [UIScreen mainScreen].scale;
    CGRect rect;
    if (iw > ih) { //宽图
        rect = CGRectMake((iw - ih)/2, 0, ih*scale, ih*scale);
    } else {//长图
        rect = CGRectMake(0, (ih - iw)/2, iw*scale, iw*scale);
    }
    return rect;
}


//等比缩放本图片大小
- (UIImage *)scaleToWidth1:(CGFloat)iw {
    if (!self) return nil;
    
    CGFloat ih = iw * self.size.height/self.size.width;
    
    UIGraphicsBeginImageContext(CGSizeMake(iw, ih));
    [self drawInRect:CGRectMake(0, 0, iw ,ih)];
    UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return newImage;
}

- (UIImage*)scaleToSize:(CGSize)size {
    // 创建一个bitmap的context
    // 并把它设置成为当前正在使用的context
    //Determine whether the screen is retina
    
    
    if([[UIScreen mainScreen] scale] == 2.0){
        size = CGSizeMake(size.width/2, size.height/2);
        UIGraphicsBeginImageContextWithOptions(size, NO, 2.0);
    }else{
        UIGraphicsBeginImageContext(size);
    }
    // 绘制改变大小的图片
    [self drawInRect:CGRectMake(0, 0, size.width, size.height)];
    UIImage* scaledImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return scaledImage;
}

//等比缩放本图片大小, 返回2x大小图片，不失真
- (UIImage *)scaleToWidth:(CGFloat)w {
    if (!self) return nil;
    
    w/=2.0;
    CGFloat iw = self.size.width;
    CGFloat ih = self.size.height;
    CGFloat scaleRatio = w/iw;
    CGFloat h = scaleRatio * ih;
    
    CGAffineTransform scaleTransform = CGAffineTransformMakeScale(scaleRatio, scaleRatio);
    CGPoint origin = CGPointMake(0, 0);;
    CGSize size = CGSizeMake(w, h);
    
    if ([[UIScreen mainScreen] respondsToSelector:@selector(scale)]) {
        UIGraphicsBeginImageContextWithOptions(size, YES, 0);
    } else {
        UIGraphicsBeginImageContext(size);
    }
    
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextConcatCTM(context, scaleTransform);
    [self drawAtPoint:origin];
    
    UIImage*newImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return newImage;
}


//图片压缩至 kSize 单位k
- (NSData *)zipToKSize:(CGFloat)kSize {
    if (!self) { return nil; }
    
    CGFloat maxFileSize = kSize*1024;
    NSData *imgData = UIImageJPEGRepresentation(self, 1);
    CGFloat imgDataSize = [imgData length];
    if (imgDataSize > maxFileSize) {
        CGFloat compression = imgDataSize = maxFileSize/imgDataSize;
        imgData = UIImageJPEGRepresentation(self, compression);
    }
    return imgData;
}
//图片缩放到size大小
-(UIImage*)originImage:(UIImage *)image scaleToSize:(CGSize)size {
    UIGraphicsBeginImageContext(size);  //size 为CGSize类型，即你所需要的图片尺寸
    [image drawInRect:CGRectMake(0, 0, size.width, size.height)];
    UIImage* scaledImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return scaledImage;   //返回的就是已经改变的图片
}

#pragma mark - 模糊

//截取某一块图片并模糊
- (UIImage *)blurWithRadius:(CGFloat)radius cutFrame:(CGRect)frame {
    UIImage *newImg = [self cutWithRect:frame];
    return [newImg blurWithRadius:radius];
}

//系统滤镜模糊
- (UIImage *)blurSysWithRadius:(CGFloat)blur {
    CIContext *context = [CIContext contextWithOptions:nil];
    CIImage *inputImage= [CIImage imageWithCGImage:self.CGImage];
    
    CIFilter *filter = [CIFilter filterWithName:@"CIGaussianBlur"];
    [filter setValue:inputImage forKey:kCIInputImageKey]; [filter setValue:@(blur) forKey: @"inputRadius"];
    
    CIImage *result=[filter valueForKey:kCIOutputImageKey];
    CGImageRef outImage=[context createCGImage:result fromRect:[result extent]];
    UIImage *blurImage=[UIImage imageWithCGImage:outImage];
    CGImageRelease(outImage);
    return blurImage;
}

//高斯模糊
- (UIImage *)blurWithRadius:(CGFloat)blurRadius {
    CIContext *context = [CIContext contextWithOptions:nil];
    CIImage *sourceImage = [CIImage imageWithCGImage:self.CGImage];
    NSString *clampFilterName = @"CIAffineClamp";
    CIFilter *clamp = [CIFilter filterWithName:clampFilterName];
    [clamp setValue:sourceImage forKey:kCIInputImageKey];
    CIImage *clampResult = [clamp valueForKey:kCIOutputImageKey];
    
    // Apply Gaussian Blur filter
    NSString *gaussianBlurFilterName = @"CIGaussianBlur";
    CIFilter *gaussianBlur = [CIFilter filterWithName:gaussianBlurFilterName];
    [gaussianBlur setValue:clampResult forKey:kCIInputImageKey];
    [gaussianBlur setValue:[NSNumber numberWithFloat:blurRadius] forKey:@"inputRadius"];
    
    CIImage *gaussianBlurResult = [gaussianBlur valueForKey:kCIOutputImageKey];
    CGImageRef cgImage = [context createCGImage:gaussianBlurResult
                                       fromRect:[sourceImage extent]];
    UIImage *blurredImage = [UIImage imageWithCGImage:cgImage];
    CGImageRelease(cgImage);
    return blurredImage;
}

//高斯模糊滤镜，可调节模糊程度
- (UIImage*)gaussBlur:(CGFloat)blurLevel {
    blurLevel = MIN(1.0, MAX(0.0, blurLevel));
    
    int boxSize = (int)(blurLevel * 0.1 * MIN(self.size.width, self.size.height));
    boxSize = boxSize - (boxSize % 2) + 1;
    
    NSData *imageData = UIImageJPEGRepresentation(self, 1);
    UIImage *tmpImage = [UIImage imageWithData:imageData];
    
    CGImageRef img = tmpImage.CGImage;
    vImage_Buffer inBuffer, outBuffer;
    vImage_Error error;
    void *pixelBuffer;
    
    //create vImage_Buffer with data from CGImageRef
    CGDataProviderRef inProvider = CGImageGetDataProvider(img);
    CFDataRef inBitmapData = CGDataProviderCopyData(inProvider);
    
    inBuffer.width = CGImageGetWidth(img);
    inBuffer.height = CGImageGetHeight(img);
    inBuffer.rowBytes = CGImageGetBytesPerRow(img);
    
    inBuffer.data = (void*)CFDataGetBytePtr(inBitmapData);
    
    //create vImage_Buffer for output
    pixelBuffer = malloc(CGImageGetBytesPerRow(img) * CGImageGetHeight(img));
    
    outBuffer.data = pixelBuffer;
    outBuffer.width = CGImageGetWidth(img);
    outBuffer.height = CGImageGetHeight(img);
    outBuffer.rowBytes = CGImageGetBytesPerRow(img);
    
    NSInteger windowR = boxSize/2;
    CGFloat sig2 = windowR / 3.0;
    if(windowR>0){ sig2 = -1/(2*sig2*sig2); }
    
    int16_t *kernel = (int16_t*)malloc(boxSize*sizeof(int16_t));
    int32_t  sum = 0;
    for(NSInteger i=0; i<boxSize; ++i){
        kernel[i] = 255*exp(sig2*(i-windowR)*(i-windowR));
        sum += kernel[i];
    }
    
    // convolution
    error = vImageConvolve_ARGB8888(&inBuffer, &outBuffer, NULL, 0, 0, kernel, boxSize, 1, sum, NULL, kvImageEdgeExtend);
    error = vImageConvolve_ARGB8888(&outBuffer, &inBuffer, NULL, 0, 0, kernel, 1, boxSize, sum, NULL, kvImageEdgeExtend);
    outBuffer = inBuffer;
    
    if (error) {
        NSLog(@"error from convolution %ld", error);
    }
    
    CGColorSpaceRef colorSpace = CGColorSpaceCreateDeviceRGB();
    CGContextRef ctx = CGBitmapContextCreate(outBuffer.data,
                                             outBuffer.width,
                                             outBuffer.height,
                                             8,
                                             outBuffer.rowBytes,
                                             colorSpace,
                                             kCGBitmapAlphaInfoMask & kCGImageAlphaNoneSkipLast);
    CGImageRef imageRef = CGBitmapContextCreateImage(ctx);
    UIImage *returnImage = [UIImage imageWithCGImage:imageRef];
    
    //clean up
    CGContextRelease(ctx);
    CGColorSpaceRelease(colorSpace);
    free(pixelBuffer);
    CFRelease(inBitmapData);
    CGImageRelease(imageRef);
    
    return returnImage;
}

//获取图片某一像素的颜色
- (UIColor *)colorAtPixel:(CGPoint)point ImageViewFrame:(CGRect)viewFrame {
    // Cancel if point is outside image coordinates
    if (!CGRectContainsPoint(CGRectMake(0.0f, 0.0f, viewFrame.size.width, viewFrame.size.height), point)) {
        return nil;
    }
    
    NSInteger pointX = trunc(point.x);
    NSInteger pointY = trunc(point.y);
    CGImageRef cgImage = self.CGImage;
    NSUInteger width = viewFrame.size.width;
    NSUInteger height = viewFrame.size.height;
    CGColorSpaceRef colorSpace = CGColorSpaceCreateDeviceRGB();
    int bytesPerPixel = 4;
    int bytesPerRow = bytesPerPixel * 1;
    NSUInteger bitsPerComponent = 8;
    unsigned char pixelData[4] = { 0, 0, 0, 0 };
    CGContextRef context = CGBitmapContextCreate(pixelData,
                                                 1,
                                                 1,
                                                 bitsPerComponent,
                                                 bytesPerRow,
                                                 colorSpace,
                                                 kCGImageAlphaPremultipliedLast | kCGBitmapByteOrder32Big);
    CGColorSpaceRelease(colorSpace);
    CGContextSetBlendMode(context, kCGBlendModeCopy);
    
    // Draw the pixel we are interested in onto the bitmap context
    CGContextTranslateCTM(context, -pointX, pointY-(CGFloat)height);
    CGContextDrawImage(context, CGRectMake(0.0f, 0.0f, (CGFloat)width, (CGFloat)height), cgImage);
    CGContextRelease(context);
    
    // Convert color values [0..255] to floats [0.0..1.0]
    CGFloat red   = (CGFloat)pixelData[0] / 255.0f;
    CGFloat green = (CGFloat)pixelData[1] / 255.0f;
    CGFloat blue  = (CGFloat)pixelData[2] / 255.0f;
    CGFloat alpha = (CGFloat)pixelData[3] / 255.0f;
    return [UIColor colorWithRed:red green:green blue:blue alpha:alpha];
}
//针对UIImage旋转
+ (UIImage *)fixOrientation:(UIImage *)aImage {
    
    // No-op if the orientation is already correct
    if (aImage.imageOrientation ==UIImageOrientationUp)
        return aImage;
    
    // We need to calculate the proper transformation to make the image upright.
    // We do it in 2 steps: Rotate if Left/Right/Down, and then flip if Mirrored.
    CGAffineTransform transform =CGAffineTransformIdentity;
    
    switch (aImage.imageOrientation) {
        case UIImageOrientationDown:
        case UIImageOrientationDownMirrored:
            transform = CGAffineTransformTranslate(transform, aImage.size.width, aImage.size.height);
            transform = CGAffineTransformRotate(transform, M_PI);
            break;
            
        case UIImageOrientationLeft:
        case UIImageOrientationLeftMirrored:
            transform = CGAffineTransformTranslate(transform, aImage.size.width,0);
            transform = CGAffineTransformRotate(transform, M_PI_2);
            break;
            
        case UIImageOrientationRight:
        case UIImageOrientationRightMirrored:
            transform = CGAffineTransformTranslate(transform, 0, aImage.size.height);
            transform = CGAffineTransformRotate(transform, -M_PI_2);
            break;
        default:
            break;
    }
    
    switch (aImage.imageOrientation) {
        case UIImageOrientationUpMirrored:
        case UIImageOrientationDownMirrored:
            transform = CGAffineTransformTranslate(transform, aImage.size.width,0);
            transform = CGAffineTransformScale(transform, -1, 1);
            break;
            
        case UIImageOrientationLeftMirrored:
        case UIImageOrientationRightMirrored:
            transform = CGAffineTransformTranslate(transform, aImage.size.height,0);
            transform = CGAffineTransformScale(transform, -1, 1);
            break;
        default:
            break;
    }
    
    // Now we draw the underlying CGImage into a new context, applying the transform
    // calculated above.
    CGContextRef ctx =CGBitmapContextCreate(NULL, aImage.size.width, aImage.size.height,
                                            CGImageGetBitsPerComponent(aImage.CGImage),0,
                                            CGImageGetColorSpace(aImage.CGImage),
                                            CGImageGetBitmapInfo(aImage.CGImage));
    CGContextConcatCTM(ctx, transform);
    switch (aImage.imageOrientation) {
        case UIImageOrientationLeft:
        case UIImageOrientationLeftMirrored:
        case UIImageOrientationRight:
        case UIImageOrientationRightMirrored:
            // Grr...
            CGContextDrawImage(ctx,CGRectMake(0,0,aImage.size.height,aImage.size.width), aImage.CGImage);
            break;
            
        default:
            CGContextDrawImage(ctx,CGRectMake(0,0,aImage.size.width,aImage.size.height), aImage.CGImage);
            break;
    }
    
    // And now we just create a new UIImage from the drawing context
    CGImageRef cgimg =CGBitmapContextCreateImage(ctx);
    UIImage *img = [UIImage imageWithCGImage:cgimg];
    CGContextRelease(ctx);
    CGImageRelease(cgimg);
    return img;
}

// 画纯色图片，指定颜色生成图片
+ (UIImage *)imageWithColor:(UIColor *)color andSize:(CGSize)size
{
    CGRect rect = CGRectMake(0.0f, 0.0f, size.width, size.height);
    UIGraphicsBeginImageContext(rect.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetFillColorWithColor(context, [color CGColor]);
    CGContextFillRect(context, rect);
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return image;
}

// 画虚线
+ (UIImage*)dottedImageWithStartPoint:(CGPoint)startPoint EndPoint:(CGPoint)endPoint Color:(UIColor *)color Width:(NSInteger)width
{
    //NSLog(@"draw start.....");
    CGRect rect = CGRectMake(0, startPoint.y, width, 1);
    UIGraphicsBeginImageContext(rect.size);
    //UIGraphicsBeginImageContextWithOptions(rect.size, YES, [[UIScreen mainScreen] scale]);
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    CGContextSetLineWidth(context, width);
    // 如果是虚线
    CGFloat lengths[] = {3,3};
    CGContextSetLineDash(context, 0, lengths, 2);  //画虚线
    CGContextSetStrokeColorWithColor(context, color.CGColor);
    const CGPoint point[] = {startPoint,endPoint};
    CGContextStrokeLineSegments(context, point, 2);  // 绘制
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return image;
    
}



@end
