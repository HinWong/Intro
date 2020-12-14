import Foundation

// MARK: - EXAMPLES


func noInputNoOutput() {
    print("This function has no parameter and or return")
}

/// Function with one parameter that is an Int
/// Parameter is labeled "year" inside the function and labeled "when" outside of the function
func pastOrFuture(when year: Int) {
    if year > 2020 {
        print("\(year) is in the future")
    } else {
        print("\(year) was in the past")
    }
}
pastOrFuture(when: 2021)


/// If there is only one label, then external label will be the same as internal label
func firstHalf(original: [String]) -> [String] {
    let result = array.dropLast(array.count/2)
    return Array(result)
}
let array = ["1", "2", "3", "4", "5", "6", "7"]
print(firstHalf(original: array))


/// Use enumberated to access the index and element
func printIndexAndElement(array: [String]) {
    for (index, element) in array.enumerated() {
        print("Index: \(index) and Element: \(element).")
    }
}
printIndexAndElement(array: ["firstName", "lastName"])


// MARK: - QUESTIONS
/// 1. Write a function that takes an array of numbers and returns an array with each of the numbers multiplied by 2




/// 2. Write a function to return the last half of the array




/// 3. Write a function that can be called with the commented code below and return [5, 6, 7, 8, 9, 10]




//let customArray = createCustomArray(from: 5, to: 10)


/// 4. Write a function that takes in two array and returns a combined array from adding each element at the same positions together
/// Input [2,3,4] and [7,6,5] will return [9,9,9]




/// 5. Create this 2-D array using for loops
/*
    [[1,2,3],
    [4,5,6],
    [7,8,9]]
 */




/// 6. Write a function that returns the number of pairs of elements that sums up to 0
/// Input [1,2,3,-1,-2,-4] -> Output 2




