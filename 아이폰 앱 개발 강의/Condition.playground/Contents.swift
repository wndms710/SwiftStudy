let dust = 35

if dust <= 30 {
    print("아 공기 상쾌하다~~")
}
else if dust > 30 && dust <= 50 {
    print("뭐 이 정도면 나쁘지 않군")
}
else if dust > 50 && dust <= 100 {
    print("아 안 좋아~")
}
else {
    print("헉 최악이다!ㅜ")
}


// 한 번 조건을 만족하는 case에 들어가면 바로 실행하고 바로 빠져나오는 형태
let weather = "장마"
switch weather {
case "맑음":
    print("☀️")
case "흐림":
    print("☁️")
case "비", "장마", "소나기":
    print("☔️")
case "눈":
    print("⛄️")
default:
    print("🌤")
}
