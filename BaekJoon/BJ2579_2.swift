//https://www.acmicpc.net/problem/2579
var inputArr = [Int]()
let N = Int(readLine()!)!
var outputArr = Array(repeating: 0, count: N)
for _ in 0..<N {
    inputArr.append(Int(readLine()!)!)
}

func dp() -> Int {
    if N == 1 {
        return inputArr.last!
    } else if N == 2 {
        return inputArr.reduce(0, {$0+$1})
    }
    outputArr[0] = inputArr[0]
    outputArr[1] = inputArr[0]+inputArr[1]
    outputArr[2] = max(inputArr[0],inputArr[1])+inputArr[2]
    
    for i in 3..<N {
        outputArr[i] = max(outputArr[i-3]+inputArr[i-1], outputArr[i-2]) + inputArr[i]
    }
    return outputArr.last!
}

print(dp())
print(inputArr)
print(outputArr)
