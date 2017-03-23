//
//  运算符和分支.swift
//  Swift学习汇总
//
//  Created by NUK on 16/6/18.
//  Copyright © 2016年 NUK. All rights reserved.
//

import Foundation
/*-----运算符-----*/
//关系运算符
/*
> >= < <= == !=
===判断对象相等
!==判断对象不相等
返回Bool值  true false
let a = 7
let b = 3
关系运算符组成的式子称为关系表达式
PS:关系运算符可以进行元祖的比较
(1,"bge")<(2,"zhige")  true 只要比较出一个有真假,就默认这个值
(1,"bge")>(2,"zhige")  ???? 字母怎么比较大小?  Int String Unicode=>ASC||
*/
//逻辑运算符(逻辑表达式)  &&(与,并且)  ||(或)  !(非)
//&& --->同时为真才为真   ||只要有一个为真就为真   !非真为假,非假为真
//  ||(如果第一个表达式为真,程序就不在进行判断第二个表达式的真假,注意必须满足的表达式放在前面)
//逻辑表达式的值:true false
//练习:
/*
1.参加少年运动会的运动员的年龄在13到17之间   age>=13 && age<=17
2.动物园年龄小于12,大于65的免票   age<=12 || age>=65
3.年龄不小于16岁的才可以观影     age>=16 <==> !(age<16)
*/

/*1.判断下列表达式的真假
//A~Z  65~90  a~z  97~122
(100>3)&&("a">"c")  false
(100>3)||("a">"c")  true
!(100<3)            true

构造一个表达式来表示下列条件
number>=90 && number<100
ch!="q" && ch!="k"
(number>=1 && number<9) && number!=5
!(number>=1 && number<=9)

判断一个字符是空格,是数字,是字母
let ch
ch=" "  空格
ch>="0" && ch<="9"  数字
(ch>="a"&&ch<="z")||(ch>="A"&&ch<="Z")  字母

有3个整数a,b,c,判断谁最大,列出所有的可能
a>=b&&a>=c a最大
b>=a&&b>=c b最大
c>=a&&c>=b c最大

let year
(year%4==0)&&(year%100!=0)||(year%400==0)

*/
/*
复合运算符 += -= *= /= %=
var a=7,b=3
a+=b  a=a+b
a-=b  a=a-b
a*=b  a=a*b
a/=b  a=a/b
a%=b  a=a%b

*/
//Swift2.2版本以后 ++ 和 --不再提供使用,以后碰到自身+1或-1的话就需要使用复合运算符完成
//由 i += 1   i -= 1 代替
//++i i++ --i i--不再使用


/*-----分支-----*/

//为什么要使用分支,使用分支的条件是什么
//当程序面临选择的时候,每一种玄子对应一种结果我们就可以使用分支
//使用分支的条件
/*
1.当程序面临选择,关键字的后面
2.选择下面对应着相应的操作  --->{}
*/
//Swift常见分支
//if分支   switch-case
//if单分支  if-else if-else if if-else的嵌套
/*if单分支*/
/*
格式:
if 表达式 {
执行语句(操作)
}
表达式:一般由关系表达式和逻辑表达式组成
执行过程:当程序执行到if是,首先判断表达式的真假,如果表达式的值为真,那么就会执行{}里面的
执行语句,然后整个if结束,如果表达式的值为假,那么就不会执行{}中的执行语句,if会结束
*/
func Scanf()->String{
    let stdin = NSFileHandle.fileHandleWithStandardInput()
    var input = NSString(data: stdin.availableData,encoding:NSUTF8StringEncoding) as! String
    input.removeAtIndex(input.endIndex.predecessor())
    return input
}

//let a=3
//if a<5 {
//    print("Bge")
//}
//面临一种选择的时候

//if练习
/*
1.判断两个不等数,输出较大的数
2.判断三个不等数,输出其中较大的数
3.判断两个不等数,按从小到大的顺序输出
4.判断三个不等数,按从小到大的顺序输出
*/
#if false
var a=10
var b=20
if a>=b{
    print(a)
}
else{
    print(b)
}
#endif

#if false
var a=10
var b=20
var c=30
var max=0
if a>=b{
    max=a
}
else{
    max=b
}
if max<=c{
    max=c
}
print(max)
#endif

#if false
var a=10
var b=20
if a>=b{
    print(b,a)
}
else{
    print(a,b)
}
#endif

