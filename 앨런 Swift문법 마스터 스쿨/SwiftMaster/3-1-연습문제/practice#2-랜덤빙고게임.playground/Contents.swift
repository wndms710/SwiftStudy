import UIKit

let myChoice = 5
let comChoice = Int.random(in: 1...10)

switch myChoice {
case let x where x == comChoice:
    print("Bingo")
case let x where x > comChoice:
    print("Down")
case let x where x < comChoice:
    print("Up")
default:
    break
}
