//
//  main.swift
//  归档和JSON
//
//  Created by NUK on 16/6/24.
//  Copyright © 2016年 NUK. All rights reserved.
//

import Foundation

/*
NSKeyedArchiver 归档
NSkeyedUnArchiver 解归档
归档:将任何对象后任何数据结构,转换为NSData类对象的过程称为归档
*/
//系统类归档
#if false
    //归档1
let str = "你好上海"
    //将字符串归档成NSData类型
let data = NSKeyedArchiver.archivedDataWithRootObject(str)
    //data归档的效果
    //将data解归档成字符串
let str1 = NSKeyedUnarchiver.unarchiveObjectWithData(data)
print(str1!)
    
    //归档2
    //文件归
let tag = NSKeyedArchiver.archiveRootObject(str, toFile: "/Users/hhh/Desktop/str.archiver")
tag ? print("归档成功") : print("归档失败")
    
    //解归档
let str2 = NSKeyedUnarchiver.unarchiveObjectWithFile("/Users/hhh/Desktop/str.archiver")
print(str2!)
#endif
//自定义归档
//把类创建的对象进行归档
//如果要给进行归档的话需要让其继承与NSObject,并且要遵守NSCoding协议

class Person:NSObject,NSCoding{
    var name: String
    var age:Int
    init(name: String,age:Int){
        self.name = name
        self.age = age
    }
    
    //进行归档
    func encodeWithCoder(aCoder: NSCoder) {
        //当前归档的格式是:key-value键值对
        //当前对象被归档时,会掉欧勇这个方法,参数aCoder是编码器,是负责归档对象
        //用归档对象的编码器来对当前对象的成员
        aCoder.encodeObject(self.name, forKey: "name")
        aCoder.encodeObject(self.age, forKey: "age")
        
    }
    //解归档
    required init?(coder aDecoder: NSCoder) {
        
        self.name = aDecoder.decodeObjectForKey("name") as! String
        self.age = aDecoder.decodeObjectForKey("age") as! Int
    }
}
let per = Person.init(name: "华安", age: 18)
//你用什么类型归档,那么就用什么类型接收归档的值
let data = NSKeyedArchiver.archivedDataWithRootObject(per)
let per1:Person = NSKeyedUnarchiver.unarchiveObjectWithData(data) as! Person
print(per1.name,per1.age)
NSKeyedArchiver.archiveRootObject(per1, toFile: "/Users/hhh/Desktop/person")
let per2:Person = NSKeyedUnarchiver.unarchiveObjectWithFile("/Users/hhh/Desktop/person") as! Person
print(per2.name,per2.age)

//自定归档的练习:
/**
Dog  name gender age weight
文件的形式归档
Book name price author
data
*/
class Dog:NSObject,NSCoding{
    var name:String
    var gender:String
    var age:Int
    var weight:Int
    init(name:String,gender:String,age:Int,weight:Int) {
        self.name = name
        self.age = age
        self.gender = gender
        self.weight = weight
        
    }
    //归档
    func encodeWithCoder(aCoder: NSCoder) {
        aCoder.encodeObject(self.name, forKey: "name")
        aCoder.encodeObject(self.age, forKey: "age")
        aCoder.encodeObject(self.gender, forKey: "gender")
        aCoder.encodeObject(self.weight, forKey: "weight")
    }
    //解归档
    required init?(coder aDecoder: NSCoder) {
        self.name = aDecoder.decodeObjectForKey("name") as! String
        self.age = aDecoder.decodeObjectForKey("age") as! Int
        self.gender = aDecoder.decodeObjectForKey("gender") as! String
        self.weight = aDecoder.decodeObjectForKey("weight") as! Int
    }
    func showInfos(){
        print(self.name,self.age,self.gender,self.weight)
    }
}
let dog = Dog.init(name: "旺财", gender: "公", age: 2, weight: 30)
NSKeyedArchiver.archiveRootObject(dog, toFile: "/Users/hhh/Desktop/dog")
let dog1 = NSKeyedUnarchiver.unarchiveObjectWithFile("/Users/hhh/Desktop/dog") as! Dog
dog1.showInfos()

let book = Book.init(name: "爱德华", price: "22", author: "按时间段")
let data3 = NSKeyedArchiver.archivedDataWithRootObject(book)
let book2 = NSKeyedUnarchiver.unarchiveObjectWithData(data3) as! Book
print(book2)
//将多个对象归档到同一个文件中
let dic = [
    "key1":"Siwft",
    "key2":"C",
    "key3":"Java",
    "key4":"PHP",
    "key5":"H5"
]
let array = ["SQLite3","DB2"]
let book3 = Book.init(name: "aaa", price: "22", author: "jjj")
//定义一个存储归档的数据
let data1 = NSMutableData.init()
//已NSMutableData对象作为参数,创建NSKeyedArchiver对象
let arch = NSKeyedArchiver.init(forWritingWithMutableData: data1)
arch.encodeObject(dic, forKey: "myDic")
arch.encodeObject(array, forKey: "myArray")
arch.encodeObject(book3, forKey: "myBook")
//结束归档
arch.finishEncoding()
//程序将data写在的缓冲器中.所以需要写成文件
data1.writeToFile("/Users/hhh/Desktop/多个归档对象", atomically: true)

