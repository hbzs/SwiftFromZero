//: [Previous](@previous)
//: # Section II: Collection Types

import Foundation

//: ## Chapter 7: Arrays, Dictionaries, Sets
//: ### Arrays
//: index(of:)
var players = ["Alice", "Bob", "Cindy", "Dan", "Eli", "Gina"]
players.index(of: "Dan")
//: for-in
let scores = [2, 2, 8, 6, 1, 2]
for (index, player) in players.enumerated() {
    print("\(player)'s\t score is \(scores[index])")
}

//: ### Dictionaries
var bobData = [
    "name": "Bob",
    "profession": "Card Player",
    "country": "USA"
]
bobData.updateValue("CA", forKey: "state")
bobData["city"] = "San Francisco"
//: Write a function that prints a given player’s city and state.
print("\(bobData["name"] ?? "A noname player")'s city is \(bobData["city"] ?? "unknown"), and state is \(bobData["state"] ?? "unknown")")
if let name = bobData["name"], let city = bobData["city"], let state = bobData["state"] {
    print("\(name)'s city is \(city), and state is \(state)")
}

//: ### Challenges
/*:
 1. Which of the following are valid statements?
 
 ```swift
 1. let array1 = [Int]()
 2. let array2 = []
 3. let array3: [String] = [] // 1,3
 ```
 
 For the next ﬁve statements, array4 has been declared as:
 
 ```swift
 let array4 = [1, 2, 3]
 ```
 ```swift
 4. print(array4[0]) // 1
 5. print(array4[5]) // runtime error
 6. array4[1...2] // [2, 3]
 7. array4[0] = 4 // [4, 2, 3]
 8. array4.append(4) // [4, 2, 3, 4]
 ```
 
 For the ﬁnal ﬁve statements, array5 has been declared as:
 
 ```swift
 var array5 = [1, 2, 3]
 ```
 ```swift
 9. array5[0] = array5[1] // [2, 2, 3]
 10. array5[0...1] = [4, 5] // [4, 5, 3]
 11. array5[0] = "Six" // error
 12. array5 += 6 // ?
 13. for item in array5 { print(item) }
 ```
 */
let array1 = [Int]()
//let array2 = [] // error: empty collection literal requires an explicit type
let array3: [String] = [] // 1,3

let array4 = [1, 2, 3]
print(array4[0]) // 1
//print(array4[5]) // runtime error
array4[1...2] // [2, 3]
//array4[0] = 4 // immutable
//array4.append(4) // immutable

var array5 = [1, 2, 3]
array5[0] = array5[1] // [2, 2, 3]
array5[0...1] = [4, 5] // [4, 5, 3]
//array5[0] = "Six" // error
//array5 += 6 // ?
for item in array5 { print("\(item)", terminator:" ") }
print("")

/*:
 2. Write a function that removes the ﬁrst occurrence of a given integer from an array of integers. This is the signature of the function:
 
 ```swift
 func removingOnce(_ item: Int, from array: [Int]) -> [Int]
 ```
 */
var array6 = [4, 5, 3, 2, 2, 3]
func removingOnce(_ item: Int, from array: [Int]) -> [Int] {
    var arrayRemoved = array
    if let index = arrayRemoved.index(of: item) {
        arrayRemoved.remove(at: index)
    }
    return arrayRemoved
}
removingOnce(3, from: array6)
/*:
 3. Write a function that removes all occurrences of a given integer from an array of integers. This is the signature of the function:
 
 ```swift
 func removing(_ item: Int, from array: [Int]) -> [Int]
 ```
 */
array6
func removing(_ item: Int, from array: [Int]) -> [Int] {
    var arrayRemoved = array
    
    while arrayRemoved.contains(item) {
        if let index = arrayRemoved.index(of: item) {
            arrayRemoved.remove(at: index)
        }
    }
    
    return arrayRemoved
}
removing(3, from: array6)
/*:
 4. Arrays have a `reversed()` method that returns an array holding the same elements as the original array, in reverse order. Write a function that does the same thing, without using `reversed()`. This is the signature of the function:
 
 ```swift
 func reversed(_ array: [Int]) -> [Int]
 ```
 */
array6
func reversed(_ array: [Int]) -> [Int] {
    var reversedArray: [Int] = []
    for item in array {
        reversedArray.insert(item, at: 0)
    }
    return reversedArray
}
reversed(array6)
/*:
 Challenge 8
 
 Given a dictionary with 2-letter state codes as keys and the full state name as values, write a function that prints all the states whose name is longer than 8 characters. For example, for this dictionary ["NY": "New York", "CA": "California"] the output would be "California".
 */
let stateCodes = ["NY": "New York", "CA": "California"]
for state in stateCodes.values where state.count > 8 {
    print(state)
}
/*:
 Challenge 9
 
 Write a function that combines two dictionaries into one. If a certain key appears in both dictionaries, ignore the pair from the first dictionary. This is the signature of the function:
 
 func combine(dict1: [String: String], with dict2: [String: String]) -> [String: String]
 */
func combine(dict1: [String: String], with dict2: [String: String]) -> [String: String] {
    var combineDict = dict1
    for (key2, value2) in dict2 {
        combineDict[key2] = value2
    }
    return combineDict
}

//: [Next](@next)
