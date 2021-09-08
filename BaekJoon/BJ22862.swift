//https://www.acmicpc.net/problem/22862
let input = readLine()!.split(separator: " ").compactMap{Int(String($0))}
let (N,K) = (input[0],input[1])
var arr = readLine()!.split(separator: " ").compactMap{Int(String($0))}

func twoPointer() -> Int {
    var left = 0
    var right = 0
    var length = 0
    var maxLength = 0
    var oddArr = [Int]()
    var oddIdx = 0
    
    while right < arr.count {
        if arr[right] % 2 != 0 {
            oddArr.append(right)
        } else {
            length += 1
        }
        if (oddArr.count - oddIdx) > K {
            maxLength = max(length, maxLength)
            let pos = oddArr[oddIdx]
            oddIdx += 1
            length = length - (pos-left)
            left = pos + 1
        }
        right += 1
    }
    return max(maxLength,length)
}

print(twoPointer())
