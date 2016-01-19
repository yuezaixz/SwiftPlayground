//: Playground - noun: a place where people can play

struct Rectangle {
    var x = 0;
    var y = 0;
    var width = 0;
    var height = 0;
}

class MyView {
    var x = 0;
    var y = 0;
    var width = 0;
    var height = 0;
    var rects:[Rectangle] = [];
}

let rect1 = Rectangle(x: 10, y: 10, width: 15, height: 15)//结构体逐一构造器
//rect1.width = 20 这里会报错，结构体是值类型，定义为常量，不允许修改内容
var rect3 = rect1//因为是值类型,所以rect3是rect1的拷贝副本
//枚举也是值类型，遵循同样的准则

//而类是引用类型
let rect2 = Rectangle(x: 0, y: 0, width: 20, height: 20)
let view1 = MyView()
//.方式修改值
view1.x = 0;
view1.y = 0;
view1.width = 100;
view1.height = 100;
view1.rects = [rect1,rect2]
print(view1,view1.rects, separator: ",", terminator: "\n")

let view2 = view1
view1.width = 110

//两个view相等，所以是引用类型
print("view1.width:\(view1.width),view2.width:\(view2.width)")

//== 等于
//=== 等价于,相比称呼等于,等价于更适合形容类的引用的相比

//引用类型不能用==来比较
//if view1 == view2 {
//    
//}

if view1 === view2 {
    print("view1 和 view2 引用自同一对象")
}

//“当符合一条或多条以下条件时，请考虑构建结构体：
//
//结构体的主要目的是用来封装少量相关简单数据值。
//有理由预计一个结构体实例在赋值或传递时，封装的数据将会被拷贝而不是被引用。
//任何在结构体中储存的值类型属性，也将会被拷贝，而不是被引用。
//结构体不需要去继承另一个已存在类型的属性或者行为。”

//比如，字符串、数组、字典就都是用结构体实现的
var testArray:Array<Int> = [1,2,3]

var testArray2 = testArray
testArray.append(5)
print(testArray)
print(testArray2)

class Person {
    var name = "";
    var sex = 0;
}

//但是数组中的引用类型，还是引用传递而不是拷贝
var testClassArray:Array<Person> = []
var person1 = Person()
person1.name = "David"
testClassArray.append(person1)

var testClassArray2 = testClassArray
testClassArray2[0].name = "TY"
print(testClassArray[0].name)
print(testClassArray2[0].name)


struct Vector2D {
    var x = 0.0
    var y = 0.0
}

let v1 = Vector2D(x: 1, y: 2)
let v2 = Vector2D(x: 4, y: 6)

//注意，操作符的定义只能在全局范围，不能在局部。而且一个不被公认的操作符使用起来是很危险的，要小心

//可以重载操作符来完成各种操作符操作
func +(left:Vector2D,right:Vector2D) -> Vector2D {
    return Vector2D(x:left.x+right.x,y:left.y+right.y)
}

print(v1+v2)

//重载负号操作符，因为他是前位操作符，所以要prefix，默认是中位
prefix func -(right:Vector2D) -> Vector2D {
    return Vector2D(x:-right.x,y:-right.y)
}

print(-v1)

//还可以增加新的操作符
infix operator +* {//infix 表示这是一个中位操作符，前后都是输入，其他还有prefix(前，操作符在前)和postfix(后)
    associativity none //left为多个计算时候从左到右，right反过来，none表示不会出现多个情况
    precedence 160//算数优先级，乘除法是150，加减是140
}

func +* (left:Vector2D,right:Vector2D) -> Double {
    return left.x*right.x+left.y*right.y
}


print(v1+*v2*2+4) //即为(1*4+2*6)*2+4 = 36.0























