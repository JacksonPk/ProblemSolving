//https://www.acmicpc.net/problem/2531
let input = readLine()!.split(separator: " ").compactMap{Int(String($0))}
let (N,d,k,c) = (input[0],input[1],input[2],input[3])
var arr = Array(repeating: 0, count: N)
for i in 0..<N {
    arr[i] = Int(readLine()!)!
}
var isUsed = Array(repeating: false, count: d+1) //이미 먹은 초밥인지 체크하는 변수arr

func twoPointer() -> Int {
    var maxVal = 0
    var left = 0
    var count = 0
    var curIsUsed = isUsed
    while left < arr.count {
        count = 0
        curIsUsed = isUsed
        for i in left..<(left + k) where !curIsUsed[arr[i % N]] {
            curIsUsed[arr[i % N]] = true
            count += 1
        }
        if !curIsUsed[c] {count += 1}
        maxVal = max(maxVal,count)
        left += 1
    }
    return maxVal
}

print(twoPointer())
