//
//  main.swift
//  NSMutableString--NSMutableArray
//
//  Created by NUK on 16/6/24.
//  Copyright © 2016年 NUK. All rights reserved.
//

import Foundation

//NSMutableString是NSString子类
//
var ms1:NSMutableString = "abcdefg"
var ms2 = NSMutableString.init()
var ms3 = NSMutableString.init(string: "hello")
//初始化指定大小的字符串(长度为10的字符串)
var ms4 = NSMutableString.init(capacity: 10)
//拼接
ms1.appendString("234")
print(ms1)
ms1.appendFormat("%@", ms3)
print(ms1)
//插入
ms3.insertString("Swift", atIndex: 5)
print(ms3)
//替换
let range = NSRange.init(location: 0, length: 5)
ms3.replaceCharactersInRange(range, withString: "easy")
print(ms3)
//删除
let range1 = NSRange.init(location: 0, length: 5)
ms1.deleteCharactersInRange(range1)
print(ms1)
//重新设置内容
ms1.setString("上海千锋")
print(ms1)

/**
1：已知有两个字符串，str1 = @“hello ” ,Str2 = @“world”将两个字符串拼接到一起，中间用“*”分开
2：@“/home/qianfenasdasg/oc.txt"获取文件的扩展名
3：从字符串@"Welcome to Beijing!"，中查找Beijing的范围。
4：从字符串@"Welcome to Beijing!"， 中提取第3到第10个字符，生成字符串。
5：传入两个字符串，判断这两个字符串是否相等，如果相等输出第一个字符串的第一个字符，如果不相等输出第一个字符串的第二个字符
*/
#if false
    //1.
let str1:NSString = "hello"
let str2:NSString = "world"
let str3 = str1.stringByAppendingFormat("%@%@","*",str2)
print(str3)
    //2.
let str4:NSString = "/home/qianfenasdasg/oc.txt"
let range2 = str4.rangeOfString(".")
let str5 = str4.substringFromIndex(range2.location+1)
print(str5)
    //3.
let str6:NSString  = "Welcome to Beijing!"
let range3 = str6.rangeOfString("Beijing")
print("\(range3.location) \(range3.length)")
    //4.
let str7:NSString = "Welcome to Beijing!"
let range4 = NSRange.init(location: 2, length: 8)
let  str8 = str7.substringWithRange(range4)
print(str8)
    
    //5.
let str9:NSString = "jiaozi"
let str9_1:NSString = "jiaozi"
if str9 == str9_1{
    let c = str9.characterAtIndex(0)
    NSLog("%c", c)
}else{
    let c = str9.characterAtIndex(1)
    NSLog("%c", c)
}
#endif
class Test{
    //将传入的字符串逆序
    //比如输入 @"abcdef"输出@"fedcba"
    static func reveserString(srcStr:NSString)->NSString{
        let str = NSMutableString.init()
        var i = srcStr.length
        while i > 0{
            str.appendFormat("%c", srcStr.characterAtIndex(i-1))
            i -= 1
        }
        return str
    }
    //压缩字符串
    //比如输入@"aaabbbcceua" 输出@"3a3b2c1e2a"
    //压缩字符串
    //比如输入@"aaabbbcceaa" 输出@"3a3b2c1e2a"
    static func compString(srcStr:NSString)-> NSString{
        let  str = NSMutableString.init()
        var j = 1 //计数
        for i in 0..<srcStr.length-1 {
            if srcStr.characterAtIndex(i) == srcStr.characterAtIndex(i+1) {
                j += 1
            }else{
                str.appendFormat("%d%c",j,srcStr.characterAtIndex(i))
                j = 1
            }
            if i == srcStr.length-2{
                str.appendFormat("%d%c", j,srcStr.characterAtIndex(i+1))
            }
        }
        
        return str
        
    }
    //将原字符串进行小写转大写，大写转小写
    //大写字母A~Z 65~90  小写字母a~z 97~122  大小写之间差值 32
    //比如输入 @"aBCdEfGA" 输出 @"AbcDeFga"
    static func sortString(srcStr:NSString)->NSString{
        let str = NSMutableString.init()
        for  i in 0..<srcStr.length-1 {
            if srcStr.characterAtIndex(i) >= 65 && srcStr.characterAtIndex(i) <= 90{
                str.appendFormat("%c", srcStr.characterAtIndex(i)+32)
            }else if srcStr.characterAtIndex(i) >= 97 && srcStr.characterAtIndex(i) <= 122{
                str.appendFormat("%c", srcStr.characterAtIndex(i)-32)
            }
        }
        return str
    }
    // 替换字符串srcStr中从startKey到endKey之间的字符串//返回结果
    //比如输入srcStr=@"abc da abbc cde f" startKey=@"da" endKey=@"cde" 输出 @"abbc"
    static func replaceString(srcStr:NSString,startKey:NSString ,endKey:NSString)->NSString{
        let  str = NSMutableString.init()
        let range1 = srcStr.rangeOfString(startKey as String)
        let range2 = srcStr.rangeOfString(endKey as String)
        let range3 = NSRange.init(location: (range1.location + startKey.length ), length: (range2.location - range1.location - startKey.length))
        str.appendString(srcStr.substringWithRange(range3))
        
        return str
    }
}











