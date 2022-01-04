import UIKit

protocol Naming {
    var lastname: String { get set }
    var firstname: String { get set }
//    func getName() -> String
    func getFullname() -> String
}

extension Naming {
    func getFullname() -> String {
        self.lastname + " " + self.firstname
    }
}

struct Friend : Naming {
    var lastname: String
    var firstname: String
//    func getName() -> String {
//        return self.lastname
//    }
}

let myFriend = Friend(lastname: "조", firstname: "주은")

//myFriend.getName()
myFriend.getFullname()


// 프로토콜을 사용할 때에는 여기 이런 메소드를 사용할 것이다 선언만 하는 것
// logic을 넣을 순 없음
// extension을 활용하면 logic을 넣을 수 있음
// 이름 동일하게 가져가면 바로 logic을 넣을 수 있음
