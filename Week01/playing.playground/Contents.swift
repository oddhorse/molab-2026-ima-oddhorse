import UIKit

//var greeting = "Hello, playground"

// we going through the uhhh swift tour

let explicitFloat: Float = 4

let label = "The width is "
let width = 94
let widthLabel = label + String(width)

let num1 = 4.5
let num2 = 3.2
let floatResult = num1 + num2
let calcString = "the result is \(floatResult)"

let name = "john"
let personalizedGreeting = "hi, \(name)!"

var optionalString: String? = "Hello"
print(optionalString == nil)
// Prints "false".


var optionalName: String? = nil
var greeting = "Hello!"
if let name = optionalName {
    greeting = "Hello, \(name)"
}
print(greeting)


var n = 2
while n < 0 {
    n *= 2
}
print(n)
// Prints "2".


var m = 2
repeat {
    m *= 2
} while m < 0
print(m)
// Prints "4".
