//
//  main.swift
//  枚举和结构体
//
//  Created by NUK on 16/6/18.
//  Copyright © 2016年 NUK. All rights reserved.
//

import Foundation

/*
面向对象编程:简称OOP[Object Oriented Programming],更严格的说法是"以对象为中心编程",这种编程方式
在客观世界来建立编程模型-->客观世界是由对象构成,那么面向对象编程的程序运行时内存中也包含一个个对象
客观世界的对象总是有状态和行为,面向对象编程则为对象提供了属性和方法,总之,面向对象编程是一个更易理解,更
现代化的编程方式

Swift是一门非常奇怪的语言,它的面向对象不仅提供了类,还提供了结构体和枚举,从功能上看,Swift的类,结构,枚举
是在完全平等的地位上,因此比其他面向对象语言,Swift多了结构体和枚举
Swift中的5种面向对象的单元:类,结构体,枚举,扩展,协议

需要注意:在Swift中实例和对象是不同的(类-->对象,枚举,结构-->实例),通过类创建的实例成为类,结构体和枚举
创建的实例只能成为实例
Swift中的类,结构体,枚举这3种程序单元内的部分分别可以定义属性,方法,下标,构造器,嵌套类型
*/

//枚举enmu
/*
格式:
enum 枚举名{
//使用case关键字列出所有枚举值
}
定义枚举的时候必须使用case列出所有枚举值,Swift即允许每个枚举值单固拥有一个case关键字,也允许
使用case定义多个枚举值,多个枚举值之间用逗号隔开

*/
enum Season{
    case Spring
    case Summer
    case Autumn
    case Winter
}

enum Weekday{
    case Monday,Tuesday,Wednesday,Thursday,Friday,Saturday,Sunday
}


//需要注意,Swift中的枚举不同于其他语言,Swift中的枚举成员默认不会分配一个整数值,也就是说,Swift的枚举名本身
//就代表了一个枚举实例,对应一个枚举值,与整数值没有任何关系

//使用枚举声明枚举实例
var day:Weekday = Weekday.Monday
var day1=Weekday.Monday
//如果明确类型,或是推断出类型,可以使用下面这种方式来给赋值:省略枚举名赋值
day1 = .Sunday
//如果想判断当前day1的值和枚举中的值是否相同,最好的方法是使用Switch
//例子
var chooseDay = Weekday.Saturday
switch chooseDay {
case Weekday.Monday:
    print("星期一")
case .Tuesday:          //在这里如果明确了枚举类型,可以省略枚举名
    print("星期二")
default:
    break
}

//创建枚举的原始值
/*
原始值类似于其他语言的枚举通过原始值可以为每个枚举成员指定一个简单类型
Int,Double,Float,Character,String的值
格式:
enum 枚举名:原始值的类型{
case 枚举值=原始值
}
需要说明:Swift并不要求对每个枚举成员都指定原始值,Swift可以根据指定的原始值的枚举成员来推断前后枚举成员的原始值
*/
//定义枚举,指定原始值的类似是Int

enum weekday:Int{
    case Monday,Tuesday = 1,Wednesday = 5,Thursday,Friday,Saturday,Sunday
}
//Tuesday=1,推断出Monday=0;Wednesday=5会推断后面的值为6,7,8
print(weekday.Monday.hashValue,weekday.Tuesday.hashValue,weekday.Wednesday.hashValue,weekday.Thursday.hashValue,weekday.Friday.hashValue,weekday.Saturday.hashValue,weekday.Sunday.hashValue)

//????
//String也可以推断
enum direction:String{
    case up,down,left = "左",right
}
//其他枚举值采用隐式原始,即up的原始值是up
//需要注意:如果定义成character类型,无法推断原始值,必须全部置顶原始值

