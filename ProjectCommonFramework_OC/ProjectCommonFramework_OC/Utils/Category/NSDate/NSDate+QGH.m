//
//  NSDate+QGH.m
//  ProjectCommonFramework_OC
//
//  Created by 秦国华 on 2018/5/12.
//  Copyright © 2018年 秦国华. All rights reserved.
//

#import "NSDate+QGH.h"

@implementation NSDate (QGH)

+(NSString *)getNowTimeString
{
    NSDateFormatter* formatter = [[NSDateFormatter alloc] init];
    [formatter setDateStyle:NSDateFormatterMediumStyle];
    [formatter setTimeStyle:NSDateFormatterShortStyle];
    [formatter setDateFormat:@"yyyy-MM-dd HH:MM:ss"];
    NSDate *date = [NSDate date];
    
    NSTimeZone *zone = [NSTimeZone systemTimeZone];
    
    NSInteger interval = [zone secondsFromGMTForDate: date];
    
    NSDate *localeDate = [date  dateByAddingTimeInterval: interval];
    NSLog(@"%@", localeDate);
    NSString *nowTime=[formatter stringFromDate:localeDate];
    return nowTime;
}
#pragma mark - 获取当前天数
+(NSString *)getNowDayString{
    NSDateFormatter* formatter = [[NSDateFormatter alloc] init];
    [formatter setDateStyle:NSDateFormatterMediumStyle];
    [formatter setTimeStyle:NSDateFormatterShortStyle];
    
    NSTimeZone* timeZone = [NSTimeZone timeZoneWithName:@"Asia/Shanghai"];
    [formatter setTimeZone:timeZone];
    
    [formatter setDateFormat:@"yyyy-MM-dd"];
    NSDate *date = [NSDate date];
    
    //    NSTimeZone *zone = [NSTimeZone systemTimeZone];
    
    NSInteger interval = [timeZone secondsFromGMTForDate: date];
    
    NSDate *localeDate = [date  dateByAddingTimeInterval: interval];
    NSLog(@"%@", localeDate);
    NSString *nowTime=[formatter stringFromDate:localeDate];
    return nowTime;
}
+(NSString*)toDescriptionStringWithTimestamp:(double)timestamp{
    NSString * des;
    NSDateFormatter* formatter = [[NSDateFormatter alloc] init];
    [formatter setDateStyle:NSDateFormatterMediumStyle];
    [formatter setTimeStyle:NSDateFormatterShortStyle];
    [formatter setDateFormat:@"yyyy-MM-dd HH:MM:ss"];
    NSDate *date = [NSDate dateWithTimeIntervalSince1970:timestamp];
    
    if (!date) {
        return 0;
    }
    
    // 比较
    NSDate *nowDate = [NSDate date];
    // 比较结果 发布时间与当前时间相差的秒数
    NSTimeInterval result = [self compareWithTime:nowDate TimeTow:date];
    //result = abs(result);
    // 凌晨到现在的秒数
    [formatter setDateFormat:@"yyyy-MM-dd 00:00:00"];
    NSDate *today00Date = [formatter dateFromString:[formatter stringFromDate:nowDate]];
    NSTimeInterval today00toNowSenconds = [self compareWithTime:nowDate TimeTow:today00Date];;
    NSDateComponents *comps = [self getDateComponents:date];
    
    //今天
    NSInteger hour = comps.hour;
    NSString *j = @"上午";
    if (hour>12) {
        j = @"下午";
        hour -= 12;
    }
    if (result<=today00toNowSenconds) {
        
        NSString *m = [NSString stringWithFormat:@"%ld",(long)comps.minute];
        if (comps.minute<10) {
            m = [NSString stringWithFormat:@"0%ld",(long)comps.minute];
        }
        des = [NSString stringWithFormat:@"%@ %ld:%@",j,(long)hour,m];
    }
    else{
        des = [NSString stringWithFormat:@"%ld月%ld日 %@ %ld:%ld",(long)comps.month,(long)comps.day,j,(long)hour,(long)comps.minute];
    }
    formatter = nil;
    j = nil;
    return des;
}
+(NSArray*)changeTimesWithStartTime:(NSString*)starttime MiddleTime:(NSString*)middletime EndTime:(NSString*)endtime Vertical:(int)vertical{
    if (![starttime containsString:@":"] || ![middletime containsString:@":"] || ![endtime containsString:@":"]) {
        return @[];
    }
    CGFloat startHour = [[starttime substringToIndex:[starttime rangeOfString:@":"].location] floatValue];
    CGFloat startMinute = [[starttime substringFromIndex:[starttime rangeOfString:@":"].location+1] floatValue];
    CGFloat endHour = [[endtime substringToIndex:[endtime rangeOfString:@":"].location] floatValue];
    CGFloat endMinute = [[endtime substringFromIndex:[endtime rangeOfString:@":"].location+1] floatValue];
    if (endHour<12) {
        endHour = 24 + endHour;
    }
    NSInteger startTimeCount = startHour*60+startMinute;
    NSInteger endTimeCount = endHour*60+endMinute;
    NSInteger subTime = endTimeCount-startTimeCount;
    if (startHour>endHour && startHour>12) {
        subTime=24*60-startTimeCount+endTimeCount;
    }
    CGFloat meanTime=(subTime *1.0 /vertical)/60;
    NSMutableArray *ar = [[NSMutableArray alloc]init];
    for (int i=0; i<=vertical; i++) {
        CGFloat t = (startHour+startMinute/60) + i*meanTime;
        if (t>24) {
            t = t - 24;
        }
        CGFloat m = t - (int)t;
        if (m>0) {
            m = m*60;
        }
        t = (int)t;
        NSString *tstr = [NSString stringWithFormat:@"%.0f",t];
        if (t<10) {
            tstr = [NSString stringWithFormat:@"0%.0f",t];
        }
        NSString *mstr = [NSString stringWithFormat:@"%.0f",m];
        if (m<10) {
            mstr = [NSString stringWithFormat:@"0%.0f",m];
        }
        NSString *ts = [NSString stringWithFormat:@"%@:%@",tstr,mstr];
        [ar addObject:ts];
        ts = nil;
        tstr = nil;
        mstr = nil;
        
    }
    return  ar;
}
+(CGFloat)changeMinutesWithStartTime:(NSString*)starttime  MiddleTime:(NSString*)middletime EndTime:(NSString*)endtime Vertical:(int)vertical Type:(int)type{
    if (![starttime containsString:@":"] || ![middletime containsString:@":"] || ![endtime containsString:@":"]) {
        return 0;
    }
    CGFloat startHour = [[starttime substringToIndex:[starttime rangeOfString:@":"].location] floatValue];
    CGFloat startMinute = [[starttime substringFromIndex:[starttime rangeOfString:@":"].location+1] floatValue];
    CGFloat endHour = [[endtime substringToIndex:[endtime rangeOfString:@":"].location] floatValue];
    CGFloat endMinute = [[endtime substringFromIndex:[endtime rangeOfString:@":"].location+1] floatValue];
    
    CGFloat middleHour = 0;
    CGFloat middleMinute = 0;
    CGFloat middleNextHour = 0;
    CGFloat middleNextMinute = 0;
    NSString *middle;
    NSString *middleNext;
    if ([middletime rangeOfString:@"/"].location != NSNotFound) {
        middle = [middletime substringToIndex:[middletime rangeOfString:@"/"].location];
        middleNext = [middletime substringFromIndex:[middletime rangeOfString:@"/"].location+1];
    }else{
        middle = middletime;
        middleNext = middletime;
    }
    
    middleHour = [[middle substringToIndex:[middle rangeOfString:@":"].location] floatValue];
    middleMinute = [[middle substringFromIndex:[middle rangeOfString:@":"].location+1] floatValue];
    middleNextHour = [[middleNext substringToIndex:[middleNext rangeOfString:@":"].location] floatValue];
    middleNextMinute = [[middleNext substringFromIndex:[middleNext rangeOfString:@":"].location+1] floatValue];
    
    
    if (endHour<middleNextHour) {
        endHour = 24 + endHour;
    }
    if (middleHour<startHour) {
        middleHour = 24 + middleHour;
    }
    CGFloat upHours = ((middleHour+middleMinute/60) - (startHour+startMinute/60));
    CGFloat downHours = ((endHour+endMinute/60) - (middleNextHour+middleNextMinute/60));
    CGFloat upfen = upHours * 60;
    CGFloat downfen = downHours * 60;
    if (type<=0) {
        return upfen;
    }
    return  downfen;
}
+(NSString*)changeTimestampToCount:(double)time{
    int newInt = 0;
    NSString *danwei = @"";
    int result = [[NSDate date] timeIntervalSince1970]-time; // 相差多少秒
    
    if (result<60) {
        return @"刚刚";
    }
    if (result>60) {
        newInt = result/60;
        danwei = @"分钟";
    }
    if (result>60*60) {
        newInt = result/60/60;
        danwei = @"小时";
    }
    if (result>24*60*60) {
        newInt = result/24/60/60;
        danwei = @"天";
    }
    if (time<=0) {
        return @"很久以前";
    }
    
    return [NSString stringWithFormat:@"%d%@前",newInt,danwei];
}
+(NSString*)timeformat_monthDay:(double)time
{
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateStyle:NSDateFormatterMediumStyle];
    [formatter setTimeStyle:NSDateFormatterShortStyle];
    [formatter setDateFormat:@"MM-dd HH:mm"]; // ----------设置你想要的格式,hh与HH的区别:分别表示12小时制,24小时制
    NSTimeZone* timeZone = [NSTimeZone timeZoneWithName:@"Asia/Shanghai"];
    [formatter setTimeZone:timeZone];
    
    NSDate *confromTimesp = [NSDate dateWithTimeIntervalSince1970:time];
    NSLog(@"time  = %@",confromTimesp);
    NSString *confromTimespStr = [formatter stringFromDate:confromTimesp];
    NSLog(@"time =  %@",confromTimespStr);
    
    return confromTimespStr;
}
+(NSString*)timeformat:(double)time{
    NSString *str = @"";
    NSString *timeStr = [[[NSNumber alloc] initWithDouble:time] stringValue];
    if(timeStr.length > 10)
    {
        time = time / 1000;
    }
    timeStr = nil;
    NSDateComponents *com = [self getDateComponents:[NSDate dateWithTimeIntervalSince1970:time]];
    NSString *month = [NSString stringWithFormat:@"%ld",(long)com.month];
    if (com.month<10) {
        month = [NSString stringWithFormat:@"0%ld",(long)com.month];
    }
    NSString *day = [NSString stringWithFormat:@"%ld",(long)com.day];
    if (com.day<10) {
        day = [NSString stringWithFormat:@"0%ld",(long)com.day];
    }
    NSString *hour = [NSString stringWithFormat:@"%ld",(long)com.hour];
    if (com.hour<10) {
        hour = [NSString stringWithFormat:@"0%ld",(long)com.hour];
    }
    NSString *minute = [NSString stringWithFormat:@"%ld",(long)com.minute];
    if (com.minute<10) {
        minute = [NSString stringWithFormat:@"0%ld",(long)com.minute];
    }
    NSString *second = [NSString stringWithFormat:@"%ld",(long)com.second];
    if (com.second<10) {
        second = [NSString stringWithFormat:@"0%ld",(long)com.second];
    }
    str = [NSString stringWithFormat:@"%ld-%@-%@ %@:%@:%@",(long)com.year,month,day,hour,minute,second];
    return str;
}

