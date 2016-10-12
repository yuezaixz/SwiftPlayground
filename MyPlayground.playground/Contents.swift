//: Playground - noun: a place where people can play

import UIKit

//日期
var today :Date = Date()
var format:DateFormatter = DateFormatter()
//大写的YYYY应该是以本周的周六在哪年来计算的
//比如，2015年12月29日是周二，本周的周六在2016年，所以"YYYY-MM-dd"->"2016-12-29"
//总之，切记用小写的yyyy
format.dateFormat = "YYYY-MM-dd"
format.string(from: today)
format.dateFormat = "yyyy-MM-dd"
format.string(from: today)

//测试同名、同参数列表不同返回值的函数重载

protocol A{
    func foo() -> Int
}

protocol B{
    func foo() ->String
}

class TestClass:A,B {
    func foo() -> Int {
        print("aaa")
        return 1
    }
    func foo() -> String {
        print("bbb")
        return "1"
    }
}

let testInstance = TestClass()
(testInstance as A).foo()
(testInstance as B).foo()

//获取对象类型

//对于objc的对象，这两个这里输出是一样的
print(object_getClass(today))

print(type(of: today))

//但是对于swift原生的对象，就出现了区别
var str = ""
print(object_getClass(str))

print(type(of: str))

//以下为输出
//__NSDate
//__NSDate
//_NSContiguousString
//String

//测试KVO，只有NSObject的子类才行，因为其实他就是objc的runtime特性。
class MyClass:NSObject {
    dynamic var date = Date()//需要KVO的属性要设置dynamic
}

private var myContext = 0

class Class:NSObject {
    var myObject:MyClass!
    
    override init(){
        super.init()
        myObject = MyClass()
        print("初始化了Myclass对象，当前时间为\(myObject.date)")
        myObject.addObserver(self, forKeyPath: "date", options: .new, context: &myContext)
        delay(time: 3){
            self.myObject.date = Date()
        }
        
    }
    
    override func observeValue(forKeyPath keyPath: String?, of object: Any?, change: [NSKeyValueChangeKey : Any]?, context: UnsafeMutableRawPointer?) {
        if let change = change {
            let a = change[NSKeyValueChangeKey.newKey]
            print("日期修改为\(a)")
        }
    }
    
}



//GCD 来实现delay实行block

typealias Task = (_ cancel:Bool) -> Void

func delay(time:TimeInterval , task:@escaping ()->()) -> Task? {
    func dispatch_later(block:@escaping ()->()){
        let when = DispatchTime.now() + time // change 2 to desired number of seconds
        DispatchQueue.main.asyncAfter(deadline: when) {
            block()
        }
    }
    
    var closure:(()->())? = task
    var result :Task?
    
    let delayedClosure : Task = {
        cancel in
        if let internalClosure = closure {
            if (cancel == false) {
                DispatchQueue.main.async {
                    internalClosure()
                }
            }
        }
        closure = nil
        result = nil
    }
    
    result = delayedClosure
    
    dispatch_later{
        if let delayedClosure = result {
            delayedClosure(false)
        }
    }
    
    return result
}

func cancel(task:Task?){
    task?(true)
}

//测试接口返回当前类型的Self
protocol Copyable {
    func copy() -> Self;
}

class Person:Copyable {
    var name:String = "no name"
    
    required init(){//因为Copy用dynamicType调用了init方法，所以必须保证当前类和其子类都能响应这个 init 方法
        
    }
    
    func copy() -> Self {
        let result = type(of: self).init()//这里必须返回抽象的类型，因为其子类也可能调用该方法
        result.name = name
        return result
    }
    
}

//另一种做法

protocol Copyable2 {
    associatedtype MySelf
    func copy() -> MySelf;
}

class Person2:Copyable2 {
    typealias MySelf = Person2
    
    var name:String = "no name"
    func copy() -> MySelf {
        let result = Person2()//这里必须返回抽象的类型，因为其子类也可能调用该方法
        print(type(of: self))//这里其实打印的动态类型已经是SuperMan了
        result.name = self.name
        return result
    }
    
}

class Superman:Person2 {
    
}

var aMan = Superman()
aMan.name = "David"
var bMan = aMan.copy()
print(bMan.name)


//个人认为，第一种方法更好，他可以先调用父类的super.copy完成父类属性的copy，然后在完成自身属性的copy工作


//显示10的23次方，用自然的方式
let font:UIFont? = UIFont(name: "Helvetica", size:20)
let fontSuper:UIFont? = UIFont(name: "Helvetica", size:10)
let attString:NSMutableAttributedString = NSMutableAttributedString(string: "6.022*1023", attributes: [NSFontAttributeName:font!])
attString.setAttributes([NSFontAttributeName:fontSuper!,NSBaselineOffsetAttributeName:10], range: NSRange(location:8,length:2))
attString
