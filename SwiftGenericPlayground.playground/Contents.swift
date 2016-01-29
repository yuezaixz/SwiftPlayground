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

