import UIKit

var str = "Hello, playground"


//class Animal {
//    func eat() { print("eating") }
//}
//class Pet: Animal {
//    func play() { print("playing") }
//}
//class Predator: Animal {
//    func hunt() { print("hunting for food") }
//}
//class Cat: Pet {
//    func hunt() { print("hunting for food") }
//}

/// Protocol composition
protocol Animal {
    func eat()
}
extension Animal {
    func eat() { print("eating") }
}

protocol Pet {
    func play()
}
protocol Predator {
    func hunt()
}
extension Predator {
    func hunt() { print("hutning") }
}

struct Cat: Animal, Pet, Predator {
    func play() {
        print("playing")
    }
    func hunt() {
        print("cat is hunting")
    }
}
let lola = Cat()
lola.hunt()
lola.play()

struct Lion: Animal, Predator {
    
}
let simba = Lion()
simba.hunt()
//simba.play()


//tableView.delegate = self
class CEO {
    var helper: Worker?
    func makeMoney() { print("$$$$$$$") }
    
}
class Worker {
    func doWork() -> Bool {
        let num: Double = 3
        let sqrtNum = sqrt(num)
        if sqrtNum < 3 {
            return true
        }
        return false
    }
}

let bill = CEO()
let bob = Worker()
bill.helper = bob
bill.helper?.doWork()
