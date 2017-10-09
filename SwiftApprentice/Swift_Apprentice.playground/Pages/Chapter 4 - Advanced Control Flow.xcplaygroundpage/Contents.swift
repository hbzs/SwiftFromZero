//: [Previous](@previous)
//: # Section I: Swift Basics

import Foundation

//: ## Chapter 4: Advanced Control Flow
/*:
 1. Create a constant named `range` and set it equal to a range starting at 1 and ending with 10 inclusive.
    Write a for loop which iterates over this range and prints the square of each number.
 */
let range = 1...10
for num in range {
    print("The square of \(num) is \(num * num)")
}
/*:
 2. Write a for loop to iterate over the same range as in the exercise above and
    print the square root of each number. You’ll need to type convert your loop constant.
 */
for num in range {
    print("The square root of \(num) is \(Double(num).squareRoot())")
}
/*:
 3. Above, you saw a for loop which iterated over only the even rows like so:
 
 ```swift
 sum = 0
 for row in 0..<8 {
     if row % 2 == 0 {
         continue
     }
     for column in 0..<8 {
         sum += row * column
     }
 }
 ```
 
 Change this to use a where clause on the ﬁrst for loop to skip even rows instead of using continue.
 
 Check that the sum is 448 as in the initial example.
 */
var sum = 0
for row in 0..<8 where row % 2 != 0 {
    for column in 0..<8 {
        sum += row * column
    }
}
print(sum)

//: ### Switch statements
/*:
 1. Write a switch statement that takes an age as an integer and
    prints out the life stage related to that age.
    You can make up the life stages, or use my categorization as follows:
    * 0-2 years, Infant;
    * 3-12 years, Child;
    * 13-19 years, Teenager;
    * 20-39, Adult;
    * 40-60, Middle aged;
    * 61+, Elderly.
 */
let age = 28
switch age {
case 0...2:
    print("Infant")
case 3...12:
    print("Child")
case 13...19:
    print("Teenager")
case 20...39:
    print("Adult")
case 40...60:
    print("Middle aged")
case _ where age > 60:
    print("Elderly")
default:
    print("Invalid age")
}
/*:
 2. Write a switch statement that takes a tuple containing a string and an integer.
    The string is a name, and the integer is an age.
    Use the same cases that you used in the previous exercise and
    let syntax to print out the name followed by the life stage.
    For example, for myself it would print out "Matt is an adult.".
 */
switch (name: "jinji", age: 23) {
case (let name, 0...2):
    print("\(name) is an Infant")
case (let name, 3...12):
    print("\(name) is an Child")
case (let name, 13...19):
    print("\(name) is an Teenager")
case (let name, 20...39):
    print("\(name) is an Adult")
case (let name, 40...60):
    print("\(name) is an Middle aged")
case let (name, _) where age > 60:
    print("\(name) is an Elderly")
default:
    print("Invalid age")
}

//: ### Challenges
/*:
 1. In the following for loop, what will be the value of sum, and how many iterations will happen?
 
 ```swift
 var sum = 0
 for i in 0...5 {
     sum += i
 } // sum = 15;iterations = 6
 ```
 */
sum = 0
for i in 0...5 {
    sum += i
}
print(sum)
/*:
 2. In the while loop below, how many instances of “a” will there be in aLotOfAs? Hint:
 
 aLotOfAs.count tells you how many characters are in the string aLotOfAs.
 
 ```swift
 var aLotOfAs = ""
 while aLotOfAs.count < 10 {
     aLotOfAs += "a"
 } // 10
 ```
 */
var aLotOfAs = ""
while aLotOfAs.count < 10 {
    aLotOfAs += "a"
}
aLotOfAs.count
/*:
 3. Consider the following switch statement:
 
 ```swift
 switch coordinates {
     case let (x, y, z) where x == y && y == z:
         print("x = y = z")
     case (_, _, 0):
         print("On the x/y plane")
     case (_, 0, _):
         print("On the x/z plane")
     case (0, _, _):
         print("On the y/z plane")
     default:
         print("Nothing special")
 }
 ```
 
 What will this code print when coordinates is each of the following?
 
 ```swift
 let coordinates1 = (1, 5, 0) // On the x/y plane
 let coordinates2 = (2, 2, 2) // Nothing special
 let coordinates3 = (3, 0, 1) // On the x/z plane
 let coordinates4 = (3, 2, 5) // Nothing special
 let coordinates5 = (0, 2, 4) // On the y/z plane
 ```
 */
let coordinates1 = (1, 5, 0) // On the x/y plane
let coordinates2 = (2, 2, 2) // x = y = z
let coordinates3 = (3, 0, 1) // On the x/z plane
let coordinates4 = (3, 2, 5) // Nothing special
let coordinates5 = (0, 2, 4) // On the y/z plane
switch coordinates5 {
case let (x, y, z) where x == y && y == z:
    print("x = y = z")
case (_, _, 0):
    print("On the x/y plane")
case (_, 0, _):
    print("On the x/z plane")
case (0, _, _):
    print("On the y/z plane")
default:
    print("Nothing special")
}
/*:
 5. Print a countdown from 10 to 0.
    (Note: do not use the `reversed()` method, which will be introduced later.)
```swift
for item in (0...10).reversed() {
    print(item)
}
```
 */
for item in 0...10 {
    print(10 - item)
}
/*:
 6. Print 0.0, 0.1, 0.2, 0.3, 0.4, 0.5, 0.6, 0.7, 0.8, 0.9, 1.0.
 
    (Note: do not use the stride(from:by:to:) function, which will be introduced later.)
```swift
for item in stride(from: 0, to: 1, by: 0.1) {
    print(item)
}
```
 */
for item in 0...10 {
    print(Double(item) / 10.0)
}

//: [Next](@next)
