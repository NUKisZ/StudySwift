//
//  Car.swift
//  Swift学习汇总
//
//  Created by NUK on 16/6/24.
//  Copyright © 2016年 NUK. All rights reserved.
//

import Foundation
class Car {
    var carName:String
    var speed:Double
    init(carName:String,speed:Double){
        self.carName = carName
        self.speed = speed
    }
    //跑
    func moveOnRoad(road:Road){
        print("\(self.carName)的车速:\(self.speed)km/h")
        print("路的长度\(road.lenght)km 汽车用\(road.lenght/self.speed)的时间可以跑完")
    }
}
