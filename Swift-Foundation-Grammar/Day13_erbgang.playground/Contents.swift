import UIKit

class Friend {
    
    var name : String
    
    init(_ name: String){
        self.name = name
    }
    
    func sayHi(){
        print("안녕? 난 \(self.name) 이라고 해")
    }
}

class BestFriend : Friend {
    
    // 가져오면 자동적으로 override 로 바뀜
    // override 로 부모의 메소드를 가져옴
    // 이것을 생성자에 적용
    override init(_ name: String) {
        // super 가 부모를 의미
        // Friend 가 가지고 있는 init 호출 필수
        // super 로 부모의 메소드 사용
        // Friend 생성자 덮어쓰고 추가
        super.init("베프 "+name)
    }
    
    override func sayHi() {
        super.sayHi()
    }
}

let myFriend = Friend("조주은")

myFriend.sayHi()

let myBestFriend = BestFriend("영희")

myBestFriend.sayHi()

myBestFriend.name
