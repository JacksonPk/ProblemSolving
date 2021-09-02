//https://www.acmicpc.net/problem/15665

let input = readLine()!.split(separator: " ").compactMap{Int(String($0))}
let N = input[0]
let M = input[1]
let arr = Array(Set(readLine()!.split(separator: " ").compactMap{Int(String($0))}).sorted())
var result = ""
func backTracking(idx: Int, result: String) {
    if idx == M {
        print(result)
        return
    }
        for i in 0..<arr.count {
            var temp = result
            temp += String(arr[i])+" "
            backTracking(idx: idx+1, result: temp)
            
        }
}
backTracking(idx: 0, result: "")
