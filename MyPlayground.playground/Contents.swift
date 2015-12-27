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

//元组
let aTuple = (1,"Hello")
print(aTuple.0,aTuple.1)

//带标签的元组
let bTuple = (bNumber:2,bString:"World")
print(bTuple.bNumber,bTuple.bString)

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
