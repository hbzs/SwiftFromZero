//: [Previous](@previous)
//: # Section I: Swift Basics

import Foundation

//: ## Chapter 6: Optionals
//: ### Introducing optionals

var parseInt = Int("10")
parseInt = Int("dog")

//: ### Unwrapping optionals
/*:
 1. Using your `myFavoriteSong` variable from earlier, use optional binding to check if it contains a value. If it does, print out the value. If it doesn’t, print "I don’t have a favorite song."
 */
var myFavoriteSong: String?
if let myFavoriteSong = myFavoriteSong {
    print("My favorite song is \(myFavoriteSong)")
} else {
    print("I don’t have a favorite song.")
}
/*:
 2. Change myFavoriteSong to the opposite of what it is now. If it’s nil, set it to a string; if it’s a string, set it to nil. Observe how your printed result changes.
 */
myFavoriteSong = "Love Story"
if let myFavoriteSong = myFavoriteSong {
    print("My favorite song is \(myFavoriteSong)")
} else {
    print("I don’t have a favorite song.")
}

//: ### Challenges
/*:
 #### Challenge 1: You be the compiler
 
 Which of the following are valid statements?
 
 ```swift
 var name: String? = "Ray" // valid
 var age: Int = nil // Invalid
 let distance: Float = 26.7 // valid
 var middleName: String? = nil // valid
 ```
 */
var name: String? = "Ray" // valid
//var age: Int = nil // Invalid
let distance: Float = 26.7 // valid
var middleName: String? = nil // valid
/*:
 #### Challenge 2: Divide and conquer
 
 First, create a function that returns the number of times an integer can be divided by another integer without a remainder. The function should return nil if the division doesn’t produce a whole number. Name the function `divideIfWhole`.
 
 Then, write code that tries to unwrap the optional result of the function. There should be two cases: upon success, print "Yep, it divides \(answer) times", and upon failure, print "Not divisible :[".
 
 Finally, test your function:
 
 1. Divide 10 by 2. This should print "Yep, it divides 5 times."
 
 2. Divide 10 by 3. This should print "Not divisible :[."
 
 **Hint 1:** Use the following as the start of the function signature:
 
 ```swift
 func divideIfWhole(_ value: Int, by divisor: Int)
 ```
 
 You’ll need to add the return type, which will be an optional!
 
 **Hint 2:** You can use the modulo operator (%) to determine if a value is divisible by another; recall that this operation returns the remainder from the division of two numbers. For example, 10 % 2 = 0 means that 10 is divisible by 2 with no remainder, whereas 10 % 3 = 1 means that 10 is divisible by 3 with a remainder of 1.
 */
func divideIfWhole(_ value: Int, by divisor: Int) -> Int? {
    return (value % divisor == 0) ? (value / divisor) : nil
}
func printDivideIfWhole(_ value: Int, by divisor: Int) {
    guard let divideIfWhole = divideIfWhole(value, by: divisor) else {
        print("Not divisible :[.")
        return
    }
    print("Yep, it divides \(divideIfWhole) times.")
}
printDivideIfWhole(10, by: 2)
printDivideIfWhole(10, by: 3)
/*:
 #### Challenge 3: Refactor and reduce
 
 The code you wrote in the last challenge used if statements. In this challenge, refactor that code to use nil coalescing instead. This time, make it print "It divides X times" in all cases, but if the division doesn’t result in a whole number, then X should be 0.
 */
func printDivideIfWhole2(_ value: Int, by divisor: Int) {
    print("it divides \(divideIfWhole(value, by: divisor) ?? 0) times.")
}
printDivideIfWhole2(10, by: 2)
printDivideIfWhole2(10, by: 3)
/*:
 #### Challenge 4: Nested optionals
 
 Consider the following nested optional. It corresponds to a number inside a box inside a box inside a box.
 
 ```swift
 let number: Int??? = 10
 ```
 
 If you print number you get the following:
 
 ```swift
 print(number)
 // Optional(Optional(Optional(10)))
 print(number!)
 // Optional(Optional(10))
 ```
 
 Do the following:
 
 1. Fully force unwrap and print number.
 
 2. Optionally bind and print number with if let.
 
 3. Write a function printNumber(_ number: Int???) that uses guard to print the
 
 number only if it is bound.
 */
let number: Int??? = 10
print(number!!!) // 1
if let n1 = number, let n2 = n1, let n3 = n2 {
    print(n3)
} // 2
func printNumber(_ number: Int???) {
    guard let n1 = number, let n2 = n1, let n3 = n2 else {
        return
    }
    print(n3)
}
printNumber(number)

//: [Next](@next)
