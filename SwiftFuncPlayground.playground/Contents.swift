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

func chooseStepFunction(backwards:Bool) -> (Int) -> Int {
    let stepForward = {(input:Int) -> Int in return input+1};
    let stepBackward = {(input:Int) -> Int in return input-1};
    //    return stepForward
    if backwards{
        return stepForward
    } else {
        return stepBackward
    }
}

var step = 0
step = chooseStepFunction(true)(step)
step = chooseStepFunction(true)(step)
step = chooseStepFunction(false)(step)
step = chooseStepFunction(true)(step)

func someFunctionThatTakesClosure(closure:()->Void){
    closure()
}

someFunctionThatTakesClosure({
    print(1)
})

//尾随闭包
someFunctionThatTakesClosure(){
    print(2)
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

//用_作为前缀，就可以声明不需要外部名称
func testFuncParam(param1:Int,_ param2:Int){
    print(param1,param2)
}
testFuncParam(1, 2)

//autoclosure 定义简易的自动闭包
func logIfTrue(@autoclosure predicate:() -> Bool){
    if predicate() {
        print("Log")
    }
}

logIfTrue(3>2)

