import UIKit

// 콜렉션 : 데이터를 모아둔 것
// 배열, 셋, 딕셔너리, 튜플
// 배열
var myArray : [Int] = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10] // 숫자로 이루어진 배열

//foreach

for item in myArray { //myArray가 가지고 있는 갯수만큼 반복, 요소를 item 에 담음
    print("item : \(item)") // \(item) : item 을 가져옴
}

//조건 추가
for item in myArray where item > 5 {
    print("5보다 큰 수 : \(item)")
}

for item in myArray where item % 2 != 0 { // % : 나누기
    print("홀수 : \(item)")
}
