import UIKit
import CoreFoundation

struct Friend {
    
    var age : Int
    
    var name : String
    
    func sayHello() -> String {
        print("sayHello()")
        return "저는 \(age)살, \(name) 입니다."
    }
}

var myFriend = Friend(age: 10, name: "조주은")

myFriend.sayHello()
