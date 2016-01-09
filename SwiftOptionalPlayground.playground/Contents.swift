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

//用可选绑定来判定是否移除了元素
var favoriteGenres:Set = ["Rock","Classical","Hip hop"]
favoriteGenres.insert("Jazz")
favoriteGenres.insert("Rock")//Set是hash唯一的
if let removedGenre = favoriteGenres.remove("Rock") {
    print("\(removedGenre)? I'm over it ")
} else {
    print("i never much cared for that.")
}
var conditonStr : String? = "a String"
if conditonStr != nil {
    print("不为空")
} else {
    print("为空")
}
//上面那个就ok了，为什么还要有 if let 语句呢
//因为顺便完成了optional的拆包
if let theStr = conditonStr {
    //字符串占位符
    print("不为空'\(conditonStr!)'")
} else {
    print("为空")
}
