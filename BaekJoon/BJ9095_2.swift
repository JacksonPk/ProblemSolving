//https://www.acmicpc.net/problem/9095
//DP 복습
func dp(num: Int) -> Int {
    var arr = Array(repeating: 0, count: num+1)
    arr[0] = 1
    
    for i in 1...num {
        if i-1 >= 0 {
            arr[i] += arr[i-1]
        }
        if i-2 >= 0 {
            arr[i] += arr[i-2]
        }
        if i-3 >= 0 {
            arr[i] += arr[i-3]
        }
    }
    return arr[num]
}

for _ in 0..<Int(readLine()!)! {
    print(dp(num: Int(readLine()!)!))
}

