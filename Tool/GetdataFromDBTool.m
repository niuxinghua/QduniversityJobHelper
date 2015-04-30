//
//  GetdataFromDBTool.m
//  MusicLove
//
//  Created by niuxinghua on 15/3/25.
//  Copyright (c) 2015年 Hjojo. All rights reserved.
//

#import "GetdataFromDBTool.h"
#import "FMDB.h"
@implementation GetdataFromDBTool
+(NSMutableArray*)getArrayByString:(NSString*)str{
    NSMutableArray *array=[NSMutableArray new];
    NSString *dbpath = [[NSBundle mainBundle]
                        pathForResource:@"area"
                        ofType:@"db"];
    FMDatabase *db = [FMDatabase databaseWithPath:dbpath];
    if (![db open]) {
        return nil;
    }
    long long parentcode = 0;
     NSString* sql=[NSString stringWithFormat:@"SELECT * FROM tn_Areas where Name='%@'and Depth=2",str];
    FMResultSet *s1 = [db executeQuery:sql];
    while ([s1 next]) {
        //retrieve values for each record
        NSLog(@"db...%@",s1);
        parentcode=[s1 longLongIntForColumn:@"AreaCode"];
    
    }

    NSString* sql1=[NSString stringWithFormat:@"SELECT * FROM tn_Areas where ParentCode=%@ and Depth=3",[[NSNumber numberWithLongLong:parentcode] stringValue]];
    FMResultSet *s = [db executeQuery:sql1];
    while ([s next]) {
                NSLog(@"db...%@",s);
        NSString* name=[s stringForColumn:@"Name"];
        [array addObject:name];
        
    }
    [db close];
    return array;
}
+(NSMutableArray*)getAllprovinces{
    NSMutableArray* data=[NSMutableArray new];
    NSString *dbpath = [[NSBundle mainBundle]
                        pathForResource:@"area"
                        ofType:@"db"];
    FMDatabase *db = [FMDatabase databaseWithPath:dbpath];
    if (![db open]) {
        return nil;
    }
   NSString* sql=@"SELECT * FROM tn_Areas where ParentCode='A1560000'";
    FMResultSet* set=[db executeQuery:sql];
    while ([set next]) {
        [data addObject:[set stringForColumnIndex:2]];
    }
     [db close];
    return data;
}
+(NSMutableArray*)getAllcitiesByProName:(NSString*)proName{
    
    NSMutableArray* data=[NSMutableArray new];
    NSString *dbpath = [[NSBundle mainBundle]
                        pathForResource:@"area"
                        ofType:@"db"];
    FMDatabase *db = [FMDatabase databaseWithPath:dbpath];
    if (![db open]) {
        return nil;
    }
   NSString* areacode;
    NSString* sql=[NSString stringWithFormat:@"SELECT * FROM tn_Areas where Name='%@'",proName];
    FMResultSet* set=[db executeQuery:sql];
    while ([set next]) {
        areacode=[set stringForColumnIndex:0];
    }
    NSString* sql1=[NSString stringWithFormat:@"SELECT * FROM tn_Areas where ParentCode='%@'",areacode];
    FMResultSet* set1=[db executeQuery:sql1];
    while ([set1 next]) {
        [data addObject:[set1 stringForColumnIndex:2]];
    }
    [db close];
    return data;


}
+(NSMutableArray*)getAlllocalsByCityName:(NSString*)cityName{
    NSMutableArray* data=[NSMutableArray new];
    NSString *dbpath = [[NSBundle mainBundle]
                        pathForResource:@"area"
                        ofType:@"db"];
    FMDatabase *db = [FMDatabase databaseWithPath:dbpath];
    if (![db open]) {
        return nil;
    }
    NSString* areacode;
    NSString* sql=[NSString stringWithFormat:@"SELECT * FROM tn_Areas where Name='%@'",cityName];
    FMResultSet* set=[db executeQuery:sql];
    while ([set next]) {
        areacode=[set stringForColumnIndex:0];
    }
    NSString* sql1=[NSString stringWithFormat:@"SELECT * FROM tn_Areas where ParentCode='%@'",areacode];
    FMResultSet* set1=[db executeQuery:sql1];
    while ([set1 next]) {
        [data addObject:[set1 stringForColumnIndex:2]];
    }
    [db close];
    return data;
 
}


+(long long)getAreaCodeByString:(NSString*)str{
    NSString *dbpath = [[NSBundle mainBundle]
                        pathForResource:@"area"
                        ofType:@"db"];
    FMDatabase *db = [FMDatabase databaseWithPath:dbpath];
    if (![db open]) {
        return 0;
    }
    
    long long areaCode = 0;
    NSString* sql=[NSString stringWithFormat:@"SELECT * FROM tn_Areas where Name='%@'and Depth=3",str];
    FMResultSet *s1 = [db executeQuery:sql];
    while ([s1 next]) {
        //retrieve values for each record
        NSLog(@"db...%@",s1);
        areaCode=[s1 longLongIntForColumn:@"AreaCode"];
        
    }

    [db close];
    return areaCode;
}

@end
