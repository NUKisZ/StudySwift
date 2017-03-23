//
//  main.swift
//  协议与代理
//
//  Created by NUK on 16/6/24.
//  Copyright © 2016年 NUK. All rights reserved.
//

import Foundation

/*
协议:
1.生活中的协议:
培训协议:
千锋对的要求:好好学习,天天向上,多写代码少看片
你对千锋的要求:教室要好,空调,暖气,座位周边要是美女(不能实现)
工作协议:
老板对你的要求:免费的加班,无条件的加班,不要工资(可选),一天工作23小时(可选)
你对老板的要求:不干活,发工资,一直都在休假
购房:
你对开发商:房子必须是钢筋混凝土,不能是草和牙签

什么是协议:
协议就是约束双方的一种定义,也可理解为共同的行为规范,在编程中协议主要同一了,属性,方法,下标等,但是协议并不提供人实现,实现协议的是结构体,枚举,类他们可以遵守协议并实现协议,只要遵守了协议,就必须实现协议中提供的要求(除可选协议)

协议对编程中最大的作用就是同一接口

协议的格式:

protocol 协议名:父协议1,父协议2....{

协议内容
}

类遵守一个多继承的协议,那么我们可以理解为我们实现了类的[多继承]

遵守协议:
enum 枚举名: 协议1,协议2..{
//实现协议的要求
}
struct 结构体名: 协议1,协议2..{
//实现协议的要求
}
class 类名:SuperClass,协议1,协议2..{
//实现协议的要求
}
*/

/*---协议指定的属性和要求---*/
/*
协议可以指定实现者必须提供包含特定的实例属性或类属性,也能要求改属性是否提供get和set部分,[但至于该属性到底是存储属性还是计算属性,协议并不关心]

var 属性名:类型{get set}
*/
//定第一个协议,描边的画笔
protocol Strokable {
    //在协议中定义属性
    var strokeWidth:Double{get set}
}

//定义个枚举作为协议属性的类型,代表填充颜色
enum Color{
    case Red,Green,Blue,Yellow
}
protocol Fullable {
    var fullColor:Color?{get set}
    
}
//定义一个协议,并让该协议继承两个父协议
protocol HasArea : Fullable,Strokable{
    var area:Double{get}
}

protocol Mathable {
    static var pi:Double{get}
    static var e:Double{get}
}
//定义一个结构体,实现两协议
struct Rect:HasArea,Mathable{
    var width:Double
    var height:Double
    init(width:Double,height:Double){
        self.width = width
        self.height = height
    }
    //可以使用存储属性来实现Fullable协议的FullColor属性
    var fullColor: Color?
    var strokeWidth: Double = 0.0
    var area: Double{
        get{
            return width * height
        }
    }
    
    static var pi: Double = 3.141592657
    static var e: Double = 2.171828
}
//不管协议中如何定义属性要求,实现方既可以采用存储属性来完成要求,也可以通过计算属性来完成协议中的要求


//Circle实现两个协议
class Circle:HasArea,Mathable{
    var  r : Double
    init(r:Double){
        self.r = r
    }
    //可以使用存储属性来实现Fullable协议的FullColor属性
    var fullColor: Color?
    var strokeWidth: Double = 0.0
    var area: Double{
        get{
            return Circle.pi*r*r
        }
    }
    
    static var pi: Double = 3.141592657
    static var e: Double = 2.171828
}

var ret = Rect.init(width: 4.5, height: 5.0)
print(ret.area)
ret.fullColor = Color.Red
ret.strokeWidth = 0
print(ret.fullColor)
print(ret.strokeWidth)

var c = Circle.init(r: 2.0)
print(c.area)
c.fullColor = Color.Blue
c.strokeWidth = 0.5
print(c.fullColor)
print(c.strokeWidth)
/*
虽然Rect和Circle类型不同,但是他们却具有完全类型的属性,这是因为他们实现了相同的协议,这就是协议意义所在,它自定了多个类型必须遵守的规范

*/

//协议指定的方法
/*
协议能要求实现这必须将协议中的实例方法或类方法实现,在协议中定义方法或普通方法基本相同,只是在协议中声明方法不需要实现
*/


protocol Eatable {
    //定义一个实例方法
    func teste()
    //定义一个类方法
    static func test(msgs:String...)
}
//ps:协议支持参数个数可变,但是不支持形参执行默认值
class Apple:Eatable{
    var name:String
    init(name:String){
        self.name = name
    }
    func teste() {
        print("好吃不如:\(name),好玩不小米")
    }
    static func test(msgs: String...) {
        for msg in msgs {
            print("个数可变的形参:\(msg)")
        }
    }
}
Apple.test("苹果4s","苹果5s","苹果6","苹果6s")
let app = Apple.init(name: "苹果7")
app.teste()


