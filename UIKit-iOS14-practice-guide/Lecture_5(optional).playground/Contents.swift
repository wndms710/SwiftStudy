import UIKit

// Optionals

// 개념
// 값이 있을 수도 있고, 없을 수도 있다

// 값이 있다
// 값이 없다 -> nill

// 0 -> 다 쓴 상태의 값

// 지정해주지 않으면 초기값은 항상 nil

var myAge: Int? = 0

myAge = nil

// 값이 없는 상태 체크 -> 틀린 logic (Swift 언어 스펙)
if myAge == 0 {
    // alert - 나이를 입력해 주세요
}

if myAge == nil {
    // alert - 나이를 입력해 주세요
}


var myName: String? = nil        // 빈 String

// 값이 없는 상태 체크 -> 틀린 logic
if myName == "" {
    // 이름을 입력해 주세요
}

if myName == nil {
    // 이름 값이 없음
}
