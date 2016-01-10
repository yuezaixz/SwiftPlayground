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


