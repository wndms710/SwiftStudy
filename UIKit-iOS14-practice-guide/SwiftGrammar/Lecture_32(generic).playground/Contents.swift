import UIKit

// generic <Type 내가 정한 임의의 타입>

// logic - 반복, 타입 여러가지

// stack - 데이터를 집어 넣는 컵, 넣을 때(push)는 순서대로 / 꺼낼 때(pop)는 역순으로
// queue

// 제한

struct MyStack<MyType> where MyType: Equatable{             // Equatable 로 제한할 경우 Any 타입을 쓸 수 없음 (비교 불가)
    var items = [MyType]()
    // 내부에서 변경되는 멤버 변수가 있을 때 mutating 사용
    mutating func push(item: MyType) {
        items.append(item)
    }
    
    mutating func pop() -> MyType? {
        if items.isEmpty {
            return nil
        }
        return items.removeLast()
    }
}

var myStack = MyStack<Int>()

myStack.push(item: 4)
myStack.push(item: 5)
myStack.push(item: 6)

myStack.pop()
myStack.pop()
myStack.pop()
myStack.pop()

//var myStack2 = MyStack<[String : Any]>()

var myStack2 = MyStack<MyInfo>()
struct MyInfo: Equatable {                  // MyStack 에서 Equatable 을 준수하기 때문?
    var name = ""
    var age = ""
}

