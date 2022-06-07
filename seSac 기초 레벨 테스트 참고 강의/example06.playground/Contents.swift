// 조건문(if, switch)

var gender = true

if gender == true {
    print("저는 여성입니다.")
} else {
    print("저는 남성입니다.")
}

// 수화물 요금 안내

var weight = 40

if weight > 15 {
    print("수화물 요금을 내셔야 합니다.")
} else {
    print("수화물 요금이 없습니다.")
}


// 부모님 동의가 필요한 회원가입

var age = Int.random(in: 5...50)

if age >= 14 {
    print("\(age)살이므로, 부모님 동의 없이 가입할 수 있습니다.")
} else {
    print("\(age)살이므로, 부모님의 동의가 필요합니다.")
}


// 영화 프로그램 추천

var userSelect = "영화"

if userSelect != "영화" {
    print("오늘의 드라마 '어게인 마이 라이프'을 추천드립니다.")
} else {
    print("오늘의 영화 '괴물'을 추천드려요.")
}


// 성적 장학금

var gradePoint = 4.4

gradePoint = 3.1

if gradePoint >= 4.3 {
    print("장학금을 받을 수 있습니다.")
} else {
    print("아쉽지만 장학금 대상이 아닙니다.")
}



// 조건문 - 닉네임 설정

var userNickname = "말미잘"

if userNickname == "바보" || userNickname == "말미잘"{
    print("이 닉네임은 사용할 수 없습니다.")
} else {
    print("이 닉네임은 사용 가능합니다.")
}

var blacklist = ["바보", "말미잘", "해삼", "현금", "번호"]

if blacklist.contains(userNickname) {
    print("닉네임 사용 불가")
} else {
    print("닉네임 사용 가능")
}

var premium = true

if premium {
    print("결제 했음")
}


// 조건문 - 쿠폰 서비스
// 0~4:손님, 5~9:귀한분, 10~19:더귀한분, 20~:천생연분

let order = Int.random(in: 0...30)

print(order)

if order >= 0 && order < 5 {
    
    print("5000원 쿠폰 투척!")
    
} else if order >= 5 && order < 10 {
    
    print("10000원 쿠폰 투척!")
    
} else if order >= 10 && order < 20 {
    
    print("20000원 쿠폰 투척!")
    
} else if order >= 20 {
    
    print("50000원 쿠폰 투척!")
    
} else {
    
    print("오류 발생")
    
}


// BMI 계산기
// BMI지수 = 몸무게(kg) / (신장(m) * 신장(m))
// 18.5 이하 저체중, 18.5~23 정상, 23~25 과체중, 25~30 비만, 30이상 고도비만

var weight = Double.random(in: 40...100)
var height = Double.random(in: 1.5...2.0)

var bmi = weight / (height * height)
print(bmi)

if bmi >= 0 && bmi <= 18.5 {
    print("저체중")
} else if bmi <= 23 {
    print("정상")
} else if bmi <= 25 {
    print("과체중")
} else if bmi < 30 {
    print("비만")
} else if bmi >= 30 {
    print("고도비만")
} else {
    print("오류")
}