enum season:String{
    case Spring = "S"
    case Summer = "Su"
    case Autumn = "A"
    case Winter = "W"
}
//我们为枚举指定了原始值之后,Swift会为枚举提供一个构造器和属性
/*
init?(rawValue):可失败构造器,根据原始值返回对应的枚举值,由于该构造器可能失败,因此该构造器
返回的是包含枚举值的可选类型
rawValue:获取指定枚举的原始值
*/
var day2 = weekday.Monday
//获取枚举的原始值
print("Monday的原始值是\(day2.rawValue)")
day2 = .Friday
print("Friday的原始值是\(day2.rawValue)")
//获取枚举的原始值
let data = weekday.Thursday.rawValue
//根据原始值来获取枚举值
var mySeason = season.init(rawValue: "S")//可选类型
//或 var mySeason = season(rawValue: "S")
//执行可选绑定

if let sea=mySeason {
    print("\(sea)")
}else{
    print("没有匹配成功")
}

//关联值

/*
枚举除了可以定义一组枚举成员外,还可以为枚举的成员对应一组关联值,Swift并不要求每个枚举成员都定义关联值
关联值的作用:关联值就是枚举实例携带的一些额外数据,关联值有点类似于枚举的属性
格式:
case 枚举值(元组)
*/


/*
（冥王星：Pluto，可能是黄色，已不再归属卫行星，为矮行星）*/
//定义枚举
enum Planet{
    case Mercury(weight:Double,density:Double,name:String)
    case Venus(Double,String)
    case Earth(density:Double,name:String)
    case Mars
    case Jupiter
    case Saturn
    case Uranus
    case Neptune
}
//我们可以给枚举的关联值数据类型,也可以枚举的关联值定义名
//如果枚举指定了关联值的话,那么使用这些枚举时,必须制定它的关联值
var p1 = Planet.Mercury(weight: 0.05, density: 5.44, name: "水星")

//这里我们无法通过访问元组那么来访问枚举的关联值,即使设置了额外的名称也不行,如果想访问枚举的关联值,那么就
//需要声明额外的变量或常量,并将枚举的关联值绑定到这个变量或常量
switch p1 {
case Planet.Mercury(var weight,var density,var name):
    weight=20
    print("...")
default:
    break
}

//如果想把某个枚举成员的关联值提取成常量或变量,我们可以在枚举成员加上let 或 var
//switch p1{
//将Mercury的关联值绑定到weight,density
//}


//递归枚举[间接枚举]
//不同种咖啡分不同种口味

//enum taste {
//    case sweet
//    case bitter
//}

enum coffee {
    case sweet
    case bitter
    //    case cappuccino(taste:taste)
    indirect case cappuccino(taste:coffee)
    indirect case latte(taste:coffee)
}
//创建一杯咖啡
let coffee1 = coffee.cappuccino(taste:coffee.sweet)
switch  coffee1{
case .cappuccino(.sweet):
    print("甜的")
default:
    print("苦的")
    break
}



/*
我们说过结构体和类相当类似,基本上结构体可以完成所有类所做的事情,但是唯独不同的在于,只有类才可以继承
结构体不能继承,结构体是值类型,而类是引用类型
简单的了解一下面向对象的思想:
其实在生活中有很多面向对象的思想:
自助餐和点餐

自助餐:描述一个过程(面向过程)
过程:付钱-->拿餐具-->选菜-->选主食-->水果-->找个座位-->开吃-->扶着肚子离开餐厅

点餐:描述多个对象的配合行动(面向对象)
用餐者(我们):选座位
服务员:拿菜单咨询我们
后厨:做菜
服务员:传菜
用餐者:用餐
用餐者:买单
服务员:算账收钱(我们 给钱)
用餐者:离开餐厅
过程中有:用餐者(我们),服务员,后厨

面向对象编程的任务:
1.抽象出各种参与对象的类型(结构体或类)
2.用类型来定义各种类型的实例
3.让各个实例运做起来

面向对象更符合人类思维模式的软件编程思想,简单易于扩展,维护性好
将程序员执行者转换成指挥者

先创建三个结构体:EatPerson,Waiter,Cook

*/

