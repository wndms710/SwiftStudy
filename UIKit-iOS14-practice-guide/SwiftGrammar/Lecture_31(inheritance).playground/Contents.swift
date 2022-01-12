import UIKit

// 상속 - class

class UserInfo {
    var name = ""
    var age = 0
    func isAdult() -> Bool {
        if age > 19 {
            return true
        }
        return false
    }
}


class Guest: UserInfo {
    // override - 기본으로 구현되어 있는 func 을 사용하지 않고 여기에 있는 걸로 실행하겠다
    override func isAdult() -> Bool {
        return true
    }
    
    func present() {
        name = "kim"
        print(name)
        // super 로 부모 class 에 접근 가능
        // class 는 참조, name = "kim" 이 부모 class 에도 적용
        print(super.name)
        
        print(isAdult())                    // 본 객체 내의 logic 실행
        print(super.isAdult())              // 부모 class 의 logic 실행
    }
    
}

let guest = Guest()
guest.present()
