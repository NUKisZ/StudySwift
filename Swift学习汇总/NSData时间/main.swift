//
//  main.swift
//  NSData时间
//
//  Created by NUK on 16/6/24.
//  Copyright © 2016年 NUK. All rights reserved.
//

import Foundation

//NSNumber将整型,浮点型,字符包装成对象
var num = NSNumber.init(integer: 18)
let num1 = num.integerValue
#if false
    //NSDate日期与时间
    
    //获取当前日期或时间的NSDate
let date1 = NSDate.init()
print(date1)
    
    //获取当前时间一天之后的时间
let date2 = NSDate.init(timeIntervalSinceNow: 24*3600)
print(date2)
    
    //获取3天前的时间
let date3 = NSDate.init(timeIntervalSinceNow: -3*24*3600)
print(date3)
    
    //获取从1970年1月1日开始,46年后的日期
let date4 = NSDate.init(timeIntervalSince1970: 3600*24*366*46 )
print(date4)
    
    //获取当前系统的locale
let cn = NSLocale.currentLocale()
    //获取NSDate在点钱locale下对应的字符串
print(date1.descriptionWithLocale(cn))
    //获得两个日期之前较早的日期
let earlier = date1.earlierDate(date2)
    //比较那个晚
let later = date1.laterDate(date2)
    
    //比较连个日期 compare()方法返回一个枚举值
    /**
    case OrderedAscending
    case OrderedSame
    case OrderedDescending
    */
switch date1.compare(date3){
case .OrderedAscending:
    print("date1位于date3之前")
case .OrderedSame:
    print("date1与date3日期相等")
case .OrderedDescending:
    print("date1位于date3之后")
}
    
    //获取两个时间之间的时间差
print("date1与date3之间差:\(date1.timeIntervalSinceDate(date3))")
    //获取指定时间与现在时间的差值
print(date2.timeIntervalSinceNow)
#endif

// 需要被格式化的时间
// 获取从1970年1月1日开始、40年之后的日期
let dt = NSDate(timeIntervalSince1970:
    3600 * 24 * 366 * 40)
// 创建两个NSLocale，分别代表中国、美国
let locales = [NSLocale(localeIdentifier:"zh_CN"),
    NSLocale(localeIdentifier:"en_US")]
var df = [NSDateFormatter](count:8, repeatedValue: NSDateFormatter())
//为上面2个NSLocale创建8个DateFormat对象
for i in 0...1 {
    df[i * 4] = NSDateFormatter()
    // 设置NSDateFormatter的日期、时间风格
    df[i * 4].dateStyle = .ShortStyle
    df[i * 4].timeStyle = .ShortStyle
    // 设置NSDateFormatter的NSLocale
    df[i * 4].locale = locales[i]
    df[i * 4 + 1] = NSDateFormatter()
    
    // 设置NSDateFormatter的日期、时间风格
    df[i * 4 + 1].dateStyle = .MediumStyle
    df[i * 4 + 1].dateStyle = .MediumStyle
    // 设置NSDateFormatter的NSLocale
    df[i * 4 + 1].locale = locales[i]
    df[i * 4 + 2] = NSDateFormatter()
    // 设置NSDateFormatter的日期、时间风格
    df[i * 4 + 2].dateStyle = .LongStyle
    df[i * 4 + 2].timeStyle = .LongStyle
    // 设置NSDateFormatter的NSLocale
    df[i * 4 + 2].locale = locales[i]
    df[i * 4 + 3] = NSDateFormatter()
    // 设置NSDateFormatter的日期、时间风格
    df[i * 4 + 3].dateStyle = .FullStyle
    df[i * 4 + 3].timeStyle = .FullStyle
    // 设置NSDateFormatter的NSLocale
    df[i * 4 + 3].locale = locales[i]
}


for i in 0...1 {
    switch i {
    case 0:
        print("-------中国日期格式--------")
    case 1:
        print("-------美国日期格式--------")
    default:
        break
    }
    print("SHORT格式的日期格式：\(df[i * 4].stringFromDate(dt))")
    print("MEDIUM格式的日期格式：\(df[i * 4 + 1].stringFromDate(dt))")
    print("LONG格式的日期格式：\(df[i * 4 + 2].stringFromDate(dt))")
    print("FULL格式的日期格式：\(df[i * 4 + 3].stringFromDate(dt))")
}
let df2 = NSDateFormatter()
// 设置自定义的格式器模板
df2.dateFormat = "公元yyyy年MM月DD日 HH时mm分"
// 执行格式化
print(df2.stringFromDate(dt))
let dateStr = "2013-03-02"
let df3 = NSDateFormatter()
// 根据日期字符串的格式设置格式模板
df3.dateFormat = "yyyy-MM-dd"
// 将字符串转换为NSDate对象
let date5 = df3.dateFromString(dateStr)
print(date5!)


