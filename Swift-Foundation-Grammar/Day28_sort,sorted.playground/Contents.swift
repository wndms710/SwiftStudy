import UIKit

var myArray = [3, 4, 88, 99, 5, 6, 7, 8, 10, 20, 100]

// 오름차순
// 배열을 정렬해서 반환
var orderedArray = myArray.sorted()

// myArray 자체를 변경
myArray.sort()

// 내림차순
var descendingArray = myArray.sorted(by: >)

myArray.sort(by: >)

// 비교 기준이 있어야 함
