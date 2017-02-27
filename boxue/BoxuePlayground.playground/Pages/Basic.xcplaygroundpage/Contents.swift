//: Playground - noun: a place where people can play
//: 仅写一些我不太明白的代码


//: [Next](@next)

import UIKit

let cafe = "🍵🐶"

cafe.characters.count
cafe.utf8.count
cafe.utf16.count

cafe.characters.forEach({
  print($0)
  })

let index = cafe.index(cafe.startIndex, offsetBy: 1, limitedBy: cafe.endIndex)
cafe[index!]

//cafe[1]

extension String {
  subscript(index: Int, getValue getValue: Bool) -> Character {
    if getValue == false {
      fatalError("please use `index(_:offsetBy:limitedBy:)` method")
    }
    
    guard let index = self.index(self.startIndex, offsetBy: index, limitedBy: endIndex) else {
      fatalError("out of bound")
    }
    
    
    return self[index]
  }
}

cafe[1, getValue: true]
//cafe[0, getValue: false]


var upMe = "hbzs 你行的！"
//: 获取前缀 - 2

let beginIndex = upMe.startIndex
let endIndex   = upMe.index(upMe.startIndex, offsetBy: 4)
upMe[beginIndex ..< endIndex]

String(upMe.characters.prefix(4))

//: 数据遍历 - 2

upMe.characters.forEach {  // for each
  print($0)
}

for (index, value) in upMe.characters.enumerated() { // OC: block enumerate
  print("\(index): \(value)")
}

//: 插入内容

if let indexInsert = upMe.characters.index(of: "你") {
  upMe.insert(contentsOf:"无所畏惧，".characters, at: indexInsert)
}

//: 基于Range的查找和替换

if let index = upMe.characters.index(of: "你") {
  upMe.replaceSubrange(index ..< upMe.endIndex, with: "you can do it!")
}

//: 字符串切片

String(upMe.characters.suffix(6).dropLast())

let doit = upMe.characters.split(separator: " ");
doit.map(String.init)

var i = 0
let singleDoit = upMe.characters.split { _ in
  if i > 0 {
    i = 0
    return false
  } else {
    i += 1
    return true
  }
}
singleDoit.map(String.init)


//: mod

//let mod = 8 % 2.1
Double(8).truncatingRemainder(dividingBy: Double(2.5))
var intValue = 8
//intValue++ // has been removed

//: operate

let isEqual = 8 == 8
var userNameInput: String?
var userName = userNameInput ?? "default name"





