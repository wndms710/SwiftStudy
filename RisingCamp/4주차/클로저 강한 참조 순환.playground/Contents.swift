import UIKit
import Foundation

class HTMLElement {
    let name: String
    let text: String?
    
    // 클로저 참조 변수
    // 메소드가 아닌 self.text, self.name을 참조함
    lazy var asHTML: () -> String = {
        [unowned self] in       // 클로저 강한 참조 순환 방지, 클로저가 참조하는 self는 미소유 참조다.
        if let text = self.text {
            return "<\(self.name)>\(text) </\(self.name)>"
        }
        else {
            return "<\(self.name) />"
        }
    }
    
    init(name: String, text: String? = nil) {
        self.name = name
        self.text = text
    }
    
    deinit {
        print("\(name) is being deinitialized")
    }
}

var paragraph: HTMLElement? = HTMLElement(name: "p", text: "hello world")
paragraph!.asHTML()

paragraph = nil


/// 획득 목록 정의

//// 매개변수 목록이나 반환 타입이 존재할 때
//lazy var someClosure: (Int, String) -> String = {
//    [unowned self] (index: Int, stringToProcess: String) -> String in
//}
//
//// 매개변수 목록이나 반환 타입이 없을 때
//lazy var someClosure() -> String {
//    [unowned self] in
//}
