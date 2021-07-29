//https://www.acmicpc.net/problem/9663
//바킹독 참조
let n = Int(readLine()!)!

//같은 열에 위치한 것과 두개의 대각선이 있는데 우상향, 우하향은 각각 기울기로 접근을 한다.
var isUsedSameCols = Array(repeating: false, count: n)
var isUsedSameIncline = Array(repeating: false, count: 2*n - 1)
var isUsedSameDecline = Array(repeating: false, count: 2*n - 1)

var count = 0
func getTotal(row: Int) {
    
    if row == n { //마지막 행까지 왔다는 것은 겹치는 부분을 다 피한 것이다.
        count += 1
        return
    }
    for i in 0..<n {
        if !(isUsedSameCols[i] || isUsedSameIncline[row+i] || isUsedSameDecline[row-i+n-1]) { //해당 배열 index가 사용되어 있다는 것은 그 전 퀸의 공격을 받는다는 것.
            isUsedSameCols[i] = true
            isUsedSameIncline[row+i] = true
            isUsedSameDecline[row-i+n-1] = true
            
            getTotal(row: row+1)
            
            isUsedSameCols[i] = false
            isUsedSameIncline[row+i] = false
            isUsedSameDecline[row-i+n-1] = false
        }
    }
    
}

getTotal(row: 0)
print(count)
/*
 하단의 코드는 정답은 맞지만 시간초과
 매트릭스를 쓰면 시간초과가 난다. 다른 방법으로 접근을 해야했다.
 
let n = Int(readLine()!)!
var matrix = Array(repeating:  Array(repeating: true, count: n), count: n)


var count = 0
func setQueenPos(row: Int, col: Int, with: Bool) {
    
    for i in 0..<n {
        matrix[row][i] = with
    }
    for i in 0..<n {
        matrix[i][col] = with
    }
    var newRow = row + 1

    var count = 1
    while newRow < n { // && newRow < n && newCol < n {
        if col+count < n {
            matrix[newRow][col+count] = with
        }
        if col-count >= 0 {
            matrix[newRow][col-count] = with
        }
        newRow += 1
        count += 1
    }
}

func getTotal(row: Int, remain: Int) {
    
    let storeMatrix = matrix
    if remain == 0 {
        count += 1
        return
    }
    
    for i in 0..<n {
        if matrix[row][i] {
            setQueenPos(row: row, col: i, with: false)
            getTotal(row: row+1, remain: remain-1)
        }
        matrix = storeMatrix
    }
}

getTotal(row: 0, remain: n)
print(count)
 */
