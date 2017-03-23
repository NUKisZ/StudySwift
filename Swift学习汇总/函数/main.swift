//
//  main.swift
//  函数
//
//  Created by NUK on 16/6/18.
//  Copyright © 2016年 NUK. All rights reserved.
//

import Foundation

/*---------函数基础---------*/
/*  在Swift中函数是重要的组成部分,一个Swift程序可以由多个函数组成.
在某些语言中,会管函数成为方法,在Swift中应该叫做函数,但是叫做方法也可以.
定义和调用函数
格式:
func 函数名(形参列表)->放返回值类型{
//执行语句[功能代码]
return//return只能返回一个值,return a,b 是不可以的.但是可以通过元祖(a,b)
}
Swift中声明函数必须使用func关键字
调用函数:函数名(形参列表)
函数名:函数的名字一般是由字符组成,一般来说,为了让函数名的可读性高,我们会选用单词,一般第一个单词的字母
小写.后面每个单词的首字母大写
例如:arrayStudentNumber
返回值类型可以是Swift语言允许的任何数据类型,包括此类型和引用类型,如果声明了函数的返回值类型,函数体内
应该有一个return,该语句返回一个变量或表达式,这个变量或表达式的类型必须和此处声明的类型匹配.如果希望
声明一个函数没有返回值,则有如下三种方法:1.省略"->"返回值类型 func 函数名(形参列表){}
2.使用->()指定返回空元组,这里代表是没有返回值 3.使用->void指定返回值void代表没有返回值
形参变量:形参列表用于定义该函数可以接受的形参,形参列表可以什么都没有,也可以是很多形参组成,多个参数之间
以英文逗号隔开,形参名和形参的类型之间用英文冒号隔开,一旦在定义函数时制定了形参列表,则调用时必须传入对应
的参数值-->谁调用函数,谁负责给形参传值.

需要注意:函数中的执行语句有严格的执行顺序,排在函数前的语句总是先执行,排在后面的语句总是后执行

*/

/*
例子:1.定义一个函数比较两个数的大小,返回较大的数
*/
//函数是对功能代码的封装
#if false
    func max(a:Int,b:Int)->Int{
        return a>b ? a : b
    }
    
var a=10
var b=20
var max2=0
max2=max(a, b: b)
print(max2)
#endif

//2.定义一个函数输入姓名,打印你好+姓名
//3.定义一个函数,打印当前数组中的字符串

#if false
    func namePrint(name a:String) -> Void{
        print("\(a),你好!")
    }
var name="小王"
namePrint(name: name)
    
    func arrayPrintString(array:[String]) -> Void{
        for i in array{
            print(i)
        }
    }
let array=["ab","sd"]
arrayPrintString(array)
#endif

//无返回值类型
//1.无参数,无返回值类型
#if true
    func hello(){
        print("hello")
    }
    //2.该函数有一个参数,没有返回值
    func hello(name:String)-> () {
        print("\(name),你好!")
    }
    //3.该函数有三个参数,没有返回值
#endif

/*
练习:
1.计算两个数的和
2.返回三个数中的最大值
3.实现水仙花数的判断,是就打印,不是打印不是水仙花数
4.定一个数组,数组成员19个,存储学生的年龄,求平均年龄
*/
#if false
    func sum(a: Int,b:  Int)->Int{
        return a+b
    }
    func max(a:Int,b:Int,c:Int)->Int{
        var max1=a
        if a<b{
            max1=b
        }
        if max1<c{
            max1=c
        }
        return max1
    }
    func shuixianhua(a:Int)->Void{
        let b = a
        let gewei = a%10
        let shiwei = a/10%10
        let baiwei = a/100
        if a==gewei*gewei*gewei+shiwei*shiwei*shiwei+baiwei*baiwei{
            print(b)
        }else{
            print("\(b)不是水仙花数!")
        }
    }
#endif

//在某些时候我们定义的函数需要返回两个值.那么我们可以使用元组
//例子:返回数组中最大的和最小的值

#if false
    func getMaxAndMin(array:[Int])->(max:Int,min:Int){
        var max=array[0]
        var min=array[0]
        for (_,value) in array.enumerate(){
            if max<value {
                max=value
            }
            if min>value {
                min=value
            }
        }
        return(max,min)
    }
    
var array1=[1,2,3,4,5]
print("max=\(getMaxAndMin(array1).max),min=\(getMaxAndMin(array1).min)")
#endif


/*-----函数的形参------*/
//外部形参名
/*
当我们调用add(,b:)b就是外部参数名称,外部参数名可以用于表示传入参数的意义,调用函数时
传入的参数则具有更好的意义,在Swift中函数除了第一个参数外,其他所有的形参都会分配一个
隐式外部参数名,这些外部参数名与内部的参数名保持一致的.
*/
//定义函数时并不显示自定的外部参数名,默认情况是第一个形参不显示

//func girth(width:Double,height:Double)->Double{
//    return Double(2*(width+height))
//}
//girth(10, height: 12)

//在某些时候我们需要函数增加可读性,那么我们可以使用外部参数名
//外部形参名 形参名:形参类型

//取消外部形参名 加[_]
func girth(width:Double,_ height:Double)->Double{
    return Double(2*(width+height))
}
girth(10, 10)

//其实我们还可以设置默认形参值
func say(user name:String="Miss",userAge age:Int){
    print("姓名:\(name) 年龄\(age)")
}
say(userAge: 18)
say(user: "小刘", userAge: 20)

//个数可变的参数(...)
/*
在某些时候,不确定外部传给我们多少数据,Swift提供了一种在定义函数时可以指定不确定的形参,
在要定义的形参后面加上[...]
需要注意:如果使用不确定的形参,那么系统会默认转成数组的方式传入,不确定的形参只能有一个
而且当有多个参数和不确定性参的时候,不确定形参需要放在所有参数的最后.
*/
//例子:
func test(books:String...){
    for book in books {
        print(book)
    }
}
test("lol从入门到放弃","3天精通金克斯","7天..")

//Xcode7.3和7.2的不同 Swift3.0以后取消可变参数 func swap(var a: Int){} 中的var不能再用

//例:用函数的方式交换两个数的值
//inout  指针  &
//函数的形参默认是常量,也就是函数的形参默认都是使用let声明,即使程序没有指定let,Swift也会自动
//添加let声明形参
//值类型 引用类型
//对于Swift的值类型,当程序执行变量赋值参数传递时,程序传递的只是[副本],因此在函数体内无论做了
//哪些修改对参数本身都不会产生任何影响
//对于Swift的引用类型,当程序执行变量赋值参数传递时,程序传递的是引用类型的[实体],因此在函数中
//对其进行的任何操作都会对其进行修改
func swap1(inout a:Int,inout b:Int){
    let temp = a
    a = b
    b = temp
}
var a=1,b=2
swap1(&a, b: &b)
print(a)
print(b)


