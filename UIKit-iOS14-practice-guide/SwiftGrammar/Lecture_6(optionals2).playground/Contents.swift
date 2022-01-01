import UIKit

// 옵셔널 그냥 사용할 수 없는 경우가 많이 있음

var a: Int? = 10
var b: Int? = 20

// unwrapped
// unwrapping

// Int? -> Int
// String? -> String

// coaleasce
// 값이 없으면 0으로 대체되어 사용
var c = (a ?? 0) + (b ?? 0)


// force unwrap -> 강제로, 힘으로
// 주의사항 : 값이 무조건 있어야 함, 없으면 앱이 죽음
var d = a! + b!

