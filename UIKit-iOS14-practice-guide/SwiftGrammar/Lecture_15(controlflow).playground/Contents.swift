import UIKit

// Control Flow (흐름 제어)

// for

let name = "23423424234"

for char in name {
    print( (Int(String(char)) ?? 0) * 10)
}


let names = ["lee", "kim", "min"]

for name in names {
    print(name + "님")
}


let numberOfLegs = ["ant" : 6, "dog" : 4]

for dic in numberOfLegs {
    print(dic)
}


for index in 0..<names.count {
    print(index)
}


// while (주의) - 왠만하면 사용하지 않는 게 좋다
// 무한으로 반복문 안에서 계속 실행되는 경우 -> 멈춰버림

var a = 0

//while a == 0 {
//        print("계속 실행")
//}

while a < 10 {
    a = a + 1
    print("계속 실행")
}


// Switch
// 조건에 케이스를 만들어서 분기

let b = "a"

switch b {
    
case "a", "b":
    print("a or b")
    
case "c":
    print("c")
    
default:
    print("other")
    
}
