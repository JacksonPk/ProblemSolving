//https://www.acmicpc.net/problem/3273
//n개의 서로 다른 양의 정수 정렬문제라니!!
let _ = readLine()
let arr = readLine()!.split(separator: " ").compactMap{Int(String($0))}.sorted()
let X = Int(readLine()!)!

func twoPointer() -> Int {
    var count = 0
    var left = 0
    var right = arr.count-1
    var sum = 0
    
    while left < right {
        sum = arr[left] + arr[right]
        if sum == X {
            count += 1
            left += 1
            right -= 1
        } else if sum > X {
            right -= 1
        } else {
            left += 1
        }
    }
    return count
}
print(twoPointer())

