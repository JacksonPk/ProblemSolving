//https://www.acmicpc.net/problem/2018
let N = Int(readLine()!)!
var count = 0

func twoPointer(sIdx: Int) -> Bool {
    var sIdx = sIdx
    var sum = sIdx
    
    while sum < N {
        sIdx += 1
        sum += sIdx
    }
    return sum == N ? true : false
}

for i in 1...N {
    if twoPointer(sIdx: i) {
        count += 1
    }
}

print(count)
