//https://www.acmicpc.net/problem/15650

let input = readLine()!.split(separator: " ").compactMap{Int(String($0))}
let N = input[0]
let M = input[1]
var arr = Array(repeating: 0, count: M)
var isUsed = Array(repeating: false, count: N+1)

func backTracking(idx: Int) {
    if idx == M {
        arr.forEach{ val in print(val,terminator: " ") }
        print()
        return
    }
    
    for i in (idx+1)...N where !isUsed[i] && !(idx >= 1 && i <= arr[idx-1]) {
        isUsed[i] = true
        arr[idx] = i
        backTracking(idx: idx+1)
        isUsed[i] = false
    }
}

backTracking(idx: 0)
