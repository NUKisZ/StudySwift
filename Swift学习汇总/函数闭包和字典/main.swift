//
//  main.swift
//  函数闭包和字典
//
//  Created by NUK on 16/6/18.
//  Copyright © 2016年 NUK. All rights reserved.
//

import Foundation

#if false
    
    /*
    函数类型:
    Swift的每个函数都有特定的函数类型,函数类型就是前面介绍的数据类型一样,既可以用于变量,也可以作为参数类型
    ,还可以作为函数返回值类型
    Swift的每个函数都有特定的类型,函数类型由函数的形参类型,->,返回值类型组成
    
    例:
    func test(age:Int,name:String)->String
    该函数的类型是 (Int,String)->String
    func test1(width:Double,height:Double){}
    该函数的类型是:(Double,Double)->Void或(Double,Double)->()
    func test2(){}
    该函数的类型是()->Void或()->()
    //func test(inout a:Int,b:Int)->Int  的函数类型是(inout Int,Int)->Int
    
    */
#if false
    func Pow(a:Int,b:Int)->Int{
        var result=1
        for _ in 1...b {
            result*=a
        }
        return result
    }
var myfunc:(Int,Int)->Int = Pow
print(myfunc(3,2))
    
    func area(width:Int,height:Int)->Int{
        return width*height
    }
myfunc=area
print(myfunc(3,2))
    
    func person(name:String)->String{
        return "hello!\(name)"
    }
var a = person
print(a("小明"))
#endif
    
#if false
    //可以作为函数的参数类型
    //数组排序:用冒泡法
    //别名
    typealias swap = (Int,Int)->Bool
    
    func idLargeForNumber(onenumber:Int,twonumber:Int)->Bool{
        return onenumber > twonumber
    }
    func idSmallForNumber(onenumber:Int,twonumber:Int)->Bool{
        return onenumber < twonumber
    }
    func swapNumber(inout onenumber:Int,inout twonumber:Int)->Void{
        let tmp = onenumber
        onenumber = twonumber
        twonumber = tmp
    }
    
    func sortArray(inout array:[Int],method:swap){
        for i in 0..<array.count-1{
            for j in 0..<array.count-1-i{
                if method(array[j],array[j+1]){
                    swapNumber(&array[j], twonumber: &array[j+1])
                }
            }
        }
    }
    
var array:[Int]=[2,5,3,8,4,0,9]
sortArray(&array, method: idSmallForNumber)
print(array)
sortArray(&array, method: idLargeForNumber)
print(array)
#endif
    
#if false
    
    //函数的类型可以作为函数的返回值
    
    func square(val:Int)->Int{
        return val*val
    }
    func cube(val:Int) -> Int {
        return val * val * val
    }
    func  jc (val:Int) -> Int{
        var result = 1
        for index in 2...val {
            result *= index
        }
        return result
    }
    func getMathFunc(type:String) -> (Int)->Int {
        switch type {
        case "square":
            return square
        case "cube":
            return cube
        default:
            return jc
        }
    }
var mathFunc = getMathFunc("square")
print(mathFunc(5))
mathFunc = getMathFunc("cube")
print(mathFunc(5))
    
#endif
    
    /*
    练习:1.用尽量高的封装方式编写程序操作Float类型的数组,将数组元素改为自身的平方和立方
    2.编写程序操作整型数组,用尽量高的封装度完成可以遍历取出数组中内一个元素改成绝对值,又可操作数组将数组中每个元素清零
    */
    /*1.用尽量高的封装方式编写程序操作Float类型的数组,将数组元素改为自身的平方和立方*/
    
#if false
    func squareNumber(inout number:Float){
        number=number*number
    }
    func cubeNumber(inout number:Float){
        number=number*number*number
    }
    func operateArray(inout array:[Float],method:(inout Float)->Void){
        for i in 0...array.count-1{
            method(&array[i])
        }
    }
var array:[Float]=[1.0,2.0,3.0,4.0]
operateArray(&array, method: squareNumber)
print(array)
operateArray(&array, method: cubeNumber)
print(array)
#endif
    
    /*2.编写程序操作整型数组,用尽量高的封装度完成可以遍历取出数组中内一个元素改成绝对值,又可操作数组将数组中每个元素清零*/
    
#if false
    func absoluteArray(inout number:Int){
        number>0 ? (number = number) : (number = -number)
    }
    func deleteArray(inout number:Int){
        number=0
    }
    func operateMyArray(inout array:[Int],method:(inout Int)->Void){
        for i in 0...array.count-1{
            method(&array[i])
        }
    }
var array=[-1,2,-5,0,6]
operateMyArray(&array, method: absoluteArray)
print(array)
operateMyArray(&array, method: deleteArray)
print(array)
#endif
    
#endif
/*----------闭包(类似于block)------------*/

//在Swift中可以通过独立的代码块代替函数,这个代码块我们称之为闭包

func bigNumber(oneNumber:Int,twoNumber:Int)->Bool{
    return oneNumber>twoNumber
}
func sortArray(inout array:[Int],method:(Int,Int)->Bool){
    for i in 0..<array.count-1{
        for j in 0..<array.count-1-i {
            if method(array[j],array[j+1]){
                let temp = array[j]
                array[j] = array[j+1]
                array[j+1] = temp
            }
        }
    }
}
var array = [5,6,1,8,2,4]
sortArray(&array, method: bigNumber)
print(array)
/*
{(形参类型)->返回值类型 in
执行语句
}
*/
//实际上函数的遍历那个或常量可以通过闭包进行赋值,无需声明函数
//闭包就是一个独立的代码片段,实现简单的功能返回某个值
let sort:(Int,Int)->Bool = {
    (a:Int,b:Int)->Bool in return a>b
}
sortArray(&array,method:sort)
print(array)
//闭包来代替函数传入
sortArray(&array, method: {(a:Int,b:Int)->Bool in return a>b})
print(array)

