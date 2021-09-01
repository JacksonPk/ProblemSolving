//https://www.acmicpc.net/problem/15663

let input = readLine()!.split(separator: " ").compactMap{Int(String($0))}
let N = input[0]
let M = input[1]
let arr = readLine()!.split(separator: " ").compactMap{Int(String($0))}.sorted()
var result = Array(repeating: 0, count: M)
var currResult = result
var isUsed = Array(repeating: false, count: N)
func backTracking(idx: Int) {
    if idx == M {
        currResult = result
        for i in 0..<currResult.count {
            print(currResult[i],terminator: " ")
        }
        print()
        return
    }
    for i in 0..<arr.count where !(isUsed[i]) {
        isUsed[i] = true
        result[idx] = arr[i]
        if result != currResult {
            backTracking(idx: idx+1)
        }
        isUsed[i] = false
        
    }
}
backTracking(idx: 0)
