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

var fibonacci = [0, 1, 1, 2, 3, 5, 8]
//: MyMap : 循环将处理结果添加到新的数组 map(<#T##transform: (Int) throws -> T##(Int) throws -> T#>)

extension Array {

  func myMap<T>(_ transform: (Element) -> T) -> [T] {
    var tmp: [T] = []
    tmp.reserveCapacity(count)
    
    for value in self {
      tmp.append(transform(value))
    }
    
    return tmp
  }

}

fibonacci.myMap { $0 * $0 }.elementsEqual(fibonacci.map { $0 * $0 })
                                  .executeTestResult(funcName: "myMap")

//: min/max/elements_equal/start_with

fibonacci.min()
fibonacci.max()
fibonacci.starts(with: [1, 1, 2])
fibonacci.starts(with: [0, 1, 1], by: {$0 == $1}).executeTestResult(funcName: "starts(with:by:)")

//: sort/partition

var randomValue = [12, 32, 34, 54, 22, 11, 45]
let partition = randomValue.partition(by: { $0 < 33 })
print(randomValue[0 ..< partition])
print(randomValue[partition ..< randomValue.count])

//: reduce : reduce(<#T##initialResult: Result##Result#>, <#T##nextPartialResult: (Result, Int) throws -> Result##(Result, Int) throws -> Result#>)

fibonacci.reduce(0, +)

extension Array {
  
//: myreduce
  func myReduce<T>(_ initial:T, _ next: (T, Element) -> T) -> T {
    var tmp = initial
    
    for value in self {
      tmp = next(tmp, value)
    }
    
    return tmp
  }
  
  //: accumulate
  func accumulate<T>(_ initial:T, _ nextSum: (T, Element) -> T) -> [T] {
    var sum = initial
    
    return map { next in
      sum = nextSum(sum, next)
      return sum
    }
  }
  
  //: my_filter
  func myFilter(_ isIncluded: (Element) -> Bool) -> [Element] {
    var tmp: [Element] = []
    
    for value in self where isIncluded(value) {
      tmp.append(value)
    }
    
    return tmp
  }
  
  //: reject: vs filter
  func reject(_ isIncluded: (Element) -> Bool) -> [Element] {
    return filter { !isIncluded($0) }
    
  }
  
  //: allMatch
  func allMatch(_ match: (Element) -> Bool) -> Bool {
    return !contains { !match($0) }
  }
  
  //: myMap2/myFilter2(reduce 特供版，增添时间复杂度)
  func myMap2<T>(_ transform: (Element) -> T) -> [T] {
    return reduce([], { $0 + [transform($1)] } )
  }
  
  func myFilter2(_ predicate: (Element) -> Bool) -> [Element] {
    return reduce([], { predicate($1) ? $0 + [$1] : $0 })
  }
  
  //: flatMap
  
  //: myFlatMap
  
}

(fibonacci.myReduce(0, +) == fibonacci.reduce(0, +)).executeTestResult(funcName: "myReduce")

fibonacci.accumulate(1, +)

print(fibonacci.myFilter { $0 % 2 == 0 })

fibonacci.contains { $0 % 2 == 0 }.executeTestResult(funcName: "even number contains")

fibonacci.allMatch { $0 % 2 == 0 }.executeTestResult(funcName: "in fibonacci all match")

fibonacci.myMap2 { $0 * $0 }.elementsEqual(fibonacci.map {$0 * $0}).executeTestResult(funcName: "myMap2 for reduce")

print("\(ConsoleLevel.warning)" +
      "决定先学后面两章再回过头来学习，这章有太多细节的东西不明白，按目前情况细思量下，先学后两章稳妥" +
      "\(ConsoleLevel.warning)")





