//协议可以指定可变的方法
/**
如果枚举,结构体需要改变实例数据的方法时,则需要该方法定义为使用mutating修饰,类则不需要可变方法.如果类遵守协议中有mutating,那么在实现协议方法时无需添加mutating关键字
*/
protocol Incrementable {
    //定义可变的实例方法
    mutating func test(delta:Double)
}
struct Range:Incrementable{
    var start:Double
    var length:Double
    mutating func test(delta: Double) {
        self.length += delta
    }
    
}
class San:Incrementable{
    var r:Double = 0
    func test(delta: Double) {
        self.r += delta
    }
}

//协议可以指定下标

protocol Math {
    //定义两个重载的下标
    subscript(idx:Int)->Int{get}
    subscript(a:Int ,b:Int)->Int{get}
    
}
class Linear:Math{
    var factor: Int
    init(factor: Int){
        self.factor = factor
    }
    //在协议中如果属性或下标只定义了get属性,那么我们在实现的时候,可以添加set属性
    //let arr:[Int] = [1,2,3,4,5]
    subscript(idx:Int)->Int{
        get{
            return factor*idx
        }
        set{
            print("执行了下标的赋值")
        }
    }
    subscript(a:Int,b:Int)->Int{
        return factor * a + b
        
    }
    
}
var l = Linear.init(factor: 5)
print(l[4])//20
print(l[4,6])


//协议可以指定构造器
/*
协议能要是实现着必须提供哪些构造器,在协议中声明构造器与普通声明构造器基本相同,只是在协议中不需要实现

当实现协议中的构造器,即可以使用使用指定构造器来实现,也可以通过遍历构造器来实现,协议并不会理会你是如何实现的,但是需要注意如下两点:

1.使用类实现协议,并实现协议中的构造器时,必须使用[required]修饰该构造器,除非该类使用[final]类型修饰,此时可以省略[required]该关键字
2.视同类实现协议,并实现协议中的构造器时,如果构造器重写了父类的构造器,则必须同时使用 required override 修饰

*/
protocol Initable {
    //定义两个必须被实现类所实现的构造器
    init(name:String)
    init(name:String,weight:Double)
}

class Fruit{
    var name:String
    init(name:String){
        self.name = name
    }
}
class Orange: Fruit,Initable{
    var weight:Double
    //重写父类方法,并实现协议中的构造
    override required init(name: String) {
        self.weight = 0.0
        super.init(name: name)
    }
    //convenience便利构造器
    required convenience init(name: String, weight: Double) {
        self.init(name:name)
        self.weight = weight
    }
    
}

var ap1 = Orange.init(name: "aa")
var ap2 = Orange.init(name: "bb", weight: 12)
print(ap1.name,ap1.weight)
print(ap2.name,ap2.weight)

//使用协议作为数据类型
/*
Swift中协议是可以作为类型的,只是协议不能直接用于创建实例,协议可以做如下方面的用途
1.可以使用协议声明变量
2.可以使用协议作为函数,构造器的形参类型,返回值类型
3.可以使用协议作为 is或as等运算符最后一个操作数
*/
//视同Initable声明变量,将Orange实例赋值给当前food,这里会向上转型
var food:Initable = Orange.init(name: "丑橘")

var food1:Eatable = Apple.init(name: "苹果")
food1.teste()

//定义一个函数,该函数的形参是一个协议类型Eatable类型
func eat(foods:Eatable...){
    for food in foods{
        food.teste()
    }
}
//由于该函数的类型Eatable协议类型,所以只能传入遵守这个协议类或结构体或枚举
eat(food1,Apple.init(name: "苹果5"))

var foodArray:[Eatable] = [Apple.init(name: "苹果5s"),Apple.init(name: "苹果6"),Apple.init(name: "苹果6s")]
for food in foodArray{
    if let  ap = (food as? Apple){
        print("这个Eatable的苹果,名字为:\(ap.name)")
    }
}
//面向协议编程(iOS)


//合成协议
/*
Swift还允许将多个协议和成一个临时的类型,这个种用法叫做合成协议

protocol<协议1,协议2,协议3....>

对于采用这种合成协议声明的变量,定的参数,声明返回值,但是必须同时实现protocol合成协议的所有协议内容
*/

