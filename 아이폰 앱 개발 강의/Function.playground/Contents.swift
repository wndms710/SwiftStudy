
func hello(name: String) -> String {
    return "Hello~ " + name
}

let message = hello(name: "주은")

print("Hi~~")
print(123, "Hello", true, 123.345, separator: "---", terminator: "")
print(message)

func addTwoNumbers(num1: Int, num2: Int = 100) -> Int {
    let sum = num1 + num2
    return sum
}

addTwoNumbers(num1: 5, num2: 10)
addTwoNumbers(num1: 5)


func addNumbers(numbers: Int...) -> Int {
    var sum = 0
    for num in numbers {
        sum += num
    }
    return sum
}

addNumbers(numbers: 1, 2, 3, 4, 5)


func myInfo() -> (name: String, weight: Int) {
    return("주은", 100)
}

let info = myInfo()
print(info.name)
print(info)



