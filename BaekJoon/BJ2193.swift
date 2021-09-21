//https://www.acmicpc.net/problem/2193
//피보나치 문제
let N = Int(readLine()!)!
func dp() -> Int {
    var arr = Array(repeating: 1, count: N)
    if N <= 2 {
        return arr.last!
    }
    
    for i in 2..<arr.count {
        arr[i] = arr[i-1]+arr[i-2]
    }
    
    return arr.last!
}

print(dp())
