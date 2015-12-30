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

//几种构造方式
//数组，默认类型，常量数组内容不能变化
let aArray = [1,2,3,4]
//指定类型的数组
let bArray : [Int] = [5,6,7,8]

var cArray = [Int]()

//数组的相加
var dArray = aArray + bArray
print(dArray)
//特殊的方式去索引，可惜没Python的数组那么强大
print(dArray[3...5])
print(dArray[3..<5])

//构造重复的数组
var eArray = [Int](count: 5, repeatedValue: 3)

//添加
cArray.append(9)

//添加数组
cArray.appendContentsOf([10,11,12])

//插入
cArray.insert(13, atIndex: 2)


//reverse 反向
//removeAtIndex移除指定索引，并返回值
print(aArray,bArray,cArray,cArray.reverse()[0],cArray.count,eArray.removeAtIndex(1))

//测试下几个闭包(filter,map,reduce)
var oddArray = aArray.filter{$0%2 == 1 }
var tenMultipleArray = aArray.map{$0*10}
var sumForaArray = aArray.reduce(0, combine: {$0+$1})
print("[1,2,3,4]'s odd is ",oddArray)
print("[1,2,3,4]*10=",tenMultipleArray)
print("1+2+3+4=",sumForaArray)

//Set
var letters = Set<String>()
var favoriteGenres:Set = ["Rock","Classical","Hip hop"]
favoriteGenres.insert("Jazz")
favoriteGenres.insert("Rock")//Set是hash唯一的

//用可选绑定来判定是否移除了元素
if let removedGenre = favoriteGenres.remove("Rock") {
    print("\(removedGenre)? I'm over it ")
} else {
    print("i never much cared for that.")
}

//set 用contains来判断是否含有
print(favoriteGenres.contains("Funk"))

//set 也可以用循环
for genre in favoriteGenres {
    print(genre)
}

//sort后返回有序数列
print(favoriteGenres.sort())

//接下来，见证Set的魔法集合操作
var aSet = Set<Int>([1,3,5,6,7,8,9])
var bSet = Set<Int>([2,4,5,6,8,9,10])
print(aSet.intersect(bSet))//交集:intersect
print(aSet.exclusiveOr(bSet))//并集-交集:intersect
print(aSet.union(bSet))//并集:union
print(aSet.subtract(bSet))//aSet去除掉bSet中的元素后的集合:intersect

var cSet = Set<Int>([1,3,5,6,7,8,9])
print(aSet == cSet)//set可以直接用==来判断相等

var dSet = Set<Int>([1,3,5,6])
print(dSet.isSubsetOf(aSet))//判断d被a包含
print(aSet.isSupersetOf(dSet))//判断d被a包含

print(cSet.isStrictSubsetOf(aSet))//严格的判断包含，必须包含不能相等
//isStrictSupersetOf 类似

//是否包含不同值，没有相同值返回true
print(dSet.isDisjointWith(aSet))//false
var eSet = Set<Int>([11,22,33])
print(bSet.isDisjointWith(eSet))//true

//String可以遍历成Character
"Hello world!".characters.forEach {
    print($0)
}

//hash值
var str1 = "Hello world!"
var str2 = "Hello world!"
print(str1.hashValue == str2.hashValue)

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
//几种初始化方式
var namesOfIntegers = [Int:String]()
var paodong = ["CEO":"axuan","Programer":"David","PO":"ken","Pet":"ZeroSon"]
//key和value都是数字的字典
var numberDict:[Int:Int] = [0:1,1:2,2:4,3:8,4:16]
print(paodong["CEO"]!,numberDict[1]!)

namesOfIntegers[16] = "sixteen"
namesOfIntegers[18] = "eighten"
print(namesOfIntegers[16])//字典中的value为optional，因为可能是空的
//用updateValue和直接用下标更新的差异在于，update会返回旧值
print(namesOfIntegers.updateValue("eighteen", forKey: 18))
namesOfIntegers.removeAll()//清空1
namesOfIntegers = [:]//清空2

