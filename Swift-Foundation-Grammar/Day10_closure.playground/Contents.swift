import UIKit

// String 을 반환하는 클로저
let myName : String = {
    // myName 으로 들어간다
    return "조주은"
}()

print(myName)

// String 을 매개변수로 받아서 String 을 내뱉는 클로저 가 된다.
// 매개변수로 들어온 String 은 name 이라는 이름으로 받을 수 있고, 최종적으로 내뱉는 것은 String 이다.

// 클로저 정의
let myRealName: (String) -> String = { (name: String) -> String in
//let myRealName = { (name: String) -> String in
    return "개발하는 \(name)"
}

myRealName("조주음")

// 딱히 내뱉는 것이 없을 때에는 Void 로 처리
let myRealNameLogic : (String) -> Void = { (name: String) in
    print("개발하는 \(name)")
}

myRealNameLogic("조주은크크")


// 클로저 자체는 메소드를 실행하게 되는 것
// 매개변수를 가지면서 반환 값을 가지는 메소드
// 반환하는 값이 없으면 Void 로 처리
