//: Playground - noun: a place where people can play

class SumUtil {
    var numbers:Array<Int> = [];
    func addNumber (numbers:Int...){
        for number in numbers {
            //用self来调用属性，就不担心内部参数名和属性名冲突
            self.numbers.append(number)
        }
    }
    
    func addNumber (number:Int,numberOfAddingTimes:Int){
        for var i = 0;i<numberOfAddingTimes;i++ {
            //使用已知的属性或者方法名，而且又不与局部冲突，就可以不用写self，不过我觉得还是尽量写self吧。
            numbers.append(number)
        }
    }
    
    //实例方法
    func sum () -> Int {
        return numbers.reduce(0, combine: {$0+$1})
    }
    
    func reset() {
        numbers = []
    }
}

var sumUtil = SumUtil()
print(sumUtil.sum())
sumUtil.addNumber(3,6,8,2,4)
print(sumUtil.sum())
sumUtil.reset()
print(sumUtil.sum())

//可以看出，第一个参数不需要指定外部参数名，而第二个参数就需要了。addNumber(_:numberOfAddingTimes:)
//swift这样设定就是为了让方法在被调用时候就明确他的作用，否则像Java那样参数
//一多，就很难方便作用容易出错
sumUtil.addNumber(5, numberOfAddingTimes: 3)

//变异方法

//“结构体和枚举是值类型。一般情况下，值类型的属性不能在它的实例方法中被修改
//但是如果需要可以用mutating来修饰实例方法，他会返回一个新的实例对象赋给self

struct Point {
    var x = 0.0,y = 0.0
    mutating func moveTo(newX:Double,newY:Double){
        self.x = newX
        self.y = newY
    }
    
    func moveTo2(newX:Double,newY:Double){
        //没有加mutating，下面会报错
//        self.x = newX
//        self.y = newY
    }
}

var point1 = Point()
print(point1)
point1.moveTo(10.0, newY: 12.0)
print(point1)

let point2 = point1
//会报错，常量结构体实例不能调用变异方法
//point2.moveTo(20.0, newY: 22.0)

extension Point {
    //可以直接在编译方法中给self赋值
    mutating func moveByX(newX:Double,newY:Double){
        self = Point(x:self.x+newX,y: self.y+newY)
    }
}

enum WindLevel:Int {
    case low=0,middle,high
    //枚举也可以在编译方法中改变self
    mutating func increase(){
        switch self {
        case .low:
            self = .middle
        case .middle:
            self = .high
        default:
            break
        }
    }
}

