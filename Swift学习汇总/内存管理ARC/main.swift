//
//  main.swift
//  内存管理ARC
//
//  Created by NUK on 16/6/24.
//  Copyright © 2016年 NUK. All rights reserved.
//

import Foundation

/**
 析构器:
 在实例被销毁之前,程序可能需要释放一些物理资源,此时可以借组类的析构器来实现,析构器是一个名为[deinit]的函数,析构器deinit没有返回值,也没有参数,因此不能重载
 
 ps:析构器在实例释放之前有系统自动调用,因此不能主动调用析构器,子类自动继承父类的析构器,如果子类实现了自己的析构器,子类析构器执行结束时会自动调用父类的析构器,无论,如何子类的析构器一定会调用在父类析构器之前
 */
class Fruit {
    var name:String
    var weight:Double
    init(name:String){
        self.name = name
        self.weight = 0.0
    }
    deinit{
        print("程序准备释放Fruit")
        //此处还可以访问实例属性,可以用于释放资源
    }
}
class Apple:Fruit{
    var color:String
    init(name: String,weight:Double,color:String) {
        self.color = color
        super.init(name: name)
    }
    
    deinit{
        print("程序准备释放Apple")
        //此处还可以访问实例属性,可以用于释放资源
    }
    
    
}
var ap:Apple? = Apple.init(name: "大香蕉", weight: 0.34, color: "八连杀") //1
print(ap!.name + "->" + ap!.color)
//ap是Apple的队形,当ap赋值为nil时,其引用计数为0[retainCount OC中],系统会自动回收掉该对象,即可以看Apple和Fruit的析构器调用
ap = nil
/*
当前来那个类是子类和父类的继承关系,程序也提供了析构器,因此当程序释放Apple时,可以看到APP了的析构器被调用了,在Apple析构器被调用结束时,系统自动调用父类的析构器
*/


/**
Swift的内存管理

Swift提供了强大的内存管理机制,Swift通过自动引用计数ARC(atuo reference count)可以很好的管理对象的回收

PS:只有引用类型的变量引用的对象才需要使用引用计数进行管理,对于枚举,结构体他们都是值类型,因此不需要使用引用计数进行管理

ARC是一个非常优秀的内存管理计数,它的思想非常的简单,当程序在内存中创建一个对象之后,ARC将会自动完成两件事:
1.ARC会自动统计该对象被多少个引用变量所引用,这个值就称为自动引用计数
2.每当一个对象的引用计数变为0时,ARC会自动回收该对象
*/

class User{
    var name:String
    var age:Int
    init(name:String,age:Int){
        self.age = age
        self.name = name
    }
    deinit{
        print("\(self.name)用户被销毁掉了")
    }
}
var user1:User?
var user2:User?
var user3:User?
//创建User对象,让user1变量引用该User
user1 = User.init(name: "小明", age: 18) // 1

//让user2变量也引用user1
user2 = user1 // 2
//让user3变量引用user1
user3 = user1 // 3
//将当前三个对象的引用值都设置为nil
user3 = nil // 2
user2 = nil // 1
user1 = nil // 0
//当前对象的引用计数为0的时候,ARC会自动会后对象


//强引用循环
/*
大部分时候,ARC可以很好的处理程序中对象的内存回收,但是如果连个对象之间存在双向关联,即当前来那个对象都是用内部存储属性会向引用对方的时候,此时两个对象的引用计数都等于1,但他们实际上并没有真正的的引用变量所引用,但是ARC也无法回收他们,这样就会产生垃圾
*/
#if false
    class Student{
        var name:String
        var age:Int
        var teacher:Teacher?
        init(name:String,age:Int){
            self.age = age
            self.name = name
        }
        deinit{
            print("\(self.name)学生对象被销毁了")
        }
        
    }
    class Teacher{
        var name:String
        var skill:String
        var student:Student?
        init(name:String,skill:String){
            self.skill = skill
            self.name = name
        }
        deinit{
            print("\(self.name)老师对象被销毁了")
        }
        
    }
    //学生和老师
var stu:Student? = Student.init(name: "小新", age: 5) // 1
var tea:Teacher? = Teacher.init(name: "美伢", skill: "咕噜咕噜拳") // 1
    /*
    当程序执行到这个位置时,来那个对象个引音他们自己,他们的引用计数为1 ARC不会回收他们.程序可以正常调动他们,因此当前连个对象是有效.
    */
    //建立起关联
stu?.teacher = tea
tea?.student = stu
    
    //将stu, tea设置为nil
stu = nil
tea = nil
#endif
/**
 当程序执行到这里是我们已经把俩个对象设置为nil,虽然表面上看stu和tea的引用变量都未nil不再指向Student和Teacher,因此对象呗释放了,但是因为两个对象是互相包含,形成了互相引用:"强引用循环",从而当前他们的引用计数永远为1,ARC不会释放他们
 */
 
 /*
 Swift为了解决强引用循环两种方式
 
 弱引用,无主引用
 */
 /*
 弱引用不会增加对方的引用计数,因此不会阻止ARC会后被引用的实例,这样可以避免形成强引用循环,只需在var属性前面加上weak关键字即可成为弱引用
 
 弱引用变量要求该引用变量必须允许被设置为nil,也就是说弱引用变量可以没有值,所以意见使用可选类型来定义弱引用变量
 
 PS;弱引用只能声明为变量[var],因为该属性在运行期内值可以发生改变,因此弱引用不能声明为常量[let]
 
 */
