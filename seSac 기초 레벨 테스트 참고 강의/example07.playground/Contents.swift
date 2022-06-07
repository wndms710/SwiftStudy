// 반복문 - 음악 차트

let musicList = ["아이유-좋은날", "이무진-과제곡", "BTS-Dynamite", "아이유-잔소리"]

for music in musicList {
    print("음악 차트 Top3:\(music)")
    print("=====================")
}

for music in 1...musicList.count {
    print("\(music)위 - \(musicList[music - 1])")
}

 1~100

print(1)
print(2)
print(3)

for number in 1...100 {
    print(number)
}