+(NSString*)timeformat_hourstyle:(double)time{
    
    NSString *str = @"";
    NSDateComponents *com = [self getDateComponents:[NSDate dateWithTimeIntervalSince1970:time]];
    NSString *month = [NSString stringWithFormat:@"%ld",(long)com.month];
    if (com.month<10) {
        month = [NSString stringWithFormat:@"0%ld",(long)com.month];
    }
    NSString *day = [NSString stringWithFormat:@"%ld",(long)com.day];
    if (com.day<10) {
        day = [NSString stringWithFormat:@"0%ld",(long)com.day];
    }
    NSString *hour = [NSString stringWithFormat:@"%ld",(long)com.hour];
    if (com.hour<10) {
        hour = [NSString stringWithFormat:@"0%ld",(long)com.hour];
    }
    NSString *minute = [NSString stringWithFormat:@"%ld",(long)com.minute];
    if (com.minute<10) {
        minute = [NSString stringWithFormat:@"0%ld",(long)com.minute];
    }
    NSString *second = [NSString stringWithFormat:@"%ld",(long)com.second];
    if (com.second<10) {
        second = [NSString stringWithFormat:@"0%ld",(long)com.second];
    }
    str = [NSString stringWithFormat:@"%@:%@ %ld-%@-%@",hour,minute,(long)com.year,month,day];
    return str;
}

