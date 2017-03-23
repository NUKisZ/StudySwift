//
//  main.swift
//  循环
//
//  Created by NUK on 16/6/18.
//  Copyright © 2016年 NUK. All rights reserved.
//

import Foundation

func Scanf()->String{
    let stdin = NSFileHandle.fileHandleWithStandardInput()
    var input = NSString(data: stdin.availableData,encoding:NSUTF8StringEncoding) as! String
    input.removeAtIndex(input.endIndex.predecessor())
    return input
}


//switch还支持元组来匹配多个值,case后面的元组既可以是单独的值,也可以是
//特定的

#if false
var somePoint = (1,0)
switch somePoint{
case(0,0):
    print("(\(somePoint.0),\(somePoint.1))位于原点")
case(_,0):
    print("(\(somePoint.0),\(somePoint.1))位于x轴上")
case(0,_):
    print("(\(somePoint.0),\(somePoint.1))位于y轴上")
case(0..<Int.max,0..<Int.max):
    print("(\(somePoint.0),\(somePoint.1))位于第一象限")
case(Int.min..<0,0..<Int.max):
    print("(\(somePoint.0),\(somePoint.1))位于第二象限")
case(Int.min..<0,Int.min..<0):
    print("(\(somePoint.0),\(somePoint.1))位于第三象限")
case(0..<Int.max,Int.min..<0):
    print("(\(somePoint.0),\(somePoint.1))位于第四象限")
default:
    break
}
#endif

//switch case 绑定值

#if false
let score=59
switch score{
case 90...100:
    print("A")
case let grade:
    print("您输入的值有误")
}
#endif
//在这里switch允许将匹配该case块的switch表达式的值绑定到变量
//或常量,这样程序既可以在case块中通过该变量或常量来访问switch
//表达式的值
//PS:switch应用了case绑定值那么就不需要default块

//1.直接在不同的case块中访问switch表达式,即在switch中判断元组,来获取该坐标
//2.通过值绑定讲switch表达式即switch判断元组的x,y坐标绑定给一个临时的变量或常量

#if false
let somePoint = (2,7)
switch somePoint{
case(0,0):
    print("(\(somePoint.0),\(somePoint.1))位于原点")
case(var x,0):
    print("(\(somePoint.0),\(somePoint.1))位于x轴上")
case(0,var y):
    print("(\(somePoint.0),\(somePoint.1))位于x轴上")
case(var x,var y):
    x=10
    print("该点的坐标是(\(x),\(y))")
}
    //当前这个例子,var x,var y都是临时变量,用来接收元组传进来的值,当前这两个变量可以在
    //switch中进行修改
    //程序中绑定let型或是var型都是可以的,到使用中取决于业务逻辑
    //switch更改值var  不想更改用let
    
    //case...where子句
    //where子句用来给case增加额外的判断条件
    //例如
let b=15
switch b{
case b where b<=18:
    print("taixiao")
case b where b>=19 && b<=22:
    print("OK")
default:
    break
}
#endif


//循环
/*
1.while{}循环
2.repeat{}while循环
3.for{}循环在Swift3.0以后将被取消
4.for...in循环
*/

//while循环
/*
格式:
while 循环条件[表达式]{
执行语句;
循环变量的自增或自减[使循环趋于结束]
}
循环条件:表达式,每次执行循环之前都会判断表达式的真假,一般是由关系运算符组成的式子
偶尔可见关系和逻辑共同组成的表达式
执行过程:当程序执行到while循环时首先会判断while后面的循环条件的真假.如果条件为真
那么久执行循环体内的循环语句,然后循环变量进行自增或自减,接着继续判断循环
条件的真假,知道循环条件为假时,整个while循环结束.
*/
/*打印0~10,不包括10*/
#if false
var a=0
while a<10{
    print(a)
    a+=1
}
#endif

/*
练习:1.打印10~0
2.打印100以内所有的奇数偶数和3的倍数(不包括100)
3.计算1~100之间的所有整数之和
4.计算5的阶乘
*/
#if false
var i=0
while i<=10{
    print(10-i)
    i+=1
}
#endif

#if false
var n=1
while n<100{
    if n%2 != 0{
        print("\(n)是奇数")
    }
    if n%2 == 0{
        print("\(n)是偶数")
    }
    if n%3 == 0{
        print("\(n)是3的倍数")
    }
    n+=1
}
    
#endif

#if false
var sum=0
var i=1
while i<=100{
    sum+=i
    i+=1
}
print(sum)
#endif

