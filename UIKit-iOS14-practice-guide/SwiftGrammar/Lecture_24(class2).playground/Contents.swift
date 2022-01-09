import UIKit

// Class - Inheritance
// 상속

class GameInfo {
    var homeScore = 0
    var awayScore = 0
    // override 로 변경할 수 없음
    final func presentScore() -> String {
        return homeScore.description + ":" + awayScore.description
    }
}

class Soccer: GameInfo {
    var time = 0
}

class Baseball: GameInfo {
    // 상속받은 원본의 logic 을 쓰지 않고 내가 작성한 logic 을 쓰겠다
    // 부모 class 에서 final 일 경우 쓸 수 없음
    override func presentScore() -> String {
        return homeScore.description + "대" + awayScore.description
    }
    var round = 0
}

class Football: GameInfo {
}

let soccer = Soccer()
soccer.awayScore = 1
soccer.homeScore = 2
soccer.time = 45
soccer.presentScore()

let baseball = Baseball()
baseball.homeScore = 20
baseball.presentScore()
baseball.round = 2
