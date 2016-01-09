//枚举，swift的枚举也是非常神奇的东西
enum ProgramLanguage:String{
    case Swift
    case Objc
    case C
    case CPP
    case Java
    case Javascript
    case Heping
}
//也可以这样写
enum ProgramLanguage2{
    case Swift,Objc,C,CPP,Java,Javascript,Heping
}

var tyLanguage = ProgramLanguage.Heping

//当定义了枚举类型时候可以用缩写法
var davidLanguages:Array<ProgramLanguage> = [.Swift,.Objc,.Java,.Javascript]

//枚举的switch
switch tyLanguage {
case .Java:
    print("Tangtang can code Java")
case .Objc:
    print("Tangtang can code Objc")
case .Heping:
    print("Tangtang can code Heping")
default:
    print("Tangtang can code other language")
}

//枚举的成员
//“定义一个名为Barcode的枚举类型，它可以是UPCA的一个相关值（Int，Int，Int，Int），或者是QRCode的一个字符串类型（String）相关值。”
enum Barcode {
    case UPCA(Int, Int, Int, Int)//条形码
    case QRCode(String)//二维码
}

var mySolkeyInsoleUPCA = Barcode.UPCA(8, 83920, 53216, 3)
var mySolketOnsoleQRCode = Barcode.QRCode("FKDAF-FDAFF-3FDGS-FVWED-FEWVD")

//枚举是值类型
var mySolkeyInsoleUPCA2 = mySolkeyInsoleUPCA
mySolkeyInsoleUPCA = Barcode.UPCA(9, 83920, 53216, 3)
//值类型赋值就是值拷贝
print("第一个二维码为\(mySolkeyInsoleUPCA),第二个二维码为\(mySolkeyInsoleUPCA2)")

//switch就要这么写了
func printSolkeyInfo(productCode:Barcode){
    switch productCode {
        //参数必须用常量
    case .UPCA(let numberSystem, let manufacturer, let product, let check):
        print("Your Solkey's UPC-A: \(numberSystem), \(manufacturer), \(product), \(check).")
    case .QRCode(let productCode):
        print("Your Solkey's QR code: \(productCode).")
    }
}
printSolkeyInfo(mySolkeyInsoleUPCA)
printSolkeyInfo(mySolketOnsoleQRCode)

//原始值类型,这里原始值类型设置为Character，可以用来设置一些比较常用的字符
enum ASCIIControlCharacter: Character {
    case Tab = "\t"
    case LineFeed = "\n"
    case CarriageReturn = "\r"
}

print("This is first line\(ASCIIControlCharacter.LineFeed.rawValue)This is second line")

//原始值的隐式赋值
enum Planet: Int {//Venus就是2
    case Mercury = 1, Venus, Earth, Mars, Jupiter, Saturn, Uranus, Neptune
}
//通过原始值创建枚举
var planet = Planet(rawValue: 3)
print(planet!)//因为编译器认为可能不存在，所以是optional类型

//String类型的枚举的原始值默认为他本是
print("\(ProgramLanguage.Java.rawValue)")

//枚举的递归
enum ArithmeticExpression {
    case Number(Int)
    indirect case Addition(ArithmeticExpression, ArithmeticExpression)
    indirect case Multiplication(ArithmeticExpression, ArithmeticExpression)
}

//indirect表示该枚举的所有成员都是可递归的
func evaluate(expression: ArithmeticExpression) -> Int {
    switch expression {
    case .Number(let value):
        return value
    case .Addition(let left, let right):
        return evaluate(left) + evaluate(right)
    case .Multiplication(let left, let right):
        return evaluate(left) * evaluate(right)
    }
}

print(evaluate(ArithmeticExpression.Number(3)))
print(evaluate(ArithmeticExpression.Addition(.Number(6), .Number(8))))
print(evaluate(ArithmeticExpression.Multiplication(.Number(12), .Number(2))))

//用枚举定义错误类型,ErrorType是protocol，遵循 ErrorType 协议就可以定制自己的 error type
enum ParseError: ErrorType {
    case MissingAttribute(message: String)
}

func notNull(str: String?) throws//throws写在返回类型前面
    -> String {
        guard let notNullStr = str else {
            let message = "Expected notNull String"
            throw ParseError.MissingAttribute(message: message)
        }
        return notNullStr;
}

do {//swift 是 do catch
    let testStr:String? = nil
    let notNullStr = try notNull(testStr) //注意，可能异常地方要try.
} catch ParseError.MissingAttribute(let message) {
    print("\(message)")
}


//如果保证不出错误，可以用 try!,就可以不用catch
let testThrowStr:String?
testThrowStr = "testtest"
print("\(try! notNull(testThrowStr))")


//也可以用try?，返回值如果有会包在optional里，如果为空则返回nil
let testMaybeThrowStr:String? = nil
print("\(try? notNull(testThrowStr))")
print("\(try? notNull(testMaybeThrowStr))")