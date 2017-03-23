//
//  main.swift
//  扩展
//
//  Created by NUK on 16/6/24.
//  Copyright © 2016年 NUK. All rights reserved.
//

import Foundation
#if false
    /*
    扩展:
    在某些时候为已有的类扩展一些新的行为,关于这种扩展方式,最容易想到的就是使用继承,子类可以在父类的基础上添加某些新的方法,甚至重写父类的已有方法,但是有些时候,使用继承不是最好的选择,此时我们就需要借助于扩展
    
    ps:扩展可以添加新的功能,但扩展并不是派生的子类,因此扩展不支持继承
    
    扩展语法
    extension 已有类型{
    添加新功能
    }
    */
    
    //扩展添加属性
    /**
    使用扩展可以添加3中属性
    类存属性,实例计算属性,类计算属性
    */
    extension String{
        //通过扩展添加类存储属性
        static var data:[String:Any] = [:]
        //定义一个实例计算属性,并为其提供get,set部分
        var length:Int{
            get{
                //utf8 utf16 unicode
                return self.utf16.count
            }
            set{//(newValue)
                let length = self.utf16.count
                //如果新设置的长度大于字符串原有长度,则在字符串后添加空格符
                if newValue > length{
                    for _ in 1...newValue-length {
                        //你扩展了谁,谁就是self
                        self += "!"
                    }
                    //若果新设置的长度小于原有字符串的长度,则将后面多余的字符截断
                }else if newValue < length{
                    //NSString的截取
                    self = (self as NSString).substring(to: newValue)
                }
            }
        }
    }
    
String.data["Swift"] = 20000
String.data["PHP"] = 5000
print(String.data)//["Swift":20000,"PHP":5000]
var s = "SwiftIsOk"
print(s.length)//9
    //通过设置length属性,截取String后面多出来的字符
s.length = 5
print(s)//Swift
    
s.length = 20
print(s)//15个空格
    
    //使用扩展添加方法
    /**
    使用扩展可以添加是实例方法,也可以添加类方法,只是添加类方法需要在类方法前面添加static
    */
    extension String{
        //用于获取当前字符串指定范围的子串
        func subStringFromStart(start:Int,toEnd:Int) -> String {
            return (self as NSString).substring(with: NSMakeRange(start, toEnd-start))
        }
        //添加一个类方法,该类方爱可以将Bool转换成字符串
        static func valueOf(value:Bool)->String{
            return "\(value)"
        }
    }
    //PS:想在不修改原串的基础修改字符串,那么需要添加返回值.修改原串无需添加返回值
var str = "abcdeefg"
var subStr = str.subStringFromStart(start: 1, toEnd: 6)
print(subStr)
print(String.valueOf(value: true))
    
    
    //使用扩展添加可变方法
    /**
    通过扩展可以添加可变方法,可变法可以改变值额理性的实例本身,类不可以定义可变方法,因此也不通过扩展类来添加可变方法
    */
    extension Array{
        //定义一个方法,用于计算数组的交集
        //Element --> 泛型
        mutating func retainAll(array:[Element],comparator:(Element,Element)->Bool){
            var tmp = [Element]()
            //遍历当前数组中的所有元素
            for ele in self{
                //遍历第二者数组中所有的元素怒
                for target in array{
                    //如果两个元素通过comparator比较返回true
                    if comparator(ele,target){
                        tmp.append(ele)
                        break
                    }
                }
            }
            self = tmp
        }
    }
var books = ["从入门到崩溃","3天太难学习","5年高考3年模拟"]
books.retainAll(array: ["5年高考3年模拟","从入门到崩溃"]){$0 == $1}
print(books)
    
    //使用扩展添加构造器
    /*
    通过扩展可以为已类添加构造器,通过扩展添加的构造器不会影响类中的原有构造器
    */
    struct SomeSturct {
        var name:String
        var count:Int
    }
    //通过扩展的方式来添加构造器
    extension SomeSturct{
        //通过扩展可以添加2个构造器对类型原有的构造器不会产生任何影响
        //不能写全部成员属性的指定构造器
        init(name:String){
            self.name = name
            self.count = 0
        }
        //写代码容易,debug难,且🐴且珍惜
        init(count:Int){
            self.count = count
            self.name = " "
        }
    }
