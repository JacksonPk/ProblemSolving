//https://www.acmicpc.net/problem/2559
let input = readLine()!.split(separator: " ").compactMap{Int(String($0))}
let (N,K) = (input[0],input[1])
var arr = readLine()!.split(separator: " ").compactMap{Int(String($0))}

func twoPointer() -> Int {
    var maxSum = -100 * K //모두 -100 이상 100 이하이다.
    var left = 0
    var right = 0
    var sum = 0
    
    while right < arr.count {
        sum += arr[right]
        
        if (right-left+1) == K {
            maxSum = max(sum,maxSum)
            sum = sum - arr[left]
            left += 1
        }
        right += 1
    }
    
    return maxSum
}

print(twoPointer())
