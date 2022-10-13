import UIKit

let inputNum = 0
let randomNum = Int.random(in: 0...2)

if inputNum == randomNum {
    print("무승부입니다.")
} else {
    if (inputNum == 0 && randomNum == 2)
        || (inputNum == 1 && randomNum == 0)
        || (inputNum == 2 && randomNum == 1)
    {
        print("당신이 이겼습니다.")
    } else {
        print("당신은 졌습니다.")
    }
}
