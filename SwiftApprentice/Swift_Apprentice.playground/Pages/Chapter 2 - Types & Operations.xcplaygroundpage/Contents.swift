//: [Previous](@previous)
//: # Section I: Swift Basics

import Foundation

//: ## Chapter 2: Types & Operations
//: ### 小练习
/*:
 1. Create a constant called `age1` and set it equal to 42.
 Create a constant called `age2` and set it equal to 21.
 Check using Option-click that the type for both has been inferred correctly as `Int`
 */
let age1 = 42
let age2 = 21
/*:
 2. Create a constant called `avg1` and set it equal to the average of `age1` and `age2` using the naïve operation `(age1 + age2) / 2`.
 Use Option-click to check the type and check the result of `avg1`. Why is it wrong?
 */
let avg1 = (age1 + age2) / 2
/*:
 3. Correct the mistake in the above exercise by converting `age1` and `age2` to type Double in the formula.
 Use Option-click to check the type and check the result of `avg1`. Why is it now correct?
 */
let age3 = 42.0
let age4 = 21.0
let avg2 = (age3 + age4) / 2
//: ### 小练习
/*:
 1. Create a string constant called `firstName` and initialize it to your ﬁrst name.
 Also create a string constant called `lastName` and initialize it to your last name.
 */
let firstName = "Rj"
let lastName = "Hou"
/*:
 2. Create a string constant called `fullName` by
 adding the `firstName` and `lastName` constants together, separated by a space.
 */
let fullName = firstName + " " + lastName
/*:
 3. Using interpolation, create a string constant called `myDetails` that uses the `fullName` constant to create a string introducing yourself.
 For example, my string would read: "Hello, my name is Matt Galloway.".
 */
let myDetails = "Hello, my name is \(fullName)"
//: ### 小练习
/*:
 1. Declare a constant tuple that contains three Int values followed by a Double.
 Use this to represent a date (month, day, year) followed by an average temperature for that date.
 */
var averageTemperatureDay: (month: Int, day: Int, year: Int, averageTemperature: Double)
/*:
 2. Change the tuple to name the constituent components.
 Give them names related to the data that they contain: month, day, year and averageTemperature.
 3. In one line, read the day and average temperature values into two constants.
 You’ll need to employ the underscore to ignore the month and year.
 4. Up until now, you’ve only seen constant tuples. But you can create variable tuples, too.
 Change the tuple you created in the exercises above to a variable by using var instead of let.
 Now change the average temperature to a new value.
 */
averageTemperatureDay = (12, 8, 2017, 12.8)
let (_, day, _, temperature) = averageTemperatureDay
averageTemperatureDay.averageTemperature
temperature
averageTemperatureDay.averageTemperature = 22.3
temperature
//: ### Challenges
/*:
 1. Create a constant called `coordinates` and assign a tuple containing two and three to it.
 */
let coordinates = (12, 23, 45)
/*:
 2. Create a constant called `namedCoordinate` with a `row` and `column` component.
 */
let namedCoordinate = (row: 12, column: 67)
/*:
 3. Which of the following are valid statements?
 ```swift
 let character: Character = "Dog" // Invalid
 let character: Character = "🐶" // Valid
 let string: String = "Dog" // Valid
 let string: String = "🐶" // Valid
 ```
 */
//let character1: Character = "Dog" // Invalid
let character2: Character = "🐶" // Valid
let string1: String = "Dog" // Valid
let string2: String = "🐶" // Valid
/*:
 4. Is this valid code?
 ```swift
 let tuple = (day: 15, month: 8, year: 2015)
 let day = tuple.Day // 不通过, has no member 'Day'
 ```
 */
let tuple = (day: 15, month: 8, year: 2015)
let day2 = tuple.day
/*:
 5. What is wrong with the following code?
 ```swift
 let name = "Matt"
 name += " Galloway" // left side of mutating operator isn't mutable
 ```
 */
var name = "Matt"
name += " Galloway"
/*:
 6. What is the type of the constant named value?
 ```swift
 let tuple = (100, 1.5, 10)
 let value = tuple.1 // 1.5
 ```
 */
let tuple2 = (100, 1.5, 10)
let value2 = tuple2.1
/*:
 7. What is the value of the constant named month?
 ```swift
 let tuple = (day: 15, month: 8, year: 2015)
 let month = tuple.month // 8
 ```
 */
let tuple3 = (day: 15, month: 8, year: 2015)
let month3 = tuple.month
/*:
 8. What is the value of the constant named summary?
 ```swift
 let number = 10
 let multiplier = 5
 let summary = "\(number) multiplied by \(multiplier) equals \(number * multiplier)"
 ```
 10 multiplied by 5 equals 50
 */
let number = 10
let multiplier = 5
let summary = "\(number) multiplied by \(multiplier) equals \(number * multiplier)"
/*:
 9. What is the sum of a and b, minus c?
 ```swift
 let a = 4
 let b: Int32 = 100
 let c: UInt8 = 12
 ```
 */
let a2 = 4
let b2: Int32 = 100
let c2: UInt8 = 12
let answer4 = a2 + Int(b2) - Int(c2)
/*:
 10. What is the numeric difference between Double.pi and Float.pi?
 */
print(Double.pi)
print(Float.pi)

//: [Next](@next)
