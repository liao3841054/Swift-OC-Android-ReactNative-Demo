//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

print("Hello world")

let myConstant = 42
var floatx = 4.0


let label = "The width is"
let width = 94
let widthLabel = label + " " + String(width)
let widthLabel2 = label + " \(width + width)"
//\()

var shopingList = ["One", "Two " , "Three" ,]

shopingList[1] = "Four"

shopingList

var emptyArray = [String](arrayLiteral: "A","B")
let emptyDictionary = [NSString:Float]()

let emptyArray2 = [];
let emptyDictionary2 = [:]

var optionString: String? = nil

var greeting = "xxxx"

if let name = optionString {
    greeting = "Hello ,\(name)"
}
greeting

let nickName: String? = "A"
let fullName: String?

var infomalGreet = "Hi \(nickName)"
if (nickName != nil) {
    infomalGreet = "Hi1 \(nickName)"
}

let interstingNumbers = [
    "prime": [2,3,4,5,51],
    "Squeare": [1,2.2,2,2,90]
]

var largest = 0.0

for (kind,numbes) in interstingNumbers {
    for num in numbes {
        if num > largest {
            largest = num
        }
    }
}
largest

for i in 0...4 {
    print(i)
}


// 函数 和 闭包
func greet(name: String, day: String) -> String {
    
    return "Hello \(name), Today is \(day)"
}

greet("luobo", day: "TuesDay")


func calculateStatiscs(scores:[Int]) -> (min:Int,
    max:Int,sum:Int) {
    
    return (3,23,212)
}

let statistics = calculateStatiscs([33,33,2,323,22,222])
statistics.sum

// 可变数组

func sumOf(numbers:Int...) -> Int {
    var sum = 0
    for num in numbers {
        sum += num
    }
    return sum
}

sumOf(3,2,2,2,6)






