import UIKit

// String

let myName = "cho ju eun"

for character in myName {
    print(character)
}

let myName2 = "kim"

let name = myName + myName2

let myName3 = "cho\nju\nenu"

let myLongStr =
"""
hi
hello
welcome
"""

print(myLongStr)

// type String으로 변환
let isOn = false
isOn.description

let myNumber = 123
myNumber.description
String(myNumber)

"my number is \(myNumber)".last                       // 마지막 문자
"my number is \(myNumber)".dropLast()                 // 마지막 문자 버리기
"my number is \(myNumber)".dropFirst()                // 첫번째 문자 버리기

let myNumber2 = 12.33
String(myNumber2).split(separator: ".")
