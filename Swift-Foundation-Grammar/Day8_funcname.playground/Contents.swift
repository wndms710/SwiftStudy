import UIKit


// 함수, 메소드 정의
// name 은 함수의 매개체로 들어가는 매개 변수
func myFunction(name: String) -> String {
    return "안녕하세요?! \(name)입니다!"
}

// 함수, 메소드를 호출한다. call
myFunction(name: "조주은")


// 함수, 메소드 정의
// 매개 변수 이름 바꾸기
func myFunctionSecond(with name: String) -> String {
    return "안녕하세요?! \(name)입니다!"
}

myFunctionSecond(with: "조주은야호")


// 함수, 메소드 정의
// 매개 변수 이름 생략
func myFunctionThird(_ name: String) -> String {
    return "안녕하세요?! \(name)입니다!"
}

myFunctionThird("크크크")
