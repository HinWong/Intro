import UIKit

var str = "Hello, playground"

// enum
enum LightSwitch {
    case On
    case Off
}

class Room {
    var myStringSwitch = "on"
    var myLightSwitch = LightSwitch.On
    
}

class Tool {
    func work() {
        print("working is hard")
    }
}
 
class Hammer: Tool {
    var weight: WeightType
    
    init(weight: WeightType) {
        self.weight = weight
    }
}

// default value for enums
enum WeightType: String {
    case Light = "2 lbs"
    case Heavy = "10 lbs"
    case Normal = "5 lbs"
}

let myWeightType = WeightType.Light
let myHammer = Hammer(weight: myWeightType)
print(myHammer.weight)
print(myHammer.weight.rawValue)

if myHammer.weight == WeightType.Light {
    
} else if myHammer.weight == WeightType.Heavy {
    
} else {
    
}

switch myHammer.weight {
case .Light:
    print("this is easy")
case .Heavy:
    print("this is kind of harder")
case .Normal:
    print("this is average")
}

class PowerTool: Tool {
    var type: ElectricType?
}

// associated value for enum
enum ElectricType {
    case electricHammer(String)
    case electricScrewdriver(Int, String)
    case electricDril(String)
    case electricSaw(String)
}

let electricTool = ElectricType.electricScrewdriver(34, "Model: XP")
let electricToolTwo = ElectricType.electricSaw("Model: XP44")

let myPowerTool = PowerTool()
myPowerTool.type = electricTool


print(myPowerTool.type)

// can't do this with associated value
//let myValue = myPowerTool.type.rawValue


switch myPowerTool.type {
case .electricDril(let model):
    print(model)
case let .electricScrewdriver(modelInt, modelString):
    print(modelInt, modelString)
case let .electricSaw(sawModel):
    print(sawModel)
default:
    print("Model unknown")
}
