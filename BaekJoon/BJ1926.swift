//https://www.acmicpc.net/problem/1926
//BFS

let NM = readLine()!.split(separator: " ").compactMap{Int(String($0))}
let n = NM[0]
let m = NM[1]
var arr = Array(repeating: Array(repeating: 0, count: m), count: n)
for i in 0..<n {
    let input = readLine()!.split(separator: " ").compactMap{Int(String($0))}
    for j in 0..<m {
        arr[i][j] = input[j]
    }
}
var isVisited = Array(repeating: Array(repeating: false, count: m), count: n)
var count = 0
var maxSize = 0

//현재 값 기준으로 위,아래,좌,우
let dR = [-1,1,0,0]
let dC = [0,0,-1,1]
func paintSize(row: Int, col: Int) -> Int {
    var queue = [[row,col]]
    var size = 1
    while !queue.isEmpty {
        let q = queue.removeFirst()
        let row = q[0]
        let col = q[1]
        
        //깔끔한 코드
        for i in 0..<4 {
            let nR = row+dR[i]
            let nC = col+dC[i]
            //Check bound, isPaint, visited
            if (nR >= 0 && nR < n && nC >= 0 && nC < m) && (arr[nR][nC] == 1) && (isVisited[nR][nC] == false) {
                isVisited[nR][nC] = true
                queue.append([nR,nC])
                size += 1
            }
        }

        //기존 체크방식
//        if col-1 >= 0 && arr[row][col-1] == 1 && isVisited[row][col-1] == false { //왼쪽
//            isVisited[row][col-1] = true
//            queue.append([row,col-1])
//            size += 1
//        }
//        if col+1 < m && arr[row][col+1] == 1 && isVisited[row][col+1] == false { //오른족
//            isVisited[row][col+1] = true
//            queue.append([row,col+1])
//            size += 1
//        }
//        if row-1 >= 0 && arr[row-1][col] == 1 && isVisited[row-1][col] == false { //위
//            isVisited[row-1][col] = true
//            queue.append([row-1,col])
//            size += 1
//        }
//        if row+1 < n && arr[row+1][col] == 1 && isVisited[row+1][col] == false { //아래
//            isVisited[row+1][col] = true
//            queue.append([row+1,col])
//            size += 1
//        }
    }
//    print("start at row = \(row), col = \(col), size = \(size)")
    return size
}

for i in 0..<arr.count {
    for j in 0..<arr[i].count {
        if arr[i][j] == 1 && isVisited[i][j] == false { //방문하지 않았고 그림이라면
            isVisited[i][j] = true
            let size = paintSize(row: i, col: j)
            maxSize = maxSize < size ? size : maxSize
            count += 1
        }
    }
}

print(count)
print(maxSize)

//testcase
//let n = 6
//let m = 5
//var arr = [[1,1,0,0,1],[1,1,1,1,1],[1,0,0,1,0],[0,0,1,1,1],[1,1,1,1,1],[0,0,1,0,1]]
//var isVisited = [[false, false, false, false, false], [false, false, false, false, false], [false, false, false, false, false], [false, false, false, false, false], [false, false, false, false, false], [false, false, false, false, false]]

//for i in 0..<arr.count {
//    print(arr[i])
//}
//print(isVisited)
