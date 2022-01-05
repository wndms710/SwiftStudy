import UIKit

// 별명
// 이름이 긴 애들 별명(별칭) 만들어줌

protocol Naming {
    func getName() -> String
}

protocol Aging {
    func getAge() -> Int
}

typealias Friendable = Naming & Aging

typealias FullNaming = Naming

//struct Friend : Naming & Aging {
//
//}

struct Friend : Friendable {
    
    var name : String
    var age : Int
    
    func getName() -> String {
        return self.name
    }
    
    func getAge() -> Int {
        return self.age
    }
}

// 자료형에 별칭을 줄 수도 있음
typealias FriendName = String

//var friendName : String
var friendName : FriendName = "조주은"

// 배열도 가능
typealias Friends = [Friend]

var myFriendsArray : Friends = []

// closure 도 가능
typealias StringBlock = (String) -> Void

func sayHi(completion : StringBlock){
    print("안녕하세요?")
    completion("오늘도 빡코딩 하고 계신가요?")
}

sayHi(completion: { saying in
    print("여기서 받음 :", saying)
})


class MyClass {
    enum MY_TYPE {
        case DOG, CAT, BIRD
    }
    var myType = MY_TYPE.DOG
}

typealias MyType = MyClass.MY_TYPE

var myClass = MyClass()

myClass.myType = MyType.DOG

print("myClass.myType:",myClass.myType)


// shift + command + F 전체검색
