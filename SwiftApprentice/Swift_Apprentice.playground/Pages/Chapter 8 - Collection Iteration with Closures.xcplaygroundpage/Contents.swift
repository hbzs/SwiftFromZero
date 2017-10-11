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

//: [Next](@next)
