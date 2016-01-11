/**
  * 类的继承和构造器
  *
***/

class Vehicle {
    var currentSpeed = 0.0
    var description: String{
        return "traveling at \(currentSpeed) miles per hour"
    }
    func makeNoise(){
        
    }
    
    init(){
        
    }
    
    init(currentSpeed:Double){
        self.currentSpeed = currentSpeed
    }
}
var aVehicle = Vehicle()
aVehicle.makeNoise()//因为没有实现，所以没有输出

//继承
class Bicycle: Vehicle {
    var hasBasket = false
    
    //重写的时候可以顺便将他设置为final
    override final func makeNoise() {
        super.makeNoise()//可以用super来调用父类的方法、属性、下标方法
        print("匡匡，匡匡")
    }
}

var aBicycle = Bicycle()
aBicycle.hasBasket = true
aBicycle.currentSpeed = 20.0
print(aBicycle.description)//调用继承自父类的方法
aBicycle.makeNoise()//调用重写的方法


//骑行车
class RiddingBicycle: Bicycle {
    var hasTransimission = true
    var geer = 1
    
    override var hasBasket:Bool {//重写getter setter
        get{
            return false;
        }
        set{
            print("这是一辆骑行车，怎么可能有篮子?\(newValue)")
        }
    }
    
    override var currentSpeed:Double {//重写属性监控器
        willSet {
            print("速度将被改变到\(newValue)")
        }
        didSet {
            print("速度被从\(oldValue)改变到\(currentSpeed)")
        }
    }
    
    //重写getter方法
    override var description: String {
        return "This is a RiddingBicycle ,ridding at \(currentSpeed) miles per hour "
    }

    //定义了final的方法就不能再重写了
//    override func makeNoise() {
//        
//    }
    //如果只重写了这个构造方法，那么该类就只有这个构造方法了
    //有点像Java
    init(currentSpeed:Double,geer:Int){
        //调用父类的构造方法
        super.init(currentSpeed: currentSpeed)
        self.geer = geer
    }
}

var riddingBicycle = RiddingBicycle(currentSpeed: 20.0,geer: 4 )
riddingBicycle.hasBasket = true//提示不能增加篮子
riddingBicycle.currentSpeed = 30.0
print(riddingBicycle.hasBasket)//依然还是false，没有被改变值
print(riddingBicycle.description)


/**
  *便利构造器
***/
class Food {
    var name:String
    init(name:String){
        self.name = name
    }
    convenience init(){
        print("Food convenience init")
        self.init(name:"[Unnamed]")
    }
    func description()->String{
        return "Food(name:\(self.name))"
    }
}

var food1 = Food(name: "Fish")
var food2 = Food()
print(food1.description())
print(food2.description())

class RecipeIngredient: Food {
    var quantity: Int
    init(name: String, quantity: Int) {
        self.quantity = quantity
        super.init(name: name)
    }
    override convenience init(name: String) {
        print("RecipeIngredient convenience init")
        self.init(name:name,quantity:1)
    }
    
    override func description() -> String {
        return "Recipe(name:\(self.name),quantity:\(self.quantity))"
    }
}
//这个继承的init()函数版本跟Food提供的版本是一样的，除了它是将任务代理给RecipeIngredient版本的init(name: String)而不是Food提供的版本
//先调用Food.init(),然后把self.name作为参数调用RecipeIngredient.init(name),最后RecipeIngredient.init(name,quantity)
var recipe1 = RecipeIngredient()
//说明，便利构造器的继承，会继承父类的相应便利构造器，并先调用，然后再调用本类的相应便利构造器去完成所有属性的初始化，否则则无法继承相应的便利构造器，意思就是如果没有override convenience init(name: String)，RecipeIngredient.init()构造器就不存在。override convenience init(name: String)的override等于是继承Food.init构造器

//解释有点绕和复杂，总之自己动手改改代码试验试验就比较好理解

var recipe2 = RecipeIngredient(name: "recipe2")
var recipe3 = RecipeIngredient(name: "recipe2", quantity: 3)

print(recipe1.description())
print(recipe2.description())
print(recipe3.description())

/**
  *可失败构造器
***/
struct Animal {
    let name:String
    init?(name:String){
        if name.isEmpty {
            return nil
        }
        self.name = name
    }
}

let animal = Animal(name: "")//返回的是optional
if let realAnimal = animal {
    print(realAnimal)
}

/**
 * 必要构造器
 ***/
class SomeClass {
    //所有子类必须实现
    required init(){
        
    }
}

var globalVar = "globalVar"

/**
 * 闭包来给属性赋值
 ***/
class SubSomeClass:SomeClass {
    var name:String = {
        return globalVar
    }()//记得最后有个()
    //所有子类必须实现
    required init(){
        
    }
    
    /**
     * 析构过程
     ***/
    deinit{
        print("SubSomeClass被析构了")
    }
    
}

var subSomeInstance = SubSomeClass()
subSomeInstance = SubSomeClass()//重新初始化并将subSomeInstance的引用指向新的实例，那么之前那个引用旧实例旧被回收了

//swift的引用计数原理和objc的类似

//防止循环引用也一样，用weak弱引用就能解决相应的问题

class Person {
    let name:String
    var apartment:Apartment?
    init (name:String){
        self.name = name
    }
    deinit{
        print("Person had destory")
    }
}

class Apartment {
    let no:Int
    weak var owner:Person?
    init (no:Int){
        self.no = no
    }
    deinit{
        print("Apartment had destory")
    }
    
    func printDescription(){
        if let tempOwner = owner {
            print("This is a apartment of No.\(self.no),it's owner is \(tempOwner.name)")
        } else {
            print("This is a apartment of No.\(self.no),it has not owner!")
        }
    }
}

var person:Person? = Person(name: "Xxx")
var apartment = Apartment(no: 10)
person!.apartment = apartment
apartment.owner = person
apartment.printDescription()

person = nil//这里被销毁了
apartment.printDescription()//weak 弱引用在这里就变成nil了
//apartment的引用计数变为1

