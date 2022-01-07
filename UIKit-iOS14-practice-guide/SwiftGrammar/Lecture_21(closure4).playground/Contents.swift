import UIKit

var names =  ["Chris", "Alex", "Ewa", "Barry", "Daniella"]

// sort
// 데이터 정렬
names.sort { (lhs, rhs) -> Bool in
    return lhs < rhs
}

// by로 받는 게 하나면 by, by 감싸는 구조 생략 가능
names.sort(by: { $0 < $1 })

names.sort() { $0 < $1 }

names.sort{ $0 < $1 }

names.sort(by: < )

//names.sort< 는 불가


// sorted
// 데이터 원본은 그대로, 정렬된 값을 새로 내보냄
names.sorted()

// 보통 과거형은 변경하고 값을 내놓는다
// 현재형일 경우 변경만 한다, 즉 결과값은 없다
