/**
 checkpoint 8
 by oddhorse / john trinh
 https://www.hackingwithswift.com/quick-start/beginners/checkpoint-8
 */

/**
 Your challenge is this: make a protocol that describes a building, adding various properties and methods, then create two structs, `House` and `Office`, that conform to it. Your protocol should require the following:

 1. A property storing how many rooms it has.
 2. A property storing the cost as an integer (e.g. 500,000 for a building costing $500,000.)
 3. A property storing the name of the estate agent responsible for selling the building.
 4. A method for printing the sales summary of the building, describing what it is along with its other properties.
 */

protocol Building {
    var roomCount: Int { get }
    var cost: Int { get set }
    var estateAgentName: String { get set }
    func printSalesSummary()
}

struct House: Building {
    let roomCount: Int
    var cost: Int
    var estateAgentName: String
    func printSalesSummary() {
        print("this house has \(roomCount) rooms and costs $\(cost). it's perfect for living in! for sales inquiries, contact \(estateAgentName).")
    }
}

struct Office: Building {
    let roomCount: Int
    var cost: Int
    var estateAgentName: String
    func printSalesSummary() {
        print("this office has \(roomCount) rooms and costs $\(cost). it's perfect for doing business in! for sales inquiries, contact \(estateAgentName).")
    }
}
