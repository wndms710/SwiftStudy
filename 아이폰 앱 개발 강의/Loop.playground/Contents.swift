
for i in 1...10 {
    print(i)
}

for i in stride(from: 1, to: 10, by: 2){
    print(i)
}

for i in stride(from: 10, to: 1, by: -2){
    print(i)
}

for j in 2...9 {
    print("\(j)단 시작")
    for i in 1...9{
//        print(String(j) + " X " + String(i) + " = " + String(j * i))
        print("\(j) X \(i) = \(j * i)")
    }
}


var i = 0
// 조건 먼저
while i < 10 {
    i += 1
    print(i)
}

// 실행 먼저
i = 0
repeat{
    i += 1
    print(i)
} while i < 10
