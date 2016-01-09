
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
