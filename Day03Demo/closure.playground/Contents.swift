import UIKit

var str = "Hello, playground"

func takesAClosure(closure: (Int) -> Int) {
    closure(3)
}

func doublingFunc(num: Int) -> Int {
    return num * 2
}

var doublingClosure: (Int) -> Int = { num in
    return num * 2
}

var halfingClosure: (Double) -> Int = { num in
    return Int(Double(num) / 2.0)
}

doublingClosure(4)
doublingFunc(num: 4)

func doublerWithClosure(num: Int, closureIntType: (Int) -> Int ) -> Int {
    let result = num * 2
    return closureIntType(result)
}

func doublerWithClosure(_ num: Int, closureDoubleType: (Double) -> Int ) -> Int {
    let result = num * 2
    return closureDoubleType(Double(result))
}

func doublerWithClosure() {
    print("fake func")
}

func doublerSingleClosure(_ closure: () -> ()) {
    closure()
    print("fake func")
}

/// method overloading
doublerWithClosure(num: 3, closureIntType: doublingClosure)
doublerWithClosure(3, closureDoubleType: halfingClosure)
doublerWithClosure()
doublerSingleClosure({
    let num = 4
        num * 2
})
doublerSingleClosure {
    let num = 4
    num * 2
}

[1,2,3,4,5].map { (element) -> Int in
    element * 2
}
[1,2,3,4,5].map { $0 * 2 }


extension Array {
    func myMap(){}
    func myFilter(){}
}

/// [1,2,3,4,5].myMap({$0 < 3}) // [1,2]
