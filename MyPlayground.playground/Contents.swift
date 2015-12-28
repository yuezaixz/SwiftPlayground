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
//下面3行编译错误，以为非可选变量没有赋值是不能使用的
//print(surveyAnswer2)
//var surveyAnswer3 = surveyAnswer2
//if surveyAnswer2 != "" {
//    print("surveyAnswer2不为空")
//}

//可以这样判断可选变量是否为nil
if surveyAnswer != nil {
    print("surveyAnswer不为空")
}

//可选绑定
if var tempSurveyAnswer = surveyAnswer {
    print("该if意思为，可选绑定，如果可选变量不为空，就把他赋值给一个临时的变量（或临时常量）")
}

if var isaNumber = Int(aString) {
    //转换成功后的isaNumber不需要用！解析了。
    print("可以用可选绑定来判断一个字符串是否为数字（\(isaNumber)），是的话就把他赋值给一个临时变量。")
} else {
    //这里不能用isaNumber，因为他只有在if的逻辑块中能使用
//    print("转换失败，（\(isaNumber)）不是数字")
    print("转换失败，（\(aString)）不是数字")
}

//多个可选绑定

if var tempSurveyAnswer = surveyAnswer,
    var isaNumber = Int(aString){
    print("该if意思为，可选绑定，如果可选变量不为空，就把他赋值给一个临时的变量（或临时常量）")
}

//隐式解析可选类型，直接使用不用解析。
//隐私解析：第一次赋值之后就可以确定之后一直有值的时候
var assumedString:String! = "aaa"
print(assumedString)
assumedString = nil
//print(assumedString)//报错，可以赋值为Nil,但是不能使用
//注意:“如果一个变量之后可能变成nil的话请不要使用隐式解析可选类型。如果你需要在变量的生命周期中判断是否是nil的话，请使用普通可选类型。”

//空合运算符，如果assumedString不为空，就对assumedString进行拆包并返回，如果assumedString为空则返回??后的变量
var otherAssumedString = assumedString ?? "aa"// 其实就是三目运算符的简化 assumedString != nil ? assumedString! : "aa"

//区间运算符
var itemStr:String = ""
for item in (1...10){//包含1和10
    itemStr += String(item)
}
print(itemStr)

//半开区间运算符
itemStr = ""
for item in (1..<10){//包含1不包含10
    itemStr += String(item)
}
print(itemStr)

//半开区间运算符就不行半开前半部分
//itemStr = ""
//for item in (1<..10){//包含1不包含10
//    itemStr += String(item)
//}
//print(itemStr)

//String是值类型，赋值其实就是copy，赋值后改变原始值，不会影响新的String变量，如下例子
var itemStrCopy = itemStr
print(itemStr,",","",itemStrCopy)
itemStr += "hahah"
print(itemStr,",","",itemStrCopy)

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

//测试下几个闭包(filter,map,reduce)
var oddArray = aArray.filter{$0%2 == 1 }
var tenMultipleArray = aArray.map{$0*10}
var sumForaArray = aArray.reduce(0, combine: {$0+$1})
print("[1,2,3,4]'s odd is ",oddArray)
print("[1,2,3,4]*10=",tenMultipleArray)
print("1+2+3+4=",sumForaArray)

//String可以遍历成Character
"Hello world!".characters.forEach {
    print($0)
}

//打印Unicode
print("\u{2665}")

//计算字符串长度
let unusualMenagerie = "Koala 🐨, Snail 🐌, Penguin 🐧, Dromedary 🐪"
print(unusualMenagerie.characters.count)

//字符串的 startIndex ,endIndex为它的索引，表示他的第一个Character和最后一个Character的索引
//索引是链表结构，通过successor(下一个)，predecessor（上一个），advancedBy（往后几个）来在链表中换了的玩耍
print(unusualMenagerie.startIndex,":",unusualMenagerie[unusualMenagerie.startIndex])
print(unusualMenagerie.startIndex.successor(),":",unusualMenagerie[unusualMenagerie.startIndex.successor()])
print(unusualMenagerie.endIndex.predecessor(),":",unusualMenagerie[unusualMenagerie.endIndex.predecessor()])
print(unusualMenagerie.startIndex.advancedBy(10),":",unusualMenagerie[unusualMenagerie.startIndex.advancedBy(10)])

//indices为字符串 的所有index的集合
for index in unusualMenagerie.characters.indices {
    print(unusualMenagerie[index])
}

//用index来插入操作，可以插入一个字符，也可以插入一堆字符。remove操作类似
var testIndexStr = "this is test index str"

testIndexStr.insertContentsOf(" an".characters, at: testIndexStr.startIndex.advancedBy(7))

//字符串相等，以什么开头，以什么结尾
if testIndexStr == "this is an test index str"{
    print("testIndexStr equal \(testIndexStr)")
}

if testIndexStr.hasPrefix("this"){
    print("testIndexStr has a prefix(this)")
}

if testIndexStr.hasSuffix("str"){
    print("testIndexStr has a suffix(str)")
}

//可以直接用contrains来判断字符串是否包含某字符串
print(testIndexStr.containsString("test"))

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
