//https://www.acmicpc.net/problem/15664

let input = readLine()!.split(separator: " ").compactMap{Int(String($0))}
let N = input[0]
let M = input[1]
let arr = readLine()!.split(separator: " ").compactMap{Int(String($0))}.sorted()
var result = Array(repeating: 0, count: M)
var currResult = [[Int]]()
var isUsed = Array(repeating: false, count: N)
func backTracking(idx: Int) {
    if idx == M {
        currResult.append(result)
        return
    }
    for i in 0..<arr.count where !(isUsed[i]) {
        if (idx != 0 && arr[i] < result[idx-1]) {continue}
        isUsed[i] = true
        result[idx] = arr[i]
        var flag = false
        for i in 0..<currResult.count {
            if result == currResult[i] {
                flag = true
            }
        }
        if !flag {
            backTracking(idx: idx+1)
        }
        isUsed[i] = false
    }
}
backTracking(idx: 0)
for i in 0..<currResult.count {
    for j in 0..<currResult[i].count {
        print(currResult[i][j],terminator: " ")
    }
    print()
}
