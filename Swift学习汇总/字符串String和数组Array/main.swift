//
//  main.swift
//  字符串String和数组Array
//
//  Created by NUK on 16/6/18.
//  Copyright © 2016年 NUK. All rights reserved.
//

import Foundation

/*----Swift的String和Array----*/

//面向协议和代理编程
/*
string代表字符串,Swift中的String类型是轻量级而且易读,字符串中的每个字符
都是独立的Unicode字符组成,String也提供了访问这些Unicode字符的方法,其实在
Swift中可以把字符串理解成Character类型值的集合,因为一个字符串是由多个字符
组成的串,也就是字符串可以用Character进行读取
*/

//用双引号括起来既可以成为一个字符串
//var str="a"   //字符串
//var str:Character="a"
//1.声明并赋值一个字符串
var str1 = "Swift"
var str2:String = "easy"
//声明一个空字符串
var str3 = ""
//通过调用String()构造器来初始化一个字符串
var str4 = String()
//当前初始化的两个字符串均为空,并且完全等价
//既然Swift允许字符串为空,那么我们就可以来判断当前字符串是否为空
//isEmpty 用来判断字符串是否为空,当前返回值是一个Bool值
if str3.isEmpty{
    print("空字符串")
}
//在Swift中String提供了一种简单易用的运算符"+",这个运算符可以简单地将两个
//字符串进行拼接
let str5=str1+" "+str2+"!"
print(str5)
//在Swift中连接起来的字符串是在编译阶段就将他们连接起来
let str6="hello"+"Swift"
let str7="helloSwift"
//虽然我们看到的两行代码有区别,但是由于Swift编译器实在编译阶段将这两个字符串
//拼接起来的,所以Str6和Str7完全相同

//PS:Swift中的String和Foundation框架下的NSString类是可以无缝连接,
//NSArray,NSDictionary

//在Swift中字符串存在可变和不可变的说法,可变字符串可以被追加,修改,替换等操作
//而不可变字符串不能进行上述操作,Swift可以通过let,var体现可变不可变

var str8 = "swift"
str8+=" is a good language"
print(str8)
//一般来说,let声明的不可变字符串,我们会应用于接口,地址

//字符串的基本操作
//String提供了character属性,通过当前属性可以查看字符串的字符及个数,这个个数
//可以理解为字符串的长度

var str10 = "abcdefg"
for ch in str10.characters{
    print(ch)
}
print(str10.characters.count)


//Swift中提供了一种String.Index类型,该类型用于代表单个字符处于String中的
//下标,需要说明的是:由于不同字符在字符串中需要不同的内存大小进行存储,因此不能
//直接通过简单的数字作为String下标
//以下是错误的取值方式:str[1]
//Swift提供了一种方式叫做startIndex和endIndex
//startIndex属性可以获取String中第一个字符的引索
print("第一个字符是:\(str10[str10.startIndex])")
//print("最后一个字符是:\(str10[str10.endIndex])")
//这样写是错的,因为endIndex属性返回的是字符串中最后一个下标\0
//如何取出最后一个字符呢?Swift提供了predecessor()方法来访问该下标的前一个下标
print("最后一个字符是:\(str10[str10.endIndex.predecessor()])")
//可以通过successor()属性来访问该下标的后一个下标
print("第二个字符是:\(str10[str10.startIndex.successor()])")
//可以通过advancedBy(_:)来访问指定的下标
print("访问第四个字符:\(str10[str10.startIndex.advancedBy(3)])")
print("访问倒数第三个字符:\(str10[str10.endIndex.advancedBy(-3)])")
//既然能通过Index访问字符串中的指定字符,那么我们也可以通过遍历的方式来访问
for index in str10.characters.indices{
    print(str10[index])
}
//以上这些就是通过下标来访问当前字符串中的字符所有方式

//我们要对字符串进行,添加,插入,删除,替换等操作

var str11="NUK教育"
//追加字符
let dot:Character="."
str11.append(dot)
print(str11)
//在字符串中追加
let com="com"
str11.appendContentsOf(com)
print(str11)
//在指定位置插入一个字符
str11.insert("!", atIndex: str11.endIndex)
print(str11)
str11.insert("?",atIndex: str11.startIndex.advancedBy(9))
print(str11)
//在指定的位置插入字符串
str11.insertContentsOf("你好".characters, at: str11.startIndex.advancedBy(10))
print(str11)
//删除指定位置的字符
//说明一下:Swift中的String弱势要按照下标的方式删除或插入部分数据,分为startIndex和endIndex,startIndex
//下标是从0开始,endIndex从-1开始
str11.removeAtIndex(str11.endIndex.advancedBy(-3))
print(str11)
//范围性删除
str11.removeRange(str11.endIndex.advancedBy(-6)...str11.endIndex.advancedBy(-4))
print(str11)
//替换指定范围的字符串
str11.replaceRange(str11.startIndex...str11.startIndex.advancedBy(3), with: "全世界")
print(str11)
////清空字符串
//str11.removeAll()
//print(str11)

