import UIKit

// 어떠한 자료 유형이든지 받을 수 있다.
// 제네릭 표시 <>


struct MyArray<T>{
    
    // 제네릭을 담은 빈 배열
    // T 는 형태가 없음, 어떠한 형태도 넣을 수 있음
    var elements : [T] = [T]()
    // var elements = [T]()
    
    // 생성자 메소드
    // 앞에 _를 넣음으로서 매개변수 이름 생략
    // T의 배열이 들어오면 내가 가지고 있는 elements 에 넣어줌
    init(_ elements: [T]){
        self.elements = elements
    }
}


struct Friend {
    var name: String
}


var mySomeArray = MyArray([1,2,3])
print("mySomeArray : \(mySomeArray)")

var myStringArray = MyArray(["가", "나", "다"])
print("myStringArray : \(myStringArray)")

let friend_01 = Friend(name: "철수")
let friend_02 = Friend(name: "영희")
let friend_03 = Friend(name: "수잔")

var myFriendsArray = MyArray([friend_01,friend_02,friend_03])
print("myFriendsArray : \(myFriendsArray)")