#if false
var num=1
var i=1
while i<=5{
    num*=i
    i+=1
}
print(num)
#endif

//repeat-while
/*
格式:
repeat{
执行语句
循环变量的自增自减
}while 循环条件
//PS:注册页面
执行过程:当程序执行到repeat的时候会先执行{}里面的执行语句,然后执行循环变量的自增或自减
最后才会去判断while后面的循环条件的真假,如果真就继续循环,如果假结束循环

repeat while 和 while 的区别
repeat while会先执行一次,然后再去判断循环条件的真假
while先判断循环条件的真假
*/

//例:
#if false
var i=0
var j=0
repeat{
    print("i=\(i)")
    i+=1
}while i<10
    
while j<10{
    print("j=\(j)")
    j+=1
}
#endif

/*练习
1.10~1
2.随机10以内的数,计算该数的阶乘
3.求1!+2!+3!

*/
#if false
var i=0
repeat{
    print(10-i)
    i+=1
}while i<10
#endif

#if false
var r=Int(arc4random()%10)
var num=1
var s=1
if r==0{
    print("0的阶乘是1")
}else{
    repeat{
        s*=num
        num+=1
    }while num <= r
    print("\(r)的阶乘是\(s)")
}
#endif

#if false
var i=1
var num=1
var s=1
var sum=0
repeat{
    s*=num
    num+=1
    sum+=s
}while num<=3
print("1!+2!+3!=\(sum)")
#endif

//for 循环
/*
for循环(2.2以后将移除这种用法)
格式:
for 循环变量赋初值;循环条件;循环变量的自增或自减{
执行语句
}
执行过程:当程序执行到for时,先执行循环变量赋初值,然后判断循环条件,如果为真就执行{}中的执行语句
并计算循环变量的自增或自减,然后再去判断循环条件,直到循环条件为假,结束循环
*/

//死循环 while true

//Swift中的 for in 循环
/*
格式:
for 常量|_ in 字符串|范围|集合{
执行语句
}
说明一下:
for-in 循环中的常量无需声明,for-in循环中的常量会在每次循环开始时自动被赋值,
只要将它半酣在for-in循环的声明中即可,隐式声明该变量,无需使用let关键字声明
如果循环体内无需访问正在遍历的元素的值,程序可以使用(_)代替常量来忽略访问元素的值
*/

//1~10
#if false
for i in 1...10{
    print(i)
}
for _ in 1...10{
    print("@", separator: ",", terminator: "1")
}
#endif

/*计算前20位之和 1  1  2  3  5  8  13 ...
*/

#if false
var sum=2
var a1=1,a2=1,a3=2
var temp=0
print(a1)
print(a2)
for i in 3...20{
    a3=a2+a1
    temp=a2
    a2=a3
    a1=temp
    sum+=a3
    print(a3)
}
print("前20位之和是:\(sum)")
#endif

/*输入一个数判断这个数是几位数*/

#if true
print("请输入一个整数:")
var num=Int(Scanf())!
var n=0
if num==0{
    print("0是1位数")
}
for _ in 1..<Int.max{
    if num != 0 {
        num=num/10
        n+=1
    }else{
        break
    }
}
print("num是\(n)位数")
#endif

#if false
var num=Int(Scanf())!
var gewei=0
for _ in 1..<Int.max {
    if num != 0 {
        gewei = num%10
        num = num/10
        print(gewei)
    }else{
        break
    }
}
#endif

//break结束当前循环,在某些时候,我们需要在某种特定的情况下,强行终止循环,而不需要等到
//循环结束才退出,就可以使用break来强行终止循环

//continue:跳过本次循环
//continue和break有些相似,区别在于continue只是跳过本次循环接着开始下一次循环,而
//break是完全终止循环
//计算100到200之间不能被3整除的数

//Swift中提供了一种[循环标签],循环标签可以添加在循环的前面
//例子

outer:for i in 1..<5{
    for j in 1..<3{
        print("i的值是:\(i),j的值是:\(j)")
        if j == 1 {
            continue outer
        }
    }
}

//循环变量j的值将无法超过1...

//Swift中添加了一个新特性 guard语句
/*
guard语句与if语句有点类似,都用于表达式条件进行判断,根据表达式执行分支,与if语句不同的是
guard语句总是有一个else代码块
当guard条件为false时,程序就会执行guard语句的else语句块,使用guard需要在其中配合使用return,
break,continue或throw语句跳出guard语句

*/

//例子
for i in 2...10{
    print(i)
    guard i<5 else{
        print("i已经不小于5")
        break
    }
}
