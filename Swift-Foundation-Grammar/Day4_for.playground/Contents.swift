import UIKit

// 레인지

// 0...5
// 0,1,2,3,4,5

// 0..<5
// 0,1,2,3,4

for index in 0...5 {                // index : 어떤 번째(?)에 있는 지 가리킨다
    print("호호 index : \(index)")
}


for index in 0..<5 where index % 2 == 0 {
    print("호호 index : \(index)")
}


// 빈 배열을 만드는 방법
var randomInts : [Int] = []
var randomInts : [Int] = [Int]()


for _ in 0..<25 {                                   // 변수 요소를 사용하지 않을 때에는 '_' 기입
    let randomNumber = Int.random(in: 0...100)      // Int 에 0...100 의 랜덤한 수를 넣음
    randomInts.append(randomNumber)                 // randomInts 에 randomNumber 을 넣음 (append)
}

print("randomInts: \(randomInts)")
