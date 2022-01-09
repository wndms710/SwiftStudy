import UIKit
import CoreFoundation


// 초기값 지정 필수
// enum 이 class 내에 존재하면 class 내에서만(만들 때에만) 사용 가능

class MyInfo {
    
    init(gender: GenderType) {
        self.genderType = gender
    }
    // 외부에서 입력도 못하고 확인도 못하게 하고 싶을 때
    // 생성할 때만 값 설정
    private var genderType: GenderType
    
    enum GenderType {
        case male
        case female
    }
    
    var name = ""
    var age = 0
    
    func isAdult() -> Bool {
        if age > 19 {
            return true
        }
        return false
    }
}

// 참조 (class are reference type)
// 결국 모두 MyInfo(gender: .female) 를 가리킴
var myInfo = MyInfo(gender: .female)
myInfo.age = 20

var myInfo2 = myInfo
myInfo2.age = 100

var myInfo3 = myInfo2
myInfo3.age = 300

myInfo.age
myInfo2.age
myInfo3.age
