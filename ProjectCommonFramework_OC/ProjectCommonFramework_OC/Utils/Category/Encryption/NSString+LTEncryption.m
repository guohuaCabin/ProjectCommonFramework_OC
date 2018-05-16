//
//  NSString+LTEncryption.m
//  LTDevDemo
//
//  Created by litong on 2017/1/7.
//  Copyright © 2017年 litong. All rights reserved.
//

#import "NSString+LTEncryption.h"
#import <CommonCrypto/CommonDigest.h>
#import "GTMBase64.h"

@implementation NSString (LTEncryption)

#pragma mark - 格式化字符串

/**
 *  @brief  url去空格 urlEncoding1
 *
 *  @return NSString
 */
- (NSString *)urlFormat {
    if (self) {
        return [[self trim] urlEncoding];
    }
    return @"";
}

/**
 * 去掉字符串两端的空白字符
 *
 * @return NSString
 **/
- (NSString *)trim {
    if(!self){
        return nil;
    }
    
    NSMutableString *re = [NSMutableString stringWithString:self];
    CFStringTrimWhitespace((CFMutableStringRef)re);
    return (NSString *)re;
}



/**
 * 对字符串URLencode编码
 *
 * @return NSString
 **/
- (NSString *)urlEncoding {
    if (!self) {
        return nil;
    }
    NSString *result = (NSString *)
    CFBridgingRelease(CFURLCreateStringByAddingPercentEscapes(kCFAllocatorDefault,
                                                              (CFStringRef)self,
                                                              (CFStringRef)@"!$&'()*+,-./:;=?@_~%#[]",
                                                              NULL,
                                                              kCFStringEncodingUTF8));
    return result;
}
- (NSString *)urlEncoding1 {
    return [self stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
}

- (NSString *)urlDecoding {
    return [self stringByReplacingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
}


/* 把字符串转正ISO-8859-1 */
- (NSString *)ISOLatin1StringEncoding{
    const char* destDir = [self UTF8String];
    NSString *posStr = [NSString stringWithCString:destDir encoding:NSISOLatin1StringEncoding];
    return posStr;
}


#pragma mark - 加密

- (NSString *)md5 {
    
    const char *cStr = [self UTF8String];
    unsigned char digest[CC_MD5_DIGEST_LENGTH];
    
    CC_MD5(cStr, (CC_LONG)strlen(cStr), digest);
    
    NSMutableString *result = [NSMutableString stringWithCapacity:CC_MD5_DIGEST_LENGTH * 2];
    
    for(int i = 0; i < CC_MD5_DIGEST_LENGTH; i++) {
        [result appendFormat:@"%02x", digest[i]];
    }
    
    return [result copy];
}

- (NSString *)sha1 {
    
    const char *cStr = [self UTF8String];
    NSData *data = [NSData dataWithBytes:cStr length:self.length];
    uint8_t digest[CC_SHA1_DIGEST_LENGTH];
    
    CC_SHA1(data.bytes, (CC_LONG)data.length, digest);
    
    NSMutableString *result = [NSMutableString stringWithCapacity:CC_SHA1_DIGEST_LENGTH * 2];
    
    for(int i = 0; i < CC_SHA1_DIGEST_LENGTH; i++) {
        [result appendFormat:@"%02x", digest[i]];
    }
    
    return [result copy];
}



#define kAESKey			@"6Oh^.qj8x*u)loR9" //自行修改
#define kAESIv            @"SlrC^*eVMwCVyF]U" //自行修改

- (NSString *)AES128Encrypt {
    //将nsstring转化为nsdata
    NSData *data = [self dataUsingEncoding:NSUTF8StringEncoding];
    //使用密码对nsdata进行加密
    NSData *encryptedData = [data AES128EncryptWithKey:kAESKey gIv:kAESIv];
    //返回进行base64进行转码的加密字符串
    NSData *aData = [GTMBase64 encodeData:encryptedData];
    NSString *base64String = [[NSString alloc] initWithData:aData encoding:NSUTF8StringEncoding];
    return base64String;
}

- (NSString *)AES128Decrypt {
    //base64解密
    NSData *decodeBase64Data=[GTMBase64 decodeString:self];
    //使用密码对data进行解密
    NSData *decryData = [decodeBase64Data AES128DecryptWithKey:kAESKey gIv:kAESIv];
    //将解了密码的nsdata转化为nsstring
    NSString *str = [[NSString alloc] initWithData:decryData encoding:NSUTF8StringEncoding];
    return str;
}


@end
