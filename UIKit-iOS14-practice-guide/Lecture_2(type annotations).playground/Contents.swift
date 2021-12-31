import UIKit

// Type Annotations
// 타입 정의 (: type)

var str: String = "Hello, playground"
var myAge: Int = 0
// 타입 추론으로 자동으로 정의되어 생략도 가능
// 정확하게 타입 지정 하기 위해서는 필요
var screenHeight: Float = 560


// 타입이 맞지 않으면 연산에 에러 발생 (Safe type)
//var sum = myAge + screenHeight
var sum = myAge + Int(screenHeight)

/*
 asdf
 asfas
 dfasdf
 asdf
 */
