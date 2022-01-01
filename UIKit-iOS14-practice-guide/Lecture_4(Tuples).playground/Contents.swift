import UIKit

// Tuples (n짝, n쌍)
// ( )

var topTitle = ("메인화면", "mainIcon.png")

topTitle.0
topTitle.1

// http status code
var httpError = (statusCode: 404, description: "not found")
// index 번호를 사용하면 복잡할 수 있다
// tuple에 설명을 추가할 수 있다

httpError.statusCode
httpError.description
