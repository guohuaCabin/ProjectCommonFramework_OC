//
//  NSDate+QGH.h
//  ProjectCommonFramework_OC
//
//  Created by 秦国华 on 2018/5/12.
//  Copyright © 2018年 秦国华. All rights reserved.
//

#import <Foundation/Foundation.h>
#include <sys/types.h>
#include <sys/sysctl.h>
@interface NSDate (QGH)

#pragma mark - 获取当前时间
+(NSString *)getNowTimeString;
#pragma mark - 获取当前天数
+(NSString *)getNowDayString;
#pragma mark 返回时间段集合
+(NSArray*)changeTimesWithStartTime:(NSString*)starttime MiddleTime:(NSString*)middletime  EndTime:(NSString*)endtime Vertical:(int)vertical;
#pragma mark 返回分钟数
+(CGFloat)changeMinutesWithStartTime:(NSString*)starttime MiddleTime:(NSString*)middletime  EndTime:(NSString*)endtime Vertical:(int)vertical Type:(int)type;

#pragma mark 换算时间
+(NSString*)changeTimestampToCount:(double)time;
+(NSString*)timeformat_monthDay:(double)time;
+(NSString*)timeformat:(double)time;
+(NSString*)timeformat_hourstyle:(double)time;
+(NSString*)timeFormat_ShortHourStyle:(double)time;
+(NSString*)timeformatLong:(double)time;
+(NSString*)timeforMin:(double)time;
+(double)timeformat_shortTime:(NSString *)time;
+(double)timeformat_hourTime:(NSString *)time;
+(double)nowTimeTemp;//获取当前时间戳
//一天前的日期
+(NSString*)timeformat_oneDayAgo;
//一个星期前的日期
+(NSString*)timeformat_oneWeekAgo;
//一个月前的日期
+(NSString*)timeformat_oneMonthAgo;
//输入开始时间和第一个数据对应的时间确定时间差
+(double)startTimeSubWithStartTime:(NSString *)start firstP:(double)first;

+(NSDateComponents*)getDateComponents:(NSDate*)date;
+(NSTimeInterval)compareWithTime:(NSDate*)timeOne TimeTow:(NSDate*)timeTow;
//时间yyyy.mm.dd
+(NSString *)dayString:(NSDate*)date;

@end
