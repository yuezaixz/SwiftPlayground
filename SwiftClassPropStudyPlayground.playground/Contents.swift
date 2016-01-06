//: Playground - noun: a place where people can play

struct Rectangle {
    var width:Int;//要不带类型，要不带初始值，否则类型无法判断
    var height:Int;
    var x:Int;
    var y:Int;
    let name:String;//常量类型的属性，如果定义了，就不能在逐一构造器中初始化了
}

//结构体逐一构造器
var rect = Rectangle(width: 10, height: 10,x: 5,y: 5, name: "Rect1")

rect.width = 20
//rect.name = "aa"//初始化了，不能了

//不能这样构造，一定要用逐一构造器，因为代码里面没有进行初始化
//var rect2 = Rectangle()

struct Circle {
    var radius = 0;
}

var circle1 = Circle()//初始化了就可以不用逐一构造器了
var circle2 = Circle(radius: 2)
print("circle1.r:\(circle1.radius),circle2.r:\(circle2.radius)")

//延迟存储属性

enum SexType:Int {
    case Male = 0,Female,Unknow
}

class Person {
    var name:String = "";
    var sex:SexType = .Male;
}

class Family {
    lazy var father = Person()
    lazy var mother = Person()
    var childs = [Person]()
    var categorys = [String]()
}


var davidAndTyFamily = Family()
davidAndTyFamily.categorys.append("Love")
davidAndTyFamily.categorys.append("Cook")
davidAndTyFamily.categorys.append("Music")
davidAndTyFamily.categorys.append("Happy")
//到这时候，father和mother都还没初始化

//可以用extension来添加计算属性，但是不能添加存储属性
//结构体的计算属性,分为读写和只读
extension Rectangle {
    var center:(Int,Int) {//读写计算属性
        get{
            let centerX = x + width/2
            let centerY = x + height/2
            return (centerX,centerY)
        }
        set(newCenterPoint){
            x = newCenterPoint.0 - width/2
            y = newCenterPoint.1 - height/2
        }
    }
    var area:Int {//只读计算属性
        return width*height
    }
}

print(rect)
print(rect.center)
rect.center = (10,10)
print(rect.x,rect.y)
print(rect.area)

//结构体的属性观察器
struct Point{
    var x = 0 {
        willSet(newX) {
            print("will set new x:\(newX)")
        }
        didSet {
            print("did set new x:\(x) to replace old x:\(oldValue)")//did中可以用oldValue来获取旧值
        }
    }
    var y = 0
}

var point1 = Point(x: 10, y: 10)//这里不会触发属性观察期

point1.x = 15//这里才触发了属性观察期


//局部变量和全局变量都可以使用属性观察器
var testVal = 0{
    willSet(newVal) {
        print("will set new val:\(newVal)")
    }
    didSet {
        print("did set new x:\(testVal) to replace old x:\(oldValue)")//did中可以用oldValue来获取旧值
    }
}

testVal = 40


