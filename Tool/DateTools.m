//
//  DateTools.m
//  Wawa
//
//  Created by 孙扬 on 14-9-24.
//  Copyright (c) 2014年 Alik. All rights reserved.
//

#import "DateTools.h"

static long long offset = 62135596800000;

@implementation DateTools

+(NSString *)getDateWithMillisecond:(long long)millisecond
{   NSString *date;
    
    NSDate *d = [[NSDate alloc]initWithTimeIntervalSince1970:millisecond/1000.0 - offset/1000.0];
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init] ;
   // dateFormatter.dateFormat = @"YYYY年MM月dd日";
   dateFormatter.dateFormat = @"yyyy年MM月dd HH:mm:ss";
    return date = [dateFormatter stringFromDate:d];
}
+(NSString *)getSpecificDateWithMillisecond:(long long)millisecond
{   NSString *date;
    
    NSDate *d = [[NSDate alloc]initWithTimeIntervalSince1970:millisecond/1000.0 - offset/1000.0];
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init] ;
    //    dateFormatter.dateFormat = @"yyyy-MM-dd";
    dateFormatter.dateFormat = @"MM月dd日 HH:mm";
    [dateFormatter setLocale:[[NSLocale alloc] initWithLocaleIdentifier:@"zh_CN"]];
    return date = [dateFormatter stringFromDate:d];
}

+(NSString *)getHourAndMinuteWithMillisecond:(long long)millisecond
{   NSString *date;
    
    NSDate *d = [[NSDate alloc]initWithTimeIntervalSince1970:millisecond/1000.0 - offset/1000.0];
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init] ;
    //    dateFormatter.dateFormat = @"yyyy-MM-dd";
    dateFormatter.dateFormat = @"HH:mm";
    [dateFormatter setLocale:[[NSLocale alloc] initWithLocaleIdentifier:@"zh_CN"]];
    return date = [dateFormatter stringFromDate:d];
}

+(long long)getMillisecondWithDate:(NSDate *)date
{
    long long msecond = (long long)[date timeIntervalSince1970] * 1000.0 + offset;
    
    return msecond;
}
@end
