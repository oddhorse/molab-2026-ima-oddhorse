/**
 checkpoint 6
 by oddhorse / john trinh
 https://www.hackingwithswift.com/quick-start/beginners/checkpoint-6
 */

/**
 To check your knowledge, here’s a small task for you: create a struct to store information about a car, including its model, number of seats, and current gear, then add a method to change gears up or down. Have a think about variables and access control: what data should be a variable rather than a constant, and what data should be exposed publicly? Should the gear-changing method validate its input somehow?
 */

struct Car {
    let model: String
    let numSeats: Int
    private var currentGear = 0
    
    enum ShiftGearDirection {
        case up, down
    }
    
    enum ShiftGearError: Error {
        case outOfBounds
    }
    
    mutating func changeGear(_ gear: ShiftGearDirection) throws {
        switch gear {
        case .up:
            if currentGear == 6 {throw ShiftGearError.outOfBounds}
            currentGear += 1
        case .down:
            if currentGear == 1 {throw ShiftGearError.outOfBounds}
            currentGear -= 1
        }
    }
}
