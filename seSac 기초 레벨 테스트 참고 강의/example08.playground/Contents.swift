// 응용 1. 5의 배수와 7의 배수를 찾기

let randomNumber = [3, 7, 10, 35, 70, 13, 44]

for number in randomNumber {
    if (number % 5 == 0) && (number % 7 == 0) {
        print(number)
    }
}


// 응용 2. 우수자 선별하기(300점 만점, 200점 이상 우수)

let scoreArray = [180, 270, 240, 300, 90, 120]

var bestArray: [Int] = []

for score in scoreArray {
    if score >= 200 {
        bestArray.append(score)
    }
}

print(bestArray)

print("우수자는 총 \(bestArray.count)명입니다.")

if bestArray.contains(300) {
    print("만점자가 있습니다.")
}


// 응용 3. 투표 수 집계

let voteArray = ["명수", "명수", "준하", "명수", "준하", "명수", "준하", "명수", "준하"]

var mCount = 0
var jCount = 0

for name in voteArray {
    if name == "명수" {
        mCount += 1
    } else {
        jCount += 1
    }
}

print("명수를 투표한 사람은 \(mCount)명, 준하를 투표한 사람은 \(jCount)명 입니다")


// 응용 4. 국가별 영화 출력

var movie: [String:[String]] = ["한국": ["신과 함께", "명량", "괴물"],
                                "일본": ["나는 어제의 너와 만난다", "너의 이름은"]]

for item in movie {
    print("\(item.key)의 작품들")
    print(item.value)
}
