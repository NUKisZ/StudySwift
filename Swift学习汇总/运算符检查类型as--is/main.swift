//
//  main.swift
//  运算符检查类型as--is
//
//  Created by NUK on 16/6/24.
//  Copyright © 2016年 NUK. All rights reserved.
//

import Foundation

/*
运算符检查类型

is运算符的前一个操作的变量通常是一个引用类型的变量,后面的操通常是一个类(也可以是协议,通常我们把协议理解为一个特殊的类)
is运算符主要用于判断前面的引用类型变量时候引用后面的类,或其之类,或类的实例

ps:在使用is运算符时需要注意:is运算符前面操作变量编译时类型要么与后面的类相同,要么与后面的类具有继承关系,否则会引发编译错误
*/
#if true
    //定义一个协议可以被OC类是用协议
    protocol TestProtocol{}
    //声明hello是使用NSObject类,着在编译过程中是NSObject类 ,hello实是运行中的类是NSString
let hello:NSObject = "hello"
print(hello.isKindOfClass(NSString.self))
print("当前hello是否属于NSString类型的实例:\(hello is NSString)")
    //NSDate代表时间 NSData二进制
    //NSDate与NSObjec存在继承关系, is来检测
    //print("当前hello是否属于NSDate类型的实例:\(hello is NSDate)")
print("当前hello是否属于TestProtocol类型的实例:\(hello is TestProtocol)")//false
#endif
//因为当前NSString和NSDate没有任何关系,所以这里用is运算符检查会出现警告
//let a:NSString = "hello"
//print("当前a是否属于NSDate类型的实例:\(a is NSDate)")

/**
as向下转型运算符

我们编写Swift程序时,引用变量只能调用器编译类是类型的方法,而不能其运行时类型的方法,即使用实际类型引用的实例包含该方法,如果需要让下这个引用变量调用器运行时类型的方法,我们需要进行类型转换这种类型转我们称之为强制类型转换也称为向下类型转化

as:只有在编译时就能确定转换类型成功是才可以写
as?:可选形式的向下转换,返回值总是可选值,如果转换成功那么就返回其结果但是需要使用[!]进行强制解析,反之返回nil

as!:可选形式的向下转换,返回值总是一个直接隐式解析的可选值,如果转换返回其对应的结果,反之返回nil


ps:向下转型只能在继承关系的两个类型之间进行,如果是没有任何继承关系的类型无法进行类型转换而且会编译错误

如果试图把一个父类引用变量转换过成子类类型,着该变量实际引用类型必须是子类类型才行(即便是类型为父类型,而运行时值子类型)否则会出现转换失败
*/
let obj:NSObject = "hello"
//NSObject 和 NSString 存在继承关系
let str = obj as! NSString

let obj1:NSObject = 5
//NSNumber包装类 数值型转换成对象类型
//NSObject 和 NSNumbr 继承的关系
let obj1_1 = obj1 as! NSNumber
//NSNumber和NSString没有关系
//NSNumber类转换NSString
//let str1:NSString = obj1 as! NSString
//print(str1)

//String类型,String和NSString通过Foundation框架进行[连桥] 使用 as 运算符将String类型转换成NSString并调用器方法
let str2 = "Swift"
print((str2 as NSString).substringToIndex(3))
//在强制类型转换时,先使用is运算符判断时候可以转换成功,从而避免出错
if obj1 is NSString{
    let str:NSString = obj1 as! NSString
}

//如果使用as? 执行的是可选形式的向下转换,由于as?转换返回的必须是一个强制解析的可选值,因此程序可能还需要进行强制解析或可选绑定

class Fruit{
    var name:String
    var weight:Double
    init(name:String ,weight:Double){
        self.name = name
        self.weight = weight
    }
    
}
class Apple: Fruit {
    var color:String
    init(name: String, weight: Double, color:String) {
        self.color = color
        super.init(name: name, weight: weight)
    }
}
class Oragne:Fruit{
    var size:Int
    init(name: String, weight: Double,size:Int) {
        self.size = size
        super.init(name: name, weight: weight)
    }
}

var  fruits:[Fruit] = [
    Apple.init(name: "红富士", weight: 1.8, color: "红色"),
    Apple.init(name: "黄元帅", weight: 1.2, color: "黄色"),
    Oragne.init(name: "丑橘", weight: 1.5, size: 2),
    Oragne.init(name: "叶橘", weight: 0.8, size: 1)
]

for f in fruits{
    //可选绑定
    if let ap = f as? Apple{
        print("\(ap.name)\(ap.color)")
    }else  if  let or = f as? Oragne{
        print("\(or.name)\(or.size)")
    }
}

//Any和AnyObject
/**
AnyObject:可以代表任何类的对象
Any:可以代表任何类型
*/

//定义一个Any类型的数组,当前数组元素几乎可以放置任何数据类型
var anyArray:[Any] = [
    "Swift",
    29,
    ["ios":97,"android":59],
    Apple.init(name: "黄元帅", weight: 1.2, color: "黄色"),
    Oragne.init(name: "丑橘", weight: 1.5, size: 2)
]
//遍历数组取出数组中的值
for element in anyArray{
    //尝试将数组元素强转成Fruit类,可选绑定
    if let f = element as? Fruit{
        print(f.name,f.weight)
    }
    
}

var anyObjectArray:[AnyObject] = [
    Apple.init(name: "黄元帅", weight: 1.2, color: "黄色"),
    Oragne.init(name: "丑橘", weight: 1.5, size: 2)
]
print(anyObjectArray)


