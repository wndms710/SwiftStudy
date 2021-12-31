import UIKit


// () -> Void
func completion(){

}



// completion 이라는 클로저를 매개변수로 가지는 메소드 정의
func sayHi(completion: () -> Void){
    print("sayHi() called")
    sleep(2)            // 2초 잠깐 멈추기
    // completion 클로저 실행
    completion()
}

// 메소드 호출부 에서 이벤트 종료를 알 수 있다.
sayHi(completion: {
    print("2초가 지났다. 1")
})

sayHi(){
    print("2초가 지났다. 2")
}

sayHi{
    print("2초가 지났다. 3")
}


// 매개변수로서의 클로저가 매개변수를 가질 수 있지 않을까?


// (String) -> Void
func completion(userInput: String){

}


// 매개변수로서 데이터를 반환하는 클로저
func sayHiWithName(completion: (String) -> Void){
    print("sayHiWithName() called")
    sleep(2)
    // 클로저를 실행과 동시에 데이터를 반환
    completion("오늘도 빡코딩 어쩌구")
}

sayHiWithName(completion: { (comment: String) in
    print("2초 뒤에 그가 말했다! comment:", comment)
})

sayHiWithName(completion: {comment in
    print("2초 뒤에 그가 말했다! comment:", comment)
})

sayHiWithName { comment in
    print("2초 뒤에 그가 말했다! comment:", comment)
}

sayHiWithName {
    print("2초 뒤에 그가 말했다! comment:", $0)
}



// (String, String) -> Void
func completion(first: String, second: String){

}

// 매개변수로서 데이터를 여러 개 반환하는 클로저
func sayHiWithFullName(completion: (String, String) -> Void){
    print("sayHiWithName() called")
    sleep(2)
    // 클로저를 실행과 동시에 데이터를 반환
    completion("어쩌구", "메롱")
}

sayHiWithFullName{first, second in
    print("첫번째: \(first), 두번째: \(second)")
}

// first 를 쓰고 싶지 않을 때 (생략)
sayHiWithFullName{ _, second in
    print("두번째: \(second)")
}

sayHiWithFullName{
        print("첫번째: \($0), 두번째: \($1)")
}

// completion 이벤트를 받고 싶지 않을 때
// 클로저 자체를 optional 로 만들고 기본형을 nil 로 준다
func sayHiOptional(completion: (() -> Void)? = nil ){
    print("sayHiOptional() called")
    sleep(2)            // 2초 잠깐 멈추기
    // completion 클로저 실행
    completion?()
}

//sayHiOptional {
//    <#code#>
//}

sayHiOptional()

sayHiOptional(completion: {
    print("2초가 지났다.!!")
})


// (Int) -> String
func transform(number: Int) -> String {
    return "숫자 : \(number)"
}


var myNumbers : [Int] = [0, 1, 2, 3, 4, 5]

var transformedNumbers1 = myNumbers.map { aNumber in
    return "숫자: \(aNumber)"
}
// collection 자체에서 반복을 지원 (6 times)
// 숫자 배열을 받아서 문자 배열로 뱉는다

var transformedNumbers2 = myNumbers.map { (aNumber: Int) -> String in
    return "숫자: \(aNumber)"
}

var transformedNumbers3 = myNumbers.map {
    return "숫자: \($0)"
}
