//https://www.acmicpc.net/problem/15652

let nm = readLine()!.split(separator: " ").compactMap{Int(String($0))}
let n = nm[0]
let m = nm[1]

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
        arr.append(i)
        backTracking(index: i)
        arr.removeLast()
    }
}


backTracking(index: 1)

