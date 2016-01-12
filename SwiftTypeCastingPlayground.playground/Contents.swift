class Animal {
    
}

class Mammals:Animal {//哺乳动物
    
}

class Amphibians:Animal {//两栖动物
    
}

class Human:Mammals {
    
}

class Monkey:Mammals {
    
}

//AnyObject 可以是任何类型的实例
var aAnimal:AnyObject = Monkey()
//Any可以是任何类型，包括function types
var aStr:Any = "11"

//用is可以判断是否为该类型或者该类型的子类
if aStr is String {
    print(aStr)
}

if aAnimal is Amphibians {
    print("monkey is Amphibians ")
} else if aAnimal is Mammals {
    print("monkey is Mammals ")
}

//不确定的转换，转换结果未optional，如果转换失败为nil
var aMonkey = aAnimal as? Monkey
print(aMonkey)
//as! 确定为该类型的转换，如果转换失败为运行时异常
var otherMonkey = aAnimal as! Monkey
print(otherMonkey)

//混合类型的数组
var objects:[Any] = [Animal(),Mammals(),Human(),"aaa"]