func test(arg:protocol<HasArea,Mathable>){
    //编译器知道arg参数必须是HasArea是实现类型的实例才能调用当前参数属性
    print("arg参数的填充色是\(arg.fullColor)")
    print("arg参数的描边笔粗细:\(arg.strokeWidth)")
    print(arg.area)
}
var c1 = Circle.init(r: 1.2)
c1.strokeWidth = 0.5
c1.fullColor = Color.Red
//test()函数的参数必须同时实现HasArea,Mathable协议
test(c1)

//唯类协议 protocol Class
/*
Swift之支持定义一种唯类协议,这种协议只能被类实现,不能被其他类型实现
class是一个关键字

protocol 协议名 : class,父协议1...{
//唯类协议的定义
}
*/
protocol Move : class{
    func moveTo()
}
class Cat:Move{
    func moveTo() {
        print("汽车在路上跑")
    }
}


//可选协议
/*
Swift支持在协议中定义可选成员,可选成员的要求是:该协议的实现类型即可实现的协议成员,也可以不实现这些协议成员,只需在成员前面加上optional关键字定义即可

PS:由于可选协议主要是为了保持与OC协议的兼容,因此可选协议必须添加[@objc]修饰,可选协议也是唯类协议

*/

@objc protocol MyProtocol{
    //定义可选属性
    optional var  status:String {get}
    optional func test(val:Int)
    optional subscript(idx:Int)->Int{get}
}
//因为当前协议中的属性方法下标都是可选协议类型,所以可以实现也可以实现,下面这个类完全合法
class EmptyClass:NSObject,MyProtocol{
    
}
class MyClass:NSObject,MyProtocol{
    func test(val: Int) {
        print(val)
    }
}










/*
委托,代理 delegate(闭包)

1.什么是代理与委托
1.事件1:你被打了
结果:你雇佣了一帮杀手去弄它
委托方:你
代理方:杀手

事件2:你让千锋给你培训iOS,前方派Teacher
委托方:你
代理方:千锋


事件3:郭美美被奔驰车撞了
结果:郭美美找律师帮助自己打管事
委托方:郭美美
代理方:律师

理解1:是不是所有人都能称为代理方? 不是
只有满足委托方的要求才能称为代理方

委托代理:
A不想做某件事,A让B去帮自己完成这件
委托 A
代理 B
*/
/*
小新与小白的故事(委托代理)
*/
#if false
    //1.在一个漆黑而又宁静夜晚,小新突然听到外面有说相声(小岳岳),开始担惊受怕,但是他年龄小,自己不干出去,于是找小白出去叫一下,帮他它震慑以外变
    //代码的形式来完成上面这个故事
    class Person{
        //等到一个狗的对象
        var dog:Dog?
    }
    class Dog{
        func bark(){
            print("汪汪..........")
        }
    }
let xiaoxin = Person()
let xiaobai = Dog()
xiaoxin.dog = xiaobai
xiaoxin.dog?.bark()
    //实际上我们刚刚写的并不是委托代理,而是类的包含,Person类中包含了一个Dog类的对象,如果在实际开发中我们使用这方式话会出现很多缺陷和隐
    //我么可以同过Person委托的方式来找一个代理人帮助自己驱赶坏人
    //实际中Person并不关系谁去叫,只要能完成任务就可以
#endif
#if false
    //2.小新的危机解除了,但是坏蛋在,two day,又到了晚上,又在外面说相声,小新又开始害怕了,但是恰巧小白不再,这个是有怎么办呢?是时候小新可以让家里的,小老鼠,Tom🐱,青蛙出去叫,但是有不知道谁能叫,小新就发了这个一个委托
    
    //小新想的是找其中一种小动物帮助自己解决敌人,小新并不关心这个代理人是谁,只要能完成任务即可
    
    //一般像代理这种协议我们命名都是会是下面这几种: XXProtocol 或 XXDelegate
    protocol PersonToAnimalDelegate {
        //叫
        func  bark()
    }
    class Cat:PersonToAnimalDelegate{
        func bark()  {
            print("我是🐅tiger")
        }
    }
    class Person{
        var delegate:PersonToAnimalDelegate?
        
        func  deter()  {
            self.delegate?.bark()
        }
        
    }
let 小新 = Person()
let Tom🐱 = Cat()
    //设置代理
小新.delegate = Tom🐱
小新.deter()
    
    //Boss想开车回家,但是自己又不会开
    protocol BossToWorkerDelegate {
        func driver()
    }
    class Worker: BossToWorkerDelegate {
        func driver() {
            print("开车送你回家")
        }
    }
    class Boss{
        var delegate:BossToWorkerDelegate?
        func goHome()  {
            self.delegate?.driver()
        }
    }