//练习1.定一个闭包完成a+b=c,再求c的平方
//2.完成数组排序,从大到小

let sumNumber:(Int,Int)->Int = {
    (a:Int,b:Int)->Int in
    var c=a+b
    c*=c
    return c
}
print(sumNumber(5,6))

sortArray(&array, method: {
    (a:Int,b:Int)->Bool in
    return a < b
})
print(array)

/*-----闭包的简化-----*/
//Swift可以推断闭包表达式的参数类型和返回值

let result1:(Int,Int)->Int = {
    a,b in
    var c = a+b
    c *= c
    return c
}

let result2 = {
    (a:Int,b:Int)->Int in
    var c = a+b
    c *= c
    return c
}

//如果闭包的实现可以写成一个简单的表达式,那么我们可以把return省略
sortArray(&array, method: {
    (a:Int,b:Int)->Bool in a>b
})

//如果返回值是一个表达式,并且表达式的类型是明确的,那么返回值和return都可以省略
sortArray(&array, method: {
    (a:Int,b:Int) in a>b
})

//如果闭包的功能可以简化为一个表达式,则参数可以省略,$0表示第一个参数,$1表示第二个参数,...
sortArray(&array, method: {$0 < $1})
print("$0<$1\(array)")

//如果形参只有两个参数,那么可以直接用运算符即可
sortArray(&array, method:<)
print("$0<$1\(array)")


//练习  1.实现一个n的阶乘的闭包
// 2.实现两个数的和与差的乘积

let jiecheng:(Int)->Int = {
    (n:Int)->Int in
    var s=1
    for i in 1...n{
        s*=i
    }
    return s
}
print(jiecheng(5))

let mul:(Int,Int)->Int = {
    a,b in
    var sum = a+b
    var sub = a-b>0 ? a-b :b-a
    var mul = sum*sub
    return mul
}
print(mul(5,2))

//前面已经介绍过函数的形参是函数类型,对于这种形参,大部分时候都是定义一个闭包作为参数,
//而不会重新定义一个函数,Swift默认也是当闭包处理的

//尾随闭包
//sortArray(&array) { (<#Int#>, <#Int#>) -> Bool in
//    <#code#>
//}

//🌰:
func map(inout data:[Int],fn:(Int)->Int)->[Int]{
    for i in 0..<data.count{
        data[i] = fn(data[i])
    }
    return data
}
var data = [3,4,5,2,1]
print("原数组:\(data)")
//尾随闭包,可以省略形参类型,形参名,返回值类型和return关键
var data1 = map(&data) { $0 * $0 }
print(data1)

var data2 = map(&data) { $0 * $0 * $0}
print(data2)

var data3 = map(&data) {
    var  result = 1
    for index in 2...$0{
        result *= index
    }
    return result
}

/*-------字典--------*/
//字典dictionary
/*
字典用于保存具有映射的数据关系,因此字典中保存着两种关系key和value,key和value都可以是任何数据
类型,字典中的key不允许重复
key和value之间存在一种对等的关系,即通过key找到value
字典是无序存储  无序的集合
*/
//声明一个字典
var myDict:Dictionary<String,String> = Dictionary()
var myDict1:[String:String] = ["身高":"178","体重":"70","血压":"80/120"]
var scores:[String:Int]=Dictionary(dictionaryLiteral: ("语文",130),("数学",110))
var myDict2:[String:Double] = [:]
var school = ["清华":660,"北大":650]
//判断是否是空字典:isEmpty
myDict.isEmpty
//使用字典时,字典可以通过key取出value,也可以通过key给value赋值
var score = school["清华"]
var score1 = school["交大"]
print(score)
print(score1)
//当程序通过key来访问value时,字典并非返回的是value的类型,而是返回的是可选类型,这是因为字典
//不能确定程序shi试图通过key访问value时是否一定有值
school["北大"] = 670
print(school)
//对不存在的key设置value,对已存在的value会更改值
school["交大"]=620
print(school)
//可选绑定
if let sc=school["交大"]{
    print(sc)
}else{
    print("没有这个学校的分数")
}

//遍历字典  for in
var seasons = ["Spring":"蚊子复活","Summer":"蚊子乱飞","Autumn":"蚊子产卵","Winter":"蚊子死光"]
for (key,value) in seasons {
    print("\(key):\(value)")
}
for value in seasons.keys{
    print(value)
}
for key in seasons.values{
    print(key)
}


//字典的简单操作
var languages = ["Swift":20000,"OC":10000,"PHP":9000,"C":6000,"Go":2000]
//为字典添加新的key-value
//key已经存在,那么会更新value的值,如果不存在那么会新添加一个
languages.updateValue(3000, forKey: "java")
//如果key存在那么会删除成功,如果不存在会返回nil
languages.removeValueForKey("Go")
print(languages)
//查看字典中key-value的个数
print(languages.count)
//可以通过访问key的方式来删除key-value
languages["C"]=nil
languages.removeAll()

