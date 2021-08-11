//https://www.acmicpc.net/problem/7795

func fsort(A: [Int], B: [Int]) -> Int {
    var count = 0
    var start = 0
    
    for i in 0 ..< A.count {
        for j in start..<B.count {
            if A[i] > B[j] {
                count = count + (A.count-i)
                start += 1
            } else {
                break
            }
        }
    }
    return count
}

for _ in 0..<Int(readLine()!)! {
    let _ = readLine()
    let A = readLine()!.split(separator: " ").compactMap{Int(String($0))}.sorted()
    let B = readLine()!.split(separator: " ").compactMap{Int(String($0))}.sorted()
    print(fsort(A: A, B: B))
}

//2
//5 3
//8 1 7 3 1
//3 6 1
//3 4
//2 13 7
//103 11 290 215

//var A = [8, 1, 7, 3, 1]
//var B = [3, 6, 1]
//var A = [2, 13, 7]
//var B = [103, 11, 290, 215]
