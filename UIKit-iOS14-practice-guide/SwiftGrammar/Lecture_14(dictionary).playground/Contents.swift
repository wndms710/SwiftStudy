import UIKit

// Collection Types

// Dictionary
// 순서가 없음

var namesOfStreet = [String : Any]()

namesOfStreet["302ro"] = "1st Street"
namesOfStreet["303ro"] = "2nd Street"
namesOfStreet["304ro"] = 3

namesOfStreet

// 아예 존재하지 않게 됨
namesOfStreet["302ro"] = nil
namesOfStreet

namesOfStreet["301ro"]          // nil

var namesOFStreet2 = ["a" : 1, "b" : 2, "c" : 3]

namesOfStreet.keys

for dic in namesOfStreet {
    print(dic)
}
