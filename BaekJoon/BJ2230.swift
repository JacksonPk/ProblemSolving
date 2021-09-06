//https://www.acmicpc.net/problem/2230
//M 이상이면서 제일 작은 경우
let input = readLine()!.split(separator: " ").compactMap{Int(String($0))}
let (N,M) = (input[0],input[1])
var arr = [Int]()
for _ in 0..<N {
    arr.append(Int(readLine()!)!)
}
arr.sort()

func twoPointer(arr: [Int]) -> Int {
    var left = 0
    var right = 0
    var diff = 0
    var result = arr[N-1] - arr[0]
    
    while (left <= right) && (right < arr.count) {
        diff = arr[right] - arr[left]
        
        if diff == M {
            return M
        } else if diff > M {
            left += 1
            result = min(result,diff)
        } else  if diff < M {
            right += 1
        }
    }
    return result
}

print(twoPointer(arr: arr))
