//https://www.acmicpc.net/problem/15650
//조합의 개념
let nm = readLine()!.split(separator: " ").compactMap{Int(String($0))}
let n = nm[0]
let m = nm[1]

var isUsed = Array(repeating: false, count: n)
var arr = [Int]()

func backTracking(index: Int) {
    if arr.count == m {
        arr.forEach{ val in
            print(val,terminator: " ")
        }
        print("")
        return
    }
    for i in index...n {
        if isUsed[i-1] == false {
            isUsed[i-1] = true
            arr.append(i)
            backTracking(index: i)
            arr.removeLast()
            isUsed[i-1] = false
        }
    }
}

backTracking(index: 1)

