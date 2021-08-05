//https://www.acmicpc.net/problem/1932

let N = Int(readLine()!)!
var arr = Array(repeating: [Int](), count: N)
for i in 0..<N {
    arr[i] = readLine()!.split(separator: " ").compactMap{Int(String($0))}
}
var total = arr

//좌대각 -> total[i][0] = total[i-1][0] + arr[0]
//우대각 -> total[i][arr[i].count-1] = total[i-1][arr[i].count-1] + [arr[i].count-1]
//가운대는 max(왼쪽파생, 오른쪽파생)
//마지막에서 Max(0 ... N)

func dp() -> Int {
    
    if N == 1 {
        return total[0][0]
    }
    
    for i in 1..<N {
        
        total[i][0] = total[i-1][0] + arr[i][0] //왼쪽 끝
        total[i][total[i].count-1] = total[i-1][total[i-1].count-1] + arr[i][arr[i].count-1] //오른쪽 끝
                
        for j in 1..<total[i].count-1 {
            total[i][j] = max(total[i-1][j-1],total[i-1][j]) + arr[i][j]
        }
    }

    return total[N-1].max()!
}

print(dp())
