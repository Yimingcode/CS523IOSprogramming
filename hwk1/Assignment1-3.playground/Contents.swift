/*Yiming Xu
 10438422 */

import Cocoa

//var B_M: [String:Int] = [
//    "Elena": 341, "Thomas": 273, "Hamilton": 278, "Suzie": 329,
//    "Phil": 445, "Matt": 402, "Alex": 388, "Emma": 275, "John": 243,
//    "James": 334, "Jane": 412, "Emily": 393, "Daniel": 299, "Neda": 343,
//    "Aaron": 317, "Kate": 265
//]


let names = ["Elena", "Thomas", "Hamilton", "Suzie", "Phil", "Matt", "Alex", "Emma", "John", "James", "Jane", "Emily", "Daniel", "Neda", "Aaron", "Kate"]

let times = [341, 273, 278, 329, 445, 402, 388, 275, 243, 334, 412, 393, 299, 343, 317, 265]

var min = 0

for var i in 0..<names.count {
    if(times[i] < times[min]) {
        min = i
    }
    
}

var minutes = times[min]

print("The fastest runner is \(names[min]), and his time is \(minutes) mins." )
