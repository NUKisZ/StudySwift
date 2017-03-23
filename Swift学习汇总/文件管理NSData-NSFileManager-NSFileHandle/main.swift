//
//  main.swift
//  文件管理NSData-NSFileManager-NSFileHandle
//
//  Created by NUK on 16/6/24.
//  Copyright © 2016年 NUK. All rights reserved.
//

import Foundation

/*
NSData是对二进制数据的一个封装,能把二进制数据当成对象来处理
当我们需要把一些信息写入到文件或发送到网络的时候,那么我们需要将这些文件转换,编程纯粹的0,1字符流就需要NSData

ps:NSMutableData我们很少使用
NSData和 (NSString/String) 之间的互转

*/
//(NSString/String) 转换成 NSData
let str1:NSString = "我是NSString字符串"
let str1_1 = "我是String字符串"
//将当前字符转换成二进制,当前的NSData类型是一个可选类型,如果需要,那么我们需要进行强制解析[!]
//以后的操作中字符编码都是会NSUTF8StringEncoding
let data1 = str1.dataUsingEncoding(NSUTF8StringEncoding)
let data1_1 = str1_1.dataUsingEncoding(NSUTF8StringEncoding)
print(data1!)
print(data1_1!)

//NSData类型转换到(NSString\String)
let str2 = NSString.init(data: data1!, encoding: NSUTF8StringEncoding)
let str2_1 = String.init(data: data1_1!, encoding: NSUTF8StringEncoding)
print(str2!)
print(str2_1!)



//NSFileManager
extension NSArray {
    func printfHanZi() -> String {
        var str = "(\n"
        
        [self .enumerateObjectsUsingBlock({
            str += "\t\($0.0), \n"
        })]
        
        str += ")"
        
        return str
    }
    
}
extension NSDictionary {
    func printfHanZi() -> String {
        let allKeys:NSArray = self.allKeys
        let str = NSMutableString.init(format: "{\t\n")
        for  key in allKeys {
            let value = self[key as! NSString];
            str.appendFormat("\t \"%@\" = %@,\n", (key as! NSString),(value as! NSString))
        }
        str.appendString("}")
        
        return str as String
    }
    
}

//定义一个地址常量
let root = "/Users/hhh/Desktop/"
/**
 NSFileManager 文件管理类
 通过NSFileManager可以对文件目录本身进行查看,创建,删除,拷贝,移动等操作,以及对文件内容的修改
 */
class FileManager{
    //当前类是测试方法用来调用当前类中的类方法
    static func test(){
        //创建文件夹和文件
        //createDirectoryOrFile()
        //遍历目录或文件
        // scanDirectoryOrFile()
        //拷贝
        //copyDirectoryOrFile()
        //移动
        //moveDriectoryOfFile()
        //删除
        //removeDirectoryOrFile()
        //查看属性
        attributeForDirectoryOrFile()
    }
    //创建文件目录和文件
    static func createDirectoryOrFile(){
        //在桌面上创建一个File1的文件夹
        //文件管理类的对象
        //保留意见:defaultManager()叫单利,单一实例,全局唯一,不管如何创建对象,对象只有一个
        let fileManager = NSFileManager.defaultManager()
        //路径拼接
        //String拼接的方法
        let path = root.stringByAppendingString("File1")
        //NSString拼接的方法
        //stringByAppendingPathComponent NSString独有方,它会帮助我们拼接路径,如果:"/Users/hhh/Desktop"会默认帮我们在其路径的后面添加/File1
        //let path = root.stringByAppendingPathComponent("File1")
        
        //判断当前路径是否存在文件
        if !(fileManager.fileExistsAtPath(path)){
            //创建文件夹
            //第一个参数:文件的路径
            //第二各参数:中间目录默认是缺省值,默认传true
            //第三个参数:目录属性,默认填写nil(包含所有属性)
            do{
                try fileManager.createDirectoryAtPath(path, withIntermediateDirectories: true, attributes: nil)
                print("文件夹创建成功")
            }catch{
                print("文件夹创建失败:\(error)")
            }
        }else{
            print("当前目录已经存在文件夹")
        }
        let  filePath = path.stringByAppendingString("/dome1.txt")
        let  str = "神啊!我有罪,我错了,原谅我吧!"
        //转换成NSData
        let data = str.dataUsingEncoding(NSUTF8StringEncoding)
        
        if !(fileManager.fileExistsAtPath(filePath)){
            //创建文本
            //第一个参数:文本的路径
            //第二个参数:转换成NSData二进制
            //第三个参数:文件属性,默认填写nil
            let tag = fileManager.createFileAtPath(filePath, contents: data, attributes: nil)
            tag ? print("文本创建成功") : print("文本创建失败")
        }else{
            print("当前文本文件已经存在")
        }
    }
    //遍历目录/文件
    static func scanDirectoryOrFile(){
        let fm = NSFileManager.defaultManager()
        //浅度遍历(包含一级目录(包含文件和当前目录))
        var array:NSArray = []
        if fm.fileExistsAtPath(root){
            array = try! fm.contentsOfDirectoryAtPath(root)
            print("浅度遍历:\(array.printfHanZi())")
        }
        
        
        //深度遍历
        if fm.fileExistsAtPath(root){
            
            let arr:NSArray = fm.subpathsAtPath(root)!
            print("深度遍历:\(arr.printfHanZi())")
        }
        //也是深度遍历,抛异常
        //fm.subpathsOfDirectoryAtPath()
        
        
        //获取文件路径
        let path1 = root.stringByAppendingFormat("%@",(array[4] as! NSString))
        
        print(path1)
    }
    