+(NSString*)timeFormat_ShortHourStyle:(double)time{
    
    NSString *str = @"";
    NSDateComponents *com = [self getDateComponents:[NSDate dateWithTimeIntervalSince1970:time]];
    NSString *month = [NSString stringWithFormat:@"%ld",(long)com.month];
    if (com.month<10) {
        month = [NSString stringWithFormat:@"0%ld",(long)com.month];
    }
    NSString *day = [NSString stringWithFormat:@"%ld",(long)com.day];
    if (com.day<10) {
        day = [NSString stringWithFormat:@"0%ld",(long)com.day];
    }
    NSString *hour = [NSString stringWithFormat:@"%ld",(long)com.hour];
    if (com.hour<10) {
        hour = [NSString stringWithFormat:@"0%ld",(long)com.hour];
    }
    NSString *minute = [NSString stringWithFormat:@"%ld",(long)com.minute];
    if (com.minute<10) {
        minute = [NSString stringWithFormat:@"0%ld",(long)com.minute];
    }
    NSString *second = [NSString stringWithFormat:@"%ld",(long)com.second];
    if (com.second<10) {
        second = [NSString stringWithFormat:@"0%ld",(long)com.second];
    }
    str = [NSString stringWithFormat:@"%@-%@ %@:%@",month,day,hour,minute];
    return str;
}