class Student{
    var name:String
    var age:Int
    var teacher:Teacher?
    init(name:String,age:Int){
        self.age = age
        self.name = name
    }
    deinit{
        print("\(self.name)学生对象被销毁了")
    }
    
}
class Teacher{
    var name:String
    var skill:String
    //当前变量即为弱引用变量,该变量不会增加对方的引用计数,因此程承程序中的student对象的引用计数为0,ARC会先释放student对象
    weak var student:Student?
    init(name:String,skill:String){
        self.skill = skill
        self.name = name
    }
    deinit{
        print("\(self.name)老师对象被销毁了")
    }
    
}
//学生和老师
var stu:Student? = Student.init(name: "小新", age: 5) // 1
var tea:Teacher? = Teacher.init(name: "美伢", skill: "咕噜咕噜拳") // 1
/*
当程序执行到这个位置时,来那个对象个引音他们自己,他们的引用计数为1 ARC不会回收他们.程序可以正常调动他们,因此当前连个对象是有效.
*/
//建立起关联
stu?.teacher = tea
tea?.student = stu

//将stu, tea设置为nil
stu = nil
tea = nil

//无主引用
/*
无主引用于弱引用类似,无主引用也不会增加对方的引用计数

无主引用与弱引用的区别:
无主引用不允许接收nil,即应该有初始值,因此无主引用只能定义为非可选类型,在定义属性的[var]或[let]关键字之前添加[unowend]关键字即可以定义无主引用
*/

class Dog{
    var name:String
    var cat:Cat?
    init(name:String){
        self.name = name
    }
    deinit{
        print("\(self.name)被释放了")
    }
    
}
class Cat{
    var name:String
    //证明当前属性属性无主引用,并且和dog对象向关联,无主引用不会增加引用计数
    unowned let dog:Dog
    init(name:String,dog:Dog){
        self.name = name
        self.dog = dog
    }
    deinit{
        print("\(self.name)猫被释放掉了")
    }
}
var dog:Dog? = Dog.init(name: "旺财")
var cat:Cat? = Cat.init(name: "波波", dog: dog!)
dog?.cat = cat
dog = nil
cat = nil

/*
上面说的弱引用和无主引用的示例覆盖两种常用场景:

1.如果连个实体中记录实体属性都可以设置为nil,并有可能产生强引用循环,此时适用于弱引用
2.如果连个实体中记录实体属性一个可以为nil,另一个不可以为nil,并有可能产生强引用循环,此时适用于无主引用


还有另一种场景,连个属性都必须有值,且初始化都不会为nil,并可能产生强引用循环,此时需要一个引用使用无主引用,另一个采用隐式可选类型,通过这个方法,可以无需使用强制类型解析就可以访问你关联属性.
var cat:Cat!
*/

//闭包与对象的强引用循环
/*
如果类的某个属性不是普通类型,而是函数类型,那么和这个属性可能返回一个闭包,根据前面对闭包的介绍,我们可以知道闭包会捕获传入的引用变量,如果程序将对象本身传入闭包,那么闭包本身就会捕获该对象,于是改对象就持有了闭包属性,反过来,闭包也持有了该对象,这样对象与闭包就形成了强引用循环
*/
#if false
    class Person{
        var name:String
        var age:Int
        lazy var perInfo:()->String = {
            "人的名为:\(self.name),年龄为\(self.age)"
        }
        init(name:String,age:Int){
            self.age = age
            self.name = name
        }
        deinit{
            print("\(self.name)被释放了")
        }
    }
var per:Person? = Person.init(name: "李雷", age: 56)
    //定一函数类型变量,并将闭包赋值给该变量
var info:(()->String)? = per!.perInfo
per = nil
info = nil
#endif
/*
类中的perinfo属性属于函数类型,该类型值是一个闭包,由此可先,该person对象将会引用该闭包,反过来,程序将self传入了闭包,这样闭包捕获到person对象,这样就会造成循环强引用,他们的引用计数都为1,ARC无法回收
*/

/*
解决闭包与对象之前的强引用循环可以使用无主引用和弱引用:

当闭包捕获的实例总是相互引用,且总是同时销毁时,应该闭包内捕获的实例定义为无主引用

当闭包捕获的引用变量那个可能为nil是,将闭包捕获的引用变量那个定义为入引用,弱引用必须是可选类型

{
[uowned|weak 捕获变量](形参列表)->返回值 in

//闭包执行体

}

没有返回值,没有形参列表
{
[uowned|weak 捕获变量] in

//闭包执行体
}
*/
class Person{
    var name:String
    var age:Int
    lazy var perInfo:()->String = {
        [unowned self] in
        "人的名为:\(self.name),年龄为\(self.age)"
    }
    init(name:String,age:Int){
        self.age = age
        self.name = name
    }
    deinit{
        print("\(self.name)被释放了")
    }
}
var per:Person? = Person.init(name: "李雷", age: 56)
//定一函数类型变量,并将闭包赋值给该变量
var info:(()->String)? = per!.perInfo
per = nil
info = nil


