import UIKit

// Collection Types

// set
// 순서가 없음

var names = Set<String>()
names.insert("kim")
names.insert("lee")
names.insert("cho")
names.insert("kim")
names.insert("kim")
names

var sameNames = ["lee", "lee", "kim", "lee"]
// set 이용하여 중첩 없애기
Set(sameNames)


var numbers1: Set = [1, 2, 3, 4, 5]

var numbers2: Set = [4, 5, 6, 7, 8]

// 교집합 (집합 여러 개도 가능)
numbers1.intersection(numbers2)
//numbers1.intersection(numbers2).intersection(numbers3) ...

// 합집합
numbers1.union(numbers2)

// 합집합 - 교집합 (대칭차집합)
numbers1.symmetricDifference(numbers2)

// 여집합
numbers1.subtracting(numbers2)
