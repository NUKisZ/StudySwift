//
//  main.swift
//  多态
//
//  Created by NUK on 16/6/24.
//  Copyright © 2016年 NUK. All rights reserved.
//

import Foundation

/**
多态:
Swift引用变量有两个类型:一个是编译时类型,一个是运行时类型,编译时类型是由声明该变量时使用的类型决定的,运行时类型是由实际赋值还给该变量的值来决定,如果编译时类型和运行时类型不一致,就可以能出现所谓多态
*/
#if false
    class BaseClass{
        func base() {
            print("父类的普通方法")
        }
        func test(){
            print("父类被覆盖的方法")
        }
    }
    class subClass:BaseClass{
        override func test() {
            print("子类覆盖了父类的此的方法")
        }
        func sub()  {
            print("子类的普通方法")
        }
    }
    //编译时类型和运行时类型完全一致,不存存在多态的
let bc:BaseClass = BaseClass()
bc.base()
bc.test()
print(bc.dynamicType)
let sc:subClass = subClass()
sc.base()
    //编译时类型和运行时类型是不一样的,多态
    //因为子类其实是一种特殊的父类,因此Switf允许把一个子类实例直接赋值给一个父类的引用变量,无需任何类型转,这被称为向上转型,向上转型是有系统自动完成
    
let p:BaseClass = subClass()
    //得到而是父类继承的base方法
    //编译时p时BaseClass
    //运行时p是subClass
p.base()
    //下面这个将执行当前test方法
p.test()
    //dynamicType 看当前变量的类型
print(p.dynamicType)
    /*
    isKindofClass
    var a = 1
    if a.dynamicType  == Int.self{
    print("c")
    } */
    //p编译时时BaseClass类型
    //p并没有提供sub方法,所以下面代码会编译错误
    //p.sub()
#endif
/*
编写代码-->编译这段代码-->执行这行代码

p引用变量在编译过程中是BaseClass类型,但是在运行过中类型编程SubClass类型,当运行时调用该引用变量的方法时,其方法总变现出子类的方法和特征,而不是父类方法和特征,这就可能出现[相同类型变量,调用同一方法呈现出多种不同行为,我们称之为多态]

*/
/**
人殴打小动物
人 "打"  动物
lavra blackBug bedbug
lavra 大叫着跑开
blackBug 奋起反击
bedBug  开始扔💩
*/
class Animal{
    //被殴打
    func beBeaten()  {
        print("动物被殴打之后的反应!")
    }
    
}
class Lavra: Animal {
    override func beBeaten() {
        print("大叫着跑开")
    }
}
class BlackBug:Animal{
    override func beBeaten() {
        print("奋起反击")
    }
}
class BedBug: Animal {
    override func beBeaten() {
        print("向我们扔💩")
    }
}
class Person{
    func beatAnimal(animal:Animal){
        print("人打的是\(animal)")
        animal.beBeaten()
    }
}
let bge = Person()
let lavra = Lavra()
let blackBug = BlackBug()
let bedBug = BedBug()
//多态的效果,不同事物被同一事件所触发有不同相应
bge.beatAnimal(lavra)
bge.beatAnimal(blackBug)
bge.beatAnimal(bedBug)
/*
谢霆锋问孩子是谁的?
张柏芝:谢霆锋的
谢霆锋:陈冠希的
陈冠希:反正是张柏芝的
*/
class Ask {
    func beAsked()  {
        print("被咨询之后的回答:")
    }
}
class Chen: Ask {
    override func beAsked() {
        print("反正是张柏芝的")
    }
}
class Xie:Ask{
    override func beAsked() {
        print("陈冠希的")
    }
}
class Zhang: Ask {
    override func beAsked() {
        print("谢霆锋的")
    }
}
class Parent{
    func askTo(ask:Ask)  {
        print("被咨询的人\(ask)")
        ask.beAsked()
    }
}



