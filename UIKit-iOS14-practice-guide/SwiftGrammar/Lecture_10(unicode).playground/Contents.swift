import UIKit

// Unicode 범위 관련

// 숫자만 입력받을 수 있어야 한다


let inputValue = "e"

"\u{30}" == "0"
"\u{39}" == "9"

if inputValue >= "\u{30}" && inputValue <= "\u{39}" {
    print("숫자다")
} else {
    print("숫자가 아니다")
}


// 영어만 입력해야 한다

"\u{41}"
"\u{79}"
"\u{7a}"