//比较的方法 ==
//判断前缀和后缀
let str12="www.qq.com"
let str13="www.360.com"
if str12 == str13{
    print("他们是融洽的")
}else{
    print("企鹅大战360")
}
//判断字符串的前缀
if str12.hasPrefix("www"){
    print("\(str12)是以www开头的")
}
//判断结尾
if str13.hasSuffix("com"){
    print("\(str13)是以com结尾的")
}

//获取字符编码
/*
我们一般常用的字符编码是UTF-8(汉字),Swift提供了UTF-16和万国码Unicode
*/
//UTF8的编码
print(str11)
for UTF8Code in str11.utf8{
    print("\(UTF8Code)",terminator:" ")
}
print("\n")
for UTF16Code in str11.utf16{
    print("\(UTF16Code)",terminator:" ")
}
print("\n")
for Unicode in str11.unicodeScalars{
    print("\(Unicode.value)",terminator:" ")
}


/*-----Array------*/
/*
Swift中提供了数组,数组是编程语言中常见的一种数据结构,可以用于存储多个数据,每个数组元素
存放一个数据,通常可以通过数组元素的下标来访问数组元素,包括为元素赋值和取出元素的值
*/
//创建数组
//使用泛型语句,格式为:
//Array<类型>,此处的尖括号是泛型的语法
//使用简化语法,数组类型的语法格式为:[类型]
var array1:Array<Int> = Array<Int>()
var array2:[Int] = [Int]()
var array3:[String] = Array()

//创建指定元素个数和元素的值

array1 = Array<Int>(count: 3, repeatedValue: 1)
array2 = [Int](count: 3, repeatedValue: 2)
array3 = Array(count: 3, repeatedValue: "3")
print(array1)
print(array2)
print(array3)

//指定多个元素创建数组,并赋值
array1 = Array<Int>(arrayLiteral: 1,2,3,4,5)
array2 = [Int](arrayLiteral: 3,4,5)
array3 = Array(arrayLiteral: "3","4","5")

//在Swift中可以使用更加简捷的方式来创建数组
var array4:[String]=["♠️","❤️","♦️","♣️"]
//让编译器推断类型
var array5=[1,2,3,4,5]
//创建一个简单的空数组
var array6:[Int]=[]
//Swift中的数组也提供了Index的方法,可以通过下标的方式来取值,下标从0开始到长度-1


//数组中提供了count属性访问数组的长度
for i in 0..<array5.count{
    print(array5[i])
}

//在数组中同样可以使用startIndex和endIndex的方式来访问数组
//在数组中endIndex返回的数组最后一位下标.其值和array.count的值是一样的,所以不能通过
//endIndex直接访问数组的最后一个元素
print(array5[array5.startIndex])
print(array5[array5.startIndex.successor()])
print(array5[array5.endIndex.advancedBy(-2)])

//我们是可以通过for...in的方式来遍历数组的

var lol:[String]=["皇子","维恩","德玛","寒冰"]
//快速迭代,不允许赋值
for lolname in lol{
    print(lolname)
}
//当我们需要每个数据项的值或索引值时,我们可以使用enumerate()快速枚举;返回一个由数据项
//索引值和数据值组成的元组
for (index,value) in lol.enumerate(){
    print("第\(index)下标的值是\(value)")
}

//Swift中的数组也存在可变与不可变,let var.

//添加数组元素
//该方法每调用一次,程序就会在数组的最后添加一个元素,并且元素的长度会自动加1
var movie = ["X战警"]
movie.append("魔兽世界")
movie.append("钢铁侠大战金刚葫芦娃")
print(movie)
//Swift还可以通过"+"进行添加,添加的时候需要注意,务必要和数组的数据类型匹配
movie += ["奥特曼打小怪兽"]
print(movie)

//插入元素
//该方法每调用一次,程序会在指定的位置插入一个元素,数组的元素会自动加1,单该方法的
//第二个参数不能超过数组长度,如果等于数组长度,跟append效果一样

