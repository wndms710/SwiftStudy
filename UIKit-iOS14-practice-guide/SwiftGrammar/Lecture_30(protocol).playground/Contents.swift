import UIKit

// 규격, 규약, 규칙, 청사진, 뼈대

protocol UserScore {
    var score: Int { get set }
}

protocol UserInfo {
    var name: String { get set }
    // get 은 필수로 입력, set 은 입력하지 않을 수도 있음 - 이는 set 을 쓸 수도 있고 안 쓸 수도 있다
    // set 을 입력하면 무조건 set 을 쓰겠다는 의미
    var age: Int { get set }
    // 규격이기에 값을 부여할 수 없음
    func isAdult() -> Bool
}

protocol UserDetailInfo: UserInfo, UserScore {
}

// UserInfo 를 준수하는 객체 내에서 extention 으로 확장한 함수의 logic 을 따로(다르게) 구현하면 따로 구현된 함수가 실행
// 따로 logic 을 구현하지 않았으면 extention 으로 확장된 함수 실행
extension UserInfo {
    func isAdult() -> Bool {
        if age > 19 {
            return true
        }
        return false
    }
}


class Guest: UserInfo, UserScore {
    var score: Int = 0
    
    var name: String = "kim"
    
    var age: Int = 20
    
    var height = 180
    
//    func isAdult() -> Bool {
//        if age > 19 {
//            return true
//        }
//        return false
//    }
}

class Member: UserDetailInfo {
    var score: Int = 0
    
    var name: String
    
    var age: Int
    
//    func isAdult() -> Bool {
//        if age > 19 {
//            return true
//        }
//        return false
//    }
    init(name: String, age: Int)  {
        self.name = name
        self.age = age
    }
}

class VIPMember: UserInfo {
    var name: String = "cho"
    
    var age: Int = 10
    
//    func isAdult() -> Bool {
//        if age > 19 {
//            return true
//        }
//        return false
//    }
}

class UserInfoPresenter {
    func present() {
        
        let guest = Guest()
        let member = Member(name: "Jane", age: 25)
        let vip = VIPMember()

        // UserInfo 로 규격화 되어 있어 타입을 UserInfo 로 지정 가능
        // UserInfo 에 규격화 되어 있지 않은 데이터는 가져올 수 없음
        // UserInfo 가 선언한 데이터들만 가져올 수 있음
        let members: [UserInfo] = [guest, member, vip]
        
        for element in members {
            print(element.name)
        }
        
//        print(guest.name)
//        print(member.name)
//        print(vip.name)
    }
}

let presenter = UserInfoPresenter()
presenter.present()

// set 을 입력하지 않으면 멤버 변수를 상수로 지정 가능
// set 을 입력하면 상수(let)로 지정 불가능 -> 값을 언제든 넣게 할 수 없음
