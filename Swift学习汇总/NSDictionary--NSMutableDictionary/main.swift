//
//  main.swift
//  NSDictionary--NSMutableDictionary
//
//  Created by NUK on 16/6/24.
//  Copyright © 2016年 NUK. All rights reserved.
//

import Foundation
//创建一个字典 [key:value]
//在Swift中的Dictionary不起作用但是NSDictionary会其作用,key还是必须唯一,key是唯一取的value的方式
let dic:NSDictionary = NSDictionary.init(dictionary: ["one":1,"two":2,"three":3])
let dic1 = NSDictionary.init(dictionary: dic)
let dic2:NSDictionary = ["one":1,"two":2,"three":3]
//查看个数是键值对
print(dic.count)
//通过key来取出value
let one = dic.objectForKey("one")
print(one as! Int)
//获取所有的key 所有value
let keyArray = dic1.allKeys
let valueArray = dic1.allValues
print(keyArray,valueArray)
//查看value对应的所有的key
let dic3 = NSDictionary.init(dictionary: ["key1":"value1","key2":"value1","key3":"value2","key4":"value3","key5":"value1"])
let array = dic3.allKeysForObject("value1")
print(array)


//NSMutableDictionary
//创建一个可变的字典 空的可变字典
var mutdic1 = NSMutableDictionary.init(capacity: 0)
var mutdic2 = NSMutableDictionary.init(dictionary: ["key1":"value1","key2":"value2","key3":"value3","key4":"value4","key5":"value5"])
//增加
//增加键值对 key不能重复
mutdic2.setObject("value6", forKey: "key6")
let dic4 = NSDictionary.init(dictionary:["o":1,"t":2,"s":3])
mutdic1.addEntriesFromDictionary(dic4 as [NSObject:AnyObject])
/**
let dic4 = ["o":1,"t":2,"s":3]
mutdic1.addEntriesFromDictionary(dic4)
*/
//删除 通过key来删除值
mutdic1.removeObjectForKey("o")
print(mutdic1)
//PS:在Json [ ]代表的是数组 { }代表的是字典
let array4 = ["key4","key5","key6"]
mutdic2.removeObjectsForKeys(array4)
print(mutdic2)
//全部删除
mutdic2.removeAllObjects()
//通过已有的key来修改value的值
mutdic1.setObject(2, forKey: "s")
print(mutdic1)
mutdic1.setDictionary([:])
print(mutdic1)
