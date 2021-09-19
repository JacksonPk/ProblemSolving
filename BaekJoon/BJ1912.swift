//https://www.acmicpc.net/problem/1912
let N = Int(readLine()!)!
let inArr = readLine()!.split(separator: " ").compactMap{Int(String($0))}
var outArr = Array(repeating: 0, count: N)

func dp() -> Int {
    var maxNum = inArr[0]
    outArr[0] = inArr[0]
    
    for i in 1..<N {
        outArr[i] = max(outArr[i-1]+inArr[i],inArr[i])
        maxNum = max(maxNum,outArr[i])
    }
    
    return maxNum
}

print(dp())