struct Dish {
    var name:String
    var price:Double
}

struct Waiter {
    //属性-->特征
    var age:Int
    var sex:String
    var height:Double
    var weight:Double
    var beautifulLevel:String
    var academic:String
    //行为-->方法[函数]
    //服务员将客户点的菜的列表交给后厨
    func sendDishList(names:[String])->[String]{
        print("服务员将客户选中的菜交给了后厨")
        return names
    }
    //传递菜单
    func sendMenu()->[String]{
        print("服务员传递菜单")
        return ["红烧肉","黄焖鸡","小龙虾"]
    }
    //传菜
    func takeDish(dish:Dish)->Dish{
        print("服务员传菜:\(dish.name)")
        return dish
    }
    //算账
    func calculateMoney(dishes:[Dish])->Double{
        print("服务员在算账")
        var totals = 0.0
        for dish in dishes{
            totals += dish.price
        }
        return totals
    }
    //洗碗
    func wash(){
        print("服务员在洗碗")
    }
    //打扫卫生
    func clear(){
        print("服务员在打扫卫生")
    }
}

/*后厨*/
struct Cook{
    //属性
    var age:Int
    var sex:String
    var healthy:Bool
    var height:Double
    //行为:函数
    func cookDish(dishname:String)->Dish{
        print("厨子在炒菜")
        let dish = Dish(name: dishname, price: 100)
        return dish
    }
    //识字
    func knowWords(words:String)->String{
        print("后厨能识字:\(words)")
        return words
    }
}

/*用餐者*/
struct EatPerson {
    //属性
    var money:Double
    //行为
    //吃
    func eat(dishes:[Dish]){
        print("用餐者正在吃...")
        for dish in dishes{
            print(dish.name)
        }
        print("用餐者吃完了")
    }
    //付钱
    //如果要在自己的结构体内以函数的形式修改结构体属性,需要在函数前面加上mutating
    //只要结构体重有mutating关键字的函数,那么在外部声明结构体实例的时候不能使用let关键字
    mutating func payMoney(totals:Double)->Double{
        //self自己,谁调用self,谁就是self,self在哪儿,self就是谁
        self.money -= totals
        //或者 money -= totals
        print("用餐者正在付款")
        return totals
    }
    //识字
    func knowWords(words:String)->String{
        print("后厨能识字:\(words)")
        return words
    }
    //点餐
    func selectDishNames(dishNames:[String])->[String]{
        //准备一个空数组,放菜名
        var selectNames = [String]()
        print("用餐者在点餐:")
        for name in selectNames{
            let rand = arc4random()%2
            if rand == 1{
                selectNames.append(name)
            }
        }
        return selectNames
    }
}

//生成各种类型的实例各一个
//创建一个服务员的实例
var waiter = Waiter(age: 18, sex: "女", height: 170, weight: 50, beautifulLevel: "高", academic: "高中")
//创建一个后厨
var cook = Cook(age: 35, sex: "男", healthy:true, height: 180)
var eatPerson = EatPerson.init(money: 100000.0)

//三个实例参与到点餐吃饭的事务中
//服务员传菜单
let menu = waiter.sendMenu()
//用餐者选菜
let selectDishes = eatPerson.selectDishNames(menu)
//服务员传菜单给后厨
let dishes = waiter.sendDishList(selectDishes)
//准备一个桌子
var table = [Dish]()
//后厨炒菜
//for name in dishes{
//    let dish = Cook.cookDish(name)
//    table.append(waiter.takeDish(dish))
//}

/*
总结:上面代码中
1.所有的行为都是由实例发出的
2.程序员大部分的精力都在实现实例的类型
3.在实现某个实例的类型时,只需要关注该实例应该有的行为,而不用关注程序中其他实例的行为和逻辑,
编码可以模块化,可以分工
4.代码和实现事物的逻辑能够一一对应,面向对象思想就是源于现实世界,现实世界中的一切行为都是由
某个类型的实例出发
*/

