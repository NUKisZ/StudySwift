//
//  main.swift
//  文件管理之Plist
//
//  Created by NUK on 16/6/24.
//  Copyright © 2016年 NUK. All rights reserved.
//

import Foundation

/**
plist文件:
plist文件用于存储简易的数据结构信息,如控件的布局,图片,登陆等信息
plist文件只支持数组,字典,字符串,NSNumber,NSData,NSDate数据
plist是一个可视化的文件
*/
//command+n-->os x -> Resource ->property List
#if false
let path = "/Users/hhh/Desktop/Swift_day14/文件管理之NSData/文件管理之Plist/DictionaryList.plist"
    /**
    解Plist
    1.plist中root是Dictionary,那么我们就用NSDictionary或是NSMutableDictionary来接收
    2.plist中root是Array,那么我们就用NSArray或是NSMutableArray来接收
    */
let dic:NSDictionary = NSDictionary.init(contentsOfFile: path)!
print(dic)
let name = dic["name"] as! NSString
print(name)
    
    //练习:plist root Array 3项 itme0~2 String 1,2,3
let path1 = "/Users/hhh/Desktop/Swift_day14/文件管理之NSData/文件管理之Plist/ArrayList.plist"
let arr:NSArray = NSArray.init(contentsOfFile: path1)!
print(arr)
let str = arr[0]
print(str)
    
    //练习:创建plist,root是Array有两个字典,两个字典中有姓名,学号和年龄
let path3 = "/Users/hhh/Desktop/Swift_day14/文件管理之NSData/文件管理之Plist/Student List.plist"
let array:NSArray = NSArray.init(contentsOfFile: path3)!
for dic in array{
    if let name = dic["name"]!{
        print(name)
    }
    if let num = dic["num"]!{
        print(num)
    }
    if let age = dic["age"]!{
        print(age)
    }
    
}
#endif
#if false
    //1.要存入的数据
let dic:NSDictionary = [
    "name":"舒克",
    "age":17,
    "weight":19
]
    //plist文件路径
let path = "/Users/hhh/Desktop/mouse.plist"
let tag = dic.writeToFile(path, atomically: true)
tag ? print("plist文件创建成功") : print("plist文件创建失败")
#endif
//一般来讲plist文件最上层的根节点(root)一般来说都是使用字典
let array1 = ["one","Two",4]
let array2 = [NSDate.init(),"Four"]
let array3 = [4,5,"Five"]
let dict = [
    "数组1":array1,
    "数组2":array2,
    "数组3":array3
    
]
let arr:NSArray = [dict]
let tag = arr.writeToFile("/Users/hhh/Desktop/file.plist", atomically: true)
tag ? print("plist文件创建成功") : print("plist文件创建失败")


