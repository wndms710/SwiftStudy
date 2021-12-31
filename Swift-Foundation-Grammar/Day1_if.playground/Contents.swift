import UIKit

// 다크모드 여부
var isDarkMode : Bool = true

// () 쓰지 않아도 됨
if isDarkMode != true {
    print("다크모드가 아닙니다.")
} else {
    print("다크모드 입니다.")
}

//isDarkMode == false
if !isDarkMode {
    print("다크모드가 아닙니다.")
} else {
    print("다크모드 입니다.")
}

// isDarkMode == true                               else
var title : String = isDarkMode ? "다크모드 입니다" : "다크모드가 아닙니다"

print("title: \(title)")


// isDarkMode == false                              else
var title : String = !isDarkMode ? "다크모드가 아닙니다" : "다크모드 입니다"

print("title: \(title)")