var language = ["Swift","OC"]
language.insert("c", atIndex: 0)
print(language)

//数组的范围
var book = ["语文","数学","英语","化学","物理","生物"]
//获取数组中1到3的元素
let subRange = book[1...3]
print(subRange)
//将数组中1到4元素替换成 英语,地理,政治
//当当前元素赋值少于原数组元素个数时,会自动减少数组的长度.如果多余原数组元素个数,会增加长度
book[1...4]=["英语","地理","政治","英语","地理","政治"]
print(book)

//用范围的方法来清空数组
book[0..<book.count]=[]
//另外一种替换方法
var west=["悟空","八戒","唐僧","沙僧"]
west.replaceRange(0...2, with: ["猴子","猪头","和尚"])
print(west)

//删除元素
var animals = ["鼠","牛","兔","狗","猪"]
animals.removeAtIndex(Int(arc4random()%5))
print(animals)

//删除数组中最后一个元素
animals.removeLast()
print(animals)

//删除数组中第一个元素
animals.removeFirst()
print(animals)

//删除数组中所有元素
animals.removeAll()


//Switf可以存储不同类型元素
var arr1=["a",1,1.2,true] //默认NSObject
var arr2:[AnyObject] = ["a",1,1.2,true]

//数字排序
//1.选择
/*
选择排序是指在排序时,每一次从待排序的数组中选出最小或最大的一个元素,存放
在数组的起始位置,知道全部待排序的数组元素排序完成
选择原则:将数组中第一个元素和后续的元素进行比较,小的在大的前面(升序)
选择结果:每次执行完选择排序,可以把数组中一个数放到正确的位置
*/
//升序为例
//var arr =
//[9,6,4,3,1]
//[6,9,4,3,1]
//[4,9,6,3,1]
//[3,9,6,4,1]
//[1,9,6,4,3]

//[1,9,6,4,3]
//[1,6,9,4,3]
//[1,4,9,6,3]
//[1,3,9,6,4]

//[1,3,9,6,4]
//[1,3,6,9,4]
//[1,3,4,9,6]

//[1,3,4,9,6]
//[1,3,4,6,9]


var arr3=[9,6,4,3,1]
for i in 0..<arr3.count-1{
    for j in i+1..<arr3.count{
        if arr3[i]>arr3[j] {
            let temp = arr3[i]
            arr3[i]=arr3[j]
            arr3[j]=temp
        }
    }
}
print(arr3)


//2.冒泡

/*
冒泡排序是指在排序时,比较两个相邻的元素的值,将小的或者大的排列在最前面或最后面
冒泡的原则:将数组中相邻的成员进行比较,小数放到大数后面
冒泡结果:没执行一次冒泡,数组中会有一个数字放到正确的位置上

*/
//升序为例
//var arr =
//[9,6,4,3,1]
//[6,9,4,3,1]
//[6,4,9,3,1]
//[6,4,3,9,1]
//[6,4,3,1,9]

//[6,4,3,1,9]
//[4,6,3,1,9]
//[4,3,6,1,9]
//[4,3,1,6,9]

//[4,3,1,6,9]
//[3,4,1,6,9]
//[3,1,4,6,9]

//[3,1,4,6,9]
//[1,3,4,6,9]

//冒泡
var arr4 = [9,6,4,3,1]
for i in 0..<arr4.count-1{
    for j in 0..<arr4.count-1-i {
        if arr4[j]>arr4[j+1]{
            let temp = arr4[j]
            arr4[j]=arr4[j+1]
            arr4[j+1]=temp
        }
    }
}
print(arr4)

//Swift系统排序
var arr5 = [9,6,4,3,1]
print(arr5.sort())


//练习
/*
1.在数组中存储一下数据:
www.baidu.com
w1w.ooo.com
www.qianfeng.com
ww2.xxx.cc
k5.cb
判断当前数组中哪些是网址,标准必须满足"www...com"

2.声明一个数组成员10个.值是随机值,用冒泡排序和选择排序分别排序,降序排列
*/

#if true
var arr6:[String] = ["www.baidu.com","w1w.ooo.com","www.qianfeng.com","ww2.xxx.cc","k5.cb"]
for i in 0..<arr6.count {
    if arr6[i].hasPrefix("www") && arr6[i].hasSuffix("com") {
        print("\(arr6[i])是合法的网址")
    }
}
#endif

#if true
    
#endif

