//: Playground - noun: a place where people can play

import UIKit

//日期
var today :NSDate = NSDate()
var format:NSDateFormatter = NSDateFormatter()
//大写的YYYY应该是以本周的周六在哪年来计算的
//比如，2015年12月29日是周二，本周的周六在2016年，所以"YYYY-MM-dd"->"2016-12-29"
//总之，切记用小写的yyyy
format.dateFormat = "YYYY-MM-dd"
format.stringFromDate(today)
format.dateFormat = "yyyy-MM-dd"
format.stringFromDate(today)




