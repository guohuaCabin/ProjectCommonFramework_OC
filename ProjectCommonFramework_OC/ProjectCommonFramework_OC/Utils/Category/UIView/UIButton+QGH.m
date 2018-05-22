//
//  UIButton+QGH.m
//  ProjectCommonFramework_OC
//
//  Created by 秦国华 on 2018/5/12.
//  Copyright © 2018年 秦国华. All rights reserved.
//

#import "UIButton+QGH.h"
#import <objc/runtime.h>
@implementation UIButton (QGH)

/*!
 * 设置按钮正常状态下的图片
 */
- (void)setNormalImageName:(NSString *)imageName {
    [self setImage:[UIImage imageNamed:imageName] forState:UIControlStateNormal];
}

- (void)setNormalImage:(UIImage *)image {
    [self setImage:image forState:UIControlStateNormal];
}

- (void)setNormalImageWithColor:(UIColor *)color {
    UIImage *image = [[UIImage alloc]changeColor:color];
    [self setImage:image forState:UIControlStateNormal];
}

- (void)setNormal:(UIColor *)color hightlighted:(UIColor *)hgColor {
    [self setNormalImageWithColor:color];
    [self setHightlightedImageWithColor:hgColor];
}

- (void)setNormal:(UIColor *)color selected:(UIColor *)selColor {
    [self setNormalImageWithColor:color];
    [self setSelectedImageWithColor:selColor];
}

- (void)setNormal:(UIColor *)color hightlighted:(UIColor *)hgColor selected:(UIColor *)selColor {
    [self setNormal:color hightlighted:hgColor];
    [self setSelectedImageWithColor:selColor];
}

/*!
 * 设置按钮Hightlighted状态下的图片
 */
- (void)setHightlightedImageName:(NSString *)imageName {
    [self setImage:[UIImage imageNamed:imageName] forState:UIControlStateHighlighted];
}

- (void)setHightlightedImage:(UIImage *)image {
    [self setImage:image forState:UIControlStateHighlighted];
}

- (void)setHightlightedImageWithColor:(UIColor *)color {
    UIImage *image = [[UIImage alloc]changeColor:color];
    [self setImage:image forState:UIControlStateHighlighted];
}

/*!
 * 设置按钮Selected状态下的图片
 */
- (void)setSelectedImageName:(NSString *)imageName {
    [self setImage:[UIImage imageNamed:imageName] forState:UIControlStateSelected];
}

- (void)setSelectedImage:(UIImage *)image {
    [self setImage:image forState:UIControlStateSelected];
}

- (void)setSelectedImageWithColor:(UIColor *)color {
    UIImage *image = [[UIImage alloc]changeColor:color];
    [self setImage:image forState:UIControlStateSelected];
}

#pragma mark - 文字&字体
- (void)setTitleFont:(UIFont *)font {
    self.titleLabel.font = font;
}
- (void)setTitleFontSize:(CGFloat)size {
    self.titleLabel.font = [UIFont systemFontOfSize:size];
}
- (void)setNormalTitle:(NSString *)title {
    [self setTitle:title forState:UIControlStateNormal];
}
- (void)setSelectTitle:(NSString *)title {
    [self setTitle:title forState:UIControlStateSelected];
}

- (void)setHightTitle:(NSString *)title {
    [self setTitle:title forState:UIControlStateHighlighted];
}


#pragma mark - 设置背景

/*!
 *  设置UIControlStateNormal 背景
 */
- (void)setNormalBgImageName:(NSString *)name {
    [self setNormalBgImage:[UIImage imageNamed:name]];
}
- (void)setNormalBgImage:(UIImage *)img {
    [self setBackgroundImage:img forState:UIControlStateNormal];
}

/*!
 *  设置UIControlStateHighlighted 背景
 */
- (void)setHightBgImageName:(NSString *)name {
    [self setHightBgImage:[UIImage imageNamed:name]];
}
- (void)setHightBgImage:(UIImage *)img {
    [self setBackgroundImage:img forState:UIControlStateHighlighted];
}


/*!
 *  设置UIControlStateSelected 背景
 */
