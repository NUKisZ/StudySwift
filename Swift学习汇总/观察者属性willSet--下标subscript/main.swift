//
//  main.swift
//  观察者属性willSet--下标subscript
//
//  Created by NUK on 16/6/24.
//  Copyright © 2016年 NUK. All rights reserved.
//

import Foundation

/**
 属性观察者:
 willSet(newValue):被观察的属性即将被赋值之前自动调用该方法
 didSet(oldValue)被观察的属性被赋值完成之后自动调动该方法
 属性观察着可以监听如下的属性改变
 1.除了延迟属存储属性之外所有的存储属性(包括实例存储属性和类型存储属性)
 2.可以通过重载方式为继承得到的属性进行观察
 ps:一般来说我们是不会主动使用该属性的
 */
class Person {
    //年龄进行检测
    var age:Int = 0{
        //将要更改属性age时执行的代码块
        willSet{
            print("预祝你\(newValue)生日快乐")
        }
        //完成对属性age设置后执行的代码块
        didSet{
            print("恭喜你从\(oldValue)张到了\(self.age)岁")
        }
    }
    //长大
    func grow() {
        self.age += 1
    }
}
var xiaoxin = Person()
//每长大一岁我们都会检测到变化
for _ in 0..<10{
    xiaoxin.grow()
}



/**
 下标subscript
 
 下标是Swift中的特性,我们在学习数组,字典和字符串的时候我么可以通过下标的方式来访问,所有Swift类型都支持定义下标,下标可以作为访问对象,集合或序列的简化方式,同一个类型可以定义多个下标,Swift允许用过下标的形参列表或返回值类型来区分不同的下标,同一个类中定义多个不同的下标被称为下标的重载
 
 subscript(形参列表)->下标返回值类型{
 get{
 get部分的执行体,必须有返回值
 }
 set{
 set部分的执行体,一定不能有返回值
 }
 }
 形参列表:下标的形参列表与函数的形参列表用法基本相同,只是下标的形参列表不支持指定的外部参数,也不支持指定的默认值
 下标返回值类型:该类型可以是任何有效的类型
 get:这段代码最终返回下标的值
 set:设置形参代表,通过下标值是传入的新值,Swift会为该形参提供隐式参数名newValue
 */
struct Rect {
    var x:Int
    var y:Int
    var width:Int
    var height:Int
    //如果是类需要添加init方法
    //init(x:Int,y:Int,width:Int,height:Int){
    //        self.x = x
    //        self.y = y
    //        self.width = width
    //        self.height = height
    //    }
    //定义下标,指定下标只接受一个Int类型的参数,下标的返回值为Int
    subscript(idx:Int)->Int{
        //定义get部分
        get{
            switch idx{
            case 0:
                return self.x
            case 1:
                return self.y
            case 2:
                return self.width
            default:
                return self.height
            }
        }
        //定义set部分
        set{
            switch idx{
            case 0:
                self.x = newValue
            case 1:
                self.y = newValue
            case 2:
                self.width = newValue
            case 3:
                self.height = newValue
            default:
                print("不支持该索引值")
            }
        }
    }
    
}
var rect = Rect.init(x: 20, y: 12, width: 200, height: 300)
print(rect.x)
//通过下标对rect的属性赋值
rect[0] = 40
//通过下标对rect的属性进行取值
print(rect[0])

//提过了另一种给成员变量赋值或取值的方式
//扩展 String
//String Array Dictionary在Swift中都是结构体值类型 副本操作
//class 类 引用类型,操作的是实体



