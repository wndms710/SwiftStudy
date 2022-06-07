// 영화 갯수, 러닝타임, 장르, 평점

var movieCount = Int.random(in: 1...100)
var movieRuntime = Int.random(in: 100...300)
var genreLlist = ["로맨스", "SF", "스릴러", "액션", "코미디"] // 배열
var movieGenre = genreLlist.randomElement()!
var movieRate = Double.random(in: 1...5)

print("당신은 총 \(movieCount)개의 영화를 보았고, 총 러닝 타임은 \(movieRuntime)분 입니다. 좋아하는 장르는 \(movieGenre)이며 지금까지 총 영화 평점은 \(movieRate)입니다.")


// 최근 검색어

var searchList: [String] = ["원피스", "바지"]

print(searchList)

searchList.insert("신발", at: 0)
searchList.insert("시계", at: 0)
searchList.append("양말")
searchList.append(contentsOf: ["a", "b", "c"])
searchList.remove(at: 0)

print(searchList)


// 6. 앨범 관리

var album: [String] = ["All", "Main Album", "내가 본 드라마", "내가 본 영화", "보고싶은 영화", "예능", "애니"]

album.append("역대급 꿀잼")

print(album)

album.remove(at: 0)

print(album)
print("==")
print(album[2])

album[2] = "소름돋는 이야기"

print(album)
print(album.count)

album.removeAll()

print(album)
print(album.count)

var sample: [[Int]] = [[1, 2, 3, 4], [0, 1, 2, 2, 2]]

print(sample[1][1])
