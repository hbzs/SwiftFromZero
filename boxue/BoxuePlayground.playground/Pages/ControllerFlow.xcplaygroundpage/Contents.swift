//: [Previous](@previous)

import Foundation

//: # ControllerFlow

//: case(axis example)
let position = (0, 0)
if case (0, 0) = position {
  print("\(position) @ origin")
}

//: switch ... case ...(axis example)
func findAreaForPosition(_ position: (Int, Int)) {
  switch(position) {
  case (0, 0):
    print("\(position) @ origin")
  case (_, 0):
    print("\(position) @ x axis")
  case (0, let yAxis):
    print("\(position) @ y axis - \(yAxis)")
  case (1 ... 3, 1 ... 3):
    print("\(position) @ square")
  default:
    print("\(position) @ invalid position")
  }
}

findAreaForPosition((0, 0))
findAreaForPosition((3, 0))
findAreaForPosition((0, 5))
findAreaForPosition((3, 1))
findAreaForPosition((8, 8))

//: for case
for case 1 in fibnacci {
  print("fibonacci at index 1", terminator:" over;) ")
}
print("")

//: enum case
let west = Direction.west(abbr: "W")
if case .east = west {
  print("east in direction is \(west)")
}
if case .west(let direction) = west {
  print("west in direction is \(west), abbr: \(direction)")
}

//: optional case
let peopleInRoom: [String?] = ["Lily", "Nancy", nil, "Bob", nil, "Susan"]
for case let peopleExist? in peopleInRoom {
  print("\(peopleExist) been in the room")
}

//: type case check
let someOne: [Any] = ["Sandy", 23, 89.2, ["play","eat"]]
for item in someOne {
  switch item {
  case is String:
    print("name:\(item)")
  case let age as Int:
    let age = age - 10
    print("age:\(age)")
  case let weight as Double:
    print("weight:\(weight)")
  default:
    print("intersting is:\(item)")
  }
}

//: for where
for value in fibnacci where value % 2 == 0 {
  print("\(value) is even")
}

//: switch where
enum Power {
  case outOfPower, fullCharged
  case normal(percentage: Double)
}

func iphoneBatteryHint(power: Power) {
  switch power {
  case .outOfPower, .fullCharged:
    print("to be or not to be")
  case .normal(let percentage) where percentage < 0.1:
    print("almost out of battery, leave \(percentage)")
  case .normal(let percentage) where percentage > 0.8:
    print("don't need low power")
  default:
    if case .normal(let percentage) = power, case 0.1 ... 0.2 = percentage {
      print("can start low power")
    } else {
      print("safe power mode")
    }
  }
}

iphoneBatteryHint(power: .outOfPower)
iphoneBatteryHint(power: .normal(percentage: 0.06))
iphoneBatteryHint(power: .normal(percentage: 0.12))
iphoneBatteryHint(power: .normal(percentage: 0.32))
iphoneBatteryHint(power: .normal(percentage: 0.93))
iphoneBatteryHint(power: .fullCharged)


//: case tuple
let name  = "Larry"
let score = 89
if case ("Larry", 89) = (name, score) {
  print("\(name)'s score is \(score)")
}

//: custom case equal
func ~=<T>(value: T, pattern: ClosedRange<T>) -> Bool {
  return pattern.contains(value)
}

let value = 0.3
if case value = 0.1 ... 0.5 {
  print("天青色等烟雨")
}

func ~=<T>(leftPattern: ClosedRange<T>, rightPattern: ClosedRange<T>) -> Bool {
  return rightPattern.overlaps(leftPattern)
}

if case 0.2 ... 0.4 = 0.1 ... 0.5 {
  print("而我不等你")
}

//: [Next](@next)
