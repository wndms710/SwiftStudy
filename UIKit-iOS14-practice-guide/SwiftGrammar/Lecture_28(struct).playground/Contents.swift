import UIKit

// Structure
// 구조체
// struct 는 상속 불가
// 독립적으로 작동

// value type
struct ImageType {
    var type = ""
}

// 복제
var imageType1 = ImageType()
var imageType2 = imageType1
var imageType3 = imageType2

imageType1.type = "jpg"
imageType2.type = "png"

imageType1.type
imageType2.type
imageType3.type


class MyInfo {
    var myAge = 0
}

// 참조
var info1 = MyInfo()
var info2 = info1
var info3 = info2

info1.myAge = 20
info2.myAge = 10

info1.myAge
info2.myAge
info3.myAge