let  boss = Boss()
let worker = Worker()
boss.delegate = worker
boss.goHome()
    //Teacher想购买电脑,但是自己有不会
    
    protocol TeacherToBusinessmanDelegate {
        func buyComputer()
    }
    class Businessman:TeacherToBusinessmanDelegate{
        func buyComputer() {
            print("给你买电脑")
        }
    }
    class Teacher {
        var delegate:TeacherToBusinessmanDelegate?
        func computer()  {
            self.delegate?.buyComputer()
        }
    }
#endif
#if true
    //双向代理
    //Boss想开车回家,但是自己又不会开
    //Worker心有不甘,我只开车但是没有钱
    //Boss委托Worker开车送我回家
    protocol BossToWorkerDelegate {
        func driver()
    }
    //Worker委托Boss给钱
    protocol WorkerToBossDelegate {
        func money()
    }
    class Boss: WorkerToBossDelegate {
        var delegate:BossToWorkerDelegate?
        func money() {
            print("给你钱")
        }
        func goHome(){
            self.delegate?.driver()
        }
    }
    class Worker: BossToWorkerDelegate {
        var delegate:WorkerToBossDelegate?
        func driver() {
            print("送你回家")
        }
        func  giveMoney(){
            self.delegate?.money()
        }
    }
let boss = Boss()
let worker = Worker()
boss.delegate = worker
boss.goHome()
worker.delegate = boss
worker.giveMoney()
    
    //同学去食堂吃饭,同学的到饭,食堂的到钱
    //给你食物-->这么难吃还要钱-->给你钱-->有的吃就不错了
    protocol StudentToFoodsDelegate{
        func food()
    }
    protocol FoodSToStudentDelegate {
        func money()
    }
    
    class Student:FoodSToStudentDelegate {
        var delegate:StudentToFoodsDelegate?
        func money() {
            print("给你钱")
        }
        func eatFood()  {
            self.delegate?.food()
            print("这么难吃还要钱")
        }
    }
    class Food:StudentToFoodsDelegate{
        var delegate:FoodSToStudentDelegate?
        func food() {
            print("给你食物")
        }
        func giveMeMoney(){
            self.delegate?.money()
            print("有的吃就不错了")
        }
    }
let student = Student()
let foods = Food()
student.delegate = foods
student.eatFood()
foods.delegate = student
foods.giveMeMoney()
#endif
#if false
    //正向传值和反向传值
    //委托方传值到代理方-->正向传值
    //代理方传值到委托方-->反向传值
    //PS:所谓的正向传值和反向传值都是人为加上去,其实就是传值
    
    //坏蛋被一次又一次的震慑回去,时间久了,仅凭大叫声,已经无法震慑坏蛋,所以我们需要让小白多叫几次
    
    //从委托方创一个值到代理方的过程
    protocol PersonToAnimaleDelegate {
        func bark(count:Int)
    }
    class Dog : PersonToAnimaleDelegate{
        func bark(count: Int) {
            for _ in 0..<count{
                print("我是小白,你来咬我啊!!!")
                sleep(1)
            }
        }
    }
    class Person{
        var delegate:PersonToAnimaleDelegate?
        var count:Int!
        func deter() {
            self.delegate?.bark(count)
        }
    }
let 👦 = Person()
let 🐶 = Dog()
👦.count = 5
👦.delegate = 🐶
👦.deter()
#endif
#if true
    //反向传值(反向回调)
    /*
    面对坏蛋的一次次骚扰,小新是在忍无可忍,开始反击,于是他决定升级小白,神兽小白,自然少不了:炼化,羽化,幻化,又给小白一身神装,各种宝石,攻击力,防御,躲避等等,中毒,灼烧,减速,晕眩,虚弱附带及,去杀死坏蛋,小白杀死了多少个坏蛋.
    */
    protocol PersonToAnimalDelegate {
        func bark(count:Int)
    }
    class Person {
        var delegate: PersonToAnimalDelegate?
        var count:Int!
        func deter(){
            self.delegate!.bark(count)
        }
        func killBadEgg(count:Int){
            print("kill:\(count) BadEgg")
        }
        
    }
    //在遵守协议的类中放一个委托方的对象
    class Dog: PersonToAnimalDelegate {
        var master:Person?
        func bark(count: Int) {
            for _ in 0..<count{
                print("我是神小白,你来咬我 啊!")
                sleep(1)
            }
            self.master?.killBadEgg(Int(arc4random()%100+1))
        }
        
    }
let 小新 = Person()
let 神小白 = Dog()
小新.count = 5
小新.delegate = 神小白
神小白.master = 小新
小新.deter()
    
#endif



















