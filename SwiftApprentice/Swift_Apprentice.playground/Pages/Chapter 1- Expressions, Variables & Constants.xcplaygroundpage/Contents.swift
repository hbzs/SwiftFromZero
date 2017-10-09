//: # Section I: Swift Basics

import Foundation
//: ## Chapter 1: Expressions, Variables & Constants
//: 表达式：`+` `-` `*` `/` `%`
2 + 6
10 - 2
2 * 4
68 / 8

68 % 8
68.0 / 8.0

//: 想要计算：68.0 % 8.0
(68.0).truncatingRemainder(dividingBy: 8.0)

//: shift left / right
1 << 3
64 >> 3

//: 数学相关的函数
sin(45 * Double.pi / 180)
cos(135 * Double.pi / 180)
(2.0).squareRoot()

max((2.0).squareRoot(), sin(45 * Double.pi / 180))

//: 小练习
//: 1. Declare a constant of type Int called myAge and set it to your age.
let myAge: Int = 28
//: 2. Declare a variable of type Double called averageAge. Initially, set it to your own age.
var averageAge: Double = 28
//:    Then, set it to the average of your age and my own age of 30.
averageAge = 30
//: 3. Create a constant called testNumber and initialize it with whatever integer you’d like.
var testNumber = 28
//:    Next, create another constant called evenOdd and set it equal to testNumber modulo 2.
let evenOdd = testNumber % 2
//:    Now change testNumber to various numbers. What do you notice about evenOdd?
testNumber = 17
evenOdd // 0

//: 4. Create a variable called answer and initialize it with the value 0.
var answer = 0
//:    Increment it by 1. Add 10 to it. Multiply it by 10.
answer += 1
answer += 10
answer *= 10
//:    Then, shift it to the right by 3. After all of these operations, what’s the answer?
answer >> 3
answer
(answer).multipliedReportingOverflow(by: 3)

//: ## Challenges
//: 1. Declare a constant `exercises` with value 9 and a variable `exercisesSolved` with value 0. Increment this variable every time you solve an exercise (including this one).
let exercise = 9
var exerciseSolved = 0
exerciseSolved += 1
/*:
2. Given the following code:
```swift
 age = 16
 print(age)
 age = 30
 print(age)
```
Declare `age` so that it compiles. Did you use var or let?
 */
var age = 16
print(age)
age = 30
print(age)
exerciseSolved += 1
/*:
 3. Consider the following code:
```swift
 let a: Int = 46
 let b: Int = 10
```
 Work out what answer equals when you replace the ﬁnal line of code above with each of these options:
 ```swift
 // 1 -> 4610
 let answer1: Int = (a * 100) + b
 // 2 -> 5600
 let answer2: Int = (a * 100) + (b * 100)
 // 3 -> 4601
 let answer3: Int = (a * 100) + (b / 10)
 ```
*/
let a: Int = 46
let b: Int = 10
// 1 -> 4610
let answer1: Int = (a * 100) + b
// 2 -> 5600
let answer2: Int = (a * 100) + (b * 100)
// 3 -> 4601
let answer3: Int = (a * 100) + (b / 10)
exerciseSolved += 1
/*:
 4. Add parentheses to the following calculation. The parentheses should show the order in which the operations are performed and should not alter the result of the calculation.
 */
 5 * 3 - 4 / 2 * 2
/*:
 Solution:
 */
(5 * 3) - ((4 / 2) * 2)
exerciseSolved += 1
/*:
 5. Declare two constants `x` and `y` of type Double and assign both a value. Calculate the average of `x` and `y` and store the result in a constant named `average`.
 */
let x: Double = 3.14
let y: Double = 5.6
let average = (x + y) / 2
exerciseSolved += 1
/*:
 6. A temperature expressed in °C can be converted to °F by multiplying by 1.8 then incrementing by 32.
    In this challenge, do the reverse: convert a temperature from °F to °C.
    Declare a constant named `fahrenheit` of type Double and assign it a value.
    Calculate the corresponding temperature in °C and store the result in a constant named `celcius`.
 */
var fahrenheit = 99.8
let celcius = (fahrenheit - 32) / 1.8
exerciseSolved += 1
/*:
 7. Suppose the squares on a chessboard are numbered left to right, top to bottom, with 0 being the top-left square and 63 being the bottom-right square. Rows are numbered top to bottom, 0 to 7. Columns are numbered left to right, 0 to 7.
     Declare a constant `position` and assign it a value between 0 and 63.
     Calculate the corresponding row and column numbers and store the results in constants named `row` and `column`.
 */
let position = 23
let row = position / 8
let column = position % 8
exerciseSolved += 1
/*:
 8. A circle is made up of 2π radians, corresponding with 360 degrees.
    Declare a constant `degrees` of type Double and assign it an initial value.
   Calculate the corresponding angle in radians and store the result in a constant named `radians`.
 */
let degrees = 275
let radians = (Double(degrees) / 180.0) * Double.pi
exerciseSolved += 1
/*:
 9. Declare four constants named `x1`, `y1`, `x2` and `y2` of type Double.
    These constants represent the 2-dimensional coordinates of two points.
    Calculate the distance between these two points and store the result in a constant named `distance`.
 */
let x1:Double = 15.0
let y1:Double = 3.0
let x2:Double = 12.0
let y2:Double = 7
let distance = (pow(abs(x2 - x1), 2) + pow(abs(y2 - y1), 2)).squareRoot()
exerciseSolved += 1
//: 额外的练习
let seconds = Measurement(value: 666, unit: UnitDuration.seconds)
let minutes = seconds.converted(to: UnitDuration.minutes)
let hours = seconds.converted(to: UnitDuration.hours)
let hoursInMinutes = minutes.converted(to: UnitDuration.hours)
print("\(hours.value) 小时")

//: [Next](@next)
