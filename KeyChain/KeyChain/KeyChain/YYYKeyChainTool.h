//
//  YYYKeyChainTool.h
//  钥匙串
//
//  Created by YYY on 2018/1/4.
//  Copyright © 2018年 YYY. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface YYYKeyChainTool : NSObject

/**
 *  储存字符串到钥匙串
 *  @param sValue 对应的Value
 *  @param sKey   对应的Key
 */
+ (void)saveKeychainValue:(NSString *)sValue key:(NSString *)sKey;

/**
 *  从钥匙串获取字符串
 *  @param sKey 对应的Key
 *  @return 返回储存的Value
 */
+ (NSString *)readKeychainValue:(NSString *)sKey;

/**
 *  从钥匙串删除字符串
 *  @param sKey 对应的Key
 */
+ (void)deleteKeychainValue:(NSString *)sKey;

@end
