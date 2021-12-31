import UIKit


// final class 는 상속할 수 없다
final class Friend {
    
    var name : String
    
    init(name: String){
        self.name = name
    }
}

class BestFriend : Friend {
    
    override init(name: String){
        super.init(name: "베프 "+name)
    }
}

let myFriend = Friend(name: "조주은")
let myBestFriend = BestFriend(name: "철수")
