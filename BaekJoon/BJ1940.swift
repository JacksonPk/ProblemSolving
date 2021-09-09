//https://www.acmicpc.net/problem/1940

let _ = readLine()
let M = Int(readLine()!)!
let arr = readLine()!.split(separator: " ").compactMap{Int(String($0))}.sorted()

func twoPointer() -> Int {
    var count = 0
    var left = 0
    var right = arr.count - 1
    var sum = 0
    
    while left < right {
        sum = arr[left] + arr[right]
        if sum == M {
            left += 1
            right -= 1
            count += 1
        } else if sum < M {
            left += 1
        } else {
            right -= 1
        }
    }
    return count
}
print(twoPointer())
