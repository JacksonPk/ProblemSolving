//https://www.acmicpc.net/problem/16988
/*
 조건 (N,M<=20) -> matrixSize = 20*20
 
 BackTracking nCr -> matrixSize(20*20) C 2(pick 2 points) = 79800
 getAllSubBound(DFS) matrixSize = 200 하나씩 다 살펴봐야돼서
 simulation matrixSize = 200 2가 있는 point를 다 살펴봐야돼서
 
 79800 * 200 * 200 = 30억??
 */
let input = readLine()!.split(separator: " ").compactMap{Int(String($0))}
let N = input[0]
let M = input[1]
var matrix = Array(repeating: Array(repeating: 0, count: M), count: N)
var points = [[Int]]() //0을 놓을수 있는 위치(row,col)
var selectedPoints = [[Int]]() //선택한 2개의 포인트위치
var isUsed: [Bool]
var allSubMatrix = [[[Int]]]()
var maxNum = 0
let dR = [-1,1,0,0]
let dC = [0,0,-1,1]

for row in 0..<N {
    let input = readLine()!.split(separator: " ").compactMap{Int(String($0))}
    for col in 0..<M {
        if input[col] != 0 {
            matrix[row][col] = input[col]
        }else {
            points.append([row,col])
        }
    }
}
isUsed = Array(repeating: false, count: points.count)
allSubMatrix = getAllSubBound(matrix: matrix)

func getAllSubBound(matrix: [[Int]]) -> [[[Int]]] {
    var allSubMatrix = [[[Int]]]()
    var isVisited = Array(repeating: Array(repeating: false, count: M), count: N)
    
    func searchSubMatrix(row:Int, col:Int) -> [[Int]] { //DFS 방식으로
        var subMatrix = [[Int]]()
        var queue = [[row,col]]
        var size = 1
        
        while !queue.isEmpty {
            let point = queue.removeLast()
            subMatrix.append(point)
            for d in 0..<4 {
                let nR = point[0] + dR[d]
                let nC = point[1] + dC[d]
                if (nR >= 0 && nC >= 0 && nR < N && nC < M) && !isVisited[nR][nC] && matrix[nR][nC] == 2 {
                    isVisited[nR][nC] = true
                    queue.append([nR,nC])
                    size += 1
                }
            }
        }
        return subMatrix
    }
    
    for r in 0..<N {
        for c in 0..<M where matrix[r][c] == 2 && !isVisited[r][c] {
            isVisited[r][c] = true
            allSubMatrix.append(searchSubMatrix(row: r, col: c))
        }
    }
    return allSubMatrix
}

func simulation(matrix: [[Int]]) -> Int {
    var totalBlockedSize = 0
    var isBlocked = true //2가 찍혀있는 point 기준으로 4방향 중 모두 막혀있는지 체크
    for i in 0..<allSubMatrix.count {
    
        isBlocked = true
        for j in 0..<allSubMatrix[i].count where isBlocked {
            let point = allSubMatrix[i][j]
            let cR = point[0]
            let cC = point[1]
            for d in 0..<4 {
                let nR = cR + dR[d]
                let nC = cC + dC[d]
                if (nR >= 0 && nC >= 0 && nR < N && nC < M) && matrix[nR][nC] == 0 {
                    isBlocked = false
                    break
                }
            }
        }
        totalBlockedSize = isBlocked == true ? (totalBlockedSize+allSubMatrix[i].count) : totalBlockedSize
    }
    return totalBlockedSize
}

func backTracking(idx: Int) {
    if selectedPoints.count == 2 {
        var matrix = matrix
        for i in 0..<2 {
            let point = selectedPoints[i]
            let row = point[0]
            let col = point[1]
            matrix[row][col] = 1
        }
        maxNum = max(maxNum, simulation(matrix: matrix))
        return
    }
    
    for i in idx..<points.count where !isUsed[i] {
        isUsed[i] = true
        selectedPoints.append(points[i])
        backTracking(idx: i+1)
        isUsed[i] = false
        selectedPoints.removeLast()
    }
}

backTracking(idx: 0)
print(maxNum)
