import UIKit

// 고차함수
// 매개변수로 함수 혹은 클로저를 받고 어떤 데이터를 반환하는 함수

func getName(_ name: String) -> String {
    return "내 이름은 \(name)"
}

//var getNameClosure : (String) -> String

func sayHello(getName1: (String) -> String, name: String) -> String {
    return getName(name)
}

let resultOne = sayHello(getName1: getName(_:), name: "조주은")


let numbers = [3, 7, 4, -2, 9, -6, 10, 1]

let stringNumbers = numbers.map { (aNumber: Int) -> String in
    return "\(aNumber) 입니다."
}

let evenNumbers : [Int] = numbers.filter { aNumber in
    return aNumber % 2 == 0
}

let oddNumbers : [Int] = numbers.filter { aNumber in
    return aNumber % 2 != 0
}

