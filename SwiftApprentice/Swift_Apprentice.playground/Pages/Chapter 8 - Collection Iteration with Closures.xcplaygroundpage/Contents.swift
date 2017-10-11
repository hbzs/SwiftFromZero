//: [Previous](@previous)
//: # Section II: Collection Types

import Foundation

//: ## Chapter 8: Collection Iteration with Closures
/*:
 1. Create a constant array called `names` which contains some names as strings. Any names will do — make sure there’s more than three. Now use reduce to create a string which is the concatenation of each name in the array.
 */
let names = ["市项","禹宗政","夏岚","微生清","绮松","南风","隋晓星"]
let greetingNameList = names.reduce("", { $0 + " " + $1})
/*:
 2. Using the same names array, ﬁrst ﬁlter the array to contain only names which have more than four characters in them, and then create the same concatenation of names as in the above exercise. (Hint: you can chain these operations together.)
 */
let shortGreetingNameList = names.filter({ $0.characters.count > 2 }).reduce("", { $0 + " " + $1})
print(shortGreetingNameList)
/*:
 3. Create a constant dictionary called `namesAndAges` which contains some names as strings mapped to ages as integers. Now use filter to create a dictionary containing only people under the age of 18.
 */
let namesAndAges = ["市项":18,"禹宗政":22,"夏岚":12,"微生清":17,"绮松":43,"南风":16,"隋晓星":13]
let youngMan = namesAndAges.filter({$0.value < 18})
print(youngMan)
/*:
 4. Using the same namesAndAges dictionary, ﬁlter out the adults (those 18 or older) and then use map to convert to an array containing just the names (i.e. drop the ages).
 */
let adultNames = namesAndAges.filter({$0.value >= 18}).map {
    $0.key
}
print(adultNames)

//: ### Challenges
/*:
 #### Challenge 1: Repeating yourself
 
 Your ﬁrst challenge is to write a function that will run a given closure a given number of times.
 
 Declare the function like so:
 
 ```swift
 func repeatTask(times: Int, task: () -> Void)
 ```
 
 The function should run the task closure, times number of times.
 
 Use this function to print "Swift Apprentice is a great book!" 10 times.
 */
func repeatTask(times: Int, task: () -> Void) {
    guard times > 0 else {
        return
    }
    for _ in 0..<times {
        task()
    }
}
repeatTask(times: 10, task: {
    print("Swift Apprentice is a great book!")
})
/*:
 #### Challenge 2: Closure sums
 
 In this challenge, you’re going to write a function that you can reuse to create different mathematical sums.
 
 Declare the function like so:
 
 ```swift
 func mathSum(length: Int, series: (Int) -> Int) -> Int
 ```
 
 The ﬁrst parameter, length, deﬁnes the number of values to sum. The second parameter, series, is a closure that can be used to generate a series of values. series should have a parameter that is the position of the value in the series and return the value at that position.
 
 mathSum should calculate length number of values, starting at position 1, and return their sum.
 
 Use the function to ﬁnd the sum of the ﬁrst 10 square numbers, which equals 385. Then use the function to ﬁnd the sum of the ﬁrst 10 Fibonacci numbers, which equals 143. For the Fibonacci numbers, you can use the function you wrote in the functions chapter — or grab it from the solutions if you’re unsure your solution is correct.
 */
func mathSum(length: Int, series: (Int) -> Int) -> Int {
    var sum = 0
    for index in 1 ... length {
        sum += series(index)
    }
    return sum
}

let squareSum = mathSum(length: 10, series: {
    $0 * $0
})
print(squareSum)

func fibonacci(_ num: Int) -> Int {
    switch num {
    case 1,2:
        return 1
    case let num where num > 2:
        return fibonacci(num - 1) + fibonacci(num - 2)
    default:
        return 0
    }
}

let fibonacciSum = mathSum(length: 10, series: {
    fibonacci($0)
})
/*:
 #### Challenge 3: Functional ratings
 
 In this ﬁnal challenge, you will have a list of app names with associated ratings they’ve been given. Note — these are all ﬁctional apps!
 
 Create the data dictionary like so:
 
 ```swift
 let appRatings = [
     "Calendar Pro": [1, 5, 5, 4, 2, 1, 5, 4],
     "The Messenger": [5, 4, 2, 5, 4, 1, 1, 2],
     "Socialise": [2, 1, 2, 2, 1, 2, 4, 2]
 ]
 ```
 
 First, create a dictionary called `averageRatings` which will contain a mapping of app names to average ratings. Use `forEach` to iterate through the `appRatings` dictionary, then use `reduce` to calculate the average rating and store this rating in the `averageRatings` dictionary.
 
 Finally, use filter and map chained together to get a list of the app names whose average rating is greater than 3.
 */
let appRatings = [
    "Calendar Pro": [1, 5, 5, 4, 2, 1, 5, 4],
    "The Messenger": [5, 4, 2, 5, 4, 1, 1, 2],
    "Socialise": [2, 1, 2, 2, 1, 2, 4, 2]
]
var averageRatings: [String : Double] = [:]
appRatings.forEach {
    let averageRatingNum = Double($0.value.reduce(0, +)) / Double($0.value.count)
    averageRatings[$0.key] = averageRatingNum
}
print(averageRatings)
let highScoreAppName = averageRatings.filter({$0.value > 3}).map { $0.key }
print(highScoreAppName)

//: [Next](@next)
