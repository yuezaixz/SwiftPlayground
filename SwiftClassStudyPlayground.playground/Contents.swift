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




























