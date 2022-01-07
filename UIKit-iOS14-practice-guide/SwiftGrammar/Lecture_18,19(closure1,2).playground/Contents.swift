import UIKit

// func 유사
// closure - 이름이 없음


// function
func myScore(a: Int) -> String {
    return "\(a)점"
}

let score = myScore
score(50)

// closure
let myScore2 = { (a: Int) -> String in
    return "\(a)점"
}

// 축약 (생략)

// logic 이 return 한 줄로 끝나는 경우 return 생략 가능
let myScore3 = { (a: Int) -> String in
    "\(a)점"
}


// return 구문 타입 추론으로 반환값 String 으로 예상 가능
let myScore4 = { (a: Int) in
    "\(a)점"
}
myScore4(20)


let myScore5: (Int, Int) -> String = { (a, b) in
    "\(a + b)점"
}

myScore5(20, 30)


let myScore6: (Int, Int, Int) -> String = {
    "\($0 + $1 + $2)점"
}

myScore6(1,2,3)
