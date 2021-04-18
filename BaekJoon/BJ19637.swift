//https://www.acmicpc.net/problem/19637
/*
 배열을 두개를 쓴 이유는 딕셔너리는 소팅이 되질 않아서이다.
 */
let nm = readLine()!.split(separator: " ").compactMap{Int(String($0))}
let n = nm[0]
let m = nm[1]
var titles = [String]()
var values = [Int]()

for _ in 0..<n {
    let inputs = readLine()!.split(separator: " ")
    titles.append(String(inputs[0]))
    values.append(Int(inputs[1])!)
}


func binarySearch(with value : Int) -> String {
    var left = 0
    var right = values.count - 1
    var ans = 0
    while left<=right {
        let mid = (left + right) / 2
        if value <= values[mid] { //들어온 숫자 1.  중간값 400
            ans = mid
            right = mid - 1
        }else {
            left = mid + 1
        }
    }
    return titles[ans]
}

for _ in 0..<m {
    print(binarySearch(with : Int(readLine()!)!))
}

//print(Int.max)
//print(binarySearch())