#if false
print("请输入三个不等数:")
var a=Int(Scanf())!
var b=Int(Scanf())!
var c=Int(Scanf())!
if a>b && a>c{
    if b>c {
        print(c,b,a)
    }
    else{
        print(b,c,a)
    }
}
if b>a && b>c{
    if a>c {
        print(c,a,b)
    }
    else{
        print(a,c,b)
    }
}
if c>b && c>a{
    if b>a {
        print(a,b,c)
    }
    else{
        print(b,a,c)
    }
}
#endif

/*---if-else---*/
/*
if 表达式{
执行语句1
}else{
执行语句2
}
执行过程:当程序执行到if时,首先会判断表达式的值的真假,
如果值为真执行执行语句1,如果为假,执行执行语句2
*/
//
//let a = 3
//if a<5{
//    print("zhige")
//}else{
//    print("bge")
//}

//练习
/*
1.打印一个数的绝对值
2.判断一个数能否同时被3和5整除.能输出yes,不能no
3.判断两个数的大小,用大数减小数
4.输入年部分判断是否是闰年,如果是打印,如果不是输出不是闰年
*/
#if false
var a=Int(Scanf())!
if a<=0{
    a = -(a)
}
print(a)
    
#endif

#if false
var a=Int(Scanf())!
if (a%3==0)&&(a%5==0){
    print("YES")
}else{
    print("NO")
}
#endif

#if false
var a=Int(arc4random()%100+1)
var b=Int(arc4random()%100+1)
if a>b{
    print("\(a)-\(b)=\(a-b)")
}else{
    print("\(b)-\(a)=\(b-a)")
}
#endif

#if false
var year=Int(arc4random()%2000+1000)
if (year%4==0)&&(year%100 != 0)||(year%400==0){
    print(year)
}else{
    print("\(year)不是闰年")
}
#endif



//条件运算符 ?:(三目运算符)
//格式  表达式1?表达式2:表达式3
//执行过程:首先程序会判断表达式1的真假,如果表达式1的值为真,那么就返回表达式2的值,
//如果表达式1的值为假,返回表达式3的值

//
#if false
let a = 3
a<5 ? print("饺子") : print("包子")
#endif

#if false
var a=2,b=3,c=1,temp=0
temp = a>b ? a : b
temp = temp>c ? temp : c
print(temp)
#endif


/*--if-else if--*/
/*
格式:
if 表达式1{
执行语句1
}else if 表达式2{
执行语句2
}
}else if 表达式3{
执行语句3
}else{
执行语句4
}

执行过程:当成与执行到if--else if--时,先判断表达式1的值,如果值为真,执行执行语句1结束,
如果值为假,那么就会执行后续的else if的表达式,直到为真.如果都不为真,就会执行
最后一个else中的执行语句
*/

#if false
let age = Int(arc4random()%100)
if age>=0 && age<=18{
    print("B哥说:太小")
}else if age>=19 && age<=22{
    print("给我")
}else if age>=23 && age<=27{
    print("hehe")
}else if age==28 {
    print("hao")
}else{
    print("buyao")
}
#endif

//练习
/*
1.输出一个百分制成绩,要求输出成绩的等级A(90以上),B(80~90),C(70~80),D(60~70),E(70以下)
2.随机两个整数,打印他们的大小关系
*/

#if false
var score=Int(arc4random()%100)
if score>=90 {
    print("A(score=\(score))")
}else if score>=80{
    print("B(score=\(score))")
}else if score>=70{
    print("C(score=\(score))")
}else if score>=60{
    print("D(score=\(score))")
}else{
    print("E(score=\(score))")
}
#endif


#if false
var a=Int(arc4random()%100)
var b=Int(arc4random()%100)
if a>b {
    print("\(a)>\(b)")
}else if a<b{
    print("\(a)<\(b)")
}else{
    print("\(a)=\(b)")
}
#endif


/*---if else的嵌套---*/

//PS:
//1.不要让我等   2.不要让我烦   3.傻瓜式操作

/*---Swift可选类型---闭包---*/

//在任何类型的后面紧跟[?]即可代表可选类型,可选类型的变量可以用于处理"值缺失的情况"
//一般来说可选类型可以应用于不明确值得时候.
//例子
var str="hhh"
//这里不能直接转换,因为当前字符串无法转化成整型
//var num:Int=Int(str)
//当我们声明可选类型的时候,默认存在一个缺失值nil,也就是说如果转换失败就会返回nil,
//而非转化成整型
var num:Int?=Int(str)  //nil
//我们不明确类型时编译器默认推断为可选类型
var num1 = Int(str)

