//https://www.acmicpc.net/problem/15657

let input = readLine()!.split(separator: " ").compactMap{Int(String($0))}
let N = input[0]
let M = input[1]
let arr = readLine()!.split(separator: " ").compactMap{Int(String($0))}.sorted()
var result = Array(repeating: 0, count: M)

func backTracking(idx: Int) {
    if idx == M {
        for i in 0..<result.count {
            print(result[i],terminator: " ")
        }
        print()
        return
    }
    for i in 0..<arr.count where !(idx != 0 && result[idx-1] > arr[i]) {
        result[idx] = arr[i]
        backTracking(idx: idx+1)
    }
}
backTracking(idx: 0)
