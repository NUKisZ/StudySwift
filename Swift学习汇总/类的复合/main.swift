//
//  main.swift
//  类的复合
//
//  Created by NUK on 16/6/24.
//  Copyright © 2016年 NUK. All rights reserved.
//

import Foundation

//某些时候,我们需要定义多个类来系统完成某个功能,类和类之间可能存在联系,那么这个联系,我们称之为类的复合
//公路上跑汽车
let road = Road.init(lenght: 200)
let car = Car.init(carName: "QQ", speed: 40)
car.moveOnRoad(road)
//奥巴马踩🍄
class Timo {
    //伤害值
    var hurtNum = 0
    //设置蘑菇的伤害值
    func setHurtNum(hurtNum:Int) {
        self.hurtNum = hurtNum
    }
    
}
class LuXiAn {
    var hp:Int =  0
    //设置奥巴马的血量
    func setHp(hp:Int) {
        self.hp = hp
    }
    //跳
    func jumpMogu(mogu:Timo){
        let ret = self.hp - mogu.hurtNum
        if ret > 0 {
            print("ADC获胜,奥巴马以残血\(ret)风骚的赢了")
        }else{
            print("提莫赢")
        }
    }
}
let 🍄 = Timo()
🍄.setHurtNum(300)
let 🐴 = LuXiAn()
🐴.setHp(301)
🐴.jumpMogu(🍄)
//组装电脑 内存Memory 硬盘Disk 显示器Display
//在电脑里打印出三个数据
class Memory{
    var type:Int
    init(type:Int){
        self.type = type
    }
}
class Disk {
    var capacity:Int
    init(capacity:Int){
        self.capacity = capacity
    }
}
class Display {
    var displayTypedef:String
    init(displayTypedef:String){
        self.displayTypedef = displayTypedef
    }
}

class Computer {
    //内存
    var memory:Memory
    //硬盘
    var disk:Disk
    //显示
    var display:Display
    init(memory:Memory,disk:Disk,display:Display){
        self.memory = memory
        self.disk = disk
        self.display = display
    }
    func showInfos() {
        print("内存:\(self.memory.type)G 硬盘:\(self.disk.capacity)GB 显示器:\(self.display.displayTypedef)品牌")
    }
}
let memory = Memory(type: 16)
let disk = Disk(capacity: 1120)
let display = Display(displayTypedef: "AOC")
let computer = Computer.init(memory: memory, disk: disk, display: display)
computer.showInfos()
//小明交换牌
//小明手里有两张牌,左手❤️A,右手♠️K,现在让小明交换手里的牌,交换后左手♠️K,右手❤️A
//小明 牌 手