//需要注意的是Swift中nil代表的是缺省值,而某些语言中nil代表的是一个不存在的指针对象
//只有可选类型才能接收nil,非可选类型不能接收nil

//强制解析
/*
Int?类型与Int类型是不同的数据类型,程序不能直接把Int?类型的变量或常量当成Int类型的
变量或常量使用,为了获得可选类型的变量或常量的[实际]存储值,可以在变量或是常量后面添加
一个[!]表明,已知该可选变量的值,提出去其中的值,这种添加[!]的方法叫做强制解析
*/
#if false
let str2:String? = "swift"
let str1:String = str2!
let str3:String?
let str4:String=str3?
#endif

#if false
let str1:String?=nil
let str2:String
if str1 != nil{
    str2=str1!
}
#endif

//可选绑定
/*
可选绑定可以用于判断类型的变量或常量是否有值,如果可选类型的变量或常量有值就
赋值给另一个临时变量或常量
可选绑定

*/

#if false
let str1:String! = "org"
if let book=str1{
    print("str1的值是\(book)")
}else{
    print("当前值是nil")
}
#endif

//隐式可选类型
//在Swift中除在已有类型后面添加[?]以外,还可以添加[!]来表示可选类型
//?和!表示的可选类型有什么区别?
/*
当程序需要获取[?]类型的变量或常量时,程序必须在变量名后面添加!后缀进行强制解析
当程序需要获取[!]类型的变量或常量时,无需在变量后面添加[!],因为Swift会自动的
进行隐式解析
*/
//合并(空空)运算符  ??
//格式: a ?? b
//??是专门用来判断可选类型变量的值是否为nil,如果不为nil,程序返回可选变量所包含的值
//如果为nil,程序返回??后面的值
//需要注意的是b的类型必须和a所包含的类型一致

#if false
let defaultName="孙悟空"
let name:String? = nil
print(name ?? defaultName)
    //name ?? defaultName  <==>  name != nil ? name! : defaultName
#endif

/*---switch分支---*/
/*
格式:
switch(常量[表达式]){
case 常量1:
执行语句1
break
case 常量2:
执行语句2
break
case 常量3:
执行语句3
break
...
defualt:
执行语句
break
}

执行过程...

*/
/*
特别注意:
在Swift中不存在隐式贯穿,所以break关键字可以省略不写.
如果你想在Swift中使用贯穿,你需要使用一个关键字fallthrough
在Swift中如果使用fallthrough贯穿不会检查case后面块的匹配条件

*/
//let a=1
//switch a{
//case 1:
//    print(a)
//    fallthrough
//case 2:
//    print(a)
//default:
//    break
//}


/*
练习:
1.编写一个程序实现如下功能:输入1,2,3,4,5,6,7,输出对应的星期的英文单词
2.输入一个月数,输出其对应有多少天,不考虑闰年,将天数输出
*/

#if false
var weekday=Int(Scanf())!
switch weekday{
case 1:
    print("Monday")
    break
case 2:
    print("Tuesday")
    break
case 3:
    print("Wednesday")
    break
case 4:
    print("Thirsday")
    break
case 5:
    print("Friday")
    break
case 6:
    print("Saturday")
    break
case 7:
    print("Sunday")
    break
    
default:
    print("输入有误")
    break
}
#endif


#if false
var month=Int(Scanf())!
if month==2{
    print("2月共有28天")
}else if (month==1||month==3||month==5||month==7||month==8||month==10||month==12){
    print("\(month)月共有31天")
}else{
    print("\(month)月共有30天")
}
    
#endif


//在Swift中switch语句功能非常强大,除了上述这些简单功能,还可以使用范围匹配和元祖
//范围运算符
/*
1.闭范围运算符 [...]
闭范围运算符a...b用于定义一个a~b(包括a,b边界值)的所有范围的值
0...5 --->0,1,2,3,4,5
对于闭范围运算符而言,a不能大于b,否则程序运行时将会崩溃
半开范围运算符[..<]
半开范围运算符a..<b,用于定义一个从a到b(包括a,不包括b)的所有的范围,a不能大于b
0..<5--->0,1,2,3,4

*/

//例子
/*输出一个百分制成绩,要求输出成绩的等级A(90以上),B(80~90),C(70~80),D(60~70),E(70以下)*/

#if true
var score=Int(Scanf())!
switch score{
case 90...100:
    print("A")
    break
case 80...89:
    print("B")
    break
case 70...79:
    print("C")
    break
case 60...69:
    print("D")
    break
default:
    break
}
#endif
