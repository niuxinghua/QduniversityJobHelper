//
//  DateTools.h
//  Wawa
//
//  Created by 孙扬 on 14-9-24.
//  Copyright (c) 2014年 Alik. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DateTools : NSObject

+(NSString *)getDateWithMillisecond:(long long)millisecond;

+(NSString *)getSpecificDateWithMillisecond:(long long)millisecond;

+(NSString *)getHourAndMinuteWithMillisecond:(long long)millisecond;

+(long long)getMillisecondWithDate:(NSDate *)date;

@end
