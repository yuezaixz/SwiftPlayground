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