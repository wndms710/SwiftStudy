import UIKit

// 배열 - 데이터가 줄 지어진 나열
// 딕셔너리 - 키, 값 쌍으로 이루어진 사물함

// 키 : 값
var myFriends = ["bestFriend" : "조주은",
                 "highschool" : "영희"
                ]


let myBestFriend = myFriends["bestFriend"]

let highScoolFriend = myFriends["highschool"]

// 키에 해당하는 데이터가 없을 때 기본값 설정 가능
let youtuabeFriend = myFriends["youtube", default: "친구없음"]

myFriends["bestFriend"] = "개발하는 조주은"

let myBF = myFriends["bestFriend"]

myFriends["newFriend"] = "철수"

let newFriend = myFriends["newFriend"]

myFriends.updateValue("수잔", forKey: "girlFriend")

let girlFriend = myFriends["girlFriend"]

myFriends.updateValue("짹슨", forKey: "bestFriend")

let myBestFriend2 = myFriends["bestFriend"]

// 빈 딕셔너리
// 자료형을 넣고 비었다고 정의
let emptyDictionary : [String : Int] = [:]
let emptyDictionary2 : [String : Int] = [String : Int]()
let emptyDictionary3 = [String : Int]()

let myemptyDictionary : [String : Int] = Dictionary<String, Int>()

myFriends.count

for item in myFriends {
    print("item :",item)
}