- (void)setSelectBgImageName:(NSString *)name {
    [self setSelectBgImage:[UIImage imageNamed:name]];
}
- (void)setSelectBgImage:(UIImage *)img {
    [self setBackgroundImage:img forState:UIControlStateSelected];
}

/**
 设置高亮btn图片

 @param name 图片名字
 */
- (void)setHightImageName:(NSString *)name {
    [self setHightImage:[UIImage imageNamed:name]];
}
- (void)setHightImage:(UIImage *)img {
    [self setImage:img forState:UIControlStateHighlighted];
}


#pragma mark - 设置背景颜色

- (void)setBgColor:(UIColor *)color forState:(UIControlState)state {
    CGFloat w = self.w_;
    CGFloat h = self.h_;
    if (w == 0 || h == 0) {
        w = 10;
        h = 10;
    }
    CGSize size = CGSizeMake(w, h);
    [self setBackgroundImage:[UIImage imageWithColor:color size:size] forState:state];
}

- (void)setHighlightedBgColor:(UIColor *)color {
    [self setBgColor:color forState:UIControlStateHighlighted];
}

- (void)setSelectedBgColor:(UIColor *)color {
    [self setBgColor:color forState:UIControlStateSelected];
}

- (void)setNormalBgColor:(UIColor *)color {
    [self setBgColor:color forState:UIControlStateNormal];
}


#pragma mark - 获取tableviewCell的NSIndexPath

- (NSIndexPath *)getTVCellIndexPath {
    UIView *cell = self.superview;
    while (![cell isKindOfClass:[UITableViewCell class]]) {
        cell = cell.superview;
    }
    
    UIView *tableView = self.superview;
    while (![tableView isKindOfClass:[UITableView class]]) {
        tableView = tableView.superview;
    }
    
    NSIndexPath *indexPath = [(UITableView *)tableView indexPathForCell:(UITableViewCell *)cell];
    return indexPath;
}


- (NSIndexPath *)getTVCellIndexPathAtTV:(UITableView *)tableView {
    CGPoint point = [self convertPoint:CGPointZero toView:tableView];
    NSIndexPath *indexPath = [tableView indexPathForRowAtPoint:point];
    
    return indexPath;
}

#pragma mark - 修改点击区域
static char topNameKey;
static char rightNameKey;
static char bottomNameKey;
static char leftNameKey;

- (void)setEnlargeEdge:(CGFloat)edge {
    [self setEnlargeEdgeWithTop:edge right:edge bottom:edge left:edge];
}

- (void)setEnlargeEdgeWithTop:(CGFloat)top right:(CGFloat)right bottom:(CGFloat)bottom left:(CGFloat)left {
    objc_setAssociatedObject(self, &topNameKey, [NSNumber numberWithFloat:top], OBJC_ASSOCIATION_COPY_NONATOMIC);
    objc_setAssociatedObject(self, &rightNameKey, [NSNumber numberWithFloat:right], OBJC_ASSOCIATION_COPY_NONATOMIC);
    objc_setAssociatedObject(self, &bottomNameKey, [NSNumber numberWithFloat:bottom], OBJC_ASSOCIATION_COPY_NONATOMIC);
    objc_setAssociatedObject(self, &leftNameKey, [NSNumber numberWithFloat:left], OBJC_ASSOCIATION_COPY_NONATOMIC);
}

- (CGRect)enlargedRect  {
    NSNumber *topEdge = objc_getAssociatedObject(self, &topNameKey);
    NSNumber *rightEdge = objc_getAssociatedObject(self, &rightNameKey);
    NSNumber *bottomEdge = objc_getAssociatedObject(self, &bottomNameKey);
    NSNumber *leftEdge = objc_getAssociatedObject(self, &leftNameKey);
    if (topEdge && rightEdge && bottomEdge && leftEdge) {
        return CGRectMake(self.bounds.origin.x - leftEdge.floatValue,
                          self.bounds.origin.y - topEdge.floatValue,
                          self.bounds.size.width + leftEdge.floatValue + rightEdge.floatValue,
                          self.bounds.size.height + topEdge.floatValue + bottomEdge.floatValue);
    } else {
        return self.bounds;
    }
}

