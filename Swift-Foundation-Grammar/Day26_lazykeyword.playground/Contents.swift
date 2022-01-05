import UIKit

// 당장 메모리에 올리지 않고 해당 데이터에 접근했을 때 메모리에 올리는 것

struct Pet {
    init(){
        print("Pet 이 생성되었다.")
    }
}

struct Friend {
    var name: String
    
    lazy var pet : Pet = Pet()
    
    init(_ name: String){
        self.name = name
        print("Friend 가 생성됨")
    }
}

var myFriend = Friend("조주은")

myFriend.pet
