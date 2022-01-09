import UIKit

// Enumerations

// enum
// 타입 분류

// 도서관 -> 항목 -> 소설, 문제집, 패션, 만화책

// 분류만 하고 싶다 
enum BookType {
    case fiction
    case comics
    case workbook
}

// 어떤 타입(case)인지 모를 때
var bookStyle : BookType?
bookStyle           // Optional

var books = [BookType]()

func saveBook(book: BookType) {
    books.append(book)
//    if book == .comics {
//        // 저장..
//    } else if book == .fiction{
//
//    }

    
//    switch book {
//    case .comics:
//        books.append(book)
//
//    case .fiction:
//        books.append(book)
//
//    default:
//
//    }
    
}

saveBook(book: .comics)
saveBook(book: .fiction)
saveBook(book: .workbook)
saveBook(book: .workbook)

books


func loadBook(book: BookType) -> [BookType]{
    var tempBooks = [BookType]()
    
    for item in books {
        if item == book {
            tempBooks.append(item)
        }
    }
    return tempBooks
}


loadBook(book: .workbook)