let sc1 = SomeSturct(name:"ok",count: 5)
let sc2 = SomeSturct(name: "not")
let sc3 = SomeSturct.init(count: 6)
    
    //使用扩展添加下标
    extension String{
        subscript(idx:Int)->String{
            get{
                //如果下标位字符串长度之内,截取当前下标的字符串
                if idx > -1 && idx < self.utf16.count{
                    return (self as NSString).substring(with: NSMakeRange(idx, 1))
                    //如果没有下标位置,返回空字符串
                }else{
                    return ""
                }
            }
            set{
                
                self = (self as NSString).replacingCharacters(in: NSMakeRange(idx, 1), with: newValue)
                
            }
        }
    }
var str1 = "Swift is very easy"
print(str1[4])
str1[4] = "T"
print(str1)
    //扩展协议
    /**
    Swift允许对协议进行扩展,从而使协议本身提供属性,方法,和下标,这就是所有协议类型外可以自动获得的方,法属性和下标
    */
    protocol Table {
        //实例方法
        func test()
        //类方法
        static func tests(count:Int)
    }
    extension Table{
        var type:String{
            return "线"
        }
        func info(){
            print("这个可以玩")
        }
        static func tests(count:Int){
            print("通过扩展实现test是方法")
            for _ in 1...count{
                print("我是一个方法")
            }
        }
    }
    //扩展协议可以默认提供实现,当通过扩展协议中属性,方法,下标提供默认的实现,遵守该协议的类无需见他们实现,这季节使用即可.如果想重新,直接在类中实现即可无需添加override
#endif
#if true
//练习:
/*
给String添加扩展方法
1.求字符串的逆序
func reverse()->String{}
2.将字符串自身逆序
3.给字符串实现下标脚本
str = abcdef [3] 得到 "d" 请不要我的方法
4.将字符串中所有字符以Unicode标量进行排序(自身排序)
func sortByUnicodeScalar(compare:(character,character)->Bool){ }
*/
    //练习:
    /*
     给String添加扩展方法
     1.求字符串的逆序
     func reverse()->String{}
     2.将字符串自身逆序
     3.给字符串实现下标脚本
     str = abcdef [3] 得到 "d" 请不要我的方法
     4.将字符串中所有字符以Unicode标量进行排序(自身排序)
     func sortByUnicodeScalar(compare:(character,character)->Bool){ }
     */
    extension String{
        //1.
        func reverse()->String{
            var s = String()
            var index = self.startIndex
            while index != self.endIndex {
                s.insert(self[index], atIndex: s.startIndex)
                index = index.successor()
            }
            return s
        }
        //自身逆序
        mutating func reversed(){
            self = reverse()
        }
        //3.
        subscript(idx:Int)->Character{
            return self[startIndex.advancedBy(idx)]
        }
        //4.
        mutating func sortByUnicodeScalar(compare:(Character,Character)->Bool){
            let length = self.characters.count
            var star = Array.init(self.characters)
            for i in 0...length-2{
                for j in 0...length-2-i {
                    if compare(star[j],star[j+1])  {
                        let tmp = star[j]
                        star[j] = star[j+1]
                        star[j+1] = tmp
                        
                    }
                }
            }
            self = String(star)
            
        }
    }
    //获取标量
    extension Character{
        var unicode:UnicodeScalar{
            get{
                var a = String(self)
                var unicode:UnicodeScalar = UnicodeScalar()
                for scalar in a.unicodeScalars {
                    unicode = scalar
                }
                return unicode
            }
            
        }
    }
var  str1 = "abc"
print(str1[2])
    //返回逆序
var str2 = str1.reverse()
print("str1:\(str1) str2:\(str2)")
    
str1.reversed()
print(str1)
    
var str3 = "CBAabc"
str3.sortByUnicodeScalar{$0.unicode > $1.unicode}
print(str3)
#endif
