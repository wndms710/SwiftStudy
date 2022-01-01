import UIKit
import Security
import Foundation

// 에러를 enum 타입으로 만들 수 있다
enum MismatchError : Error {
    case nameMismatch
    case numberMismatch
}

// 에러를 던지는 메소드
func guessMyName(name input: String) throws {           // throws - 에러를 던지는 사인
    print("guessMyName() called")
    
    if input != "조주은"{
        print("틀렸다")
//        return                                    // return 을 만나면 다음 logic(print)을 실행하지 않고 넘어감
        throw MismatchError.nameMismatch            // 에러를 터뜨려야 하는 경우에 던짐
                                                    // 특정한 조건에 의해 에러를 던져야 하면 아래쪽을 타지 않고 바로 던지고 끝남
    }
    
    print("맞췄다")
}


//try guessMyName(name: "고주은")            // 에러를 던지는 메소드 사용할 때는 앞에 try 붙여줌
try? guessMyName(name: "고주은")             // 에러가 던져져도 처리를 하지 않겠다
//try! guessMyName(name: "고주은")           //  에러가 무조건 없을 것이다        // 에러가 던져졌기 때문에 에러 발생, 에러를 처리하고 싶지 않다

do {                                        // 던져진 에러를 잡겠다
    try guessMyName(name: "고주은")
} catch {
    print("잡은 에러: \(error)")
}

// 반환하는 메소드

// alt(option)+command+/
/// 번호를 맞춘다
/// - Parameter input: 사용자 숫자 입력
/// - Returns: bool 맞췄는지 여부
func guessMyNumber(number input: Int) throws -> Bool {
    print("guessMyNumber() called")
    
    if input != 10 {
        print("틀렸다")
        throw MismatchError.numberMismatch
//        return
    }
    print("맞췄다")
    return true
}


do {
    let receivedValue = try guessMyNumber(number: 10)
} catch {
    print("잡은 에러: \(error)")
}

// 에러가 없이 정상적으로 데이터를 받으면 에러가 던져지지 않아 받지 않음
// 에러가 던져지면 데이터를 반환하지 못하고 catch 블록 실행

