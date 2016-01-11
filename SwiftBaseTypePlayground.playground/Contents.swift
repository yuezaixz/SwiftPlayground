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

//String是值类型，赋值其实就是copy，赋值后改变原始值，不会影响新的String变量，如下例子
var itemStr:String = ""
var itemStrCopy = itemStr
print(itemStr,",","",itemStrCopy)
itemStr += "hahah"
print(itemStr,",","",itemStrCopy)

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
//print(testIndexStr.containsString("test"))

