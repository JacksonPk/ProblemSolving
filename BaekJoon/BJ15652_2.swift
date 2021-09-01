//https://www.acmicpc.net/problem/15652

let input = readLine()!.split(separator: " ").compactMap{Int(String($0))}
let N = input[0]
let M = input[1]
var arr = Array(repeating: "", count: M)
func backTracking(idx: Int) {
    if idx == M {
        print(arr.joined(separator: " "))
        return
    }
    
    for i in 1...N where !(idx != 0 && String(i) < arr[idx-1]) {
        arr[idx] = String(i)
        backTracking(idx: idx+1)
    }
}

backTracking(idx: 0)
