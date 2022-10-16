import UIKit

//// 1. 구구단
//for i in 2...9 {
//    for j in 1...9 {
//        print("\(i) X \(j) = \(i*j)")
//    }
//}
//
//
//// 2. 3의 배수 찾기
//for i in 1...100 {
//    if i % 3 == 0 {
//        print("3의 배수 발견: \(i)")
//    }
//}



//// 가독성이 높아지는 구현
//for i in 1...100 {
//    if i % 3 != 0 {
//        continue
//    }
//    print("3의 배수 발견: \(i)")
//}
        

// 3. 이모지 피라미드 출력
for i in 1...5 {
    for _ in 0..<i {
        print("😄", terminator: "")
    }
    print()
}

for i in 1...5 {
    for j in 1...5 {
        if j <= i {
            print("😄", terminator: "")
        }
    }
    print()
}