#if false
    //NSMutableArray
    //声明的是一个空的可变数组
let array = NSMutableArray.init(capacity: 0)
let array1 = NSMutableArray.init(array: [1,2,3,4,5])
let array2:NSMutableArray = [1,2,3,4,5]
    //增加元素
array.addObject("d")
array.addObject("e")
print(array)
    //在指定的范围内增加
    //在当前数组数组范围内增加
array.insertObject("f", atIndex: 0)
print(array)
    //在数组中追加
let array4 = ["g","h","i"]
array.addObjectsFromArray(array4)
print(array)
    //替换数组中的元素
array.replaceObjectAtIndex(2, withObject: "ffffffffff")
print(array)
    
    //交换数组中元素的位置
array1.exchangeObjectAtIndex(0, withObjectAtIndex: 4)
print(array1)
    
    //在数组中删除
    //删除最后一个元素
array.removeLastObject()
print(array)
    //删除指定下标的元素
array.removeObjectAtIndex(2)
print(array)
    //直接删除元素
    //如果要删除元素存在,那么数组会直接删除其元素,如果元素不存,那么数组不会进行任何操作
array.removeObject("f")
print(array)
    //在指定范围内删除元素
    //如果在此范围,就删除,不再则不做处理
let range = NSRange.init(location: 0, length: 3)
array.removeObject("g", inRange: range)
    //array.removeObjectsInRange(range)
print(array)
    //从一个数组中删除
let array5 = [1,2,3]
array1.removeObjectsInArray(array5)
print(array1)
    //删除所有元素
array1.removeAllObjects()
    //给当前数组设置新值
array.setArray(array4)
print(array)
#endif
/**
 1：创建一个数组，数组中有三个Cat 的对象，有三个Dog 的对象，遍历数组，如果是Cat 的对象就发送wash 的消息，打印“小猫在洗脸”，如果是Dog 的对象，就给对象发送bark 的消息，打印狗叫声	 iskindofClass
 2：welcom to qianfeng 获取这句话单词的个数
 3：Yes i am a so bad man 按照单词逆序
 4，有两个字符串"This is a boy";@"really  really too  bad”; 将这两个字符串单词,交叠,形成新的字符串 "This really is really a too boy bad"
 */
class Dog {
    func brak() {
        print("🐶在叫")
    }
}
class Cat {
    func wash(){
        print("🐱在洗脸")
    }
}
let dog1 = Dog.init()
let cat1 = Cat.init()
let dog2 = Dog.init()
let cat2 = Cat.init()
let dog3 = Dog.init()
let cat3 = Cat.init()
let array = NSArray.init(objects: dog1,cat1,dog2,cat2,dog3,cat3)
for obj in array{
    if obj.isKindOfClass(Dog){
        (obj as! Dog).brak()
    }
    if obj.isKindOfClass(Cat){
        (obj as! Cat).wash()
    }
    
}

let str:NSString = "welcom to qianfeng"
let arr = str.componentsSeparatedByString(" ")
print(arr.count)

let str1:NSString = "Yes i am a so bad man"
let arr1 = str1.componentsSeparatedByString(" ")
let array1 = NSMutableArray.init(capacity: 0)
var  i = arr1.count-1
while i >= 0{
    array1.addObject(arr1[i])
    i -= 1
}
let  str2 = array1.componentsJoinedByString(" ")
print(str2)
//有两个字符串"This is a boy";@"really  really too  bad”; 将这两个字符串单词,交叠,形成新的字符串 "This really is really a too boy bad"
let str3:NSString = "This is a boy"
let str4:NSString = "really really too  bad"
let array2:NSArray = str3.componentsSeparatedByString(" ")
let array3:NSArray = str4.componentsSeparatedByString(" ")
var newStr = NSMutableString.init()
for i in 0..<array2.count{
    newStr.appendFormat("%@ ", array2[i] as! NSString)
    if i < array3.count{
        newStr.appendFormat("%@ ",array3[i] as! NSString)
    }
}
//如果第二个数组的成员多余第一个
if array3.count > array2.count{
    var i = array2.count
    while  i < array3.count{
        newStr.appendFormat("%@ ", array3[i] as! NSString)
        i += 1
    }
}
print(newStr)














