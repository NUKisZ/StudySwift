//
//  main.swift
//  Foundation框架下的NSString-NSArray
//
//  Created by NUK on 16/6/24.
//  Copyright © 2016年 NUK. All rights reserved.
//

import Foundation

//NSString
/**
NSString和String
String是一个结构体,值类型,我们操作的是String的副本
NSString是一个类,我们屏操作的都是NSString对象的引用

运算符 as 向下转换运算符
*/
//声明一个NSString的字符串
let str1:NSString = "NSString字符串"
print(str1)
//通过隐式的方式来创建一个空的字符串
let str2 = NSString.init()
print(str2)
//格式化创建字符串
/*格式控制符
%@ 字符串 %d 整型 %c 字符 %f 浮点
%C 汉字
*/
let str3 = NSString.init(format:"%@%d%f" ,"1",2,3.4)
print(str3)
//通过另一个字符串初始化字符串
let str4 = NSString.init(string: str1)
print(str4)
//OC中的打印
//NSLog("%@", str4)
//将NSString转成String
let str4_1 = str4 as String

//将c语言字符串转换NSString,不过此方法不会被使用了
//NSUTF8StringEncoding 字符编码 都要使用当前这个字符编码 汉字集
let str5 = NSString.init(CString: "ABC", encoding: NSUTF8StringEncoding)

//判断连个NSString字符串是否相等可想向Siwft中String那么使用 ==
var str6:NSString = "aa"
var str7 = "ab"
//判断NSString和String的字符串是否相等
//次方法只能通过NSString的字符串调用
if str6.isEqualToString(str7){//Bool
    print("两个字符串相等")
}else{
    print("两个字符串不相等")
}
//字符串的长度
print(str6.length)


//NSString字符串的下标也是从0开始计数
let str8:NSString = "xcode哈"
//取出单个字符 取出的是值不是字符
let ch = str8.characterAtIndex(4)
NSLog("%c", ch)


//拼接两个字符串
let str9:NSString = "上海"
let str9_1:NSString = "千锋"
let str9_2 = str9.stringByAppendingFormat("%@%c", str9_1,ch)
print(str9_2)

//比较
let result = str9.compare("北京")
/**
NSComparisonResult
case OrderedAscending 升序 小到大
case OrderedSame      相等
case OrderedDescending  降序 大到小
*/
switch result{
case NSComparisonResult.OrderedAscending:
    print("上海 > 北京")
case NSComparisonResult.OrderedSame:
    print("上海 == 北京")
case NSComparisonResult.OrderedDescending:
    print("上海 < 北京")
}

//字符串中查找
let str10:NSString = "你好上海123"
//查找123在当前字符串的位置和长度
let range = str10.rangeOfString("123")
//返回出两个值
//location 位置  length 长度
print(range.location,range.length)
//通过当前获取的位置或是长度来判断当前字符串是否存在在当前字符串
if range.location != NSNotFound{
    print("123在\(str10)中的位置是\(range.location)")
}else{
    print("123不存在")
}

if range.length != 0{
    print("123在\(str10)中的长度是\(range.length)")
}else{
    print("123不存在")
}

//截取
let str11:NSString = "上海欢迎您,iOS入门还是比较容易的ios"
//截取当前字符串
//从原串定0个位置开始截取到传入的[值-1]的位置
let str11_1 = str11.substringToIndex(2)
print(str11_1)

//截取字符串指定位置到字符串的结尾
let str11_2 = str11.substringFromIndex(6)
print(str11_2)

//截取指定范围 第一个是位置, 第二个是长度
let range1 = NSRange.init(location: 2, length: 4)
print(str11.substringWithRange(range1))

//字符串的转换
let str12:NSString = "abc"
print(str12.uppercaseString)//大写
print(str12.lowercaseString)//小写
//将字符串转换过成基本数据类型
let str12_1:NSString = "1"
let one = str12_1.integerValue//Int类型1
/**
doubleValue: Double
floatValue: Float
intValue: Int32
integerValue: Int
longLongValue: Int64
boolValue: Bool
*/
//从指定文件读取字符串
//第一个参数是文件的路径
//第二个参数是字符编码
//错误处理
let str13 = try! NSString.init(contentsOfFile: "/Users/hhh/Desktop/字母.txt", encoding: NSUTF8StringEncoding)
print(str13)

//写如文件
//第一个参数目标文件路径
//第二参数是否写入缓存(true)
//第三个参数字符编码
//如果没有文件,那么就会创建一个新的文件,如果源文件已经存在,那么会覆盖掉原文件
do{
    try str10.writeToFile("/Users/hhh/Desktop/a.txt", atomically: true, encoding: NSUTF8StringEncoding)
    print("写入成功")
}catch{
    print("写入不成功")
}






//NSArray创建数组
let array:NSArray = NSArray.init(objects: "one","two","three","four","five")
print(array)
let array1:NSArray = ["1","two","three","four","five"]
print(array1)
let array2 = NSArray.init(array: array1)
print(array2)

//数组成员的个数
print(array.count)

//取值
let str = array.objectAtIndex(2)
let str1 = array[2]
print(str)

//获取数组某个元素在数组中的位子
let index = array1.indexOfObject("1")
print(index)

//判断数组是否包含某个元素
let tag = array.containsObject("Five")
print(tag)

//获取第一个元素和最后一个元素
let str2 = array.firstObject
let str2_1 = str2 as! String
let str3 = array.lastObject
print(str2!,str3!)

//将数组元素进行拼接,返回值是字符串
let str4 = array.componentsJoinedByString("-")
print(str4)

//将字符串拆分
let str5:NSString = "YES I am a so bad man"
let array4:NSArray = str5.componentsSeparatedByString(" ")
print(array4)

class Dog{
    func brak(){
        print("🐶在叫")
    }
}
class Cat{}
let dog1 = Dog.init()
let cat1 = Cat.init()
let dog2 = Dog.init()
let dog3 = Dog.init()
let cat2 = Cat.init()
let array6:NSArray = [dog1,cat1,dog2,dog3,cat2,]
//isKindOfClass判断当前对象是属于这个类
for id in array6{
    if id.isKindOfClass(Dog){
        (id as! Dog).brak()
    }
    if id.isKindOfClass(Cat){
        print("小龙")
    }
}








