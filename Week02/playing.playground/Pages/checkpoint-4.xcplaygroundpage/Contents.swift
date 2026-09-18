/**
 checkpoint 4
 by oddhorse / john trinh
 https://www.hackingwithswift.com/quick-start/beginners/checkpoint-4
 */

/**
 The challenge is this: write a function that accepts an integer from 1 through 10,000, and returns the integer square root of that number. That sounds easy, but there are some catches:

 1. You can’t use Swift’s built-in sqrt() function or similar – you need to find the square root yourself.
 2. If the number is less than 1 or greater than 10,000 you should throw an “out of bounds” error.
 3. You should only consider integer square roots – don’t worry about the square root of 3 being 1.732, for example.
 4. If you can’t find the square root, throw a “no root” error.
 
 As a reminder, if you have number X, the square root of X will be another number that, when multiplied by itself, gives X. So, the square root of 9 is 3, because 3x3 is 9, and the square root of 25 is 5, because 5x5 is 25.
 */


enum IntegerSquareRootError: Error {
    case outOfBounds, noRoot
}

func getIntegerSquareRoot(of sqr: Int) throws -> Int {
    if sqr < 1 || sqr > 10000 {
        throw IntegerSquareRootError.outOfBounds
    }
    // highest possible root value is 100 (100^2 = 10000)
    for i in 1...100 {
        let test = i * i
        if test == sqr {return i}
        else if test > sqr {break}
    }
    throw IntegerSquareRootError.noRoot
}

do {
    try getIntegerSquareRoot(of: 26)

} catch {
    print("error thrown! \(error)")
}


