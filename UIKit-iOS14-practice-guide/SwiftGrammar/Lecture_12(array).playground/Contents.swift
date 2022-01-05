import UIKit

// Collection Types
// array, set, dictionary

// array : 순서가 매겨진 값들의 배열 (0부터 시작)

var myNames = Array<String>()           // () : initializing, 메모리에 올림
var myAges = [Int]()

myNames.append("kim")
myNames.append("lee")
myNames.append("cho")

myNames[0]

// 방어코드
// 안전한 코딩 스타일
let index = 2
if myNames.count > index {
    myNames[index]
}

//myNames.append(contentsOf: ["hi", "hello"])

myNames = myNames + ["hi"]

//myNames.remove(at: 3)
//myNames.removeFirst()
//myNames.removeAll()

// if myNames.count == 0
if myNames.isEmpty {
    
}

myNames.insert("hahaha", at: 1)

for name in myNames {
    print(name + "님")
}

for (index, Name) in myNames.enumerated() {
    print(index, Name)
}
