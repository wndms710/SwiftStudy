import UIKit

var title = ""

let jobTitle = "개발자"

//jobTitle = "호호"
//Cannot assign to value: 'jobTitle' is a 'let' constant

func sayName(_ name : String){
    print("안녕? 난 \(name) 라고 해")
}

sayName("조주은")


//func sayHi(_ name : String){
//Cannot assign to value: 'name' is a 'let' constant
// 매개변수로 들어오는 name 의 값을 변경하길 원함 : inout 사용
func sayHi(_ name :inout String){
    name = "개발하는 " + name
    print("안녕? 난 \(name) 라고 해")
}

// 변수에 담기
var name = "조주은"

sayHi(&name)


// let(상수)를 변경하려고 했을 때 뜨는 에러가 inout 을 하지 않았을 때도 발생
// 변경하기 위해 매개변수의 자료형 앞에 inout 붙여주기
// 값을 넣을 때는 변수에 담고 변수 앞에 & 사인을 넣어주기
