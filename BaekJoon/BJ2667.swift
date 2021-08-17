////https://www.acmicpc.net/problem/2667
var N = Int(readLine()!)!
var arr: [[Character]] = Array(repeating: Array(repeating: "0", count: N), count: N)
for i in 0..<N {
    let input = Array(readLine()!)
    for j in 0..<N {
        arr[i][j] = input[j]
    }
}
var isVisited = Array(repeating: Array(repeating: false, count: N), count: N)
let dR = [-1,1,0,0]
let dC = [0,0,-1,1]

var result = [Int]()

for i in 0..<N {
    for j in 0..<N {
        if arr[i][j] == "1" && !isVisited[i][j] {
            var count = 1
            var queue = [[i,j]]
            while !queue.isEmpty { //BFS
                let cur = queue.removeFirst()
                isVisited[i][j] = true
                let row = cur[0]
                let col = cur[1]
                for d in 0..<4 {
                    let nR = row + dR[d]
                    let nC = col + dC[d]
                    if (nR >= 0 && nR < N && nC >= 0 && nC < N) && !isVisited[nR][nC] && arr[nR][nC] == "1" {
                        queue.append([nR,nC])
                        isVisited[nR][nC] = true
                        count += 1
                    }
                }
            }
            result.append(count)
        }
    }
}

print(result.count)
result.sorted().forEach { val  in
    print(val)
}