/*
结构体语法:
1.结构体类型的定义
struct 结构体名{
成员属性[数据类型]
成员行为[函数]
}

PS:1.结构体成员属性可以不赋初值
2.实例方法:是属于该类型的实例的方法
3.实例方法中,如果有self,当前self就代表当前实例
4.实例方法中要是修改当前的成员属性,必须在方法前面加上mutating
5.结构体会默认生成一个构造器(逐一成员构造器)

*/
struct T{
    var x:Int
    var y:String
    var arr:[Int]
    //类方法,而不是实例方法,不能被实例调用
    static func test(){
        print("你好")
        //这里默认是使用不了成员属性的
    }
    
}
//编译器会生成一个构造器
var t1 = T(x: 1, y: "2", arr: [1,2,3,4])
T.test()

//计算属性getter和setter
/*
var 计算属性名:属性类型{
get{
该方法必须有返回值
}
set{
该方法不一定有返回值
}
}
计算属性只能用var声明,属性类型可以使Swift语言允许的任何数据类型
Swift允许值只有只读属性,因此可以省略set部分
*/

/*--计算属性补漏--*/
//ps:计算属性并不是为本身属性来赋值的,而是给其他属性来赋值,我们可以当计算属性是一个方法,也可以当做一个变量,通过这个属性可以给其他成员赋值,或是获取当前属性计算出来的值

class Xo{
    var x:Int = 0
    //计算属性为其他属性提供服务
    var a:Int{
        get{
            return self.x
        }
        set{
            self.x = newValue
        }
    }
}
var xo = Xo()
print(xo.x)
print(xo.a)//print(xo.x)
xo.a = 20
print(xo.x)
print(xo.a)



//实现实例:圆
struct Circle{
    //存储属性
    var radius:Double //半径
    var centerX:Double //中心坐标x
    var centerY:Double //中心坐标y
    //计算属性:在存储空间中没有实体映射,而是需要通过计算才能得到
    var area:Double{
        //计算代码
        get{
            //必须有返回值的
            return M_PI*self.radius*self.radius
        }
        set(newValue){
            //Swift会默认提供隐式的形参名newValue,我们可以用这个形参名来操作传入的函数
            //如果想修改默认形参名,那么可以使用set(xxx){}来修改
            //newValue就是代表新设置的面积
            self.radius = sqrt(newValue/M_PI)
        }
    }
    //平移
    mutating func move(x:Double,y:Double){
        self.centerX += x
        self.centerY += y
    }
    
    //面积
    func proportion()->Double{
        return M_PI*self.radius-self.radius
    }
    
}

//创建一个圆的实例
var cir = Circle.init(radius: 4, centerX: 4, centerY: 4)
//通过实例计算面积
let mj = cir.proportion()
print("mj圆的面积:\(mj)")
//通过计算属性的方式求面积
print(cir.area)
//直接得到一个半径
cir.area = 456

//构造器init
/*
构造器相当于一个创建实例的函数,用init作为构造器的名字
*/
struct rect{
    var width:Double=1
    var height:Double=2
}
//默认会提供一个逐一成员构造器
let r = rect.init(width: 1.1, height: 1.2)
//如果成员变量被赋值,那么编译器会提供一个无参的构造器
let r1=rect.init()

struct Tri{
    var abian:Int
    var bbian:Int
    var cbian:Int
    //自己定义一个构造器
    init(abian:Int,bbian:Int,cbian:Int){
        self.abian = abian
        self.bbian = bbian
        self.cbian = cbian
    }
    //次构造器中只有两个成员
    init(abian:Int,bbian:Int){
        self.abian = abian
        self.bbian = bbian
        self.cbian = 4
    }
    //自己创建无参构造器,系统不会再提供默认的无参构造器
    init(){
        self.abian = 2
        self.bbian = 3
        self.cbian = 4
    }
}
let tr = Tri.init(abian: 1, bbian: 1, cbian: 1)







