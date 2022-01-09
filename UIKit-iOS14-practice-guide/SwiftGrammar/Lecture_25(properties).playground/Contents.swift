import UIKit

// property - 재산, 소유물
// 어딘가에 속해있는 변수 지칭

class MyInfo {
    
    // stored property (저장)
    var name = ""
    var age = 0
    
    // lazy stored property (지연된 저장)
    // 사용하는 순간에 메모리에 올라감
    // 많은 것들을 처리할 때 유용
    lazy var myProfiles = [UIImage(named: "a"), UIImage(named: "b"), UIImage(named: "c"), UIImage(named: "d")]
    
    // computed property (계산된)
    // 변수 선언 + 타입 지정 + closure 형태 + 값이 어떻게 만들어 지는지
    // logic 이 실행되어서 값이 결정됨
    // 외부에서 값을 입력할 수 없고 확인만 가능
    var isAdult: Bool {
        if age > 19 {
            return true
        }
        return false
    }
    
    // emamil -> 보안 -> 암호화 된 값으로 사용한다 (항상)
    
    // get, set 내에서 값을 받아서 계속 기억하는 property
    // 기억하는 공간이 get, set 안에 있지 않음
    var _email = ""
    
    var email: String {
        // 어딘가에서 실행할 때 set에서 가져온 값을 가지고 get 내의 logic 실행
        get {
            print("done")
            return _email
        }
        // setting
        // 외부에서 값을 입력하면(setting 하면) set 내의 logic 실행
        set {
            // newValue - 새로운 값이 들어온다
//            _email = newValue
            // hash 값 암호화 된 값이라고 가정
            _email = newValue.hash.description
        }
    }
}


let myInfo = MyInfo()
myInfo.email = "wndms710@naver.com"

myInfo.email

myInfo.age = 10
myInfo.name = "kim"

myInfo.isAdult

myInfo.myProfiles


// set은 사용하지 않을 수 있으나(생략 가능) get은 무조건 사용(생략 불가능)
// get 하나만 있으면 표시하지 않아도 됨
