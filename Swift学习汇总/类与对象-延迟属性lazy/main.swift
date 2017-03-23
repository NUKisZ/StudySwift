//
//  main.swift
//  类与对象-延迟属性lazy
//
//  Created by NUK on 16/6/24.
//  Copyright © 2016年 NUK. All rights reserved.
//

import Foundation

/**
 面向对象是相对面向过程而言
 面向对象和面向过程都是一种思想
 面向过程
 强调的是功能行为
 关注的是解决问题需要哪些步骤
 面向对象
 将功能封装进对象,强调具备了功能的对象
 关注的是解决问题需要哪些对象
 面向对象是基于面向过程的
 
 打开电脑听歌 名词
 面向过程:
 打开电脑
 播放音乐
 关闭电脑
 面向对象:
 电脑->打开//加载系统是你做的吗?
 电脑-->播放音乐
 电脑-->关闭
 //面向对象关注[主体],谁是主体,谁就是对象
 想:
 打电话
 谁是对象? 电话
 去饭店吃饭
 谁是对象? 饭店
 找女朋友
 谁是对象? 女朋友
 
 面向对象的特点:
 它是一种复合人类思考习惯的思想
 可以将复杂的事情简单化[模块]
 将程序猿从执行者转换成指挥者
 
 面向对象编程中类与对象的关系
 🐰艹:Swift 类,结构体,枚举面向对象
 
 什么是对象?
 听到的,看到的,摸到的,想到的,闻到的都可以称为对象,世间万物皆对象,能够独立并带有意义的
 
 类和对象
 1.生活中理解类和对象
 类              对象
 人       我,马云,习大大,乔布斯,贝爷(站在食物链顶端的男人)
 美女    miss,伊芙蕾雅,东🐑,小苍,(男人装),小米,(大米)
 帅哥    智哥,我,I'am ,Me
 🐶      小白,小黑,小黄,旺财
 🐱      多啦a梦,加菲猫,TOM,黑马警长,蓝猫
 
 终结:类是对象的抽象,对象是类的实例化(实现)
 使用计算机语言就是不断的描述实际生活中的事物
 Swift描述事物可以通过类,结构体,枚举等方式体现,实际应用中,我们最常用的还是类,类是具体事物的抽象
 对象即是该类事物的实实在在的个体
 
 1.对象:
 世间万物皆对象,对象是类的实例化
 2.类:
 具有相同或相似性质的对象的抽象
 3.对象的属性和行为:
 对象具有属性:通过数据值的形式来描述
 对象具有行为:通过函数(方法)来表达
 4.类的属性和行为:
 类的属性:它是对象属性的抽象
 类的行为:它是对象行为的抽象
 
 以具体的实例来理解类和对象
 例子:生产车-->图纸
 图纸-->类-->车的相关属性和行为
 属性: 轮子的个数,速度 (成员变量/成员实例))
 行为:跑(函数/方法)
 根据图纸生产车,并且可以根据图纸中不同的属性值和具体的行为来生产出不同的车
 //对象(实例)
 自行车:
 属性:
 轮子的个数:2
 速度:20km/h
 跑:已20km/h的速度跑起来
 
 三轮车
 属性:
 轮子的个数:3
 速度:21km/h
 跑:已21km/h的速度跑起来
 
 劳斯莱斯,宾利,玛莎拉蒂,法拉利,QQ
 属性:
 轮子的个数:4
 速度:2000km/h
 跑:已2000km/h的速度跑起来
 
 格式:
 class 类名{
 属性
 行为
 }
 
 */
 //PS:如果在类中声明属性,必须赋初始值,而结构体不需要,如果在声明属性是不想赋初始值 必须提供init够着器
class Drawing{
    var wheel:Int
    var speed:Int
    //var height:Int?//可选类型
    init(wheel:Int,speed:Int){
        self.wheel = wheel
        self.speed = speed
    }
    func run()  {
        //self 自己 谁调用self谁就是self
        print("已\(self.speed)km/h的速度跑起来")
    }
    
}
//创建了一个自行车的对象
let bike = Drawing(wheel: 2, speed: 20)
bike.run()
let trike = Drawing.init(wheel: 3, speed: 21)
trike.run()
let car = Drawing.init(wheel: 4, speed: 2000)
car.run()
/**
 总结:
 每一辆汽车都是对象,都有自己的具体属性值,都是图纸创建的实例(对象)
 图纸是抽象的,汽车是具体的,图纸是对汽车对象的高度概括(抽象)
 */
 /**
 生活中描述事物无非就是描述事物的名称/属性和行为
 🌰:人有身高,体重,年龄等属性
 吃饭,睡觉,打豆豆行为
 Swift中用类来描述事物也是如此
 属性:对应着类中的成员变量(成员属性/成员实例)
 行为:对应类型的成员方法[函数]
 */
