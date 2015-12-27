//: Playground - noun: a place where people can play

import UIKit

//“一般来说你很少需要写类型标注。如果你在声明常量或者变量的时候赋了一个初始值，Swift可以推断出这个常量或者变量的类型”
var str:String = "Hello, playground"

print(str+"!")

//“以用任何你喜欢的字符作为常量和变量名，包括 Unicode 字符”
var 哈哈 = "HaHa"

print(哈哈+"!")

//“不能以数字开头，但是可以在常量与变量名的其他地方包含数字”
var ha11ha = "哈哈"
//var 11haha = "haha" //error 报错

//多个以,分隔，以空字符串换行。
//默认separator为空字符，terminator为\n
print("aaa","bbb","ccc", separator: ",", terminator: "")

//\(var) 作为占位符
print("\(str),\(哈哈),I am David!")

print("UInt8.min:\(UInt8.min),UInt8.max:\(UInt8.max)")
print("UInt16.min:\(UInt16.min),UInt16.max:\(UInt16.max)")
print("UInt32.min:\(UInt32.min),UInt32.max:\(UInt32.max)")
print("UInt64.min:\(UInt64.min),UInt64.max:\(UInt64.max)")
print("Int64.min:\(Int64.min),Int64.max:\(Int64.max)")

//全都是10
var number10 = 10
var number16 = 0xa
var number2 = 0b1010
var number8 = 0o12

print(number2,number8,number10,number16)

//可以用_来划分
var numberWithMark = 12_312_312_414

//科学计数法的浮点数
var floatE1 = 1.25e2
var floatE2 = 1.25e-2

//类型转化
print("\(Int(floatE2)),\(String(floatE2))")

//不同类型的数据相加，如果不是同一个类型不能做+操作，更没法类型推断，编译不通过
let twoTousand:UInt16 = 2_000
let one:UInt8 = 1
let towTousandAndOne = twoTousand + UInt16(one)
//整数和浮点数相加也必须做类型转换
let three = 3
let pi = Double(three) + 0.14159
//这样加就不会保存，因为字面量的数字是没有明确类型的
let pi2 = 3 + 0.14159

//但是字面量的数字还是不像Java可以字符串+数字，Swift是类型安全且不自动转化
//var strPlusNumberStr = "aaa"+1

//给类型取别名
typealias Haha = UInt16
print("\(Haha.max)")

//不像Objc，可以直接用 数字当做Bool型用
if Bool(three) {// or three > 0 ,一般是用这个
    print("\(three) > 0")
}

//最后一个参数可以是可变参数
func sumNumbers(numbers:Int...) -> Int {
    var total = 0
    for number in numbers {
        total += number
    }
    return total
}

let sum = sumNumbers(1,2,3,4,5,6,7,8,9,10)
print(sum)

//可选变量

var anOptionalInteger : Int? = nil
anOptionalInteger = 42
print(anOptionalInteger!)//可选变量拆包

//声明可选变量为已拆包
var otherOptionalInteger : Int! = nil
otherOptionalInteger = 43
print(otherOptionalInteger)

let aString = String(otherOptionalInteger)
print(aString,":",otherOptionalInteger)

var aNumber = Int(aString)
//这里转换返回一个可选类型，因为构造器可能失败
print(aNumber)
var anotherNumber = Int("12a")//转换失败，即为nil

//不是可选变量，就不能赋值为nil
//var intNumber:Int = nil

//可选变量创建不赋值，默认即为nil
var surveyAnswer :String?

var surveyAnswer2 :String
//下面2行编译错误，以为非可选变量没有赋值是不能使用的
//print(surveyAnswer2)
//var surveyAnswer3 = surveyAnswer2

//元组，尽量只用于临时的数据结构，对于复杂或不是临时使用的最好不要用元组
let aTuple = (1,"Hello")
print(aTuple.0,aTuple.1)

//带标签的元组
let bTuple = (bNumber:2,bString:"World")
print(bTuple.0,bTuple.bNumber,bTuple.bString)//带标签也还能用数字下标

//元组,类型为（Int,String）
let http404Error = (404,"Not Found")
let (errorCode,errorMsg) = http404Error//可以类型Python这样操作
print(http404Error.0,http404Error.1, errorCode, errorMsg, separator: ",", terminator: "[End]")

//数组，默认类型，常量数组内容不能变化
let aArray = [1,2,3,4]
//指定类型的数组
let bArray : [Int] = [5,6,7,8]

var cArray = [Int]()

cArray.append(9)

cArray.appendContentsOf([10,11,12])

cArray.insert(13, atIndex: 2)


print(aArray,bArray,cArray,cArray.reverse()[0],cArray.count)

//字典
var paodong = ["CEO":"axuan","Programer":"David","PO":"ken","Pet":"ZeroSon"]
//key和value都是数字的字典
var numberDict = [0:1,1:2,2:4,3:8,4:16]
print(paodong["CEO"]!,numberDict[1]!)

//遍历
for index in 0 ... 4 {
    print(numberDict[index]!)
}

//遍历
for index in 0 ..< 4 {
    print(numberDict[index]!)
}

for var i = 0; i <= 4; i++ {
    print(numberDict[i])
}

var conditonStr : String? = "a String"
if conditonStr != nil {
    print("不为空")
} else {
    print("为空")
}
//上面那个就ok了，为什么还要有 if let 语句呢
if let theStr = conditonStr {
    //字符串占位符
    print("不为空'\(conditonStr!)'")
} else {
    print("为空")
}

//swift的switch 支持 数字、字符串、元组，还支持表达式
var someNumber = 15
switch someNumber {
case 0...15:
    print("0~15")
    //注意，swift中不用break
case 15...30:
    print("15~30")
default:
    print("other")
}
