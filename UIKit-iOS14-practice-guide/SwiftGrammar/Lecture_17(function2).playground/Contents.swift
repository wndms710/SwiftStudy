import UIKit

let a = 10
let b = 20

func plus(_ num1: Int, _ num2: Int) -> Int {
    return num1 + num2
}

func minus(_ num1:Int, _ num2: Int) -> Int {
    return num1 - num2
}

func multiply(_ num1: Int, _ num2: Int) -> Int {
    return num1 * num2
}

// View, Present, Display

var inputButtonType = "+"

//if inputButtonType == "+" {
//    print("연산 결과", plus(a, b))
//
//} else if inputButtonType == "-" {
//    print("연산 결과", minus(a, b))
//
//} else if inputButtonType == "*" {
//    print("연산 결과", multiply(a, b))
//}


func displayCalc(result: (Int, Int) -> Int ) {
    print("연산결과", result(a, b))
}

if inputButtonType == "+" {
    displayCalc(result: plus)
    
} else if inputButtonType == "-" {
    displayCalc(result: minus)

} else if inputButtonType == "*" {
    displayCalc(result: multiply)
    
}

// 함수에는 정해진 내용만 명확하고 깔끔하게, 군더더기 없게
// plus 함수는 더하기만, displayCalc 는 화면에 뿌려주기만
