//
//  main.swift
//  错误处理
//
//  Created by NUK on 16/6/24.
//  Copyright © 2016年 NUK. All rights reserved.
//

import Foundation

/*
错误处理

Swift提供了强大的错误处理机制,这种错误处理机制使得程序在运行中可以对错误进行捕捉,传输,操作

抛出错误:
Swift2.0提供了一个名为ErrorType的空协议,遵守该协议的值代表Swift抛出的错误,一般来说,Swift推荐使用遵守该协议的枚举来代表错误,该枚举类型的枚举实例则代表不同的错误情形,而且枚举的关联值还可以提供额外信息,用于表示某些错误的具体详情
*/
//定义一个用户输入年龄的函数,此时用书输入的值可能超出范围:

enum AgeError:ErrorType{
    case TooOld
    case TooYoung(age:Int)
}
/*
当前这个枚举遵守ErrorType协议,并且定义了两个枚举值,其中TooYoung还带有关联值
Swift中提供我们一个关键字 throw 来抛出错误
*/
//throw AgeError.TooOld
//throw AgeError.TooYoung(age: -1)

//Swift就提供了如下4中错误处理方法
/*
1.将错误传播给调用的函数代码
2.使用do-catch捕获处理错误
3.将错误转换成可选值
4.将错误失效
*/

//1.将错误传播给调动的函数代码
func scanfAge(age:Int)throws{
    // age必须大于等于10,否则将会引发错误
    guard age >= 10 else{
        throw AgeError.TooYoung(age: age)
    }
    //age必须小于等于80,否则将会引发错误
    guard age <= 80 else{
        throw AgeError.TooOld
    }
}
/*
如果像想把错误传递给函数,需要在函数的后面添加[throws]关键字,那么标识了throws的函数称为[throwing]函数,它明确表达函数可能在其内部抛出错误,并将出错传递给函数的代码
*/
//如果想调用throws函数需要在前面加上try
try scanfAge(50)

//2.do-catch 错误捕捉

/*
如果程序打算捕捉并处理错误,可以使用Siwft提供的do-catch语句,do-catch语句尝试运行一段可能会导致错误的代码,如果do语句块中的代码抛出一个错误,则这个错误会与catch开的模式进行匹配,找到匹配后的catch块之后,对应的catch块来进行错误处理
*/
do{
    try scanfAge(50)
}catch AgeError.TooYoung(var age){
    print("年龄太小:\(age)")
}catch AgeError.TooOld{
    print("年龄太老")
}

do{
    try scanfAge(1)
    //catc会捕捉所有错误信息
}catch{
    //错误被绑定一个隐式的局部变量error
    print(error)
}
/*
当程序抛出错误被catch语句捕捉之后,该错误将会不在对外传播,因此,如果函数中缪航导致的错误代码可以使用do-catch语句进捕捉,那么需要将函数声明称throws
*/

//将错误转换为可选值
/*
当throwing函数具有返回值时,Swift还允许使用try?关键字来调用函数,使用try?调用钓友返回值throwing函数时会得到一个可选值

如果调用函数时没有出现错误,则返回正常得到该函数的返回值
如果调用函数时出现错误,将返回一个nil
*/
func foo(name:String)throws -> Int{
    if name.characters.count > 10 || name.characters.count < 3 {
        //iOS中的错误NSError
        throw NSError.init(domain: "name参数不符合要求", code: -1, userInfo: nil)
    }
    return name.characters.count
}

let c1 = try? foo("ab")
print(c1)//nil
let c2 = try? foo("abcde")
print(c2!)//Optional(5)

let str = "Swift to"
if let c3 = try? foo(str){
    print("str的长度\(c3)")
}
/*
上面程序定义而来一个带有throwing函数,因此执行函数时可能出现错误,如果在某个函数内使用try关键字调用该函数,则可能引发错误传播,因此使用try调用函数代码应该放到do-catch里面
我们如果使用try?关键字调用函数,将会引发错误传播,如果程序没有错误,那返回可选类型的值并进行强制解析,反之返回nil
*/

//错误失效
/*
在某些时候,程序已经知道调用某个throwing函数不会引发错误,此时可以考虑使用try!关键字来调用当前函数,try!关键字会使函数的错误失效,让throwing函数的错误不会对外传播

如果使用try!关键字调用throwing函数出现错误,那么程序会直接崩溃,且这个错误不会对外传播,即使使用do-catch也不能捕捉到try!关键字调用throwing函数出现的错误

*/
let c4:Int = try! foo("Swift")
//不可以
//do{
//
//    let  c5 = try! foo("xy")
//}catch{
//
//}

/*
总结:
throws:关键字用在函数中,说明它是throwing函数,用于表明该函数可以抛出错误
throw:用于显式抛出一个错误
do...catch:捕捉throw抛出的错误并处理,但是如果是try!调用的函数,do-catch不会捕捉到
try,try? try! 可以调用出现错误的函数
*/


