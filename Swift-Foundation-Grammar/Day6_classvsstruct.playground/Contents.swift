import UIKit

// 변수 : 값이 변하는 수, 데이터 하나 씩만 담음
// 상수 : 값이 변하지 않는 수

// model 에 여러 개의 데이터를 모아둠
// model 에 데이터를 담아 두는 두 가지 방식이 클래스와 스트럭트
// 변수들의 모음, 데이터 덩어리


// 유투브 (데이터) 모델 - struct / 구조체
struct YoutuberStruct {
    var name : String
    var subscribersCount : Int
}

var devCho = YoutuberStruct(name : "조주은", subscribersCount: 99999)

var devChoClone = devCho

print("값 넣기 전 devChoClone.name : \(devChoClone.name)")

devChoClone.name = "호롤룰루"

// 값 복사이기 때문에 둘의 값이 다르다
print("값 넣은 후 devChoClone.name : \(devChoClone.name)")
print("값 넣은 후 devCho.name : \(devCho.name)")

// 처음에 조주은을 만들고(A 종이) 복사를 함(B 종이) - 값 복사
// A 종이와 B 종이는 다름, B 종이가 훼손되도 A 종이는 그대로



// 클래스
class YoutuberClass {
    var name : String
    var subscribersCount : Int
    // 생성자 = 즉 메모리에 올린다
    // init 으로 매개변수를 가진 생성자 메소드를 만들어야 매개변수를 넣어서 그 값을 가진 객체(object)를 만들 수 있다
    init(name : String, subscribersCount : Int) {                  // 시작을 뜻함
        self.name = name                                           // YoutuberClass 의 이름을 외부에서 넘어온 name 으로 넣는다
        self.subscribersCount = subscribersCount
}
}

var Jueun = YoutuberClass(name : "조주은", subscribersCount: 99999)
var JueunClone = Jueun
    
print("값 넣기 전 JueunClone.name : \(JueunClone.name)")
    
JueunClone.name = "호롤룰루"

print("값 넣은 후 JueunClone.name : \(JueunClone.name)")
print("값 넣은 후 Jueun.name : \(Jueun.name)")


// struct 는 다른 종이에 값을 복사
// class 는 서로 연결, 같은 공간 메모리를 바라보고 있기 때문에(참조)
