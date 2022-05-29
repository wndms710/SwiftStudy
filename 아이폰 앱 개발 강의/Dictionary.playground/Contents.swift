
var toDoDic2: Dictionary<Int, String> = [17: "Play", 25: "Watch Movies", 28: "Travel"]
var toDoDic = [17: "Play", 25: "Watch Movies", 28: "Travel"]

toDoDic[17]

toDoDic[31] = "Study"
print(toDoDic)

toDoDic[31] = ""
print(toDoDic)

toDoDic.removeValue(forKey: 31)
print(toDoDic)

toDoDic[28] = nil
print(toDoDic)

for (key, value) in toDoDic {
    print("key : \(key), value: \(value)")
}

for key in toDoDic.keys {
    print(key)
}

for value in toDoDic.values {
    print(value)
}

toDoDic.removeAll()
print(toDoDic)
