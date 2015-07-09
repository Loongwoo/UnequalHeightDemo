//
//  NSString+PinYin.h
//  CountrySelectDemo
//
//  Created by kiwik on 7/8/15.
//  Copyright (c) 2015 Kiwik. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>
#import <CommonCrypto/CommonDigest.h>

@interface NSString (Extensions)

- (NSString *)transformToPinyin;
- (NSString *)URLEncodedString;
- (id)JSONObject;
-(NSString*)md5;
- (NSString *)md5ForUTF16;
- (NSString *)trim;
- (NSString *)trimTheExtraSpaces;
- (BOOL)isEmpty;
- (CGSize)sizeWithFont:(UIFont *)font constrainedToSize:(CGSize)constrainedSize lineBreakMode:(NSLineBreakMode)lineBreakMode;

@end