+(NSString*)timeformatLong:(double)time{
    NSString *str = @"";
    NSDateComponents *com = [self getDateComponents:[NSDate dateWithTimeIntervalSince1970:time]];
    NSString *month = [NSString stringWithFormat:@"%ld",com.month];
    if (com.month<10) {
        month = [NSString stringWithFormat:@"0%ld",com.month];
    }
    NSString *day = [NSString stringWithFormat:@"%ld",com.day];
    if (com.day<10) {
        day = [NSString stringWithFormat:@"0%ld",com.day];
    }
    NSString *hour = [NSString stringWithFormat:@"%ld",com.hour];
    if (com.hour<10) {
        hour = [NSString stringWithFormat:@"0%ld",com.hour];
    }
    NSString *minute = [NSString stringWithFormat:@"%ld",com.minute];
    if (com.minute<10) {
        minute = [NSString stringWithFormat:@"0%ld",com.minute];
    }
    NSString *second = [NSString stringWithFormat:@"%ld",com.second];
    if (com.second<10) {
        second = [NSString stringWithFormat:@"0%ld",com.second];
    }
    str = [NSString stringWithFormat:@"%ld年%@月%@日 %@:%@:%@",com.year,month,day,hour,minute,second];
    return str;
}
+(NSString*)timeforMin:(double)time{
    NSString *str = @"";
    NSDateComponents *com = [self getDateComponents:[NSDate dateWithTimeIntervalSince1970:time]];
    NSString *month = [NSString stringWithFormat:@"%ld",com.month];
    if (com.month<10) {
        month = [NSString stringWithFormat:@"0%ld",com.month];
    }
    NSString *day = [NSString stringWithFormat:@"%ld",com.day];
    if (com.day<10) {
        day = [NSString stringWithFormat:@"0%ld",com.day];
    }
    NSString *hour = [NSString stringWithFormat:@"%ld",com.hour];
    if (com.hour<10) {
        hour = [NSString stringWithFormat:@"0%ld",com.hour];
    }
    NSString *minute = [NSString stringWithFormat:@"%ld",com.minute];
    if (com.minute<10) {
        minute = [NSString stringWithFormat:@"0%ld",com.minute];
    }
    str = [NSString stringWithFormat:@"%ld.%@.%@ %@:%@",com.year,month,day,hour,minute];
    return str;
}
+(double)timeformat_shortTime:(NSString *)time
{
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    NSTimeZone* timeZone = [NSTimeZone timeZoneWithName:@"Asia/Shanghai"];
    [dateFormatter setTimeZone:timeZone];
    
    NSString *strDate = [dateFormatter stringFromDate:[NSDate date]];
    NSString *year = [strDate substringToIndex:4];
    
    NSString *newTime=[NSString stringWithFormat:@"%@-%@:00",year,time];
    NSDate *date = [dateFormatter dateFromString:newTime];
    
    double timep=[date timeIntervalSince1970];
    return timep;
}
+(double)timeformat_hourTime:(NSString *)time
{
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"yyyy-MM-dd HH:mm"];
    NSTimeZone* timeZone = [NSTimeZone timeZoneWithName:@"Asia/Shanghai"];
    [dateFormatter setTimeZone:timeZone];
    
    NSString *strDate = [dateFormatter stringFromDate:[NSDate date]];
    NSString *day = [strDate substringToIndex:10];
    
    NSArray *timeArr=[time componentsSeparatedByString:@":"];
    if (timeArr.count>1) {
        int h = [timeArr[0] intValue];
        if (h<10) {
            NSString *hstr=[NSString stringWithFormat:@"%.2d",h];
            time=[time stringByReplacingCharactersInRange:NSMakeRange(0, 1) withString:hstr];
        }
    }
    NSString *newTime=[NSString stringWithFormat:@"%@ %@",day,time];
    NSDate *date = [dateFormatter dateFromString:newTime];
    
    double timep=[date timeIntervalSince1970];
    return timep;
}
+(double)nowTimeTemp{
    return [[NSDate date] timeIntervalSince1970];
}
+(NSString*)timeformat_oneDayAgo{
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"yyyy-MM-dd"];
    NSTimeZone* timeZone = [NSTimeZone timeZoneWithName:@"Asia/Shanghai"];
    [dateFormatter setTimeZone:timeZone];
    
    double startTimep=[[NSDate date] timeIntervalSince1970];
    double endTimep=startTimep-(60*60*24);
    NSDate *endDate=[NSDate dateWithTimeIntervalSince1970:endTimep];
    NSString *endTime=[dateFormatter stringFromDate:endDate];
    return endTime;
}
+(NSString*)timeformat_oneWeekAgo{
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"yyyy-MM-dd"];
    NSTimeZone* timeZone = [NSTimeZone timeZoneWithName:@"Asia/Shanghai"];
    [dateFormatter setTimeZone:timeZone];
    
    double startTimep=[[NSDate date] timeIntervalSince1970];
    double endTimep=startTimep-(60*60*24*7);
    NSDate *endDate=[NSDate dateWithTimeIntervalSince1970:endTimep];
    NSString *endTime=[dateFormatter stringFromDate:endDate];
    return endTime;
}
+(NSString*)timeformat_oneMonthAgo{
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"yyyy-MM-dd"];
    NSTimeZone* timeZone = [NSTimeZone timeZoneWithName:@"Asia/Shanghai"];
    [dateFormatter setTimeZone:timeZone];
    
    double startTimep=[[NSDate date] timeIntervalSince1970];
    double endTimep=startTimep-(60*60*24*30);
    NSDate *endDate=[NSDate dateWithTimeIntervalSince1970:endTimep];
    NSString *endTime=[dateFormatter stringFromDate:endDate];
    return endTime;
}
+(double)startTimeSubWithStartTime:(NSString *)start firstP:(double)first {
    CGFloat sub = 0;
    double startT = [self timeformat_hourTime:start];
    if (startT-first>0) {
        startT=startT-60*60*24;
    }
    sub = first-startT;
    if (sub<0) {
        sub=0;
    }else{
        sub = startT<1 ? 0.5 : sub;
    }
    return sub;
}
+(NSDateComponents*)getDateComponents:(NSDate*)date
{
    NSCalendar *calendar = [NSCalendar currentCalendar];
    NSDateComponents *comps;
    // 年月日获得
    comps =[calendar components:(NSCalendarUnitYear |
                                 NSCalendarUnitMonth |
                                 NSCalendarUnitDay |
                                 NSCalendarUnitHour |
                                 NSCalendarUnitMinute |
                                 NSCalendarUnitSecond |
                                 NSCalendarUnitWeekday |
                                 NSCalendarUnitWeekOfMonth |
                                 NSCalendarUnitWeekOfYear)
                       fromDate:date];
    return comps;
}
+(NSTimeInterval)compareWithTime:(NSDate*)timeOne TimeTow:(NSDate*)timeTow{
    NSTimeInterval time = [timeOne timeIntervalSince1970];
    double timestamp = time;
    
    NSTimeInterval time2 = [timeTow timeIntervalSince1970];
    double timestampTow = time2;
    
    double timeInterVal = timestamp - timestampTow;
    return timeInterVal;
}
+(NSString *)dayString:(NSDate*)date{
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"yyyy.MM.dd"];
    NSTimeZone* timeZone = [NSTimeZone timeZoneWithName:@"Asia/Shanghai"];
    [dateFormatter setTimeZone:timeZone];
    NSString *nowTime = [dateFormatter stringFromDate:date];
    return nowTime;
}

@end
