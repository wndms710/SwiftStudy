// 7. 집단 자료형 집합 Set

var array: Set = [1, 2, 3, 4, 5, 6, 7, 8, 6, 6, 5, 5, 4, 3, 3, 3, 3, 3, 3, 3, 3, 3]

print(array)


var two: Set = [2, 2, 2, 2, 2, 2, 4, 6, 8, 10, 12, 14]
var three: Set = [3, 6, 9, 12, 15, 18, 21]

let result = two.intersection(three)

print(result)

print(two.union(three))

print(two.subtract(three))

print(two.symmetricDifference(three))
