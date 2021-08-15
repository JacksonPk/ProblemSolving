//https://www.acmicpc.net/problem/2178

let nm = readLine()!.split(separator: " ").compactMap{Int(String($0))}
let n = nm[0]
let m = nm[1]
var arr = Array(repeating: Array(repeating: 0, count: m), count: n)
var minDistance = arr
let dR = [-1,1,0,0]
let dC = [0,0,-1,1]
var queue = [[Int]]()
minDistance[0][0] = 1
queue.append([0,0])

for i in 0..<n {
    let input = Array(readLine()!)
    for j in 0..<m {
        arr[i][j] = Int(String(input[j]))!
    }
}

while minDistance[n-1][m-1] == 0 {
    let cur = queue.removeFirst()
    for d in 0..<4 {
        let nR = cur[0] + dR[d]
        let nC = cur[1] + dC[d]
        if (nR >= 0 && nC >= 0 && nR < n && nC < m) && arr[nR][nC] == 1 && minDistance[nR][nC] == 0 {
            queue.append([nR,nC])
            minDistance[nR][nC] += minDistance[cur[0]][cur[1]] + 1
        }
    }
}

print(minDistance[n-1][m-1])
