import UIKit

protocol GenericProtocol {
    typealias AbstractType
    func magic() -> AbstractType
}

//这里会报错，因为magic返回的类型是个泛型，是不确定的
//let list : [GenericProtocol] = []


func genericFunc<T>(ts : [T]) -> Bool {
    print(ts.dynamicType)//输出 Array<Int>
    return true;
}

genericFunc([1,2,3,4])

struct Database {
}

protocol DatabaseInjectable {
    static func deriveObjectFromDBRow(row: [String]) -> Self? // Method - 1
    
//    static func collectAllObjectsForDatabaseAction(action: (Database) -> Void) -> [Self]? // Method - 2
}

class SampleClass: DatabaseInjectable {
    required init() {
    }
    static func deriveObjectFromDBRow(row: [String]) -> Self? {
        let result = self.init()//这里必须返回抽象的类型，因为其子类也可能调用该方法
        return result
    }
    
//    会报错，因为无法确定子类型
//    static func collectAllObjectsForDatabaseAction(action: (Database) -> Void) -> [Self]? {
//        return [self.init(),self.init(),self.init()]
//    }
}


//如果一定要返回Self的数组，那么估计只能这么做了吧
protocol DatabaseInjectable2 {
    typealias MyClass
    
    static func collectAllObjectsForDatabaseAction(action: (Database) -> Void) -> [MyClass]? // Method - 2
}

class SampleClass2: DatabaseInjectable2 {

    typealias MyClass = SampleClass2
    
    required init() {
    }
    
    static func collectAllObjectsForDatabaseAction(action: (Database) -> Void) -> [MyClass]? {
        return [self.init(),self.init(),self.init()]
    }
}

//如果swift的protocol能支持泛型就好了。





//通过协议，来完成在函数中泛型和数字的对比
protocol MyFloats : Comparable {
    init(_ value: Double)
}

extension Double : MyFloats { }
extension Float : MyFloats { }
extension CGFloat : MyFloats { }

func sign<T:MyFloats> (value:T) -> T {
    if value < T(0.0) { // 如果直接用泛型不用这种方式的话，就会出现之后的错误 error: Binary operator '<' cannot be applied to operands of type 'T' and 'Double'
        return T(-1.0)
    }
    if value > T(0.0) {
        return T(1.0)
    }
    return T(0.0)
}



//比较结构体，一不一个一个属性去比较，又不写一堆的case

//其实就是利用协议扩展，把所有用到的类型，都实现 isEqualTo 方法，用于比较类型是否相对。下面的例子只举了基本类型，自定义类型，也可以满足这个协议实现比较。
//利用 Mirror 函数，得到结构体中所有属性的 list，然后逐个比较

/* Let a heterogeneous protocol act as "pseudo-generic" type
for the different (property) types in 'SuperStruct'         */
protocol MyGenericType {
    func isEqualTo(other: MyGenericType) -> Bool
}
extension MyGenericType where Self : Equatable {
    func isEqualTo(other: MyGenericType) -> Bool {
        if let o = other as? Self { return self == o }
        return false
    }
}

struct SuperStruct {
    var field1: Int = 0
    var field2: String = ""
    // lots of lines...
    var field512: Float = 0.0
}

extension SuperStruct: Equatable {
}


/* Extend types that appear in 'SuperStruct' to MyGenericType  */
extension Int : MyGenericType {}
extension String : MyGenericType {}
extension Float : MyGenericType {}
// ...

/* Finally, 'SuperStruct' conformance to Equatable */
func ==(lhs: SuperStruct, rhs: SuperStruct) -> Bool {
    
    let mLhs = Mirror(reflecting: lhs).children.filter { $0.label != nil }
    let mRhs = Mirror(reflecting: rhs).children.filter { $0.label != nil }
    
    for i in 0..<mLhs.count {
        guard let valLhs = mLhs[i].value as? MyGenericType, valRhs = mRhs[i].value as? MyGenericType else {
            print("Invalid: Properties 'lhs.\(mLhs[i].label!)' and/or 'rhs.\(mRhs[i].label!)' are not of 'MyGenericType' types.")
            return false
        }
        if !valLhs.isEqualTo(valRhs) {
            return false
        }
    }
    return true
}

/* Example */
var a = SuperStruct()
var b = SuperStruct()
a == b // true
a.field1 = 2
a == b // false
b.field1 = 2
b.field2 = "Foo"
a.field2 = "Foo"
a == b // true
