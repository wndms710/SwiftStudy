import UIKit

// 옵셔널이란?
// 값이 있는 지 없는 지 모른다.
var someVariable : Int? = nil           // nil : 값이 없는 상태

if someVariable == nil {
    someVariable = 90
}

print("someVariable:", someVariable)

// 언랩핑이란? 랩 즉 감싸져 있는 것을 벗기는 것
// 여기서는 Optional 로 감싸져 있는 것을 벗김

if let otherVariable = someVariable {               // 값이 있다면 otehrVariable 에 넣어서 쓰겠다. 즉, otherVariable 은 Optional X
    print("언랩핑 되었다. 즉 값이 있다. otherVariable : \(otherVariable)")
} else {
    print("값이 없다.")
}

someVariable = nil

// someVariable 이 비어있으면, 즉 값이 없으면 기본 값으로 요놈을 넣겠다.
let myValue = someVariable ?? 10
print("myValue: \(myValue)")



var firstValue : Int? = 30
var secondValue : Int? = 50

print("firstValue:", firstValue)
print("secondValue:", secondValue)

unwrap(firstValue)
unwrap(secondValue)

func unwrap(_ parameter: Int?){
    print("unwrap() called")
    // 값이 없으면 리턴 해버린다.
    guard let unWrappedParameter = parameter            // 값이 있으면 unWrappedParameter 에 넣겠다.
    else { return                                       // 값이 없으면 리턴 해버린다. 즉 지나간다.
    }
    print("unWrapperParameter: \(unWrappedParameter)")
}
