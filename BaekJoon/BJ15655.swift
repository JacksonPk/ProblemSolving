//https://www.acmicpc.net/problem/15655

let input = readLine()!.split(separator: " ").compactMap{Int(String($0))}
let N = input[0]
let M = input[1]
let arr = readLine()!.split(separator: " ").compactMap{Int(String($0))}.sorted()
var result = Array(repeating: 0, count: M)
var isUsed = Array(repeating: false, count: N)
func backTracking(idx: Int) {
    if idx == M {
        for i in 0..<result.count {
            print(result[i],terminator: " ")
        }
        print()
        return
    }
    
    for i in 0..<arr.count where !(isUsed[i] || (idx != 0 && arr[i] < result[idx-1])) {
        isUsed[i] = true
        result[idx] = arr[i]
        backTracking(idx: idx+1)
        isUsed[i] = false
    }
}
backTracking(idx: 0)

//1 7
//1 8
//1 9
//7 1
//7 8
//7 9
//8 1
//8 7
//8 9
//9 1
//9 7
//9 8
