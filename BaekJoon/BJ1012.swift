//https://www.acmicpc.net/problem/1012
let dR = [-1,1,0,0]
let dC = [0,0,-1,1]
var rows = 0
var cols = 0

func totalWarmsNeed (matrix: [[Int]]) -> Int {
    var result = 0
    var isVisited = Array(repeating: Array(repeating: false, count: cols), count: rows)
    func bfs(row: Int, col: Int) {
        var queue = [[row,col]]
        while !queue.isEmpty {
            let point = queue.removeFirst()
            isVisited[point[0]][point[1]] = true
            for d in 0..<4 {
                let nR = point[0]+dR[d]
                let nC = point[1]+dC[d]
                if (nR < 0 || nC < 0 || nR >= rows || nC >= cols) || (isVisited[nR][nC] == true) || (matrix[nR][nC] != 1) { continue }
                queue.append([nR,nC])
                isVisited[nR][nC] = true
            }
        }
    }
    
    for i in 0..<rows {
        for j in 0..<cols where matrix[i][j] == 1 && isVisited[i][j] == false {
            bfs(row: i, col: j)
            result += 1
        }
    }
    return result
}
for _ in 0..<Int(readLine()!)! {

    let input = readLine()!.split(separator: " ").compactMap{Int(String($0))}
    rows = input[1]
    cols = input[0]
    var matrix = Array(repeating: Array(repeating: 0, count: cols), count: rows)
    for _ in 0..<input[2] {
        let input = readLine()!.split(separator: " ").compactMap{Int(String($0))}
        matrix[input[1]][input[0]] = 1
    }
    print(totalWarmsNeed(matrix: matrix))
}