//创建一个NSData对象,读取文件中的内容
let data4 = NSData.init(contentsOfFile: "/Users/hhh/Desktop/多个归档对象")
//已data4作为参数,创建NSKeyedUnarchiver对象
let unarch = NSKeyedUnarchiver.init(forReadingWithData: data4!)
//重复调用解码方法来回复对象
let dic1 = unarch.decodeObjectForKey("myDic")
let array1 = unarch.decodeObjectForKey("myArray")
let book4 = unarch.decodeObjectForKey("myBook")
//结束恢复
unarch.finishDecoding()
print(dic1)
print(array1)
print(book4)








/*
JSON的全称
JavaScript Object Notation
即JavaScript对象符号,它是一种轻量级的数据交换格式,JSON数据格式即适合人进行读写,也适合计算机本身进行解析何和生成

JOSN的作用:
JSON可以表示一组数据,然后在解析中得到当前数据,也可以用JSON中的形式,封装成一种数据形式上传到服务器

JSON符号:
{ }字典 [ ]数组 " "字符串
//model类 成员变量类型可以全是字符串,工作就这么做 数字,时间(除外:数组,字典就不能声明称字符串)

JSON解析:
第三方库
JSONKit,SBJSON,TouchJSON
(性能从左向右越来越差)
苹果在iOS5以后 原生解析JSON类
NSJSONSerialization(性能最好)
JSONModel 生成JSON和解析

98% JSON <--> 2% XML 第三方库 GData

MVC设计模式 Model-View-Controller 也就是模型视图控制器.
MVC把软件分系统的分为了三个部分Mode,View,Controller 在iOS中,你的程序中的每一个Object都将明显的属于着三部分中的一个.
[window-->View与View之间存在层级的关系-->ViewController]

Model = 你程序是什么(而不是你的程序是如何显示的)
🌰:步步高电子词典"雷霆战机","打飞机",Model就是你的小飞机的攻击力是多少
?你飞机上的是什么武器,炮弹,导弹等,你的飞机还有多少血量,就是你的程序将要是实现的功能,或是他们所能干的事情和你所要的数据

controller = 是你的模型呈现给用(程序的逻辑)

controller是程序的内部逻辑,大多数情况下你看不它,它将View和Model捆绑在一起,它将处理用户的输入,例如:你按开炮的恶案件,Controller就会通过内部的逻辑来处理你所要的需求,并在屏幕上做出相应的显示,你将看到屏幕上的小飞机发出炮弹,击中敌机,这就是controller与View之间的交互,contr就是M与V之间的桥梁

View = 在屏幕上你所看到的

View就是后台数据现在给当前用户,例如小飞机什么样子,血量,攻击显示给用户的.

//MVC衍生出来的 MVVM设计模式

JSON Model存储数据
*/

//地址
let PATH = "/Users/hhh/Desktop/Swift_day15/归档和JSON/JSON解析/topic.json"
//JSON解析推荐使用NS系列的字符串,字典和数据
//1.读取文件内容
let content = try! NSString.init(contentsOfFile: PATH, encoding: NSUTF8StringEncoding)
//2.将字符串转换成NSData
let data = content.dataUsingEncoding(NSUTF8StringEncoding)
//let data1 = NSData.init(contentsOfFile: )

//解析JSON
/*
MutableContainers:[JSON是由数组或字典创建的]
MutableLeaves:[JSON是由字符串创建的]
AllowFragments:[允许JSON顶层不是对象]

第一个参数:NSData数据
第二个参数:解JSON的方式,默认使用[MutableContainers]
我们JSON外是[ ]也就是数组,所以我们用数组来接收
*/
let arr = try! NSJSONSerialization.JSONObjectWithData(data!, options: NSJSONReadingOptions.MutableContainers) as! NSArray
//存数数据的数组,存储Model
var mutArr = NSMutableArray.init(capacity: 0)
//取字典
for dic in arr{
    //创建一个模型的对象
    let p = PersonModel.init()
    //ps:JSON文件中的key区分大小写
    p.Name = dic["Name"] as! String
    p.Pic = dic["Pic"] as! String
    p.ProjType = dic["ProjType"] as! Int
    p.ProjectID = dic["ProjectID"] as! Int
    p.Url = dic["Url"] as! String
    
    mutArr.addObject(p)
}

for p in mutArr{
    (p as! PersonModel).showInfos()
}