//遍历字典
for (job,name) in paodong {
    //这里的name不是可选类型了
    print("job:\(job),name\(name)")
}

for index in numberDict.keys {
    print(index)
}
//将values转成数组
let numberValues = [Int](numberDict.values)

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

//swift的switch 支持 数字、字符串、元组，还支持表达式，也可以是『，』分割的一堆表达式
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

//元组的匹配
let somePoint  = (1,1)
//可以用_来代替通配
switch somePoint {
case (0,0):
    print("point is an the origin")
case (_,0):
    print("point is on the x-axis")
case (0,_):
    print("point is on the y-axis")
default:
    print("point is flying")
}

//元组匹配还可以这样
let otherPoint  = (0,4)
//可以用变量来代替通配
switch otherPoint {
case (0,0):
    print("point is an the origin")
case (let x,0):
    print("point is on the x-axis with an x value of \(x)")
case (0,let y):
    print("point is on the y-axis with an y value of \(y)")
default:
    print("point is flying")
}

//元组匹配又可以这样
let anotherPoint  = (1,-1)
//可以用变量来代替通配
switch anotherPoint {
case let(x,y) where x == y:
    print("point is an the line x == y")
case let(x,y) where x == -y:
    print("point is an the line x == -y")
case let(x,y):
    print("pooint is flying")
}

for var testIndex in 1...5{
    switch testIndex {
    case 1:
        continue;
    default:
        print(1)
    }
    print(testIndex)//两个地方打印次数一样，说明continue是直接continue了整个for循环
}

//日期
var today :NSDate = NSDate()
var format:NSDateFormatter = NSDateFormatter()
//大写的YYYY应该是以本周的周六在哪年来计算的
//比如，2015年12月29日是周二，本周的周六在2016年，所以"YYYY-MM-dd"->"2016-12-29"
//总之，切记用小写的yyyy
format.dateFormat = "YYYY-MM-dd"
format.stringFromDate(today)
format.dateFormat = "yyyy-MM-dd"
format.stringFromDate(today)

//guard 提前退出，比if更有可读性,gurad的条件成立就继续往下执行，否则执行else后的代码块
func doSomething(person:[String:String]) ->Bool{
    guard let personName = person["name"] else {
        return false;
    }
    print("\(personName) begin to do something!")
    return true;
}

if #available(iOS 9,OSX 10.10,*){//可以多个,比如 平台1，平台2，*
    
}

func doSomething(person:String="David",thing:String="sleeping"){
    print("\(person) is doing \(thing)")
}

//第二个参数为外部参数，所以必须带参数名
doSomething("david", thing: " studying")

doSomething()//有默认值，就可以不填参数

//如果不声明是var，那么默认为let，不能修改传参数
//有时候为了少写点代码，直接用参数作为临时变量使用
func changeIntParam(var willChangeNumber:Int){
    willChangeNumber = 11
}

//输入输出参数
func realChangeIntParam(inout willChangeNumber:Int){
    willChangeNumber = 11
}

var willChangeNumber = 9
changeIntParam(willChangeNumber)
print(willChangeNumber)
realChangeIntParam(&willChangeNumber)
print(willChangeNumber)//修改为11了


//函数的类型
//changeIntParam (Int)->void
//doSomething ([String:String]->Bool)

var doSomething2:([String:String])->Bool = doSomething

doSomething2(["name":"David"])

//函数作为参数
func callFunction(function:([String:String])->Bool){
    function(["name":"TY"])
}

callFunction { (person) -> Bool in
    guard let personName = person["name"] else {
        return false
    }
    print("My name is \(personName),hello world!")
    return true
}
//
//func chooseStepFunction(backwards:Bool) -> (Int) -> Int {
//    func stepForward : {(input) -> Int in return ++input}
//    func stepBackward : {(input) -> Int in return --input}
//    return backwards?stepForward:stepBackward
//}


