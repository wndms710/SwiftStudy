import UIKit

class MyFriend {
    var name : String
    
    
    init(_ name : String = "이름없음"){                 // _ 뒤에 띄어쓰기 중요
        self.name = name
        print("init() MyFriend 가 메모리에 올라갔다.", self.name)
    }
    
    // 메모리가 할당 해제되면 발동
    deinit{
        print("deinit() 메모리에서 사라짐 -", self.name)
    }
    
    // deinit 검증을 위해 작성
    var calledTimes = 0
    let MAX_TIMES = 5
    
    static var instancesOfSelf = [MyFriend]()
    class func destorySelf(object : MyFriend){
        instancesOfSelf = instancesOfSelf.filter{ (aFriend : MyFriend) in
            aFriend !== object
        }
    }
    
    func call(){
        calledTimes += 1
        print("called \(calledTimes)")
        if calledTimes > MAX_TIMES {
            MyFriend.destorySelf(object: self)
        }
    }
}

// Myfriend 에 "조주은"을 넣고 구워냄
// 이 행동 자체가 메모리에 올라간다
let myFriend = MyFriend("조주은")
let aFriend = MyFriend()

// 특정한 공간에 올라감

// 메모리 주소값 프린트 하는 방법
// Unmanaged.passUnretained(객체).toOpaque()
// 로 해당 객체의 메모리 주소를 프린트 할 수 있다
let anObjectMemoryAddress = Unmanaged.passUnretained(aFriend).toOpaque()

let secondMemoryAddress = Unmanaged.passUnretained(myFriend).toOpaque()

print(anObjectMemoryAddress)

print(secondMemoryAddress)


// 클래스 - 빵틀
// 빵틀로 빵을 구워냄, 즉 객체를 만듬
// 객체 - 빵 즉 메모리
// 객체를 생성하면 메모리 공간(주 기억장치)에 들어감
// 메모리 주소값


weak var aFriendToBeDestoried = MyFriend("개발하는 정대리")

if aFriendToBeDestoried != nil {
    aFriendToBeDestoried!.call()
} else {
    print("객체가 더 이상 메모리에 없습니다.")
}
