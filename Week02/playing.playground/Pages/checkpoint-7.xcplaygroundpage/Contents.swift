/**
 checkpoint 7
 by oddhorse / john trinh
 https://www.hackingwithswift.com/quick-start/beginners/checkpoint-7
 */

/**
 Your challenge is this: make a class hierarchy for animals, starting with `Animal` at the top, then `Dog` and `Cat` as subclasses, then `Corgi` and `Poodle` as subclasses of `Dog`, and `Persian` and `Lion` as subclasses of `Cat`.

 But there’s more:

 1. The `Animal` class should have a `legs` integer property that tracks how many legs the animal has.
 2. The `Dog` class should have a `speak()` method that prints a generic dog barking string, but each of the subclasses should print something slightly different.
 3. The `Cat` class should have a matching `speak()` method, again with each subclass printing something different.
 4. The `Cat` class should have an `isTame` Boolean property, provided using an initializer.*/

class Animal {
    let legs: Int
    init(legs: Int) {
        self.legs = legs
    }
}

class Dog: Animal {
    func speak() {
        print("bark")
    }
    init() {
        super.init(legs: 4)
    }
}

class Cat: Animal {
    let isTame: Bool
    func speak() {
        print("meow")
    }
    init(isTame: Bool) {
        self.isTame = isTame
        super.init(legs: 4)
    }
}

class Corgi: Dog {
    override func speak() {
        print("yip yip")
    }
}

class Poodle: Dog {
    override func speak() {
        print("bark bark (in a gay way)")
    }
}

class Persian: Cat {
    override func speak() {
        print("mrowwwww")
    }
    init() {
        super.init(isTame: true)
    }
}

class Lion: Cat {
    override func speak() {
        print("ROAR !!")
    }
    init() {
        super.init(isTame: false)
    }
}
