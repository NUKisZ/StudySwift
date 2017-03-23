//
//  main.swift
//  继承
//
//  Created by NUK on 16/6/24.
//  Copyright © 2016年 NUK. All rights reserved.
//

import Foundation

/**
 继承:
 继承是面向对象的三大特征之一,在Swift的继承具有单继承的特点,每个子类只能能有一个直接父类,Swift只有子类才能支持继承,继承区分类和其他类型的基本特征
 
 Swift的继承通过 : "父类" 的形式来实现,实现继承的类称为子类,被继承的类称为父类,有的也称为超类,父类和子类的挂关系就是继承
 例如:水果和苹果的关系,苹果继承了水果 ,苹果是水果的子类,水果是苹果的父类
 父和你的关系,你继承你的父亲
 
 父类和子类的称呼各有不同:
 
 父类 parentClass 超类  SupperClass 基类
 子类 childClass  子类  subClass    派生类
 
 格式
 class <#name#>: <#super class#> {
 <#code#>
 }
 
 子类继承父类,可以从父类那类得到,属性,方法,下标和构造器(构造器比较特殊,并不一定总会继承到),子类继承父类所的到的属性,方法和下标都可以进行重写
 子类可以重新定义新的属性,方法和下标,一般来说,父类具有的特征,子类通常都会具有,而子类还可以增加新的特征,因此通常认为子类的功能比父类更强大
 */
 //父类
class Fruit {
    var weight = 0.0
    func info() {
        print("我是一个水果,重\(self.weight)g!")
    }
}
//子类
class Apple: Fruit {
    var name:String!
    func  eat()  {
        print("\(self.name)很好吃")
    }
}
//创建一个Apple实例
var a = Apple()
a.weight = 0.5
a.name = "红富士"
a.info()
a.eat()
/**
 上面这段代码Apple类并没有weight info这些属性和方法,但是我们创建Apple实例之后,可访问当前这些属性和方,这个继承作用
 Swift中没有多继承的概念,即每个类最多只有一个直接父类
 */
 
 /*
 重写父类的方法:
 
 子类可以扩展父类的方法,大部分时候,子类总是以父类为基础,额外新的属性和方法,但是一种情况例外,子类需要重写父类的方法
 
 例子:鸟类都包含飞翔方法,鸵鸟属于鸟的子类,在鸵鸟的类中进行方法的重写
 
 子类可以重写父类的实例方法,重写父类的方法可以进行一些定制和完全实现新工鞥,当子类重写父类的方法是需要加上[override]关键字在方法的前面
 
 ps:子类不可以重写父类的类(static)方法和类(static)属性,但是有一个关键字例外它也是声明的类(class)型法,我们很少使用class来修饰属性和方法,Swift也不推荐class
 
 */
class Bird{
    //fly方法
    func fly(){
        print("自由的飞翔~~~~")
    }
}
class Ostrich:Bird{
    override func fly() {
        super.fly()
        print("我只能在陆地上奔跑!!!!!")
    }
}
/**
如果子类重写了父类的方法,子类的方法会覆盖掉父类的方法,在调用的时候子类调用的是重写以后的方法
如果想在子类中调用父类的方法或是属性,我么是使用[super]关键字,super用于限定调用它从父类继承的的属性和方法,而不是子类自己的属性和方法
*/
let  os = Ostrich()
os.fly()

/**
 重写父类的属性
 
 Swift允许重写继承得到的实例属性,可以提供定制get部分和set部分,或是添加属性观察来检查值的改变willSet(即将改变) didSet(改变完成)
 
 需要注意:
 子类并不知道继承的到属性是存储属性,还是计算属性,子类只知道继承得到属性的名字和类型,因此当子类重写父类的属性时,必须将属性的名字和类型都写出来,以便编译器检查子类到底重写了父类那个属性,重写父类属性时,可以将父类的只读属性(get),可以添加set部分,但是不能将父类中的读写属性改为只读属性
 
 */
 //🌰:
class Cat {
    var speed:Double = 0
    var type:String{
        return "🐱"
        
    }
    
}

class Panda: Cat {
    //重写父类的speed属性
    //计算属性是为其他属性服务的
    override var speed: Double{
        get{
            print("正在访问被重写的属性")
            return super.speed
        }
        set{
            super.speed = newValue * newValue
        }
    }
    //父类的计算属性type
    override var type: String{
        get{
            return "熊猫"
        }
        set{
            print("新的种类为:\(newValue)")
        }
    }
}
let p = Panda()
p.speed = 20
print("p的速度\(p.speed)")
print("\(p.type)")
p.type = "功夫熊猫"
print("\(p.type)")

/**
 重写父类的下标
 
 Switf允许重写下标,重写父类下标时,可以将只读下标改为读写下标,但是不能读写改成只读
 */
 //🌰:

class Base{
    subscript(idx:Int)->Int{
        get{
            print("父类的下标的get部分")
            return idx+10
        }
        
    }
    
}
class Sub: Base {
    override subscript(idx:Int)->Int{
        get{
            print("重写以后的get部分")
            print("通过Super访问父类重写之前的下标:\(super[idx])")
            return idx * idx
        }
        set{
            print("重写后的下标的set部分,出入的参数为:\(newValue)")
        }
    }
}
let base = Base()
print(base[7])//17
let  sub = Sub()

print(sub[7])//49
sub[7] = 90

/**
 防止重写
 
 final关键字可用于修饰类,属性,方法,下标,使用final修饰的类不能被继承,使用final修饰的方法,属性,下标都不可以被重写
 */
class SuperClass {
    var a:Int = 1
    var b:Int{
        get{
            return self.a
        }
        set{
            print("\(newValue)")
        }
    }
    final subscript(idx:Int)->Int{
        get{
            return idx / idx
        }
    }
    final func test(){
        print("你什么都重写不了")
    }
}

class SubClass : SuperClass{
    //当前子类中什么都不可以重写
}

/*
访问控制符:
Swift中的访问控制符有3种:
1.public(共有的):public修饰,可以被任意原文件或任意模块使用,如果使用将某些框架的API暴露出来,则可以使用public权限
2.internal(内部的):internal修饰,可以被同一个模块或应用的其他实体使用,但其他模块中的实体则不能使用,如果希望某些是滴部分因此起来,只能在当前模块或应用中使用,那么就用internal修饰.Swift默认是此权限
3.private(私有的):private修饰,只能在当前源文件中使用,private实体被称为私有实体,private用于实现底层隐藏

ps:实际开发中我们很少用到权限
*/


