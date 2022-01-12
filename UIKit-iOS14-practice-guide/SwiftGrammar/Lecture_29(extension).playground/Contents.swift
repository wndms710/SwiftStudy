import UIKit

// 기능 확장
// 원래 있던 것이든(String, Int) 내가 만든 것이든 확장 가능
// struct, class, enum, protocol


// 숫자(int) 짝수, 홀수

extension Int {
    var OddOrEven : String {
        if self % 2 == 0 {                          // self = Int
            return "짝수"
        }
        return "홀수"
    }
}

3.OddOrEven
4.OddOrEven

20.OddOrEven

// UIColor
// mainColor1 = xxx
// mainColor2 = xxx
// subColor2 = xxx

//UIColor(red: 50/255, green: 70/255, blue: 120/255, alpha: 1)

extension UIColor {
//    var mainColor: UIColor {
//        UIColor(red: 50/255, green: 70/255, blue: 120/255, alpha: 1)
//    }
    class var mainColor: UIColor {
        UIColor(red: 50/255, green: 70/255, blue: 120/255, alpha: 1)
    }
}

var button = UIButton()

//button.titleLabel?.textColor = UIColor(red: 50/255, green: 70/255, blue: 120/255, alpha: 1)
//button.titleLabel?.textColor = UIColor().mainColor
button.titleLabel?.textColor = UIColor.mainColor
button.titleLabel?.textColor = .mainColor

button.titleLabel?.textColor = UIColor.orange
button.titleLabel?.textColor = .orange


// command + control or command + 선택 -> 정의