class Person {
    var height:Double
    var weight:Double
    var age:Int
    init(height:Double ,weight:Double ,age:Int){
        self.age = age
        self.height = height
        self.weight = weight
    }
    func eat(){
        print("吃饭")
    }
    //成员方法/对象方法
    //PS:在结构体中在方法中改变成员属性,需要在func关键字的前面加上mutating
    func Sleep(){
        print("睡觉")
        self.age = 28
    }
    //static 代表的是类方法,只有类才能调用
    static func fate(){
        //类方法中是不能访问成员属性的
        //self.age
        print("打豆豆")
    }
    
}
let Curry = Person.init(height: 190, weight: 80, age: 27)
Curry.eat()
Curry.Sleep()//对象方法/成员方法
Person.fate()//类方法

//一般是名词类
//坦克发射3颗炮弹打掉2架✈️
//坦克,飞机 炮弹
//发射炮弹
//炮弹的属性
//死亡

//小明在公车上签着一条叼着热狗的狗
//小明  公车  热狗  狗

//当我们设计类型时候只关心3样东西
/*
1.事物的名称(类型)
2.行为:(方法)
3.属性:(成员变量)

1.练习:
创建一个Student类
成员属性有:age,name
方法: exam() writeCode()

创建一个MyPoint类型
成员有x,y坐标 方法输出x,用的坐标

*/
class Student{
    var age:Int
    var name:Int
    init(age:Int,name:Int){
        self.age = age
        self.name = name
    }
    func exam() {
        print("考试通过")
    }
    func writeCode(){
        print("写代码")
    }
}
class MyPoint {
    var x:Int
    var y:Int
    init(x:Int,y:Int){
        self.x = x
        self.y = y
    }
    func printMyPoint(){
        print("x:\(self.x) y:\(self.y)")
    }
}
/**
面向对象的三大支柱

封装:封装是把一个事物包装起来,使外界不能了解它内部的具体情况,在面向对象的程序设计中,封装就是把相关数据和代码结合成一个有机的整体,形成数据和操作代码的封装体,对外部只提供一个可以操作的接口

继承:继承是从已有的类创建新类的过程,提过继成信息的是父类,得到继承继续的子类,子类和父类之间就是继承的关系
(IS-A)继承关系

多态:多态是不同结构的对象可以,以各自不同的方式相应同一个消息[函数的调用]
*/
 
 
 
 
 
 /**
 延迟属性
 在某些时候,存储属性在第一次被调用的时候才会计算初始值的属性,声明延迟属性需要在前面加上关键字 lazy
 需要注意:延迟属性只能定义成var类型,因为let类型的存储属性需要在初始化时必须赋值,所以let无法完成延迟属性
 延迟属性是一种延迟加载机制,当某个实例持有另一个创建成本比较大的实例引用时,可以使用延迟属性来降低内存开销,从而提成性能
 */
 //🌰:
class Dept {
    var id:Int //存储属性
    var info:String
    init(id:Int){
        self.id = id
        //暂停2秒,模拟耗时操作
        //NSThread 三大线程之一
        NSThread.sleepForTimeInterval(2)
        self.info = "模拟读取数据库 sqlLite3"
        //sqlLite3 <--> FMDB
    }
    
}
class User{
    var id:Int = 0
    lazy var dept = Dept(id:20)
    var nicks = [String]()
}
//创建User对象
var user = User()
//给当前数组添加成员
user.nicks.append("西游记")
user.nicks.append("悟空")
print(user.nicks)
/**
User类定义了一个名为dept对象,dept属性一个存储属性,如果不适用延迟存储机制,程序必须自创建User对象是完成dept属性的初始化,加入dept是一个创建成本比较大的实例(模拟暂停2秒),这将导致User创建对象编程耗时性操作
当我们创建user对象的时候,只是同乐User类中的一些属性,完全没有使用dept属性,那么这个时候我们可以将没有使用的属性添加lazy使之称为延迟属性,无需再创建对象的时候就加载出当前属性.
*/


