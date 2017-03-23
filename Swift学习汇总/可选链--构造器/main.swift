//
//  main.swift
//  可选链--构造器
//
//  Created by NUK on 16/6/24.
//  Copyright © 2016年 NUK. All rights reserved.
//

import Foundation

//可选链
/**
我们之前已经介绍过可选类型的概念,Swift的所有类型默认不能接受nil,如果程序想让某种数据额类型接受nil,则必须将这个数据类型设置为可选类型
Swift提供两种方式包装可选类型
1.在原有类型的后面直接添加[?]后缀,这种可选类型必须强制解析才能获得被包装的类型
var a:Int? = nil
a = 1
print(a!)1

2.在原有数据类型后面直接添加[!]后缀,这种可选类型是有Swift隐式解析的
var a:Int! = nil
a = 1
print(a)

//可选绑定
var a:Int? = nil
a = 1
if let b = a{//可选绑定,帮你强制解析
print(b)
}

可选链正式用于处理可选链类型的属性,方法,下标的调用
*/
//🌰:定义3个类型 Customer(顾客),Employee(员工),Company(公司)这3个类之间存在着关联关系,当前程序使用了可选类型来维护他们之间的关联关系
class Company{
    var name:String
    var addr:String
    init(name:String,addr:String){
        self.name = name
        self.addr = addr
    }
}

class Employee{
    var name:String
    var title:String
    //当前员工需要关联公司,我们选用隐式可选类型,
    //公司不存在
    var company:Company!
    init(name:String,title:String){
        self.name = name
        self.title = title
    }
    //显示
    func showInfos() {
        print("员工名\(self.name),职位是:\(self.title)")
    }
    
}
class Customer{
    var name:String
    //顾客与员工之间有关联,这里我们使用可选类型
    //员工可能为空
    var emp:Employee?
    init(name:String){
        self.name = name
    }
    //员工数组
    let employees = [
        Employee(name: "小苍", title: "销售客服"),
        Employee(name: "陆雪琪", title: "售后客服"),
        Employee(name: "薇儿", title: "普通客服"),
        Employee(name: "霖霖", title: "销售主管")
        
    ]
    //定一个方法,该方法可以根据员工工名返回对应的员工,返回值为可选类型
    func findEmp(empName:String) -> Employee! {
        for emp in employees{
            if emp.name == empName{
                return emp
            }
        }
        return nil
    }
    
    
    
}
#if true
    //创建一个顾客
var c = Customer.init(name: "小龙")
var emp = Employee.init(name: "Miss", title: "网络咨询")
    //设置关联
c.emp = emp
    //设置员工和公司之间的联系
emp.company = Company.init(name: "LOL学院", addr: "出门左转")
    
print("为\(c.name)服务的公司是:\(c.emp!.company.name)")
    //当前这个段程序Customer的emp是可选类型,因此程序需要使用[!]来进行强制解析,但是Employee中的company属于隐式可选类型,所以无需我们强制进行解析,swift会默认自动解析
#endif
var c2 = Customer.init(name: "小新")
//设置关联
c2.emp = Employee.init(name: "美伢", title: "主妇")
print("为\(c2.name)服务的公司是:\(c2.emp?.company?.name)")
/*
print("为\(c2.name)服务的公司是:\(c2.emp!.company.name)")
unexpectedly found nil while unwrapping an Optional value
当前可选链中有可选为nil
*/
//程序编译阶段是不会报错的,但是运行时一定会出现上面这个错误提示
/**
c2对象关联的实例是隐式可选类型,company的值是nil,然后我们又访问name属性,程序运行时就会出错

通过当前这个程序我们可以看出,强制类型解析或是隐式类型解析存在一个确定,对
c2.emp!.company.name,只要之间任何一个访问的返回值为nil,程序就会导致错误,将上面可选联众强制解析[!]转成[?],在隐式解析的后面也要添加[?],这样是可选链的访问方式,可选链则是一种更加智能的方式,可选链会自动判断程序敢问的关联实例是否nil.
如果关联实例不为nil,可选链会自动解析可选类型,就像隐式解析一样
如果关联实例为nil,可选类不会导致运行错误,而是返回一个nil

*/


//可选链不仅可以用于访问属性,也可以用于方法的调用,

var c3 = Customer.init(name: "王校长")
print("为\(c3.name)服务的公司是:\(c3.emp?.company?.name)")
//unexpectedly found nil while unwrapping an Optional value
//方式为nil,程序崩溃
//不管是隐式可选还显式的可选方法,我们在访问的时候需要在后面添加?,可以保证程序在访问过程中不会崩溃
c3.findEmp("XXX")?.showInfos()

//可选链还可以访问下标
var dic = [Int:Customer]()
dic[1] = Customer.init(name: "水水")

dic[1]?.findEmp("小苍")?.showInfos()
//?防止程序崩溃.因为字典通过key的形式来取出value,返回的是一个可选类型
//dic[1]返回的值nil










//构造器
/**
构造器主要用于完成实例的构造过程,这个过程包括为实例中的米格存储数据设置初始值和执行必要的准备和初始化任务
*/
class Apple{
    var name:String
    var color:String
    var money:Double
    //空构造器
    init(){
        self.name = "黄元帅"
        self.color = "黄色"
        self.money = 1.3
    }
    //取消构造器参数的外部形参名
    init(_ name:String,_ color:String,_ money:Double){
        self.name = name
        self.color = color
        self.money = money
    }
    //两个参数的构造器
    init(name:String,color:String){
        self.name = name
        self.color = color
        self.money = 11.1
    }
    //为构造器指定显示外部形参名
    init(appleName n:String, appleColor c:String,appleMoney m:Double){
        self.name = n
        self.color = c
        self.money = m
    }
    //基本构造器[逐一构造器]
    init(name:String,color:String,money:Double){
        self.name = name
        self.color = color
        self.money = money
    }
    func showInfos() {
        print("\(self.name)\(self.color)\(self.money)")
    }
    
}
let ap1 = Apple.init()
ap1.showInfos()
let ap2 = Apple.init("青苹果","绿色",0.5)
ap2.showInfos()
let ap3 = Apple.init(name: "Apple", color: "土豪金")
ap3.showInfos()
let ap4 = Apple.init(name: "红富士", color: "红色", money: 1.9)
ap4.showInfos()
let ap5 = Apple.init(appleName: "🍎", appleColor: "❤️", appleMoney: 1234.5)
ap5.showInfos()

//可失败的构造器
/**
在某些时候,枚举,结构体,类的构造器可能,不能成功返回该类型的实例,比如用户传入的构造参数无效,或构造过程需要的外部资源缺失,妨碍构造过程,这些情况会导致构造器构造失败,Swift允许我们定义"可失败的构造器"

可失败构造器使用[init?] 或是 [init!]关键字进行定义,在种种构造器执行提眉使用return返回nil,表示当前构造器可以失败
init?构造器返回一个可选类型的实例,因此程序必须对init?构造器返回的实例进行强制解析
init!构造器返回一个隐式可选类型的实例,因此程序对init!构造器返回的实例进行隐式解析

*/
//🌰
class Cat{
    var name:String
    init?(name:String){
        //如果传入的name参数为空字符串,那么构造失败,返回nil
        if name.isEmpty{
            return nil
        }
        self.name = name
    }
    
    
}
let c1 = Cat.init(name: "")
//可选绑定
if let c = c1{
    print("c1的名字:\(c.name)")
}else{
    print("创建失败")
}
//Swift不允许定义两个形参列表相同的构造器,即使是一个可失败的构造器和一个普通的构造器也是不可以的







