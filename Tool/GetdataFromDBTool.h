//
//  GetdataFromDBTool.h
//  MusicLove
//
//  Created by niuxinghua on 15/3/25.
//  Copyright (c) 2015年 Hjojo. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface GetdataFromDBTool : NSObject
+(NSMutableArray*)getArrayByString:(NSString*)str;
+(long long)getAreaCodeByString:(NSString*)str;
+(NSMutableArray*)getAllprovinces;
+(NSMutableArray*)getAllcitiesByProName:(NSString*)proName;
+(NSMutableArray*)getAlllocalsByCityName:(NSString*)cityName;
@end
