//
//  NSString+LTEncryption.h
//  LTDevDemo
//
//  Created by litong on 2017/1/7.
//  Copyright © 2017年 litong. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "NSData+LTEncryption.h"

@interface NSString (LTEncryption)




#pragma mark - 格式化字符串

/*! @brief  url去空格 urlDecoding1 */
- (NSString *)urlFormat;

/*! 去掉字符串两端的空白字符 */
- (NSString *)trim;

/*! 对字符串URLencode编码 */
- (NSString *)urlEncoding;
/*!
 *  @brief 由于url支持26个英文字母、数字和少数几个特殊字符，
 因此，对于url中包含非标准url的字符时，就需要对其进行编码.iOS中提供了函数stringByAddingPercentEscapesUsingEncoding对中文和一些特殊字符进行编码，
 但他的功能并不完善，对一些较为特殊的字符无效。
 而对这些字符则可以使用CFURLCreateStringByAddingPercentEscapes函数，
 */
- (NSString *)urlEncoding1;

/*! @brief utf8解码 */
- (NSString *)urlDecoding;


/*! 把字符串转正ISO-8859-1 */
- (NSString *)ISOLatin1StringEncoding;




#pragma mark - 加密

/*!  32位MD5加密  */
- (NSString *)md5;
/*!  SHA1加密  */
- (NSString *)sha1;
/*!  AES-128-CBC加密  */
- (NSString *)AES128Encrypt;
/*!  AES-128-CBC解密  */
- (NSString *)AES128Decrypt;



@end