- (UIView *)hitTest:(CGPoint)point withEvent:(UIEvent *)event {
    CGRect rect = [self enlargedRect];
    if (CGRectEqualToRect(rect, self.bounds)) {
        return [super hitTest:point withEvent:event];
    }
    return CGRectContainsPoint(rect, point) ? self : nil;
}

#pragma mark - 其他
//设置文字和图片位置
-(void)setTitleAndImageWithLeftTitle:(BOOL)isLeft interval:(CGFloat)interval
{
    self.titleLabel.backgroundColor = self.backgroundColor;
    self.imageView.backgroundColor = self.backgroundColor;
    CGSize titleSize = self.titleLabel.bounds.size;
    CGSize imageSize = self.imageView.bounds.size;
    
    CGFloat titleW = titleSize.width + interval;
    CGFloat imageW = imageSize.width + interval;
    if (isLeft) {
        self.imageEdgeInsets = UIEdgeInsetsMake(0,titleW, 0,-titleW);
        self.titleEdgeInsets = UIEdgeInsetsMake(0, -imageW, 0, imageW);
    }else{
        self.imageEdgeInsets = UIEdgeInsetsMake(0,-interval, 0,interval);
        self.titleEdgeInsets = UIEdgeInsetsMake(0, interval, 0, -interval);
    }
}
//设置文字和图片正常位置
-(void)setTitleAndImageWithNormalState
{
    self.imageEdgeInsets = UIEdgeInsetsMake(0,0, 0,0);
    self.titleEdgeInsets = UIEdgeInsetsMake(0, 0, 0, 0);
}

/*! 贴纸底部button  图片在上，文字在下 */
+ (UIButton *)creatBottomButtonWithFarme:(CGRect)frame title:(NSString *)title font:(CGFloat)font imageName:(NSString *)imageName {
    
    UIButton *btn = [[UIButton alloc]initWithFrame:frame];
    [btn setImage:[UIImage imageNamed:imageName] forState:UIControlStateNormal];
    [btn setTitle:title forState:UIControlStateNormal];
    [btn setTitleColor:[UIColor lightGrayColor] forState:UIControlStateNormal];
    [btn setTitleEdgeInsets:UIEdgeInsetsMake(frame.size.height-30, 14-frame.size.width, 0, 0)];
    [btn setImageEdgeInsets:UIEdgeInsetsMake(-10, 6, 10, 0)];
    btn.titleLabel.font = [UIFont systemFontOfSize:font];
    return btn;
}

/*!
 *  @brief 按钮倒计时
 */
- (void)startTime:(NSInteger )timeout title:(NSString *)tittle waitTittle:(NSString *)waitTittle {
    __block NSInteger timeOut=timeout; //倒计时时间
    dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    dispatch_source_t _timer = dispatch_source_create(DISPATCH_SOURCE_TYPE_TIMER, 0, 0,queue);
    dispatch_source_set_timer(_timer,dispatch_walltime(NULL, 0),1.0*NSEC_PER_SEC, 0); //每秒执行
    dispatch_source_set_event_handler(_timer, ^{
        if(timeOut<=0){ //倒计时结束，关闭
            dispatch_source_cancel(_timer);
            dispatch_async(dispatch_get_main_queue(), ^{
                //设置界面的按钮显示 根据自己需求设置
                [self setTitle:tittle forState:UIControlStateNormal];
                self.userInteractionEnabled = YES;
            });
        }else{
            //            int minutes = timeout / 60;
            int seconds = timeOut % 60;
            NSString *strTime = [NSString stringWithFormat:@"%.2d", seconds];
            dispatch_async(dispatch_get_main_queue(), ^{
                //设置界面的按钮显示 根据自己需求设置
                NSLog(@"____%@",strTime);
                [self setTitle:[NSString stringWithFormat:@"%@%@",strTime,waitTittle] forState:UIControlStateNormal];
                self.userInteractionEnabled = NO;
                
            });
            timeOut--;
            
        }
    });
    dispatch_resume(_timer);
    
}

@end
