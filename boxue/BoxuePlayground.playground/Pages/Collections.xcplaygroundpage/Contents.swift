//: [Previous](@previous)

import Foundation

//: # Collections

//: [Next](@next)

//: Array

//: * 创建数组

var arr1: Array<Int> = Array<Int>()
var arr2: [Int] = []
var arr3 = arr1

//: * 数组赋初值

var arr4 = [Int]()
arr1 = [Int](repeating: 5, count:3)
arr2 = arr1 + arr1
arr3 = [1, 2, 3, 4, 5]

arr1.count
arr4.isEmpty

//: * 数组遍历 - forin/enumerated/foreach

for element in arr1 {
  print(element)
}

for (index, value) in arr2.enumerated() {
  print("\(index) : \(value)")
}

arr2.forEach {
  print($0)
}

//: copy & write:get address

func getBufferedAddress<T>(of arr:[T]) -> String {
  return arr.withUnsafeBufferPointer{ buffer in
    return String(describing: buffer.baseAddress)
  }
}

arr4 = arr1

getBufferedAddress(of: arr1)
getBufferedAddress(of: arr4)
arr1.append(7)
arr1.append(7)
getBufferedAddress(of: arr1)
getBufferedAddress(of: arr4)

//: find & filter element

let arrIndex = arr1.index { $0 == 3 }
arrIndex

let arrFilterIndex = arr1.filter { $0 % 7 == 0 }
arrFilterIndex

type(of: arr1.first)
arr1.removeLast()
type(of: arr1.popLast())
arr1

