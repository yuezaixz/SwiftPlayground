//区间运算符
var itemStr:String = ""
for item in (1...10){//包含1和10
    itemStr += String(item)
}
print(itemStr)

//半开区间运算符
itemStr = ""
for item in (1..<10){//包含1不包含10
    itemStr += String(item)
}
print(itemStr)

//半开区间运算符就不行半开前半部分
//itemStr = ""
//for item in (1<..10){//包含1不包含10
//    itemStr += String(item)
//}
//print(itemStr)

//几种构造方式
//数组，默认类型，常量数组内容不能变化
let aArray = [1,2,3,4]
//指定类型的数组
let bArray : [Int] = [5,6,7,8]

var cArray = [Int]()

//数组的相加
var dArray = aArray + bArray
print(dArray)
//特殊的方式去索引，可惜没Python的数组那么强大
print(dArray[3...5])
print(dArray[3..<5])

//构造重复的数组
var eArray = [Int](count: 5, repeatedValue: 3)

//添加
cArray.append(9)

//添加数组
cArray.appendContentsOf([10,11,12])

//插入
cArray.insert(13, atIndex: 2)


//reverse 反向
//removeAtIndex移除指定索引，并返回值
print(aArray,bArray,cArray,cArray.reverse()[0],cArray.count,eArray.removeAtIndex(1))

//测试下几个闭包(filter,map,reduce)
var oddArray = aArray.filter{$0%2 == 1 }
var tenMultipleArray = aArray.map{$0*10}
var sumForaArray = aArray.reduce(0, combine: {$0+$1})
print("[1,2,3,4]'s odd is ",oddArray)
print("[1,2,3,4]*10=",tenMultipleArray)
print("1+2+3+4=",sumForaArray)
var aaArray = aArray.sort({$0>$1})
print(aaArray)

//Set
var letters = Set<String>()
var favoriteGenres:Set = ["Rock","Classical","Hip hop"]
favoriteGenres.insert("Jazz")
favoriteGenres.insert("Rock")//Set是hash唯一的

//set 用contains来判断是否含有
print(favoriteGenres.contains("Funk"))

//set 也可以用循环
for genre in favoriteGenres {
    print(genre)
}

//sort后返回有序数列
print(favoriteGenres.sort())

//接下来，见证Set的魔法集合操作
var aSet = Set<Int>([1,3,5,6,7,8,9])
var bSet = Set<Int>([2,4,5,6,8,9,10])
print(aSet.intersect(bSet))//交集:intersect
print(aSet.exclusiveOr(bSet))//并集-交集:intersect
print(aSet.union(bSet))//并集:union
print(aSet.subtract(bSet))//aSet去除掉bSet中的元素后的集合:intersect

var cSet = Set<Int>([1,3,5,6,7,8,9])
print(aSet == cSet)//set可以直接用==来判断相等

var dSet = Set<Int>([1,3,5,6])
print(dSet.isSubsetOf(aSet))//判断d被a包含
print(aSet.isSupersetOf(dSet))//判断d被a包含

print(cSet.isStrictSubsetOf(aSet))//严格的判断包含，必须包含不能相等
//isStrictSupersetOf 类似

//是否包含不同值，没有相同值返回true
print(dSet.isDisjointWith(aSet))//false
var eSet = Set<Int>([11,22,33])
print(bSet.isDisjointWith(eSet))//true


//尾随闭包可以这样缩写
aaArray = aArray.sort{$0>$1}
print(aaArray)

//当闭包需要多行的时候，就不能用表达式了，就需要用到这种形式
var abArray = aArray.map{//map方法也能把原来是Int的数组转化成String的数组
    (var number) -> String in
    var result:String;
    
    result = String(number * 10);
    
    return result;
}

print(abArray)