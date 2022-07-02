import UIKit

//func withEscaping(completion: @escaping () -> Void) {
//    completion()
//}


// 예시 1
var completionHandlers: [() -> Void] = []

func withEscaping(completion: @escaping () -> Void) {
    completionHandlers.append(completion)
}

// 예시 2
class Myclass {
    var x = 10
    
    func callFunc() {
        withEscaping { self.x = 100 }
        withoutEscaping { x = 200 }
    }
    
    var completionHandlers: [() -> Void] = []
    
    func withEscaping(completion: @escaping () -> Void) {
        completionHandlers.append(completion)
    }
    
    func withoutEscaping(completion: () -> Void) {
        completion()
    }
}

let mc = Myclass()

mc.callFunc()
print(mc.x)

mc.completionHandlers.first?()
print(mc.x)
