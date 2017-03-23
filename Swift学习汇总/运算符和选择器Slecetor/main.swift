//
//  main.swift
//  运算符和选择器Slecetor
//
//  Created by NUK on 16/6/24.
//  Copyright © 2016年 NUK. All rights reserved.
//

import Foundation

#if false
    //溢出运算符
    /*
    在默认情况下,Swift不允许整型变量或常量被赋值为一个超出其表示范围的数值,如果程序试图这么做,则会出现运行错误
    Swift提供了3中运算符
    &+:溢出加
    &-:溢出减
    &*:溢出乘
    */
    
var a:Int16 = 32767
a = a &+ 1
print(a) //-32768
var b:Int16 = 2022
b = b &* 60
print(b)//-9752
    //Swift地城会将操作的Int16的字节多余截取,保留16为数据
    //  0000 0000 0000 0000 Int16
    
var c:UInt16 = 20
c = c &- 24
print(c)//65532
    
    //位运算符
    /**
    Swift支持如下运算符
    &:按位与
    |:按位或
    ^:按位异或
    ~:按位取反
    << 左位移动运算符
    >> 右位移动运算符
    */
    
print(5 & 9) //按位与
    /*
    只有1和1在一起得1剩下的都是0
    0000 0101 -->5
    0000 1001 -->9
    -------------------
    0000 0001 -->1
    */
print(5 | 9) //按位或
    /*
    1和1 得 1
    1和0 得 1
    0和0 得 0
    
    0000 0101 ->5
    0000 1001 ->9
    -------------
    0000 1101 ->13
    
    */
    
var d:Int8 = -5
print( ~d ) //按位取反
    /*
    1000 0101 原
    1111 1010 反
    1111 1011 补
    ---------------
    0000 0100 -> 4
    
    */
    
print(5 ^ 9) //按位异或
    /*
    1和1 得 0
    1和0 得 1
    0和0 得 0
    
    0000 0101
    0000 1001
    ---------
    0000 1100 -> 12
    
    */
    
print(5 << 2) //向左移位 20
    // 0000 0000 0000 0000 0000 0000 0000 0101
    //相当于5的二进制全体编码向左移移动两位,移出的截断,在后面补上0
    //0000 0000 0000 0000 0000 0000 0001 0100
print(5>>2)//向右移动 1
    // 0000 0000 0000 0000 0000 0000 0000 0101
    //相当于5的二进制全体编码向右移动两位,超出的部分截取,在掐面不上00
    //0000 0000 0000 0000 0000 0000 0000 0001
    //ps:如果是负数向右移动自动补1,向左移动不0,
    
    //最快2的立方 位移
    //0000 0010 (2 << 2)
#endif

//运算符的重载
/*
Swift的运算符本质上都是函数,比如前面介绍过Int和Int类型可以相加 ,Double和Double也可以相加,但是Int和Double就不可以相加,因为Swift没有提供该函数
func + (left:Int,right:Int)->Int{....}
func + (left:Double,right:Double)->Double{....}
+ 属于特殊函数,需要放到数据与数据之间
Swift提供了一种特殊的方式,那就是运算符重载,我们可以重写运算符

*/
//Swift2.2 之前运算符的重载需要提供两种方法,Swift2.2以后只需剔红一种方法
func + (left:Int,right:Double)->Double{
    
    return Double(left) + right
}
func + (left:Double,right:Int)->Double{
    
    return left + Double(right)
}
let a:Int = 1
let b:Double = 2.3
var c = 2.3 + 1
print(c)


/**
Swift的自定义运算符

声明自定义运算符,需要使用如下语法:

prefix|infix|postfix operator 运算符名{}
分别代表,前置运算符,双目(中间)运算符,后置运算符

声明自定义运算符时并不是需要提供实现体,因此声明运算符后面的花括号中没有任何实现代码

*/

//声明一个新的运算符 ** 次方
/**
当前运算符是次方运算符
*/
infix operator ** {}

//为新的运算符提供函数支撑

func ** (base:Int, exponent:Int) -> Int  {
    var ret = 1
    for _ in 1...exponent {
        ret *= base
    }
    return ret
}
let d = 20
let e = 10
print("\(d)的\(e)次方为:\(d ** e)")

/**
自定义运算符的结合型和优先级

Swift内置运算符有结合型(associativity)和优先级(precedence),自定义运算符同样可以指定结合型和优先级

运算符的优先级决定该运算符是否会被允许选运算,就像我们小学的数学那样,先乘除后加减

运算符的结合性绝对决定了运算符是先操作左边还是先右边,left(左结合),right(右结合)和none(非结合性)

自定义infix运算符可以指定结合性和优先级,如果没有为自定义运算符指定结合性,该运算符的结合性默认是none,如果没有为自定义运算符指定优先级,那么该运算符的优先级为100

PS:运算符优先级最高值为160
*/
//声明一个新的运算符,指定该运算符的结合型为左结合,并指定其优先级为90
// 90 ~ 120 已10递增
infix operator **= {associativity left precedence 90}
// a**=b  a = a**b
func **= (inout base:Int,exponent:Int){
    var res = 1
    for _ in 1...exponent{
        res *= base
    }
    base = res
}

var f = 20
let g = 2
f **= g // f = f**g

print(f)







//选择器
//是一种类型,其声明的变量或常量存储的是一个方法(对象方法(实例方法)),选择来源于OC,在Swift2.2以前版本以被放弃,使用xcode7.2版本的时候,如果调用UIButton的addTage方法:selector:可以使用[""]的方式传入所需要的方法,不过Swift2.2以后出现了新的选择器的方法[#selector(方法)],此方法适用于xcode7.3及以上版本

//那么我们需要创建一个类并且需要继承与NSObject,选择不可以使用

class GoodClass:NSObject{
    func method1(){
        print("method1")
    }
    
    func method2(a:String,b:String){
        print("method \(a + b)")
    }
}
let good = GoodClass()
//声明一个选择器
//将方法转换成Selector类型,存储到sel当中
let sel:Selector = #selector(good.method1)
//可以通过这种方式调用
good.performSelector(sel)

//Selector最大支持参数只有2个
let sel1 = #selector(good.method2)
good.performSelector(sel1, withObject: "5", withObject: "6")


//method3方法的参数有3个,需要调用selector
//a:Int,b:String,c:Int,d:double 封装成一个类
//func method3(对象:类)








