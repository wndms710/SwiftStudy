import UIKit

// 분류만 하고 싶다 + 값
enum BookType {
    case fiction(title: String, price: Int, year: Int)
    case comics(title: String, price: Int, year: Int)
    case workbook(title: String, price: Int, year: Int)
}

extension BookType {
    var typeName: String {
        switch self {
        case .comics:
            return "comics"
        case .fiction:
            return "fiction"
        case .workbook:
            return "workbook"

        }
    }
}

var bookStyle : BookType?

var books = [BookType]()

func saveBook(book: BookType) {
    books.append(book)
}

saveBook(book: .comics(title: "aaa", price: 5000, year: 2020))
saveBook(book: .comics(title: "bbb", price: 6000, year: 2021))
saveBook(book: .comics(title: "ccc", price: 7000, year: 2010))
saveBook(book: .workbook(title: "ddd", price: 7000, year: 2010))
saveBook(book: .fiction(title: "eee", price: 4000, year: 2020))
saveBook(book: .fiction(title: "fff", price: 8000, year: 2015))

for book in books {
    
    // 하나만 가져올 때 이렇게도 가능
    if case let BookType.comics(title, _, _) = book {
        print("comics", title, book.typeName)
    }
    
    switch book {
    // 값을 가져오는 것은 var 나 let 사용
    case let .comics(_ , price, _):
        print(price)

    case let .fiction(title, _, _):
        print(title)
    // 하고 싶은 게 없으면 break
    default:
        break
    }

}
