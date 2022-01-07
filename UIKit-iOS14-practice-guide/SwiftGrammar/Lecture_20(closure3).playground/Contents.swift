import UIKit

// Closure 실전

// 조건 -> 찾는다 -> 특정한 글자가 포함된 것을 찾는다
// 조건 -> 찾는다 -> 입력한 글자로 시작하는 단어를 찾는다
let names = ["apple", "air", "brown", "red", "orange", "blue", "candy", "hobby"]


let containsSomeText: (String, String) -> Bool = { name, find in
    if name.contains(find){
        return true
    }
    return false
}


let isStartSomeText: (String, String) -> Bool = {name, find in
    if name.first?.description == find {
        return true
    }
    return false
}


func find(findString: String, condition: (String, String) -> Bool) -> [String] {
    var newNames = [String]()
    
    for name in names {
        if condition(name, findString) {
            newNames.append(name)
        }
    }

    return newNames
}

find(findString: "a", condition: containsSomeText)
find(findString: "a", condition: isStartSomeText)



func someFind(find: String) -> [String] {
    var newNames = [String]()
    
    for name in names {
        if name.contains(find) {
            newNames.append(name)
        }
    }
    
    return newNames
    
}

someFind(find: "y")

