//https://www.acmicpc.net/problem/1463
//다시 풀어본 DP
let N = Int(readLine()!)!

var arr = Array(repeating: 0, count: N+3)
func dp(num: Int) -> Int {
        
    arr[0] = 0
    arr[1] = 0
    arr[2] = 1
    arr[3] = 1
    
    if num <= 3 {
        return arr[num]
    }
    
    for i in 4...num {
        
        if i%3 == 0 {
            arr[i] = arr[i/3]+1
        }
        if i%2 == 0 {
            if arr[i] != 0 {
                arr[i] = arr[i] <= arr[i/2]+1 ? arr[i] : arr[i/2]+1
            }else {
                arr[i] = arr[i/2]+1
            }
        }
        if i-1 != 0 {
            if arr[i] != 0 {
                arr[i] = arr[i] <= arr[i-1]+1 ? arr[i] : arr[i-1]+1
            }else {
                arr[i] = arr[i-1]+1
            }
        }
    }
    
    return arr[num]
}

print(dp(num: N))

