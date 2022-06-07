// 1. 회원가입 : 닉네임, 이메일, 나이, 평점, 성별
// 타입 추론, 타입 어노테이션
var nickname = "고래밥"
var age = 33
let email: String = "jack@jack.com"
var rate: Double = 4
var gender = true // true:남자, false:여자

print("안녕하세요 \(nickname)입니다. 저는 \(age)살이고 이메일은 \(email)입니다. \(rate)")
print(gender)
print(rate)

nickname = "칙촉"
age = 20
//email = "sesac@sesac.com"
gender = false
rate = 3.5

print("안녕하세요 \(nickname)입니다. 저는 \(age)살이고 이메일은 \(email)입니다.")
print(gender)
print(rate)


// 2. WHOAMI
var birth: Int = 1997

var day: Int = (2022 - birth) * 365

var rice: Int = day * 3

print("""
      저는 \(birth)년에 태어났고,
        지금까지 \(day)일 째 살고 있습니다.
            저는 지금까지 \(rice)끼를 먹었어요.
      그리고 저는 \(day * 8)시간을 잤어요
    """)
