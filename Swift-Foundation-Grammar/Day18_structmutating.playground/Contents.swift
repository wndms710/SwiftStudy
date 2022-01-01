import UIKit

// struct 는 값, class 는 참조(주소)


class Friend {
    var name : String
    
    func changeName(newName: String){
        self.name = newName
    }
    init(_ name:String){
        self.name = name
    }
}

var myFriend = Friend("조주은")

myFriend.changeName(newName: "개발하는 조주은")

myFriend.name


struct BestFriend {
    
    var name : String
    
//    func changeName(newName: String){
//        self.name = "호호" + self.name                  //struct는 값이기 때문에 이 구문 불가, mutating 붙여주기
    
    mutating func changeName(newName: String){
        self.name = "호호" + self.name
//        print("newName", newName)
    }
//    init(_ name:String){
//        self.name = name
//    }
}

var myBestFriend = BestFriend(name: "조주은")

myBestFriend.changeName(newName: "크크")


// struct 안에서 멤버 변수를 변경하려면 메소드 앞에 mutating 붙여준다
