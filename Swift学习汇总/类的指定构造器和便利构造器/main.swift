//
//  main.swift
//  类的指定构造器和便利构造器
//
//  Created by NUK on 16/6/24.
//  Copyright © 2016年 NUK. All rights reserved.
//

import Foundation

/*
类的指定构造器和便利构造器

Swift为类提供两种构造器来确保所欲的实例存储属性都能初始化,他们分别为指定构造器和便利构造器,通过常一个类至少要有一个指定构造器,指定构造器必须初始化类中所有的存储属性(包括自己定义的类和从父类继承的到属性),指定构造器可以通过调用父类的构造器来初始化父类的属性,还唏嘘对本类定义的存储属性进行初始化

便利构造器属于次要的,辅助型构造器,类中可以不定义便利构造器,便利构造器必须调用同一个类中其他构造器来完成初始化

如果程序要在类中定义便利构造器,则需要在构造器[init]之前添加[convenient]关键字

ps:只有类才有便利构造器,结构体和枚举不支持便利构造,而且便利构造器不是必须要写的
*/
#if false
    class Apple {
        var name:String
        var weight:Double
        //指定构造器
        init(name:String,weight:Double){
            self.name = name
            self.weight = weight
        }
        //定义一个便利构造器,使用convenience修饰
        convenience init(n name:String,w weight:Double){
            //便利构造器必须调用同一个类中的其他构造器
            self.init(name:name,weight: weight)
            self.name = name
            
        }
    }
var app1 = Apple.init(name: "🍎", weight: 1.2)
var app2 = Apple.init(n: "🍊", w: 2.4)
#endif
//类的构造器链
/**
Swift对构造器之间调用称为构造器链,3条规则

1.指定构造器必须调用直接父类的指定构造器
2.便利构造器必须调用同一个类中的其他构造器
3.便利构造器调用的构造器链最终节点必须是指定构造器

便利构造必须调用同一个类中的其他构造器会分为两种情况:
1.便利构造器调用了同一个类中的指定构造器(指定构造不能调用同一个类的其他构造器),此时便利构造器调用的构造已经是指定构造器
2.便利构造器调用同一个类中的另一个便利构造器,这个便利构造器必须调用另一个构造器

简化记忆
指定构造器必须是向上代理的(调用父类的构造器)
便利构造总是必须横向代理(调用当前类中的其他构造器)

*/
class Fruit{
    var name:String
    var weight:Double
    //指定
    init(name:String){
        self.name = name
        self.weight = 0.0
    }
    //便利一号
    convenience init(name:String,weight:Double){
        self.init(name:name)
        self.weight = weight
    }
    //便利二号
    convenience init(n name:String,w weight:Double){
        self.init(name:name,weight:weight)
    }
    
}
class Orange:Fruit{
    //只要子类定义构造器,在初始化成员的时候一定要调用父类构造器
    var color:String
    init(name: String,weight:Double,color:String) {
        //调用父类构造器之前务必要把子类中成员属性全部初始化,父类构造器不能调用在子类成员之前
        self.color = color
        super.init(name: name)
        self.weight = weight
    }
    init(){
        self.color = ""
        super.init(name: "")
        self.weight = 0.0
    }
    //子类便利构造器
    convenience init(name:String,color:String) {
        self.init(name:name,weight:0.0,color: color)
    }
    //便利2号
    convenience init(n name: String,c color:String) {
        self.init(name:name,color: color)
    }
}

//构造器的继承和重写
/**
Switf的子类不会自动继承父类的构造器,只有面如下规则时,子类才会自动化的继承父类的构造器

1.子类没有提供任何指定构造器,那么他会将父类的所有指定构造器继承过来
2.如果子类实现了父类的所有指定构造器,无论通过规则1继承实现,还是通过自己编码实现,它都会自动成父类所有的构造器
*/
class Person{
    var name:String
    var age:Int
    //定义指定构造器
    init(name:String,age:Int){
        self.name = name
        self.age = age
    }
    //定义两个便利构造器
    convenience init(name:String){
        self.init(name:name,age:0)
    }
    convenience init(){
        self.init(name:"啊哈")
        self.age = 0
    }
    
}
//当前类提供了自己指定构造器,并未实现父类所有的指定构造器
class Man:Person{
    var hight:Int
    //指定定构造器
    init(name: String, age: Int,hight:Int) {
        self.hight = hight
        super.init(name: name, age: age)
    }
    //定义一个便利构造器
    convenience init(name: String, hight: Int) {
        self.init(name:name,age:0,hight: hight)
    }
}
//当前类没有定义任何构造器,那么它会继承与Man类所有的构造器
class Boy: Man{
    var weight:Double = 100
    
}
/**
 如果子类定义了构造器与父类的指定构造器的形参列表,外部形参名相同,即可认为子类构造器重写了父类的构造器
 */
class Alien{
    var name:String
    var weight:Double
    init(){
        self.name = ""
        self.weight = 0.0
    }
    init(name:String,weight:Double){
        self.name = name
        self.weight = weight
    }
    convenience init(name:String){
        self.init(name:name ,weight: 0.0)
    }
    convenience init(_ name:String){
        self.init(name:name ,weight: 0.0)
    }
}
class CarMan: Alien {
    var speed:Double
    //重写父类的构造器
    override init(name: String, weight: Double) {
        self.speed = 10000
        //调用父类的构造器
        super.init(name: name, weight: weight)
    }
    /*🐰艹:OC init方法 重写此方法 id可以接收任何对象类型
    -(id)initWithName:(NSString*)name andAge:(int)age
    -(id)init
    */
    //定义自己的构造器
    //当前子类中的指定构造器与父类中的便利构造器相同,那么这不是重写
    init(name:String){
        self.speed = 1000
        super.init(name: name, weight: 0)
    }
    //还可以重写父类的便利构造器
    override convenience init() {
        self.init(name:"汽车人")
        self.weight = 10
        self.speed = 0.01
    }
}
/**
 ps:只要子类构造器重写父类的构造器,着必须在子类构造器前面添加[override]修饰符,即使子类构造器是便利构造器也要添加
 
 如果子类中定的构造器只是与父类中的便利构造器形参列表,外部形参名相同,虽然看上去是重写父类的构造器,但是由于子类永远不能可直接调用父类的便利构造器,所以当前不算重写.
 */
 
 //子类必须包含的构造器
 /**
 Swift允许在父类的构造器前面添加[required]关键字,该关键字用于声明所有子类必须包含的构造器
 */
class Dog{
    var name:String
    required init(name:String){
        self.name = name
    }
    required convenience init(){
        self.init(name:"旺财")
    }
}
class Teddy: Dog {
    //重写父类的required的指定构造器,无需添加override
    required init(name: String) {
        super.init(name: name)
    }
    
    required convenience init(){
        self.init(name:"泰迪")
    }
}


