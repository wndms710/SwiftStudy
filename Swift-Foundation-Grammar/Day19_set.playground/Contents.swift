import UIKit

// 바구니의 여러 아이템, 순서가 없음
// 기존에 들어가 있는 아이템과 같은 아이템 추가할 수 없음
// 안에 있는 아이템들이 고유해야함

var myNumberSet : Set<Int> = Set<Int>()

myNumberSet.insert(1)
myNumberSet.insert(2)
myNumberSet.insert(2)
myNumberSet.insert(3)
myNumberSet.insert(3)

myNumberSet.count
myNumberSet

for aNumber in myNumberSet {
    print("aNumber:", aNumber)
}

var myFriends : Set<String> = ["철수", "영희", "수지"]
var myBestFriends : [String] = ["철수", "영희", "수지"]

// 배열이나 딕셔너리 같은 자료형과 같은 메소드를 쓸 수 있다
myFriends.contains("주은")
myBestFriends.contains("철수")

// set 에서 특정 아이템 삭제
if let indexToRemove = myFriends.firstIndex(of: "수지") {
    print("indexToRemove:",indexToRemove)
    myFriends.remove(at: indexToRemove)
}

myFriends
