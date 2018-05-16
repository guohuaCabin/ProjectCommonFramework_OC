//
//  NSData+LTEncryption.h
//  LTDevDemo
//
//  Created by litong on 2017/1/7.
//  Copyright © 2017年 litong. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSData (LTEncryption)

- (NSData *)AES128EncryptWithKey:(NSString *)key gIv:(NSString *)Iv;
- (NSData *)AES128DecryptWithKey:(NSString *)key gIv:(NSString *)Iv;

@end