    //拷贝
    static func copyDirectoryOrFile(){
        let fm = NSFileManager.defaultManager()
        //第一个参数:原路径
        let srcPath = root.stringByAppendingString("File1")
        //第二个参数:目标路径
        let desPath = root.stringByAppendingString("File2")
        do{
            try fm.copyItemAtPath(srcPath, toPath: desPath)
            print("copy 成功")
        }catch{
            print("copy 失败:\(error)")
        }
    }
    //移动(剪切)
    static func moveDriectoryOfFile(){
        let fm = NSFileManager.defaultManager()
        //第一个参数:原路径
        let srcPath = root.stringByAppendingString("File1")
        //第二个参数:目标路径
        let desPath = "/Users/hhh/Desktop/File2/File3"
        do{
            try fm.moveItemAtPath(srcPath, toPath: desPath)
            print("移动成功")
        }catch{
            print("移动失败:\(error)")
        }
    }
    //删除
    static func removeDirectoryOrFile(){
        let fm = NSFileManager.defaultManager()
        //要删除的路径
        let remPath = root.stringByAppendingString("File2")
        do{
            try fm.removeItemAtPath(remPath)
            print("删除成功")
        }catch{
            print("删除失败")
        }
    }
    
    //获取文件属性
    static func
        attributeForDirectoryOrFile(){
            let path = "/Users/hhh/Desktop/image/54.png"
            let  fm = NSFileManager.defaultManager()
            let dic:NSDictionary = try! fm.attributesOfItemAtPath(path)
            print(dic)
    }
}
FileManager.test()








/**
NSFileHandle 文件句柄
文件的代言人, 是个对象,可以对文件进行读写操作
*/
//练习:
//写一个文件"我爱北京天安门,天安门上太阳升!"//demo.txt
let path = "/Users/hhh/Desktop/demo.txt"
#if false
    //读取文件内容
    //1.以只读的方式打开文件
let fh = NSFileHandle.init(forReadingAtPath: path)
    
    //读取文件中所有的内容
    //返回值是一个NSData
let data = fh?.readDataToEndOfFile()
print(data!)
    //转换成字符串
let content = String.init(data: data!, encoding: NSUTF8StringEncoding)
print(content!)
    //iOS实际开发中
    //NSData可以直接读取文件,但是有弊端,NSData会一口气将文件中所有的内容读取,占用内存//2G 1G 521MB
    // let data = NSData.init(contentsOfFile: <#T##String#>)
    //因为当前我们是用是UTF8字符编码.所以一个汉字占3个字节,当大家设置偏移量的时候或获取长度的时候,不能取到汉字的中间,否则会引起错误
    
    //读取文件的指定长度
    //读取时需要关闭上面的读取所有内容
    //直接读取到文件中长度为3的内容
let str = String.init(data:(fh?.readDataOfLength(3))!, encoding: NSUTF8StringEncoding)
print(str!)
    //它会接着上面的继续向下读取内容
let str2 = String.init(data:(fh?.readDataOfLength(3))!, encoding: NSUTF8StringEncoding)
print(str2!)
    
    //设置偏移量可以读取指定位置
    //当设置的偏移量为0,那么文件会从头读取
    //定位读/写的进度到文件中
    //设置偏移量为4 错误
fh?.seekToFileOffset(0)
let str3 = String.init(data:(fh?.readDataOfLength(3))!, encoding: NSUTF8StringEncoding)
print(str3!)//我
    //关闭文件
fh?.closeFile()
#endif
#if false
    //已只写的方式打开
    //  let fh = NSFileHandle.init(forWritingAtPath: <#T##String#>)
    //读写的方式打来
let  fh = NSFileHandle.init(forUpdatingAtPath: path)
let  str = "哦也!"
let data = str.dataUsingEncoding(NSUTF8StringEncoding)
    //1.直接设置偏移量到文件的最后
    //    fh?.seekToEndOfFile()
    //    fh?.writeData(data!)
    
    //写的进度到文件的某个字节,覆盖原有的字符
    //     fh?.seekToFileOffset(15)
    //     fh?.writeData(data!)
    //清楚所有内容
    //清楚当前文件中的所有内容,传入0
    //清楚指定字节的内容,传入的是保留的字节数,剩下的被清楚
fh?.truncateFileAtOffset(0)
    //关闭文件
fh?.closeFile()
#endif
#if false
    //文件句柄的标准输入
    //读文件: 读我们写的文件句柄,相当于读标准输入的内容,如果标准输入里暂时没有内容,则读函数会阻塞等待标准输入
let stdIn = NSFileHandle.fileHandleWithStandardInput()
    //会自动转换输入的内容为NSData类型
let  data = stdIn.availableData
    //    var input = String.init(data: data, encoding: NSUTF8StringEncoding)!
    //    //abcde"\n"
    //    input.removeAtIndex(input.endIndex.predecessor())
    //    print(input)
    
let input2 = NSString.init(data: data, encoding: NSUTF8StringEncoding)?.integerValue
print(input2!)
    
    
#endif
#if false
    //标准输出.写打开
var stdOut = NSFileHandle.fileHandleWithStandardOutput()
    //写入数据帮助打印
let str = "上海ZK教育"
let data = str.dataUsingEncoding(NSUTF8StringEncoding)
stdOut.writeData(data!)
    //关闭
stdOut.closeFile()
print(stdOut)
    
    
    
    
    
#endif
#if false
    //标准错误
var stdErr = NSFileHandle.fileHandleWithStandardError()
let str = "错误信息..."
let data = str.dataUsingEncoding(NSUTF8StringEncoding)
stdErr.writeData(data!)
stdErr.closeFile()
#endif






