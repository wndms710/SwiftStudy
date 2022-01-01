import UIKit

var a: Int? = 20
var b: Int?

// Unwrapping
// if Statements

if a != nil {
    print(a)
//    print(a!)
}

if let
if var
if let hasNumber = a {
    print(hasNumber)
}

if var hasNumber = a {
    hasNumber = hasNumber * 2
    print(hasNumber2)
}


// guard let
// guard var

func testFunc() {
    guard let hasNumber = b else {
        return
    }
    print(hasNumber)
    print("end")
}

testFunc()


func testFunc() {
    guard var hasNumber = a else {
        return
    }
    hasNumber = hasNumber * 2
    print(hasNumber)
    print("end")
}

testFunc()
