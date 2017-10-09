//: [Previous](@previous)
//: # Section I: Swift Basics

import Foundation

//: ## Chapter 3: Basic Control Flow
//: ### Comparison operators
/*:
 1. Create a constant called `myAge` and set it to your age.
    Then, create a constant named `isTeenager` that uses Boolean logic to determine if the age denotes someone in the age range of 13 to 19.
 */
let myAge = 28
let isTeenager = (myAge <= 19 && myAge >= 13)
/*:
 2. Create another constant named `theirAge` and set it to my age, which is 30.
    Then, create a constant named `bothTeenagers` that uses Boolean logic to determine if both you and I are teenagers.
 */
let theirAge = 30
let bothTeenagers = isTeenager && (theirAge <= 19 && theirAge >= 13)
/*:
 3. Create a constant named `reader` and set it to your name as a string.
    Create a constant named `author` and set it to my name, Matt Galloway.
    Create a constant named `authorIsReader` that uses string equality to determine if reader and author are equal.
 */
let reader = "Rj Hou"
let author = "Matt Galloway"
let authorIsReader = (reader == author)
/*:
 4. Create a constant named `readerBeforeAuthor` which uses string comparison to determine if reader comes before author.
 */
let readerBeforeAuthor = (reader < author)

//: ### The if statement
/*:
 1. Create a constant named `myAge` and initialize it with your age.
    Write an if statement to print out `Teenager` if your age is between 13 and 19, and `Not a teenager` if your age is not between 13 and 19.
 */
if myAge >= 13 && myAge <= 19 {
    print("Teenager")
} else {
    print("Not a teenager")
}
/*:
 2. Create a constant named `answer` and use a ternary condition to set it equal to the result you print out for the same cases in the above exercise. Then print out `answer`.
 */
let answer = (myAge >= 13 && myAge <= 19) ? "Teenager" : "Not a teenager"
print(answer)

//: ### Loops
/*:
 1. Create a variable named `counter` and set it equal to 0.
    Create a while loop with the condition
       `counter < 10` which prints out counter is X (where X is replaced with counter value) and
        then increments counter by 1.
 */
var counter = 0
while counter < 10 {
    print("counter is \(counter)")
    counter += 1
}
/*:
 2. Create a variable named `counter` and set it equal to 0.
    Create another variable named `roll` and set it equal to 0.
    Create a repeat-while loop.
    1. Inside the loop, set `roll` equal to Int(arc4random_uniform(6)) which means to pick a random number between 0 and 5.
    2. Then increment `counter` by 1.
    3. Finally, print `After X rolls, roll is Y` where X is the value of counter and Y is the value of roll. Set the loop condition such that the loop ﬁnishes when the ﬁrst 0 is rolled.
 */
counter = 0
var roll = 0
repeat {
    roll = Int(arc4random_uniform(6))
    counter += 1
    print("After \(counter) rolls, roll is \(roll)")
} while roll != 0

//: ### Challenges
/*:
 1. What’s wrong with the following code?
 ```swift
 let firstName = "Matt"
 if firstName == "Matt" {
     let lastName = "Galloway"
 } else if firstName == "Ray" {
     let lastName = "Wenderlich"
 }
 let fullName = firstName + " " + lastName // lastName scope
 ```
 */
let firstName = "Matt"
var lastName = ""
if firstName == "Matt" {
 lastName = "Galloway"
} else if firstName == "Ray" {
 lastName = "Wenderlich"
}
let fullName = firstName + " " + lastName
/*:
 2. In each of the following statements, what is the value of the Boolean answer constant?
 ```swift
 let answer = true && true // true
 let answer = false || false // false
 let answer = (true && 1 != 2) || (4 > 3 && 100 < 1) // true
 let answer = ((10 / 2) > 3) && ((10 % 2) == 0) // true
 ```
 */
let answer1 = true && true // true
let answer2 = false || false // false
let answer3 = (true && 1 != 2) || (4 > 3 && 100 < 1) // true
let answer4 = ((10 / 2) > 3) && ((10 % 2) == 0) // true
/*:
 3. Suppose the squares on a chessboard are numbered left to right, top to bottom, with 0 being the top-left square and 63 being the bottom-right square. Rows are numbered top to bottom, 0 to 7. Columns are numbered left to right, 0 to 7.
    Given a current position on the chessboard, expressed as a row and column number, calculate the next position on the chessboard, again expressed as a row and column number. The ordering is determined by the numbering from 0 to 63. The position after 63 is again 0.
 */
let chessRow = 5
let chessColumn = 3
var nextRow = chessRow + Int(arc4random_uniform(20))
var nextColumn = chessColumn + Int(arc4random_uniform(20))
if nextColumn > 7 {
    nextColumn %= 7
    nextRow += nextColumn / 7
}
if nextRow > 7 {
    nextRow /= 7
}

//: [Next](@next)
