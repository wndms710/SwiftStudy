import UIKit

// Deinitialization
// 메모리 해제될 때 호출

var a: Int? = 10
// nil 을 주면 메모리에서 해제, 사라지게 됨
a = nil

class Game {
    var score = 0
    var name = ""
    var round: Round?
    
    init(){
        print("game init")
    }
    deinit {
        print("game deinit")
    }
    
}

class Round {
//    var gameInfo: Game?
    weak var gameInfo: Game?
    var lastRound = 10
//    weak var lastRound = Game()               // 약한 참조는 참조하지 않는 것과 똑같음 - nil
    var roundTime = 20
    deinit {
        print("round deinit")
    }
}

var game: Game? = Game()
//var game2: Game? = game
//game = nil
//game2 = nil
// 참조하고 있는 모든 것(retain count)을 해제해야지(nil) Game 해제됨

var round: Round? = Round()

// 상호참조


game = nil
round = nil
// 해체되지 않은 것이 티가 안남

// 상호참조는 서로가 서로를 잡고 있어서 해제하지 못함
// 변수는 해제되지만 메모리에 Game, Round 객체는 해제되지 않음


// Round 는 Game 에 의존적, Game 이 없으면 Round 가 없어도 됨
// Round에 weak var 사용 - 참조하고 있는 원본이 사라지면 나도 사라지겠다
// weak 는 class 를 받을 때에만 사용 가능
