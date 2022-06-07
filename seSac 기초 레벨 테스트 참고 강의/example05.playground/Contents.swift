// Dictionary: 고유한 키와 키에 해당하는 밸류가 있다. 순서 X

var movie: [String:String] = ["한국": "신과 함께", "일본": "너의 이름은", "미국": "어벤져스"]

print(movie)

var student: [Int:String] = [1001: "홍길동", 1002: "김영희"]

student[1003] = "김철수"

student[1001] = "김민수"

student.updateValue("존", forKey: 1003)

student.removeValue(forKey: 1004)

print(student)
