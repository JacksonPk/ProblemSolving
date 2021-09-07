//https://www.acmicpc.net/problem/1806
let input = readLine()!.split(separator: " ").compactMap{Int(String($0))}
let S = input[1]
let arr = readLine()!.split(separator: " ").compactMap{Int(String($0))}

func twoPointer() -> Int {
    var minLength = 0
    var left = 0
    var right = 0
    var sum = 0
        
    while right < arr.count {
        sum += arr[right]
        
        if sum < S {
            right += 1
        } else {
            if minLength == 0 {
                minLength = (right-left) + 1
            } else {
                minLength = min(minLength,(right-left) + 1)
            }
            sum = sum - (arr[left] + arr[right])
            left += 1
        }
    }
    return minLength
}

print(twoPointer())
