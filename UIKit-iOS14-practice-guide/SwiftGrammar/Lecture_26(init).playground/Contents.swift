import UIKit

// 생성자
// init

class MyInfo {
    var name: String = ""
    var myId: String = ""
    
    var age: Int?
    var isAdult: Bool
    
    // designated initializer
    init(n: String, id: String){
        self.name = n
        self.myId = id
        self.isAdult = ((age ?? 0 ) > 19) ? true : false
    }
    
//    init() {
//        self.name = ""
//        self.myId = ""
//        self.isAdult = (age > 19) ? true : false
//    }
    
//    init(id: String){
//        self.name = ""
//        self.myId = id
//        self.isAdult = (age > 19) ? true : false
//    }
    
    // convenience initializer // 필수조건 - 다른 init을 반드시 실행해야 한다
    // 다른 init을 호출하여 초기값을 지정하고 추가하고 싶은 항목을 추가한다
    convenience init() {
        self.init(n: "", id: "")
    }
    
    convenience init(id: String){
        self.init(n: "", id: id)
    }
}

// var myInfo1 = MyInfo.init(n: "cho", id: "abcd") 과 같은 의미
var myInfo1 = MyInfo(n: "cho", id: "abcd")
var myInfo2 = MyInfo()
var myInfo3 = MyInfo(id: "some id")

myInfo1.myId
myInfo1.name


struct MyConfig {
    var conf: String
}

var myCon = MyConfig(conf: "")
