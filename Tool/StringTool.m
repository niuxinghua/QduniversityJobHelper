//
//  StringTool.m
//  MusicLove
//
//  Created by niuxinghua on 15/3/31.
//  Copyright (c) 2015年 Hjojo. All rights reserved.
//

#import "StringTool.h"

@implementation StringTool
+(BOOL)isNullOrEmpty:(NSString *)str{
    return str == NULL || str == Nil || str == nil || [str isEqual:[[NSNull alloc] init]] || [str isEqualToString:@""];
}
@end
