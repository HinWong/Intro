import UIKit

var str = "Hello, playground"

// access controll modifier
// Private
// Fileprivate
// Internal
// Public: can be accessible by other app / module using import
// Open: only for class
/// - allows for sub classing, and overriding from a different app/module


class Car {
    /// private: only accessible in the same declaration scope
    static let staticName = "Car Name"
    
    static func testDrive() {
        print("Car class only")
    }
    
    private func drive() {
        print("vroom vroom")
    }
    /// internal: default
    /// accessible within the same app
    /// anything that you can import is one module / app
    internal func driveTwice() {
        drive()
        drive()
    }
    
    // accessible within the same file
    fileprivate func makeNoise() {
        print("afoieapsj[ase")
    }
}

class FlyingCar: Car {
    
    /// can't be overridden
    final func fly() {
        print("whoosh")
    }
}

let myNewCar = FlyingCar()
myNewCar.fly()
myNewCar.driveTwice()

let regCar = Car()
regCar.driveTwice()

/// Static for Type variables and Type functions
//regCar.staticName
Car.staticName
Car.testDrive()

