import Foundation

let rangeStr = "abcdefg"
//Foundation 的方法

//获取字符串子串
rangeStr.substringFromIndex(rangeStr.endIndex.predecessor())
rangeStr.substringToIndex(rangeStr.endIndex.predecessor())

//删除字符，不会改变原来的值，返回删除后的Character集合
let digits = "0123456789"
let tail = String(digits.characters.dropFirst())  // "123456789"
let less = String(digits.characters.dropFirst(3)) // "3456789"
let head = String(digits.characters.dropLast(3))  // "0123456"

//处理字符串的前缀和后缀字符
let prefix = String(digits.characters.prefix(2))  // "01"
let suffix = String(digits.characters.suffix(2))  // "89"

let index4 = digits.startIndex.advancedBy(4)
let thru4 = String(digits.characters.prefixThrough(index4)) // "01234"
let upTo4 = String(digits.characters.prefixUpTo(index4))    // "0123"
let from4 = String(digits.characters.suffixFrom(index4))    // "456789"

var insertStr = "abcdefg" //"abcdefg"
insertStr.insert("z", atIndex: insertStr.startIndex.successor())//azbcdefg
insertStr.insertContentsOf(digits.characters.dropFirst(5), at: insertStr.startIndex.advancedBy(3))//azb56789cdefg

var replaceStr = "abcdefg"
//从第二个字符替换到倒数第三个字符（不包含）为"!!!"
replaceStr.replaceRange(replaceStr.startIndex.advancedBy(1)..<replaceStr.endIndex.advancedBy(-3), with: "!!!")
