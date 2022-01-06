import UIKit

// 함수

// 계산기 -> Class
// 더하기 기능 -> Function

let a = 10
let b = 20

var c = 0

func plus(num1: Int) {
    print("함수가 실행되는 부분", num1)
}

func simpleFunc() {
    print("simple Func")
}

plus(num1: a)


func plus1(num1: Int, num2: Int) -> Int {
    print("sum =", num1 + num2)
    // return이 있어야 결과값을 내보낸다
    return num1 + num2
}

let sum = plus1(num1: a, num2: b)


func plus2(num1: Int, num2: Int) {
    c = num1 + num2
}

c
plus2(num1: a, num2: b)
c


// 반환 여러 개 -> 튜플 형태로
func plus3(num1: Int, num2: Int) -> (String, Int) {
    print("sum =", num1 + num2)
    return ("결과값은" ,num1 + num2)
}

let p = plus3(num1: a, num2: b)


func plus4(_ num1: Int, _ num2: Int) -> Int {
    print("sum =", num1 + num2)
    return num1 + num2
}

let q = plus4(a, b)
