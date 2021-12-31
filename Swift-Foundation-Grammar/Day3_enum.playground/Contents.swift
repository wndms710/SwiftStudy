import UIKit

// 학교 - 초, 중, 고
enum School {
//    case elementary
//    case middle
//    case high
    case elementary, middle, high
}

//var // 변수

// 상수
let yourSchool = School.high // .을 통해 case로 접근
print("youtSchool :", yourSchool)


// enum 이 값을 가지고 있음 (Int)
enum Grade : Int {
    case first = 1
    case second = 2
}

let yourGrade = Grade.second//.rawValue     // enum Grade Second 의 고유의 값
print("yourGrade : \(yourGrade.rawValue)")


enum SchoolDetail {
    case elementary(name: String)
    case middle(name: String)
    case high(name: String)
    
    func getName() -> String {          // getName() 호출하면 문자열(String)로 반환
        switch self {                   // 나 자신이
        case.elementary(let name):      // elementary 라면...
            // case 내에서는 : 사용
            return name                 // name 으로 반환
        case let .middle(name):
            return name
        case .high(let name):
            return name
        }
    }
}

let yourMiddleSchoolName = SchoolDetail.middle(name: "조주은중학교")      // name 에 값을 넘겨줌(조주은중학교)

print("yourMiddleSchoolName : \(yourMiddleSchoolName)")
print("yourMiddleSchoolName : \(yourMiddleSchoolName.getName())")
