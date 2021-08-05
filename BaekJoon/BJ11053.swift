//https://www.acmicpc.net/problem/11053

let N = Int(readLine()!)!
let arr = readLine()!.split(separator: " ").compactMap{Int(String($0))}
var counts = Array(repeating: 1, count: N)

func dp() -> Int {
    if N == 1 {
        return 1
    }
    
    for i in 1..<N {
        var count = [1]
        for j in stride(from: i-1, to: -1, by: -1) { //현재 선택한 값부터 전으로
            if arr[i] > arr[j]{
                count.append(counts[j]+1)
            }
        }
        counts[i] = count.max()!
    }
    return counts.max()!
}

print(dp())

