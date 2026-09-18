// things i'm thinking about as i'm doing 100 days of swiftui

// swift has so many features! features are nice but makes code that uses all of them a real bitch to read. i'm also coming from pretty much only c-style languages though.
 
 
// FEATURES I HAVE THOUGHTS ON
 
// switch statements: very cool they don't pass through by default, but more complex case logic can get difficult to read:

let vegetable = "red pepper"
switch vegetable {
case "celery":
    print("Add some raisins and make ants on a log.")
case "cucumber", "watercress":
    print("That would make a good tea sandwich.")
case let x where x.hasSuffix("pepper"):
    print("Is it a spicy \(x)?")
default:
    print("Everything tastes good in soup.")
}
// Prints "Is it a spicy red pepper?"

// range statements are SO COOL! never used a language that has them before except python, where they're typed as functions. these are so inutitive to type out

var total = 0
for i in 0..<4 {
    total += i
}

// optionals: if let syntax is very confusing. it'll take me a while to get used to this

var optionalName: String? = "John Appleseed"
var greeting = "Hello!"
if let name = optionalName {
    greeting = "Hello, \(name)"
}
print(greeting)


// labeled statements: VERY COOL. super easy to read advanced control flow

let options = ["up", "down", "left", "right"]
let secretCombination = ["up", "up", "right"]
outerLoop: for option1 in options {
    for option2 in options {
        for option3 in options {
            print("In loop")
            let attempt = [option1, option2, option3]

            if attempt == secretCombination {
                print("The combination is \(attempt)!")
                break outerLoop
            }
        }
    }
}

// function parameter labels: i also like how swift requires specifying parameter names when passing arguments to functions. could get verbose but if a function has like six parameters that might be a you problem idk. ofc it's nice that you can pick a parameter to use with no name! good balance between concise and verbose. VERY cool that you can give each parameter an INTERNAL and EXTERNAL name for max readability!!!!


// closures: they're not that bad! javascript has these all over, in pretty similar ways, and i've spent a few years getting used to them!

// trailing closure syntax: this is the kinda feature that i think makes swift hard to read and a pain to get into. all this special syntax for certain niche cases (well i guess swift uses closures a lot so maybe not) and damn your code can look like anything!


// `mutating` keyword for struct methods to mark that they change properties might be a headache to remember honestly

